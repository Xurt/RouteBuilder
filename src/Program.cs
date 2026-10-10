using System.Diagnostics;
using System.Globalization;

namespace RouteBuilder;

public static class Program
{
    const string Help = """
        RouteBuilder - builds RestedXP (RXPGuides) zone routes for WoW Forever from QuestieDB's data.

          RouteBuilder update [--data <folder>] [--lua <path>] [--no-download]
              Fetches QuestieDB into <folder> (default: QuestieDB) and runs its export. Do this first, and
              again whenever you want fresher data.

          RouteBuilder zones [--faction Horde|Alliance] [--data <folder>]
              Lists the zones with their quest counts and level ranges.

          RouteBuilder build --zone "<name>" [--faction Horde|Alliance] [--race <race> --class <class>]
              Writes one guide for the zone, plus a report next to it.
              Without --race/--class the route is for the whole faction, with class and race quests
              tagged so they only show for those characters. With them, it is tuned for that character.

              --zone all             every zone that has at least five quests for the faction
              --out <folder>         where guides go (default: guides)
              --data <folder>        the QuestieDB folder (default: QuestieDB)
              --zone-file <path>     corrections file (default: zones/<zone name>.json if it exists)
              --rxp <folder>         a RestedXP "Guides" folder: objective numbers are checked against it, and its
                                     training, vendor and flight-path steps are copied in (--no-rxp-steps: not)
              --start-level <n>      level the player arrives at (default: the zone's lowest quest level)
              --min-level <n>, --max-level <n>   override the quest-level range that is included
              --no-hearth            do not plan hearthstone use
              --fresh                plan from scratch instead of keeping the step order saved in locks/
              --order-from <guide>   keep the step order of a guide built earlier (for guides made before locks/)
              --effort <x>           search effort from 0.01 to 100: 1 = normal, 0.2 = quick look, 3 = slow and thorough

        Numbers the router's judgement rests on can be changed in settings.json (see README).
        """;

    public static int Main(string[] argv)
    {
        CultureInfo.DefaultThreadCurrentCulture = CultureInfo.InvariantCulture;
        if (argv.Length == 0 || argv[0] is "help" or "--help" or "-h" or "/?") { Console.WriteLine(Help); return 0; }
        var opt = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
        for (int i = 1; i < argv.Length; i++)
        {
            if (!argv[i].StartsWith("--")) { Console.Error.WriteLine($"Unexpected argument: {argv[i]}"); return 2; }
            string key = argv[i][2..];
            if (key is "no-hearth" or "no-download" or "fresh" or "no-rxp-steps") opt[key] = "1";
            else if (i + 1 < argv.Length) opt[key] = argv[++i];
            else { Console.Error.WriteLine($"--{key} needs a value"); return 2; }
        }
        string data = opt.GetValueOrDefault("data", "QuestieDB");
        try
        {
            foreach (var p in new[] { Path.Combine(AppContext.BaseDirectory, "settings.json"), "settings.json" }.Distinct()) Tuning.Load(p);
            switch (argv[0].ToLowerInvariant())
            {
                case "update":
                    Updater.Update(data, opt.GetValueOrDefault("lua"), opt.ContainsKey("no-download"));
                    var d = GameData.Load(data);
                    Console.WriteLine($"Ready: {d.Quests.Count:N0} quests, {d.Npcs.Count:N0} NPCs, {d.Objects.Count:N0} objects, {d.Items.Count:N0} items ({d.Version}).");
                    return 0;
                case "zones": return Zones(GameData.Load(data), Faction(opt));
                case "build": return Build(data, opt);
                default: Console.Error.WriteLine($"Unknown command '{argv[0]}'.\n"); Console.WriteLine(Help); return 2;
            }
        }
        catch (InvalidOperationException e) { Console.Error.WriteLine("Error: " + e.Message); return 1; }
    }

