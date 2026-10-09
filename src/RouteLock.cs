using System.Globalization;
using System.Text;
using System.Text.Json;
using System.Text.RegularExpressions;

namespace RouteBuilder;

/// <summary>One saved step: what it is, and the spot the plan used for it (map ID and coordinates as in the guide's .goto; Map -1 = none).</summary>
public sealed record LockedStep(string Key, int Map, double X, double Y)
{
    /// <summary>Every waypoint of the step it was read from, when that step had a loop; empty = just (X, Y).</summary>
    public List<Pt> Loop { get; init; } = new();
    public double Distance(Pt p) => Loop.Count == 0 ? p.To(new Pt(X, Y)) : Loop.Min(q => q.To(p));
}

/// <summary>
/// The step order of a finished build, saved in locks/ so the next build of the same guide keeps it.
/// Only steps that are new, or whose prerequisites changed, are planned again; everything else stays put.
/// The file is plain JSON with one line per step, so it can be read, and reordered by hand.
/// </summary>
public sealed class RouteLock
{
    public Dictionary<int, List<LockedStep>> Parts = new();

    sealed class FileShape
    {
        public string? About { get; set; }
        public string? Guide { get; set; }
        public string? Saved { get; set; }
        public List<PartShape> Parts { get; set; } = new();
    }
    sealed class PartShape
    {
        public int Part { get; set; }
        public List<string> Steps { get; set; } = new();
    }

    static readonly JsonSerializerOptions Json = new()
    {
        PropertyNamingPolicy = JsonNamingPolicy.CamelCase, PropertyNameCaseInsensitive = true, WriteIndented = true,
        ReadCommentHandling = JsonCommentHandling.Skip, AllowTrailingCommas = true,
    };
    static readonly Regex StepRx = new(@"^\s*(\S+)\s*(?:@\s*(-?\d+)\s*:\s*(-?[\d.]+)\s*,\s*(-?[\d.]+))?", RegexOptions.Compiled);

    /// <summary>locks/&lt;Zone&gt;[ range] (&lt;who&gt;).json for the options this build was run with.</summary>
    public static string PathFor(string zone, BuildOptions bo)
    {
        string who = bo.Race != null || bo.Class != null
            ? string.Join(" ", new[] { bo.Race, bo.Class }.Where(s => s != null).Select(s => char.ToUpperInvariant(s![0]) + s[1..].ToLowerInvariant()))
            : bo.Faction;
        string range = bo.MinLevel != null && bo.MaxLevel != null ? $" {bo.MinLevel}-{bo.MaxLevel}"
                     : bo.MinLevel != null ? $" from {bo.MinLevel}" : bo.MaxLevel != null ? $" to {bo.MaxLevel}" : "";
        return Path.Combine("locks", $"{zone}{range} ({who}).json");
    }

    public static RouteLock? Load(string path)
    {
        if (!File.Exists(path)) return null;
        FileShape shape;
        try { shape = JsonSerializer.Deserialize<FileShape>(File.ReadAllText(path), Json) ?? new FileShape(); }
        catch (JsonException e) { throw new InvalidOperationException($"{path}: {e.Message} (fix it, delete it, or build with --fresh)"); }
        var lk = new RouteLock();
        foreach (var p in shape.Parts)
        {
            var list = new List<LockedStep>();
            foreach (var s in p.Steps)
            {
                var mt = StepRx.Match(s);
                if (!mt.Success) continue;
                list.Add(mt.Groups[2].Success
                    ? new LockedStep(mt.Groups[1].Value, int.Parse(mt.Groups[2].Value, CultureInfo.InvariantCulture),
                        double.Parse(mt.Groups[3].Value, CultureInfo.InvariantCulture), double.Parse(mt.Groups[4].Value, CultureInfo.InvariantCulture))
                    : new LockedStep(mt.Groups[1].Value, -1, 0, 0));
            }
            lk.Parts[p.Part] = list;
        }
        return lk;
    }

    public static void Save(string path, string guideName, IEnumerable<(int part, ZoneModel m, RouteResult r)> parts)
    {
        var shape = new FileShape
        {
            About = "Step order RouteBuilder keeps between builds of this guide. New steps are slotted in; the rest stay where they are. " +
                    "Lines can be moved by hand. Delete the file, or build with --fresh, to plan the guide from scratch.",
            Guide = guideName, Saved = DateTime.Now.ToString("yyyy-MM-dd HH:mm", CultureInfo.InvariantCulture),
        };
        foreach (var (part, m, r) in parts)
        {
            var keys = Keys(m);
            shape.Parts.Add(new PartShape
            {
                Part = part,
                Steps = r.Seq.Where(t => !m.Tasks[t].Deferred).Select(t =>
                {
                    var (map, p) = Spot(m, m.Tasks[t].Cands[r.Choice[t]]);
                    return string.Create(CultureInfo.InvariantCulture, $"{keys[t]} @{map}:{p.X:0.##},{p.Y:0.##}  {m.Tasks[t]}");
                }).ToList(),
            });
        }
        Directory.CreateDirectory(Path.GetDirectoryName(path)!);
        File.WriteAllText(path, JsonSerializer.Serialize(shape, Json), new UTF8Encoding(false));
    }

