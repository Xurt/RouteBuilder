using System.Globalization;
using System.Text;

namespace RouteBuilder;

public sealed class GuideOutput
{
    public string Name = "", Group = "", FileName = "";
    public List<string> Lines = new();      // the guide body (between RegisterGuide([[ and ]]))
    public int Steps, HearthSteps, EarlyOffers, Stops, AsYouGo;
    public int GateLine = -1;               // index of the "step" line of the level check that leads to the next part
    public List<string> GrindSteps = new();
    public List<(string dest, string tag, string quest)> Carried = new();
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
        public List<RouteTask>? AllTasks;          // the whole stop, when this unit is one half of a split
        public Unit Copy() => (Unit)MemberwiseClone();
    }

    readonly ZoneModel m; readonly RouteResult r; readonly GuideOutput g = new();
    readonly HashSet<(int, string)> guards = new();

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

    /// <summary>A single pin, or a pin plus a loop of waypoints over a spawn patch.</summary>
    List<string> LoopLines(int area, List<Pt> pts, Pt from, int maxPts = 9, bool ordered = false)
    {
        pts = Geo.Thin(pts, 35);
        if (pts.Count <= 2 || Geo.Span(pts) < 45) return new List<string> { Goto(area, Geo.Medoid(pts)) };
        var wp = ordered ? Geo.AlongAxis(pts, from, maxPts) : Geo.Tour(Geo.FarthestSample(pts, maxPts), from);
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
            if (!q.Conditional) return o;
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
        return o;
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
        var need = new List<RouteTask>();
        if (u.Kind == "ent" && u.Guard.Length == 0)
            foreach (var t in u.Tasks)
            {
                if (t.Kind != TaskKind.Accept || t.Q!.Req <= 1) continue;
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
        var units = BuildUnits(); g.Stops = units.Count;
        bool Far(int i) => i > 0 && (units[i].Area != units[i - 1].Area || units[i].Pos.To(units[i - 1].Pos) > 150);

        // early offers: a pickup planned for later only because the predicted level is a shade short is offered
        // once per visit to its hub as a self-skipping step, in case the player is ahead of the prediction
        var planned = new Dictionary<int, int>();
        for (int i = 0; i < units.Count; i++) foreach (var t in units[i].Tasks) planned[t.Id] = i;
        var done = new HashSet<int>(); double xp = m.StartXp; int visit = 0;
        var offers = new Dictionary<(int task, int visit), (int unit, RouteTask t, Cand c)>();
        for (int i = 0; i < units.Count; i++)
        {
            var u = units[i];
            if (Far(i)) visit++;
            foreach (var t in u.Tasks) { done.Add(t.Id); if (t.Elig == m.AllElig) xp += t.Xp; }
            if (u.Kind != "ent") continue;
            double lvl = Game.FracLevel(xp);
            foreach (var t in m.Tasks)
            {
                if (done.Contains(t.Id) || t.Kind != TaskKind.Accept || t.Ent == null || t.Cond || t.Q!.Fix.Tight || planned.GetValueOrDefault(t.Id) <= i + 1) continue;
                if (t.Pre.Any(p => !done.Contains(p) && !m.Tasks[p].Deferred) || (t.PreAny.Count > 0 && !t.PreAny.Any(done.Contains))) continue;
                if (t.MinLevel <= 1 || !(t.MinLevel - 0.5 <= lvl && lvl < t.MinLevel + Tuning.Safety)) continue;
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

        Pt prev = m.Start; int prevArea = m.StartArea;
        for (int i = 0; i < units.Count; i++)
        {
            var u = units[i];
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
            L.AddRange(Render(u, prev));
            foreach (var (t, c) in u.Early)
            {
                L.Add(Step(t.Tag)); L.Add(Goto(c.Area, c.Pos));
                L.Add(t.Ent!.Kind == EntKind.Npc ? $"    >>{Talk}Talk to |cRXP_FRIENDLY_{t.Ent.Name}|r" : $"    >>Click the |cRXP_PICK_{t.Ent.Name}|r");
                L.Add($"    .accept {t.Q!.Id} >>Accept {t.Q.Name}");
                if (t.Ent.Kind == EntKind.Npc) L.Add("    .target " + t.Ent.Name);
                L.Add($"    .xp <{t.MinLevel},1");
            }
            prev = u.Pos; prevArea = u.Area;
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
            L.Add($"    .xp {nl} >>|cRXP_WARN_The rest of {m.Main.Name} is planned from level {nl}.|r Come back to this guide then");
        }
        else
        {
            L.Add("step");
            L.Add($"    +|cRXP_WARN_End of the {m.Main.Name} route.|r" + (left.Count > 0 ? " Quests still in your log lead on from here; pick your next zone by them" : ""));
            L.AddRange(left);
        }

        g.Steps = L.Count(l => l.StartsWith("step"));
        return g;
    }

    static string Proper(string s) => s.Length == 0 ? s : char.ToUpperInvariant(s[0]) + s[1..];

    /// <summary>The .lua file: a header, the faction check, and one guide holding every visit in order.</summary>
    public static string FileText(List<(ZoneModel m, GuideOutput g)> visits)
    {
        var m = visits[0].m; var sb = new StringBuilder();
        string who = m.SingleCharacter ? string.Join(" ", new[] { m.Opt.Race, m.Opt.Class }.Where(s => s != null).Select(s => Proper(s!))) : m.Opt.Faction;
        // the range in the name runs from the level the plan starts at to the highest quest level in it
        int lo = (int)Math.Floor(m.StartLevel), hi = Math.Max(lo, visits.Max(v => v.m.LevelHi));
        string name = $"{lo}-{hi} {m.Main.Name}", group = $"Zone Routes ({who})";
        foreach (var (_, g) in visits) { g.Name = name; g.Group = group; g.FileName = $"{m.Main.Name} ({who}).lua"; }
        string other = m.Opt.Faction == "Horde" ? "Alliance" : "Horde";
        sb.AppendLine($"-- {name}: {group}.");
        sb.AppendLine($"-- Made by RouteBuilder from QuestieDB's Forever data ({m.Data.Version}; QuestieDB is GPL-3.0).");
        sb.AppendLine(m.SingleCharacter
            ? "-- The order was tuned for one character. Steps for other classes and races are left out."
            : "-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.");
        sb.AppendLine("-- Steps that depend on quests from other zones hide themselves unless you have those quests.");
        if (visits.Count > 1)
            sb.AppendLine($"-- The zone covers more levels than one visit gives, so the guide has {visits.Count} parts with a level check between them (from level {string.Join(", ", visits.Select(v => v.m.StartLevel.ToString("0", Inv)))}).");
        sb.AppendLine($"-- Edit zones/{m.Main.Name}.json and re-run rather than editing this file, or your changes are lost on the next build.");
        sb.AppendLine();
        sb.AppendLine($"if UnitFactionGroup(\"player\") == \"{other}\" then return end");
        sb.AppendLine();
        sb.AppendLine("RXPGuides.RegisterGuide([[");
        foreach (var l in new[] { "#classic", "<< " + m.Opt.Faction, "#version 1", "#group " + group, "#name " + name, "" }) sb.AppendLine(l);
        foreach (var (_, g) in visits) foreach (var l in g.Lines) sb.AppendLine(l.Replace("]]", "] ]"));    // "]]" would end the Lua string
        sb.AppendLine("]])");
        return sb.ToString();
    }
}
