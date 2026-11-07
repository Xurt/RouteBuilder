using System.Text.RegularExpressions;

namespace RouteBuilder;

/// <summary>
/// Level skip (--level-skip, or "LevelSkip": 1 in settings.json): one guide per zone that a player can load at any level.
/// Steps a player has outgrown hide themselves, so someone arriving at level 10 lands on the first quests worth their level.
///
///  * A pickup that starts a chain (no prerequisite handed in earlier in this guide) gets ".maxlevel N": it hides once you are
///    more than <see cref="Tuning.PickupBelow"/> levels above the quest. With <see cref="Tuning.ChainLift"/> the level used is
///    the highest quest of the chain it opens, so a low opener for a chain that is still worth doing stays.
///  * A pickup that follows on from another quest gets ".isQuestTurnedIn" for that quest instead, so a chain whose first quest
///    was skipped never shows from the middle.
///  * Hand-ins and objectives use RestedXP's negative quest IDs (".turnin -788"): each line skips itself when you are not on
///    that quest, so a skipped chain takes its objectives and hand-ins with it.
///  * ".maxlevel" hides a whole step, so a stop that hands in and picks up is split: hand-ins first, then one step per
///    pickup rule, each with the stop's location and NPC.
///  * Training, vendor, hearth and travel steps without quests take the cutoff of the pickup step before them, so a player
///    who skipped an area is not sent back to its trainer.
/// </summary>
public static class LevelSkip
{
    static readonly Regex QLine = new(@"^(\s*\.(accept|turnin|complete)\s+)(-?\d+)(,[^\s>-]*)?", RegexOptions.Compiled);
    static readonly Regex GuardLine = new(@"^\s*\.(isQuestTurnedIn|isOnQuest|isQuestComplete|isNotOnQuest|isQuestAvailable|maxlevel|xp)\b", RegexOptions.Compiled);
    static readonly Regex PlaceLine = new(@"^\s*\.(goto|hs|train|vendor|home|fp|fly|trainer|zone|zoneskip|buy)\b", RegexOptions.Compiled);

    static bool IsHeader(string l) { var t = l.TrimStart(); return t == "step" || t.StartsWith("step ", StringComparison.Ordinal); }

    sealed class QEl { public int Line; public string Cmd = ""; public int Id; public string Arg = ""; }
    sealed class Block
    {
        public int Start;                    // index of the header in the old lines (-1: lines before the first step)
        public List<string> Lines = new();
        public List<QEl> Els = new();
        public bool Guarded, Rider, Placed;
        public Dictionary<int, string> Gate = new();   // accept line -> its gate key
        public int? HeadCutoff;                         // highest .maxlevel among its pickups
    }

    // ---------------------------------------------------------------- the cutoff of a chain
    /// <summary>The level above which a pickup of <paramref name="q"/> is hidden.</summary>
    public static int Cutoff(ZoneModel m, Quest q) => Cutoffs(m).GetValueOrDefault(q.Id, q.Level + (int)Tuning.PickupBelow);

    static ZoneModel? cachedFor; static Dictionary<int, int> cached = new();
    static Dictionary<int, int> Cutoffs(ZoneModel m)
    {
        if (cachedFor == m) return cached;
        var children = new Dictionary<int, List<Quest>>();
        foreach (var q in m.Quests.Values)
            foreach (int p in q.PreAll.Concat(q.PreAny).Distinct())
                if (m.Quests.ContainsKey(p)) (children.TryGetValue(p, out var l) ? l : children[p] = new()).Add(q);
        var best = new Dictionary<int, int>(); var busy = new HashSet<int>();
        int Top(Quest q)
        {
            if (best.TryGetValue(q.Id, out int v)) return v;
            if (!busy.Add(q.Id)) return q.Level;                 // a loop in the data
            int top = q.Level;
            if (Tuning.ChainLift != 0)
                foreach (var c in children.GetValueOrDefault(q.Id) ?? new()) top = Math.Max(top, Top(c));
            busy.Remove(q.Id);
            return best[q.Id] = top;
        }
        cached = m.Quests.Values.ToDictionary(q => q.Id, q => Math.Min(Game.MaxLevel, Top(q) + (int)Tuning.PickupBelow));
        cachedFor = m;
        return cached;
    }

