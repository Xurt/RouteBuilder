using System.Text.RegularExpressions;
using System.Globalization;
using System.Text;

namespace RouteBuilder;

public sealed class GuideOutput
{
    public string Name = "", Group = "", FileName = "";
    public List<string> Lines = new();      // the guide body (between RegisterGuide([[ and ]]))
    public int Steps, HearthSteps, EarlyOffers, EarlyHandIns, Stops, AsYouGo, CustomSteps, RxpSteps;
    public List<string> StepsNotPlaced = new();      // zone-file steps whose anchor is in no part of this guide
    public int LockSteps;                            // service steps placed from the lock file
    public List<(LockedService Svc, string Key, bool After)> LockServices = new();   // every service step placed, to save in the lock
    public int GateLine = -1;               // index of the "step" line of the level check that leads to the next part
    public List<string> GrindSteps = new();
    public List<(string dest, string tag, string quest)> Carried = new();
    public List<SectionInfo> Sections = new();                              // places to start part-way, in order
    public string OnlyFor = "";                                              // a later part only some characters have quests in: who
    public double EndLevel;                                                  // the predicted level at the end of this part
    public int? NextPartLevel;                                               // the level the next part is planned from
    public Dictionary<int, int> QuestSection = new();                        // quest -> the section its hand-in (or pickup) is in
}

/// <summary>A section of one part of a guide: where it starts in the part's lines, and the guide it becomes when the zone is split.</summary>
public sealed class SectionInfo
{
    public string Label = "", Name = "", Guide = "";
    public int Level, Index, Line;
}

/// <summary>Turns an ordered list of tasks into RXPGuides guide text.</summary>
public sealed class Emitter
{
    public const string Talk = "|Tinterface/worldmap/chatbubble_64grey.blp:20|t";
    static readonly string[] NoPlural = { "Dead", "Forsaken", "Deathguard" };
    static readonly CultureInfo Inv = CultureInfo.InvariantCulture;

    sealed class Unit
    {
        public string Kind = "obj"; public Ent? Ent; public string Guard = ""; public int GuardQuest;
        public List<RouteTask> Tasks = new(); public int Area; public Pt Pos; public double Level;
        public List<Pt> Pts = new(); public bool Mergeable, Hearth; public string? Label; public string HearthTag = "";
        public List<string> PreSteps = new(); public List<(RouteTask t, Cand c)> Early = new();
        public List<(RouteTask t, Cand c)> HandIns = new();   // finished quests whose hand-in is within reach here, ahead of their own step
        public List<RouteTask>? AllTasks;          // the whole stop, when this unit is one half of a split
        public Unit Copy() => (Unit)MemberwiseClone();
    }

    readonly ZoneModel m; readonly RouteResult r; readonly GuideOutput g = new();
    readonly HashSet<(int, string)> guards = new();
    HashSet<int>? trusted;                       // pickups placed by a RestedXP order
    Dictionary<int, int>? sectionOf;             // task -> the section of this part it is in
    readonly HashSet<int> uncertain = new();     // tasks that may be skipped by a player who started at their section
    readonly List<(int Task, int Level, int Hub)> sectionStart = new();

    public Emitter(ZoneModel model, RouteResult route) { m = model; r = route; }

    // ------------------------------------------------------------------ small pieces
    static string Tagged(string line, string lt)
    {
        if (lt.Length == 0) return line;
        int i = line.IndexOf(" --", StringComparison.Ordinal);
        return i < 0 ? line + lt : line[..i] + lt + line[i..];        // a tag after a comment would be stripped with it
    }

    string Goto(int area, Pt p, params object[] extra)
    {
        var a = m.Areas[area]; string s;
        if (a.HasBounds) s = string.Format(Inv, "    .goto {0}/{1},{2:0.00},{3:0.00}", a.UiMap, a.Continent, p.X, p.Y);
        else { var pc = a.ToPercent(p); s = string.Format(Inv, "    .goto {0},{1:0.00},{2:0.00}", a.UiMap, pc.X, pc.Y); }
        return s + string.Concat(extra.Select(e => "," + Convert.ToString(e, Inv)));
    }

    public static string Plural(string nm)
    {
        if (NoPlural.Any(nm.EndsWith) || nm.EndsWith('s')) return nm;
        if (nm.EndsWith('y') && nm.Length > 1 && !"aeiou".Contains(nm[^2])) return nm[..^1] + "ies";
        if (nm.EndsWith('x') || nm.EndsWith("ch") || nm.EndsWith("sh")) return nm + "es";
        return nm + "s";
    }

    static string JoinNames(IEnumerable<string> names, string color)
    {
        var l = names.Select(n => $"|cRXP_{color}_{n}|r").ToList();
        return l.Count <= 1 ? string.Concat(l) : string.Join(", ", l.Take(l.Count - 1)) + " and " + l[^1];
    }

    /// <summary>
    /// A single pin, or a pin plus a loop of waypoints over a spawn patch. The waypoints sit in the middle of the groups
    /// of spawns (one group per stretch of the patch), not on its edges, so the arrow leads through where the mobs are.
    /// A patch small enough to see across gets one pin, at its busiest spot.
    /// </summary>
    List<string> LoopLines(int area, List<Pt> pts, Pt from, int maxPts = 9, bool ordered = false)
    {
        var all = pts;
        pts = Geo.Thin(pts, 35);
        double span = pts.Count > 1 ? Geo.Span(pts) : 0;
        if (!ordered && (pts.Count <= 2 || span < Tuning.LoopSingleSpan)) return new List<string> { Goto(area, Geo.Busiest(all, Tuning.LoopGroupRadius)) };
        if (pts.Count <= 2 || span < 45) return new List<string> { Goto(area, Geo.Medoid(pts)) };
        List<Pt> wp;
        if (ordered) wp = Geo.AlongAxis(pts, from, maxPts);
        else
        {
            int k = Math.Clamp((int)Math.Ceiling(span / Tuning.LoopSpacing), 2, Math.Min(maxPts, Tuning.LoopMaxPoints));
            var groups = Geo.KMeans(all.Distinct().ToList(), k);
            wp = Geo.Tour(groups.Where(g => g.Count > 0).Select(g => Geo.Busiest(g, Tuning.LoopGroupRadius)).Distinct().ToList(), from);
            if (wp.Count < 2) return new List<string> { Goto(area, wp[0]) };
        }
        var lines = new List<string> { "    #loop", Goto(area, wp[0], 0) };
        lines.AddRange(wp.Select(p => Goto(area, p, 40, 0)));
        return lines;
    }

    static string ObjText(Obj o)
    {
        if (o.Text != null) return o.Text;
        var mobs = o.Targets.Where(t => t.Kind == "mob").Select(t => t.Name).ToList();
        switch (o.Kind)
        {
            case "kill":
                if (mobs.Count == 0) return o.Label;
                return "Kill " + JoinNames(mobs.Select(n => o.Count == 1 ? n : Plural(n)), "ENEMY");
            case "loot":
            {
                string loot = o.Loot ?? o.Label; bool one = mobs.Count == 1 && (o.Count == 1 || o.Kills <= 1);
                string who = JoinNames(mobs.Select(n => one ? n : Plural(n)), "ENEMY");
                var objs = o.SrcNames.Where(n => !mobs.Contains(n)).ToList();
                string s = one ? $"Kill {who} and loot |cRXP_LOOT_{loot}|r" : $"Kill {who}. Loot them for |cRXP_LOOT_{loot}|r";
                if (objs.Count > 0) s += $". It can also be picked up from |cRXP_PICK_{objs[0]}|r on the ground";
                return s;
            }
            case "object":
            {
                string src = o.SrcNames.Count > 0 ? o.SrcNames[0] : o.Label;
                if (o.Loot != null && o.Loot != src)
                    return o.Count > 1 ? $"Loot the |cRXP_PICK_{Plural(src)}|r for |cRXP_LOOT_{o.Loot}|r" : $"Open the |cRXP_PICK_{src}|r. Loot it for |cRXP_LOOT_{o.Loot}|r";
                return o.Loot != null ? $"Pick up |cRXP_PICK_{src}|r from the ground" : $"Click the |cRXP_PICK_{src}|r";
            }
            case "buy":
                return $"{Talk}Buy |cRXP_LOOT_{o.Loot}|r from |cRXP_FRIENDLY_{(o.SrcNames.Count > 0 ? o.SrcNames[0] : "the vendor")}|r";
        }
        return o.Label;
    }

