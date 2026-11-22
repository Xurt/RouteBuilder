using System.Globalization;
using System.Text;
using System.Text.RegularExpressions;

namespace RouteBuilder;

/// <summary>
/// "fill": keeps a finished set of guides exactly as written (one RestedXP guide per level range, wandering through as many
/// zones as it likes, chained with #next) and adds the quests it misses. A quest is missed when it is in a zone the guide
/// already quests in, its level is inside the guide's range, and no guide of the same faction in the folder does it. Each
/// one is slotted in where it adds least walking, after anything it needs, and not before the player is high enough.
/// </summary>
public static class Filler
{
    static readonly CultureInfo Inv = CultureInfo.InvariantCulture;
    const double OtherContinent = 3000;          // yards-equivalent of a trip between maps with nothing to measure on

    // ------------------------------------------------------------------ what is read from the guides
    sealed class SrcStep
    {
        public int Line, No;                     // index of its "step" line in the guide body, and its number (1 = first)
        public string Tag = "";
        public bool Along, Hidden;               // #completewith (done as you go), #hidewindow (a label only)
        public bool Dungeon;                     // shown only to players who chose (or did not choose) a dungeon: ".dungeon WC", ".dungeon !WC"
        public AreaInfo? Area; public Pt Pos; public bool HasPos, PlainPos;
        public List<int> Accepts = new(), TurnIns = new(); public List<int> Completes = new();
        public double? XpLevel;                  // a grind step (".xp 21+23750"): the level it gets you to
        public string Text = "";                 // its first ">>" line, for the report
    }

    sealed class Guide
    {
        public string File = ""; public int Block; public string Name = "", Next = "", Faction = "";
        public bool Shared;                      // one guide for both factions, its faction lines tagged "<< Horde" / "<< Alliance"
        public List<string> Races = new();       // #defaultfor: the races the guide is written for (empty = any)
        public string HeaderTag = "";            // the guide's own "<< ..." line, its faction taken out ("Hunter": a guide for hunters only)
        public HashSet<int> OtherSide = new();   // in a shared guide: quests it does for the other faction only
        public List<string> Lines = new();       // the guide body, between RegisterGuide([[ and ]]) (or [=[ and ]=]), one entry per line
        public List<SrcStep> Steps = new();
        public int? Lo, Hi;
        public List<string> Report = new();
        public int Added;
        public List<(int Before, List<string> Lines)> Inserts = new();   // new steps, by the body line they go in front of
    }

    sealed class SrcFile
    {
        public string Path = "", Text = "", Newline = "\n";
        public List<(int Start, int End)> Bodies = new();   // character ranges of each guide body
        public List<List<Guide>> Views = new();             // per body: the guide as each faction sees it (two for a shared one)
        public IEnumerable<Guide> Guides => Views.SelectMany(v => v);
    }

    static readonly Regex GotoRx = new(@"^\.goto\s+([^,]+?)\s*,\s*(-?\d+(?:\.\d+)?)\s*,\s*(-?\d+(?:\.\d+)?)((?:\s*,\s*-?\d+(?:\.\d+)?)*)", RegexOptions.Compiled);
    static readonly Regex CmdRx = new(@"^\.(accept|turnin|complete)\s+(\d+)", RegexOptions.Compiled);
    static readonly Regex XpRx = new(@"^\.xp\s+(\d+)(?:\s*\+\s*(\d+))?", RegexOptions.Compiled);
    static readonly Regex RangeRx = new(@"^\s*(\d+)\s*-\s*(\d+)(?!\d)", RegexOptions.Compiled);

    /// <summary>A detour limit as written on the command line: yards, or none / 0 for no limit. Null if it is neither.</summary>
    static double? Detour(string s) =>
        s.Trim().ToLowerInvariant() is "none" or "off" or "unlimited" or "no" ? double.PositiveInfinity
        : double.TryParse(s, NumberStyles.Float, Inv, out double v) && v >= 0 ? v == 0 ? double.PositiveInfinity : v : null;

    static string Yd(double d) => double.IsPositiveInfinity(d) ? "none" : d.ToString("0", Inv);

    // ------------------------------------------------------------------ the command
    public static int Run(GameData data, Dictionary<string, string> opt)
    {
        string from = (opt.GetValueOrDefault("from") ?? throw new InvalidOperationException("fill needs --from <folder of guide .lua files>")).Trim().TrimEnd('"');
        if (!Directory.Exists(from)) throw new InvalidOperationException($"--from: folder not found: {from}");
        string outDir = opt.GetValueOrDefault("out", "filled");
        if (Path.GetFullPath(outDir).TrimEnd(Path.DirectorySeparatorChar).Equals(Path.GetFullPath(from).TrimEnd(Path.DirectorySeparatorChar), StringComparison.OrdinalIgnoreCase))
            throw new InvalidOperationException("--out must be a different folder from --from (the guides there are kept as they are)");
        string groupBase = opt.GetValueOrDefault("group", "RouteBuilder Forever");
        double maxDetour = opt.TryGetValue("max-detour", out var md) ? Detour(md) ?? throw new InvalidOperationException("--max-detour must be a number of yards, or none (no limit)") : double.PositiveInfinity;
        string? onlyFaction = opt.TryGetValue("faction", out var ff) ? ff.Equals("alliance", StringComparison.OrdinalIgnoreCase) ? "Alliance" : ff.Equals("horde", StringComparison.OrdinalIgnoreCase) ? "Horde" : throw new InvalidOperationException("--faction must be Horde or Alliance") : null;

        var files = new List<SrcFile>();
        foreach (var path in Directory.EnumerateFiles(from, "*.lua").OrderBy(p => p, StringComparer.OrdinalIgnoreCase))
        {
            var f = ReadFile(path, data);
            if (f.Bodies.Count > 0) files.Add(f);
        }
        if (files.Count == 0) throw new InvalidOperationException($"no guides (.lua files with RegisterGuide) in {from}");
        var guides = files.SelectMany(f => f.Guides).ToList();
        foreach (var g in guides.Where(g => g.Faction == "")) Console.WriteLine($"  {g.Name} ({Path.GetFileName(g.File)}): no << Horde / << Alliance line and no lines tagged with a faction, left as it is");
        Console.WriteLine($"{guides.Count} guides in {files.Count} files: {guides.Count(g => g.Faction == "Horde")} Horde, {guides.Count(g => g.Faction == "Alliance")} Alliance");

        foreach (var faction in new[] { "Horde", "Alliance" })
        {
            if (onlyFaction != null && faction != onlyFaction) continue;
            var mine = guides.Where(g => g.Faction == faction).ToList();
            if (mine.Count == 0) continue;
            FillFaction(data, faction, mine, maxDetour);
        }

        Directory.CreateDirectory(outDir);
        int total = 0;
        foreach (var f in files)
        {
            // files with nothing for the factions filled (no faction line, or the other faction with --faction) are not copied
            if (!f.Guides.Any(g => g.Faction.Length > 0 && (onlyFaction == null || g.Faction == onlyFaction))) continue;
            string text = Rewrite(f, groupBase, onlyFaction);
            if (!opt.ContainsKey("no-quest-text")) text = QuestText.Apply(text, data);
            text = PlainBrackets(Indent(text));
            File.WriteAllText(Path.Combine(outDir, Path.GetFileName(f.Path)), text);
            var rep = f.Guides.Where(g => g.Report.Count > 0).SelectMany(g => g.Report.Append("")).ToList();
            if (rep.Count > 0) File.WriteAllLines(Path.Combine(outDir, Path.GetFileNameWithoutExtension(f.Path) + ".report.txt"), rep);
            total += f.Guides.Sum(g => g.Added);
        }
        Console.WriteLine($"\n{total} quests added. Guides written to {Path.GetFullPath(outDir)} (a .report.txt next to each says what was added and what was left out, and why).");
        Console.WriteLine($"To pack them into the addon: .\\Make-Addon.ps1 -GuidesPath \"{outDir}\"");
        return 0;
    }

    // ------------------------------------------------------------------ reading
    static SrcFile ReadFile(string path, GameData data)
    {
        var f = new SrcFile { Path = path, Text = File.ReadAllText(path) };
        f.Newline = f.Text.Contains("\r\n") ? "\r\n" : "\n";
        int block = 0;
        foreach (Match m in RxpServices.GuideRx.Matches(f.Text))
        {
            var body = m.Groups["body"];
            f.Bodies.Add((body.Index, body.Index + body.Length));
            var lines = body.Value.Split('\n').Select(l => l.TrimEnd('\r')).ToList();
            // whose it is: a "<< Horde" line in the header, or (a guide written for both) lines tagged with either faction
            string? own = null;
            foreach (var l in lines.Select(x => x.Trim()))
            {
                if (l == "step" || l.StartsWith("step ")) break;
                if (l.StartsWith("<<")) own = RxpServices.SideOf(l[2..].Trim()) ?? own;
            }
            bool shared = own == null && lines.Any(l => Regex.IsMatch(l, @"<<[^>]*\b(Horde|Alliance)\b"));
            var views = new List<Guide>();
            foreach (var fac in own != null ? new[] { own } : shared ? new[] { "Horde", "Alliance" } : new[] { "" })
            {
                var g = new Guide { File = path, Block = block, Lines = lines, Faction = fac, Shared = shared };
                Parse(g, data);
                views.Add(g);
            }
            block++;
            f.Views.Add(views);
        }
        return f;
    }

    static readonly Dictionary<string, AreaInfo?> AreaCache = new(StringComparer.OrdinalIgnoreCase);

