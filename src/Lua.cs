using System.Globalization;
using System.Text;

namespace RouteBuilder;

/// <summary>A Lua table as read from a data file: integer-keyed and string-keyed entries. Nil entries are simply absent.</summary>
public sealed class LuaTable
{
    public readonly SortedDictionary<long, object?> Int = new();
    public readonly Dictionary<string, object?> Str = new();

    public object? this[long i] => Int.TryGetValue(i, out var v) ? v : null;
    /// <summary>Integer-keyed values in key order (holes skipped).</summary>
    public IEnumerable<object?> Values => Int.Values;
    public int Count => Int.Count + Str.Count;
}

/// <summary>
/// Reader for the Lua table literals QuestieDB's export writes (one entity per line).
/// It understands numbers, strings, nil, booleans and nested tables, which is all those files contain.
/// </summary>
public static class Lua
{
    public static object? Parse(string s, ref int p)
    {
        Skip(s, ref p);
        if (p >= s.Length) throw new FormatException("unexpected end of Lua value");
        char c = s[p];
        if (c == '{') return ParseTable(s, ref p);
        if (c == '"' || c == '\'') return ParseString(s, ref p);
        if (c == '-' || c == '.' || char.IsDigit(c))
        {
            int st = p; p++;
            while (p < s.Length && (char.IsLetterOrDigit(s[p]) || s[p] == '.' || ((s[p] == '-' || s[p] == '+') && (s[p - 1] == 'e' || s[p - 1] == 'E')))) p++;
            var tok = s.AsSpan(st, p - st);
            if (tok.StartsWith("0x", StringComparison.OrdinalIgnoreCase)) return (double)long.Parse(tok[2..], NumberStyles.HexNumber, CultureInfo.InvariantCulture);
            return double.Parse(tok, NumberStyles.Float, CultureInfo.InvariantCulture);
        }
        if (Word(s, p, "nil")) { p += 3; return null; }
        if (Word(s, p, "true")) { p += 4; return true; }
        if (Word(s, p, "false")) { p += 5; return false; }
        throw new FormatException($"unexpected '{c}' at {p}: {s.Substring(p, Math.Min(40, s.Length - p))}");
    }

    static bool Word(string s, int p, string w) => string.CompareOrdinal(s, p, w, 0, w.Length) == 0;

    static void Skip(string s, ref int p)
    {
        while (p < s.Length)
        {
            if (char.IsWhiteSpace(s[p])) { p++; continue; }
            if (s[p] == '-' && p + 1 < s.Length && s[p + 1] == '-') { while (p < s.Length && s[p] != '\n') p++; continue; }
            break;
        }
    }

    static LuaTable ParseTable(string s, ref int p)
    {
        var t = new LuaTable(); p++; long next = 1;
        while (true)
        {
            Skip(s, ref p);
            if (p >= s.Length) throw new FormatException("unterminated table");
            if (s[p] == '}') { p++; return t; }
            if (s[p] == '[')
            {
                p++; var key = Parse(s, ref p); Skip(s, ref p);
                if (s[p] != ']') throw new FormatException("expected ]");
                p++; Skip(s, ref p);
                if (s[p] != '=') throw new FormatException("expected =");
                p++; var val = Parse(s, ref p);
                if (key is double d) { if (val != null) t.Int[(long)d] = val; }
                else if (key is string ks) t.Str[ks] = val;
            }
            else if ((char.IsLetter(s[p]) || s[p] == '_') && IsNamedField(s, p, out int eq))
            {
                string name = s.Substring(p, eq - p).Trim(); p = eq + 1;
                t.Str[name] = Parse(s, ref p);
            }
            else
            {
                var val = Parse(s, ref p);
                if (val != null) t.Int[next] = val;
                next++;
            }
            Skip(s, ref p);
            if (p < s.Length && (s[p] == ',' || s[p] == ';')) p++;
        }
    }

    static bool IsNamedField(string s, int p, out int eq)
    {
        int q = p;
        while (q < s.Length && (char.IsLetterOrDigit(s[q]) || s[q] == '_')) q++;
        int r = q;
        while (r < s.Length && s[r] == ' ') r++;
        eq = r;
        return r < s.Length && s[r] == '=' && (r + 1 >= s.Length || s[r + 1] != '=') && !Word(s, p, "nil") && !Word(s, p, "true") && !Word(s, p, "false");
    }

    static string ParseString(string s, ref int p)
    {
        char q = s[p++]; var sb = new StringBuilder();
        while (p < s.Length && s[p] != q)
        {
            char c = s[p++];
            if (c != '\\') { sb.Append(c); continue; }
            c = s[p++];
            switch (c)
            {
                case 'n': sb.Append('\n'); break;
                case 't': sb.Append('\t'); break;
                case 'r': sb.Append('\r'); break;
                case 'a': case 'b': case 'f': case 'v': break;
                default:
                    if (char.IsDigit(c))
                    {
                        int v = c - '0', k = 1;
                        while (k < 3 && p < s.Length && char.IsDigit(s[p])) { v = v * 10 + (s[p++] - '0'); k++; }
                        sb.Append((char)v);
                    }
                    else sb.Append(c);
                    break;
            }
        }
        p++;
        // the files are UTF-8 read as text already, but \ddd escapes arrive as single bytes
        return sb.ToString();
    }

    // ---- typed helpers -------------------------------------------------------------
    public static long Num(object? v, long dflt = 0) => v is double d ? (long)d : dflt;
    public static double Dbl(object? v, double dflt = 0) => v is double d ? d : dflt;
    public static string? Text(object? v) => v as string;
    public static LuaTable? Tab(object? v) => v as LuaTable;
    public static List<int> Ids(object? v)
    {
        var o = new List<int>();
        if (v is LuaTable t) foreach (var x in t.Values) if (x is double d) o.Add((int)Math.Abs(d));
        return o;
    }

    /// <summary>Reads every "name[id]={...}" line of an exported file.</summary>
    public static IEnumerable<(int id, LuaTable row)> ReadEntities(string path)
    {
        foreach (var line in File.ReadLines(path, Encoding.UTF8))
        {
            int b = line.IndexOf('[');
            int e = b < 0 ? -1 : line.IndexOf("]=", b, StringComparison.Ordinal);
            if (b < 1 || e < 0 || b > 12) continue;
            if (!int.TryParse(line.AsSpan(b + 1, e - b - 1), out int id)) continue;
            int p = e + 2;
            if (Parse(line, ref p) is LuaTable t) yield return (id, t);
        }
    }
}