    /// <summary>Lines that make a step hide itself when it does not apply to this player.</summary>
    List<string> GuardLines(RouteTask t)
    {
        var o = new List<string>(); var q = t.Q;
        if (q == null) return o;
        if (t.Kind is TaskKind.Accept or TaskKind.ItemAccept)
        {
            if (!q.Conditional) { o.AddRange(SectionGuards(t, o)); return o; }
            foreach (int p in q.NeedAll) o.Add($"    .isQuestTurnedIn {p} --{m.Data.Quests.GetValueOrDefault(p)?.Name ?? "?"}");
            if (q.NeedAny.Count > 0) o.Add($"    .isQuestTurnedIn {string.Join(",", q.NeedAny)} --any of: {string.Join(", ", q.NeedAny.Select(p => m.Data.Quests.GetValueOrDefault(p)?.Name ?? "?"))}");
            if (q.Req > 1) o.Add($"    .xp <{q.Req},1");
        }
        else if (t.Kind == TaskKind.Objective) { if (q.Cond) o.Add($"    .isOnQuest {q.Id}"); }
        else if (t.Kind == TaskKind.TurnIn && (q.Cond || q.Optional || q.Late))
        {
            bool needsComplete = q.Unrouted.Count > 0 || (q.Arrival && q.Objs.Count == 0 && q.Row.HasObjectives);
            o.Add(needsComplete ? $"    .isQuestComplete {q.Id}" : $"    .isOnQuest {q.Id}");
        }
        o.AddRange(SectionGuards(t, o));
        return o;
    }

    /// <summary>
    /// A player can start the guide at a later section (by level), skipping what comes before it. A step that needs a quest
    /// from a section that may have been skipped hides itself unless that quest was done: a pickup whose prerequisite is
    /// handed in earlier gets .isQuestTurnedIn, an objective or hand-in of a quest picked up earlier gets .isOnQuest.
    /// </summary>
    IEnumerable<string> SectionGuards(RouteTask t, List<string> have)
    {
        var q = t.Q;
        if (q == null || sectionOf == null || !sectionOf.TryGetValue(t.Id, out int sec) || sec == 0 && m.Visit.Number == 1) yield break;
        // done before this section, or by a step that may itself be skipped (a chain reaching back into a skipped section)
        bool Earlier(int quest) => m.Visit.Done.Contains(quest) || m.Find(TaskKind.TurnIn, quest) is { } pt && sectionOf.TryGetValue(pt.Id, out int ps) && (ps < sec || uncertain.Contains(pt.Id));
        bool Has(string s) => have.Any(l => l.StartsWith(s, StringComparison.Ordinal));
        string QName(int p) => m.Data.Quests.GetValueOrDefault(p)?.Name ?? "?";
        if (t.Kind is TaskKind.Accept or TaskKind.ItemAccept)
        {
            foreach (int p in AllPre(q).OrderBy(x => x))
                if (Earlier(p) && !Has($"    .isQuestTurnedIn {p} ")) yield return $"    .isQuestTurnedIn {p} --{QName(p)}";
            var any = AnyPre(q).OrderBy(x => x).ToList();
            // one of several: only when none of them is surely done in this section or later (then it is done before this anyway)
            bool notLater = any.All(p => m.Find(TaskKind.TurnIn, p) is not { } pt || !sectionOf.TryGetValue(pt.Id, out int s2) || s2 < sec || uncertain.Contains(pt.Id));
            if (any.Count > 0 && notLater && any.Any(Earlier) && !Has($"    .isQuestTurnedIn {string.Join(",", any)} "))
                yield return $"    .isQuestTurnedIn {string.Join(",", any)} --any of: {string.Join(", ", any.Select(QName))}";
        }
        else if (t.Kind is TaskKind.Objective or TaskKind.TurnIn)
        {
            var a = m.Find(TaskKind.Accept, q.Id) ?? m.Find(TaskKind.ItemAccept, q.Id);
            if (a != null && sectionOf.TryGetValue(a.Id, out int sa) && (sa < sec || uncertain.Contains(a.Id)) && !Has($"    .isOnQuest {q.Id}") && !Has($"    .isQuestComplete {q.Id}"))
                yield return $"    .isOnQuest {q.Id}";
        }
    }

    // a quest's prerequisites including those done on an earlier visit (a player can start a later part's guide directly)
    HashSet<int> AllPre(Quest q)
    {
        var s = q.PreAll.ToHashSet();
        foreach (int p in q.Row.PreGroup) if (p != q.Id && !q.Row.Exclusive.Contains(p) && m.Visit.Done.Contains(p)) s.Add(p);
        if (q.Fix.Pre != null) foreach (int p in q.Fix.Pre) if (m.Visit.Done.Contains(p)) s.Add(p);
        return s;
    }
    HashSet<int> AnyPre(Quest q) =>
        q.PreAny.Count > 0 ? q.PreAny : q.Row.PreSingle.Where(p => p != q.Id && !q.Row.Exclusive.Contains(p)).ToHashSet() is var a && a.Overlaps(m.Visit.Done) ? a : new HashSet<int>();

    /// <summary>
    /// An early offer is a bare self-skipping step, so it is only made where a player who started the guide at this
    /// section is sure to have the quest's prerequisites.
    /// </summary>
    bool OfferSafe(RouteTask t, Unit u)
    {
        int sec = (u.AllTasks ?? u.Tasks).Select(x => sectionOf!.GetValueOrDefault(x.Id, 0)).DefaultIfEmpty(0).Max();
        if (t.Q == null || sec == 0 && m.Visit.Number == 1) return true;
        bool Gone(int p) => m.Visit.Done.Contains(p) || m.Find(TaskKind.TurnIn, p) is { } pt && sectionOf!.TryGetValue(pt.Id, out int ps) && (ps < sec || uncertain.Contains(pt.Id));
        if (AllPre(t.Q).Any(Gone)) return false;
        var any = AnyPre(t.Q).Where(p => m.Visit.Done.Contains(p) || m.Find(TaskKind.TurnIn, p) != null).ToList();
        return !(any.Count > 0 && any.All(Gone));
    }

    /// <summary>
    /// Splits this part of the route into sections, each starting where the route arrives at a new main quest hub (one with
    /// several pickups) a few levels further on. A player can start the guide at any of them (see FileText).
    /// </summary>
    void ComputeSections()
    {
        sectionOf = new Dictionary<int, int>();
        bool on = m.Cfg.Sections ?? true;
        var seq = r.Seq;
        int Hub(int t)
        {
            var tk = m.Tasks[t];
            return tk.Ent == null || tk.Kind is not (TaskKind.Accept or TaskKind.TurnIn) ? -1 : m.HubOf.GetValueOrDefault(tk.Cands[r.Choice[t]], -1);
        }
        var pickups = new Dictionary<int, int>();
        foreach (int t in seq)
            if (m.Tasks[t].Kind == TaskKind.Accept && !m.Tasks[t].Cond && Hub(t) is var h && h >= 0) pickups[h] = pickups.GetValueOrDefault(h) + 1;
        bool Main(int h) => h >= 0 && pickups.GetValueOrDefault(h) >= Tuning.SectionHubPickups;
        int sec = 0, startPos = 0, cur = -1; double startLvl = Math.Floor(m.StartLevel);
        sectionStart.Add((seq.Count > 0 ? seq[0] : -1, (int)startLvl, -1));
        for (int pos = 0; pos < seq.Count; pos++)
        {
            int t = seq[pos], h = Hub(t);
            if (on && Main(h) && !m.Tasks[t].Cond && m.Tasks[t].Tag.Length == 0)
            {
                if (cur < 0) { cur = h; sectionStart[0] = (sectionStart[0].Task, sectionStart[0].Level, h); }
                else if (h != cur)
                {
                    double lv = Math.Floor(r.Level[t]);
                    if (pos - startPos >= Tuning.SectionMinSteps && lv >= startLvl + Tuning.SectionLevelStep)
                    {
                        sec++; startPos = pos; startLvl = lv;
                        sectionStart.Add((t, (int)lv, h));
                    }
                    cur = h;
                }
            }
            sectionOf[t] = sec;
        }
        // a last section that is only a short stretch (a few steps, or less than a level) joins the one before it
        double end = r.Views.Count > 0 ? r.Views[0].EndLevel : m.StartLevel;
        while (sec > 0 && (sectionOf.Count(kv => kv.Value == sec) < Tuning.SectionMinSteps || end - sectionStart[sec].Level < 1))
        {
            foreach (var t in sectionOf.Where(kv => kv.Value == sec).Select(kv => kv.Key).ToList()) sectionOf[t] = sec - 1;
            sectionStart.RemoveAt(sec); sec--;
        }
        // which steps a player who started at a step's own section may not be able to do, in route order so a chain carries through
        foreach (int t in seq)
        {
            var tk = m.Tasks[t]; int st = sectionOf[t]; if (tk.Q == null || st == 0 && m.Visit.Number == 1) continue;
            bool Shaky(int other) => sectionOf.TryGetValue(other, out int so) && (so < st || uncertain.Contains(other));
            if (tk.Kind is TaskKind.Accept or TaskKind.ItemAccept)
            {
                bool Gone(int p) => m.Visit.Done.Contains(p) || m.Find(TaskKind.TurnIn, p) is { } pt && Shaky(pt.Id);
                bool shaky = AllPre(tk.Q).Any(Gone);
                var any = AnyPre(tk.Q).Where(p => m.Visit.Done.Contains(p) || m.Find(TaskKind.TurnIn, p) != null).ToList();
                if (any.Count > 0 && any.All(Gone)) shaky = true;
                if (shaky) uncertain.Add(t);
            }
            else if ((m.Find(TaskKind.Accept, tk.Q.Id) ?? m.Find(TaskKind.ItemAccept, tk.Q.Id)) is { } a && Shaky(a.Id)) uncertain.Add(t);
        }
    }

