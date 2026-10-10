using System.Globalization;
using System.Text;
using System.Text.RegularExpressions;

namespace RouteBuilder;

/// <summary>
/// Re-reads the finished guide text and plays it through as every race/class combination it is for,
/// without looking at how the router got there. Anything a real player would trip over is an error.
/// </summary>
public sealed class Verifier
{
    public readonly List<string> Errors = new(), Warnings = new();
    public int LogPeak; public string LogPeakWho = ""; public int Characters;

    static readonly HashSet<string> Commands = new()
    {
        "goto", "accept", "turnin", "complete", "collect", "xp", "isOnQuest", "isQuestTurnedIn", "isQuestComplete", "zone", "zoneskip", "hs", "cooldown",
        "subzoneskip", "home", "target", "mob", "unitscan", "use", "skipgossip", "skipgossipid", "train", "macro", "timer", "vendor", "fp", "fly", "link",
        // others RestedXP understands, for hand-written steps
        "abandon", "bankdeposit", "bankwithdraw", "bindlocation", "buy", "cast", "collectmultiple", "deathskip", "destroy", "emote", "equip", "flygoto",
        "gossip", "gossipoption", "groundgoto", "hideifcomplete", "isNotOnQuest", "isQuestAvailable", "isQuestNotComplete", "istrained", "itemcount",
        "itemStat", "maxlevel", "money", "openitem", "profession", "reputation", "skill", "skipOnQuest", "stable", "subzone", "tame", "trainer",
        "usespell", "waypoint", "xpto", "zone",
    };
    static readonly HashSet<string> StepTags = new() { "completewith", "label", "loop", "sticky", "optional", "requires", "hidewindow" };

    sealed class El { public string Cmd = ""; public string[] Args = Array.Empty<string>(); public string Tag = ""; }
    sealed class St { public string Tag = ""; public List<El> Els = new(); public string? CompleteWith, Label; public bool Text; public int No; }

    /// <summary>Same rules as the addon: "/" separates alternatives, a space means "and", "!" negates.</summary>
    public static bool Applies(string tag, string race, string cls, string faction)
    {
        if (tag.Length == 0) return true;
        foreach (var alt in tag.Split('/'))
        {
            bool all = true;
            foreach (var raw in alt.Split(' ', StringSplitOptions.RemoveEmptyEntries))
            {
                bool neg = raw.StartsWith('!'); string w = neg ? raw[1..] : raw;
                bool hit = w.Equals(race, StringComparison.OrdinalIgnoreCase) || w.Equals(cls, StringComparison.OrdinalIgnoreCase) || w.Equals(faction, StringComparison.OrdinalIgnoreCase);
                if (hit == neg) { all = false; break; }
            }
            if (all) return true;
        }
        return false;
    }

