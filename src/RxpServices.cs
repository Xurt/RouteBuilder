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
    static readonly string[] HordeRaces = { "Orc", "Undead", "Scourge", "Tauren", "Troll" }, AllianceRaces = { "Human", "Dwarf", "NightElf", "Gnome" };
    static readonly HashSet<string> Classes = Game.Classes.Select(c => c.Name).ToHashSet(StringComparer.OrdinalIgnoreCase);
    static readonly HashSet<string> RaceNames = HordeRaces.Concat(AllianceRaces).Append("Skyborne").ToHashSet(StringComparer.OrdinalIgnoreCase);

    /// <summary>The faction a guide's "&lt;&lt; ..." line is for: named, or known from the races it names (null: either).</summary>
    public static string? SideOf(string tag)
    {
        if (Regex.IsMatch(tag, @"\bHorde\b")) return "Horde";
        if (Regex.IsMatch(tag, @"\bAlliance\b")) return "Alliance";
        var words = Regex.Matches(tag, @"(?<![!\w])[A-Za-z]+").Select(x => x.Value).ToList();
        bool h = words.Any(w => HordeRaces.Contains(w, StringComparer.OrdinalIgnoreCase)), a = words.Any(w => AllianceRaces.Contains(w, StringComparer.OrdinalIgnoreCase));
        return h && !a ? "Horde" : a && !h ? "Alliance" : null;
    }

    /// <summary>A guide's "&lt;&lt; ..." line names a race or class it is only for ("Human Mage"), not just a faction or an exception ("!Hunter").</summary>
    public static bool ForSome(string tag) =>
        Regex.Matches(tag, @"(?<![!\w])[A-Za-z]+").Any(x => Classes.Contains(x.Value) || RaceNames.Contains(x.Value));

    /// <summary>
    /// Both of two RestedXP tags ("/" = or, space = and): a step tagged "Warrior/Rogue" in a guide for "Human" is for
    /// "Human Warrior/Human Rogue". Faction words are dropped (the faction is a guide's own).
    /// </summary>
    public static string BothTags(string a, string b)
    {
        static List<string> Alts(string t) => t.Split('/').Select(x => string.Join(" ", x.Split(' ', StringSplitOptions.RemoveEmptyEntries).Where(w => w is not ("Horde" or "Alliance")))).Where(x => x.Length > 0).ToList();
        var A = Alts(a); var B = Alts(b);
        if (A.Count == 0) return string.Join("/", B);
        if (B.Count == 0) return string.Join("/", A);
        return string.Join("/", A.SelectMany(x => B.Select(y => x + " " + y)));
    }
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
    /// RestedXP's "#season" names the classic seasons a step is for (0 = normal, 1 = Mastery, 2 = Discovery). Forever plays
    /// as season 0, so a step for other seasons only (Season of Discovery runes) is not for us.
    /// </summary>
    public static bool OtherSeason(IEnumerable<string> lines)
    {
        foreach (var l in lines)
        {
            var m = Regex.Match(l, @"^#season\s+([\d,\s]+)");
            if (m.Success) return !m.Groups[1].Value.Split(',', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries).Contains("0");
        }
        return false;
    }

    /// <summary>
    /// RestedXP guides hold two routes in one file: steps marked "#softcore" only show in softcore mode, where the route
    /// dies on purpose to skip a walk (".deathskip"), and "#hardcore" ones only in hardcore mode. RouteBuilder plans walking,
    /// which is the hardcore route, so softcore-only steps are left out (and hardcore-only ones kept).
    /// </summary>
    public static bool SoftcoreOnly(IEnumerable<string> lines) => lines.Any(l => l.Trim() == "#softcore");

    static readonly Regex AnyGoto = new(@"^\.goto\s+(\d+)", RegexOptions.Compiled);
    /// <summary>The map of a step's first .goto, or -1.</summary>
    public static int MapOf(IEnumerable<string> lines) => lines.Select(l => AnyGoto.Match(l)).FirstOrDefault(g => g.Success) is { } g ? int.Parse(g.Groups[1].Value) : -1;

    /// <summary>
    /// The lines worth carrying over from one RestedXP step, if it is a training, vendor or flight-path step (null if not,
    /// or if it is RestedXP's hardcore-mode version of one), and the map ID of its first .goto (-1 = none).
    /// </summary>
    public static List<string>? ServiceLines(IEnumerable<(string Text, string Tag)> lines, out int map)
    {
        map = -1;
        var all = lines.ToList();
        if (!all.Any(x => Cmd.Match(x.Text) is { Success: true } c && Service.Contains(c.Groups[1].Value))) return null;
        if (SoftcoreOnly(all.Select(x => x.Text))) return null;             // the walking (hardcore) version of the step is used
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
            string name = Path.GetFileNameWithoutExtension(file), faction = "", guideTag = "";
            var steps = new List<(string Tag, bool Along, List<(string Text, string Tag)> Lines)>();
            foreach (var raw in block.Groups[1].Value.Split('\n'))
            {
                string l = Regex.Replace(raw, "--.*$", "").Trim();
                if (l.Length == 0) continue;
                string tag = ""; int ti = l.LastIndexOf("<<", StringComparison.Ordinal);
                if (ti >= 0) { tag = l[(ti + 2)..].Trim(); l = l[..ti].TrimEnd(); }
                if (steps.Count == 0 && l.Length == 0) { faction = SideOf(tag) ?? faction; guideTag = tag; continue; }
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
                if (steps[i].Along || OtherSeason(steps[i].Lines.Select(x => x.Text)) || SoftcoreOnly(steps[i].Lines.Select(x => x.Text))) continue;
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

            int lastMap = -1;
            for (int i = 0; i < steps.Count; i++)
            {
                var (tag, along, lines) = steps[i];
                int here = MapOf(lines.Select(x => x.Text));
                if (here >= 0) lastMap = here;
                if (along || OtherSeason(lines.Select(x => x.Text)) || ServiceLines(lines, out int map) is not { } kept) continue;
                // a step with no .goto of its own is done where the guide last sent you
                // a guide only for some characters ("<< Human Mage") makes its steps theirs
                if (ForSome(guideTag)) tag = BothTags(guideTag, tag);
                var svc = new RxpService { Guide = name, Faction = faction, Tag = tag, Map = map >= 0 ? map : lastMap, Lines = kept };
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