    static (AreaInfo? area, Pt pos) Place(string map, double x, double y, GameData data)
    {
        if (!AreaCache.TryGetValue(map, out var a))
        {
            var mm = Regex.Match(map, @"^(\d+)(?:/(\d+))?$");
            a = mm.Success ? data.Areas.Values.Where(z => z.UiMap == int.Parse(mm.Groups[1].Value)).OrderByDescending(z => z.HasBounds).ThenBy(z => z.Id).FirstOrDefault() : data.FindArea(map);
            AreaCache[map] = a;
        }
        if (a == null) return (null, default);
        bool world = map.Contains('/');
        return (a, world ? new Pt(x, y) : a.ToWorld(new Pt(x, y)));
    }

    static void Parse(Guide g, GameData data)
    {
        SrcStep? cur = null; bool skip = false; int no = 0;
        string other = g.Faction == "Horde" ? "Alliance" : g.Faction == "Alliance" ? "Horde" : "";
        for (int i = 0; i < g.Lines.Count; i++)
        {
            string l = g.Lines[i].Trim();
            if (l.Length == 0) continue;
            string tag = ""; string bare = l;
            int ti = l.LastIndexOf("<<", StringComparison.Ordinal);
            if (ti >= 0 && !l.StartsWith(">>")) { tag = l[(ti + 2)..].Trim(); bare = l[..ti].TrimEnd(); }
            // a line (or a whole step) for the other faction is not part of this faction's guide; the own faction's
            // name in a tag says nothing more here ("Shaman Horde" is "Shaman")
            bool theirs = other.Length > 0 && tag.Length > 0 && RxpServices.SideOf(tag) == other;
            if (bare == "step") { skip = theirs; if (theirs) continue; }
            else if (skip || theirs)
            {
                if (CmdRx.Match(bare) is { Success: true } om) g.OtherSide.Add(int.Parse(om.Groups[2].Value));
                continue;
            }
            if (g.Faction.Length > 0) tag = Regex.Replace(tag, @"\b(Horde|Alliance)\b", "").Trim();
            if (cur == null)
            {
                if (bare.StartsWith("#name ")) g.Name = bare[6..].Trim();
                else if (bare.StartsWith("#next ")) { string n = bare[6..].Trim(); g.Next = n[(n.LastIndexOf('\\') + 1)..].Trim(); }
                else if (bare.Length == 0 && tag.Length > 0) g.HeaderTag = tag;
                else if (bare.StartsWith("#defaultfor ")) g.Races = bare[12..].Split(new[] { ',', '/' }, StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries).ToList();
            }
            if (bare == "step")
            {
                g.Steps.Add(cur = new SrcStep { Line = i, No = ++no, Tag = tag });
                continue;
            }
            if (cur == null) continue;
            if (bare.StartsWith("#completewith")) cur.Along = true;
            else if (bare.StartsWith("#hidewindow")) cur.Hidden = true;
            else if (bare.StartsWith(".dungeon")) { cur.Dungeon = true; cur.XpLevel = null; }
            else if (bare.StartsWith(">>") && cur.Text.Length == 0) cur.Text = Regex.Replace(bare[2..], @"\|cRXP_[A-Z]+_|\|c[0-9A-Fa-f]{8}|\|r|\|T[^|]*\|t", "").Trim();
            var gm = GotoRx.Match(bare);
            if (gm.Success)
            {
                // the step's own spot is its first plain pin (map, x, y); waypoints carry a radius and a flag after them
                bool plain = gm.Groups[4].Value.Trim().Length == 0;
                if (!cur.HasPos || plain && !cur.PlainPos)
                {
                    var (a, p) = Place(gm.Groups[1].Value.Trim(), double.Parse(gm.Groups[2].Value, Inv), double.Parse(gm.Groups[3].Value, Inv), data);
                    if (a != null) { cur.Area = a; cur.Pos = p; cur.HasPos = true; cur.PlainPos = plain; }
                }
            }
            var cm = CmdRx.Match(bare);
            if (cm.Success)
            {
                int q = int.Parse(cm.Groups[2].Value);
                (cm.Groups[1].Value switch { "accept" => cur.Accepts, "turnin" => cur.TurnIns, _ => cur.Completes }).Add(q);
            }
            var xm = XpRx.Match(bare);
            if (xm.Success && tag.Length == 0 && cur.Tag.Length == 0 && !cur.Dungeon)
            {
                int lvl = int.Parse(xm.Groups[1].Value);
                double extra = xm.Groups[2].Success ? double.Parse(xm.Groups[2].Value, Inv) : 0;
                cur.XpLevel = Game.FracLevel(Game.XpAt(lvl) + extra);
            }
        }
        if (RangeRx.Match(g.Name) is { Success: true } rm) { g.Lo = int.Parse(rm.Groups[1].Value); g.Hi = int.Parse(rm.Groups[2].Value); if (g.Hi < g.Lo) (g.Lo, g.Hi) = (g.Hi, g.Lo); }
    }

    // ------------------------------------------------------------------ one faction's set
    static List<Guide> Chain(List<Guide> guides, List<string> notes)
    {
        var byName = new Dictionary<string, Guide>(StringComparer.OrdinalIgnoreCase);
        foreach (var g in guides)
            if (!byName.TryAdd(g.Name, g)) notes.Add($"two guides are called \"{g.Name}\" ({Path.GetFileName(byName[g.Name].File)} and {Path.GetFileName(g.File)}); #next goes to the first");
        var targets = guides.Select(g => g.Next).Where(n => n.Length > 0).ToHashSet(StringComparer.OrdinalIgnoreCase);
        var heads = guides.Where(g => !targets.Contains(g.Name)).OrderBy(g => g.Lo ?? 99).ThenBy(g => g.File, StringComparer.OrdinalIgnoreCase).ToList();
        var order = new List<Guide>(); var seen = new HashSet<Guide>();
        foreach (var h in heads)
            for (var g = h; g != null && seen.Add(g); g = byName.GetValueOrDefault(g.Next))
                order.Add(g);
        // anything no chain reaches (a loop of #next): by level
        foreach (var g in guides.Where(g => !seen.Contains(g)).OrderBy(g => g.Lo ?? 99)) { order.Add(g); notes.Add($"\"{g.Name}\" is not reached from the start of any #next chain; taken in level order"); }
        foreach (var g in guides.Where(g => g.Next.Length > 0 && !byName.ContainsKey(g.Next))) notes.Add($"\"{g.Name}\" has #next \"{g.Next}\", which is not a guide in the folder");
        return order;
    }

    static void FillFaction(GameData data, string faction, List<Guide> guides, double maxDetour)
    {
        var notes = new List<string>();
        var order = Chain(guides, notes);
        Console.WriteLine($"\n{faction}: {string.Join(" > ", order.Select(g => g.Name))}");
        foreach (var n in notes) Console.WriteLine("  " + n);

        // every quest the set does, and where it is handed in (guide in chain order, step)
        var inSet = new HashSet<int>();
        var handIns = new Dictionary<int, List<(int Guide, int Step)>>();
        for (int gi = 0; gi < order.Count; gi++)
            foreach (var st in order[gi].Steps)
            {
                foreach (int q in st.Accepts.Concat(st.Completes)) inSet.Add(q);
                foreach (int q in st.TurnIns)
                {
                    inSet.Add(q);
                    if (!handIns.TryGetValue(q, out var at)) handIns[q] = at = new();
                    at.Add((gi, st.No - 1));
                }
            }

        // quests a guide written for both factions does only for the other one are that faction's, not missed here
        var theirs = order.SelectMany(g => g.OtherSide).Where(q => !inSet.Contains(q)).ToHashSet();
        var run = new FactionRun { Order = order, Visits = order.Select(g => Visited(g, data)).ToList() };
        foreach (var q in order.SelectMany(g => g.Steps).SelectMany(s => s.TurnIns).Distinct())
            if (order.SelectMany(g => g.Steps).Where(s => s.TurnIns.Contains(q)).All(s => s.Tag.Length > 0 || s.Dungeon)) run.SomeOnly.Add(q);
        for (int gi = 0; gi < order.Count; gi++)
        {
            var g = order[gi];
            g.Report.Add($"{g.Name}  ({faction})   {Path.GetFileName(g.File)}");
            if (g.Lo == null) { g.Report.Add("  The name has no level range (\"15-21 ...\"), so nothing was added."); Console.WriteLine($"  {g.Name}: no level range in the name; left as it is"); continue; }
            // what the player has handed in by the time this guide starts: only what the guides leading to it do (#next),
            // not a starter guide for another race that ends in the same place
            var before = Ancestors(order, gi);
            var turnedIn = new Dictionary<int, (int Guide, int Step)>();
            foreach (var (q, at) in handIns)
                turnedIn[q] = at.Any(x => x.Guide == gi) ? at.First(x => x.Guide == gi) : at.Any(x => before.Contains(x.Guide)) ? (-1, 0) : (int.MaxValue, 0);
            // and the quests fill added to those guides
            foreach (var (q, at) in run.AddedIn) if (!turnedIn.ContainsKey(q)) turnedIn[q] = before.Contains(at) ? (-1, 0) : (int.MaxValue, 0);
            try { FillGuide(data, faction, g, gi, inSet, theirs, turnedIn, maxDetour, run); }
            catch (InvalidOperationException e) { g.Report.Add("  Nothing added: " + e.Message); Console.WriteLine($"  {g.Name}: {e.Message}"); }
        }
        // a step at the end of each guide that picked up quests it does not finish: what they are, and why
        for (int gi = 0; gi < order.Count; gi++)
        {
            var open = run.Open.Where(o => o.Value.From == gi).OrderBy(o => o.Value.Level).ThenBy(o => o.Key).ToList();
            if (open.Count == 0) continue;
            var g = order[gi];
            var lines = new List<string> { g.Shared ? "step << " + faction : "step", "    >>|cRXP_WARN_Quests picked up in this guide that it does not finish|r" };
            foreach (var (q, o) in open)
            {
                string tag = o.Tag;
                if (g.Shared) tag = tag.Length == 0 ? faction : string.Join("/", tag.Split('/').Select(a => a.Trim() + " " + faction));
                string why = o.DoneIn != null ? $"finished in {o.DoneIn}" : o.Why;
                lines.Add($"    +{Safe(o.Name)} (level {o.Level}): {Safe(why)}" + (tag.Length > 0 ? " << " + tag : ""));
            }
            g.Inserts.Insert(0, (g.Lines.Count, lines));
            g.Report.Add($"  Picked up, not finished in this guide ({open.Count}), listed in a step at its end:");
            g.Report.AddRange(open.Select(o => $"    Lvl {o.Value.Level,-2} {o.Value.Name} [{o.Key}]{(o.Value.Tag.Length > 0 ? " (" + o.Value.Tag + ")" : "")}: {(o.Value.DoneIn != null ? "finished in " + o.Value.DoneIn : o.Value.Why)}"));
        }
        // a quest picked up to be finished in a later guide that could not finish it after all
        foreach (var (q, c) in run.Carry.Where(c => !run.AddedIn.ContainsKey(c.Key)))
            order[c.From].Report.Add($"  Note: {data.Quests.GetValueOrDefault(q)?.Name ?? "?"} [{q}] is picked up here to be finished in {order[c.To].Name}, which could not fit it; finish it yourself or drop it.");
    }