    // ---------------------------------------------------------------- rewriting the guide
    /// <summary>
    /// Rewrites one part of a guide in place. <paramref name="turnedSoFar"/> holds the quests handed in by earlier parts
    /// of the same guide, and gains this part's.
    /// </summary>
    public static void Apply(ZoneModel m, GuideOutput g, HashSet<int> turnedSoFar)
    {
        var old = g.Lines;
        var blocks = new List<Block>(); Block? cur = null;
        for (int i = 0; i < old.Count; i++)
        {
            if (cur == null || IsHeader(old[i])) blocks.Add(cur = new Block { Start = IsHeader(old[i]) ? i : -1 });
            cur.Lines.Add(old[i]);
        }

        // pass 1: what every pickup needs, given what has been handed in before it
        var cut = Cutoffs(m);
        foreach (var b in blocks)
        {
            for (int k = 0; k < b.Lines.Count; k++)
            {
                string l = StripComment(b.Lines[k]);
                var mm = QLine.Match(l);
                if (mm.Success) b.Els.Add(new QEl { Line = k, Cmd = mm.Groups[2].Value, Id = Math.Abs(int.Parse(mm.Groups[3].Value)), Arg = mm.Groups[4].Value });
                else if (GuardLine.IsMatch(l)) b.Guarded = true;
                if (Regex.IsMatch(l, @"^\s*\.collect\b")) b.Rider = true;
                if (PlaceLine.IsMatch(l)) b.Placed = true;
            }
            var turnedHere = b.Els.Where(e => e.Cmd == "turnin").Select(e => e.Id).ToHashSet();
            foreach (var e in b.Els.Where(e => e.Cmd == "accept"))
            {
                if (!m.Quests.TryGetValue(e.Id, out var q)) continue;
                bool Done(int p) => turnedSoFar.Contains(p) || turnedHere.Contains(p);
                var all = q.PreAll.Where(Done).OrderBy(p => p).ToList();
                var any = q.PreAny.Where(Done).OrderBy(p => p).ToList();
                string key;
                if (all.Count > 0 || any.Count > 0)
                {
                    var lines = all.Select(p => $"    .isQuestTurnedIn {p} --{QName(m, p)}").ToList();
                    if (all.Count == 0) lines.Add($"    .isQuestTurnedIn {string.Join(",", any)} --any of: {string.Join(", ", any.Select(p => QName(m, p)))}");
                    key = string.Join("\n", lines);
                }
                else
                {
                    int c = cut.GetValueOrDefault(q.Id, q.Level + (int)Tuning.PickupBelow);
                    key = $"    .maxlevel {c} --level skip: hidden once you are past level {c}";
                    b.HeadCutoff = Math.Max(b.HeadCutoff ?? 0, c);
                }
                b.Gate[e.Line] = key;
            }
            foreach (int t in turnedHere) turnedSoFar.Add(t);
        }

        // pass 2: write it out
        var map = new int[old.Count];
        var outL = new List<string>();
        var later = new List<(int, List<string>)>();
        void TagLater(int at, List<string> ql) => later.Add((at, ql));
        int? lastHead = null;
        for (int bi = 0; bi < blocks.Count; bi++)
        {
            var b = blocks[bi];
            if (b.HeadCutoff != null) lastHead = b.HeadCutoff;
            int Old(int k) => b.Start < 0 ? k : b.Start + k;
            void Copy(List<int> ks, List<string> extra)
            {
                foreach (int k in ks) { map[Old(k)] = outL.Count; outL.Add(Negate(b, k)); }
                outL.AddRange(extra);
            }
            var every = Enumerable.Range(0, b.Lines.Count).ToList();
            var accepts = b.Els.Where(e => e.Cmd == "accept").ToList();
            bool hasWork = b.Els.Any(e => e.Cmd != "accept");

            if (b.Start < 0 || b.Els.Count == 0)
            {
                // a step without quests: training, vendor, hearth, travel. It belongs to the stretch of route it sits in.
                int? w = lastHead ?? blocks.Skip(bi + 1).Select(x => x.HeadCutoff).FirstOrDefault(x => x != null);
                bool add = b.Start >= 0 && b.Placed && !b.Guarded && w != null;
                Copy(every, add ? new List<string> { $"    .maxlevel {w} --level skip: with the pickups around it" } : new());
                continue;
            }
            if (b.Guarded || b.Rider || accepts.Count == 0)
            {
                // already conditional, a drop-started quest, or hand-ins and objectives only: keep the step whole
                var extra = new List<string>();
                if (accepts.Count > 0 && !hasWork && accepts.All(e => b.Gate.TryGetValue(e.Line, out var k) && k.Contains(".maxlevel")) && !b.Lines.Any(l => l.Contains(".maxlevel")))
                    extra.Add($"    .maxlevel {b.HeadCutoff} --level skip: hidden once you are past level {b.HeadCutoff}");
                Copy(every, extra);
                continue;
            }

            // Runs of quest lines in their original order, cut wherever the rule changes. Hand-ins, objectives and pickups of
            // quests this guide does not know have no rule (""); a pickup's rule is its .maxlevel or .isQuestTurnedIn.
            // Keeping the order matters: a quest picked up and handed in at the same stop stays picked up first.
            var runs = new List<(string Key, List<QEl> Els)>();
            foreach (var e in b.Els)
            {
                string key = e.Cmd == "accept" ? b.Gate.GetValueOrDefault(e.Line, "") : "";
                if (runs.Count > 0 && runs[^1].Key == key) runs[^1].Els.Add(e); else runs.Add((key, new List<QEl> { e }));
            }
            if (runs.Count == 1)
            {
                Copy(every, runs[0].Key.Length > 0 ? runs[0].Key.Split('\n').ToList() : new());
                continue;
            }
            int label = b.Lines.FindIndex(l => l.TrimStart().StartsWith("#label", StringComparison.Ordinal));
            var questLines = b.Els.Select(e => e.Line).ToHashSet();
            // the run that keeps the step's other lines (objective text, .mob, #loop, notes): the first with hand-ins or
            // objectives, or else the first
            int home = Math.Max(0, runs.FindIndex(x => x.Els.Any(e => e.Cmd != "accept")));
            bool loop = b.Lines.Any(l => l.TrimStart().StartsWith("#loop", StringComparison.Ordinal));
            var where = new List<int>();
            for (int k = 1; k < b.Lines.Count; k++)
            {
                string t = b.Lines[k].TrimStart();
                if (t.StartsWith(".goto", StringComparison.Ordinal) && (!loop || where.Count == 0)) where.Add(k);
                else if (t.StartsWith(">>", StringComparison.Ordinal) && (t.Contains("Talk to") || t.Contains("Click the"))) where.Add(k);
                else if (t.StartsWith(".target", StringComparison.Ordinal)) where.Add(k);
            }
            for (int ri = 0; ri < runs.Count; ri++)
            {
                var (key, els) = runs[ri];
                int at = outL.Count;
                var mine = els.Select(e => e.Line).ToHashSet();
                List<int> ks;
                if (ri == home) ks = every.Where(k => k != label && (!questLines.Contains(k) || mine.Contains(k))).ToList();
                else
                {
                    ks = new List<int> { 0 };
                    foreach (int k in where) ks.Add(k);
                    ks.AddRange(els.Select(e => e.Line));
                }
                if (ri == runs.Count - 1 && label >= 0) ks.Insert(1, label);
                foreach (int k in ks)
                {
                    string l = Negate(b, k);
                    if (ri != home && loop && where.Contains(k) && l.TrimStart().StartsWith(".goto") && l.Split(',') is { Length: > 3 } ps) l = string.Join(",", ps.Take(3));   // a pin, not the loop's first waypoint
                    map[Old(k)] = outL.Count; outL.Add(l);
                }
                if (key.Length > 0) outL.AddRange(key.Split('\n'));
                TagLater(at, els.Select(e => b.Lines[e.Line]).ToList());
            }
        }
        foreach (var (at, ql) in later) TagStep(outL, at, ql);

        g.Lines = outL;
        if (g.GateLine >= 0) g.GateLine = map[g.GateLine];
        foreach (var s in g.Sections) s.Line = map[Math.Min(s.Line, old.Count - 1)];
        g.Steps = outL.Count(IsHeader);
    }

