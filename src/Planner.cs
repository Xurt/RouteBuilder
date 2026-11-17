using System.Diagnostics;
using System.Globalization;
using System.Text;

namespace RouteBuilder;

/// <summary>A piece of a zone's level range, built as a guide of its own.</summary>
public sealed record Band(AreaInfo Zone, int Min, int Max, int Quests)
{
    public string Label => $"{Zone.Name} {Min}-{Max}";
}

/// <summary>
/// The plan command: one route through every zone by level. Each zone's quests are cut into bands about
/// <see cref="Tuning.BandWidth"/> levels wide, every quest counted at its chain's level (<see cref="GameData.BandLevel"/>), and
/// the bands are played lowest first: Zone 1 10-14, Zone 2 11-16, Zone 3 14-17, Zone 1 15-19 and so on. Bands that start at
/// the same level go nearest first. Each band is built like "build --min-level --max-level", and leads on to the next with #next.
/// </summary>
public static class Planner
{
    const string Mark = "--RouteBuilder:plan";
    static readonly CultureInfo Inv = CultureInfo.InvariantCulture;

    public static int Run(string dataDir, Dictionary<string, string> opt)
    {
        string faction = Program.Faction(opt);
        Program.ApplyEffort(opt);
        var sw = Stopwatch.StartNew();
        Console.WriteLine("Reading QuestieDB data...");
        var data = GameData.Load(dataDir);
        bool solo = !opt.ContainsKey("keep-elite");
        int from = (int?)Program.Num(opt, "min-level") ?? 1, to = (int?)Program.Num(opt, "max-level") ?? Game.MaxLevel;
        var only = opt.TryGetValue("zones", out var zs) ? zs.Split(';', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries).ToHashSet(StringComparer.OrdinalIgnoreCase) : null;
        string outDir = opt.GetValueOrDefault("out", "route");

        var bands = new List<Band>(); var notes = new List<string>();
        foreach (var (area, count, _, _) in Program.ZoneList(data, faction))
        {
            if (count < 5 || ZoneModel.CityParent(area.Id) != null) continue;
            if (only != null && !only.Contains(area.Name)) continue;
            var zb = ZoneBands(data, area, faction, solo, notes);
            if (zb.Count == 0) continue;
            // a starting zone (quests from level 1) is each race's own: not part of the faction's shared route
            if (zb[0].Min <= 2 && !opt.ContainsKey("starters") && only == null) { notes.Add($"{area.Name}: a starting zone, left out (--starters takes it in)"); continue; }
            bands.AddRange(zb.Where(b => b.Max >= from && b.Min <= to));
        }
        notes.RemoveAll(n => !bands.Any(b => n.StartsWith(b.Zone.Name + ":")) && !n.Contains("starting zone"));
        if (only != null) foreach (var z in only.Where(z => !bands.Any(b => b.Zone.Name.Equals(z, StringComparison.OrdinalIgnoreCase)))) notes.Add($"{z}: no bands (not a zone, or nothing in {from}-{to})");
        if (bands.Count == 0) throw new InvalidOperationException($"no zone bands between level {from} and {to} for {faction}");

        if (Environment.GetEnvironmentVariable("ROUTEBUILDER_DEBUG") == "1" && only != null)
            foreach (var b in bands)
                foreach (var q in data.Quests.Values.Where(q => q.ZoneOrSort > 0 && data.Parent(q.ZoneOrSort) == b.Zone.Id && data.BandLevel(q) >= b.Min && data.BandLevel(q) <= b.Max && !q.Repeatable && data.OpenTo(q, faction) && (q.Races == 0 || (q.Races & Game.Races(faction).Aggregate(0L, (m, r) => m | r.Bit)) != 0) && (!solo || data.EliteTarget(q) == null)).OrderBy(q => data.BandLevel(q)))
                    Console.WriteLine($"  {b.Label}: [{q.Id}] {q.Name} L{q.Level} req {q.ReqLevel} chain {data.ChainLevel(q.Id)} races {q.Races} starters {string.Join(",", q.StartNpcs.Select(n => data.Npcs.TryGetValue(n, out var nn) ? nn.Name + "/" + nn.Friendly : n.ToString()))} kill {string.Join(",", q.KillNpcs.Select(k => k.id + ":" + string.Join("/", data.Npcs.GetValueOrDefault(k.id)?.Spawns.Keys.Select(data.AreaName) ?? new string[0])))} items {string.Join(",", q.NeedItems.Select(k => k.id + ":" + string.Join("/", (data.Items.GetValueOrDefault(k.id)?.NpcDrops ?? new()).Take(3).SelectMany(n => data.Npcs.GetValueOrDefault(n)?.Spawns.Keys.Select(data.AreaName) ?? new string[0]))))}");
        var order = Order(bands);
        Directory.CreateDirectory(outDir);
        var plan = new StringBuilder();
        plan.AppendLine($"Route for {faction}{(opt.ContainsKey("race") ? ", " + opt["race"] : "")}{(opt.ContainsKey("class") ? ", " + opt["class"] : "")}, levels {from}-{to}, {order.Count} bands ({data.Version})");
        plan.AppendLine(solo ? "Elite, group and dungeon quests left out. " : "Dungeon quests left out. ");
        plan.AppendLine("A chain's quests count at the level of its first quest (or the level needed to pick them up, if that is higher).");
        plan.AppendLine();
        for (int i = 0; i < order.Count; i++) plan.AppendLine($"  {i + 1,3}. {order[i].Label,-34} {order[i].Quests,3} quests");
        if (notes.Count > 0) { plan.AppendLine(); foreach (var n in notes) plan.AppendLine("  " + n); }
        Console.WriteLine(); Console.Write(plan);
        string planPath = Path.Combine(outDir, "route.txt");
        File.WriteAllText(planPath, plan.ToString());
        if (opt.ContainsKey("dry-run")) { Console.WriteLine($"\n-> {planPath} (dry run: no guides built)"); return 0; }

        string? race = opt.GetValueOrDefault("race"), cls = opt.GetValueOrDefault("class");
        string who = race != null || cls != null ? string.Join(" ", new[] { race, cls }.Where(s => s != null).Select(s => char.ToUpperInvariant(s![0]) + s[1..].ToLowerInvariant())) : faction;
        // a band is played once: what it can't fit in is listed, not put in a "come back at level N" part (the route moves on)
        Tuning.MaxVisits = 1;
        var carry = new Dictionary<int, HashSet<int>>();      // zone -> quests an earlier band of it left for a higher level
        var built = new List<(Band b, string path, GuideMeta meta)>(); var log = new List<string>(); double? level = null; int bad = 0;
        for (int i = 0; i < order.Count; i++)
        {
            var b = order[i];
            BuildOptions Opts(double? start) => new()
            {
                Faction = faction, Race = race, Class = cls, MinLevel = b.Min, MaxLevel = b.Max, StartLevel = start,
                Solo = solo, ByChain = true, Group = $"Level Route ({who})", Name = $"{i + 1:00} {b.Label}",
                Carry = carry.GetValueOrDefault(b.Zone.Id) ?? new(),
                NoHearth = opt.ContainsKey("no-hearth"), Fresh = opt.ContainsKey("fresh"), NoRxpSteps = opt.ContainsKey("no-rxp-steps"), RxpDir = opt.GetValueOrDefault("rxp"),
            };
            Console.WriteLine($"\n[{i + 1}/{order.Count}] {b.Label}" + (level != null ? $", arriving at about level {level:0.0}" : ""));
            // planned from the level the bands before it should get you to; one that would start above what is in it is planned from its own start
            double? start = level is { } l && l > b.Min ? Math.Round(l, 1) : null;
            string path; bool ok;
            try { ok = Program.BuildOne(data, b.Zone, Opts(start), outDir, null, Stopwatch.StartNew(), out path); }
            catch (InvalidOperationException e) when (start != null)
            {
                Console.WriteLine($"  from level {start:0.0}: {e.Message}; planning from the band's own start instead");
                try { ok = Program.BuildOne(data, b.Zone, Opts(null), outDir, null, Stopwatch.StartNew(), out path); }
                catch (InvalidOperationException e2) { Console.WriteLine($"  skipped: {e2.Message}"); log.Add($"  {i + 1,3}. {b.Label,-34} skipped: {e2.Message}"); continue; }
            }
            catch (InvalidOperationException e) { Console.WriteLine($"  skipped: {e.Message}"); log.Add($"  {i + 1,3}. {b.Label,-34} skipped: {e.Message}"); continue; }
            if (!ok) bad++;
            var meta = GuideMeta.Load(GuideMeta.PathFor(path)) ?? throw new InvalidOperationException($"could not read the summary of {path}");
            double s0 = meta.Parts[0].Start, end = meta.Parts[^1].End;
            int carried = carry.GetValueOrDefault(b.Zone.Id)?.Count(id => !meta.Later.Contains(id)) ?? 0;
            // what this band couldn't fit in goes to the zone's next band (if it has one)
            carry[b.Zone.Id] = meta.Later.ToHashSet();
            bool later = order.Skip(i + 1).Any(x => x.Zone.Id == b.Zone.Id);
            log.Add($"  {i + 1,3}. {b.Label,-34} {meta.Quests.Count,3} quests  level {s0:0.0} -> {end:0.0}" +
                    (level is { } arr && arr < s0 - 0.25 ? $"  (arriving about {arr:0.0})" : "") +
                    (carried > 0 ? $"  {carried} carried over from its earlier band" : "") +
                    (meta.Later.Count > 0 ? $"  {meta.Later.Count} {(later ? "moved to its next band" : "LEFT OUT (need a higher level, and this route has no later band of the zone)")}: {string.Join(", ", meta.Later.Take(6).Select(id => $"{data.Quests[id].Name} [{id}]"))}{(meta.Later.Count > 6 ? ", ..." : "")}" : "") +
                    (ok ? "" : "  PROBLEMS - see its report"));
            level = Math.Max(level ?? 0, end);
            built.Add((b, path, meta));
        }

        Link(built);
        plan.AppendLine().AppendLine("Built:");
        foreach (var l in log) plan.AppendLine(l);
        File.WriteAllText(planPath, plan.ToString());
        Console.WriteLine($"\n{built.Count} band guides in {outDir}, linked in order, in {sw.Elapsed.TotalMinutes:0.0} min; {bad} need a look (see their reports).");
        Console.WriteLine($"-> {planPath}");
        return bad == 0 ? 0 : 3;
    }