    /// <summary>A section's name: the zone file's name for the town there, or after its busiest quest giver.</summary>
    string SectionName(int hub)
    {
        if (hub < 0) return m.Visit.Number > 1 ? $"part {m.Visit.Number}" : "start";
        var here = r.Seq.Select(t => m.Tasks[t]).Where(t => t.Ent != null && t.Kind is TaskKind.Accept or TaskKind.TurnIn && m.HubOf.GetValueOrDefault(t.Cands[r.Choice[t.Id]], -1) == hub).ToList();
        if (here.Count == 0) return m.Main.Name;
        var spots = here.Select(t => t.Cands[r.Choice[t.Id]]).ToList();
        int area = spots[0].Area; var mid = new Pt(spots.Average(c => c.Pos.X), spots.Average(c => c.Pos.Y));
        foreach (var (name, spot) in m.Cfg.Hubs)
        {
            var (a, p) = m.World(spot);
            if (a == area && p.To(mid) <= Tuning.TownRadius * 1.5) return name;
        }
        var giver = here.Where(t => t.Kind == TaskKind.Accept).GroupBy(t => t.Ent!.Name).OrderByDescending(g => g.Count()).FirstOrDefault()?.Key ?? here[0].Ent!.Name;
        return "around " + giver;
    }

    // ------------------------------------------------------------------ stops
    List<Unit> BuildUnits()
    {
        var units = new List<Unit>(); Unit? cur = null;
        foreach (int id in r.Seq)
        {
            var t = m.Tasks[id]; var c = t.Cands[r.Choice[id]]; int before = units.Count;
            string guard = string.Join("\n", GuardLines(t)); int gq = guard.Length > 0 ? t.Q!.Id : 0;
            if (t.Ent != null && t.Kind != TaskKind.Objective)
            {
                if (cur == null || cur.Kind != "ent" || cur.Ent != t.Ent || cur.Guard != guard || cur.GuardQuest != gq)
                    units.Add(cur = new Unit { Kind = "ent", Ent = t.Ent, Guard = guard, GuardQuest = gq, Area = c.Area, Pos = c.Pos, Level = r.Level[id] });
                cur.Tasks.Add(t);
            }
            else if (t.Kind == TaskKind.ItemAccept)
            {
                units.Add(cur = new Unit { Kind = "item", Guard = guard, GuardQuest = gq, Area = c.Area, Pos = c.Pos, Level = r.Level[id], Pts = c.Pts.ToList() });
                cur.Tasks.Add(t);
            }
            else
            {
                var o = t.Obj!; bool mergeable = o.Kind is "kill" or "loot" or "object" or "use" && !o.Seq && !o.Patrol && guard.Length == 0;
                if (cur != null && cur.Kind == "obj" && cur.Mergeable && mergeable && cur.Area == c.Area &&
                    (cur.Pos.To(c.Pos) <= Tuning.MergeRadius || Overlapping(cur.Pts, c.Pts) && Geo.Span(cur.Pts.Concat(c.Pts).ToList()) <= 2 * Tuning.ClusterSpan))
                { cur.Tasks.Add(t); cur.Pts.AddRange(Spread(t, c).Where(p => !cur.Pts.Contains(p)).ToList()); }
                else
                {
                    units.Add(cur = new Unit { Kind = "obj", Mergeable = mergeable, Guard = guard, GuardQuest = gq, Area = c.Area, Pos = c.Pos, Level = r.Level[id], Pts = Spread(t, c) });
                    cur.Tasks.Add(t);
                }
            }
            if (r.Hearth[id] && units.Count > before) { cur!.Hearth = true; cur.HearthTag = t.Tag; }
        }
        return units;
    }

    /// <summary>Share of the points in <paramref name="pts"/> that lie inside the area around <paramref name="area"/>.</summary>
    static double Inside(List<Pt> pts, List<Pt> area)
    {
        if (pts.Count == 0 || area.Count == 0) return 0;
        double r = Tuning.OverlapRadius; int hit = 0;
        foreach (var p in pts) if (area.Any(a => a.To(p) <= r)) hit++;
        return hit / (double)pts.Count;
    }

    /// <summary>
    /// The places a step's loop covers: the patch the plan chose, widened with the objective's other spawn points
    /// (nearest first) when that patch alone holds fewer than the objective needs, as with five Lazy Peons that each
    /// sleep at a different spot. Kills respawn, so those only widen a little; people and objects you use once widen further.
    /// </summary>
    static List<Pt> Spread(RouteTask t, Cand c)
    {
        var pts = c.Pts.ToList(); var o = t.Obj;
        if (o == null || o.Patrol || o.Seq) return pts;
        bool once = o.Kind is "talk" or "object" or "use";
        int need = once ? (int)Math.Ceiling(Math.Max(o.Count, 1) * 1.5) : (int)Math.Ceiling(o.Kills);
        if (need <= 1 || pts.Count >= need) return pts;
        double range = once ? Tuning.SpreadRange : Tuning.SpreadRange / 3;
        var seen = pts.ToHashSet();
        foreach (var p in t.Cands.Where(x => x != c && x.Area == c.Area).SelectMany(x => x.Pts).Where(p => !seen.Contains(p))
                              .Select(p => (p, d: Math.Min(p.To(c.Pos), pts.Min(q => q.To(p))))).Where(x => x.d <= range).OrderBy(x => x.d).Select(x => x.p))
        {
            pts.Add(p);
            if (pts.Count >= need) break;
        }
        return pts;
    }

    static bool Overlapping(List<Pt> a, List<Pt> b) => Inside(a, b) >= Tuning.OverlapShare || Inside(b, a) >= Tuning.OverlapShare;

    static string UnitTag(Unit u)
    {
        var tags = u.Tasks.Select(t => t.Tag).Distinct().ToList();
        return tags.Count == 1 ? tags[0] : "";
    }

    static string Step(string tag) => tag.Length > 0 ? "step << " + tag : "step";