    static string LineTag(string l) { l = StripComment(l); int i = l.LastIndexOf("<<", StringComparison.Ordinal); return i < 0 ? "" : l[(i + 2)..].Trim(); }

    /// <summary>
    /// After a split, a step whose quest lines are all for some characters only (per-line tags) would be an empty stop for
    /// everyone else, so the step itself is tagged with who its lines are for.
    /// </summary>
    static void TagStep(List<string> outL, int header, List<string> questLines)
    {
        if (questLines.Count == 0 || outL[header].Trim() != "step") return;
        var tags = questLines.Select(LineTag).ToList();
        if (tags.Any(t => t.Length == 0)) return;
        outL[header] = "step << " + string.Join("/", tags.SelectMany(t => t.Split('/')).Select(t => t.Trim()).Distinct());
    }

    static string QName(ZoneModel m, int id) => m.Data.Quests.GetValueOrDefault(id)?.Name ?? "?";

    static string StripComment(string l) { int i = l.IndexOf("--", StringComparison.Ordinal); return i < 0 ? l : l[..i]; }

    /// <summary>A hand-in or objective line becomes self-skipping (negative quest ID) when you are not on the quest.</summary>
    static string Negate(Block b, int k)
    {
        var e = b.Els.FirstOrDefault(x => x.Line == k);
        if (e == null || e.Cmd == "accept") return b.Lines[k];
        if (e.Cmd == "turnin" && e.Arg.Length > 0) return b.Lines[k];     // a reward choice: negative would also skip it when incomplete
        return QLine.Replace(b.Lines[k], mm => mm.Groups[1].Value + "-" + Math.Abs(int.Parse(mm.Groups[3].Value)) + mm.Groups[4].Value, 1);
    }

