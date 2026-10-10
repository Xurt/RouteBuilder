using System.Text.RegularExpressions;

namespace RouteBuilder;

public sealed class BuildOptions
{
    public string Faction = "Horde"; public string? Race, Class;
    public double? StartLevel; public int? MinLevel, MaxLevel; public bool NoHearth, Fresh, NoRxpSteps; public string? RxpDir, OrderFrom;
    public HashSet<string> RxpPlaced = new();    // RestedXP service steps already put in a part of this guide
    public RouteLock? Lock;                      // the saved order this build follows (null = planned from scratch)
    public HashSet<LockedService> LockPlaced = new();   // the lock's service steps already put in a part of this guide
}

/// <summary>Fixed facts about the game: races, classes and the experience curve.</summary>
public static class Game
{
    public static readonly (string Name, int Bit)[] Classes =
    {
        ("Warrior", 1), ("Paladin", 2), ("Hunter", 4), ("Rogue", 8), ("Priest", 16), ("Shaman", 64), ("Mage", 128), ("Warlock", 256), ("Druid", 1024),
    };
    public const int AllClasses = 1503;
    static readonly (string Name, long Bit)[] Horde = { ("Orc", 2), ("Undead", 16), ("Tauren", 32), ("Troll", 128), ("Skyborne", 1L << 33) };
    static readonly (string Name, long Bit)[] Alliance = { ("Human", 1), ("Dwarf", 4), ("NightElf", 8), ("Gnome", 64), ("Skyborne", 1L << 32) };
    public static (string Name, long Bit)[] Races(string faction) => faction == "Horde" ? Horde : Alliance;

    /// <summary>
    /// The race/class combinations that exist: classic's, plus those Forever adds. Forever's are the ones its quest
    /// data has class quests for; any more that the data turns up are added when it is loaded (<see cref="Learn"/>).
    /// </summary>
    static readonly HashSet<(string Race, string Class)> Combos = new()
    {
        ("Human", "Warrior"), ("Human", "Paladin"), ("Human", "Rogue"), ("Human", "Priest"), ("Human", "Mage"), ("Human", "Warlock"),
        ("Dwarf", "Warrior"), ("Dwarf", "Paladin"), ("Dwarf", "Hunter"), ("Dwarf", "Rogue"), ("Dwarf", "Priest"),
        ("Gnome", "Warrior"), ("Gnome", "Rogue"), ("Gnome", "Mage"), ("Gnome", "Warlock"),
        ("NightElf", "Warrior"), ("NightElf", "Hunter"), ("NightElf", "Rogue"), ("NightElf", "Priest"), ("NightElf", "Druid"),
        ("Orc", "Warrior"), ("Orc", "Hunter"), ("Orc", "Rogue"), ("Orc", "Shaman"), ("Orc", "Warlock"),
        ("Troll", "Warrior"), ("Troll", "Hunter"), ("Troll", "Rogue"), ("Troll", "Priest"), ("Troll", "Shaman"), ("Troll", "Mage"),
        ("Tauren", "Warrior"), ("Tauren", "Hunter"), ("Tauren", "Shaman"), ("Tauren", "Druid"),
        ("Undead", "Warrior"), ("Undead", "Rogue"), ("Undead", "Priest"), ("Undead", "Mage"), ("Undead", "Warlock"),
        // Forever
        ("Undead", "Paladin"), ("Gnome", "Priest"), ("Orc", "Mage"), ("Troll", "Warlock"), ("Dwarf", "Shaman"),
        ("Skyborne", "Druid"), ("Skyborne", "Hunter"), ("Skyborne", "Shaman"), ("Skyborne", "Warrior"), ("Skyborne", "Mage"),
    };

    public static bool Exists(string race, string cls) => Combos.Contains((race, cls));
    public static IEnumerable<string> ClassesOf(string race) => Classes.Select(c => c.Name).Where(c => Exists(race, c));

    /// <summary>Adds combinations the quest data has a class quest for (one class, at most three races).</summary>
    public static void Learn(GameData data)
    {
        foreach (var q in data.Quests.Values)
        {
            if (q.Races == 0 || q.Classes == 0) continue;
            var cs = Classes.Where(c => (q.Classes & c.Bit) != 0).ToList();
            var rs = Horde.Concat(Alliance).Where(r => (q.Races & r.Bit) != 0).Select(r => r.Name).Distinct().ToList();
            if (cs.Count == 1 && rs.Count is > 0 and <= 3) foreach (var r in rs) Combos.Add((r, cs[0].Name));
        }
    }

    /// <summary>Quest "sort" values that mean "class quest".</summary>
    public static readonly HashSet<int> ClassSorts = new() { -61, -81, -82, -141, -161, -162, -261, -262, -263 };
    public const int CampingSort = -666;

    public const int MaxLevel = 60;
    static readonly int[] XpNext =
    {
        0, 400, 900, 1400, 2100, 2800, 3600, 4500, 5400, 6500, 7600, 8800, 10100, 11400, 12900, 14400, 16000, 17700, 19400, 21300,
        23200, 25200, 27300, 29400, 31700, 34000, 36400, 38900, 41400, 44300, 47400, 50800, 54500, 58600, 62800, 67100, 71600, 76100, 80800, 85700,
        90700, 95800, 101000, 106300, 111800, 117500, 123200, 129100, 135100, 141200, 147500, 153900, 160400, 167100, 173900, 180800, 187900, 195000, 202300, 209800,
        217400,
    };
    /// <summary>Cum[l] = total experience needed to be level l.</summary>
    public static readonly double[] Cum = BuildCum();
    static double[] BuildCum()
    {
        var c = new double[MaxLevel + 2];
        for (int l = 2; l <= MaxLevel + 1; l++) c[l] = c[l - 1] + XpNext[l - 1];
        return c;
    }

    /// <summary>Level with a fraction, e.g. 6.4 = 40% of the way through level 6.</summary>
    public static double FracLevel(double xp)
    {
        int l = 1;
        while (l < MaxLevel && xp >= Cum[l + 1]) l++;
        return l + (xp - Cum[l]) / (Cum[l + 1] - Cum[l]);
    }

    public static double XpAt(double level)
    {
        int l = Math.Clamp((int)Math.Floor(level), 1, MaxLevel);
        return Cum[l] + (level - l) * (Cum[l + 1] - Cum[l]);
    }

    /// <summary>Experience for killing a mob of level <paramref name="ml"/> at player level <paramref name="pl"/>.</summary>
    public static double MobXp(double ml, int pl)
    {
        double b = 45 + 5 * pl;
        if (ml >= pl) return b * (1 + 0.05 * Math.Min(ml - pl, 4));
        int zd = pl <= 7 ? 5 : pl <= 9 ? 6 : pl <= 11 ? 7 : pl <= 15 ? 8 : pl <= 19 ? 9 : pl <= 29 ? 11 : pl <= 39 ? 12 : pl <= 44 ? 13 : pl <= 49 ? 14 : pl <= 54 ? 15 : pl <= 59 ? 16 : 17;
        return Math.Max(0, b * (1 - (pl - ml) / zd));
    }
}

/// <summary>
/// A zone too big for one visit is planned as several: what the earlier visits finished, what they left
/// in the log, and which quests this visit is for.
/// </summary>
public sealed class Visit
{
    public int Number = 1;
    public HashSet<int> Done = new();        // handed in on an earlier visit
    public HashSet<int> HeldOver = new();    // picked up on an earlier visit, still in the log
    public HashSet<int>? Only;               // the quests left for this visit (null = everything)
    public double MinStartLevel = 1;         // the earlier visits end at about this level
    public double? StartLevel;               // first visit only: start here instead of at the zone's lowest quest level
}

public enum EntKind { Npc, Object }
public enum TaskKind { Accept, ItemAccept, Objective, TurnIn, Home }

public readonly record struct SpawnPt(int Area, Pt Pos, double? Level, (EntKind Kind, int Id) Ent);

/// <summary>One place a task can be done: a quest giver's spot, or a patch of spawns.</summary>
public sealed class Cand
{
    public int Area; public Pt Pos; public List<Pt> Pts; public double? MobLevel;
    public Dictionary<(EntKind, int), int> ByEnt = new();
    public int Size => Pts.Count;
    public Cand(int area, List<Pt> pts, double? mobLevel = null) { Area = area; Pts = pts; MobLevel = mobLevel; Pos = Geo.Medoid(pts); }
}

/// <summary>A quest giver or hand-in target.</summary>
public sealed class Ent
{
    public EntKind Kind; public int Id; public string Name = "?";
    public bool Patrol; public List<Pt> Loop = new(); public List<Cand> Cands = new();
}

public sealed class Obj
{
    public int? Index; public string Kind = "kill"; public string Label = ""; public string? Text, Command, Loot;
    public List<string> Extra = new(); public List<(string Kind, string Name)> Targets = new();
    public bool Seq, Patrol; public List<Cand> Cands = new(); public List<Pt> Loop = new();
    public double Kills; public double? MobLevel; public int Count = 1, MinLevel = 1;
    public List<string> SrcNames = new(); public List<int> SrcNpcs = new();
    public string? Elsewhere;        // where its sources are when they are not in this zone
}