    public void Run(ZoneModel m, GuideOutput g)
    {
        var steps = Parse(g.Lines);
        var labels = steps.Where(s => s.Label != null).ToDictionary(s => s.Label!, s => s.No);
        foreach (var s in steps.Where(s => s.CompleteWith is { } c && c != "next"))
            if (!labels.TryGetValue(s.CompleteWith!, out int at)) Errors.Add($"step {s.No}: #completewith {s.CompleteWith} has no matching #label");
            else if (at < s.No) Errors.Add($"step {s.No}: #label {s.CompleteWith} comes before the step that waits for it");
        foreach (var s in steps.Where(s => s.Els.Count == 0 && !s.Text)) Errors.Add($"step {s.No} is empty");

        var chars = new List<(string race, long rbit, string cls, int cbit)>();
        foreach (var (rn, rb) in m.Races)
            foreach (var (cn, cb) in Game.Classes)
                if ((m.Opt.Race == null || rn.Equals(m.Opt.Race, StringComparison.OrdinalIgnoreCase)) && (m.Opt.Class == null || cn.Equals(m.Opt.Class, StringComparison.OrdinalIgnoreCase)))
                    chars.Add((rn, rb, cn, cb));
        Characters = chars.Count;
        var seen = new HashSet<string>();
        void Err(string s) { if (seen.Add(s)) Errors.Add(s); }

        foreach (var (race, rbit, cls, cbit) in chars)
        {
            string who = race + " " + cls;
            bool Can(Quest q) => (q.Row.Races == 0 || (q.Row.Races & rbit) != 0) && (q.Row.Classes == 0 || (q.Row.Classes & cbit) != 0);
            var held = new HashSet<int>(); var turned = new HashSet<int>(); var accepted = new HashSet<int>(); int peak = 0;
            foreach (var s in steps)
            {
                if (!Applies(s.Tag, race, cls, m.Opt.Faction)) continue;
                var els = s.Els.Where(e => Applies(e.Tag, race, cls, m.Opt.Faction)).ToList();
                bool skip = false, early = false, rider = s.CompleteWith != null && s.CompleteWith != "next";
                foreach (var e in els)
                {
                    var ids = e.Args.Select(a => int.TryParse(a, out int v) ? v : 0).Where(v => v != 0).ToList();
                    if (e.Cmd == "isQuestTurnedIn" && !ids.Any(turned.Contains)) skip = true;
                    if (e.Cmd == "isOnQuest" && !ids.Any(held.Contains)) skip = true;
                    if (e.Cmd == "isQuestComplete") skip = true;                      // only ever true on a later visit
                    if (e.Cmd == "xp" && e.Args.Length > 0 && e.Args[0].StartsWith('<')) early = true;
                }
                if (skip || (early && !els.Any(e => e.Cmd == "isQuestTurnedIn"))) continue;
                foreach (var e in els)
                {
                    if (e.Cmd is not ("accept" or "turnin" or "complete")) continue;
                    if (!int.TryParse(e.Args[0], out int qid)) { Err($"step {s.No}: bad quest number in .{e.Cmd}"); continue; }
                    if (!m.Quests.TryGetValue(Math.Abs(qid), out var q)) { Err($"step {s.No}: quest {qid} is not part of this guide"); continue; }
                    if (!Can(q)) { Err($"step {s.No}: {q.Name} is shown to {who}, who cannot take it"); continue; }
                    if (e.Cmd == "accept")
                    {
                        if (!accepted.Add(q.Id) && !rider) Err($"{q.Name} is picked up twice ({who})");
                        foreach (int p in q.PreAll) if (m.Quests.TryGetValue(p, out var pq) && pq.HasTurnin && !pq.Late && Can(pq) && !turned.Contains(p)) Err($"{q.Name} is picked up before {pq.Name} is handed in ({who})");
                        var any = q.PreAny.Where(p => m.Quests.TryGetValue(p, out var pq) && pq.HasTurnin && !pq.Late && !pq.Cond && Can(pq)).ToList();
                        if (any.Count > 0 && !any.Any(turned.Contains) && !q.Conditional) Err($"{q.Name} is picked up before any of the quests that unlock it ({who})");
                        held.Add(q.Id); peak = Math.Max(peak, held.Count);
                    }
                    else if (e.Cmd == "complete")
                    {
                        if (e.Args.Length < 2) Err($"step {s.No}: .complete without an objective number");
                        if (!held.Contains(q.Id)) Err($"an objective of {q.Name} comes before the quest is picked up ({who})");
                    }
                    else
                    {
                        if (!held.Contains(q.Id)) Err($"{q.Name} is handed in before it is picked up ({who})");
                        if (!turned.Add(q.Id)) Err($"{q.Name} is handed in twice ({who})");
                        held.Remove(q.Id);
                        if (m.Quests.Values.FirstOrDefault(x => x.Id == q.Row.BreadcrumbFor) is { } lead && accepted.Contains(lead.Id)) Err($"{q.Name} leads to {lead.Name} but is handed in after that was picked up ({who})");
                    }
                }
            }
            foreach (var q in m.Quests.Values)
            {
                if (!Can(q) || q.Cond || q.StartItem is { Passive: true }) continue;
                if (!accepted.Contains(q.Id)) Err($"{q.Name} ({q.Id}) is never picked up ({who})");
                else if (q.HasTurnin && !q.Late && !q.Optional && !turned.Contains(q.Id)) Err($"{q.Name} ({q.Id}) is never handed in ({who})");
            }
            if (peak > LogPeak) { LogPeak = peak; LogPeakWho = who; }
        }
        if (LogPeak > 40) Errors.Add($"the quest log would overflow: {LogPeak} quests held at once ({LogPeakWho}); the log holds 40");
        else if (LogPeak > 34) Warnings.Add($"the quest log gets close to full: {LogPeak} of 40 ({LogPeakWho}), before counting quests brought in from other zones");
    }