    // ---------------------------------------------------------------- playing it as a player who arrives later
    public sealed class Arrival
    {
        public int Level; public int FirstStep; public string First = ""; public int FirstQuestStep; public string FirstQuest = "";
        public int Pickups, Skipped; public int? LowestPicked; public List<string> Problems = new();
    }

    sealed class SEl { public string Cmd = ""; public string[] Args = Array.Empty<string>(); public string Tag = ""; public string Raw = ""; }
    sealed class SSt { public string Tag = ""; public int No; public List<SEl> Els = new(); public List<string> Text = new(); public bool Rider; }

    static List<SSt> Parse(List<string> lines)
    {
        var steps = new List<SSt>(); SSt? cur = null;
        foreach (var raw in lines)
        {
            string l = Regex.Replace(raw, "--.*$", "").Trim();
            string tag = ""; int ti = l.LastIndexOf("<<", StringComparison.Ordinal);
            if (ti >= 0) { tag = l[(ti + 2)..].Trim(); l = l[..ti].TrimEnd(); }
            if (l == "step") { steps.Add(cur = new SSt { Tag = tag, No = steps.Count + 1 }); continue; }
            if (cur == null || l.Length == 0) continue;
            if (l.StartsWith("#completewith")) cur.Rider = true;
            if (l.StartsWith(">>") || l.StartsWith('+')) { if (tag.Length == 0) cur.Text.Add(l.TrimStart('>', '+')); continue; }
            if (!l.StartsWith('.')) continue;
            int tx = l.IndexOf(">>", StringComparison.Ordinal);
            if (tx >= 0) l = l[..tx].TrimEnd();
            var parts = l[1..].Split(' ', 2);
            cur.Els.Add(new SEl { Cmd = parts[0], Args = parts.Length > 1 ? parts[1].Split(',').Select(a => a.Trim()).ToArray() : Array.Empty<string>(), Tag = tag, Raw = raw.Trim() });
        }
        return steps;
    }

    static string Describe(ZoneModel m, SSt s)
    {
        string who = s.Els.FirstOrDefault(e => e.Cmd == "target")?.Args.FirstOrDefault() ?? "";
        var qs = s.Els.Where(e => e.Cmd is "accept" or "turnin" or "complete")
                      .Select(e => (e.Cmd, Id: Math.Abs(int.TryParse(e.Args[0], out int v) ? v : 0)))
                      .Select(x => $"{x.Cmd} {QName(m, x.Id)}{(m.Quests.TryGetValue(x.Id, out var q) ? $" (level {q.Level})" : "")}").ToList();
        string text = qs.Count > 0 ? string.Join(", ", qs) : s.Text.FirstOrDefault() ?? string.Join(" ", s.Els.Select(e => "." + e.Cmd).Distinct());
        text = Regex.Replace(text, @"\|c[A-Za-z_]+|\|r|\|T[^|]*\|t", "");
        return $"step {s.No}: {(who.Length > 0 ? who + " - " : "")}{text}";
    }