    static string Faction(Dictionary<string, string> opt)
    {
        string f = opt.GetValueOrDefault("faction", "Horde");
        if (f.Equals("horde", StringComparison.OrdinalIgnoreCase)) return "Horde";
        if (f.Equals("alliance", StringComparison.OrdinalIgnoreCase)) return "Alliance";
        throw new InvalidOperationException("--faction must be Horde or Alliance");
    }

    static List<(AreaInfo area, int count, int lo, int hi)> ZoneList(GameData d, string faction)
    {
        long mask = Game.Races(faction).Aggregate(0L, (m, r) => m | r.Bit);
        var rows = new List<(AreaInfo, int, int, int)>();
        foreach (var grp in d.Quests.Values.Where(q => q.ZoneOrSort > 0 && !q.Repeatable && !q.EventOnly && (q.Races == 0 || (q.Races & mask) != 0)).GroupBy(q => d.Parent(q.ZoneOrSort)))
        {
            if (d.Instances.Contains(grp.Key) || !d.Areas.TryGetValue(grp.Key, out var a)) continue;
            var lv = grp.Select(q => q.Level).OrderBy(l => l).ToList();
            rows.Add((a, lv.Count, lv[0], lv[Math.Min(lv.Count - 1, (int)(lv.Count * Tuning.ZoneTopPercentile))]));
        }
        return rows.OrderBy(r => r.Item3).ThenBy(r => r.Item4).ThenBy(r => r.Item1.Name).ToList();
    }

    static int Zones(GameData d, string faction)
    {
        Console.WriteLine($"Zones with {faction} quests ({d.Version}):\n");
        Console.WriteLine($"  {"Zone",-28}{"Quests",7}  {"Levels",-8} {"Build to",-9}Notes");
        foreach (var (a, count, lo, hi) in ZoneList(d, faction))
        {
            // the highest quest level a build of this zone lets in: the same rule as ZoneModel's level window
            string file = Path.Combine("zones", a.Name + ".json"); bool hasFile = File.Exists(file);
            int? fileMax = null;
            if (hasFile) try { fileMax = ZoneConfig.Load(file).MaxLevel; } catch { }
            string upTo = fileMax != null ? fileMax + " *" : Math.Min(Game.MaxLevel, count >= 5 ? hi + Tuning.ZoneLevelSlack : Game.MaxLevel).ToString();
            Console.WriteLine($"  {a.Name,-28}{count,7}  {lo + "-" + hi,-8} {upTo,-9}{(ZoneModel.CityParent(a.Id) is { } p ? "planned with " + d.AreaName(p) : a.HasBounds ? "" : "no world map data; coordinates are map percent")}{(hasFile ? "  [has zone file]" : "")}");
        }
        Console.WriteLine("\nLevels: the range most of the zone's quests fall in.");
        Console.WriteLine($"Build to: the highest quest level a build of the zone takes in (Levels plus {Tuning.ZoneLevelSlack}; * = set by maxLevel in its zone file).");
        Console.WriteLine("--max-level overrides it for one build.");
        return 0;
    }