    /// <summary>
    /// Cuts a zone's quests into bands: the levels most of them fall in, cut into pieces about BandWidth wide
    /// (10-24 gives 10-14, 15-19, 20-24; 11-22 gives 11-16, 17-22), with the few quests either side folded into the end bands.
    /// </summary>
    public static List<Band> ZoneBands(GameData data, AreaInfo area, string faction, bool solo, List<string>? notes = null)
    {
        long mask = Game.Races(faction).Aggregate(0L, (m, r) => m | r.Bit);
        string file = Path.Combine("zones", area.Name + ".json");
        var cfg = File.Exists(file) ? ZoneConfig.Load(file) : null;
        var levels = new List<int>();
        foreach (var q in data.Quests.Values)
        {
            if (q.ZoneOrSort <= 0 || data.Parent(q.ZoneOrSort) != area.Id || data.Instances.Contains(q.ZoneOrSort)) continue;
            if (q.Repeatable || q.Parent != 0 || q.NeedsSkill || q.NeedsReputation) continue;
            if (q.Races != 0 && (q.Races & mask) == 0) continue;
            if (solo && data.EliteTarget(q) != null) continue;
            if (!data.OpenTo(q, faction)) continue;
            // given out in this zone (not in a city or a dungeon): that's where the band's guide sends you
            bool Here(Dictionary<int, List<Pt>> sp) => sp.Keys.Any(a => a == area.Id || data.Parent(a) == area.Id);
            if (!q.StartNpcs.Any(n => data.Npcs.TryGetValue(n, out var nr) && Here(nr.Spawns)) && !q.StartObjects.Any(o => data.Objects.TryGetValue(o, out var or) && Here(or.Spawns))) continue;
            if (cfg != null && cfg.Exclude.ContainsKey(q.Id.ToString())) continue;
            levels.Add(Math.Clamp(data.BandLevel(q), 1, Game.MaxLevel));
        }
        if (levels.Count < Tuning.BandMinQuests) return new();
        levels.Sort();
        int coreLo = levels[(int)(levels.Count * (1 - Tuning.ZoneTopPercentile) / 2)];
        int coreHi = levels[Math.Min(levels.Count - 1, (int)(levels.Count * Tuning.ZoneTopPercentile))];
        if (cfg?.MinLevel is int cmin) coreLo = Math.Max(coreLo, cmin);
        int top = Math.Min(Game.MaxLevel, cfg?.MaxLevel ?? coreHi + Tuning.ZoneLevelSlack);
        // quests a little below the core go in the first band; far below (a stray low quest) they are left out
        int bottom = Math.Max(cfg?.MinLevel ?? 1, levels.Where(l => l >= coreLo - Tuning.BandWidth).DefaultIfEmpty(coreLo).Min());
        int dropped = levels.Count(l => l < bottom || l > top);
        if (dropped > 0) notes?.Add($"{area.Name}: {dropped} quest{(dropped == 1 ? "" : "s")} well outside its main range of {coreLo}-{coreHi} left out of its bands");

        int span = coreHi - coreLo + 1, k = Math.Max(1, (int)Math.Round(span / (double)Tuning.BandWidth, MidpointRounding.AwayFromZero));
        double w = span / (double)k;
        var cuts = new List<(int lo, int hi)>();
        for (int i = 0; i < k; i++) cuts.Add((coreLo + (int)Math.Round(i * w, MidpointRounding.AwayFromZero), coreLo + (int)Math.Round((i + 1) * w, MidpointRounding.AwayFromZero) - 1));
        cuts[0] = (Math.Min(cuts[0].lo, bottom), cuts[0].hi);
        cuts[^1] = (cuts[^1].lo, Math.Max(cuts[^1].hi, top));
        int Count((int lo, int hi) c) => levels.Count(l => l >= c.lo && l <= c.hi);
        // a band with too few quests to be worth a guide goes in with its smaller neighbour, as long as that doesn't make
        // a band more than twice the usual width; then it stays a small band of its own
        var small = new HashSet<int>();
        while (cuts.Count > 1)
        {
            int i = cuts.FindIndex(c => Count(c) < Tuning.BandMinQuests && !small.Contains(c.lo));
            if (i < 0) break;
            var js = new[] { i - 1, i + 1 }.Where(j => j >= 0 && j < cuts.Count && Math.Max(cuts[i].hi, cuts[j].hi) - Math.Min(cuts[i].lo, cuts[j].lo) + 1 <= 2 * Tuning.BandWidth).OrderBy(j => Count(cuts[j])).ToList();
            if (js.Count == 0) { small.Add(cuts[i].lo); continue; }
            int a = Math.Min(i, js[0]);
            cuts[a] = (cuts[a].lo, cuts[a + 1].hi); cuts.RemoveAt(a + 1);
        }
        return cuts.Select(c => new Band(area, c.lo, c.hi, Count(c))).Where(b => b.Quests > 0).ToList();
    }