    /// <summary>
    /// Plays the guide as a character of <paramref name="race"/>/<paramref name="cls"/> (empty: steps for everyone only) who
    /// loads it at <paramref name="level"/> with nothing from this zone done, at a fixed level. Problems are steps a player
    /// would get stuck on: a pickup from the middle of a chain, or a hand-in or objective of a quest they do not have.
    /// </summary>
    public static Arrival Arrive(ZoneModel m, List<string> lines, int level, string race, long rbit, string cls, int cbit)
    {
        var a = new Arrival { Level = level };
        long factionMask = m.Races.Aggregate(0L, (x, r) => x | r.Bit);
        bool Can(Quest q) => (q.Row.Races == 0 || (q.Row.Races & (rbit != 0 ? rbit : factionMask)) != 0) && (q.Row.Classes == 0 || cbit != 0 && (q.Row.Classes & cbit) != 0);
        bool Applies(string tag) => race.Length == 0 ? tag.Length == 0 || Verifier.Applies(tag, "", "", m.Opt.Faction) : Verifier.Applies(tag, race, cls, m.Opt.Faction);
        var held = new HashSet<int>(); var turned = new HashSet<int>(m.Visit.Done);
        foreach (var s in Parse(lines))
        {
            if (!Applies(s.Tag)) continue;
            var els = s.Els.Where(e => Applies(e.Tag)).ToList();
            bool skip = false;
            static bool IsQ(SEl e) => e.Cmd is "accept" or "turnin" or "complete";
            if (s.Els.Any(IsQ) && !els.Any(IsQ)) { a.Skipped++; continue; }          // its quests are all for other characters
            foreach (var e in els)
            {
                var ids = e.Args.Select(x => int.TryParse(x, out int v) ? v : 0).Where(v => v != 0).ToList();
                if (e.Cmd == "isQuestTurnedIn" && !ids.Any(turned.Contains)) skip = true;
                if (e.Cmd is "isOnQuest" or "isQuestComplete" && !ids.Any(held.Contains)) skip = true;
                if (e.Cmd == "maxlevel" && ids.Count > 0 && level > ids[0]) skip = true;
                if (e.Cmd == "xp" && e.Args.Length > 1 && e.Args[0].StartsWith('<') && int.TryParse(e.Args[0][1..], out int below) && level < below) skip = true;
                if (e.Cmd == "xp" && e.Args.Length > 0 && Regex.Match(e.Args[0], @"^(\d+)") is { Success: true } gm && level > int.Parse(gm.Groups[1].Value) && !els.Any(IsQ)) skip = true;   // a grind step you are past
            }
            if (skip) { a.Skipped++; continue; }
            bool did = false;
            foreach (var e in els)
            {
                if (e.Cmd is not ("accept" or "turnin" or "complete") || !int.TryParse(e.Args[0], out int raw)) continue;
                int id = Math.Abs(raw);
                if (!m.Quests.TryGetValue(id, out var q) || !Can(q)) continue;
                if (raw < 0 && !held.Contains(id)) continue;                         // skips itself
                if (e.Cmd == "accept")
                {
                    var missing = q.PreAll.Where(p => m.Quests.ContainsKey(p) && !turned.Contains(p)).ToList();
                    if (q.PreAny.Count > 0 && q.PreAny.Any(m.Quests.ContainsKey) && !q.PreAny.Any(turned.Contains)) missing.Add(q.PreAny.First());
                    if (missing.Count > 0 && !s.Rider) a.Problems.Add($"{q.Name} ({q.Id}) is shown but {QName(m, missing[0])} ({missing[0]}) was never handed in - step {s.No}");
                    if (held.Add(id)) { a.Pickups++; a.LowestPicked = Math.Min(a.LowestPicked ?? 99, q.Level); }
                }
                else if (!held.Contains(id))
                {
                    if (!q.Cond && !s.Rider) a.Problems.Add($"{(e.Cmd == "turnin" ? "hand-in" : "objective")} of {q.Name} ({q.Id}), which you do not have - step {s.No}");
                    continue;
                }
                else if (e.Cmd == "turnin") { held.Remove(id); turned.Add(id); }
                did = true;
            }
            if (s.Rider) continue;
            bool quests = els.Any(e => e.Cmd is "accept" or "turnin" or "complete");
            if (quests && !did) { a.Skipped++; continue; }                         // every line skipped itself: RestedXP moves on
            if (a.FirstStep == 0) { a.FirstStep = s.No; a.First = Describe(m, s); }
            if (did && a.FirstQuestStep == 0) { a.FirstQuestStep = s.No; a.FirstQuest = Describe(m, s); }
        }
        return a;
    }