    /// <summary>A quest fill picks up but cannot finish where it is picked up (its hand-in is on another continent, say).</summary>
    sealed class OpenQuest { public int From; public string Why = "", Name = "", Tag = ""; public int Level; public string? DoneIn; }

    /// <summary>What one faction's fill keeps across its guides.</summary>
    sealed class FactionRun
    {
        public List<Guide> Order = new();
        public List<HashSet<int>> Visits = new();                        // per guide: the zones and cities (parent area IDs) it goes to
        public Dictionary<int, int> AddedIn = new();                     // quest -> the guide fill handed it in in
        public Dictionary<int, (int From, int To)> Carry = new();        // quest -> picked up in one guide, finished in a later one
        public HashSet<int> SomeOnly = new();                            // quests the set hands in only on steps for some characters
        public Dictionary<int, OpenQuest> Open = new();                  // picked up, but no guide so far could finish it
    }

    /// <summary>Text for a guide line: nothing that RestedXP reads as a tag or a command.</summary>
    static string Safe(string t) => t.Replace("<<", "<").Replace(">>", ">").Replace("[[", "[").Replace("]]", "]");

    /// <summary>The zones and cities (parent area IDs) a guide takes every player to: its steps for everyone with a spot.</summary>
    static HashSet<int> Visited(Guide g, GameData data) =>
        g.Steps.Where(s => s.HasPos && !s.Hidden && !s.Dungeon && s.Tag.Length == 0 && s.Area != null).Select(s => data.Parent(s.Area!.Id)).ToHashSet();

    /// <summary>The guides (by place in the order) whose #next chains lead to this one.</summary>
    static HashSet<int> Ancestors(List<Guide> order, int gi)
    {
        var seen = new HashSet<int>(); var todo = new Stack<int>(); todo.Push(gi);
        while (todo.Count > 0)
        {
            var name = order[todo.Pop()].Name;
            for (int i = 0; i < order.Count; i++)
                if (order[i].Next.Equals(name, StringComparison.OrdinalIgnoreCase) && seen.Add(i)) todo.Push(i);
        }
        seen.Remove(gi);
        return seen;
    }

    // ------------------------------------------------------------------ one guide
    sealed class Node
    {
        public SrcStep? Src; public AreaInfo? Area; public Pt Pos; public bool HasPos; public double Level;
        public RouteTask? Task; public Cand? Cand; public Quest? Q;
        public string? NoGap;                    // a source step no new step may go in front of, and why
        public bool Dead;                        // a source step no character does ("<< skip")
    }