    List<string> Render(Unit u, Pt from)
    {
        var o = new List<string>(); string tag = UnitTag(u);
        string LineTag(RouteTask t) => t.Tag.Length > 0 && tag.Length == 0 ? " << " + t.Tag : "";

        // an accept that the plan reaches only just in time gets a "be this level" step in front of it
        // (not one kept where a RestedXP order puts it: RestedXP's timing is played in game, and its own grind steps come with it)
        trusted ??= m.Opt.Lock is { RestedXpLevels: true } lk ? RouteLock.Keys(m).Select((k, i) => (k, i)).Where(x => lk.AllKeys.Contains(x.k)).Select(x => x.i).ToHashSet() : new HashSet<int>();
        var need = new List<RouteTask>();
        if (u.Kind == "ent" && u.Guard.Length == 0)
            foreach (var t in u.Tasks)
            {
                if (t.Kind != TaskKind.Accept || t.Q!.Req <= 1 || trusted.Contains(t.Id)) continue;
                var all = u.AllTasks ?? u.Tasks;
                double xp = r.XpBefore[t.Id] + all.Skip(all.IndexOf(t) + 1).Where(x => x.Kind == TaskKind.TurnIn && (x.Elig & t.Elig) == t.Elig).Sum(x => x.Xp);
                if (Game.FracLevel(xp) < t.Q.Req + 0.6 && guards.Add((t.Q.Req, t.Tag))) need.Add(t);
            }
        var pickedUpHere = u.Tasks.Where(t => t.Kind == TaskKind.Accept).Select(t => t.Q!.Id).ToHashSet();
        var before = u.Tasks.Where(t => t.Kind != TaskKind.Accept && !(t.Kind == TaskKind.TurnIn && pickedUpHere.Contains(t.Q!.Id))).ToList();
        if (need.Count > 0 && before.Any(t => t.Kind == TaskKind.TurnIn))
        {
            // hand in what was brought here first, then check the level, then pick up (and anything picked up and handed in on the spot)
            var a = u.Copy(); a.Tasks = before;
            var b = u.Copy(); b.Tasks = u.Tasks.Except(before).ToList(); b.PreSteps = new(); b.Label = null; b.AllTasks = u.Tasks;
            foreach (var t in need) guards.Remove((t.Q!.Req, t.Tag));
            o.AddRange(Render(a, from)); o.AddRange(Render(b, from));
            return o;
        }
        foreach (var t in need)
        {
            o.Add(Step(t.Tag)); o.Add($"    .xp {t.Q!.Req} >>Grind to level {t.Q.Req} ({t.Q.Name} needs it)");
            g.GrindSteps.Add($"level {t.Q.Req} for {t.Q.Name}{(t.Tag.Length > 0 ? " (" + t.Tag + ")" : "")}");
        }
        o.AddRange(u.PreSteps);
        o.Add(Step(tag));
        if (u.Label != null) o.Add("    #label " + u.Label);

        if (u.Kind == "obj")
        {
            var o0 = u.Tasks[0].Obj!;
            o.AddRange(o0.Patrol && o0.Loop.Count > 0 ? LoopLines(u.Area, o0.Loop, from, 10, true) : LoopLines(u.Area, u.Pts, from));
            var texts = new List<(string tx, string lt)>(); var cmds = new List<string>(); var marks = new List<string>();
            foreach (var t in u.Tasks)
            {
                var ob = t.Obj!; string lt = LineTag(t); string tx = ObjText(ob);
                if (tx.Length > 0 && texts.All(x => x.tx != tx)) texts.Add((tx, lt));
                if (ob.Command != null) cmds.Add(Tagged("    " + ob.Command, lt));
                else if (ob.Index != null) cmds.Add(Tagged($"    .complete {t.Q!.Id},{ob.Index} --{ob.Label}", lt));
                foreach (var extra in ob.Extra) cmds.Add(Tagged("    " + extra, lt));
                foreach (var (k, nm) in ob.Targets)
                {
                    string line = $"    .{k} {nm}"; int at = marks.FindIndex(x => x.Split(" <<")[0] == line);
                    if (at < 0) marks.Add(line + lt);
                    else if (lt.Length == 0) marks[at] = line;         // needed by everyone after all
                }
                if (t.Q!.Fix.Note is { } note && texts.All(x => x.tx != note)) texts.Add((note, lt));
            }
            o.AddRange(texts.Select(x => "    >>" + x.tx + x.lt)); o.AddRange(cmds); o.AddRange(marks);
            if (u.Guard.Length > 0) o.AddRange(u.Guard.Split('\n'));
            return o;
        }
        if (u.Kind == "item")
        {
            var t = u.Tasks[0]; var si = t.Q!.StartItem!;
            o.AddRange(LoopLines(u.Area, u.Pts, from));
            o.Add("    >>" + si.Text);
            o.Add($"    .collect {si.Item},1,{t.Q.Id} --{m.Data.ItemName(si.Item)} (1)");
            o.Add($"    .accept {t.Q.Id} >>Accept {t.Q.Name}");
            o.Add($"    .use {si.Item}");
            if (si.Mob != null) o.Add("    .mob " + si.Mob);
            if (u.Guard.Length > 0) o.AddRange(u.Guard.Split('\n'));
            return o;
        }

        // a quest giver or hand-in target
        var e = u.Ent!;
        if (e.Patrol && e.Loop.Count > 0) o.AddRange(LoopLines(u.Area, e.Loop, from, 10, true));
        else o.Add(Goto(u.Area, u.Pos));
        o.Add(e.Kind == EntKind.Npc
            ? $"    >>{Talk}Talk to |cRXP_FRIENDLY_{e.Name}|r" + (e.Patrol ? ". |cRXP_WARN_This NPC walks a patrol route|r" : "")
            : $"    >>Click the |cRXP_PICK_{e.Name}|r");
        var turnins = u.Tasks.Where(t => t.Kind == TaskKind.TurnIn).ToList(); var accepts = u.Tasks.Where(t => t.Kind == TaskKind.Accept).ToList();
        var pre = new List<string>(); var body = new List<string>(); var post = new List<string>();
        foreach (var t in turnins)
        {
            var fx = t.Q!.Fix; string lt = LineTag(t);
            if (fx.TurninText != null) o.Add("    >>" + fx.TurninText + lt);
            if (t.Q.DataGap) o.Add($"    >>|cRXP_WARN_The database has no objectives for {t.Q.Name}. Skip this step if the quest is not finished|r" + lt);
            foreach (var l in fx.TurninPreLines) pre.Add(Tagged("    " + l, lt));
            foreach (var c in fx.TurninComplete) pre.Add(Tagged($"    .complete {t.Q.Id},{c.Index} --{c.Label}", lt));
            foreach (var l in fx.TurninExtraLines) post.Add(Tagged("    " + l, lt));
        }
        foreach (var t in accepts)
            if (t.Q!.Fix.AcceptText != null) o.Add("    >>" + t.Q.Fix.AcceptText + LineTag(t));
        // hand-ins first, except that a quest picked up at this same stop keeps its pickup ahead of its hand-in
        var here = accepts.Select(t => t.Q!.Id).ToHashSet();
        var ordered = turnins.Where(t => !here.Contains(t.Q!.Id)).Concat(u.Tasks.Where(t => t.Kind == TaskKind.Accept || t.Kind == TaskKind.TurnIn && here.Contains(t.Q!.Id)));
        foreach (var t in ordered)
        {
            string lt = LineTag(t);
            if (t.Kind == TaskKind.TurnIn) body.Add($"    .turnin {t.Q!.Id} >>Turn in {t.Q.Name}{lt}");
            else body.Add($"    .accept {t.Q!.Id}{(t.Q.Fix.AcceptFlags is { } f ? "," + f : "")} >>Accept {t.Q.Name}{lt}");
        }
        foreach (var t in u.Tasks.Where(t => t.Kind == TaskKind.Home)) post.Add($"    .home >>Set your Hearthstone to {m.BindName}");
        o.AddRange(pre); o.AddRange(body);
        if (e.Kind == EntKind.Npc) o.Add($"    .{(e.Patrol ? "unitscan" : "target")} {e.Name}");
        o.AddRange(post);
        if (u.Guard.Length > 0) o.AddRange(u.Guard.Split('\n'));
        return o;
    }

    /// <summary>
    /// One visit to a town should talk to each NPC once. Within a run of quest-giver stops close together, a later
    /// stop at an NPC already visited on this run is folded into the earlier one when nothing it needs comes in
    /// between and you are high enough by then; failing that, the earlier stop is folded into the later one when
    /// nothing in between needs it.
    /// </summary>
    void Consolidate(List<Unit> units, Func<int, bool> sameVisit)
    {
        double XpOf(IEnumerable<RouteTask> ts) => ts.Where(t => t.Kind == TaskKind.TurnIn).Sum(t => t.Xp);
        bool Depends(RouteTask t, HashSet<int> on) => t.Pre.Overlaps(on) || (t.PreAny.Count > 0 && t.PreAny.All(on.Contains));
        for (int i = 0; i < units.Count; i++)
        {
            if (units[i].Kind != "ent") continue;
            int j = i + 1;
            while (j < units.Count && sameVisit(j)) j++;
            for (int a = i; a < j; a++)
                for (int b = a + 1; b < j; b++)
                {
                    var A = units[a]; var B = units[b];
                    if (B.Ent != A.Ent || B.Guard != A.Guard || B.AllTasks != null || A.AllTasks != null) continue;
                    var between = units.Skip(a + 1).Take(b - a - 1).SelectMany(u => u.Tasks).ToList();
                    var betweenIds = between.Select(t => t.Id).ToHashSet();
                    var last = A.Tasks[^1]; double xpAfterA = r.XpBefore[last.Id] + XpOf(A.Tasks);
                    // pull B's steps forward into A
                    bool pull = B.Tasks.All(t => t.Tight < 0 && !Depends(t, betweenIds)
                                              && (t.Kind != TaskKind.Accept || (t.MinLevel <= 1 || Game.FracLevel(xpAfterA + XpOf(B.Tasks.TakeWhile(x => x != t))) >= t.MinLevel)
                                                  && !(t.Q!.Level > Game.FracLevel(xpAfterA) + Tuning.PickupAhead)));
                    if (pull)
                    {
                        double x0 = xpAfterA;
                        foreach (var t in B.Tasks) { r.XpBefore[t.Id] = x0; r.Level[t.Id] = Game.FracLevel(x0); if (t.Kind == TaskKind.TurnIn) x0 += t.Xp; }
                        A.Tasks.AddRange(B.Tasks); A.Hearth |= B.Hearth;
                        units.RemoveAt(b); j--; b--;
                        continue;
                    }
                    // or push A's steps back into B
                    var aIds = A.Tasks.Select(t => t.Id).ToHashSet(); double aXp = XpOf(A.Tasks);
                    bool push = !A.Hearth && A.Label == null && A.PreSteps.Count == 0 && A.Tasks.All(t => t.Tight < 0 && t.Kind != TaskKind.Home)
                             && between.All(t => !Depends(t, aIds) && t.Tight < 0
                                                && (t.Kind != TaskKind.Accept || t.MinLevel <= 1 || Game.FracLevel(r.XpBefore[t.Id] - aXp) >= t.MinLevel));
                    if (push)
                    {
                        foreach (var t in between) { r.XpBefore[t.Id] -= aXp; r.Level[t.Id] = Game.FracLevel(r.XpBefore[t.Id]); }
                        double x0 = r.XpBefore[B.Tasks[0].Id] - aXp;
                        foreach (var t in A.Tasks) { r.XpBefore[t.Id] = x0; r.Level[t.Id] = Game.FracLevel(x0); if (t.Kind == TaskKind.TurnIn) x0 += t.Xp; }
                        B.Tasks.InsertRange(0, A.Tasks);
                        units.RemoveAt(a); j--; a--;
                        break;
                    }
                }
            i = j - 1;
        }
    }

