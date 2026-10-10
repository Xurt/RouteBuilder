using System.Text.RegularExpressions;

namespace RouteBuilder;

/// <summary>
/// A training, vendor or flight-path step from a RestedXP guide, with the quest steps around it in that guide,
/// so it can be put next to the same quest step in a RouteBuilder guide.
/// </summary>
public sealed class RxpService
{
    public string Id = "";                     // what it does, for not placing the same step twice
    public string Guide = "", Faction = "", Tag = "";
    public int Map = -1;                       // the map ID of its .goto, -1 = none
    public int MinLevel = 1, MaxLevel = 99;    // the level range in its guide's name ("12-17 The Barrens")
    public List<string> Lines = new();         // the lines kept, as written in the guide
    public List<(string Key, bool After)> Anchors = new();   // nearest first: quest steps to stand after (or before)
}

public static class RxpServices
{
    static readonly HashSet<string> Service = new() { "train", "trainer", "vendor", "fp" };
    // the lines worth carrying over with it: where, who, what, and the conditions RestedXP puts on it
    static readonly HashSet<string> Keep = new()
    {
        "goto", "train", "trainer", "vendor", "fp", "fly", "target", "money", "xp", "collect", "buy", "zoneskip", "subzoneskip",
        "isQuestTurnedIn", "isOnQuest", "isQuestComplete", "skipgossip", "istrained",
    };
    static readonly Regex Cmd = new(@"^\.(\w+)\s*(\d+)?(?:\s*,\s*(\d+))?", RegexOptions.Compiled);
    const int Reach = 8;                       // how many quest steps either side to look for one this guide also has

    static readonly Regex NamedGoto = new(@"^\.goto\s+([A-Za-z][^,]*?)\s*,\s*(\d+(?:\.\d+)?)\s*,\s*(\d+(?:\.\d+)?)(.*)$", RegexOptions.Compiled);

    /// <summary>
    /// Older RestedXP guides name the zone and give map percent (".goto Ashenvale,37.36,51.79"); Forever's give the map
    /// ID and world coordinates (".goto 1440/1,..."). Rewrites the first kind into the second, which is what RouteBuilder
    /// works in. Lines it cannot place (an unknown zone name) are returned unchanged.
    /// </summary>
    public static string NormalizeGoto(string line, GameData data)
    {
        var m = NamedGoto.Match(line);
        if (!m.Success || data.FindArea(m.Groups[1].Value.Trim()) is not { } a) return line;
        var pct = new Pt(double.Parse(m.Groups[2].Value, System.Globalization.CultureInfo.InvariantCulture), double.Parse(m.Groups[3].Value, System.Globalization.CultureInfo.InvariantCulture));
        if (!a.HasBounds) return string.Create(System.Globalization.CultureInfo.InvariantCulture, $".goto {a.UiMap},{pct.X:0.00},{pct.Y:0.00}{m.Groups[4].Value}");
        var w = a.ToWorld(pct);
        return string.Create(System.Globalization.CultureInfo.InvariantCulture, $".goto {a.UiMap}/{a.Continent},{w.X:0.00},{w.Y:0.00}{m.Groups[4].Value}");
    }

    /// <summary>
    /// The lines worth carrying over from one RestedXP step, if it is a training, vendor or flight-path step (null if not,
    /// or if it is RestedXP's hardcore-mode version of one), and the map ID of its first .goto (-1 = none).
    /// </summary>
    public static List<string>? ServiceLines(IEnumerable<(string Text, string Tag)> lines, out int map)
    {
        map = -1;
        var all = lines.ToList();
        if (!all.Any(x => Cmd.Match(x.Text) is { Success: true } c && Service.Contains(c.Groups[1].Value))) return null;
        if (all.Any(x => x.Text.StartsWith("#hardcore"))) return null;     // the normal version of the step is used
        var kept = new List<string>();
        foreach (var (t, lt) in all)
        {
            bool isText = t.StartsWith(">>") || t.StartsWith('+');
            var c = Cmd.Match(t);
            if (!isText && !(c.Success && Keep.Contains(c.Groups[1].Value))) continue;
            if (c.Success && c.Groups[1].Value == "goto" && map < 0 && Regex.Match(t, @"^\.goto\s+(\d+)") is { Success: true } g) map = int.Parse(g.Groups[1].Value);
            kept.Add(lt.Length > 0 ? $"{t} << {lt}" : t);
        }
        return kept;
    }