    static void FillGuide(GameData data, string faction, Guide g, int gi, HashSet<int> inSet, HashSet<int> theirs, Dictionary<int, (int Guide, int Step)> turnedIn, double maxDetour, FactionRun run)
    {
        int lo = g.Lo!.Value, hi = g.Hi!.Value;
        // the zones this guide quests in: objectives done there, not just a hand-in or a trainer (and never a capital city,
        // nor a dungeon trip only some players take)
        var zoneSteps = g.Steps.Where(s => s.HasPos && s.Completes.Count > 0 && s.Tag.Length == 0 && !s.Dungeon)
                               .GroupBy(s => data.Parent(s.Area!.Id))
                               .Select(x => (Area: data.Areas.GetValueOrDefault(x.Key) ?? x.First().Area!, Count: x.Count()))
                               .Where(x => x.Count >= 1 && ZoneModel.CityParent(x.Area.Id) == null && !data.Instances.Contains(x.Area.Id))
                               .OrderByDescending(x => x.Count).ToList();
        if (zoneSteps.Count == 0) throw new InvalidOperationException("it does no quest objectives outside the cities, so there is no zone to look for missed quests in");
        g.Report.Add($"  Levels {lo}-{hi}; looked for missed quests in {string.Join(", ", zoneSteps.Select(z => $"{z.Area.Name} ({z.Count} objective step{(z.Count == 1 ? "" : "s")})"))}");
        var main = zoneSteps[0].Area;

        // quest chains: what follows a quest this guide or the ones before it do (or fill added to them), wherever it is
        var earlier = Ancestors(run.Order, gi);
        var doneBy = earlier.Append(gi).SelectMany(i => run.Order[i].Steps).SelectMany(s => s.Accepts.Concat(s.TurnIns)).ToHashSet();
        foreach (var (q, at) in run.AddedIn) if (earlier.Contains(at)) doneBy.Add(q);
        var carriedIn = run.Carry.Where(c => c.Value.To == gi).Select(c => c.Key).ToHashSet();   // picked up earlier, finished here
        // quests picked up earlier on this path that no guide could finish yet: finished here if they fit
        var openIn = run.Open.Where(o => o.Value.DoneIn == null && earlier.Contains(o.Value.From)).Select(o => o.Key).ToHashSet();
        carriedIn.UnionWith(openIn);
        string FromName(int q) => run.Order[run.Carry.TryGetValue(q, out var c) && c.To == gi ? c.From : run.Open[q].From].Name;
        long fmask = Game.Races(faction).Aggregate(0L, (mk, r) => mk | r.Bit);
        bool Ours(QuestRow r) => r.Races == 0 || (r.Races & fmask) != 0;

        // areas a chain may go to: on this continent, not a dungeon
        var extra = new HashSet<int>();
        var continents = zoneSteps.Where(z => z.Area.HasBounds).Select(z => z.Area.Continent).ToHashSet();
        bool Reachable(AreaInfo? x) => x != null && x.HasBounds && continents.Contains(x.Continent) && !data.Instances.Contains(x.Id) && !zoneSteps.Any(z => z.Area.Id == x.Id);
        void AddArea(int id) { var x = data.Areas.GetValueOrDefault(data.Parent(id)) ?? data.Areas.GetValueOrDefault(id); if (Reachable(x)) extra.Add(x!.Id); }
        void AddSpawns(IEnumerable<int> npcs, IEnumerable<int> objs)
        {
            foreach (int n in npcs) if (data.Npcs.TryGetValue(n, out var nn)) foreach (int k in nn.Spawns.Keys) AddArea(k);
            foreach (int o in objs) if (data.Objects.TryGetValue(o, out var oo)) foreach (int k in oo.Spawns.Keys) AddArea(k);
        }
        foreach (int v in run.Visits[gi]) AddArea(v);                     // the cities and zones the guide goes to anyway

        var fc = new FillCfg(); ZoneModel model = null!; HashSet<int> questAreas = new(), chain = new(); var alternatives = new Dictionary<int, int>();
        for (int pass = 0; pass < 4; pass++)
        {
            model = BuildModel(data, faction, zoneSteps.Select(z => z.Area).ToList(), lo, hi, fc = new FillCfg(), extra.Select(id => data.Areas[id]).ToList());
            questAreas = new HashSet<int>();
            for (int i = 0; i < model.Areas.Count; i++) if (zoneSteps.Any(z => z.Area.Id == model.Areas[i].Id)) questAreas.Add(i);
            // the chains: starters (picked up in this guide's zones) and what follows them or what the guides do
            var roots = doneBy.Concat(carriedIn).Concat(model.Quests.Values.Where(q => !inSet.Contains(q.Id) && q.Start != null && q.Start.Cands.Any(c => questAreas.Contains(c.Area))).Select(q => q.Id)).ToHashSet();
            chain = new HashSet<int>();
            // another race's version of a quest the guides do ("Call of Earth" from Kodo Rock for tauren, from Spirit Rock for
            // orcs and trolls): the same name, after the same quest, and neither needs the other
            int? AlternativeOf(QuestRow row)
            {
                var pre = row.PreGroup.Concat(row.PreSingle).ToHashSet();
                foreach (int d in doneBy)
                    if (d != row.Id && data.Quests.TryGetValue(d, out var dr) && dr.Name == row.Name && !pre.Contains(d) && !dr.PreGroup.Concat(dr.PreSingle).Contains(row.Id)
                        && dr.PreGroup.Concat(dr.PreSingle).Any(pre.Contains)) return d;
                return null;
            }
            for (bool grew = true; grew;)
            {
                grew = false;
                var nexts = roots.Concat(chain).Select(x => data.Quests.GetValueOrDefault(x)?.NextInChain ?? 0).ToHashSet();
                foreach (var row in data.Quests.Values)
                {
                    if (chain.Contains(row.Id) || inSet.Contains(row.Id) && !carriedIn.Contains(row.Id) || !Ours(row) || row.Level > hi || row.ReqLevel > hi) continue;
                    bool next = row.PreGroup.Concat(row.PreSingle).Any(x => roots.Contains(x) || chain.Contains(x))
                             || nexts.Contains(row.Id) || carriedIn.Contains(row.Id);
                    if (next && !carriedIn.Contains(row.Id) && AlternativeOf(row) is int alt) { alternatives[row.Id] = alt; continue; }
                    if (next) { chain.Add(row.Id); grew = true; }
                }
            }
            // where they go: their givers, hand-ins and objectives; a model with those areas linked
            int had = extra.Count;
            foreach (int id in chain) { var r = data.Quests[id]; AddSpawns(r.StartNpcs.Concat(r.EndNpcs), r.StartObjects.Concat(r.EndObjects)); }
            foreach (var q in model.Quests.Values.Where(q => !inSet.Contains(q.Id) && (chain.Contains(q.Id) || q.Start != null && q.Start.Cands.Any(c => questAreas.Contains(c.Area)))))
            {
                if (q.Carried) AddSpawns(q.Row.EndNpcs, q.Row.EndObjects);
                foreach (var o in q.Unrouted) if (o.Elsewhere != null && data.FindArea(o.Elsewhere) is { } ea) AddArea(ea.Id);
            }
            if (extra.Count == had) break;
        }
        var chainAreas = extra.Where(id => !run.Visits[gi].Contains(id)).Select(id => data.Areas[id].Name).OrderBy(n => n).ToList();
        if (chainAreas.Count > 0) g.Report.Add($"  Quest chains followed into: {string.Join(", ", chainAreas)}");
        // the main zone's file can set its own limit; it wins over the one from the command line
        if (fc.MaxDetour is double zd) { maxDetour = zd; g.Report.Add($"  Detour limit: {Yd(zd)} ({fc.DetourFile}, fillMaxDetour)"); }
        var visitedIdx = new HashSet<int>();
        for (int i = 0; i < model.Areas.Count; i++) if (run.Visits[gi].Contains(data.Parent(model.Areas[i].Id)) || run.Visits[gi].Contains(model.Areas[i].Id)) visitedIdx.Add(i);

        // the guide as a list of places, with the level the player is about at each
        var nodes = g.Steps.Select(s => new Node { Src = s, Area = s.Area, Pos = s.Pos, HasPos = s.HasPos && !s.Along && !s.Hidden && s.Tag.Length == 0 && !s.Dungeon }).ToList();
        SetLevels(nodes, lo, hi);
        MarkClassRuns(nodes, g, faction);
        MarkTimed(nodes, data);

        string QN(int id) => $"{data.Quests.GetValueOrDefault(id)?.Name ?? "?"} [{id}]";
        var left = new List<string>(); var added = new List<string>();
        var openCands = new List<(Quest Q, string Why)>();
        // why a quest can be picked up here but not finished: its hand-in or part of it out of reach. Not one that cannot be
        // picked up or should not be (an item starts it, timed, an escort, elite, shut out by one the set does)
        string? OpenWhy(Quest q)
        {
            if (q.Start == null || q.Arrival || q.StartItem != null || q.Optional || q.Tight || TimedMinutes(q) != null || q.DataGap) return null;
            if (!q.Carried && !q.Late) return null;
            if (theirs.Contains(q.Id) || alternatives.ContainsKey(q.Id) || !ForUs(q.Row)) return null;
            if (!fc.Forced.ContainsKey(q.Id) && q.Routed.Any(o => o.Kind is "kill" or "loot" && o.SrcNpcs.Any(n => data.Npcs.GetValueOrDefault(n) is { Rank: >= 1 }))) return null;
            if (q.Row.Exclusive.Any(inSet.Contains) || q.Row.BreadcrumbFor != 0 && inSet.Contains(q.Row.BreadcrumbFor)) return null;
            return Unfit(q, model, questAreas, inSet, data, fc.Forced.ContainsKey(q.Id), false);
        }
        var pending = new List<Quest>(); var rejected = new Dictionary<int, string>();
        // a guide written for some races (#defaultfor) or classes ("<< Alliance Hunter") gets no quests only other characters can take
        var combos = Combos(g, faction);
        var raceBit = Game.Races(faction).ToDictionary(r => r.Name, r => r.Bit); var clsBit = Game.Classes.ToDictionary(c => c.Name, c => c.Bit);
        bool ForUs(QuestRow r) => combos.Any(rc => (r.Races == 0 || (r.Races & raceBit[rc.Race]) != 0) && (r.Classes == 0 || (r.Classes & clsBit[rc.Cls]) != 0));
        string who = string.Join(" ", new[] { string.Join("/", g.Races), g.HeaderTag }.Where(x => x.Length > 0));
        foreach (var q in model.Quests.Values.OrderBy(q => q.Level).ThenBy(q => q.Id))
        {
            bool carried = carriedIn.Contains(q.Id);
            if (inSet.Contains(q.Id) && !carried) continue;
            bool inChain = chain.Contains(q.Id);
            // a quest only starts a chain where this guide quests; one that follows another can be picked up anywhere
            if (!inChain && !carried && (q.Start == null || q.Start.Cands.All(c => !questAreas.Contains(c.Area)) || q.Level < lo)) continue;
            int alt = q.PreAll.Concat(q.PreAny).FirstOrDefault(alternatives.ContainsKey);
            string? why = theirs.Contains(q.Id) ? $"the guides do it for the {(faction == "Horde" ? "Alliance" : "Horde")} only"
                : alternatives.ContainsKey(q.Id) ? $"another race's version of {QN(alternatives[q.Id])}, which the guides do"
                : alt != 0 && q.PreAll.Concat(q.PreAny).All(x => alternatives.ContainsKey(x) || !doneBy.Contains(x)) ? $"follows {QN(alt)}, another race's version of {QN(alternatives[alt])}"
                : !ForUs(q.Row) ? $"not for the characters this guide is for ({who})"
                : Unfit(q, model, questAreas, inSet, data, fc.Forced.ContainsKey(q.Id), carried);
            // one that would be added but cannot be finished in this guide (its hand-in on another continent, say): just the pickup
            if (why != null && !carried && OpenWhy(q) is { } ow) { openCands.Add((q, ow)); continue; }
            if (why != null) { if (!openIn.Contains(q.Id)) left.Add(Line(q, carried ? $"picked up in {FromName(q.Id)}, but {why}" : why)); rejected[q.Id] = why; continue; }
            pending.Add(q);
        }
        foreach (int q in carriedIn.Where(q => !model.Quests.ContainsKey(q) && !openIn.Contains(q)))
            left.Add($"{data.Quests.GetValueOrDefault(q)?.Name ?? "?"} [{q}]: picked up in {FromName(q)}, but it is not in this guide's zones after all");

        // the first later guide (on this guide's path) that goes to all of a quest's other places soon enough not to outlevel it
        (int To, string Name)? LaterGuide(Quest q)
        {
            if (q.Row.TimeLimit != null) return null;
            var places = q.Routed.SelectMany(o => o.Cands.Take(1)).Append(q.End!.Cands[0]).Select(c => data.Parent(model.Areas[c.Area].Id)).ToHashSet();
            for (int t = gi + 1; t < run.Order.Count; t++)
            {
                var tg = run.Order[t];
                if (tg.Lo == null || !Ancestors(run.Order, t).Contains(gi)) continue;
                if (tg.Lo > q.Level + CarryLevels) break;
                if (places.All(run.Visits[t].Contains)) return (t, tg.Name);
            }
            return null;
        }
        // a quest whose places are all outside where this guide goes, and whose chain does not come back here: picked up
        // now, finished later (a trip now would only be for that)
        bool LeavesForGood(Quest q)
        {
            bool Out(RouteTask? t) => t != null && t.Cands.All(c => !visitedIdx.Contains(c.Area));
            if (!Out(model.Find(TaskKind.TurnIn, q.Id)) || Enumerable.Range(0, q.Routed.Count).Any(k => !Out(model.Find(TaskKind.Objective, q.Id, k)))) return false;
            var after = model.Quests.Values.Where(f => chain.Contains(f.Id) && (f.PreAll.Contains(q.Id) || f.PreAny.Contains(q.Id) || q.Row.NextInChain == f.Id)).ToList();
            return !after.Any(f => !Out(model.Find(TaskKind.TurnIn, f.Id)) || Enumerable.Range(0, f.Routed.Count).Any(k => !Out(model.Find(TaskKind.Objective, f.Id, k))));
        }

        var placedHere = new Dictionary<int, Node>();     // quest -> the node of its new hand-in
        var candIds = pending.Select(q => q.Id).ToHashSet();
        while (pending.Count > 0)
        {
            // a quest that needs another missed quest goes after it
            var q = pending.FirstOrDefault(p => p.PreAll.Concat(p.PreAny).All(x => !candIds.Contains(x) || placedHere.ContainsKey(x) || rejected.ContainsKey(x))) ?? pending[0];
            pending.Remove(q);
            bool forced = fc.Forced.TryGetValue(q.Id, out var forcedBy), carried = carriedIn.Contains(q.Id);
            double limit = forced ? double.PositiveInfinity : maxDetour;
            string? why, done;
            var later = carried ? null : LaterGuide(q);
            bool pickOnly = later != null && LeavesForGood(q);
            if (pickOnly) why = TryPlace(q, model, nodes, gi, g, turnedIn, placedHere, rejected, questAreas, visitedIdx, limit, data, PlaceMode.PickupOnly, out done);
            else
            {
                why = TryPlace(q, model, nodes, gi, g, turnedIn, placedHere, rejected, questAreas, visitedIdx, limit, data, carried ? PlaceMode.Finish : PlaceMode.Whole, out done);
                // it does not fit whole here: picked up now and finished later, if a later guide can
                if (why != null && later != null && !why.StartsWith("needs ")
                    && TryPlace(q, model, nodes, gi, g, turnedIn, placedHere, rejected, questAreas, visitedIdx, limit, data, PlaceMode.PickupOnly, out var d2) == null)
                { why = null; done = d2; pickOnly = true; }
            }
            // nowhere is high enough for its objectives, and no later guide takes it: just the pickup, listed at the end
            if (why != null && !carried && why.StartsWith("no place in the route where the player is high enough") && !q.Tight && TimedMinutes(q) == null)
            {
                openCands.Add((q, "the guide does not get you high enough for its objectives"));
                continue;
            }
            if (why != null && openIn.Contains(q.Id)) continue;   // still open; the guide it was picked up in lists it
            if (why != null)
            {
                // it follows one picked up here and finished later: it is for that guide
                if (q.PreAll.Concat(q.PreAny).FirstOrDefault(p => run.Carry.TryGetValue(p, out var c) && c.From == gi) is int cp and > 0)
                    why = $"follows {QN(cp)}, which is finished in {run.Order[run.Carry[cp].To].Name}; it is looked at there";
                rejected[q.Id] = why;
                left.Add(Line(q, carried ? $"picked up in {FromName(q.Id)}, but {why}" : why));
                continue;
            }
            if (pickOnly) { run.Carry[q.Id] = (gi, later!.Value.To); inSet.Add(q.Id); added.Add(done + $"; objectives and hand-in in {later.Value.Name}"); continue; }
            added.Add(done + (forced ? $" (forced in by include in {forcedBy})" : "") + (carried ? $" (picked up in {FromName(q.Id)})" : ""));
            inSet.Add(q.Id); run.AddedIn[q.Id] = gi;
            if (run.Open.TryGetValue(q.Id, out var oq)) oq.DoneIn = g.Name;
        }

        // the quests that can only be picked up here: their pickups, after everything else
        foreach (var (q, ow) in openCands.OrderBy(o => o.Q.Level).ThenBy(o => o.Q.Id))
        {
            if (inSet.Contains(q.Id)) continue;
            string? why = TryPlace(q, model, nodes, gi, g, turnedIn, placedHere, rejected, questAreas, visitedIdx, maxDetour, data, PlaceMode.PickupOnly, out var done);
            if (why != null) { left.Add(Line(q, $"{ow}; and {why}")); rejected[q.Id] = why; continue; }
            run.Open[q.Id] = new OpenQuest { From = gi, Why = ow, Name = q.Name, Tag = q.Tag, Level = q.Level };
            inSet.Add(q.Id);
            added.Add(done + $"; not finished here: {ow} (listed at the end of the guide)");
        }

        g.Added = added.Count;
        g.Report.Add($"  Added ({added.Count}):");
        g.Report.AddRange(added.Count > 0 ? added.Select(a => "    " + a) : new[] { "    none" });
        g.Report.Add($"  Left out ({left.Count}):");
        g.Report.AddRange(left.Count > 0 ? left.Select(a => "    " + a) : new[] { "    none" });
        Console.WriteLine($"  {g.Name}: {added.Count} added, {left.Count} left out ({string.Join(", ", zoneSteps.Select(z => z.Area.Name))})");

        // the new steps, written in front of the source step that follows them
        var steps = new List<(int before, List<string> lines)>();
        for (int i = 0; i < nodes.Count; i++)
        {
            if (nodes[i].Task == null) continue;
            int j = i; while (j + 1 < nodes.Count && nodes[j + 1].Task != null) j++;
            int before = j + 1 < nodes.Count ? nodes[j + 1].Src!.Line : g.Lines.Count;
            var lines = new List<string>();
            for (int k = i; k <= j;)
            {
                // a pickup and hand-in at the same NPC, one after another, are one step
                int e = k; while (e + 1 <= j && SameStop(nodes[k], nodes[e + 1])) e++;
                lines.AddRange(Render(nodes.GetRange(k, e - k + 1), model, data, turnedIn, gi, g.Shared ? faction : "", run.SomeOnly));
                k = e + 1;
            }
            steps.Add((before, lines));
            i = j;
        }
        g.Inserts = steps;
    }