public sealed class Quest
{
    public QuestRow Row = null!; public QuestFix Fix = new();
    public int Id => Row.Id; public string Name => Row.Name; public int Req => Row.ReqLevel; public int Level => Row.Level;
    public string Tag = ""; public ulong Elig;
    public Ent? Start, End; public StartItemFix? StartItem;
    public HashSet<int> PreAll = new(), PreAny = new();
    public int Xp; public bool XpKnown;
    public List<Obj> Objs = new();
    public List<Obj> Routed => Objs.Where(o => o.Cands.Count > 0).ToList();
    public List<Obj> Unrouted => Objs.Where(o => o.Cands.Count == 0).ToList();

    public bool Arrival;        // picked up in another zone, handed in here
    public bool Carried;        // picked up here, handed in somewhere else
    public bool Conditional;    // needs a quest this guide does not hand in
    public bool Late;           // hand-in cannot be planned (objectives elsewhere or unknown)
    public bool DataGap;        // the database has no objectives for it, but it looks like it should
    public bool Optional;
    public bool Cond => Arrival || Conditional;
    public List<int> NeedAll = new(), NeedAny = new();   // outside prerequisites, checked in game with .isQuestTurnedIn
    public string? Destination, Origin, Status;
    public List<string> Notes = new();
    public bool HasTurnin => !Carried && !Fix.NoTurnin && End != null;
}

public sealed class RouteTask
{
    public int Id; public TaskKind Kind; public Quest? Q; public List<Cand> Cands = new();
    public double Xp, Secs; public int MinLevel = 1, ObjNo = -1; public Obj? Obj; public Ent? Ent;
    public HashSet<int> Pre = new(), PreAny = new(); public int Tight = -1;
    public ulong Elig; public bool Cond, Deferred;
    public string Tag => Q?.Tag ?? "";
    public override string ToString() => Kind + " " + (Q?.Name ?? "inn") + (Obj != null ? " / " + Obj.Label : "");
}

/// <summary>How far it is between two points that may be on different maps.</summary>
public sealed class Travel
{
    readonly int[] continent; readonly bool[] bounded, hasGate; readonly Pt[] gate, hub; readonly double[] pen;

    public Travel(List<AreaInfo> areas, Dictionary<int, (Pt gate, Pt hub, double pen)> gates)
    {
        int n = areas.Count;
        continent = new int[n]; bounded = new bool[n]; hasGate = new bool[n]; gate = new Pt[n]; hub = new Pt[n]; pen = new double[n];
        for (int i = 0; i < n; i++)
        {
            continent[i] = areas[i].Continent; bounded[i] = areas[i].HasBounds;
            if (gates.TryGetValue(i, out var g)) { hasGate[i] = true; gate[i] = g.gate; hub[i] = g.hub; pen[i] = g.pen; }
        }
    }

    /// <summary>Area 0 is the zone itself; the others are linked areas reached through their gate.</summary>
    public double Dist(int a, double x, double y, int b, double nx, double ny)
    {
        if (a == b) return Math.Sqrt((nx - x) * (nx - x) + (ny - y) * (ny - y));
        if (a != 0 && b != 0)
        {
            // city to city: out of one, across the zone, into the other
            var mid = hasGate[a] ? gate[a] : new Pt(x, y);
            return Dist(a, x, y, 0, mid.X, mid.Y) + Dist(0, mid.X, mid.Y, b, nx, ny);
        }
        int c = a == 0 ? b : a;                       // the linked area involved
        if (hasGate[c])
        {
            return a == 0
                ? Math.Sqrt((x - gate[c].X) * (x - gate[c].X) + (y - gate[c].Y) * (y - gate[c].Y)) + pen[c] + Math.Sqrt((nx - hub[c].X) * (nx - hub[c].X) + (ny - hub[c].Y) * (ny - hub[c].Y))
                : Math.Sqrt((x - hub[c].X) * (x - hub[c].X) + (y - hub[c].Y) * (y - hub[c].Y)) + pen[c] + Math.Sqrt((nx - gate[c].X) * (nx - gate[c].X) + (ny - gate[c].Y) * (ny - gate[c].Y));
        }
        if (bounded[a] && bounded[b] && continent[a] == continent[b])
            return Math.Sqrt((nx - x) * (nx - x) + (ny - y) * (ny - y)) + Tuning.AreaChange;
        return 1500 + 2 * Tuning.AreaChange;        // no shared map to measure on
    }

    public bool HasGate(int area) => hasGate[area];
    public Pt Gate(int area) => gate[area];
}

/// <summary>Objective notes found in RestedXP's own guides (".complete quest,index --text"), used as a cross-check.</summary>
public sealed class RxpNotes
{
    public readonly Dictionary<(int q, int idx), List<string>> Lines = new();
    public readonly List<RxpService> Services = new();     // training, vendor and flight-path steps
    public int Files;

    public static RxpNotes? Load(string? dir, GameData? data = null)
    {
        if (dir == null) return null;
        if (!Directory.Exists(dir)) { Console.WriteLine($"--rxp: folder not found: {dir}"); return null; }
        var r = new RxpNotes(); var rx = new Regex(@"\.complete (\d+),(\d+)[^\r\n]*?--([^\r\n<]*)");
        foreach (var f in Directory.EnumerateFiles(dir, "*.lua", SearchOption.AllDirectories))
        {
            string text;
            try { text = File.ReadAllText(f); } catch (IOException) { continue; }
            if (!text.Contains("RegisterGuide")) continue;
            r.Files++;
            r.Services.AddRange(RxpServices.Read(f, text, data));
            foreach (Match m in rx.Matches(text))
            {
                var k = (int.Parse(m.Groups[1].Value), int.Parse(m.Groups[2].Value)); string s = m.Groups[3].Value.Trim();
                if (s.Length == 0) continue;
                if (!r.Lines.TryGetValue(k, out var l)) r.Lines[k] = l = new();
                if (!l.Contains(s)) l.Add(s);
            }
        }
        return r;
    }

    public int? Count(int q, int idx)
    {
        if (!Lines.TryGetValue((q, idx), out var l)) return null;
        foreach (var c in l)
        {
            var m = Regex.Match(c, @"\(x?(\d+)\)");
            if (!m.Success) m = Regex.Match(c, @"^(\d+)/\d+");
            if (m.Success) return int.Parse(m.Groups[1].Value);
        }
        return null;
    }

    /// <summary>True when one of RestedXP's notes for this objective talks about the same thing as <paramref name="label"/>.</summary>
    public bool? Agrees(int q, int idx, string label)
    {
        if (!Lines.TryGetValue((q, idx), out var l)) return null;
        string key = Regex.Replace(label, @"\s*\(.*", "").Replace(" slain", "").ToLowerInvariant();
        var words = Regex.Matches(key, "[a-z']+").Select(m => m.Value).Where(w => w.Length > 3).ToList();
        if (words.Count == 0) return null;
        return l.Any(r => words.Any(w => r.ToLowerInvariant().Contains(w[..Math.Min(5, w.Length)])));
    }
}

/// <summary>
/// Everything about one zone for one faction: which quests are in, how they depend on each other,
/// and the list of things to do (tasks) with the places each can be done.
/// </summary>
public sealed class ZoneModel
{
    public readonly GameData Data; public readonly AreaInfo Main; public readonly ZoneConfig Cfg; public readonly BuildOptions Opt; public readonly Visit Visit;
    /// <summary>Quests put off to a later visit because this one does not get the player high enough: reason and level needed.</summary>
    public readonly SortedDictionary<int, (string Why, double Need, bool Cond)> Later = new();
    public readonly List<AreaInfo> Areas = new();          // [0] is the zone, the rest are linked areas
    public readonly List<LinkedAreaFix?> AreaFix = new();
    public Travel Travel = null!;
    public readonly SortedDictionary<int, Quest> Quests = new();
    public readonly List<RouteTask> Tasks = new();
    public readonly Dictionary<(TaskKind kind, int quest, int no), RouteTask> Index = new();
    public readonly SortedDictionary<int, string> Excluded = new();
    public readonly List<string> Notes = new();
    public Pt Start; public int StartArea; public double StartXp; public double StartLevel = 1;
    public Ent? Inn; public RouteTask? Home; public string BindName = "the inn";
    public readonly (string Name, long Bit)[] Races; public readonly long FactionMask;
    public ulong AllElig; public bool SingleCharacter;
    public int LevelLo = 1, LevelHi = 1, ScopeMax = 60;
    public readonly RxpNotes? Rxp;
    public bool HasConfig;