    /// <summary>
    /// "As you go": an objective whose mobs or objects are all around stops planned before it is shown alongside
    /// those stops (#completewith the last of them), so it gets done on the way. Its own step stays as the fallback
    /// for whatever is left, and skips itself when nothing is.
    /// </summary>
    void AsYouGo(List<Unit> units)
    {
        if (Tuning.MaxAsYouGo <= 0) return;
        var picked = new Dictionary<int, int>();
        for (int i = 0; i < units.Count; i++)
            foreach (var t in units[i].Tasks)
                if (t.Kind is TaskKind.Accept or TaskKind.ItemAccept) picked.TryAdd(t.Q!.Id, i);

        var found = new Dictionary<(int first, int last, string tag, int unit), List<RouteTask>>();
        for (int ui = 0; ui < units.Count; ui++)
        {
            var u = units[ui];
            if (u.Kind != "obj" || u.Guard.Length > 0) continue;
            foreach (var t in u.Tasks)
            {
                var ob = t.Obj!;
                if (ob.Kind is not ("kill" or "loot" or "object") || ob.Seq || ob.Patrol || ob.Index == null && ob.Command == null) continue;
                if (!picked.TryGetValue(t.Q!.Id, out int from) || from >= ui) continue;
                var area = t.Cands.Where(c => c.Area == u.Area).SelectMany(c => c.Pts).ToList();
                // the level the plan waits for before sending you there; earlier than that it is not offered on the way
                var cd = t.Cands[r.Choice[t.Id]];
                double need = ob.Kind is "kill" or "loot"
                    ? Math.Max(Math.Max(1, ob.MinLevel), Math.Floor(cd.MobLevel ?? ob.MobLevel ?? t.Q.Level) - Tuning.MobMargin)
                    : Math.Max(t.MinLevel, ob.MinLevel);
                bool In(Unit v) => v.Area == u.Area && Inside(v.Kind == "ent" ? new List<Pt> { v.Pos } : v.Pts, area) >= Tuning.OverlapShare;
                // stretches of consecutive stops inside the area, between the pickup and the objective's own step
                for (int j = from + 1; j < ui; j++)
                {
                    if (!In(units[j]) || units[j].Level < need) continue;
                    int first = j;
                    bool Ok(int k) => k < ui && In(units[k]) && units[k].Level >= need;
                    while (Ok(j + 1) || Ok(j + 2) && units[j + 1].Area == u.Area) j += Ok(j + 1) ? 1 : 2;   // one stop just outside does not end the stretch
                    int last = j;
                    // the closing step must be one every character who sees this one also sees
                    while (last >= first && UnitTag(units[last]) is var lt && lt.Length > 0 && lt != t.Tag) last--;
                    if (last < first) continue;
                    var key = (first, last, t.Tag, ui);
                    if (!found.TryGetValue(key, out var list)) found[key] = list = new List<RouteTask>();
                    list.Add(t);
                }
            }
        }

        // longest stretches first, keeping the number on screen at any one time small
        var onScreen = new int[units.Count];
        foreach (var ((first, last, tag, ui), tasks) in found.OrderByDescending(kv => kv.Key.last - kv.Key.first).ThenBy(kv => kv.Key.first))
        {
            if (Enumerable.Range(first, last - first + 1).Any(k => onScreen[k] >= Tuning.MaxAsYouGo)) continue;
            for (int k = first; k <= last; k++) onScreen[k]++;
            string lab = units[last].Label ??= $"Along{last}";
            var lines = new List<string> { Step(tag), "    #completewith " + lab };
            var texts = tasks.Select(t => ObjText(t.Obj!)).Where(x => x.Length > 0).Distinct().ToList();
            lines.Add("    >>As you go: " + string.Join(". ", texts) + ". |cRXP_WARN_Anything left is finished later|r");
            foreach (var t in tasks)
                lines.Add(t.Obj!.Command != null ? "    " + t.Obj.Command : $"    .complete {t.Q!.Id},{t.Obj.Index} --{t.Obj.Label}");
            foreach (var line in tasks.SelectMany(t => t.Obj!.Targets).Distinct().Select(x => $"    .{x.Kind} {x.Name}")) lines.Add(line);
            units[first].PreSteps.AddRange(lines);
            g.AsYouGo += tasks.Count;
        }
    }

    List<string> TravelStep(int from, int to, string tag, string guard)
    {
        var o = new List<string> { Step(tag), "    #completewith next" };
        int linked = to != 0 ? to : from; var fix = m.AreaFix[linked];
        if (m.Travel.HasGate(linked) && (from == 0 || to == 0)) o.Add(Goto(0, m.Travel.Gate(linked)));
        string text = to != 0 ? fix?.EnterText ?? $"Travel to {m.Areas[to].Name}" : fix?.LeaveText ?? $"Leave {m.Areas[from].Name} for {m.Main.Name}";
        o.Add($"    .zone {m.Areas[to].UiMap} >>{text}");
        o.Add($"    .zoneskip {m.Areas[to].UiMap}");
        if (guard.Length > 0) o.AddRange(guard.Split('\n'));
        return o;
    }