    /// <summary>
    /// Lowest band first; of the bands that start at the same level (or within PlanTieLevels of it), the nearest to the
    /// last band's zone first, then the one that ends lowest.
    /// </summary>
    public static List<Band> Order(List<Band> bands)
    {
        var left = bands.ToList(); var order = new List<Band>(); AreaInfo? at = null;
        while (left.Count > 0)
        {
            int low = left.Min(b => b.Min);
            var next = left.Where(b => b.Min <= low + Tuning.PlanTieLevels)
                           .OrderBy(b => Dist(at, b.Zone)).ThenBy(b => b.Min).ThenBy(b => b.Max).ThenBy(b => b.Zone.Name, StringComparer.OrdinalIgnoreCase).First();
            order.Add(next); left.Remove(next); at = next.Zone;
        }
        return order;
    }

    /// <summary>Roughly how far apart two zones are: their map centres, or a long way when on different continents.</summary>
    static double Dist(AreaInfo? a, AreaInfo b)
    {
        if (a == null) return 0;
        if (a.Id == b.Id) return -1;                       // staying put beats any move
        if (a.Continent != b.Continent) return 1e9;
        if (!a.HasBounds || !b.HasBounds) return 1e6;
        double ax = (a.Left + a.Right) / 2, ay = (a.Top + a.Bottom) / 2, bx = (b.Left + b.Right) / 2, by = (b.Top + b.Bottom) / 2;
        return Math.Sqrt((ax - bx) * (ax - bx) + (ay - by) * (ay - by));
    }

