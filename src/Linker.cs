using System.Globalization;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Text.RegularExpressions;

namespace RouteBuilder;

/// <summary>
/// What the link command needs to know about a built guide, saved next to it as "&lt;guide&gt;.meta.json": its levels,
/// where a player can start it part-way, and the quests in it.
/// </summary>
public sealed class GuideMeta
{
    public string Zone = "", Faction = "", Who = "", Group = "", Name = "", File = "";
    public int Continent;
    public bool Suggest = true;                           // false: zone file says not to suggest this zone to other guides
    public List<MetaPart> Parts = new();
    public List<MetaQuest> Quests = new();
    public Dictionary<string, int> CarriedTo = new();     // zone -> quests picked up here and handed in there

    public sealed class MetaPart
    {
        public int Part; public double Start, End; public int? Next;
        public string Guide = "";                         // the guide this part ends in (the whole zone's, unless it is split)
        public List<MetaSection> Sections = new();
    }
    public sealed class MetaSection { public string Label = "", Name = "", Guide = ""; public int Level, Index; }
    public sealed class MetaQuest
    {
        public int Id, Level, Req, Xp, Part, Section; public string Tag = "";
        public string? From;     // a quest picked up in another zone (and handed in here): that zone
    }

    static readonly JsonSerializerOptions Json = new() { IncludeFields = true, WriteIndented = true, PropertyNamingPolicy = JsonNamingPolicy.CamelCase, DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull };

    public static string PathFor(string guidePath) => Path.ChangeExtension(guidePath, ".meta.json");

    /// <summary>The summary of a guide just built (one entry per part).</summary>
    public static GuideMeta From(GameData data, List<(ZoneModel m, GuideOutput g)> visits)
    {
        var m0 = visits[0].m; var g0 = visits[0].g;
        var meta = new GuideMeta { Zone = m0.Main.Name, Faction = m0.Opt.Faction, Who = Emitter.Who(m0), Group = g0.Group, Name = g0.Name, File = g0.FileName, Continent = m0.Main.Continent, Suggest = m0.Cfg.Suggest ?? true };
        string ZoneOf(string place)
        {
            var a = data.FindArea(place);
            return a != null && ZoneModel.CityParent(a.Id) is { } p ? data.AreaName(p) : place;
        }
        for (int i = 0; i < visits.Count; i++)
        {
            var (m, g) = visits[i];
            var part = new MetaPart { Part = m.Visit.Number, Start = Math.Round(m.StartLevel, 2), End = Math.Round(g.EndLevel, 2), Next = i + 1 < visits.Count ? (int)Math.Floor(visits[i + 1].m.StartLevel) : null };
            foreach (var sec in g.Sections) part.Sections.Add(new MetaSection { Label = sec.Label, Level = sec.Level, Name = sec.Name, Guide = sec.Guide, Index = sec.Index });
            if (part.Sections.Count == 0) part.Sections.Add(new MetaSection { Level = (int)Math.Floor(m.StartLevel), Name = "start", Guide = g.Name });
            part.Guide = part.Sections[^1].Guide.Length > 0 ? part.Sections[^1].Guide : g.Name;
            meta.Parts.Add(part);
            foreach (var q in m.Quests.Values.OrderBy(q => q.Id))
            {
                if (q.Carried) { string z = ZoneOf(q.Destination ?? "another zone"); meta.CarriedTo[z] = meta.CarriedTo.GetValueOrDefault(z) + 1; continue; }
                if (!q.HasTurnin || q.Optional || q.Late || q.Conditional) continue;
                if (q.Arrival && (q.Origin == null || q.Origin.StartsWith("your earlier visit"))) continue;
                meta.Quests.Add(new MetaQuest
                {
                    Id = q.Id, Level = q.Level, Req = q.Req, Xp = q.Xp, Part = m.Visit.Number, Section = g.QuestSection.GetValueOrDefault(q.Id), Tag = q.Tag,
                    From = q.Arrival ? ZoneOf(q.Origin!) : null,
                });
            }
        }
        return meta;
    }

    public void Save(string path) => System.IO.File.WriteAllText(path, JsonSerializer.Serialize(this, Json));
    public static GuideMeta? Load(string path)
    {
        try { return JsonSerializer.Deserialize<GuideMeta>(System.IO.File.ReadAllText(path), Json); } catch { return null; }
    }
}