    static string Line(Quest q, string why) => $"Lvl {q.Level,-2} {q.Name} [{q.Id}]{(q.Tag.Length > 0 ? " (" + q.Tag + ")" : "")}: {why}";

    /// <summary>What the guide's zone files say about filling: the main zone's detour limit, and the quests their "include" lists force in.</summary>
    sealed class FillCfg { public double? MaxDetour; public string? DetourFile; public Dictionary<int, string> Forced = new(); }

    static ZoneModel BuildModel(GameData data, string faction, List<AreaInfo> zones, int lo, int hi, FillCfg fc, List<AreaInfo>? extra = null)
    {
        var main = zones[0];
        ZoneConfig cfg; bool own = false;
        string? ZoneFile(AreaInfo z) => new[] { Path.Combine("zones", z.Name + ".json"), Path.Combine(AppContext.BaseDirectory, "zones", z.Name + ".json") }.FirstOrDefault(File.Exists);
        string? file = ZoneFile(main);
        if (file != null) { cfg = ZoneConfig.Load(file); own = true; } else cfg = new ZoneConfig();
        if (cfg.FillMaxDetour is double d)
        {
            fc.MaxDetour = d > 0 ? d : d == 0 ? double.PositiveInfinity : throw new InvalidOperationException($"zones/{main.Name}.json: fillMaxDetour must be a number of yards (0 = no limit)");
            fc.DetourFile = $"zones/{main.Name}.json";
        }
        var include = new List<int>();
        foreach (int q in cfg.Include) { include.Add(q); fc.Forced.TryAdd(q, $"zones/{main.Name}.json"); }
        // the main zone's file keeps its corrections and its linked cities (its points may refer to them); the other zones
        // of the guide are linked areas too, and their files lend their exclusions and inclusions
        var links = cfg.LinkedAreas?.ToList() ?? data.Areas.Values.Where(a => ZoneModel.CityParent(a.Id) == main.Id).Select(a => new LinkedAreaFix { Area = a.Id.ToString() }).ToList();
        foreach (var z in zones.Skip(1))
        {
            links.Add(new LinkedAreaFix { Area = z.Id.ToString() });
            string? zf = ZoneFile(z);
            if (zf == null) continue;
            var other = ZoneConfig.Load(zf);
            foreach (var (k, why) in other.Exclude) cfg.Exclude.TryAdd(k, why);
            foreach (int q in other.Include) { include.Add(q); fc.Forced.TryAdd(q, $"zones/{z.Name}.json"); }
        }
        // the cities and zones quest chains go to: linked too, so their givers, hand-ins and objectives have places
        foreach (var x in extra ?? new())
            if (x.Id != main.Id && !links.Any(l => l.Area == x.Id.ToString() || data.FindArea(l.Area)?.Id == x.Id)) links.Add(new LinkedAreaFix { Area = x.Id.ToString() });
        // excluded wins over included, as in a build
        foreach (var k in cfg.Exclude.Keys) if (int.TryParse(k, out int ex)) { include.Remove(ex); fc.Forced.Remove(ex); }
        cfg.LinkedAreas = links; cfg.MinLevel = lo - CarryLevels; cfg.MaxLevel = hi; cfg.Include = include.Distinct().ToList(); cfg.Steps = new(); cfg.Start = null; cfg.StartLevel = lo;
        var bo = new BuildOptions { Faction = faction, MinLevel = lo - CarryLevels, MaxLevel = hi, StartLevel = lo, NoHearth = true };
        try { return new ZoneModel(data, main, cfg, bo); }
        catch (InvalidOperationException e) when (own) { throw new InvalidOperationException($"zones/{main.Name}.json: {e.Message}"); }
    }

    /// <summary>The race/class pairs a guide is for: its faction, cut down by #defaultfor and by its own "&lt;&lt; ..." line.</summary>
    static List<(string Race, string Cls)> Combos(Guide g, string faction)
    {
        var races = Game.Races(faction).Where(r => g.Races.Contains(r.Name, StringComparer.OrdinalIgnoreCase)).ToList();
        if (races.Count == 0) races = Game.Races(faction).ToList();
        var all = races.SelectMany(r => Game.Classes.Where(c => Game.Exists(r.Name, c.Name)).Select(c => (r.Name, c.Name))).ToList();
        var mine = all.Where(rc => Verifier.Applies(g.HeaderTag, rc.Item1, rc.Item2, faction)).ToList();
        return mine.Count > 0 ? mine : all;
    }