    List<St> Parse(List<string> lines)
    {
        var steps = new List<St>(); St? cur = null;
        foreach (var raw in lines)
        {
            string l = Regex.Replace(raw, "--.*$", "").Trim();            // the addon strips comments the same way
            if (l.Length == 0) continue;
            string tag = ""; int ti = l.LastIndexOf("<<", StringComparison.Ordinal);
            if (ti >= 0) { tag = l[(ti + 2)..].Trim(); l = l[..ti].TrimEnd(); }
            if (l == "step") { steps.Add(cur = new St { Tag = tag, No = steps.Count + 1 }); continue; }
            if (cur == null) continue;                                    // guide header
            if (l.StartsWith('#'))
            {
                var p = l[1..].Split(' ', 2);
                if (!StepTags.Contains(p[0])) Errors.Add($"step {cur.No}: unknown step tag #{p[0]}");
                if (p[0] == "label") cur.Label = p.Length > 1 ? p[1].Trim() : "";
                if (p[0] == "completewith") cur.CompleteWith = p.Length > 1 ? p[1].Trim() : "";
                continue;
            }
            if (l.StartsWith(">>") || l.StartsWith('+')) { cur.Text = true; continue; }
            if (!l.StartsWith('.')) { Errors.Add($"step {cur.No}: cannot read line \"{raw.Trim()}\""); continue; }
            int tx = l.IndexOf(">>", StringComparison.Ordinal);
            if (tx >= 0) l = l[..tx].TrimEnd();
            var parts = l[1..].Split(' ', 2);
            if (!Commands.Contains(parts[0])) Errors.Add($"step {cur.No}: unknown command .{parts[0]}");
            var args = parts.Length > 1 ? parts[1].Split(',').Select(a => a.Trim()).ToArray() : Array.Empty<string>();
            if (parts[0] == "goto" && (args.Length < 3 || !double.TryParse(args[1], NumberStyles.Float, CultureInfo.InvariantCulture, out _))) Errors.Add($"step {cur.No}: bad .goto");
            cur.Els.Add(new El { Cmd = parts[0], Args = args, Tag = tag });
        }
        return steps;
    }
}

public static class Report
{
    static readonly CultureInfo Inv = CultureInfo.InvariantCulture;

