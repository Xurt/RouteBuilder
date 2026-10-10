using System.Globalization;
using System.Text.RegularExpressions;
using RouteBuilder;

namespace RxpToLock;

/// <summary>
/// Turns the order of a RestedXP guide into a RouteBuilder lock file for one zone. The next RouteBuilder build of
/// that zone then follows RestedXP's order for every quest both have, and slots in the zone's quests RestedXP skips.
/// Quests that RouteBuilder does not count as part of the zone (RestedXP's guides wander into other zones) are left out.
/// </summary>
public static class Program
{
    const string Help = """
        RxpToLock: save a RestedXP guide's step order as the lock file RouteBuilder builds a zone from.

          dotnet run --project RxpToLock -c Release -- --zone <name> --faction <Horde|Alliance> <guide.lua> [<guide.lua> ...]

        Run it from the RouteBuilder folder (it uses QuestieDB, zones and locks from there), with the same
        --zone, --faction, --race, --class, --min-level and --max-level as the build you will run afterwards.

          --guides "<name>,<name>"  only the RestedXP guides with these #name values (default: every guide in the files)
          --rxp <folder>            RestedXP guide folder for objective numbers (default: the folder of the first file)
          --data <folder>           the QuestieDB folder (default: QuestieDB)
          --zone-file <path>        corrections file (default: zones/<zone name>.json if it exists)

        Then build as usual, passing the same --rxp folder so objective numbers match:
          dotnet run -c Release -- build --zone <name> --faction <faction> --rxp <folder>
        """;

    sealed record Hit(string Key, int Order, bool Along, LockedStep Step, string Guide);
    sealed record Svc(int Order, string Guide, int Map, LockedService Step);

    static readonly Regex GotoRx = new(@"^\.goto\s+(\d+)(?:/\d+)?\s*,\s*(-?\d+(?:\.\d+)?)[\d.]*\s*,\s*(-?\d+(?:\.\d+)?)[\d.]*(?:\s*,\s*(\d+(?:\.\d+)?))?(?:\s*,\s*(\d+))?", RegexOptions.Compiled);
    static readonly Regex CmdRx = new(@"^\.(accept|turnin|complete|home)\b\s*(\d+)?(?:\s*,\s*(\d+))?", RegexOptions.Compiled);