    // ------------------------------------------------------------------ the whole guide
    /// <param name="nextVisitLevel">When the zone continues in a later visit: the level that one is planned from.</param>
    public GuideOutput Write(int? nextVisitLevel)
    {
        ComputeSections();
        var units = BuildUnits();
        bool Far(int i) => i > 0 && (units[i].Area != units[i - 1].Area || units[i].Pos.To(units[i - 1].Pos) > 150);
        // quest-giver stops next to each other, or in the same hub, make one visit to a town
        int HubAt(int i) => units[i].Tasks.Select(t => m.HubOf.GetValueOrDefault(t.Cands[r.Choice[t.Id]], -1)).FirstOrDefault(h => h >= 0, -1);
        bool SameVisit(int i) => i > 0 && units[i].Kind == "ent" && units[i - 1].Kind == "ent" && !units[i].Hearth &&
                                 (units[i].Area == units[i - 1].Area && units[i].Pos.To(units[i - 1].Pos) <= Tuning.TownRadius || HubAt(i) >= 0 && HubAt(i) == HubAt(i - 1));
        Consolidate(units, SameVisit);
        g.Stops = units.Count;
        var visitOf = new int[units.Count];
        for (int i = 1; i < units.Count; i++) visitOf[i] = visitOf[i - 1] + (SameVisit(i) ? 0 : 1);

        // early offers: a pickup planned for later only because the predicted level is a shade short is offered
        // once per visit to its hub as a self-skipping step, in case the player is ahead of the prediction
        var planned = new Dictionary<int, int>();
        for (int i = 0; i < units.Count; i++) foreach (var t in units[i].Tasks) planned[t.Id] = i;
        var done = new HashSet<int>(); double xp = m.StartXp; int visit = 0;
        var offers = new Dictionary<(int task, int visit), (int unit, RouteTask t, Cand c)>();
        for (int i = 0; i < units.Count; i++)
        {
            var u = units[i];
            visit = visitOf[i];
            foreach (var t in u.Tasks) { done.Add(t.Id); if (t.Elig == m.AllElig) xp += t.Xp; }
            if (u.Kind != "ent") continue;
            double lvl = Game.FracLevel(xp);
            foreach (var t in m.Tasks)
            {
                if (done.Contains(t.Id) || t.Kind != TaskKind.Accept || t.Ent == null || t.Cond || t.Q!.Tight || planned.GetValueOrDefault(t.Id) <= i + 1) continue;
                if (planned.TryGetValue(t.Id, out int pu) && visitOf[pu] == visitOf[i]) continue;      // picked up later on this same visit anyway
                if (t.Pre.Any(p => !done.Contains(p) && !m.Tasks[p].Deferred) || (t.PreAny.Count > 0 && !t.PreAny.Any(done.Contains))) continue;
                if (!OfferSafe(t, units[i])) continue;
                if (t.MinLevel <= 1 || !(t.MinLevel - 0.5 <= lvl && lvl < t.MinLevel + Tuning.Safety)) continue;
                if (t.Q.Level > lvl + Tuning.PickupAhead) continue;                  // not offered far ahead of its level either
                var near = t.Cands.FirstOrDefault(c => c.Area == u.Area && c.Pos.To(u.Pos) <= Tuning.HubRadius);
                if (near != null && !t.Ent.Patrol) offers[(t.Id, visit)] = (i, t, near);     // the last stop of the visit wins
            }
        }
        foreach (var (i, t, c) in offers.Values.OrderBy(v => v.unit).ThenBy(v => v.t.Id)) { units[i].Early.Add((t, c)); g.EarlyOffers++; }

        // riders: quests started by a random drop, shown alongside the stops that kill the right mobs
        foreach (var q in m.Quests.Values)
        {
            if (q.StartItem is not { Passive: true } si) continue;
            var hit = Enumerable.Range(0, units.Count).Where(i => units[i].Kind == "obj" && units[i].Tasks.Any(t => si.Anchors.Contains(t.Q!.Id))).ToList();
            var runs = new List<(int first, int last)>();
            foreach (int i in hit)
                if (runs.Count > 0 && i == runs[^1].last + 1) runs[^1] = (runs[^1].first, i); else runs.Add((i, i));
            for (int k = 0; k < runs.Count; k++)
            {
                var (first, last) = runs[k];
                string lab = units[last].Label ??= $"Drop{q.Id}x{k + 1}";
                units[first].PreSteps.AddRange(new[]
                {
                    Step(q.Tag), "    #completewith " + lab, "    >>" + si.Text,
                    $"    .collect {si.Item},1,{q.Id} --{m.Data.ItemName(si.Item)} (1)", $"    .accept {q.Id} >>Accept {q.Name}", $"    .use {si.Item}",
                });
            }
        }

        AsYouGo(units);

        var L = g.Lines;
        var reminders = m.Cfg.Reminders.OrderBy(x => x.AtLevel).ToList(); int nextReminder = 0;
        void Reminders(double level)
        {
            while (nextReminder < reminders.Count && reminders[nextReminder].AtLevel <= level)
            {
                var rem = reminders[nextReminder++];
                L.Add(Step(rem.Tag)); L.Add("    #completewith next"); L.Add("    +" + rem.Text.TrimStart('>'));
            }
        }
        if (m.Visit.Number > 1) nextReminder = reminders.Count;      // reminders belong to the first part
        Reminders(m.StartLevel);

        // hand-written steps from the zone file, next to the planned step they name
        var keyOf = RouteLock.Keys(m); var unitOf = new Dictionary<string, int>();
        for (int i = 0; i < units.Count; i++) foreach (var t in units[i].AllTasks ?? units[i].Tasks) unitOf.TryAdd(keyOf[t.Id], i);
        var before = new Dictionary<int, List<StepFix>>(); var after = new Dictionary<int, List<StepFix>>();
        foreach (var sf in m.Cfg.Steps)
        {
            var map = sf.After != null ? after : before;
            foreach (var raw in sf.After ?? sf.Before ?? new())
            {
                string key = raw.Trim();
                if (!unitOf.TryGetValue(key, out int at)) { g.StepsNotPlaced.Add(key); continue; }
                if (!map.TryGetValue(at, out var l)) map[at] = l = new();
                if (!l.Contains(sf)) l.Add(sf);                   // two names at the same stop: once is enough
            }
        }
        // training, vendor and flight-path steps kept in the lock file, next to the step above them there
        var lockSvcs = m.Opt.Lock?.ServicesFor(m.Visit.Number) ?? new();
        var inLock = (m.Opt.Lock?.AllServices ?? Enumerable.Empty<LockedService>()).Select(x => m.Main.Name + "|" + x.Id).ToHashSet();
        // a step saved after a "tight" pickup (an escort, a timed delivery) goes after what must follow that pickup instead
        var tightNext = new Dictionary<string, string>();
        foreach (var t in m.Tasks) if (t.Tight >= 0) tightNext[keyOf[t.Tight]] = keyOf[t.Id];
        foreach (var svc in lockSvcs)
        {
            if (m.Opt.LockPlaced.Contains(svc)) continue;
            var anchor = svc.Anchors.FirstOrDefault(a => unitOf.ContainsKey(a.Key));
            if (anchor.Key == null) continue;                  // none of the steps around it is in this part: another part may have them
            if (anchor.After && tightNext.TryGetValue(anchor.Key, out var follow) && unitOf.ContainsKey(follow)) anchor = (follow, true);
            m.Opt.LockPlaced.Add(svc);
            g.LockServices.Add((svc, anchor.Key, anchor.After));
            // a lock written for every character keeps another class's steps; a one-character build just does not show them
            if (m.SingleCharacter && m.Opt.Race != null && m.Opt.Class != null && !Verifier.Applies(svc.Tag ?? "", m.Opt.Race, m.Opt.Class, m.Opt.Faction)) continue;
            var map = anchor.After ? after : before; int at = unitOf[anchor.Key];
            if (!map.TryGetValue(at, out var l)) map[at] = l = new();
            l.Add(new StepFix { Lines = svc.Lines, Text = svc.Text, Tag = svc.Tag });
            g.LockSteps++;
        }
        // training, vendor and flight-path steps from RestedXP's guides (--rxp), next to the quest step they follow there;
        // the ones the lock already has are left to the lock (wherever it puts them), and the ones placed here are saved in it
        var nearUs = m.Areas.Select(a => a.UiMap).ToHashSet();
        if (m.Rxp != null && !m.Opt.NoRxpSteps)
            foreach (var svc in m.Rxp.Services)
            {
                if (svc.Faction.Length > 0 && svc.Faction != m.Opt.Faction) continue;
                if (svc.Map >= 0 && !nearUs.Contains(svc.Map)) continue;
                if (m.SingleCharacter && m.Opt.Race != null && m.Opt.Class != null && !Verifier.Applies(svc.Tag, m.Opt.Race, m.Opt.Class, m.Opt.Faction)) continue;
                string id = m.Main.Name + "|" + svc.Id;
                if (m.Opt.RxpPlaced.Contains(id) || inLock.Contains(id)) continue;
                var anchor = svc.Anchors.FirstOrDefault(a => unitOf.ContainsKey(a.Key));
                if (anchor.Key == null) continue;
                var map = anchor.After ? after : before; int at = unitOf[anchor.Key];
                // only where this guide is within a level of the RestedXP guide the step comes from
                if (units[at].Level < svc.MinLevel - 1 || units[at].Level > svc.MaxLevel + 1) continue;
                if (!map.TryGetValue(at, out var l)) map[at] = l = new();
                l.Add(new StepFix { Lines = svc.Lines, Tag = svc.Tag });
                m.Opt.RxpPlaced.Add(id); g.RxpSteps++;
                g.LockServices.Add((new LockedService { Lines = svc.Lines, Tag = svc.Tag.Length > 0 ? svc.Tag : null, From = "RestedXP: " + svc.Guide, Anchors = svc.Anchors }, anchor.Key, anchor.After));
            }
        // early hand-ins: a quest that is finished by a stop near its hand-in, but handed in further down the guide (a saved
        // or RestedXP order that does it later, or never got round to it), is offered there too. The step only shows once the
        // quest is complete, and the planned hand-in skips itself once it is done.
        var stopOf = new Dictionary<int, int>();
        for (int i = 0; i < units.Count; i++) foreach (var t in units[i].AllTasks ?? units[i].Tasks) stopOf.TryAdd(t.Id, i);
        var finishedAt = new Dictionary<int, int>();          // quest -> the stop where its last pickup or objective step is
        foreach (var (id, i) in stopOf)
        {
            var t = m.Tasks[id];
            if (t.Q == null || t.Kind is not (TaskKind.Accept or TaskKind.ItemAccept or TaskKind.Objective)) continue;
            finishedAt[t.Q.Id] = Math.Max(finishedAt.GetValueOrDefault(t.Q.Id, -1), i);
        }
        // where you stand at each stop: the stop itself, and any training, vendor or flight-path step placed with it
        (int area, Pt pos)? Where(StepFix sf)
        {
            if (sf.Goto != null) return m.World(sf.Goto);
            foreach (var line in sf.Lines)
            {
                var g = Regex.Match(line, @"^\.goto\s+(\d+)(?:/-?\d+)?\s*,\s*(-?[\d.]+)\s*,\s*(-?[\d.]+)");
                if (!g.Success) continue;
                int map = int.Parse(g.Groups[1].Value, CultureInfo.InvariantCulture);
                int ai = m.Areas.FindIndex(x => x.UiMap == map); if (ai < 0) return null;
                var pt = new Pt(double.Parse(g.Groups[2].Value, CultureInfo.InvariantCulture), double.Parse(g.Groups[3].Value, CultureInfo.InvariantCulture));
                return (ai, m.Areas[ai].HasBounds ? pt : m.Areas[ai].ToWorld(pt));
            }
            return null;
        }
        var handedEarly = new HashSet<int>();
        for (int i = 0; i < units.Count; i++)
        {
            var u = units[i];
            var spots = new List<(int area, Pt pos)> { (u.Area, u.Pos) };
            foreach (var sf in (before.GetValueOrDefault(i) ?? new()).Concat(after.GetValueOrDefault(i) ?? new()))
                if (Where(sf) is { } w) spots.Add(w);
            foreach (var t in m.Tasks)
            {
                if (t.Kind != TaskKind.TurnIn || t.Ent == null || t.Ent.Patrol || t.Cond || t.Deferred || handedEarly.Contains(t.Id)) continue;
                if (!stopOf.TryGetValue(t.Id, out int planAt) || planAt <= i + 1 || visitOf[planAt] == visitOf[i]) continue;   // handed in here or soon anyway
                if (!finishedAt.TryGetValue(t.Q!.Id, out int f) || f > i) continue;                                            // not finished yet
                if (t.Pre.Any(p => !m.Tasks[p].Deferred && stopOf.GetValueOrDefault(p, int.MaxValue) > i) ||
                    t.PreAny.Count > 0 && !t.PreAny.Any(p => stopOf.GetValueOrDefault(p, int.MaxValue) <= i)) continue;     // something it needs comes later
                var near = t.Cands.FirstOrDefault(c => spots.Any(sp => c.Area == sp.area && c.Pos.To(sp.pos) <= Tuning.HubRadius));
                if (near == null) continue;
                u.HandIns.Add((t, near)); handedEarly.Add(t.Id); g.EarlyHandIns++;
            }
        }

        void Custom(StepFix sf)
        {
            L.Add(Step(sf.Tag?.Trim() ?? ""));
            if (sf.Goto != null) { var (a, pt) = m.World(sf.Goto); L.Add(Goto(a, pt)); }
            if (!string.IsNullOrWhiteSpace(sf.Text)) L.Add("    >>" + sf.Text.Trim().TrimStart('>'));
            foreach (var line in sf.Lines) L.Add("    " + line.Trim());
            if (sf.Goto == null && string.IsNullOrWhiteSpace(sf.Text) && sf.Lines.Count == 0) L.Add("    +" + string.Join(", ", sf.After ?? sf.Before ?? new()));
            if (sf.After != null || sf.Before != null) g.CustomSteps++;
        }

        // a header step at the start of each section, carrying the label the level jumps at the top of the guide go to.
        // It is shown to everyone (RestedXP drops other classes' steps, and a jump to a dropped label would stall there).
        // When the zone is split into a guide per section, the guide's name says it instead, and there are no jumps
        int lastSec = -1; bool split = m.Cfg.Split ?? true;
        int UnitSection(Unit u) => (u.AllTasks ?? u.Tasks).Select(t => sectionOf!.GetValueOrDefault(t.Id, -1)).DefaultIfEmpty(-1).Min();
        void SectionHeader(int k)
        {
            var (_, lvl, hub) = sectionStart[k];
            string label = $"RBSection{m.Visit.Number}_{k + 1}", name = SectionName(hub);
            g.Sections.Add(new SectionInfo { Label = label, Level = lvl, Name = name, Index = k, Line = L.Count });
            if (split) return;
            L.Add("step"); L.Add("    #label " + label); L.Add("    #completewith next");
            L.Add($"    +|cRXP_WARN_{m.Main.Name}: {name}|r (planned from level {lvl})");
        }

        Pt prev = m.Start; int prevArea = m.StartArea;
        // where each kind of character last stood: a loop of waypoints starts at the end nearest to where the characters
        // who see it come from, not from a stop only another class makes (a Warlock's trainer, say)
        var lastFor = new Dictionary<string, (int at, int area, Pt pos)> { [""] = (-1, m.StartArea, m.Start) };
        for (int i = 0; i < units.Count; i++)
        {
            var u = units[i];
            int us = UnitSection(u);
            if (us > lastSec && us < sectionStart.Count) { SectionHeader(us); lastSec = us; }
            if (Far(i)) Reminders(u.Level);
            if (u.Area != prevArea)
            {
                // tag the trip if everything done on the far side is for one class, and guard it if it is all for one conditional quest
                var side = new List<Unit>();
                if (u.Area != 0) for (int j = i; j < units.Count && units[j].Area == u.Area; j++) side.Add(units[j]);
                else for (int k = i - 1; k >= 0 && units[k].Area != 0; k--) side.Add(units[k]);
                var tags = side.Select(UnitTag).Distinct().ToList(); var grds = side.Select(x => (x.Guard, x.GuardQuest)).Distinct().ToList();
                string guard = grds.Count == 1 && grds[0].GuardQuest != 0 && u.Area != 0 ? grds[0].Guard : "";
                L.AddRange(TravelStep(prevArea, u.Area, tags.Count == 1 ? tags[0] : "", guard));
            }
            if (u.Hearth && m.Home != null)
            {
                L.Add(Step(u.HearthTag)); L.Add("    #completewith next");
                L.Add($"    .hs >>Hearth to {m.BindName}. |cRXP_WARN_Walk instead if you are already nearby|r");
                L.Add("    .cooldown item,6948,>0,1");
                if (m.Cfg.BindSubzone is { } sub) L.Add($"    .subzoneskip {sub}");
                g.HearthSteps++;
            }
            foreach (var sf in before.GetValueOrDefault(i) ?? new()) Custom(sf);
            string ut = UnitTag(u);
            var seen = lastFor[""];
            if (ut.Length > 0 && lastFor.TryGetValue(ut, out var own) && own.at > seen.at) seen = own;
            // after a hearth you stand at the inn
            if (u.Hearth && m.Home is { } home && home.Cands.Count > 0) seen = (i, home.Cands[r.Choice[home.Id]].Area, home.Cands[r.Choice[home.Id]].Pos);
            L.AddRange(Render(u, seen.area == u.Area ? seen.pos : prev));
            foreach (var sf in after.GetValueOrDefault(i) ?? new()) Custom(sf);
            foreach (var (t, c) in u.HandIns.OrderBy(e => e.t.Ent == u.Ent ? 0 : 1).ThenBy(e => e.c.Pos.To(u.Pos)))
            {
                L.Add(Step(t.Tag)); L.Add(Goto(c.Area, c.Pos));
                L.Add(t.Ent!.Kind == EntKind.Npc ? $"    >>{Talk}Talk to |cRXP_FRIENDLY_{t.Ent.Name}|r" : $"    >>Click the |cRXP_PICK_{t.Ent.Name}|r");
                L.Add($"    .turnin {t.Q!.Id} >>Turn in {t.Q.Name} while you are here");
                L.Add($"    .isQuestComplete {t.Q.Id}");
                if (t.Ent.Kind == EntKind.Npc) L.Add("    .target " + t.Ent.Name);
            }
            foreach (var (t, c) in u.Early.OrderBy(e => e.t.Ent == u.Ent ? 0 : 1).ThenBy(e => e.c.Pos.To(u.Pos)))
            {
                L.Add(Step(t.Tag)); L.Add(Goto(c.Area, c.Pos));
                L.Add(t.Ent!.Kind == EntKind.Npc ? $"    >>{Talk}Talk to |cRXP_FRIENDLY_{t.Ent.Name}|r" : $"    >>Click the |cRXP_PICK_{t.Ent.Name}|r");
                L.Add($"    .accept {t.Q!.Id} >>Accept {t.Q.Name}");
                if (t.Ent.Kind == EntKind.Npc) L.Add("    .target " + t.Ent.Name);
                L.Add($"    .xp <{t.MinLevel},1");
            }
            prev = u.Pos; prevArea = u.Area; lastFor[ut] = (i, u.Area, u.Pos);
        }
        Reminders(99);

        // ---- what is still in the log, and where it goes
        foreach (var q in m.Quests.Values.Where(q => q.Carried).OrderBy(q => q.Destination).ThenBy(q => q.Level))
            g.Carried.Add((q.Destination ?? "another zone", q.Tag, q.Name));
        foreach (var q in m.Quests.Values.Where(q => q.Late && !q.DataGap && !q.Cond).OrderBy(q => q.Level))
            g.Carried.Add((string.Join(", ", q.Unrouted.Select(o => o.Elsewhere == "an unknown place" ? "Elsewhere" : o.Elsewhere).Distinct()) + " and back here", q.Tag, q.Name));
        var left = g.Carried.GroupBy(c => (c.dest, c.tag)).Select(grp => $"    >>|cRXP_FRIENDLY_{grp.Key.dest}|r: {string.Join(", ", grp.Select(c => c.quest))}" + (grp.Key.tag.Length > 0 ? " << " + grp.Key.tag : "")).ToList();
        if (nextVisitLevel is { } nl)
        {
            if (left.Count > 0)
            {
                L.Add("step");
                L.Add($"    +|cRXP_WARN_That is all of {m.Main.Name} for now.|r Quests still in your log lead on from here; pick your next zone by them");
                L.AddRange(left);
            }
            g.GateLine = L.Count;
            L.Add("step");
            L.Add(m.Cfg.Split ?? true
                ? $"    +|cRXP_WARN_The rest of {m.Main.Name} is planned from level {nl}.|r Load its guide for level {nl} then"
                : $"    .xp {nl} >>|cRXP_WARN_The rest of {m.Main.Name} is planned from level {nl}.|r Come back to this guide then");
        }
        else
        {
            L.Add("step");
            L.Add($"    +|cRXP_WARN_End of the {m.Main.Name} route.|r" + (left.Count > 0 ? " Quests still in your log lead on from here; pick your next zone by them" : ""));
            L.AddRange(left);
        }

        g.Steps = L.Count(l => l.StartsWith("step"));
        g.NextPartLevel = nextVisitLevel;
        foreach (var q in m.Quests.Values)
            if ((m.Find(TaskKind.TurnIn, q.Id) ?? m.Find(TaskKind.Accept, q.Id)) is { } qt && sectionOf!.TryGetValue(qt.Id, out int qs)) g.QuestSection[q.Id] = qs;
        g.EndLevel = r.Views.Count > 0 ? r.Views[0].EndLevel : m.StartLevel;
        return g;
    }