    readonly Dictionary<(EntKind, int), Ent> ents = new();
    /// <summary>The zone a city is planned with, if it is one of the capital cities.</summary>
    public static int? CityParent(int area) => DefaultLinks.Where(kv => kv.Value.Contains(area)).Select(kv => (int?)kv.Key).FirstOrDefault();
    static readonly Dictionary<int, int[]> DefaultLinks = new() { [85] = new[] { 1497 }, [12] = new[] { 1519 }, [1] = new[] { 1537 }, [14] = new[] { 1637 }, [215] = new[] { 1638 }, [141] = new[] { 1657 } };
    static readonly Dictionary<string, int> NumberWords = new() { ["one"] = 1, ["two"] = 2, ["three"] = 3, ["four"] = 4, ["five"] = 5, ["six"] = 6, ["seven"] = 7, ["eight"] = 8, ["nine"] = 9, ["ten"] = 10, ["twelve"] = 12, ["fifteen"] = 15, ["twenty"] = 20 };

    public ZoneModel(GameData data, AreaInfo main, ZoneConfig? cfg, BuildOptions opt, Visit? visit = null)
    {
        Data = data; Main = main; Cfg = cfg ?? new ZoneConfig(); HasConfig = cfg != null; Opt = opt; Visit = visit ?? new Visit();
        Races = Game.Races(opt.Faction); FactionMask = Races.Aggregate(0L, (m, r) => m | r.Bit);
        Rxp = RxpNotes.Load(opt.RxpDir, Data);
        SetUpAreas();
        SelectQuests();
        foreach (var q in Quests.Values) ResolveObjectives(q);
        SettleStartItems();
        foreach (var q in Quests.Values.Where(q => !q.XpKnown))
        {
            if (q.Objs.Count == 0) q.Xp = (int)(q.Xp * Tuning.DeliveryXp);
            if (q.Row.Classes != 0 && (q.Row.Classes & Game.AllClasses) != Game.AllClasses) q.Xp = (int)(q.Xp * Tuning.ClassQuestXp);
        }
        // quests that need a higher level than the zone can give are dropped, which lowers the level again: repeat until settled
        do { Classify(); PickInn(); BuildTasks(); } while (TrimByLevel());
        PickStart();
        BuildHubs();
    }

    // ------------------------------------------------------------------ areas and positions
    void SetUpAreas()
    {
        Areas.Add(Main); AreaFix.Add(null);
        var gates = new Dictionary<int, (Pt, Pt, double)>();
        if (Cfg.LinkedAreas != null)
        {
            foreach (var l in Cfg.LinkedAreas)
            {
                var a = Data.FindArea(l.Area) ?? throw new InvalidOperationException($"zone file: linked area '{l.Area}' not found");
                Areas.Add(a); AreaFix.Add(l);
                if (l.Gate != null && l.Hub != null)
                    gates[Areas.Count - 1] = (Main.ToWorld(new Pt(l.Gate.X, l.Gate.Y)), a.ToWorld(new Pt(l.Hub.X, l.Hub.Y)), l.Penalty ?? Tuning.AreaChange);
            }
        }
        else if (DefaultLinks.TryGetValue(Main.Id, out var ids))
            foreach (int id in ids) if (Data.Areas.TryGetValue(id, out var a)) { Areas.Add(a); AreaFix.Add(null); }
        Travel = new Travel(Areas, gates);
    }

    /// <summary>Which of this zone's maps a spawn key belongs to, or -1.</summary>
    public int AreaIndex(int key)
    {
        for (int i = 0; i < Areas.Count; i++) if (Areas[i].Id == key) return i;
        int p = Data.Parent(key);
        if (p == key) return -1;
        for (int i = 0; i < Areas.Count; i++)
            if (Areas[i].Id == p && (!Data.Areas.TryGetValue(key, out var own) || own.UiMap == Areas[i].UiMap)) return i;
        return -1;
    }

    public (int area, Pt pos) World(Spot s)
    {
        int i = s.Area == 0 ? 0 : Areas.FindIndex(a => a.Id == s.Area);
        if (i < 0) throw new InvalidOperationException($"zone file: a point refers to area {s.Area}, which is not this zone or one of its linked areas");
        return (i, Areas[i].ToWorld(new Pt(s.X, s.Y)));
    }

    public List<SpawnPt> Points(EntKind kind, int id)
    {
        var o = new List<SpawnPt>();
        Dictionary<int, List<Pt>>? sp = null; double? lvl = null;
        if (kind == EntKind.Npc) { if (Data.Npcs.TryGetValue(id, out var n)) { sp = n.Spawns; lvl = n.Level; } }
        else if (Data.Objects.TryGetValue(id, out var ob)) sp = ob.Spawns;
        if (sp == null) return o;
        foreach (var (key, pts) in sp.OrderBy(k => AreaIndex(k.Key)))
        {
            int ai = AreaIndex(key);
            if (ai < 0) continue;
            foreach (var p in pts) o.Add(new SpawnPt(ai, Areas[ai].ToWorld(p), lvl, (kind, id)));
        }
        return o;
    }

    List<SpawnPt> Points(IEnumerable<int> npcs, IEnumerable<int> objs, (Pt c, double r)? near = null)
    {
        var o = new List<SpawnPt>();
        foreach (int i in npcs) o.AddRange(Points(EntKind.Npc, i));
        foreach (int i in objs) o.AddRange(Points(EntKind.Object, i));
        if (near is { } nr) o = o.Where(p => p.Pos.To(nr.c) <= nr.r).ToList();
        return o;
    }

    List<Pt> Waypoints(int npc, int area)
    {
        var o = new List<Pt>();
        if (Data.Npcs.TryGetValue(npc, out var n))
            foreach (var (key, pts) in n.Waypoints) if (AreaIndex(key) == area) o.AddRange(pts.Select(p => Areas[area].ToWorld(p)));
        return o;
    }

    /// <summary>Where else in the world an NPC or object can be found (for "this part is in another zone" notes).</summary>
    string? ElsewhereName(EntKind kind, IEnumerable<int> ids)
    {
        foreach (int id in ids)
        {
            var sp = kind == EntKind.Npc ? Data.Npcs.GetValueOrDefault(id)?.Spawns : Data.Objects.GetValueOrDefault(id)?.Spawns;
            if (sp == null) continue;
            foreach (int key in sp.Keys) if (AreaIndex(key) < 0) return Data.AreaName(Data.Areas.ContainsKey(key) ? key : Data.Parent(key));
        }
        return null;
    }

    (List<Cand> cands, List<Pt> loop) PatrolCands(int npc, int area)
    {
        var pts = Waypoints(npc, area); pts.AddRange(Points(EntKind.Npc, npc).Where(p => p.Area == area).Select(p => p.Pos));
        return (Geo.Thin(pts, 160).Select(p => new Cand(area, new List<Pt> { p })).ToList(), Geo.Thin(pts, 60));
    }

    public Ent GetEnt(EntKind kind, int id)
    {
        if (ents.TryGetValue((kind, id), out var e)) return e;
        e = new Ent { Kind = kind, Id = id, Name = kind == EntKind.Npc ? Data.NpcName(id) : Data.ObjectName(id) };
        var pts = Points(kind, id);
        if (pts.Count > 0)
        {
            int area = pts[0].Area;
            if (kind == EntKind.Npc && Waypoints(id, area).Count >= 4)
            {
                var (cands, loop) = PatrolCands(id, area);
                if (Geo.Span(loop) > Tuning.PatrolRange) { e.Patrol = true; e.Cands = cands; e.Loop = loop; }
            }
            if (e.Cands.Count == 0)
            {
                var grp = pts.Where(p => p.Area == area).Select(p => p.Pos).Distinct().ToList();
                if (Geo.Span(grp.Count > 400 ? Geo.Thin(grp, 20) : grp) > Tuning.PatrolRange)
                {
                    e.Patrol = true; e.Loop = Geo.Thin(grp, 60);
                    e.Cands = Geo.Thin(grp, 160).Select(p => new Cand(area, new List<Pt> { p })).ToList();
                }
                else e.Cands.Add(new Cand(area, grp));
            }
        }
        ents[(kind, id)] = e;
        return e;
    }

    Ent? FirstLocated(List<int> npcs, List<int> objs)
    {
        foreach (int i in npcs) { var e = GetEnt(EntKind.Npc, i); if (e.Cands.Count > 0) return e; }
        foreach (int i in objs) { var e = GetEnt(EntKind.Object, i); if (e.Cands.Count > 0) return e; }
        return null;
    }