/// <summary>
/// Ranks the zones to go to where a guide ends (and at each "come back at level N" break), from the other guides built
/// into the same folder, and writes the suggestions into the guides: a step listing them, and "#next" so RestedXP
/// loads the best one when the guide is finished.
/// </summary>
public static class Linker
{
    const string Mark = "--RouteBuilder:next";
    static readonly CultureInfo Inv = CultureInfo.InvariantCulture;

    public sealed record Pick(GuideMeta Guide, double Levels, int EntryLevel, string EntryName, string EntryGuide, int Carried);

    public static int Run(string dir)
    {
        if (!Directory.Exists(dir)) throw new InvalidOperationException($"guides folder not found: {dir}");
        var metas = new List<GuideMeta>();
        foreach (var f in Directory.EnumerateFiles(dir, "*.meta.json").OrderBy(f => f, StringComparer.OrdinalIgnoreCase))
        {
            var mt = GuideMeta.Load(f);
            if (mt == null) { Console.WriteLine($"  skipped {Path.GetFileName(f)}: could not be read"); continue; }
            if (!File.Exists(Path.Combine(dir, mt.File))) continue;       // the guide itself was deleted
            metas.Add(mt);
        }
        if (metas.Count == 0) { Console.WriteLine($"No guide summaries (.meta.json) in {dir}. Build some guides first; each build writes one."); return 1; }
        Console.WriteLine($"Linking {metas.Count} guides in {dir}:");
        foreach (var g in metas)
        {
            var lines = File.ReadAllLines(Path.Combine(dir, g.File)).ToList();
            Strip(lines);
            var said = new List<string>(); List<Pick>? last = null;
            foreach (var part in g.Parts)
            {
                int lvl = (int)Math.Floor(part.End);
                var picks = Rank(g, lvl, metas).Take(Tuning.LinkSuggestions).ToList();
                if (part.Next is { } next)
                {
                    if (picks.Count > 0 && InsertBeforeGate(lines, next, part.Guide != g.Name ? EndStep(picks, lvl) : GateStep(picks, lvl, next, g.Zone), part.Guide != g.Name))
                    {
                        // a zone split into guides: the part ends a guide, which can lead on to the best of them meanwhile
                        if (part.Guide != g.Name) AddNext(lines, picks, part.Guide);
                        said.Add($"at level {lvl} (until {next}): " + string.Join(", ", picks.Select(Short)));
                    }
                }
                else last = picks;
            }
            if (last is { Count: > 0 })
            {
                int lvl = (int)Math.Floor(g.Parts[^1].End);
                AddNext(lines, last, g.Parts[^1].Guide);
                int end = lines.FindLastIndex(l => l.StartsWith("]])", StringComparison.Ordinal));
                if (end >= 0) lines.InsertRange(end, EndStep(last, lvl));
                said.Add($"at the end (level {lvl}): " + string.Join(", ", last.Select(Short)));
            }
            File.WriteAllLines(Path.Combine(dir, g.File), lines);
            Console.WriteLine($"  {g.Name} ({g.Who}): " + (said.Count > 0 ? string.Join("; ", said) : "no other built guide fits its end level"));
        }
        return 0;
    }

    static string Short(Pick p) => $"{p.Guide.Zone} ({p.Levels.ToString("0.0", Inv)})";

    /// <summary>
    /// The other zones' guides by how much quest experience a player of <paramref name="level"/> can still get from them
    /// (from the section of the guide they would start at), counting quests carried in from this zone, and a little
    /// less for zones across the sea.
    /// </summary>
    public static List<Pick> Rank(GuideMeta from, int level, List<GuideMeta> all)
    {
        var words = from.Who.Split(' ', StringSplitOptions.RemoveEmptyEntries).ToHashSet(StringComparer.OrdinalIgnoreCase);
        bool Applies(string tag) => tag.Length == 0 || from.Who != from.Faction && tag.Split('/').Any(t => t.Split(' ', StringSplitOptions.RemoveEmptyEntries).All(words.Contains));
        var best = new Dictionary<string, Pick>(StringComparer.OrdinalIgnoreCase);
        foreach (var h in all)
        {
            if (h.Zone.Equals(from.Zone, StringComparison.OrdinalIgnoreCase) || h.Faction != from.Faction || !h.Suggest) continue;
            if (h.Who != from.Who && h.Who != h.Faction) continue;          // another character's own guide
            // where the guide's level jumps would put this player
            var starts = h.Parts.SelectMany(p => p.Sections.Select(s => (p.Part, Sec: s.Index, s.Level, s.Name, Guide: s.Guide.Length > 0 ? s.Guide : h.Name))).ToList();
            if (starts.Count == 0 || starts[0].Level > level + 1) continue;
            var entry = starts.Last(s => s.Level <= Math.Max(level, starts[0].Level));
            double xp = 0; int carried = 0;
            foreach (var q in h.Quests)
            {
                if (q.Part != entry.Part || q.Section < entry.Sec || q.Req > level + 1 || !Applies(q.Tag)) continue;
                if (q.From != null && !q.From.Equals(from.Zone, StringComparison.OrdinalIgnoreCase)) continue;
                if (q.From != null) carried++;
                xp += q.Xp * GrayFactor(level - q.Level);
            }
            if (h.Continent != from.Continent) xp *= Tuning.LinkOtherContinent;
            double levels = Game.FracLevel(Game.XpAt(level) + xp) - level;
            if (levels < Tuning.LinkMinLevels) continue;
            var pick = new Pick(h, levels, entry.Level, entry.Name, entry.Guide, carried);
            // a guide made for this character beats the faction's guide of the same zone
            if (!best.TryGetValue(h.Zone, out var had) || h.Who == from.Who && had.Guide.Who != from.Who || (h.Who == had.Guide.Who) && levels > had.Levels) best[h.Zone] = pick;
        }
        return best.Values.OrderByDescending(p => p.Levels).ThenBy(p => p.Guide.Zone).ToList();
    }