    static string Proper(string s) => s.Length == 0 ? s : char.ToUpperInvariant(s[0]) + s[1..];

    /// <summary>
    /// The .lua file: a header, the faction check, and the guide. Split (the default), each section of each part is a guide
    /// of its own, listed under the zone's name in RestedXP and chained to the next with #next; otherwise one guide holds
    /// every part, with level jumps at the top to the section for your level.
    /// </summary>
    public static string FileText(List<(ZoneModel m, GuideOutput g)> visits)
    {
        var m = visits[0].m; var sb = new StringBuilder();
        string who = Who(m), zone = m.Main.Name;
        // the range in the name runs from the level the plan starts at to the highest quest level in it
        int lo = (int)Math.Floor(m.StartLevel), hi = Math.Max(lo, visits.Max(v => v.m.LevelHi));
        string name = $"{lo}-{hi} {zone}", group = $"Zone Routes ({who})";
        // a build limited with --min-level/--max-level gets the range in its file name, so several ranges of one zone sit side by side
        string range = m.Opt.MinLevel != null || m.Opt.MaxLevel != null ? $" {m.Opt.MinLevel ?? lo}-{m.Opt.MaxLevel ?? hi}" : "";
        foreach (var (_, g) in visits) { g.Name = name; g.Group = group; g.FileName = $"{zone}{range} ({who}).lua"; }

        // every part has at least one section (a part with no header gets one covering all of it)
        foreach (var (vm, g) in visits)
            if (g.Sections.Count == 0 || g.Sections[0].Line > 0 && g.Sections[0].Index != 0)
                g.Sections.Insert(0, new SectionInfo { Label = "", Level = (int)Math.Floor(vm.StartLevel), Name = vm.Visit.Number > 1 ? $"part {vm.Visit.Number}" : "start", Index = 0, Line = 0 });
        bool split = (m.Cfg.Split ?? true) && visits.Sum(v => v.g.Sections.Count) > 1;
        var chunks = new List<(GuideOutput g, SectionInfo s, int from, int to, string only)>();
        int subLo = int.MaxValue, subHi = 0;     // the levels the zone's guides cover, for its heading in the list
        if (split)
        {
            var used = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
            foreach (var (vm, g) in visits)
                for (int k = 0; k < g.Sections.Count; k++)
                {
                    var sec = g.Sections[k];
                    int a = k == 0 ? 0 : sec.Line, b = k + 1 < g.Sections.Count ? g.Sections[k + 1].Line : g.Lines.Count;
                    int slo = k == 0 ? (int)Math.Floor(vm.StartLevel) : sec.Level;
                    // up to where the next one starts; the last one of a part up to the level you are expected to finish at
                    int shi = Math.Max(slo + 1, k + 1 < g.Sections.Count ? g.Sections[k + 1].Level : (int)Math.Ceiling(g.EndLevel - 0.05));
                    string place = sec.Name == "start" || sec.Name.StartsWith("part ") ? "" : ": " + sec.Name;
                    string gn = $"{slo}-{shi} {zone}{range}{place}";
                    for (int n = 2; !used.Add(gn); n++) gn = $"{slo}-{shi} {zone}{range}{place} ({n})";
                    sec.Guide = gn;
                    chunks.Add((g, sec, a, b, g.OnlyFor));
                    subLo = Math.Min(subLo, slo); subHi = Math.Max(subHi, shi);
                }
        }
        else foreach (var (_, g) in visits) foreach (var sec in g.Sections) sec.Guide = name;

        string other = m.Opt.Faction == "Horde" ? "Alliance" : "Horde";
        sb.AppendLine($"-- {name}: {group}.");
        sb.AppendLine($"-- Made by RouteBuilder from QuestieDB's Forever data ({m.Data.Version}; QuestieDB is GPL-3.0).");
        sb.AppendLine(m.SingleCharacter
            ? "-- The order was tuned for one character. Steps for other classes and races are left out."
            : "-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.");
        sb.AppendLine("-- Steps that depend on quests from other zones hide themselves unless you have those quests.");
        if (visits.Count > 1)
            sb.AppendLine($"-- The zone covers more levels than one visit gives, so it is planned in {visits.Count} parts (from level {string.Join(", ", visits.Select(v => v.m.StartLevel.ToString("0", Inv)))}).");
        // the heading the guides are listed under: "1 - 16 Mulgore". Spaced, because RestedXP pads a name starting "1-16"
        // to "01-16" when it files the heading but not when it looks it up, so every guide would get a heading of its own
        string subgroup = $"{subLo} - {subHi} {zone}";
        if (split)
            sb.AppendLine($"-- Split into {chunks.Count} guides, listed under \"{subgroup}\" in RestedXP. Each leads on to the next; start at any of them: " +
                          "a step that needs a quest from an earlier one hides itself unless you did that quest.");
        else if (visits.Sum(v => v.g.Sections.Count) > 1)
            sb.AppendLine($"-- Sections (the guide starts at the one for your level): {string.Join("; ", visits.SelectMany(v => v.g.Sections).Select(x => $"{x.Name} from {x.Level}"))}.");
        sb.AppendLine($"-- Edit zones/{zone}.json and re-run rather than editing this file, or your changes are lost on the next build.");
        sb.AppendLine();
        sb.AppendLine($"if UnitFactionGroup(\"player\") == \"{other}\" then return end");
        string Esc(string l) => l.Replace("]]", "] ]");    // "]]" would end the Lua string
        if (!split)
        {
            sb.AppendLine();
            sb.AppendLine("RXPGuides.RegisterGuide([[");
            foreach (var l in new[] { "#classic", "<< " + m.Opt.Faction, "#version 1", "#group " + group, "#name " + name, "" }) sb.AppendLine(l);
            foreach (var l in EntryJumps(visits.SelectMany(v => v.g.Sections).Where(x => x.Label.Length > 0).ToList())) sb.AppendLine(l);
            foreach (var (_, g) in visits) foreach (var l in g.Lines) sb.AppendLine(Esc(l));
            sb.AppendLine("]])");
            return sb.ToString();
        }
        for (int c = 0; c < chunks.Count; c++)
        {
            var (g, sec, a, b, only) = chunks[c];
            sb.AppendLine();
            sb.AppendLine("RXPGuides.RegisterGuide([[");
            sb.AppendLine("#classic");
            sb.AppendLine("<< " + (only.Length > 0 ? only : m.Opt.Faction));
            sb.AppendLine("#version 1");
            sb.AppendLine("#group " + group);
            sb.AppendLine("#subgroup " + subgroup);
            sb.AppendLine("#subweight " + (-subLo).ToString(Inv));    // headings are listed by weight, highest first: lowest level first
            sb.AppendLine("#name " + sec.Guide);
            // on to the next section of the same part (the next part is for a higher level: link suggests where to go meanwhile)
            if (c + 1 < chunks.Count && chunks[c + 1].g == g) sb.AppendLine($"#next {group}\\{chunks[c + 1].s.Guide}");
            sb.AppendLine();
            for (int i = a; i < b; i++) sb.AppendLine(Esc(g.Lines[i]));
            sb.AppendLine("]])");
        }
        return sb.ToString();
    }