    /// <summary>
    /// Steps for some races or classes ("step &lt;&lt; Priest/Mage/Warlock") come in runs between steps for everyone. A run that,
    /// taken together, every character does (one step for warlocks, the next for everyone else) is part of the route: its
    /// spots count when measuring a detour. Nothing new goes in the middle of a run, nor straight after a run only some
    /// characters do (they would be sent off from wherever that run left them).
    /// </summary>
    static void MarkClassRuns(List<Node> nodes, Guide g, string faction)
    {
        var combos = Combos(g, faction);
        bool Anyone(SrcStep s) => combos.Any(rc => Verifier.Applies(s.Tag, rc.Race, rc.Cls, faction));
        // a dungeon step is for some players (those who chose that dungeon, or those who did not), like a class step
        bool Some(SrcStep s) => s.Tag.Length > 0 || s.Dungeon;
        bool Does(SrcStep s, (string Race, string Cls) rc) => !s.Dungeon && Verifier.Applies(s.Tag, rc.Race, rc.Cls, faction);
        // steps no character does ("<< skip") are left out of the runs: they neither start nor break one
        foreach (var n in nodes) n.Dead = n.Src!.Tag.Length > 0 && !Anyone(n.Src);
        var live = nodes.Where(n => !n.Dead).ToList();
        for (int i = 0; i < live.Count;)
        {
            if (!Some(live[i].Src!)) { i++; continue; }
            int j = i; while (j + 1 < live.Count && Some(live[j + 1].Src!)) j++;
            var run = live.GetRange(i, j - i + 1);
            var pinned = run.Where(n => n.Src!.HasPos && !n.Src.Along && !n.Src.Hidden).ToList();
            bool everyone = pinned.Count > 0 && combos.All(rc => pinned.Any(n => Does(n.Src!, rc)));
            if (everyone) foreach (var n in pinned) n.HasPos = true;
            foreach (var n in run.Skip(1)) n.NoGap ??= "in the middle of steps for some classes, races or dungeon choices";
            if (!everyone && j + 1 < live.Count) live[j + 1].NoGap ??= "straight after steps only some players do";
            i = j + 1;
        }
        // a step no one does takes the rule of the next step anyone does
        string? next = null;
        for (int i = nodes.Count - 1; i >= 0; i--)
            if (live.Contains(nodes[i])) next = nodes[i].NoGap; else nodes[i].NoGap ??= next;
    }

    /// <summary>
    /// While a timed quest or an escort the guide does is under way (from its pickup to its hand-in, or for an escort to
    /// the step that finishes it), nothing new goes in.
    /// </summary>
    static void MarkTimed(List<Node> nodes, GameData data)
    {
        var steps = nodes.Select(n => n.Src!).ToList();
        foreach (int q in steps.SelectMany(s => s.Accepts).Distinct())
        {
            if (!data.Quests.TryGetValue(q, out var row)) continue;
            bool timed = row.TimeLimit != null, escort = row.Escort;
            if (!timed && !escort) continue;
            int a = steps.FindIndex(s => s.Accepts.Contains(q));
            int e = steps.FindIndex(a + 1, s => s.TurnIns.Contains(q));
            if (escort && !timed)
            {
                int c = steps.FindLastIndex(s => s.Completes.Contains(q));
                if (c > a && (e < 0 || c < e)) e = c;
            }
            if (e < 0) e = steps.Count - 1;
            string why = $"while {row.Name} [{q}] is under way ({(timed ? "timed" : "escort")})";
            for (int i = a + 1; i <= e; i++) nodes[i].NoGap ??= why;
        }
    }

    /// <summary>The player's level at each step: from the guide's range, pinned to its own grind steps, straight in between.</summary>
    static void SetLevels(List<Node> nodes, int lo, int hi)
    {
        var anchors = new List<(int i, double lvl)> { (0, lo) };
        for (int i = 0; i < nodes.Count; i++)
            if (nodes[i].Src?.XpLevel is { } x && x > anchors[^1].lvl) anchors.Add((i, x));
        if (hi > anchors[^1].lvl) anchors.Add((nodes.Count, hi));
        for (int i = 0; i < nodes.Count; i++)
        {
            int k = anchors.FindLastIndex(a => a.i <= i);
            if (k == anchors.Count - 1) { nodes[i].Level = anchors[k].lvl; continue; }
            var (a, b) = (anchors[k], anchors[k + 1]);
            nodes[i].Level = a.lvl + (b.lvl - a.lvl) * (i - a.i) / Math.Max(1, b.i - a.i);
        }
    }

    /// <summary>Why a quest the model found cannot be added, or null.</summary>
    static string? Unfit(Quest q, ZoneModel m, HashSet<int> questAreas, HashSet<int> inSet, GameData data, bool forced, bool carried)
    {
        string Where(string? place) =>
            place == null || place.StartsWith("an unknown") ? "somewhere the database has no spawn for"
            : place == "another zone" ? "somewhere this guide's zones and their chains do not reach"
            : data.FindArea(place) is { } a && data.Instances.Contains(a.Id) ? $"in a dungeon ({place})" : $"in {place}, on another continent";
        if (q.Arrival && !carried) return $"its giver is {Where(q.Origin)}";
        if (q.Carried) return $"its hand-in is {Where(q.Destination)}";
        if (q.Late) return q.DataGap ? "the database has no objectives for it" : $"part of it is {Where(q.Unrouted.FirstOrDefault()?.Elsewhere)}";
        if (!carried && (q.Optional || q.StartItem != null)) return "starts from an item";
        if (!carried && q.Start == null || !q.HasTurnin) return "no quest giver or no hand-in in the database";
        foreach (var o in q.Routed)
        {
            if (o.Cands.Count == 0) return $"\"{o.Label}\" is {Where(o.Elsewhere)}";
            if (o.Index == null && o.Command == null) return $"the database does not say which quest-log line \"{o.Label}\" is";
            if (!forced && o.Kind is "kill" or "loot" && o.SrcNpcs.Select(n => data.Npcs.GetValueOrDefault(n)).FirstOrDefault(n => n is { Rank: >= 1 }) is { } elite)
                return $"elite: {elite.Name} is {(elite.Rank == 3 ? "a boss" : elite.Rank == 4 ? "rare" : "elite")}";
        }
        if (q.Routed.Count == 0 && q.Row.HasObjectives) return "its objectives are not in the database";
        if (q.Row.Exclusive.FirstOrDefault(inSet.Contains) is int ex and > 0) return $"cannot be taken together with {data.Quests.GetValueOrDefault(ex)?.Name ?? "?"} [{ex}], which the guides do";
        if (q.Row.BreadcrumbFor != 0 && inSet.Contains(q.Row.BreadcrumbFor)) return $"leads to {data.Quests.GetValueOrDefault(q.Row.BreadcrumbFor)?.Name ?? "?"} [{q.Row.BreadcrumbFor}], which the guides already pick up";
        return null;
    }

    /// <summary>A timed quest's limit in minutes (30 when the text only says there is one), or null.</summary>
    static double? TimedMinutes(Quest q) => q.Row.TimeLimit is double t ? t > 0 ? t : 30 : null;

    /// <summary>The walk along the route from one node to another, spot to spot.</summary>
    static double RouteYards(List<Node> seq, int from, int to)
    {
        double d = 0; Node? last = null;
        for (int i = from; i <= to; i++)
        {
            if (!seq[i].HasPos) continue;
            if (last != null) d += Dist(last.Area, last.Pos, seq[i].Area, seq[i].Pos);
            last = seq[i];
        }
        return d;
    }

    static double Dist(AreaInfo? a, Pt p, AreaInfo? b, Pt q)
    {
        if (a == null || b == null) return 0;
        if (a.Id == b.Id) return p.To(q);
        if (a.HasBounds && b.HasBounds && a.Continent == b.Continent) return p.To(q) + Tuning.AreaChange;
        return OtherContinent;
    }

    /// <summary>
    /// Finds the cheapest gaps for a quest's pickup, objectives and hand-in (in that order) and puts them there. Returns
    /// why it could not, or null. Gap i is between node i-1 and node i; gap 0 (before the guide's first step) is not used.
    /// </summary>
    enum PlaceMode { Whole, PickupOnly, Finish }
    const int CarryLevels = 3;                   // a quest picked up to finish later: the later guide starts at most this far above its level