    public static string Write(ZoneModel m, RouteResult r, GuideOutput g, Verifier v, string guidePath, string? zoneFile, bool lastVisit, int parts)
    {
        var sb = new StringBuilder();
        void H(string s) { sb.AppendLine(); sb.AppendLine(s); sb.AppendLine(new string('-', s.Length)); }
        string Q(Quest q) => $"{q.Name} [{q.Id}, level {q.Level}{(q.Tag.Length > 0 ? ", " + q.Tag : "")}]";
        string Yd(double d) => Math.Round(d).ToString("N0", Inv) + " yd";

        sb.AppendLine($"{m.Main.Name} - {(m.SingleCharacter ? string.Join(" ", new[] { m.Opt.Race, m.Opt.Class }.Where(s => s != null)) : m.Opt.Faction)}{(parts > 1 ? $" - part {m.Visit.Number} of {parts}, planned from level {m.StartLevel.ToString("0", Inv)}" : "")}");
        sb.AppendLine($"Guide \"{g.Name}\" in group \"{g.Group}\": {(parts > 1 ? "this part has " : "")}{g.Steps} steps, {g.Stops} stops");
        sb.AppendLine($"Written to {guidePath}");
        sb.AppendLine($"Data: QuestieDB {m.Data.Version}");
        sb.AppendLine(zoneFile != null ? $"Zone file: {zoneFile}" : "Zone file: none (everything below comes straight from the database)");
        if (!m.Main.HasBounds) sb.AppendLine("QuestieDB has no world-map size for this zone, so its distances are on a nominal map: fine for comparing routes here, not real yards.");
        if (m.Rxp != null) sb.AppendLine($"RestedXP cross-check: {m.Rxp.Lines.Count} objective notes read from {m.Rxp.Files} guide files");

        H("Checks");
        sb.AppendLine(v.Errors.Count == 0
            ? $"Played through as {v.Characters} race/class combination{(v.Characters == 1 ? "" : "s")}: no problems found."
            : $"Played through as {v.Characters} race/class combination{(v.Characters == 1 ? "" : "s")}: {v.Errors.Count} PROBLEM{(v.Errors.Count == 1 ? "" : "S")}");
        foreach (var e in v.Errors.Take(60)) sb.AppendLine("  ! " + e);
        if (v.Errors.Count > 60) sb.AppendLine($"  ... and {v.Errors.Count - 60} more");
        foreach (var w in v.Warnings) sb.AppendLine("  ? " + w);
        sb.AppendLine($"Quest log: at most {v.LogPeak} of 40 held at once{(v.LogPeakWho.Length > 0 && !m.SingleCharacter ? " (" + v.LogPeakWho + ")" : "")}, not counting quests brought in from other zones.");
        int misses = r.Views.Sum(x => x.HubMisses);
        sb.AppendLine(misses == 0 ? "Every stop picks up and hands in everything on offer within reach." : $"{misses} pickups or hand-ins are within reach of a stop but planned for later.");
        int passes = r.Views.Sum(x => x.Passes);
        if (Tuning.PassMiss > 0)
            sb.AppendLine(passes == 0 ? "The route never runs past a finished quest's hand-in without stopping (judged in straight lines, so roads are not seen)."
                                      : $"{passes} time{(passes == 1 ? "" : "s")} the route runs past a finished quest's hand-in without stopping (judged in straight lines).");

        H("Route");
        sb.AppendLine($"Planned from level {m.StartLevel.ToString("0.#", Inv)}. Distances are straight lines, so real running is longer; levels are an estimate.");
        if (r.Locked)
            sb.AppendLine($"Step order kept from the last build (locks folder): {r.LockKept} steps kept, {r.LockAdded} new ones slotted in, {r.LockMoved} moved because their prerequisites changed" +
                          (r.LockDropped > 0 ? $", {r.LockDropped} no longer in the guide" : "") + ". Build with --fresh to plan from scratch.");
        if (m.Visit.Number == 1 && m.Visit.StartLevel != null)
            sb.AppendLine($"(The zone has quests below level {m.StartLevel.ToString("0", Inv)}, but too few to make a visit of, so the plan starts here. Use --start-level to change it.)");
        foreach (var x in r.Views)
        {
            string what = x == r.Views[0] ? $"{x.Tasks} tasks, {Yd(x.Travel)} on foot" + (r.Locked ? "" : $" (simply going to the nearest thing each time comes to {Yd(x.StartCost)})") : $"{x.Tasks} more tasks; their whole route comes to {Yd(x.Travel)}";
            sb.AppendLine($"  {x.Name}: {what}; ends at level {x.EndLevel.ToString("0.0", Inv)}{(x.Hearths > 0 ? $"; {x.Hearths} hearth{(x.Hearths == 1 ? "" : "s")}" : "")}{(x.Broken > 0 ? $"; {x.Broken} ORDER PROBLEMS" : "")}{(x.LevelShort > 0.05 ? $"; at its hardest you are {(x.LevelShort + Tuning.MobMargin).ToString("0.0", Inv)} levels below the mobs" : "")}");
        }
        if (m.Home != null) sb.AppendLine($"Hearthstone: set at {m.Inn!.Name} ({m.BindName}); {g.HearthSteps} hearth step{(g.HearthSteps == 1 ? "" : "s")} in the guide.");
        else sb.AppendLine("Hearthstone: not used (no inn found in this zone, or --no-hearth).");
        if (g.GrindSteps.Count > 0)
        {
            sb.AppendLine("These pickups are planned within about half a level of the level they unlock at, so the guide checks your level first.");
            sb.AppendLine("The check passes at once if you are there; if you are a little behind the prediction it asks you to grind the difference:");
            foreach (var s in g.GrindSteps) sb.AppendLine("  " + s);
        }
        if (g.RxpSteps > 0) sb.AppendLine($"{g.RxpSteps} training, vendor and flight-path step{(g.RxpSteps == 1 ? "" : "s")} taken from RestedXP's guides, each next to the quest step it follows there (--no-rxp-steps leaves them out).");
        if (g.CustomSteps > 0) sb.AppendLine($"{g.CustomSteps} hand-written step{(g.CustomSteps == 1 ? "" : "s")} from the zone file placed next to the steps they name.");
        foreach (var k in g.StepsNotPlaced) sb.AppendLine($"  ! zone file \"steps\": nothing called \"{k}\" in this guide, so no hand-written step was placed there (check the name against the locks file)");
        if (g.AsYouGo > 0) sb.AppendLine($"{g.AsYouGo} objective{(g.AsYouGo == 1 ? " is" : "s are")} also shown \"as you go\" at earlier stops inside their area; their own step finishes whatever is left (and skips itself if nothing is).");
        if (g.EarlyOffers > 0) sb.AppendLine($"{g.EarlyOffers} pickups are also offered a visit early, in case you are ahead of the predicted level (they hide themselves otherwise).");
        foreach (var s in r.Unplaced) sb.AppendLine($"  {s}: its hand-in spot is not passed again, so the step sits at the end of the guide.");

        var qs = m.Quests.Values.ToList();
        H($"Quests in the guide ({qs.Count})");
        var whole = qs.Where(q => !q.Cond && !q.Carried && !q.Late).ToList();
        sb.AppendLine($"Start to finish here: {whole.Count} ({whole.Count(q => q.Tag.Length == 0)} for everyone{string.Concat(whole.Where(q => q.Tag.Length > 0).GroupBy(q => q.Tag).OrderByDescending(x => x.Count()).Select(x => $", {x.Count()} {x.Key}"))})");
        void List(string title, IEnumerable<Quest> list, Func<Quest, string> extra)
        {
            var l = list.ToList();
            if (l.Count == 0) return;
            sb.AppendLine(); sb.AppendLine($"{title} ({l.Count}):");
            foreach (var q in l.OrderBy(q => q.Level).ThenBy(q => q.Id)) sb.AppendLine($"  {Q(q)}{extra(q)}");
        }
        string Names(IEnumerable<int> ids) => string.Join(", ", ids.Select(p => $"{m.Data.Quests.GetValueOrDefault(p)?.Name ?? "?"} [{p}]"));
        List("Picked up here, handed in elsewhere - these stay in the log", qs.Where(q => q.Carried && !q.Cond), q => " -> " + q.Destination);
        List("Hand-in step only shows once complete", qs.Where(q => q.Late && !q.DataGap && !q.Cond), q => " - needs " + string.Join("; ", q.Unrouted.Select(o => $"{o.Label} ({o.Elsewhere})")));
        List("Brought in from another zone and handed in here - steps show only if you have the quest", qs.Where(q => q.Arrival), q => " <- " + q.Origin);
        List("Need a quest this guide does not hand in - steps show only once that is done", qs.Where(q => q.Conditional),
            q => " - needs " + (q.NeedAll.Count > 0 ? Names(q.NeedAll) : "") + (q.NeedAny.Count > 0 ? (q.NeedAll.Count > 0 ? " and " : "") + "one of " + Names(q.NeedAny) : "") + (q.Carried ? " -> " + q.Destination : ""));

        H("Worth checking in game");
        var gaps = qs.Where(q => q.DataGap).ToList();
        if (gaps.Count > 0)
        {
            sb.AppendLine("No objectives in the database (the hand-in step warns about it; add \"objectives\" for these to the zone file):");
            foreach (var q in gaps) sb.AppendLine($"  {Q(q)}{(q.Row.Text.Count > 0 ? ": \"" + q.Row.Text[0] + "\"" : "")}");
        }
        var guessed = qs.Where(q => !q.XpKnown && !q.Cond).ToList();
        if (guessed.Count > 0)
        {
            var noPre = guessed.Where(q => q.PreAll.Count + q.PreAny.Count == 0).ToList();
            sb.AppendLine($"{guessed.Count} quests are new in Forever: their experience is estimated, and {noPre.Count} of them list no prerequisite in the database.");
            sb.AppendLine("If one of these is offered too early or too late in game, add a \"pre\" entry for it to the zone file:");
            sb.AppendLine("  " + string.Join(", ", noPre.OrderBy(q => q.Id).Select(q => $"{q.Name} [{q.Id}]")));
        }
        foreach (var q in qs.Where(q => q.Notes.Count > 0))
            foreach (var n in q.Notes) sb.AppendLine($"  {Q(q)}: {n}");
        foreach (var n in m.Notes) sb.AppendLine("  " + n);

        if (m.Later.Count > 0)
        {
            H(lastVisit ? $"Not planned ({m.Later.Count})" : $"Put off to a later part ({m.Later.Count})");
            sb.AppendLine(lastVisit
                ? "These need a higher level than the guide reaches and could not be given a part of their own:"
                : "These need a higher level than this part ends at:");
            foreach (var kv in m.Later)
                sb.AppendLine($"  {m.Data.Quests[kv.Key].Name} [{kv.Key}, level {m.Data.Quests[kv.Key].Level}]: {kv.Value.Why}");
        }

        H($"Left out ({m.Excluded.Count})");
        foreach (var grp in m.Excluded.GroupBy(kv => Regex.Replace(kv.Value, @"^level \d+ \(needs \d+\), ", "")).OrderByDescending(x => x.Count()))
        {
            sb.AppendLine($"{grp.Key} ({grp.Count()}):");
            var names = grp.Select(kv => $"{m.Data.Quests.GetValueOrDefault(kv.Key)?.Name ?? "?"} [{kv.Key}]").ToList();
            sb.AppendLine("  " + string.Join(", ", names.Take(40)) + (names.Count > 40 ? $", ... {names.Count - 40} more" : ""));
        }
        sb.AppendLine();
        sb.AppendLine("To force one in, add its number to \"include\" in the zone file; to drop one, add it to \"exclude\" with a reason.");
        return sb.ToString();
    }
}