    /// <summary>A place as the guide writes it: the map ID, and world coordinates (map percent where the map has no size).</summary>
    public static (int map, Pt p) Spot(ZoneModel m, Cand c)
    {
        var a = m.Areas[c.Area];
        return (a.UiMap, a.HasBounds ? c.Pos : a.ToPercent(c.Pos));
    }

    static readonly Regex CmdKey = new(@"^\s*\.(\w+)\s+(\d+)", RegexOptions.Compiled);       // ".collect 16333,1,6395,1" -> collect16333
    static readonly Regex CollectRx = new(@"^\s*\.collect\s+(\d+)\s*,\s*\d+\s*,\s*(\d+)", RegexOptions.Compiled);
    static readonly Regex GotoRx = new(@"^\s*\.goto\s+(\d+)(?:/\d+)?\s*,\s*(-?[\d.]+)\s*,\s*(-?[\d.]+)", RegexOptions.Compiled);
    static readonly Regex CmdRx = new(@"^\s*\.(accept|turnin|complete|home|collect)\b\s*(-?\d+)?(?:\s*,\s*(\d+))?", RegexOptions.Compiled);

    /// <summary>
    /// Reads the step order out of a guide RouteBuilder wrote earlier, for a guide built before locks existed.
    /// Steps shown "as you go", travel and hearth steps, and early offers are passed over.
    /// </summary>
    public static RouteLock FromGuide(string path)
    {
        if (!File.Exists(path)) throw new InvalidOperationException($"guide not found: {path}");
        var lk = new RouteLock(); int part = 1; var list = new List<LockedStep>();
        var step = new List<string>();
        void Flush()
        {
            if (step.Count == 0) return;
            bool along = step.Any(l => l.TrimStart().StartsWith("#completewith"));
            bool early = step.Any(l => l.TrimStart().StartsWith(".xp <")) && step.Any(l => l.TrimStart().StartsWith(".accept"));
            bool gate = step.Any(l => l.Contains("is planned from level"));
            if (!along && !(early && step.Count(l => l.TrimStart().StartsWith(".")) <= 4))
            {
                int map = -1; double x = 0, y = 0; var loop = new List<Pt>();
                foreach (var l in step)
                {
                    var g = GotoRx.Match(l); if (!g.Success) continue;
                    var p = new Pt(double.Parse(g.Groups[2].Value, CultureInfo.InvariantCulture), double.Parse(g.Groups[3].Value, CultureInfo.InvariantCulture));
                    if (map < 0) { map = int.Parse(g.Groups[1].Value); x = p.X; y = p.Y; }
                    if (int.Parse(g.Groups[1].Value) == map) loop.Add(p);
                }
                bool item = step.Any(l => l.StartsWith(".collect")) && step.Any(l => l.StartsWith(".accept")) && step.Any(l => l.StartsWith(".use"));
                foreach (var l in step)
                {
                    var c = CmdRx.Match(l); if (!c.Success) continue;
                    string? key = c.Groups[1].Value switch
                    {
                        "accept" => (item ? "item:" : "accept:") + c.Groups[2].Value,
                        "turnin" => "turnin:" + c.Groups[2].Value,
                        "complete" when c.Groups[3].Success => $"obj:{c.Groups[2].Value}:{c.Groups[3].Value}",
                        "home" => "home",
                        "collect" when !item && CollectRx.Match(l) is { Success: true } cl => $"obj:{cl.Groups[2].Value}:collect{cl.Groups[1].Value}",
                        _ => null,
                    };
                    if (key == null) continue;
                    list.RemoveAll(s => s.Key == key);              // a step offered early is listed again where it was planned
                    list.Add(new LockedStep(key, map, x, y) { Loop = loop });
                }
            }
            if (gate) { lk.Parts[part++] = list; list = new List<LockedStep>(); }
            step.Clear();
        }
        foreach (var raw in File.ReadLines(path))
        {
            string l = raw.Trim();
            if (l.StartsWith("step")) { Flush(); step.Add(l); }
            else if (step.Count > 0) step.Add(l);
        }
        Flush();
        if (list.Count > 0) lk.Parts[part] = list;
        if (lk.Parts.Values.Sum(p => p.Count) == 0) throw new InvalidOperationException($"{path} has no steps RouteBuilder can read");
        return lk;
    }

    /// <summary>
    /// A name for every task that stays the same from build to build: accept:786, obj:786:1 (its quest-log line),
    /// turnin:786, item:830, home. Tasks sharing a name get ~2, ~3 on the end.
    /// </summary>
    public static string[] Keys(ZoneModel m)
    {
        var keys = new string[m.Tasks.Count]; var seen = new Dictionary<string, int>();
        foreach (var t in m.Tasks)
        {
            string k = t.Kind switch
            {
                TaskKind.Home => "home",
                TaskKind.Accept => $"accept:{t.Q!.Id}",
                TaskKind.ItemAccept => $"item:{t.Q!.Id}",
                TaskKind.TurnIn => $"turnin:{t.Q!.Id}",
                _ => $"obj:{t.Q!.Id}:{(t.Obj?.Index is int i ? i.ToString(CultureInfo.InvariantCulture) : t.Obj?.Command is { } cmd && CmdKey.Match(cmd) is { Success: true } ck ? ck.Groups[1].Value + ck.Groups[2].Value : "#" + t.ObjNo)}",
            };
            int n = seen[k] = seen.GetValueOrDefault(k) + 1;
            keys[t.Id] = n == 1 ? k : $"{k}~{n}";
        }
        return keys;
    }
}