    /// <summary>Groups spawn points into patches worth farming and keeps those big enough for the objective.</summary>
    public List<Cand> MakeCands(List<SpawnPt> points, double need)
    {
        var cands = new List<Cand>();
        foreach (int area in points.Select(p => p.Area).Distinct().OrderBy(a => a))
        {
            var lvl = new Dictionary<Pt, double?>(); var ent = new Dictionary<Pt, (EntKind, int)>();
            foreach (var p in points) if (p.Area == area) { lvl.TryAdd(p.Pos, p.Level); ent.TryAdd(p.Pos, p.Ent); }
            var uniq = lvl.Keys.OrderBy(p => p.X).ThenBy(p => p.Y).ToList();
            if (uniq.Count > 1500) uniq = Geo.Thin(uniq, 12);              // sighting clouds: no need for every point
            foreach (var grp in Geo.Cluster(uniq, Tuning.ClusterEps))
            {
                double diam = grp.Count > 1 ? Geo.Span(Geo.FarthestSample(grp, 12)) : 0;
                var parts = diam > Tuning.ClusterSpan * 1.25 ? Geo.KMeans(grp, (int)Math.Ceiling(diam / Tuning.ClusterSpan)) : new List<List<Pt>> { grp };
                foreach (var part in parts)
                {
                    var lv = part.Select(p => lvl[p]).Where(l => l is > 0).Select(l => l!.Value).ToList();
                    var c = new Cand(area, part, lv.Count > 0 ? lv.Average() : null);
                    foreach (var p in part) c.ByEnt[ent[p]] = c.ByEnt.GetValueOrDefault(ent[p]) + 1;
                    cands.Add(c);
                }
            }
        }
        if (cands.Count == 0) return cands;
        cands = cands.OrderByDescending(c => c.Size).ToList();
        int floor = Math.Min(Math.Max(1, (int)Math.Ceiling(need / 2.0)), cands[0].Size);
        var best = new Dictionary<(EntKind, int), int>();
        foreach (var c in cands) foreach (var (e, k) in c.ByEnt) best[e] = Math.Max(best.GetValueOrDefault(e), k);
        // a patch must hold a fair share of at least one source's points; judged per source because
        // some mobs are recorded as hundreds of sightings and others as one point per spawn
        bool ShareOk(Cand c) => c.ByEnt.Any(kv => { int m = best[kv.Key]; double thr = m >= 50 ? 0.30 * m : m >= 10 ? 0.15 * m : 1; return kv.Value >= thr; });
        return cands.Where(c => c.Size >= floor && ShareOk(c)).Take(Tuning.MaxPatches).ToList();
    }

    // ------------------------------------------------------------------ which quests are in
    public static string TagFor(long races, int classes, (string Name, long Bit)[] factionRaces, long factionMask)
    {
        var rs = (races & factionMask) == factionMask || (races & factionMask) == 0 ? null : factionRaces.Where(r => (races & r.Bit) != 0).Select(r => r.Name).ToList();
        var cs = classes == 0 || (classes & Game.AllClasses) == Game.AllClasses ? null : Game.Classes.Where(c => (classes & c.Bit) != 0).Select(c => c.Name).ToList();
        if (rs == null && cs == null) return "";
        if (rs == null) return string.Join("/", cs!);
        if (cs == null) return string.Join("/", rs);
        return string.Join("/", rs.SelectMany(r => cs.Select(c => r + " " + c)));
    }

    ulong EligFor(long races, int classes)
    {
        ulong e = 0;
        for (int r = 0; r < Races.Length; r++)
            for (int c = 0; c < Game.Classes.Length; c++)
                if ((races == 0 || (races & Races[r].Bit) != 0) && (classes == 0 || (classes & Game.Classes[c].Bit) != 0) && Game.Exists(Races[r].Name, Game.Classes[c].Name))
                    e |= 1UL << (r * Game.Classes.Length + c);
        return e;
    }

    void SelectQuests()
    {
        long raceBit = 0; int classBit = 0;
        if (Opt.Race != null)
        {
            var r = Races.FirstOrDefault(x => x.Name.Equals(Opt.Race, StringComparison.OrdinalIgnoreCase));
            if (r.Name == null) throw new InvalidOperationException($"'{Opt.Race}' is not a {Opt.Faction} race. Choices: {string.Join(", ", Races.Select(x => x.Name))}");
            raceBit = r.Bit;
        }
        if (Opt.Class != null)
        {
            var c = Game.Classes.FirstOrDefault(x => x.Name.Equals(Opt.Class, StringComparison.OrdinalIgnoreCase));
            if (c.Name == null) throw new InvalidOperationException($"'{Opt.Class}' is not a class. Choices: {string.Join(", ", Game.Classes.Select(x => x.Name))}");
            classBit = c.Bit;
        }
        if (Opt.Race != null && Opt.Class != null && !Game.Exists(Races.First(x => x.Bit == raceBit).Name, Game.Classes.First(x => x.Bit == classBit).Name))
        {
            string rn = Races.First(x => x.Bit == raceBit).Name;
            throw new InvalidOperationException($"there are no {rn} {Opt.Class}s. {rn} classes: {string.Join(", ", Game.ClassesOf(rn))}");
        }
        SingleCharacter = raceBit != 0 || classBit != 0;
        AllElig = EligFor(raceBit, classBit);

        // the zone's own level range, from the quests filed under it
        bool Mine(QuestRow q) => q.ZoneOrSort > 0 && (q.ZoneOrSort == Main.Id || Data.Parent(q.ZoneOrSort) == Main.Id);
        bool ForUs(QuestRow q) => q.Races == 0 || (q.Races & FactionMask) != 0;
        var own = Data.Quests.Values.Where(q => Mine(q) && ForUs(q) && !q.Repeatable && !q.EventOnly).Select(q => q.Level).OrderBy(l => l).ToList();
        if (own.Count >= 5)
        {
            LevelLo = own[0];
            ScopeMax = own[Math.Min(own.Count - 1, (int)(own.Count * Tuning.ZoneTopPercentile))] + Tuning.ZoneLevelSlack;
        }
        ScopeMax = Opt.MaxLevel ?? Cfg.MaxLevel ?? ScopeMax;
        int? scopeMin = Opt.MinLevel ?? Cfg.MinLevel;

        foreach (var row in Data.Quests.Values.OrderBy(q => q.Id))
        {
            if (!ForUs(row) || Visit.Done.Contains(row.Id)) continue;
            bool held = Visit.HeldOver.Contains(row.Id);
            if (Visit.Only != null && !Visit.Only.Contains(row.Id) && !held) continue;
            var fix = Cfg.Fix(row.Id);
            var start = FirstLocated(row.StartNpcs, row.StartObjects);
            var end = FirstLocated(row.EndNpcs, row.EndObjects);
            StartItemFix? si = fix?.StartItem;
            if (start == null && si == null && row.StartItems.Count > 0) si = AutoStartItem(row);
            if (start == null && si == null && end == null) continue;

            bool forced = Cfg.Include.Contains(row.Id) || held;
            if (Cfg.Exclude.TryGetValue(row.Id.ToString(), out var why)) { Excluded[row.Id] = why; continue; }
            if (raceBit != 0 && row.Races != 0 && (row.Races & raceBit) == 0) continue;
            if (classBit != 0 && row.Classes != 0 && (row.Classes & classBit) == 0) continue;
            if (!forced)
            {
                string? reason =
                    row.Repeatable ? "repeatable" :
                    row.EventOnly ? "world-event quest" :
                    row.Parent != 0 ? $"helper for {Data.Quests.GetValueOrDefault(row.Parent)?.Name ?? "quest " + row.Parent}" :
                    row.NeedsSkill ? "needs a profession" :
                    row.NeedsReputation ? "needs reputation" :
                    row.ZoneOrSort < 0 && !Game.ClassSorts.Contains(row.ZoneOrSort) && row.ZoneOrSort != Game.CampingSort ? $"special category (sort {row.ZoneOrSort})" :
                    row.ZoneOrSort > 0 && Data.Instances.Contains(row.ZoneOrSort) ? "dungeon quest" :
                    row.Level > ScopeMax || row.ReqLevel > ScopeMax ? $"level {row.Level} (needs {row.ReqLevel}), above this zone's range of {LevelLo}-{ScopeMax}" :
                    scopeMin != null && row.Level < scopeMin ? $"level {row.Level}, below the requested minimum" : null;
                if (reason != null) { Excluded[row.Id] = reason; continue; }
            }
            var q = new Quest { Row = row, Fix = fix ?? new QuestFix(), Start = start, End = end, StartItem = start == null || fix?.StartItem != null ? si : null };
            q.Tag = TagFor(row.Races, row.Classes, Races, FactionMask);
            q.Elig = SingleCharacter ? AllElig : EligFor(row.Races, row.Classes);
            // the database sometimes lists a quest, or the alternatives it excludes, among its own prerequisites
            q.PreAll = row.PreGroup.Where(p => p != row.Id && !row.Exclusive.Contains(p)).ToHashSet();
            q.PreAny = row.PreSingle.Where(p => p != row.Id && !row.Exclusive.Contains(p)).ToHashSet();
            if (q.Fix.Pre != null) foreach (int p in q.Fix.Pre) q.PreAll.Add(p);
            q.PreAll.ExceptWith(Visit.Done);                       // finished on an earlier visit
            if (q.PreAny.Overlaps(Visit.Done)) q.PreAny.Clear();
            q.Optional = q.Fix.Optional;
            q.XpKnown = Data.QuestXp.ContainsKey(row.Id) || q.Fix.Xp != null;
            q.Xp = q.Fix.Xp ?? (Data.QuestXp.TryGetValue(row.Id, out int xp) ? xp : Data.TypicalXp.GetValueOrDefault(Math.Clamp(row.Level, 1, 60), 500));
            Quests[row.Id] = q;
        }
    }