    static string? TryPlace(Quest q, ZoneModel m, List<Node> nodes, int gi, Guide g, Dictionary<int, (int Guide, int Step)> turnedIn,
                            Dictionary<int, Node> placedHere, Dictionary<int, string> rejected, HashSet<int> questAreas, HashSet<int> visitedIdx,
                            double maxDetour, GameData data, PlaceMode mode, out string? done)
    {
        done = null;
        string QName(int p) => $"{data.Quests.GetValueOrDefault(p)?.Name ?? "?"} [{p}]";
        // the earliest gap the pickup can go in: after whatever it needs
        int minGap = 1;
        int? Ready(int p)
        {
            if (placedHere.TryGetValue(p, out var pn)) return nodes.IndexOf(pn) + 1;
            if (turnedIn.TryGetValue(p, out var at))
            {
                if (at.Guide < gi) return 1;
                if (at.Guide == gi) return nodes.FindIndex(n => n.Src == g.Steps[at.Step]) + 1;
            }
            return null;
        }
        foreach (int p in mode == PlaceMode.Finish ? new HashSet<int>() : q.PreAll)
        {
            if (Ready(p) is int r) { minGap = Math.Max(minGap, r); continue; }
            if (rejected.TryGetValue(p, out var pw)) return $"needs {QName(p)}, which was left out too";
            return turnedIn.TryGetValue(p, out var at) ? $"needs {QName(p)}, which the guides hand in later or on another path" : $"needs {QName(p)}, which none of the guides do";
        }
        if (q.PreAny.Count > 0 && mode != PlaceMode.Finish)
        {
            var ok = q.PreAny.Select(Ready).Where(r => r != null).Select(r => r!.Value).ToList();
            if (ok.Count == 0)
            {
                string what = q.PreAny.Count == 1 ? QName(q.PreAny.First()) : "one of " + string.Join(", ", q.PreAny.Select(QName));
                return q.PreAny.All(rejected.ContainsKey) ? $"needs {what}, which {(q.PreAny.Count == 1 ? "was" : "were all")} left out too"
                     : q.PreAny.Any(turnedIn.ContainsKey) ? $"needs {what}, which the guides hand in later or on another path" : $"needs {what}, which none of the guides do";
            }
            minGap = Math.Max(minGap, ok.Min());
        }

        var acc = m.Find(TaskKind.Accept, q.Id); var turn = m.Find(TaskKind.TurnIn, q.Id)!;
        if (acc == null && mode != PlaceMode.Finish) return "no quest giver in the database";
        var objs = Enumerable.Range(0, q.Routed.Count).Select(k => m.Find(TaskKind.Objective, q.Id, k)!).ToList();
        bool tight = q.Tight && objs.Count > 0;
        bool AccOk(double lvl, Cand _) => lvl >= q.Req && lvl + 1 >= q.Level;
        bool ObjOk(int k, double lvl, Cand c)
        {
            var o = q.Routed[k];
            double need = o.Kind is "kill" or "loot" ? Math.Floor(c.MobLevel ?? o.MobLevel ?? q.Level) - Tuning.MobMargin : q.Level - Tuning.Margin;
            return lvl >= Math.Max(need, o.MinLevel);
        }

        // The cheapest place for a task in seq, in front of seq[i] for i in from..to (seq.Count = at the end): the extra walking
        // from the last spot before it to the first spot after it. Only places in the guide's own zones are used.
        (int at, Cand? c, double cost) Best(List<Node> seq, RouteTask t, int from, int to, Func<double, Cand, bool> allowed)
        {
            int n = seq.Count;
            var pa = new AreaInfo?[n + 1]; var pp = new Pt[n + 1]; var na = new AreaInfo?[n + 1]; var np = new Pt[n + 1];
            AreaInfo? la = null; Pt lp = default;
            for (int i = 0; i <= n; i++) { pa[i] = la; pp[i] = lp; if (i < n && seq[i].HasPos) { la = seq[i].Area; lp = seq[i].Pos; } }
            la = null; lp = default;
            for (int i = n; i >= 0; i--) { if (i < n && seq[i].HasPos) { la = seq[i].Area; lp = seq[i].Pos; } na[i] = la; np[i] = lp; }
            // a gap takes the rule of the guide's own step after it (new steps put in earlier sit in front of that step too)
            var shut = new bool[n + 1];
            for (int i = n - 1; i >= 0; i--) shut[i] = seq[i].Src != null ? seq[i].NoGap != null : shut[i + 1];
            // where the player is: the last (and next) spot of any step someone does, also one for some classes or a
            // "do this as you go" pin, so a gap is only next to a zone when nothing elsewhere comes in between
            var pz = new AreaInfo?[n + 1]; var nz = new AreaInfo?[n + 1];
            AreaInfo? lz = null;
            for (int i = 0; i <= n; i++) { pz[i] = lz; if (i < n && Pin(seq[i]) is { } z) lz = z; }
            lz = null;
            for (int i = n; i >= 0; i--) { if (i < n && Pin(seq[i]) is { } z) lz = z; nz[i] = lz; }
            var cs = t.Cands;
            (int, Cand?, double) best = (-1, null, double.PositiveInfinity);
            for (int i = Math.Max(1, from); i <= Math.Min(n, to); i++)
            {
                if (shut[i]) continue;
                double lvl = seq[i - 1].Level;
                foreach (var c in cs)
                {
                    if (!allowed(lvl, c)) continue;
                    var a = m.Areas[c.Area];
                    // only where the route is in that zone: right after a step there, or right before one. Next to a step in
                    // another zone only the walk on this side counts (the trip between zones, a flight or a boat, is the guide's)
                    bool pS = Same(pa[i], a) && Same(pz[i], a), nS = Same(na[i], a) && Same(nz[i], a);
                    // a place the guide never goes to (a quest chain's city or next zone) is a trip there and back
                    bool trip = !pS && !nS && !visitedIdx.Contains(c.Area);
                    if (!pS && !nS && !trip) continue;
                    double d = pS && nS || trip ? Dist(pa[i], pp[i], a, c.Pos) + Dist(a, c.Pos, na[i], np[i]) - Dist(pa[i], pp[i], na[i], np[i])
                             : pS ? Dist(pa[i], pp[i], a, c.Pos) : Dist(a, c.Pos, na[i], np[i]);
                    if (d < best.Item3) best = (i, c, d);
                }
            }
            return best;
        }
        static AreaInfo? Pin(Node x) => x.Src == null ? x.Area : x.Src.HasPos && !x.Dead ? x.Src.Area : null;
        bool Same(AreaInfo? x, AreaInfo y) => x != null && (x.Id == y.Id || data.Parent(x.Id) == data.Parent(y.Id));
        Node Make(RouteTask t, Cand c, double lvl) => new() { Task = t, Cand = c, Q = q, Area = m.Areas[c.Area], Pos = c.Pos, HasPos = true, Level = lvl };

        // every place for the pickup; for each, the objectives and then the hand-in where they add least after it
        double bestTotal = double.PositiveInfinity; List<Node>? bestSeq = null; Node? bestAcc = null, bestTurn = null; List<Node> bestObjs = new();
        bool levelOk = false, timedCut = false;
        if (mode == PlaceMode.PickupOnly)
        {
            // just the pickup, where it adds least; the rest is for a later guide
            for (int ga = Math.Max(1, minGap); ga <= nodes.Count; ga++)
            {
                double lvl = nodes[ga - 1].Level;
                if (!AccOk(lvl, null!)) continue;
                levelOk = true;
                var (_, ac, total) = Best(nodes, acc!, ga, ga, AccOk);
                if (ac == null || total >= bestTotal) continue;
                var seq = new List<Node>(nodes); var an = Make(acc!, ac, lvl); seq.Insert(ga, an);
                bestTotal = total; bestSeq = seq; bestAcc = an;
            }
            if (bestSeq == null) return !levelOk ? $"needs level {q.Req}; this guide reaches about {nodes.Max(x => x.Level):0.0}" : "no place in the route for its pickup";
            if (bestTotal > maxDetour) return $"too far off the route: about {bestTotal:0} yd of extra walking (the limit is {maxDetour:0} yd: --max-detour, or fillMaxDetour in the zone file)";
            nodes.Clear(); nodes.AddRange(bestSeq);
            done = Line(q, $"pickup {Where(bestAcc!)}; about {Math.Max(0, bestTotal):0} yd of extra walking");
            return null;
        }
        for (int ga = Math.Max(1, minGap); ga <= nodes.Count; ga++)
        {
            double lvl = nodes[ga - 1].Level;
            if (mode == PlaceMode.Whole && !AccOk(lvl, null!)) continue;
            levelOk = true;
            List<Node> seq; Node? an = null; double total = 0;
            if (mode == PlaceMode.Finish) { if (ga > Math.Max(1, minGap)) break; seq = new List<Node>(nodes); }   // already in the quest log
            else
            {
                var (_, ac, t0) = Best(nodes, acc!, ga, ga, AccOk);
                if (ac == null || t0 >= bestTotal) continue;
                total = t0; seq = new List<Node>(nodes); an = Make(acc!, ac, lvl); seq.Insert(ga, an);
            }
            int start = an != null ? seq.IndexOf(an) + 1 : 1;
            var on = new List<Node>(); bool fail = false;
            for (int k = 0; k < objs.Count && !fail; k++)
            {
                int kk = k;
                int from = tight && k == 0 ? start : q.Routed[k].Seq && on.Count > 0 ? seq.IndexOf(on[^1]) + 1 : start;
                int to = tight && k == 0 ? from : int.MaxValue;
                var (oi, oc, cost) = Best(seq, objs[k], from, to, (l, c) => ObjOk(kk, l, c));
                if (oc == null) { fail = true; break; }
                var nn = Make(objs[k], oc, seq[oi - 1].Level); seq.Insert(oi, nn); on.Add(nn); total += cost;
                if (total >= bestTotal) fail = true;
            }
            if (fail) continue;
            int tf = on.Count > 0 || an != null ? on.Concat(an != null ? new[] { an } : Array.Empty<Node>()).Max(x => seq.IndexOf(x)) + 1 : start;
            var (ti, tc, tcost) = Best(seq, turn, tf, int.MaxValue, (_, _) => true);
            if (tc == null) continue;
            var tn = Make(turn, tc, seq[ti - 1].Level); seq.Insert(ti, tn); total += tcost;
            // a timed quest: its hand-in no further along the route than half its time allows on foot (fights, flights, slack)
            if (an != null && TimedMinutes(q) is double mins && RouteYards(seq, seq.IndexOf(an), seq.IndexOf(tn)) > mins * 60 * Tuning.RunSpeed / 2) { timedCut = true; continue; }
            if (total < bestTotal) { bestTotal = total; bestSeq = seq; bestAcc = an; bestTurn = tn; bestObjs = on; }
        }
        if (bestSeq == null)
        {
            double top = nodes.Max(x => x.Level);
            if (!levelOk) return top < q.Req ? $"needs level {q.Req}; this guide reaches about {top:0.0}" : $"a level {q.Level} quest; no place in the route after what it needs where the player is high enough";
            if (timedCut) return $"timed ({(q.Row.TimeLimit is > 0 ? $"{q.Row.TimeLimit:0} min" : "the database does not say how long; taken as 30 min")}): no place where its hand-in comes soon enough after the pickup";
            return "no place in the route where the player is high enough for all of its objectives";
        }
        if (bestTotal > maxDetour) return $"too far off the route: about {bestTotal:0} yd of extra walking (the limit is {maxDetour:0} yd: --max-detour, or fillMaxDetour in the zone file)";
        nodes.Clear(); nodes.AddRange(bestSeq);
        placedHere[q.Id] = bestTurn!;
        done = Line(q, (bestAcc != null ? $"pickup {Where(bestAcc)}; " : "") + (bestObjs.Count > 0 ? $"objectives {string.Join(", ", bestObjs.Select(Where).Distinct())}; " : "")
                       + $"hand-in {Where(bestTurn!)}; about {Math.Max(0, bestTotal):0} yd of extra walking");
        return null;

        string Where(Node x)
        {
            var list = bestSeq ?? nodes;
            int i = list.IndexOf(x) - 1;
            while (i >= 0 && list[i].Src == null) i--;
            string trip = x.Cand != null && !visitedIdx.Contains(x.Cand.Area) ? $" (trip to {m.Areas[x.Cand.Area].Name})" : "";
            return (i < 0 ? "at the start" : $"after step {list[i].Src!.No} ({Describe(list[i].Src!, data)})") + trip;
        }
    }