    /// <summary>
    /// Steps at the top of the guide that send a player to the first section planned for their level: a level 1 character
    /// starts at the top, one arriving at level 9 from another zone starts at the section planned from 9. RestedXP's
    /// ".xp &lt;N,1,label" jumps when you are below N (it works with or without the "skip steps by level" setting);
    /// the plain ".xp N" next to it lets the step finish when you are not.
    /// </summary>
    static List<string> EntryJumps(List<SectionInfo> sections)
    {
        var use = new List<SectionInfo>();
        foreach (var s in sections) if (use.Count == 0 || s.Level > use[^1].Level) use.Add(s);
        var o = new List<string>();
        if (use.Count < 2) return o;
        for (int k = 0; k + 1 < use.Count; k++)
        {
            o.Add("step");
            o.Add($"    .xp <{use[k + 1].Level},1,{use[k].Label}");
            o.Add($"    .xp {use[k + 1].Level} >>Finding the place in this guide for your level");
        }
        o.Add("step");
        o.Add($"    .xp <{Game.MaxLevel + 1},1,{use[^1].Label}");
        return o;
    }

    /// <summary>Who a guide is for: the faction, or the race and class it was tuned for.</summary>
    public static string Who(ZoneModel m) =>
        m.SingleCharacter ? string.Join(" ", new[] { m.Opt.Race, m.Opt.Class }.Where(s => s != null).Select(s => Proper(s!))) : m.Opt.Faction;
}