    /// <summary>Classic's cut in quest experience for quests below your level.</summary>
    static double GrayFactor(int over) => over <= 5 ? 1 : over == 6 ? 0.8 : over == 7 ? 0.6 : over == 8 ? 0.4 : over == 9 ? 0.2 : 0.1;

    static string Describe(Pick p) =>
        $"|cRXP_FRIENDLY_{p.Guide.Zone}|r (about {p.Levels.ToString("0.0", Inv)} levels of quests" +
        (p.EntryName != "start" && !p.EntryName.StartsWith("part ") ? $", starting {p.EntryName}" : "") +
        (p.Carried > 0 ? $"; {p.Carried} quest{(p.Carried == 1 ? "" : "s")} from here hand{(p.Carried == 1 ? "s" : "")} in there" : "") + ")";

    static List<string> EndStep(List<Pick> picks, int level) => new()
    {
        "step",
        $"    +|cRXP_WARN_Suggested next zones at level {level}|r: {string.Join(", ", picks.Select(Describe))}. Completing this step loads the guide for {picks[0].Guide.Zone} {Mark}",
    };

    static List<string> GateStep(List<Pick> picks, int level, int next, string zone) => new()
    {
        "step",
        $"    +|cRXP_WARN_Until level {next}, suggested zones|r: {string.Join(", ", picks.Select(Describe))}. Then come back to this {zone} guide {Mark}",
    };

    /// <summary>Takes out what an earlier link run put in.</summary>
    static void Strip(List<string> lines)
    {
        for (int i = lines.Count - 1; i >= 0; i--)
        {
            if (!lines[i].Contains(Mark)) continue;
            // a guide header's #next, marked by the comment line before it (a comment after it would end up in the guide name)
            if (lines[i].Trim() == Mark) { lines.RemoveAt(i); if (i < lines.Count && lines[i].StartsWith("#next ")) lines.RemoveAt(i); continue; }
            int s = i; while (s > 0 && !lines[s].StartsWith("step")) s--;
            int e = i + 1; while (e < lines.Count && !lines[e].StartsWith("step") && !lines[e].StartsWith("]])")) e++;
            lines.RemoveRange(s, e - s); i = s;
        }
    }

    static bool InsertBeforeGate(List<string> lines, int next, List<string> step, bool split)
    {
        var rx = new Regex($@"^\s+(\.xp {next} >>|\+).*is planned from level {next}\.");
        int at = lines.FindIndex(l => rx.IsMatch(l));
        if (at < 0) return false;
        int s = at; while (s > 0 && !lines[s].StartsWith("step")) s--;
        // in one guide, shown to the same characters as the level check (when the rest of the zone is for some classes only:
        // the others go on to the end of the guide); split, this guide ends here for everyone
        lines.InsertRange(s, new[] { split ? "step" : lines[s] }.Concat(step.Skip(1)));
        return true;
    }

    static void AddNext(List<string> lines, List<Pick> picks, string guide)
    {
        int at = lines.FindIndex(l => l == "#name " + guide);
        if (at < 0) return;
        lines.InsertRange(at + 1, new[] { Mark, "#next " + string.Join(";", picks.Select(p => $"{p.Guide.Group}\\{p.EntryGuide}")) });
    }
}