    StartItemFix? AutoStartItem(QuestRow row)
    {
        foreach (int item in row.StartItems)
        {
            if (!Data.Items.TryGetValue(item, out var it)) continue;
            var npcs = it.NpcDrops.Where(n => Points(EntKind.Npc, n).Count > 0).ToList();
            if (npcs.Count == 0) continue;
            int spawns = npcs.Sum(n => Points(EntKind.Npc, n).Select(p => p.Pos).Distinct().Count());
            string name = it.Name;
            if (spawns <= 3)
                return new StartItemFix { Item = item, Npcs = npcs, Mob = Data.NpcName(npcs[0]), Text = $"Kill |cRXP_ENEMY_{Data.NpcName(npcs[0])}|r and loot |cRXP_LOOT_{name}|r. Use it to start the quest" };
            return new StartItemFix { Item = item, Npcs = npcs, Passive = true, Text = $"|cRXP_LOOT_{name}|r can drop from {string.Join(", ", npcs.Take(3).Select(n => "|cRXP_ENEMY_" + Data.NpcName(n) + "|r"))}. Use it to start the quest if you get one" };
        }
        return null;
    }

    // ------------------------------------------------------------------ objectives
    int CountFromText(Quest q, string? name, int dflt, int? idx, out bool found)
    {
        found = true;
        if (idx != null && Rxp?.Count(q.Id, idx.Value) is { } rc) return rc;
        if (string.IsNullOrEmpty(name)) { found = false; return dflt; }
        string num = @"(\d+|" + string.Join("|", NumberWords.Keys) + ")";
        int Val(string v) => int.TryParse(v, out int n) ? n : NumberWords[v.ToLowerInvariant()];
        string stem = Regex.Escape(Regex.Replace(name, "(y|ies|s)$", ""));
        foreach (var t in q.Row.Text)
        {
            var m = Regex.Match(t, num + @"\s+" + stem, RegexOptions.IgnoreCase);
            if (m.Success) return Val(m.Groups[1].Value);
        }
        string last = Regex.Escape(Regex.Replace(name.Split(' ')[^1], "(y|ies|s)$", ""));
        foreach (var t in q.Row.Text)
        {
            var m = Regex.Match(t, num + @"\s+(?:[\w']+\s+){0,2}?" + last, RegexOptions.IgnoreCase);
            if (m.Success) return Val(m.Groups[1].Value);
        }
        found = false;
        return dflt;
    }