    static string Describe(SrcStep s, GameData data)
    {
        string QN(int q) => data.Quests.GetValueOrDefault(q)?.Name ?? $"quest {q}";
        if (s.TurnIns.Count > 0) return "turn in " + QN(s.TurnIns[0]);
        if (s.Accepts.Count > 0) return "accept " + QN(s.Accepts[0]);
        if (s.Completes.Count > 0) return QN(s.Completes[0]);
        return s.Text.Length > 0 ? (s.Text.Length > 50 ? s.Text[..50] + "..." : s.Text) : "a step";
    }

    // ------------------------------------------------------------------ writing the new steps
    static bool SameStop(Node a, Node b) =>
        a.Task!.Kind is TaskKind.Accept or TaskKind.TurnIn && b.Task!.Kind is TaskKind.Accept or TaskKind.TurnIn
        && a.Task.Ent == b.Task.Ent && a.Task.Tag == b.Task.Tag && a.Cand == b.Cand;

    static string GotoLine(AreaInfo a, Pt world, bool hidden = false)
    {
        var p = a.ToPercent(world);
        return string.Format(Inv, "    .goto {0},{1:0.00},{2:0.00}", a.Name, Math.Clamp(p.X, 0, 100), Math.Clamp(p.Y, 0, 100)) + (hidden ? ",0" : "");
    }

    static List<string> Render(List<Node> stop, ZoneModel m, GameData data, Dictionary<int, (int Guide, int Step)> turnedIn, int gi, string side, HashSet<int> someOnly)
    {
        var o = new List<string>(); var t0 = stop[0].Task!; string tag = t0.Tag;
        // in a guide shared by both factions every new step says whose it is ("Warrior/Rogue" -> "Warrior Horde/Rogue Horde")
        if (side.Length > 0) tag = tag.Length == 0 ? side : string.Join("/", tag.Split('/').Select(a => a.Trim() + " " + side));
        o.Add(tag.Length > 0 ? "step << " + tag : "step");
        var area = stop[0].Area!; var c = stop[0].Cand!;
        if (t0.Kind == TaskKind.Objective)
        {
            var t = t0; var q = t.Q!; var ob = t.Obj!;
            o.Add($"    .isOnQuest {q.Id}");
            o.Add("    >>" + Emitter.ObjText(ob));
            o.Add(ob.Command != null ? "    " + ob.Command : $"    .complete {q.Id},{ob.Index} --{ob.Label}");
            foreach (var extra in ob.Extra) o.Add("    " + extra);
            foreach (var (k, nm) in ob.Targets) o.Add($"    .{k} {nm}");
            var pts = ob.Patrol && ob.Loop.Count > 0 ? ob.Loop : c.Pts;
            o.Add(GotoLine(area, Geo.Busiest(pts, Tuning.LoopGroupRadius)));
            var thin = Geo.Thin(pts, 35);
            if (thin.Count > 2 && Geo.Span(thin) >= Tuning.LoopSingleSpan)
            {
                int k = Math.Clamp((int)Math.Ceiling(Geo.Span(thin) / Tuning.LoopSpacing), 2, Tuning.LoopMaxPoints);
                var pin = Geo.Busiest(pts, Tuning.LoopGroupRadius);
                foreach (var grp in Geo.KMeans(pts.Distinct().ToList(), k).Where(x => x.Count > 0))
                {
                    var wp = Geo.Busiest(grp, Tuning.LoopGroupRadius);
                    if (wp.To(pin) > 20) o.Add(GotoLine(area, wp, true));
                }
            }
            return o;
        }
        var e = t0.Ent!;
        o.Add(e.Kind == EntKind.Npc ? $"    >>Talk to |cRXP_FRIENDLY_{e.Name}|r" + (e.Patrol ? ". |cRXP_WARN_Walks around|r" : "") : $"    >>Click |cRXP_PICK_{e.Name}|r");
        if (e.Kind == EntKind.Npc) o.Add($"    .target {e.Name}");
        // the conditions first: what a pickup needs from earlier guides, and that a hand-in's quest is in the log
        foreach (var x in stop.Where(x => x.Task!.Kind == TaskKind.Accept))
            // (also one the guides hand in only for some characters: "<< Hunter" Wenikee Boltbucket before Nugget Slugs)
            foreach (int p in x.Q!.PreAll.Concat(x.Q.PreAny.Count == 1 ? x.Q.PreAny : Enumerable.Empty<int>()).Distinct().OrderBy(p => p)
                                  .Where(p => turnedIn.TryGetValue(p, out var at) && (at.Guide < gi || someOnly.Contains(p))))
                o.Add($"    .isQuestTurnedIn {p} --{data.Quests.GetValueOrDefault(p)?.Name ?? "?"}");
        var turnins = stop.Where(x => x.Task!.Kind == TaskKind.TurnIn).ToList();
        if (turnins.Count == stop.Count && turnins.Count == 1) o.Add($"    .isOnQuest {turnins[0].Q!.Id}");
        foreach (var x in stop)
        {
            var q = x.Q!;
            o.Add(x.Task!.Kind == TaskKind.Accept ? $"    .accept {q.Id}{(q.Fix.AcceptFlags is { } f ? "," + f : "")} >>Accept {q.Name}" : $"    .turnin {q.Id} >>Turn in {q.Name}");
        }
        o.Add(GotoLine(area, c.Pos));
        return o;
    }

    // ------------------------------------------------------------------ writing the files
    /// <summary>
    /// Every guide written as RegisterGuide([[ ... ]]), also one that came as a Lua long string with level brackets
    /// ([=[ ... ]=]). Inside [[ ]] a "]]" would end the guide and a "[[" is a Lua 5.1 error, so those get a space.
    /// </summary>
    /// <summary>Every line inside a step indented by four spaces; "step" lines and the guide's header lines at the margin.</summary>
    static string Indent(string text) => RxpServices.GuideRx.Replace(text, m =>
    {
        var body = m.Groups["body"];
        string nl = body.Value.Contains("\r\n") ? "\r\n" : "\n";
        var o = new List<string>(); bool inStep = false;
        foreach (var raw in body.Value.Split('\n'))
        {
            string t = raw.TrimEnd('\r').Trim();
            bool step = t == "step" || t.StartsWith("step ") || t.StartsWith("step<<");
            if (step) inStep = true;
            o.Add(t.Length == 0 || step || !inStep ? t : "    " + t);
        }
        return m.Value[..(body.Index - m.Index)] + string.Join(nl, o) + m.Value[(body.Index + body.Length - m.Index)..];
    });

    static string PlainBrackets(string text) =>
        RxpServices.GuideRx.Replace(text, m => "RegisterGuide([[" + m.Groups["body"].Value.Replace("]]", "] ]").Replace("[[", "[ [") + "]]");

    static string Rewrite(SrcFile f, string groupBase, string? onlyFaction)
    {
        var sb = new StringBuilder(); int pos = 0; string nl = f.Newline;
        int added = f.Guides.Sum(g => g.Added);
        sb.Append($"-- RouteBuilder fill, {DateTime.Now:yyyy-MM-dd}: {added} missed quest{(added == 1 ? "" : "s")} added to the guide{(f.Bodies.Count == 1 ? "" : "s")} below (see {Path.GetFileNameWithoutExtension(f.Path)}.report.txt).{nl}");
        for (int b = 0; b < f.Bodies.Count; b++)
        {
            var (start, end) = f.Bodies[b];
            sb.Append(f.Text, pos, start - pos);
            var views = f.Views[b].Where(g => g.Faction.Length > 0 && (onlyFaction == null || g.Faction == onlyFaction)).ToList();
            var lines = f.Views[b][0].Lines.ToList();
            // new steps from the back, so the line numbers in front stay right; ones at the very end go before the blank
            // lines the body ends with (so the guide's "]]" stays on a line of its own)
            int tail = lines.Count; while (tail > 0 && lines[tail - 1].Trim().Length == 0) tail--;
            foreach (var (before, add) in views.SelectMany(g => g.Inserts).OrderByDescending(x => x.Before)) lines.InsertRange(Math.Min(before, tail), add);
            int firstStep = lines.FindIndex(l => l.Trim() == "step" || l.Trim().StartsWith("step "));
            foreach (var g in views)
            {
                // its #group line: the one for its faction in a shared guide ("#group ... << Horde"), else the only one
                string group = $"#group {groupBase} ({g.Faction})" + (g.Shared ? " << " + g.Faction : "");
                int gl = lines.FindIndex(l => l.TrimStart().StartsWith("#group ") && (!g.Shared || Regex.IsMatch(l, $@"<<[^>]*\b{g.Faction}\b")));
                if (gl >= 0 && (firstStep < 0 || gl < firstStep)) lines[gl] = Regex.Match(lines[gl], @"^\s*").Value + group;
                else
                {
                    int at = Math.Max(0, lines.FindIndex(l => l.TrimStart().StartsWith("#name ")));
                    lines.Insert(at, group);
                    if (firstStep >= at) firstStep++;
                }
            }
            sb.Append(string.Join(nl, lines));
            pos = end;
        }
        sb.Append(f.Text, pos, f.Text.Length - pos);
        return sb.ToString();
    }
}