    /// <summary>Points each band's guide at the next one's with #next, and ends it with a step saying where to go.</summary>
    static void Link(List<(Band b, string path, GuideMeta meta)> built)
    {
        for (int i = 0; i < built.Count; i++)
        {
            var (b, path, meta) = built[i];
            var lines = File.ReadAllLines(path).ToList();
            for (int k = lines.Count - 1; k >= 0; k--)
                if (lines[k].Contains(Mark))
                {
                    if (lines[k].Trim() == Mark) { lines.RemoveAt(k); if (k < lines.Count && lines[k].StartsWith("#next ")) lines.RemoveAt(k); }
                    else { int s = k; while (s > 0 && !lines[s].StartsWith("step")) s--; lines.RemoveRange(s, k - s + 1); k = s; }
                }
            if (i + 1 < built.Count)
            {
                var (nb, _, nm) = built[i + 1];
                string target = nm.Parts[0].Sections.Count > 0 && nm.Parts[0].Sections[0].Guide.Length > 0 ? nm.Parts[0].Sections[0].Guide : nm.Name;
                string last = meta.Parts[^1].Guide.Length > 0 ? meta.Parts[^1].Guide : meta.Name;
                int at = lines.FindIndex(l => l == "#name " + last);
                if (at >= 0) lines.InsertRange(at + 1, new[] { Mark, $"#next {nm.Group}\\{target}" });
                int end = lines.FindLastIndex(l => l.StartsWith("]])", StringComparison.Ordinal));
                if (end >= 0) lines.InsertRange(end, new[] { "step", $"    +|cRXP_WARN_Next: {nb.Zone.Name}, levels {nb.Min}-{nb.Max}|r. Completing this step loads its guide {Mark}" });
            }
            File.WriteAllLines(path, lines);
        }
    }
}