    /// <summary>What a service step does, ignoring where it is and how it is worded: the same step from two places is placed once.</summary>
    public static string IdOf(string tag, IEnumerable<string> lines) =>
        tag + "|" + string.Join("|", lines.Where(x => !x.StartsWith(".goto") && !x.StartsWith(">>")).Select(x => Regex.Replace(x.Trim(), @"\s+", " ")));

    /// <summary>Every service step in the RestedXP guide files' text, by guide.</summary>
    public static List<RxpService> Read(string file, string text, GameData? data = null)
    {
        var all = new List<RxpService>();
        foreach (Match block in Regex.Matches(text, @"RegisterGuide\(\s*\[\[(.*?)\]\]", RegexOptions.Singleline))
        {
            string name = Path.GetFileNameWithoutExtension(file), faction = "";
            var steps = new List<(string Tag, bool Along, List<(string Text, string Tag)> Lines)>();
            foreach (var raw in block.Groups[1].Value.Split('\n'))
            {
                string l = Regex.Replace(raw, "--.*$", "").Trim();
                if (l.Length == 0) continue;
                string tag = ""; int ti = l.LastIndexOf("<<", StringComparison.Ordinal);
                if (ti >= 0) { tag = l[(ti + 2)..].Trim(); l = l[..ti].TrimEnd(); }
                if (steps.Count == 0 && l.Length == 0) { if (tag.StartsWith("Horde")) faction = "Horde"; else if (tag.StartsWith("Alliance")) faction = "Alliance"; continue; }
                if (data != null) l = NormalizeGoto(l, data);
                if (l.StartsWith("#name ")) { name = l[6..].Trim(); continue; }
                if (l == "step") { steps.Add((tag, false, new())); continue; }
                if (steps.Count == 0) continue;
                if (l.StartsWith("#completewith")) { var s = steps[^1]; steps[^1] = (s.Tag, true, s.Lines); continue; }
                steps[^1].Lines.Add((l, tag));
            }

            // the quest steps of the guide in order: (step number, key)
            var actions = new List<(int Step, string Key)>();
            for (int i = 0; i < steps.Count; i++)
            {
                if (steps[i].Along) continue;
                foreach (var (t, _) in steps[i].Lines)
                {
                    var c = Cmd.Match(t); if (!c.Success || !c.Groups[2].Success) continue;
                    string? key = c.Groups[1].Value switch
                    {
                        "accept" => "accept:" + c.Groups[2].Value,
                        "turnin" => "turnin:" + c.Groups[2].Value,
                        "complete" when c.Groups[3].Success => $"obj:{c.Groups[2].Value}:{c.Groups[3].Value}",
                        _ => null,
                    };
                    if (key != null) actions.Add((i, key));
                }
            }

            for (int i = 0; i < steps.Count; i++)
            {
                var (tag, along, lines) = steps[i];
                if (along || ServiceLines(lines, out int map) is not { } kept) continue;
                var svc = new RxpService { Guide = name, Faction = faction, Tag = tag, Map = map, Lines = kept };
                if (Regex.Match(name, @"^(\d+)\s*-\s*(\d+)") is { Success: true } rg) { svc.MinLevel = int.Parse(rg.Groups[1].Value); svc.MaxLevel = int.Parse(rg.Groups[2].Value); }
                // quest steps in the same step first (a class quest handed in at the trainer), then before it, then after it
                foreach (var a in actions.Where(a => a.Step == i)) svc.Anchors.Add((a.Key, true));
                foreach (var a in actions.Where(a => a.Step < i).Reverse().Take(Reach)) svc.Anchors.Add((a.Key, true));
                foreach (var a in actions.Where(a => a.Step > i).Take(Reach)) svc.Anchors.Add((a.Key, false));
                svc.Id = IdOf(tag, kept);
                if (svc.Anchors.Count > 0) all.Add(svc);
            }
        }
        return all;
    }
}
