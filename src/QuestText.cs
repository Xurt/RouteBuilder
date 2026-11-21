using System.Text.RegularExpressions;

namespace RouteBuilder;

/// <summary>
/// The quest's own short description (QuestieDB's objectivesText) as the first line of every step that completes a quest
/// objective, in its own colour: ">>|cFFE6BBADKill 10 Kobold Vermin, then return to Marshal McBride.|r". Used by build
/// (on its own steps) and fill (on the guide's steps and the ones it adds). Lines it added before are taken out first,
/// so running it again on the same guide does not double them.
/// </summary>
public static class QuestText
{
    public const string Color = "FFE6BBAD";
    public const string Mark = ">>|c" + Color;
    static readonly Regex StepRx = new(@"^\s*step\b", RegexOptions.Compiled);
    static readonly Regex CompleteRx = new(@"^\s*\.complete\s+(\d+)[^<]*?(?:<<\s*(.+?))?\s*$", RegexOptions.Compiled);
    static readonly Regex OursRx = new(@"^\s*" + Regex.Escape(Mark), RegexOptions.Compiled);
    static readonly Regex BodyRx = new(@"(RegisterGuide\(\s*\[\[)(.*?)(\]\])", RegexOptions.Singleline | RegexOptions.Compiled);

    /// <summary>The description, made safe for a guide line, or null when the database has none.</summary>
    public static string? Text(QuestRow? q)
    {
        if (q == null) return null;
        string t = Regex.Replace(string.Join(" ", q.Text.Where(p => !string.IsNullOrWhiteSpace(p)).Select(p => p.Trim())), @"\s+", " ").Trim();
        if (t.Length == 0) return null;
        return t.Replace("|", "||")          // a literal pipe in a WoW string
                .Replace("--", "-")          // RestedXP cuts a line at "--" (a comment)
                .Replace("]]", "] ]")        // would end the guide's [[ ]] string
                .Replace("<<", "<").Replace(">>", ">");   // RestedXP's tag and text markers
    }

    /// <summary>Puts the lines into every guide in a file's text.</summary>
    public static string Apply(string fileText, GameData data)
    {
        string nl = fileText.Contains("\r\n") ? "\r\n" : "\n";
        return BodyRx.Replace(fileText, m =>
        {
            var lines = m.Groups[2].Value.Split('\n').Select(l => l.TrimEnd('\r')).ToList();
            return m.Groups[1].Value + string.Join(nl, Apply(lines, data)) + m.Groups[3].Value;
        });
    }

    /// <summary>
    /// The guide body with a description line under each "step" line, one per quest the step completes, in the order
    /// they first appear. A quest whose every .complete line in the step has the same tag ("<< Druid") gets that tag too.
    /// </summary>
    public static List<string> Apply(List<string> body, GameData data)
    {
        var o = new List<string>(body.Count + body.Count / 4);
        for (int i = 0; i < body.Count;)
        {
            if (!StepRx.IsMatch(body[i])) { if (!OursRx.IsMatch(body[i])) o.Add(body[i]); i++; continue; }
            int j = i + 1;
            while (j < body.Count && !StepRx.IsMatch(body[j])) j++;
            var rest = body.Skip(i + 1).Take(j - i - 1).Where(l => !OursRx.IsMatch(l)).ToList();
            var order = new List<int>(); var tags = new Dictionary<int, HashSet<string>>();
            foreach (var l in rest)
            {
                var m = CompleteRx.Match(l);
                if (!m.Success) continue;
                int q = int.Parse(m.Groups[1].Value);
                if (!tags.TryGetValue(q, out var set)) { order.Add(q); tags[q] = set = new(); }
                set.Add(m.Groups[2].Value.Trim());
            }
            string indent = rest.Where(l => l.Trim().Length > 0).Select(l => Regex.Match(l, @"^\s*").Value).FirstOrDefault() ?? "    ";
            if (indent.Length == 0) indent = "    ";
            o.Add(body[i]);
            foreach (int q in order)
            {
                if (Text(data.Quests.GetValueOrDefault(q)) is not { } t) continue;
                var set = tags[q];
                o.Add($"{indent}{Mark}{t}|r" + (set.Count == 1 && !set.Contains("") ? " << " + set.First() : ""));
            }
            o.AddRange(rest);
            i = j;
        }
        return o;
    }
}