    void ResolveObjectives(Quest q)
    {
        var row = q.Row;
        if (q.Fix.Objectives != null)
        {
            foreach (var f in q.Fix.Objectives)
            {
                var o = new Obj
                {
                    Index = f.Index, Kind = f.Kind, Label = f.Label ?? "", Text = f.Text, Command = f.Command, Seq = f.After, Count = f.Count ?? 1, MinLevel = f.MinLevel ?? 1,
                    Extra = f.ExtraLines.ToList(), Targets = f.Targets.Select(t => (t.Kind, t.Name)).ToList(), MobLevel = f.MobLevel, SrcNpcs = f.Npcs.ToList(),
                };
                var pts = f.Points.Select(s => { var (a, p) = World(s); return new SpawnPt(a, p, f.MobLevel, (EntKind.Object, 0)); }).ToList();
                (Pt, double)? near = f.Near == null ? null : (World(f.Near.Point).pos, f.Near.Radius);
                pts.AddRange(Points(f.Npcs, f.Objects, near));
                if (f.Patrol && f.Npcs.Count > 0 && pts.Count > 0) { (o.Cands, o.Loop) = PatrolCands(f.Npcs[0], pts[0].Area); o.Patrol = true; }
                else
                {
                    o.Cands = MakeCands(pts, o.Count);
                    if (o.Cands.Count > 0 && o.Kind == "talk" && Geo.Span(o.Cands[0].Pts) > Tuning.PatrolRange) { o.Patrol = true; o.Loop = Geo.Thin(o.Cands[0].Pts, 60); }
                }
                o.MobLevel ??= o.Cands.Select(c => c.MobLevel).FirstOrDefault(l => l != null) ?? q.Level;
                o.Kills = f.Kills ?? (o.Kind is "kill" or "loot" ? o.Count : 0);
                o.SrcNames = f.Npcs.Select(Data.NpcName).Concat(f.Objects.Select(Data.ObjectName)).ToList();
                if (o.Cands.Count == 0) o.Elsewhere = ElsewhereName(EntKind.Npc, f.Npcs) ?? ElsewhereName(EntKind.Object, f.Objects) ?? "an unknown place";
                q.Objs.Add(o);
            }
            return;
        }

        int idx = 0; var imap = q.Fix.ObjectiveIndex ?? new Dictionary<string, int>();
        int Next(int id) => idx = imap.TryGetValue(id.ToString(), out int v) ? v : idx + 1;
        var killed = new HashSet<int>();
        foreach (var (id, text) in row.KillNpcs)
        {
            int ix = Next(id); string nm = Data.NpcName(id); var pts = Points(EntKind.Npc, id);
            int icon = row.ObjectiveIcon.GetValueOrDefault(id);
            if (icon == 0 && Data.Npcs.GetValueOrDefault(id)?.Level is { } nl && nl > q.Level + 8)
            {
                icon = 5;
                q.Notes.Add($"{nm} is level {nl:0}, far above this level {q.Level} quest, so the objective is taken to be \"talk to\" rather than \"kill\"");
            }
            if (icon is 3 or 5 or 17)
            {
                // not a kill: talk to it, use it, or be there for an event
                int n = CountFromText(q, nm, 1, ix, out _);
                var tk = new Obj { Index = ix, Kind = icon == 3 ? "event" : "talk", Label = (text ?? nm) + (n > 1 ? $" ({n})" : ""), Count = n, Kills = 0, MobLevel = q.Level };
                tk.Text = icon == 5 ? $"{Emitter.Talk}Talk to |cRXP_FRIENDLY_{nm}|r" : icon == 17 ? $"Interact with |cRXP_FRIENDLY_{(n > 1 ? Emitter.Plural(nm) : nm)}|r" : text ?? (row.Text.Count > 0 ? row.Text[0] : $"Go to |cRXP_FRIENDLY_{nm}|r");
                tk.Targets.Add(("target", nm)); tk.SrcNames.Add(nm); tk.Cands = MakeCands(pts, n);
                if (tk.Cands.Count > 0 && Geo.Span(tk.Cands[0].Pts) > Tuning.PatrolRange && n == 1) { tk.Patrol = true; tk.Loop = Geo.Thin(tk.Cands[0].Pts, 60); }
                if (tk.Cands.Count == 0) tk.Elsewhere = ElsewhereName(EntKind.Npc, new[] { id }) ?? "an unknown place";
                q.Objs.Add(tk);
                continue;
            }
            int cnt = CountFromText(q, nm, pts.Count <= 2 ? 1 : 8, ix, out bool found);
            var o = new Obj { Index = ix, Kind = "kill", Label = text != null ? $"{text} ({cnt})" : $"{nm} slain ({cnt})", Count = cnt, Kills = cnt, MobLevel = Data.Npcs.GetValueOrDefault(id)?.Level ?? q.Level };
            o.Targets.Add(("mob", nm)); o.SrcNames.Add(nm); o.SrcNpcs.Add(id); o.Cands = MakeCands(pts, cnt);
            if (!found && pts.Count > 2) q.Notes.Add($"could not read how many {nm} are needed from the quest text; assumed {cnt}");
            if (o.Cands.Count == 0) o.Elsewhere = ElsewhereName(EntKind.Npc, new[] { id }) ?? "an unknown place";
            killed.Add(id); q.Objs.Add(o);
        }
        foreach (var (id, text) in row.UseObjects)
        {
            int ix = Next(id); string nm = Data.ObjectName(id);
            var o = new Obj { Index = ix, Kind = "object", Label = text ?? nm, Count = 1 };
            o.SrcNames.Add(nm); o.Cands = MakeCands(Points(EntKind.Object, id), 1);
            if (o.Cands.Count == 0) o.Elsewhere = ElsewhereName(EntKind.Object, new[] { id }) ?? "an unknown place";
            q.Objs.Add(o);
        }
        foreach (var (id, _) in row.NeedItems)
        {
            int ix = Next(id); var it = Data.Items.GetValueOrDefault(id); string nm = it?.Name ?? $"item {id}";
            int cnt = CountFromText(q, nm, 1, ix, out _);
            var nd = it?.NpcDrops.Where(n => Points(EntKind.Npc, n).Count > 0).ToList() ?? new();
            var od = it?.ObjectDrops.Where(n => Points(EntKind.Object, n).Count > 0).ToList() ?? new();
            var ve = it?.Vendors.Where(n => Points(EntKind.Npc, n).Count > 0).ToList() ?? new();
            Obj o;
            if (nd.Count > 0 || od.Count > 0)
            {
                var pts = Points(nd, od);
                var rates = nd.Select(n => Data.DropRates.GetValueOrDefault(id)?.GetValueOrDefault(n) ?? 0).Where(r => r > 0).ToList();
                double rate = rates.Count > 0 ? rates.Average() / 100.0 : 0.5;
                double kills = nd.Count == 0 || nd.Any(killed.Contains) ? 0 : Math.Min(cnt / Math.Max(rate, 0.2), cnt * 4);
                if (cnt == 1 && pts.Count <= 3) kills = nd.Count > 0 ? 1 : 0;
                var lv = nd.Select(n => Data.Npcs.GetValueOrDefault(n)?.Level).Where(l => l != null).Select(l => l!.Value).ToList();
                o = new Obj { Index = ix, Kind = nd.Count > 0 ? "loot" : "object", Label = $"{nm} ({cnt})", Count = cnt, Kills = kills, Loot = nm, MobLevel = lv.Count > 0 ? lv.Average() : q.Level, Cands = MakeCands(pts, cnt), SrcNpcs = nd };
                o.Targets = nd.Take(4).Select(n => ("mob", Data.NpcName(n))).Distinct().ToList();
                o.SrcNames = nd.Take(4).Select(Data.NpcName).Concat(od.Take(2).Select(Data.ObjectName)).Distinct().ToList();
            }
            else if (ve.Count > 0)
            {
                o = new Obj { Index = ix, Kind = "buy", Label = $"{nm} ({cnt})", Count = cnt, Loot = nm, Cands = MakeCands(Points(EntKind.Npc, ve[0]), 1) };
                o.Targets.Add(("target", Data.NpcName(ve[0]))); o.SrcNames.Add(Data.NpcName(ve[0]));
            }
            else
            {
                bool given = id == row.SourceItem || (it != null && it.NpcDrops.Count + it.ObjectDrops.Count + it.Vendors.Count == 0 && row.SourceItem != 0);
                if (given) continue;                              // handed over by the quest giver; nothing to do on the way
                o = new Obj { Index = ix, Kind = "none", Label = $"{nm} ({cnt})", Count = cnt, Loot = nm };
                o.Elsewhere = (it == null ? null : ElsewhereName(EntKind.Npc, it.NpcDrops) ?? ElsewhereName(EntKind.Object, it.ObjectDrops) ?? ElsewhereName(EntKind.Npc, it.Vendors)) ?? "an unknown place";
            }
            q.Objs.Add(o);
        }
        foreach (var (ids, text) in row.KillCredits)
        {
            int ix = Next(ids.Count > 0 ? ids[0] : 0); string nm = text ?? (ids.Count > 0 ? Data.NpcName(ids[0]) : "?"); var pts = Points(ids, Array.Empty<int>());
            int cnt = CountFromText(q, nm, pts.Count <= 2 ? 1 : 8, ix, out _);
            var lv = ids.Select(n => Data.Npcs.GetValueOrDefault(n)?.Level).Where(l => l != null).Select(l => l!.Value).ToList();
            var o = new Obj { Index = ix, Kind = "kill", Label = $"{nm} ({cnt})", Count = cnt, Kills = cnt, MobLevel = lv.Count > 0 ? lv.Average() : q.Level, Cands = MakeCands(pts, cnt), SrcNpcs = ids };
            o.Targets = ids.Take(4).Select(n => ("mob", Data.NpcName(n))).Distinct().ToList(); o.SrcNames = o.Targets.Select(t => t.Name).ToList();
            if (o.Cands.Count == 0) o.Elsewhere = ElsewhereName(EntKind.Npc, ids) ?? "an unknown place";
            if (row.KillNpcs.Count + row.UseObjects.Count + row.NeedItems.Count > 0) q.Notes.Add($"mixes a kill-credit objective with others; check that \"{nm}\" really is line {ix} in the quest log");
            q.Objs.Add(o);
        }
        if (row.TriggerText != null)
        {
            int ix = ++idx; var pts = new List<SpawnPt>();
            foreach (var (key, list) in row.TriggerPoints)
            {
                int ai = AreaIndex(key);
                if (ai >= 0) pts.AddRange(list.Select(p => new SpawnPt(ai, Areas[ai].ToWorld(p), null, (EntKind.Object, 0))));
            }
            var o = new Obj { Index = ix, Kind = "event", Label = row.TriggerText, Text = row.TriggerText, Count = 1, Cands = MakeCands(pts, 1) };
            if (o.Cands.Count == 0) o.Elsewhere = "another zone";
            if (ix > 1) q.Notes.Add($"\"{row.TriggerText}\" is assumed to be line {ix} in the quest log; check it");
            q.Objs.Add(o);
        }
        if (row.HasOtherObjectives) q.Notes.Add("has a reputation or spell objective, which is not planned");
        // things you need in your bags before the objectives can be done
        var pre = new List<Obj>();
        foreach (int item in row.RequiredSourceItems)
        {
            if (item == row.SourceItem || !Data.Items.TryGetValue(item, out var it)) continue;
            if (row.NeedItems.Any(n => n.id == item)) continue;
            var nd = it.NpcDrops.Where(n => Points(EntKind.Npc, n).Count > 0).ToList(); var od = it.ObjectDrops.Where(n => Points(EntKind.Object, n).Count > 0).ToList();
            if (nd.Count + od.Count == 0) continue;
            var lv = nd.Select(n => Data.Npcs.GetValueOrDefault(n)?.Level).Where(l => l != null).Select(l => l!.Value).ToList();
            if (lv.Count > 0 && lv.Average() > q.Level + 8) continue;     // handed over by a friendly NPC, not looted
            var o = new Obj { Kind = nd.Count > 0 ? "loot" : "object", Command = $".collect {item},1,{q.Id},1 --{it.Name} (1)", Label = it.Name, Loot = it.Name, Count = 1, Kills = nd.Count > 0 ? 2 : 0, MobLevel = lv.Count > 0 ? lv.Average() : q.Level, Cands = MakeCands(Points(nd, od), 1), SrcNpcs = nd };
            o.Targets = nd.Take(4).Select(n => ("mob", Data.NpcName(n))).Distinct().ToList();
            o.SrcNames = nd.Take(4).Select(Data.NpcName).Concat(od.Take(2).Select(Data.ObjectName)).Distinct().ToList();
            if (o.Cands.Count > 0) pre.Add(o);
        }
        if (pre.Count > 0 && q.Objs.Count > 0)
        {
            q.Objs[0].Seq = true;                                // the real objectives wait for the item
            q.Objs.InsertRange(0, pre);
        }
        // cross-check objective numbers against RestedXP's notes
        if (Rxp != null)
            foreach (var o in q.Objs.Where(o => o.Index != null && o.Command == null))
                if (Rxp.Agrees(q.Id, o.Index!.Value, o.Label) == false)
                {
                    var other = Enumerable.Range(1, 6).Where(i => i != o.Index && Rxp.Agrees(q.Id, i, o.Label) == true).ToList();
                    if (other.Count == 1 && !q.Objs.Any(x => x != o && x.Index == other[0] && Rxp.Agrees(q.Id, other[0], x.Label) == true))
                    {
                        q.Notes.Add($"objective \"{o.Label}\" moved from line {o.Index} to line {other[0]} to match RestedXP's guide");
                        o.Index = other[0];
                    }
                    else q.Notes.Add($"objective \"{o.Label}\" is line {o.Index} by the database, but RestedXP's guide has \"{string.Join("\" / \"", Rxp.Lines[(q.Id, o.Index.Value)])}\" there");
                }
    }

    /// <summary>Random-drop quest starters ride along with quests that kill the same mobs; without one they are left out.</summary>
    void SettleStartItems()
    {
        foreach (var q in Quests.Values.ToList())
        {
            var si = q.StartItem;
            if (si == null) continue;
            if (!si.Passive)
            {
                if (Points(si.Npcs, Array.Empty<int>()).Count == 0) { Excluded[q.Id] = "starts from an item whose source is not in this zone"; Quests.Remove(q.Id); }
                si.Mob ??= si.Npcs.Count > 0 ? Data.NpcName(si.Npcs[0]) : "?";
                si.Text ??= $"Kill |cRXP_ENEMY_{si.Mob}|r and loot |cRXP_LOOT_{Data.ItemName(si.Item)}|r. Use it to start the quest";
                continue;
            }
            si.Text ??= $"|cRXP_LOOT_{Data.ItemName(si.Item)}|r can drop here. Use it to start the quest if you get one";
            if (si.Anchors.Count == 0)
                si.Anchors = Quests.Values.Where(a => a.Id != q.Id && a.StartItem == null && (a.Elig & q.Elig) == q.Elig && a.Routed.Any(o => o.Kind is "kill" or "loot" && o.SrcNpcs.Intersect(si.Npcs).Any())).Select(a => a.Id).ToList();
            else si.Anchors = si.Anchors.Where(Quests.ContainsKey).ToList();
            if (si.Anchors.Count == 0) { Excluded[q.Id] = "starts from a random drop, and no quest in this guide kills those mobs"; Quests.Remove(q.Id); }
            else q.Optional = true;
        }
    }

    // ------------------------------------------------------------------ how each quest relates to the zone
    void Classify()
    {
        foreach (var q in Quests.Values.ToList())
        {
            bool startsHere = q.Start != null || q.StartItem != null;
            q.Arrival = q.Carried = q.Late = q.DataGap = false; q.Status = null;
            if (Visit.HeldOver.Contains(q.Id))
            {
                if (q.End == null) { Quests.Remove(q.Id); continue; }
                q.Arrival = true; q.Origin = "your earlier visit to this zone";
            }
            else if (!startsHere)
            {
                q.Arrival = true;
                q.Origin = ElsewhereName(EntKind.Npc, q.Row.StartNpcs) ?? ElsewhereName(EntKind.Object, q.Row.StartObjects);
                if (q.Origin == null && !Cfg.Include.Contains(q.Id)) { Excluded[q.Id] = "handed in here, but the database does not say where it starts"; Quests.Remove(q.Id); continue; }
                q.Origin ??= "elsewhere";
            }
            else if (q.End == null || q.Fix.NoTurnin)
            {
                q.Carried = true;
                q.Destination = ElsewhereName(EntKind.Npc, q.Row.EndNpcs) ?? ElsewhereName(EntKind.Object, q.Row.EndObjects) ?? "another zone";
            }
            if (!q.Carried && !q.Arrival)
            {
                if (q.Unrouted.Count > 0)
                {
                    q.Late = true;
                    q.Status = "part of it is outside this zone (" + string.Join("; ", q.Unrouted.Select(o => $"{o.Label}: {o.Elsewhere}")) + "), so its hand-in step only shows once the quest is complete";
                }
                else if (q.Objs.Count == 0 && q.Fix.Objectives == null && q.Start != null && q.End != null && q.Start == q.End && !q.Row.HasObjectives && !Data.QuestXp.ContainsKey(q.Id))
                {
                    q.Late = true; q.DataGap = true;
                }
            }
        }
        // of quests that shut each other out, only the first can be in the plan for the same character
        foreach (var q in Quests.Values.ToList())
        {
            if (q.Arrival || !Quests.ContainsKey(q.Id) || Cfg.Include.Contains(q.Id)) continue;
            foreach (int x in q.Row.Exclusive)
                if (x > q.Id && Quests.TryGetValue(x, out var other) && !other.Arrival && (other.Elig & q.Elig) != 0)
                {
                    Excluded[x] = $"cannot be taken together with {q.Name} [{q.Id}], which is in the guide";
                    Quests.Remove(x);
                }
        }
        // a quest is "conditional" when something it needs is never handed in by this guide
        bool Firm(Quest p, Quest forQ) => p.HasTurnin && !p.Cond && !p.Late && !p.Optional && (p.Elig & forQ.Elig) == forQ.Elig;
        bool changed = true;
        while (changed)
        {
            changed = false;
            foreach (var q in Quests.Values)
            {
                if (q.Arrival) continue;
                var needAll = q.PreAll.Where(p => !Quests.TryGetValue(p, out var pq) || !Firm(pq, q)).OrderBy(p => p).ToList();
                // "any one of": fine when, between them, the alternatives this guide hands in cover every character the quest is for
                // (e.g. one version of a quest for warlocks and another for everyone else)
                ulong covered = 0;
                foreach (int p in q.PreAny)
                    if (Quests.TryGetValue(p, out var pq) && pq.HasTurnin && !pq.Cond && !pq.Late && !pq.Optional) covered |= pq.Elig & q.Elig;
                var needAny = q.PreAny.Count > 0 && covered != q.Elig ? q.PreAny.OrderBy(p => p).ToList() : new List<int>();
                bool cond = needAll.Count > 0 || needAny.Count > 0;
                if (cond != q.Conditional || !needAll.SequenceEqual(q.NeedAll) || !needAny.SequenceEqual(q.NeedAny))
                {
                    q.Conditional = cond; q.NeedAll = needAll; q.NeedAny = needAny; changed = true;
                }
            }
        }
        var levels = Quests.Values.Where(q => !q.Cond).Select(q => q.Level).DefaultIfEmpty(1).ToList();
        LevelLo = levels.Min(); LevelHi = levels.Max();
        StartLevel = Visit.Number > 1 ? Visit.MinStartLevel : Visit.StartLevel ?? Opt.StartLevel ?? Cfg.StartLevel ?? LevelLo;
        StartXp = Game.XpAt(Math.Clamp(StartLevel, 1, Game.MaxLevel));
    }

    /// <summary>
    /// The level a quest cannot sensibly be done below, and what sets it. The level needed to pick it up is a
    /// hard limit; the level for its mobs can be stretched a little at the end of a visit.
    /// </summary>
    (double need, string why) LevelNeeded(Quest q)
    {
        double need = q.Req > 1 ? q.Req + Tuning.Safety : 1; string why = $"needs level {q.Req}";
        foreach (var o in q.Routed)
        {
            bool fight = o.Kind is "kill" or "loot";
            double mob = fight ? o.Cands.Min(c => Math.Floor(c.MobLevel ?? o.MobLevel ?? q.Level)) : 0;
            double n = (fight ? Math.Max(o.MinLevel, mob - Tuning.MobMargin) : Math.Max(o.MinLevel, q.Level - Tuning.Margin)) - Tuning.VisitStretch;
            if (n > need) { need = n; why = fight ? $"its mobs are level {mob:0}" : $"is a level {q.Level} quest"; }
        }
        return (need, why);
    }

    /// <summary>
    /// Puts off quests that need a higher level than everything in this visit adds up to, and the quests
    /// that follow them. True if any went (the level reached drops again, so the caller repeats).
    /// </summary>
    bool TrimByLevel()
    {
        bool any = false; var inv = System.Globalization.CultureInfo.InvariantCulture;
        foreach (var q in Quests.Values.Where(q => !q.Arrival && !Cfg.Include.Contains(q.Id)).ToList())
        {
            double cap = Game.FracLevel(StartXp + Tasks.Where(t => !t.Cond && (t.Elig & q.Elig) == q.Elig).Sum(t => t.Xp));
            var (need, why) = LevelNeeded(q);
            // a build limited with --max-level is meant to hold its quests: a short grind at the end beats a part of its own
            double slack = Opt.MaxLevel != null && q.Req <= Opt.MaxLevel ? 1.0 : 0;
            if (need <= cap + slack) continue;
            Later[q.Id] = ($"{why}; this part gets {(q.Tag.Length > 0 ? q.Tag + " characters" : "you")} to about {cap.ToString("0.0", inv)}", need, q.Cond);
            Quests.Remove(q.Id); any = true;
        }
        for (bool moved = true; moved;)
        {
            moved = false;
            foreach (var q in Quests.Values.Where(q => !q.Arrival).ToList())
            {
                int lead = q.PreAll.FirstOrDefault(Later.ContainsKey);
                if (lead == 0 && q.StartItem is { Passive: true } si && !si.Anchors.Any(Quests.ContainsKey)) lead = si.Anchors.FirstOrDefault(Later.ContainsKey);
                if (lead == 0 && q.PreAny.Any(Later.ContainsKey) && !q.PreAny.Any(p => Quests.TryGetValue(p, out var pq) && pq.HasTurnin && !pq.Cond && !pq.Late)) lead = q.PreAny.First(Later.ContainsKey);
                if (lead == 0) continue;
                Later[q.Id] = ($"follows {Data.Quests[lead].Name} [{lead}]", Math.Max(Later[lead].Need, LevelNeeded(q).need), q.Cond || Later[lead].Cond);
                Quests.Remove(q.Id); moved = any = true;
            }
        }
        return any;
    }

    void PickInn()
    {
        if (Opt.NoHearth) return;
        int id = Cfg.Innkeeper ?? 0;
        if (id == 0)
        {
            var givers = Quests.Values.Where(q => q.Start != null && q.Start.Cands[0].Area == 0).Select(q => q.Start!.Cands[0].Pos).ToList();
            if (givers.Count == 0) return;
            var mid = new Pt(givers.Average(p => p.X), givers.Average(p => p.Y));
            var inns = Data.Npcs.Values.Where(n => n.Innkeeper).Select(n => (n, pts: Points(EntKind.Npc, n.Id).Where(p => p.Area == 0).ToList())).Where(x => x.pts.Count > 0).ToList();
            if (inns.Count == 0) return;
            id = inns.MinBy(x => x.pts.Min(p => p.Pos.To(mid))).n.Id;
        }
        var e = GetEnt(EntKind.Npc, id);
        if (e.Cands.Count == 0) { Notes.Add($"innkeeper {id} has no position in this zone; no hearthstone steps were planned"); return; }
        Inn = e; BindName = Cfg.BindName ?? e.Name + "'s inn";
    }

    // ------------------------------------------------------------------ tasks
    RouteTask Add(TaskKind kind, Quest? q, int no, List<Cand> cands, double xp, int minLevel, Obj? obj = null, Ent? ent = null)
    {
        var t = new RouteTask { Id = Tasks.Count, Kind = kind, Q = q, Cands = cands, Xp = q != null && (q.Cond || q.Late && kind == TaskKind.TurnIn || q.Optional && kind == TaskKind.TurnIn) ? 0 : xp, MinLevel = minLevel, Obj = obj, Ent = ent, ObjNo = no };
        t.Elig = q?.Elig ?? AllElig; t.Cond = q?.Cond ?? false;
        t.Secs = obj == null ? 12 : 30 + obj.Kills * 35 + (obj.Kind == "object" ? obj.Count * 8 : 0);
        Tasks.Add(t); Index[(kind == TaskKind.ItemAccept ? TaskKind.Accept : kind, q?.Id ?? 0, no)] = t;
        return t;
    }

    public RouteTask? Find(TaskKind kind, int quest, int no = -1) => Index.GetValueOrDefault((kind, quest, no));

    void BuildTasks()
    {
        Tasks.Clear(); Index.Clear(); Home = null;
        var seenSrc = new HashSet<string>();
        foreach (var q in Quests.Values.OrderBy(q => q.Level).ThenBy(q => q.Id))
        {
            var si = q.StartItem;
            if (q.Arrival || si is { Passive: true }) { }
            else if (si != null)
            {
                var pts = Points(si.Npcs, Array.Empty<int>()); double? lv = pts.Select(p => p.Level).FirstOrDefault(l => l != null);
                Add(TaskKind.ItemAccept, q, -1, MakeCands(pts, 1), lv != null ? Game.MobXp(lv.Value, (int)lv.Value) : 0, Math.Max(q.Req, si.MinLevel ?? 1));
            }
            else Add(TaskKind.Accept, q, -1, q.Start!.Cands, 0, q.Req, ent: q.Start);
            var routed = q.Routed;
            for (int k = 0; k < routed.Count; k++)
            {
                var o = routed[k]; double ml = o.MobLevel ?? q.Level; double share = 1;
                if (o.SrcNames.Count > 0 && o.Kills > 0)
                {
                    string key = string.Join("|", o.SrcNames.OrderBy(s => s, StringComparer.Ordinal));
                    if (!seenSrc.Add(key)) share = Tuning.SharedKillXp;
                }
                double kx = o.Kills * Game.MobXp(ml, (int)Math.Round(ml)) * Tuning.KillXp * share;
                Add(TaskKind.Objective, q, k, o.Cands, kx, Math.Max(1, q.Level - (int)Tuning.Margin), obj: o);
            }
            if (q.HasTurnin)
            {
                var t = Add(TaskKind.TurnIn, q, -1, q.End!.Cands, q.Xp, 1, ent: q.End);
                t.Deferred = q.Late;
            }
        }
        foreach (var q in Quests.Values)
        {
            var a = Find(TaskKind.Accept, q.Id); var t = Find(TaskKind.TurnIn, q.Id);
            var os = Enumerable.Range(0, q.Routed.Count).Select(k => Find(TaskKind.Objective, q.Id, k)!).ToList();
            var routed = q.Routed;
            for (int k = 0; k < os.Count; k++)
            {
                if (a != null) os[k].Pre.Add(a.Id);
                t?.Pre.Add(os[k].Id);
                if (routed[k].Seq && k > 0) for (int j = 0; j < k; j++) os[k].Pre.Add(os[j].Id);
            }
            if (a != null) t?.Pre.Add(a.Id);
            if (q.Fix.Tight && os.Count > 0 && a != null) os[0].Tight = a.Id;
            var first = a ?? (os.Count > 0 ? os[0] : t);
            if (first != null)
            {
                foreach (int p in q.PreAll) if (Find(TaskKind.TurnIn, p) is { } pt) first.Pre.Add(pt.Id);
                var any = q.PreAny.Select(p => Find(TaskKind.TurnIn, p)).Where(x => x != null).Select(x => x!.Id).ToList();
                if (any.Count > 0) first.PreAny = any.ToHashSet();
                foreach (var after in q.Fix.PickupAfter ?? new())
                {
                    if (after.Length == 0) continue;
                    int pq = after[0], line = after.Length > 1 ? after[1] : 0;
                    string what = line > 0 ? $"line {line} of quest {pq}" : $"the objectives of quest {pq}";
                    var objs = Tasks.Where(x => x.Kind == TaskKind.Objective && x.Q?.Id == pq && (line == 0 || x.Obj?.Index == line)).ToList();
                    if (objs.Count > 0) foreach (var ot in objs) first.Pre.Add(ot.Id);
                    else if (Find(TaskKind.TurnIn, pq) is { } pt) { first.Pre.Add(pt.Id); q.Notes.Add($"\"pickupAfter\": {what} is not a step in this guide, so the pickup waits for quest {pq}'s hand-in instead"); }
                    else q.Notes.Add($"\"pickupAfter\": {what} is not in this guide, so it was ignored");
                }
            }
            if (q.StartItem is { Passive: true } si && t != null)
                foreach (int aq in si.Anchors.Where(Quests.ContainsKey))
                    for (int k = 0; k < Quests[aq].Routed.Count; k++) t.Pre.Add(Find(TaskKind.Objective, aq, k)!.Id);
        }
        // a breadcrumb has to be handed in before the quest it leads to is picked up
        foreach (var q in Quests.Values)
            if (q.Row.BreadcrumbFor != 0 && Find(TaskKind.Accept, q.Row.BreadcrumbFor) is { } target && Find(TaskKind.TurnIn, q.Id) is { Deferred: false } mine)
                target.Pre.Add(mine.Id);
        // binding at the inn is only worth a stop when there is a fair amount to do
        if (Inn != null && Tasks.Count(t => !t.Cond) >= 25) Home = Add(TaskKind.Home, null, -1, Inn.Cands, 0, 1, ent: Inn);
    }

    /// <summary>Hub number for every place a task can be done (-1 = not at a hub), and how many hubs there are.</summary>
    public readonly Dictionary<Cand, int> HubOf = new(ReferenceEqualityComparer.Instance);
    public int HubCount;

    /// <summary>
    /// A hub is a group of quest givers within reach of each other (chained). When the player is at one,
    /// everything on offer there should be dealt with before leaving.
    /// </summary>
    void BuildHubs()
    {
        var nodes = Tasks.Where(t => t.Ent is { Patrol: false } && t.Kind is TaskKind.Accept or TaskKind.TurnIn or TaskKind.Home).SelectMany(t => t.Cands).Distinct(ReferenceEqualityComparer.Instance).Cast<Cand>().ToList();
        var par = Enumerable.Range(0, nodes.Count).ToArray();
        int Find(int a) { while (par[a] != a) { par[a] = par[par[a]]; a = par[a]; } return a; }
        for (int i = 0; i < nodes.Count; i++)
            for (int j = i + 1; j < nodes.Count; j++)
                if (nodes[i].Area == nodes[j].Area && nodes[i].Pos.To(nodes[j].Pos) <= Tuning.HubRadius) par[Find(i)] = Find(j);
        var ids = new Dictionary<int, int>();
        for (int i = 0; i < nodes.Count; i++)
        {
            int r = Find(i);
            if (!ids.TryGetValue(r, out int id)) ids[r] = id = ids.Count;
            HubOf[nodes[i]] = id;
        }
        HubCount = ids.Count;
        // anywhere else you stand within reach of a quest giver counts as being at that hub
        foreach (var c in Tasks.SelectMany(t => t.Cands))
        {
            if (HubOf.ContainsKey(c)) continue;
            var near = nodes.Where(x => x.Area == c.Area && x.Pos.To(c.Pos) <= Tuning.HubRadius).OrderBy(x => x.Pos.To(c.Pos)).FirstOrDefault();
            HubOf[c] = near != null ? HubOf[near] : -1;
        }
    }

    void PickStart()
    {
        if (Cfg.Start != null) { (StartArea, Start) = World(Cfg.Start); return; }
        var first = Tasks.Where(t => t.Kind == TaskKind.Accept && !t.Cond && t.Cands.Count > 0 && t.Cands[0].Area == 0).OrderBy(t => t.Q!.Req).ThenBy(t => t.Q!.Level).ThenBy(t => t.Q!.Id).FirstOrDefault()
                    ?? Tasks.FirstOrDefault(t => t.Cands.Count > 0);
        if (first != null) { Start = first.Cands[0].Pos; StartArea = first.Cands[0].Area; }
    }
}