    static int Build(string dataDir, Dictionary<string, string> opt)
    {
        if (!opt.TryGetValue("zone", out var zone)) throw new InvalidOperationException("build needs --zone \"<name>\" (or --zone all). Run 'RouteBuilder zones' for the list.");
        string faction = Faction(opt);
        if (opt.TryGetValue("effort", out var es))
        {
            // the search's try counts are whole numbers: below 0.01 they round away to nothing, above 100 they no longer fit
            if (!double.TryParse(es, NumberStyles.Float, CultureInfo.InvariantCulture, out double effort) || !(effort >= 0.01 && effort <= 100))
                throw new InvalidOperationException($"--effort must be a number from 0.01 to 100 (1 is normal). Got '{es}'.");
            Tuning.IterationsPerTask = Math.Max(1, (int)(Tuning.IterationsPerTask * effort));
            Tuning.MinIterations = Math.Max(1, (int)(Tuning.MinIterations * effort));
            Tuning.MaxIterations = Math.Max(1, (int)(Tuning.MaxIterations * effort));
        }
        var sw = Stopwatch.StartNew();
        Console.WriteLine("Reading QuestieDB data...");
        var data = GameData.Load(dataDir);
        var bo = new BuildOptions
        {
            Faction = faction, Race = opt.GetValueOrDefault("race"), Class = opt.GetValueOrDefault("class"), NoHearth = opt.ContainsKey("no-hearth"), Fresh = opt.ContainsKey("fresh"), NoRxpSteps = opt.ContainsKey("no-rxp-steps"), OrderFrom = opt.GetValueOrDefault("order-from"), RxpDir = opt.GetValueOrDefault("rxp"),
            StartLevel = Num(opt, "start-level"), MinLevel = (int?)Num(opt, "min-level"), MaxLevel = (int?)Num(opt, "max-level"),
        };
        string outDir = opt.GetValueOrDefault("out", "guides");
        Directory.CreateDirectory(outDir);

        if (!zone.Equals("all", StringComparison.OrdinalIgnoreCase))
            return BuildOne(data, data.FindArea(zone) ?? throw new InvalidOperationException($"No zone called '{zone}'. Run 'RouteBuilder zones' for the list."), bo, outDir, opt.GetValueOrDefault("zone-file"), sw) ? 0 : 3;

        int bad = 0; var list = ZoneList(data, faction).Where(z => z.count >= 5 && ZoneModel.CityParent(z.area.Id) == null).ToList();
        foreach (var (a, _, _, _) in list)
        {
            try { if (!BuildOne(data, a, bo, outDir, null, Stopwatch.StartNew())) bad++; }
            catch (InvalidOperationException e) { Console.WriteLine($"  skipped {a.Name}: {e.Message}"); }
            catch (Exception e) { Console.WriteLine($"  FAILED {a.Name}: {e.GetType().Name}: {e.Message}\n{e.StackTrace}"); bad++; }
        }
        Console.WriteLine($"\n{list.Count} zones done in {sw.Elapsed.TotalMinutes:0.0} min; {bad} need a look (see their reports).");
        return bad == 0 ? 0 : 3;
    }

    static double? Num(Dictionary<string, string> opt, string key) =>
        opt.TryGetValue(key, out var s) ? double.TryParse(s, NumberStyles.Float, CultureInfo.InvariantCulture, out double v) ? v : throw new InvalidOperationException($"--{key} must be a number") : null;