    public static int Main(string[] argv)
    {
        CultureInfo.DefaultThreadCurrentCulture = CultureInfo.InvariantCulture;
        if (argv.Length == 0 || argv[0] is "help" or "--help" or "-h" or "/?") { Console.WriteLine(Help); return 0; }
        var opt = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase); var files = new List<string>();
        for (int i = 0; i < argv.Length; i++)
        {
            if (!argv[i].StartsWith("--")) { files.Add(argv[i]); continue; }
            if (i + 1 >= argv.Length) { Console.Error.WriteLine($"{argv[i]} needs a value"); return 2; }
            opt[argv[i][2..]] = argv[++i];
        }
        try { return Run(opt, files); }
        catch (InvalidOperationException e) { Console.Error.WriteLine(e.Message); return 1; }
    }

    static int Run(Dictionary<string, string> opt, List<string> files)
    {
        if (!opt.TryGetValue("zone", out var zone)) throw new InvalidOperationException("--zone is required. Run with --help for usage.");
        if (files.Count == 0) throw new InvalidOperationException("name at least one RestedXP guide .lua file.");
        foreach (var f in files) if (!File.Exists(f)) throw new InvalidOperationException($"guide not found: {f}");
        string faction = opt.GetValueOrDefault("faction", "Horde");
        faction = faction.Equals("alliance", StringComparison.OrdinalIgnoreCase) ? "Alliance" : faction.Equals("horde", StringComparison.OrdinalIgnoreCase) ? "Horde"
                : throw new InvalidOperationException("--faction must be Horde or Alliance");
        int? Int(string k) => opt.TryGetValue(k, out var s) ? int.TryParse(s, out int v) ? v : throw new InvalidOperationException($"--{k} must be a whole number") : null;
        string rxpDir = opt.GetValueOrDefault("rxp") ?? Path.GetDirectoryName(Path.GetFullPath(files[0]))!;
        var bo = new BuildOptions
        {
            Faction = faction, Race = opt.GetValueOrDefault("race"), Class = opt.GetValueOrDefault("class"),
            MinLevel = Int("min-level"), MaxLevel = Int("max-level"), RxpDir = rxpDir,
        };

        Console.WriteLine("Reading QuestieDB data...");
        var data = GameData.Load(opt.GetValueOrDefault("data", "QuestieDB"));
        var area = data.FindArea(zone) ?? throw new InvalidOperationException($"No zone called '{zone}'.");
        string? zoneFile = opt.GetValueOrDefault("zone-file") ?? new[] { Path.Combine("zones", area.Name + ".json") }.FirstOrDefault(File.Exists);
        var cfg = zoneFile != null ? ZoneConfig.Load(zoneFile) : null;
        Console.WriteLine($"{area.Name} ({faction}{(bo.Race != null ? ", " + bo.Race : "")}{(bo.Class != null ? ", " + bo.Class : "")}){(zoneFile != null ? "  using " + zoneFile : "")}");

        // what RouteBuilder counts as this zone: the quests of a build, including those it would put in a later part
        var model = new ZoneModel(data, area, cfg, bo, new Visit());
        var inZone = model.Quests.Keys.Concat(model.Later.Keys).ToHashSet();
        var keys = RouteLock.Keys(model).ToHashSet();

        // every .accept / .complete / .turnin / .home in the guides, in order
        var hits = new List<Hit>(); var guides = new List<string>(); int order = 0; var services = new List<Svc>();
        var only = opt.TryGetValue("guides", out var gl) ? gl.Split(',').Select(s => s.Trim()).Where(s => s.Length > 0).ToHashSet(StringComparer.OrdinalIgnoreCase) : null;
        foreach (var file in files)
            foreach (var (name, steps) in ReadGuides(file, faction, data))
            {
                if (only != null && !only.Contains(name)) continue;
                guides.Add(name);
                foreach (var st in steps)
                {
                    if (!Applies(st.Tag, bo)) continue;
                    var spot = SpotOf(st.Lines.Where(l => Applies(l.Tag, bo)).Select(l => l.Text).ToList());
                    foreach (var (text, tag) in st.Lines)
                    {
                        if (!Applies(tag, bo)) continue;
                        var c = CmdRx.Match(text); if (!c.Success) continue;
                        string? key = c.Groups[1].Value switch
                        {
                            "home" => "home",
                            "complete" when c.Groups[3].Success => $"obj:{c.Groups[2].Value}:{c.Groups[3].Value}",
                            "accept" or "turnin" when c.Groups[2].Success => $"{c.Groups[1].Value}:{c.Groups[2].Value}",
                            _ => null,
                        };
                        if (key != null) hits.Add(new Hit(key, order++, st.Along, spot with { Key = key }, name));
                    }
                    // a training, vendor or flight-path step: kept whole, in its place in RestedXP's order
                    // (after a quest handed in at the same trainer, as RestedXP does them together)
                    if (!st.Along && RxpServices.ServiceLines(st.Lines, out int svcMap) is { } svcLines)
                        services.Add(new Svc(order++, name, svcMap, new LockedService { Lines = svcLines, Tag = st.Tag.Length > 0 ? st.Tag : null, From = "RestedXP: " + name }));
                }
            }
        if (guides.Count == 0) throw new InvalidOperationException(only != null ? "none of the --guides names were found in the files" : "no RestedXP guides found in the files");
        Console.WriteLine($"Read {hits.Count} pickups, objectives and hand-ins from: {string.Join(", ", guides)}");

        // one place per step: a pickup or hand-in where it first happens; an objective at its own step,
        // not where the guide first says "kill these as you go"
        var chosen = new Dictionary<string, Hit>();
        foreach (var h in hits)
        {
            if (!chosen.TryGetValue(h.Key, out var had)) { chosen[h.Key] = h; continue; }
            if (h.Key.StartsWith("obj:") && had.Along && !h.Along) chosen[h.Key] = h;
        }
        int Quest(string key) => key == "home" ? 0 : int.Parse(key.Split(':')[1], CultureInfo.InvariantCulture);
        var kept = chosen.Values.Where(h => h.Key == "home" ? model.Home != null : inZone.Contains(Quest(h.Key))).OrderBy(h => h.Order).ToList();
        var outside = chosen.Values.Where(h => h.Key != "home" && !inZone.Contains(Quest(h.Key))).Select(h => Quest(h.Key)).Distinct().OrderBy(q => q).ToList();
        var oddObjectives = kept.Where(h => h.Key.StartsWith("obj:") && model.Quests.ContainsKey(Quest(h.Key)) && !keys.Contains(h.Key)).ToList();
        var rxpQuests = kept.Select(h => Quest(h.Key)).ToHashSet();
        var skipped = inZone.Where(q => !rxpQuests.Contains(q)).OrderBy(q => q).ToList();

        // service steps on this zone's maps (or its city's), from the RestedXP guides that do some of this zone's quests, once each
        var zoneMaps = model.Areas.Select(a => a.UiMap).ToHashSet();
        var ours = kept.Select(h => h.Guide).ToHashSet();
        var seenSvc = new HashSet<string>();
        var svcKept = services.Where(x => (x.Map < 0 || zoneMaps.Contains(x.Map)) && ours.Contains(x.Guide)).Where(x => seenSvc.Add(x.Step.Id)).ToList();

        string QName(int q) => data.Quests.TryGetValue(q, out var r) ? $"{r.Name} [{q}]" : $"quest {q}";
        string Note(Hit h) => h.Key switch
        {
            "home" => "Set hearthstone",
            var k when k.StartsWith("accept:") => "Accept " + QName(Quest(k)),
            var k when k.StartsWith("turnin:") => "TurnIn " + QName(Quest(k)),
            var k => $"Objective {k.Split(':')[2]} of {QName(Quest(k))}",
        } + $"  (RestedXP: {h.Guide})";

        string path = RouteLock.PathFor(area.Name, bo);
        if (kept.Count == 0)
        {
            // nothing to follow: an empty lock would only throw away the order that is there now
            Console.WriteLine($"\nNone of these RestedXP guides has a pickup, objective or hand-in for {area.Name} ({faction}{(bo.Race != null ? ", " + bo.Race : "")}{(bo.Class != null ? ", " + bo.Class : "")}). " +
                (File.Exists(path) ? $"{Path.GetFullPath(path)} is left as it was." : "No lock written."));
            return 1;
        }
        if (File.Exists(path)) { File.Copy(path, path + ".bak", true); Console.WriteLine($"The lock that was there is kept as {path}.bak"); }
        RouteLock.SaveSteps(path, "from RestedXP: " + string.Join(", ", guides),
            "Step order taken from RestedXP's guide by RxpToLock. RouteBuilder follows it and slots in this zone's other quests. " +
            "Lines can be moved by hand. Delete the file, or build with --fresh, to plan the guide from scratch.",
            kept.Select(h => (h.Order, Entry: (Step: (LockedStep?)h.Step, Svc: (LockedService?)null, Note: Note(h))))
                .Concat(svcKept.Select(x => (x.Order, Entry: (Step: (LockedStep?)null, Svc: (LockedService?)x.Step, Note: ""))))
                .OrderBy(x => x.Order).Select(x => x.Entry));

        Console.WriteLine();
        Console.WriteLine($"{kept.Count} steps for {rxpQuests.Count(q => q != 0)} quests of {area.Name}, and {svcKept.Count} training, vendor and flight-path step{(svcKept.Count == 1 ? "" : "s")}, saved in {Path.GetFullPath(path)}");
        if (outside.Count > 0)
        {
            Console.WriteLine($"\nLeft out, not part of {area.Name} for this build ({outside.Count}):");
            foreach (var q in outside) Console.WriteLine("  " + QName(q));
        }
        if (skipped.Count > 0)
        {
            Console.WriteLine($"\nQuests of {area.Name} that RestedXP's guide does not do; the build slots them in ({skipped.Count}):");
            foreach (var q in skipped) Console.WriteLine("  " + QName(q) + (model.Later.ContainsKey(q) ? "  (in a later part)" : ""));
        }
        if (oddObjectives.Count > 0)
        {
            Console.WriteLine($"\nObjective numbers RouteBuilder does not have for these quests ({oddObjectives.Count}); those steps are planned anew:");
            foreach (var h in oddObjectives) Console.WriteLine($"  line {h.Key.Split(':')[2]} of {QName(Quest(h.Key))}");
        }
        Console.WriteLine($"\nNext: dotnet run -c Release -- build --zone \"{area.Name}\" {(bo.Race != null || bo.Class != null ? $"{(bo.Race != null ? "--race " + bo.Race : "")} {(bo.Class != null ? "--class " + bo.Class : "")}".Trim() : "--faction " + faction)}" +
                          $"{(bo.MinLevel != null ? " --min-level " + bo.MinLevel : "")}{(bo.MaxLevel != null ? " --max-level " + bo.MaxLevel : "")} --rxp \"{rxpDir}\"");
        return 0;
    }

    sealed record Step(string Tag, bool Along, List<(string Text, string Tag)> Lines);

    /// <summary>The guides in a RestedXP file: each RegisterGuide block's #name and its steps, comments removed.</summary>
    static IEnumerable<(string Name, List<Step> Steps)> ReadGuides(string file, string faction, GameData data)
    {
        string text = File.ReadAllText(file);
        foreach (Match block in Regex.Matches(text, @"RegisterGuide\(\s*\[\[(.*?)\]\]", RegexOptions.Singleline))
        {
            string name = "?", side = ""; var steps = new List<Step>(); Step? cur = null;
            foreach (var raw in block.Groups[1].Value.Split('\n'))
            {
                string l = Regex.Replace(raw, "--.*$", "").Trim();
                if (l.Length == 0) continue;
                string tag = ""; int ti = l.LastIndexOf("<<", StringComparison.Ordinal);
                if (ti >= 0) { tag = l[(ti + 2)..].Trim(); l = l[..ti].TrimEnd(); }
                if (l.StartsWith("#name ")) { name = l[6..].Trim(); continue; }
                if (cur == null && l.Length == 0) { side = tag.StartsWith("Horde") ? "Horde" : tag.StartsWith("Alliance") ? "Alliance" : side; continue; }
                if (l == "step") { steps.Add(cur = new Step(tag, false, new())); continue; }
                if (cur == null) continue;
                l = RxpServices.NormalizeGoto(l, data);              // ".goto Ashenvale,37.36,51.79" -> map ID and world coordinates
                if (l.StartsWith("#completewith")) { steps[^1] = cur = cur with { Along = true }; continue; }
                cur.Lines.Add((l, tag));
            }
            if (side.Length > 0 && side != faction) continue;          // a guide for the other faction
            yield return (name, steps);
        }
    }

    /// <summary>
    /// Where a step is: its destination .goto (a waypoint ending in ",0" only leads there), or for a loop of
    /// waypoints, all of them. No .goto: no place.
    /// </summary>
    static LockedStep SpotOf(List<string> lines)
    {
        var gotos = lines.Select(l => GotoRx.Match(l)).Where(g => g.Success).ToList();
        if (gotos.Count == 0) return new LockedStep("", -1, 0, 0);
        Pt P(Match g) => new(double.Parse(g.Groups[2].Value, CultureInfo.InvariantCulture), double.Parse(g.Groups[3].Value, CultureInfo.InvariantCulture));
        bool loopStep = lines.Any(l => l.StartsWith("#loop"));
        var dest = loopStep ? null : gotos.LastOrDefault(g => !(g.Groups[5].Success && g.Groups[5].Value == "0"));
        int map = int.Parse((dest ?? gotos[0]).Groups[1].Value);
        if (dest != null) { var p = P(dest); return new LockedStep("", map, p.X, p.Y); }
        var loop = gotos.Where(g => int.Parse(g.Groups[1].Value) == map).Select(P).Distinct().ToList();
        return new LockedStep("", map, loop.Average(p => p.X), loop.Average(p => p.Y)) { Loop = loop };
    }

    /// <summary>
    /// RestedXP's tag rules ("/" = or, space = and, "!" = not) for the character being built. A race or class the
    /// build does not fix counts as matching, so a faction build takes every class's and race's steps.
    /// </summary>
    static bool Applies(string tag, BuildOptions bo)
    {
        if (tag.Length == 0) return true;
        var races = Game.Races(bo.Faction).Select(r => r.Name).ToHashSet(StringComparer.OrdinalIgnoreCase);
        var classes = Game.Classes.Select(c => c.Name).ToHashSet(StringComparer.OrdinalIgnoreCase);
        foreach (var alt in tag.Split('/'))
        {
            bool all = true;
            foreach (var raw in alt.Split(' ', StringSplitOptions.RemoveEmptyEntries))
            {
                bool neg = raw.StartsWith('!'); string w = neg ? raw[1..] : raw; bool hit;
                if (w.Equals(bo.Faction, StringComparison.OrdinalIgnoreCase)) hit = true;
                else if (w is "Horde" or "Alliance") hit = false;
                else if (races.Contains(w)) hit = bo.Race == null ? !neg : w.Equals(bo.Race, StringComparison.OrdinalIgnoreCase);
                else if (classes.Contains(w)) hit = bo.Class == null ? !neg : w.Equals(bo.Class, StringComparison.OrdinalIgnoreCase);
                else hit = !neg;                                              // other tags (#era, softcore...) are not about the character
                if (hit == neg) { all = false; break; }
            }
            if (all) return true;
        }
        return false;
    }
}
