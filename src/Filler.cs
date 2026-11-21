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
        public HashSet<int> OtherSide = new();   // in a shared guide: quests it does for the other faction only
        public List<string> Lines = new();       // the guide body, between RegisterGuide([[ and ]]), one entry per line
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
        double maxDetour = opt.TryGetValue("max-detour", out var md) ? Detour(md) ?? throw new InvalidOperationException("--max-detour must be a number of yards, or none (no limit)") : 1500;
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
        foreach (Match m in Regex.Matches(f.Text, @"RegisterGuide\(\s*\[\[(.*?)\]\]", RegexOptions.Singleline))
        {
            var body = m.Groups[1];
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
                else if (bare.StartsWith("#defaultfor ")) g.Races = bare[12..].Split(',', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries).ToList();
            }
            if (bare == "step")
            {
                g.Steps.Add(cur = new SrcStep { Line = i, No = ++no, Tag = tag });
                continue;
            }
            if (cur == null) continue;
            if (bare.StartsWith("#completewith")) cur.Along = true;
            else if (bare.StartsWith("#hidewindow")) cur.Hidden = true;
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
            if (xm.Success && tag.Length == 0 && cur.Tag.Length == 0)
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
            try { FillGuide(data, faction, g, gi, inSet, theirs, turnedIn, maxDetour); }
            catch (InvalidOperationException e) { g.Report.Add("  Nothing added: " + e.Message); Console.WriteLine($"  {g.Name}: {e.Message}"); }
        }
    }

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
    }

    static void FillGuide(GameData data, string faction, Guide g, int gi, HashSet<int> inSet, HashSet<int> theirs, Dictionary<int, (int Guide, int Step)> turnedIn, double maxDetour)
    {
        int lo = g.Lo!.Value, hi = g.Hi!.Value;
        // the zones this guide quests in: objectives done there, not just a hand-in or a trainer (and never a capital city)
        var zoneSteps = g.Steps.Where(s => s.HasPos && s.Completes.Count > 0 && s.Tag.Length == 0)
                               .GroupBy(s => data.Parent(s.Area!.Id))
                               .Select(x => (Area: data.Areas.GetValueOrDefault(x.Key) ?? x.First().Area!, Count: x.Count()))
                               .Where(x => x.Count >= 1 && ZoneModel.CityParent(x.Area.Id) == null && !data.Instances.Contains(x.Area.Id))
                               .OrderByDescending(x => x.Count).ToList();
        if (zoneSteps.Count == 0) throw new InvalidOperationException("it does no quest objectives outside the cities, so there is no zone to look for missed quests in");
        g.Report.Add($"  Levels {lo}-{hi}; looked for missed quests in {string.Join(", ", zoneSteps.Select(z => $"{z.Area.Name} ({z.Count} objective step{(z.Count == 1 ? "" : "s")})"))}");

        var fc = new FillCfg();
        var model = BuildModel(data, faction, zoneSteps.Select(z => z.Area).ToList(), lo, hi, fc);
        // the main zone's file can set its own limit; it wins over the one from the command line
        if (fc.MaxDetour is double zd) { maxDetour = zd; g.Report.Add($"  Detour limit: {Yd(zd)} ({fc.DetourFile}, fillMaxDetour)"); }
        var questAreas = new HashSet<int>();
        for (int i = 0; i < model.Areas.Count; i++) if (zoneSteps.Any(z => z.Area.Id == model.Areas[i].Id)) questAreas.Add(i);

        // the guide as a list of places, with the level the player is about at each
        var nodes = g.Steps.Select(s => new Node { Src = s, Area = s.Area, Pos = s.Pos, HasPos = s.HasPos && !s.Along && !s.Hidden && s.Tag.Length == 0 }).ToList();
        SetLevels(nodes, lo, hi);

        var left = new List<string>(); var added = new List<string>();
        var pending = new List<Quest>(); var rejected = new Dictionary<int, string>();
        // a guide written for some races (#defaultfor) gets no quests only other races can take
        long raceMask = Game.Races(faction).Where(r => g.Races.Contains(r.Name, StringComparer.OrdinalIgnoreCase)).Aggregate(0L, (mk, r) => mk | r.Bit);
        foreach (var q in model.Quests.Values.OrderBy(q => q.Level).ThenBy(q => q.Id))
        {
            if (inSet.Contains(q.Id)) continue;
            string? why = theirs.Contains(q.Id) ? $"the guides do it for the {(faction == "Horde" ? "Alliance" : "Horde")} only"
                : raceMask != 0 && q.Row.Races != 0 && (q.Row.Races & raceMask) == 0 ? $"for other races; this guide is for {string.Join(", ", g.Races)}"
                : raceMask != 0 && q.Row.Classes != 0 && !Game.Races(faction).Where(r => (r.Bit & raceMask) != 0 && (q.Row.Races == 0 || (q.Row.Races & r.Bit) != 0))
                      .Any(r => Game.Classes.Any(c => (q.Row.Classes & c.Bit) != 0 && Game.Exists(r.Name, c.Name))) ? $"for a class that {string.Join(", ", g.Races)} cannot be"
                : Unfit(q, model, questAreas, inSet, data, fc.Forced.ContainsKey(q.Id));
            if (why != null) { left.Add(Line(q, why)); rejected[q.Id] = why; continue; }
            pending.Add(q);
        }
        var placedHere = new Dictionary<int, Node>();     // quest -> the node of its new hand-in
        var candIds = pending.Select(q => q.Id).ToHashSet();
        while (pending.Count > 0)
        {
            // a quest that needs another missed quest goes after it
            var q = pending.FirstOrDefault(p => p.PreAll.Concat(p.PreAny).All(x => !candIds.Contains(x) || placedHere.ContainsKey(x) || rejected.ContainsKey(x))) ?? pending[0];
            pending.Remove(q);
            bool forced = fc.Forced.TryGetValue(q.Id, out var forcedBy);
            string? why = TryPlace(q, model, nodes, gi, g, turnedIn, placedHere, rejected, questAreas, forced ? double.PositiveInfinity : maxDetour, data, out string? done);
            if (why != null) { rejected[q.Id] = why; left.Add(Line(q, why)); continue; }
            added.Add(done! + (forced ? $" (forced in by include in {forcedBy})" : "")); inSet.Add(q.Id);
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
                lines.AddRange(Render(nodes.GetRange(k, e - k + 1), model, data, turnedIn, gi, g.Shared ? faction : ""));
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

    static ZoneModel BuildModel(GameData data, string faction, List<AreaInfo> zones, int lo, int hi, FillCfg fc)
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
        // excluded wins over included, as in a build
        foreach (var k in cfg.Exclude.Keys) if (int.TryParse(k, out int ex)) { include.Remove(ex); fc.Forced.Remove(ex); }
        cfg.LinkedAreas = links; cfg.MinLevel = lo; cfg.MaxLevel = hi; cfg.Include = include.Distinct().ToList(); cfg.Steps = new(); cfg.Start = null; cfg.StartLevel = lo;
        var bo = new BuildOptions { Faction = faction, MinLevel = lo, MaxLevel = hi, StartLevel = lo, NoHearth = true };
        try { return new ZoneModel(data, main, cfg, bo); }
        catch (InvalidOperationException e) when (own) { throw new InvalidOperationException($"zones/{main.Name}.json: {e.Message}"); }
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
    static string? Unfit(Quest q, ZoneModel m, HashSet<int> questAreas, HashSet<int> inSet, GameData data, bool forced)
    {
        if (q.Arrival) return "starts outside this guide's zones";
        if (q.Carried) return $"handed in outside this guide's zones ({q.Destination})";
        if (q.Late) return q.DataGap ? "the database has no objectives for it" : "part of it is outside this guide's zones";
        if (q.Optional || q.StartItem != null) return "starts from an item";
        if (q.Start == null || !q.HasTurnin) return "no quest giver or no hand-in in the database";
        if (q.Start.Cands.All(c => !questAreas.Contains(c.Area))) return $"picked up in {m.Areas[q.Start.Cands[0].Area].Name}, not one of this guide's zones";
        if (q.End!.Cands.All(c => !questAreas.Contains(c.Area))) return $"handed in at {m.Areas[q.End.Cands[0].Area].Name}, not one of this guide's zones";
        foreach (var o in q.Routed)
        {
            if (o.Cands.All(c => !questAreas.Contains(c.Area))) return $"\"{o.Label}\" is in {m.Areas[o.Cands[0].Area].Name}, not one of this guide's zones";
            if (o.Index == null && o.Command == null) return $"the database does not say which quest-log line \"{o.Label}\" is";
            if (!forced && o.Kind is "kill" or "loot" && o.SrcNpcs.Select(n => data.Npcs.GetValueOrDefault(n)).FirstOrDefault(n => n is { Rank: >= 1 }) is { } elite)
                return $"elite: {elite.Name} is {(elite.Rank == 3 ? "a boss" : elite.Rank == 4 ? "rare" : "elite")}";
        }
        if (q.Routed.Count == 0 && q.Row.HasObjectives) return "its objectives are not in the database";
        if (q.Row.Exclusive.FirstOrDefault(inSet.Contains) is int ex and > 0) return $"cannot be taken together with {data.Quests.GetValueOrDefault(ex)?.Name ?? "?"} [{ex}], which the guides do";
        if (q.Row.BreadcrumbFor != 0 && inSet.Contains(q.Row.BreadcrumbFor)) return $"leads to {data.Quests.GetValueOrDefault(q.Row.BreadcrumbFor)?.Name ?? "?"} [{q.Row.BreadcrumbFor}], which the guides already pick up";
        return null;
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
    static string? TryPlace(Quest q, ZoneModel m, List<Node> nodes, int gi, Guide g, Dictionary<int, (int Guide, int Step)> turnedIn,
                            Dictionary<int, Node> placedHere, Dictionary<int, string> rejected, HashSet<int> questAreas, double maxDetour, GameData data, out string? done)
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
        foreach (int p in q.PreAll)
        {
            if (Ready(p) is int r) { minGap = Math.Max(minGap, r); continue; }
            if (rejected.TryGetValue(p, out var pw)) return $"needs {QName(p)}, which was left out too";
            return turnedIn.TryGetValue(p, out var at) ? $"needs {QName(p)}, which the guides hand in later or on another path" : $"needs {QName(p)}, which none of the guides do";
        }
        if (q.PreAny.Count > 0)
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

        var acc = m.Find(TaskKind.Accept, q.Id)!; var turn = m.Find(TaskKind.TurnIn, q.Id)!;
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
            var cs = t.Cands.Where(c => questAreas.Contains(c.Area)).ToList();
            (int, Cand?, double) best = (-1, null, double.PositiveInfinity);
            for (int i = Math.Max(1, from); i <= Math.Min(n, to); i++)
            {
                double lvl = seq[i - 1].Level;
                foreach (var c in cs)
                {
                    if (!allowed(lvl, c)) continue;
                    var a = m.Areas[c.Area];
                    // only where the route is in that zone: right after a step there, or right before one. Next to a step in
                    // another zone only the walk on this side counts (the trip between zones, a flight or a boat, is the guide's)
                    bool pS = Same(pa[i], a), nS = Same(na[i], a);
                    if (!pS && !nS) continue;
                    double d = pS && nS ? Dist(pa[i], pp[i], a, c.Pos) + Dist(a, c.Pos, na[i], np[i]) - Dist(pa[i], pp[i], na[i], np[i])
                             : pS ? Dist(pa[i], pp[i], a, c.Pos) : Dist(a, c.Pos, na[i], np[i]);
                    if (d < best.Item3) best = (i, c, d);
                }
            }
            return best;
        }
        bool Same(AreaInfo? x, AreaInfo y) => x != null && (x.Id == y.Id || data.Parent(x.Id) == data.Parent(y.Id));
        Node Make(RouteTask t, Cand c, double lvl) => new() { Task = t, Cand = c, Q = q, Area = m.Areas[c.Area], Pos = c.Pos, HasPos = true, Level = lvl };

        // every place for the pickup; for each, the objectives and then the hand-in where they add least after it
        double bestTotal = double.PositiveInfinity; List<Node>? bestSeq = null; Node? bestAcc = null, bestTurn = null; List<Node> bestObjs = new();
        bool levelOk = false;
        for (int ga = Math.Max(1, minGap); ga <= nodes.Count; ga++)
        {
            double lvl = nodes[ga - 1].Level;
            if (!AccOk(lvl, null!)) continue;
            levelOk = true;
            var (_, ac, total) = Best(nodes, acc, ga, ga, AccOk);
            if (ac == null || total >= bestTotal) continue;
            var seq = new List<Node>(nodes); var an = Make(acc, ac, lvl); seq.Insert(ga, an);
            var on = new List<Node>(); bool fail = false;
            for (int k = 0; k < objs.Count && !fail; k++)
            {
                int kk = k;
                int from = tight && k == 0 ? seq.IndexOf(an) + 1 : q.Routed[k].Seq && on.Count > 0 ? seq.IndexOf(on[^1]) + 1 : seq.IndexOf(an) + 1;
                int to = tight && k == 0 ? from : int.MaxValue;
                var (oi, oc, cost) = Best(seq, objs[k], from, to, (l, c) => ObjOk(kk, l, c));
                if (oc == null) { fail = true; break; }
                var nn = Make(objs[k], oc, seq[oi - 1].Level); seq.Insert(oi, nn); on.Add(nn); total += cost;
                if (total >= bestTotal) fail = true;
            }
            if (fail) continue;
            int tf = on.Append(an).Max(x => seq.IndexOf(x)) + 1;
            var (ti, tc, tcost) = Best(seq, turn, tf, int.MaxValue, (_, _) => true);
            if (tc == null) continue;
            var tn = Make(turn, tc, seq[ti - 1].Level); seq.Insert(ti, tn); total += tcost;
            if (total < bestTotal) { bestTotal = total; bestSeq = seq; bestAcc = an; bestTurn = tn; bestObjs = on; }
        }
        if (bestSeq == null)
        {
            double top = nodes.Max(x => x.Level);
            if (!levelOk) return top < q.Req ? $"needs level {q.Req}; this guide reaches about {top:0.0}" : $"a level {q.Level} quest; no place in the route after what it needs where the player is high enough";
            return "no place in the route where the player is high enough for all of its objectives";
        }
        if (bestTotal > maxDetour) return $"too far off the route: about {bestTotal:0} yd of extra walking (the limit is {maxDetour:0} yd: --max-detour, or fillMaxDetour in the zone file)";
        nodes.Clear(); nodes.AddRange(bestSeq);
        placedHere[q.Id] = bestTurn!;

        string Where(Node x)
        {
            int i = nodes.IndexOf(x) - 1;
            while (i >= 0 && nodes[i].Src == null) i--;
            return i < 0 ? "at the start" : $"after step {nodes[i].Src!.No} ({Describe(nodes[i].Src!, data)})";
        }
        done = Line(q, $"pickup {Where(bestAcc!)}" + (bestObjs.Count > 0 ? $"; objectives {string.Join(", ", bestObjs.Select(Where).Distinct())}" : "")
                       + $"; hand-in {Where(bestTurn!)}; about {Math.Max(0, bestTotal):0} yd of extra walking");
        return null;
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

    static List<string> Render(List<Node> stop, ZoneModel m, GameData data, Dictionary<int, (int Guide, int Step)> turnedIn, int gi, string side)
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
            foreach (int p in x.Q!.PreAll.OrderBy(p => p).Where(p => turnedIn.TryGetValue(p, out var at) && at.Guide < gi))
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
            // new steps from the back, so the line numbers in front stay right
            foreach (var (before, add) in views.SelectMany(g => g.Inserts).OrderByDescending(x => x.Before)) lines.InsertRange(before, add);
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