    static bool BuildOne(GameData data, AreaInfo area, BuildOptions bo, string outDir, string? zoneFile, Stopwatch sw)
    {
        if (ZoneModel.CityParent(area.Id) is { } parent) throw new InvalidOperationException($"{area.Name} is planned as part of {data.AreaName(parent)}; build that zone instead");
        zoneFile ??= new[] { Path.Combine("zones", area.Name + ".json"), Path.Combine(AppContext.BaseDirectory, "zones", area.Name + ".json") }.FirstOrDefault(File.Exists);
        if (zoneFile != null && !File.Exists(zoneFile)) throw new InvalidOperationException($"zone file not found: {zoneFile}");
        Console.WriteLine($"\n{area.Name} ({bo.Faction}{(bo.Race != null ? ", " + bo.Race : "")}{(bo.Class != null ? ", " + bo.Class : "")}){(zoneFile != null ? "  using " + zoneFile : "")}");
        var cfg = zoneFile != null ? ZoneConfig.Load(zoneFile) : null;
        // the step order of the last build of this guide, kept unless --fresh
        string lockPath = RouteLock.PathFor(area.Name, bo);
        var lk = bo.OrderFrom != null ? RouteLock.FromGuide(bo.OrderFrom) : bo.Fresh ? null : RouteLock.Load(lockPath);
        if (bo.OrderFrom != null) Console.WriteLine($"  keeping the step order of {bo.OrderFrom}");
        else if (lk != null) Console.WriteLine($"  keeping the step order saved in {lockPath} (--fresh plans from scratch)");
        var visit = new Visit(); var visits = new List<(ZoneModel m, RouteResult r, GuideOutput g, Verifier v)>();
        bool debug = Environment.GetEnvironmentVariable("ROUTEBUILDER_DEBUG") == "1"; int bumps = 0;
        while (true)
        {
            var model = new ZoneModel(data, area, cfg, bo, visit);
            int firm = model.Tasks.Count(t => !t.Cond && t.Q != null);
            if (visit.Number == 1 && firm < 3)
            {
                // the zone's lowest quest is an outlier: nothing much can be done at that level, so arrive a level later
                if (model.Later.Count == 0 || bumps++ >= 15 || bo.StartLevel != null) throw new InvalidOperationException("fewer than three steps to plan here for this faction");
                visit.StartLevel = Math.Floor(model.StartLevel) + 1;
                continue;
            }
            if (firm == 0)
            {
                // nothing left that can be planned: close the guide where the last part stopped
                var prev = visits[^1].g;
                if (prev.GateLine >= 0) prev.Lines[prev.GateLine + 1] = $"    +|cRXP_WARN_End of the {area.Name} route.|r";
                break;
            }
            if (visits.Count > 0 && visits[^1].g.GateLine >= 0)
            {
                // when everything left is for particular classes, only they need to be told to come back
                var tags = model.Quests.Values.Where(q => !q.Cond).Select(q => q.Tag).Distinct().ToList();
                if (!tags.Contains("")) visits[^1].g.Lines[visits[^1].g.GateLine] = "step << " + string.Join("/", tags.SelectMany(t => t.Split('/')).Distinct());
            }
            Console.WriteLine($"  {(visit.Number > 1 ? $"part {visit.Number}" : "planned")} from level {model.StartLevel:0}: {model.Quests.Count} quests, {model.Tasks.Count} tasks; quest levels {model.LevelLo}-{model.LevelHi}" +
                              (visit.Number == 1 ? $"; {model.Excluded.Count} left out" : "") + (model.Later.Count > 0 ? $"; {model.Later.Count} need a higher level" : ""));
            List<LockedStep>? keep = null;
            if (lk != null) keep = lk.For(visit.Number);
            var route = new Router(model, Console.WriteLine, keep).Solve();
            if (lk != null && !lk.Parts.ContainsKey(visit.Number)) route.LockDropped = 0;   // a one-part order shared by every part: the rest belongs to other parts
            var main = route.Views[0];
            var firmLater = model.Later.Values.Where(v => !v.Cond).ToList();
            bool more = firmLater.Count > 0 && visit.Number < Tuning.MaxVisits && !(visit.Only != null && visit.Only.SetEquals(model.Later.Keys));
            int nextStart = more ? (int)Math.Min(Game.MaxLevel, Math.Max(Math.Floor(main.EndLevel) + Tuning.VisitGap, Math.Ceiling(firmLater.Min(v => v.Need)))) : 0;
            var guide = new Emitter(model, route).Write(more ? nextStart : null);
            var check = new Verifier(); check.Run(model, guide);
            visits.Add((model, route, guide, check));
            Console.WriteLine($"    {guide.Steps} steps, {Math.Round(main.Travel):N0} yd on foot for the shared route, ends about level {main.EndLevel:0.0}, quest log peak {check.LogPeak}/40" +
                              (check.Errors.Count == 0 ? "; checks passed" : $"; {check.Errors.Count} PROBLEMS - see the report"));
            if (debug)
                foreach (var hub in model.HubOf.Where(kv => kv.Value >= 0).GroupBy(kv => kv.Value).Select(grp => grp.Select(kv => kv.Key).ToList()).Where(l => l.Count > 2).OrderByDescending(l => Geo.Span(l.Select(c => c.Pos).ToList())).Take(6))
                    Console.WriteLine($"    hub: {hub.Count} places, {Geo.Span(hub.Select(c => c.Pos).ToList()):0} yd across, around {model.Tasks.Where(t => t.Ent != null && t.Cands.Any(hub.Contains)).Select(t => t.Ent!.Name).Distinct().Take(5).Aggregate("", (x, y) => x + y + ", ")}");
            if (debug)
                File.WriteAllLines(Path.Combine(outDir, $"{area.Name}.part{visit.Number}.route.txt"), route.Seq.Select((id, i) =>
                {
                    var t = model.Tasks[id]; var c = t.Cands[route.Choice[id]];
                    return $"{i,4} {t.Kind,-10} {t.Q?.Id,6} {(t.Cond ? "cond" : "firm")}{(t.Deferred ? " deferred" : "")} L{route.Level[id]:0.0} [{t.Tag}] {t} @{c.Area}:{c.Pos.X:0},{c.Pos.Y:0} pre={string.Join(",", t.Pre)} any={string.Join(",", t.PreAny)} id={id}";
                }));
            if (debug)
                File.WriteAllLines(Path.Combine(outDir, $"{area.Name}.part{visit.Number}.spawns.txt"), model.Tasks.Where(t => t.Obj != null).Select(t =>
                    $"{t.Id} {t.Obj!.Kind} {t.Obj.Kills:0} " + string.Join(" ", t.Cands.SelectMany(c => c.Pts.Select(p => $"{c.Area}:{p.X:0},{p.Y:0}")))));
            if (!more) break;
            visit = new Visit
            {
                Number = visit.Number + 1, Only = model.Later.Keys.ToHashSet(), MinStartLevel = nextStart,
                Done = visit.Done.Concat(model.Quests.Values.Where(q => q.HasTurnin && !q.Cond && !q.Late && !q.Optional).Select(q => q.Id)).ToHashSet(),
                HeldOver = visit.HeldOver.Concat(model.Quests.Values.Where(q => q.Late && !q.Cond).Select(q => q.Id)).ToHashSet(),
            };
        }
        // a zone-file step only goes unplaced if no part of the guide has the step it names
        var unplaced = visits.Select(v => v.g.StepsNotPlaced).Aggregate((x, y) => x.Intersect(y).ToList());
        foreach (var v in visits) v.g.StepsNotPlaced = new();
        visits[^1].g.StepsNotPlaced = unplaced;
        foreach (var k in unplaced) Console.WriteLine($"  zone file: no step called \"{k}\" in this guide, so no hand-written step was placed there");
        string text = Emitter.FileText(visits.Select(v => (v.m, v.g)).ToList());
        string path = Path.Combine(outDir, visits[0].g.FileName);
        File.WriteAllText(path, text);
        var reports = visits.Select((v, i) => Report.Write(v.m, v.r, v.g, v.v, path, zoneFile, i == visits.Count - 1, visits.Count));
        File.WriteAllText(Path.ChangeExtension(path, ".report.txt"), string.Join("\n\n" + new string('=', 100) + "\n\n", reports));
        RouteLock.Save(lockPath, visits[0].g.Name, visits.Select((v, i) => (i + 1, v.m, v.r)));
        bool ok = visits.All(v => v.v.Errors.Count == 0);
        Console.WriteLine($"  \"{visits[0].g.Name}\"" + (visits.Count > 1 ? $" in {visits.Count} parts" : ""));
        Console.WriteLine($"  -> {path}  ({sw.Elapsed.TotalSeconds:0} s); step order saved in {lockPath}");
        var written = new List<string> { path };
        // guide files from earlier builds of this zone (other level ranges, or the per-level split) stay in the folder: say so
        string who = Emitter.Who(visits[0].m);
        var stale = Directory.EnumerateFiles(outDir, area.Name + " *(" + who + ").lua").Where(f => !written.Contains(f, StringComparer.OrdinalIgnoreCase)).ToList();
        if (stale.Count > 0)
            Console.WriteLine($"  also in {outDir} from earlier builds of {area.Name} (delete any this build replaces, or the addon loads both): " + string.Join(", ", stale.Select(Path.GetFileName)));
        return ok;
    }
}