    /// <summary>Arrival levels worth reporting for a guide part: every level from just above its start to just past its end.</summary>
    public static List<int> Levels(ZoneModel m, GuideOutput g)
    {
        int lo = (int)Math.Floor(m.StartLevel) + 2, hi = Math.Max(lo, (int)Math.Ceiling(g.EndLevel) + 1);
        var l = new List<int>();
        for (int v = lo; v <= hi; v++) l.Add(v);
        return l;
    }

    /// <summary>The "Arriving later" lines for the report, and problems for any race/class combination.</summary>
    public static List<string> Report(ZoneModel m, GuideOutput g)
    {
        var o = new List<string>();
        var chars = new List<(string race, long rbit, string cls, int cbit)>();
        foreach (var (rn, rb) in m.Races)
            foreach (var (cn, cb) in Game.Classes)
                if (Game.Exists(rn, cn) && (m.Opt.Race == null || rn.Equals(m.Opt.Race, StringComparison.OrdinalIgnoreCase)) && (m.Opt.Class == null || cn.Equals(m.Opt.Class, StringComparison.OrdinalIgnoreCase)))
                    chars.Add((rn, rb, cn, cb));
        o.Add($"Pickups hide once you are more than {Tuning.PickupBelow} levels above them{(Tuning.ChainLift != 0 ? " (for a chain: above its highest quest)" : "")}; a chain whose first quest was skipped never shows.");
        o.Add("Below: where the guide starts for a character who loads it at that level with nothing here done (level held fixed).");
        var problems = new Dictionary<string, List<string>>();
        // ROUTEBUILDER_ARRIVE_AS="Skyborne Druid": the start lines for that character instead of the steps for everyone
        var asWho = Environment.GetEnvironmentVariable("ROUTEBUILDER_ARRIVE_AS") is { Length: > 0 } aw ? chars.FirstOrDefault(c => (c.race + " " + c.cls).Equals(aw, StringComparison.OrdinalIgnoreCase)) : default;
        if (asWho.race != null) o.Add($"(Start lines played as {asWho.race} {asWho.cls}.)");
        foreach (int lv in Levels(m, g))
        {
            (string race, long rbit, string cls, int cbit) c0 = asWho.race != null ? asWho : m.SingleCharacter ? chars[0] : ("", 0L, "", 0);
            var e = Arrive(m, g.Lines, lv, c0.race, c0.rbit, c0.cls, c0.cbit);
            o.Add($"  level {lv}: {(e.FirstQuestStep == 0 ? "nothing left for this level" : e.FirstQuest)}" +
                  (e.FirstStep != e.FirstQuestStep && e.FirstStep > 0 ? $"  [first step shown: {e.First}]" : "") +
                  $"; {e.Pickups} pickups{(e.LowestPicked is { } lp ? $", lowest level {lp}" : "")}");
            foreach (var c in chars)
                foreach (var p in Arrive(m, g.Lines, lv, c.race, c.rbit, c.cls, c.cbit).Problems)
                    (problems.TryGetValue($"at level {lv}: {p}", out var who) ? who : problems[$"at level {lv}: {p}"] = new()).Add(c.race + " " + c.cls);
        }
        if (problems.Count == 0) o.Add($"Played at each of those levels as {chars.Count} race/class combination{(chars.Count == 1 ? "" : "s")}: nothing out of order.");
        else
        {
            o.Add($"Played at each of those levels as {chars.Count} race/class combinations: {problems.Count} PROBLEM{(problems.Count == 1 ? "" : "S")}");
            foreach (var (p, who) in problems.Take(60)) o.Add($"  ! {p} ({(who.Count == chars.Count ? "everyone" : string.Join(", ", who))})");
            if (problems.Count > 60) o.Add($"  ... and {problems.Count - 60} more");
        }
        return o;
    }
}
