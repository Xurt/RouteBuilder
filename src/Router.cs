using System.Numerics;

namespace RouteBuilder;

/// <summary>What the simulated player experiences along one ordering, position by position.</summary>
public sealed class Sim
{
    public double Travel, Penalty, EndXp, LevelShort; public int Broken, Misses, Passes;
    public double[] Leg = Array.Empty<double>(), Level = Array.Empty<double>(), XpBefore = Array.Empty<double>();
    public bool[] Hearth = Array.Empty<bool>();
    public int Hearths => Hearth.Count(h => h);
}

/// <summary>
/// Scores an ordering of tasks: yards walked plus penalties for anything a player could not or would not do
/// (broken prerequisites, being too low level, carrying finished quests around, thin spawn patches).
/// Only tasks marked active exist as far as this evaluator is concerned.
/// </summary>
public sealed class Evaluator
{
    readonly ZoneModel m; readonly int n;
    public readonly int[][] Pre, Any, Succ; public readonly int[] Tight;
    readonly double[] xp, secs, late, safe, qlv; readonly bool[] isTurn, isAcc;
    readonly double[][] ct, cx, cy; readonly int[][] ca, ml;
    readonly bool[] done; readonly double[] mark;
    readonly int home; readonly double bx, by; readonly int barea;
    readonly Travel travel;
    public readonly int[][] Hub;       // [task][place] -> hub number, or -1
    public readonly int[][] HubTasks;  // [hub] -> pickups and hand-ins that can be done there
    public readonly bool[] Active;
    readonly bool[] pass;              // hand-ins that count as "run past" when the route goes by them finished
    readonly int[] preCount, left, wait;
    /// <param name="watch">Which pickups and hand-ins count as "left behind" when the player walks away from them; null = all.</param>
    public Evaluator(ZoneModel model, bool[] active, bool[]? watch = null)
    {
        m = model; n = m.Tasks.Count; Active = active; travel = m.Travel;
        Pre = new int[n][]; Any = new int[n][]; Tight = new int[n]; xp = new double[n]; secs = new double[n]; late = new double[n]; safe = new double[n]; qlv = new double[n];
        isTurn = new bool[n]; isAcc = new bool[n]; ct = new double[n][]; cx = new double[n][]; cy = new double[n][]; ca = new int[n][]; ml = new int[n][];
        done = new bool[n]; mark = new double[n];
        foreach (var t in m.Tasks)
        {
            int i = t.Id;
            Pre[i] = t.Pre.Where(p => active[p]).OrderBy(p => p).ToArray(); Any[i] = t.PreAny.Where(p => active[p]).OrderBy(p => p).ToArray();
            Tight[i] = t.Tight >= 0 && active[t.Tight] ? t.Tight : -1;
            xp[i] = t.Xp; secs[i] = t.Secs; late[i] = (t.Q?.Level ?? Game.MaxLevel) + Tuning.LateFree;
            isTurn[i] = t.Kind == TaskKind.TurnIn; isAcc[i] = t.Kind is TaskKind.Accept or TaskKind.ItemAccept;
            qlv[i] = isAcc[i] && t.Q is { Level: > 0 } ql ? ql.Level : 0;
            safe[i] = isAcc[i] && t.MinLevel > 1 ? Tuning.Safety : 0;
            int k = t.Cands.Count; ct[i] = new double[k]; cx[i] = new double[k]; cy[i] = new double[k]; ca[i] = new int[k]; ml[i] = new int[k];
            for (int c = 0; c < k; c++)
            {
                var cd = t.Cands[c]; cx[i][c] = cd.Pos.X; cy[i][c] = cd.Pos.Y; ca[i][c] = cd.Area;
                if (t.Obj is { Kind: "kill" or "loot" } o)
                {
                    if (o.Kills > 1) ct[i][c] = Tuning.Thin * Math.Max(0, o.Kills - cd.Size) / Math.Max(cd.Size, 1);
                    ml[i][c] = Math.Max(Math.Max(1, o.MinLevel), (int)Math.Floor(cd.MobLevel ?? o.MobLevel ?? t.Q!.Level) - (int)Tuning.MobMargin);
                }
                else ml[i][c] = t.Obj != null ? Math.Max(t.MinLevel, t.Obj.MinLevel) : t.MinLevel;
            }
        }
        var succ = new List<int>[n];
        for (int i = 0; i < n; i++) succ[i] = new List<int>();
        foreach (var t in m.Tasks) if (active[t.Id]) foreach (int p in Pre[t.Id]) succ[p].Add(t.Id);
        Succ = succ.Select(l => l.ToArray()).ToArray();
        Hub = new int[n][]; var at = new List<int>[m.HubCount];
        for (int h = 0; h < at.Length; h++) at[h] = new List<int>();
        foreach (var t in m.Tasks)
        {
            Hub[t.Id] = t.Cands.Select(c => m.HubOf.GetValueOrDefault(c, -1)).ToArray();
            if (active[t.Id] && (watch == null || watch[t.Id]) && t.Ent is { Patrol: false } && t.Kind is TaskKind.Accept or TaskKind.TurnIn or TaskKind.Home)
                foreach (int h in Hub[t.Id].Where(h => h >= 0).Distinct()) at[h].Add(t.Id);
        }
        HubTasks = at.Select(l => l.ToArray()).ToArray();
        pass = new bool[n]; preCount = new int[n]; left = new int[n]; wait = new int[n];
        foreach (var t in m.Tasks)
        {
            preCount[t.Id] = Pre[t.Id].Length;
            pass[t.Id] = active[t.Id] && (watch == null || watch[t.Id]) && isTurn[t.Id] && Pre[t.Id].Length > 0 && t.Ent is { Patrol: false };
        }
        home = m.Home != null && active[m.Home.Id] ? m.Home.Id : -1;
        if (m.Home != null) { var c = m.Home.Cands[0]; bx = c.Pos.X; by = c.Pos.Y; barea = c.Area; }
    }

    public int Need(int task, int choice) => ml[task][choice];

    public double Cost(int[] seq, int len, int[] ch) => Run(seq, len, ch, null);

    public Sim Detail(int[] seq, int len, int[] ch)
    {
        var s = new Sim { Leg = new double[len], Level = new double[len], XpBefore = new double[len], Hearth = new bool[len] };
        Run(seq, len, ch, s);
        return s;
    }

    double Run(int[] seq, int len, int[] ch, Sim? detail)
    {
        Array.Clear(done);
        double x = m.Start.X, y = m.Start.Y; int a = m.StartArea;
        double exp = m.StartXp, total = 0, pen = 0, clock = 0, lastHs = -1e9; int lvl = 1, prev = -1; bool bound = false;
        var cum = Game.Cum;
        double big = Tuning.OrderPenalty, lbig = Tuning.LevelPenalty;
        double miss = Tuning.HubMiss; int hprev = -1;
        double passMiss = Tuning.PassMiss, r2 = Tuning.PassRadius * Tuning.PassRadius, share = Tuning.PassDetour, cap = 3 * Tuning.PassRadius;
        Array.Copy(preCount, left, n); int wn = 0;
        for (int pos = 0; pos < len; pos++)
        {
            int t = seq[pos];
            int c = ch[t]; double nx = cx[t][c], ny = cy[t][c]; int na = ca[t][c];
            while (lvl < Game.MaxLevel && exp >= cum[lvl + 1]) lvl++;
            double fl = lvl + (exp - cum[lvl]) / (cum[lvl + 1] - cum[lvl]);
            // leaving a hub with something still on offer there
            int h = Hub[t][c], hfrom = hprev;
            if (hprev >= 0 && h != hprev && Tight[t] != prev)
            {
                var nb = HubTasks[hprev];
                for (int k = 0; k < nb.Length; k++)
                {
                    int u = nb[k];
                    if (done[u]) continue;
                    var up = Pre[u]; bool ready = true;
                    for (int i = 0; i < up.Length; i++) if (!done[up[i]]) { ready = false; break; }
                    if (!ready) continue;
                    var ua = Any[u];
                    if (ua.Length > 0)
                    {
                        ready = false;
                        for (int i = 0; i < ua.Length; i++) if (done[ua[i]]) { ready = true; break; }
                        if (!ready) continue;
                    }
                    if (safe[u] > 0 && fl < ml[u][0] + safe[u]) continue;
                    if (qlv[u] > fl + Tuning.PickupAhead) continue;          // a quest well above your level is not "on offer" yet
                    pen += miss; if (detail != null) detail.Misses++;
                }
            }
            hprev = h;
            var pr = Pre[t];
            for (int i = 0; i < pr.Length; i++) if (!done[pr[i]]) { pen += big; if (detail != null) detail.Broken++; }
            var an = Any[t];
            if (an.Length > 0)
            {
                bool ok = false;
                for (int i = 0; i < an.Length; i++) if (done[an[i]]) { ok = true; break; }
                if (!ok) { pen += big; if (detail != null) detail.Broken++; }
            }
            if (Tight[t] >= 0 && prev != Tight[t]) pen += big * 0.3;
            double d = na == a ? Math.Sqrt((nx - x) * (nx - x) + (ny - y) * (ny - y)) : travel.Dist(a, x, y, na, nx, ny);
            bool hs = false;
            if (bound && d > Tuning.HearthMinLeg && na == barea && clock - lastHs >= Tuning.HearthCooldown)
            {
                double db = Math.Sqrt((nx - bx) * (nx - bx) + (ny - by) * (ny - by));
                if (db <= Tuning.HearthRadius) { d = Tuning.HearthCost + db; lastHs = clock; hs = true; }
            }
            // running past a finished quest's hand-in on the way somewhere else
            if (wn > 0 && passMiss > 0 && !hs && na == a && Tight[t] != prev)
            {
                double dx = nx - x, dy = ny - y, l2 = dx * dx + dy * dy;
                for (int k = 0; k < wn; k++)
                {
                    int u = wait[k];
                    if (u == t || done[u]) continue;
                    int cu = ch[u]; if (ca[u][cu] != a) continue;
                    int hu = Hub[u][cu];
                    if (hu >= 0 && (hu == hfrom || hu == h)) continue;          // the hub rule covers leaving or arriving there
                    double px = cx[u][cu], py = cy[u][cu];
                    if ((px - nx) * (px - nx) + (py - ny) * (py - ny) <= r2) continue;   // heading there anyway
                    double f = l2 > 0 ? Math.Clamp(((px - x) * dx + (py - y) * dy) / l2, 0, 1) : 0;
                    double ex = x + f * dx - px, ey = y + f * dy - py;
                    bool by = ex * ex + ey * ey <= r2;
                    if (!by && share > 0 && d > 0)
                    {
                        double via = Math.Sqrt((px - x) * (px - x) + (py - y) * (py - y)) + Math.Sqrt((px - nx) * (px - nx) + (py - ny) * (py - ny));
                        by = via - d <= Math.Min(share * d, cap);   // only a short way off a long leg
                    }
                    if (by) { pen += passMiss; if (detail != null) detail.Passes++; }
                }
            }
            total += d;
            int need = ml[t][c];
            if (need > 1 && need + safe[t] > fl)
            {
                pen += (need > lvl ? lbig : lbig * 0.5) * (need + safe[t] - fl);
                if (detail != null && need > lvl) detail.LevelShort = Math.Max(detail.LevelShort, need - fl);
            }
            if (fl > late[t]) pen += Tuning.LateCost * (fl - late[t]);
            pen += ct[t][c];
            if (isAcc[t])
            {
                pen += Tuning.Pickup * total;
                if (qlv[t] > fl + Tuning.PickupAhead) pen += Tuning.AheadCost * (qlv[t] - fl - Tuning.PickupAhead);   // picked up long before you can do it
            }
            if (isTurn[t])
            {
                double rd = 0, picked = -1;
                for (int i = 0; i < pr.Length; i++)
                {
                    int p = pr[i]; if (!done[p]) continue;
                    if (mark[p] > rd) rd = mark[p];
                    if (isAcc[p]) picked = mark[p];
                }
                pen += Tuning.Hold * (total - rd);
                if (picked >= 0 && rd > picked) pen += Tuning.Open * (rd - picked);      // carried from pickup until its objectives are done
            }
            mark[t] = total;
            if (detail != null) { detail.Leg[pos] = d; detail.Level[pos] = fl; detail.XpBefore[pos] = exp; detail.Hearth[pos] = hs; }
            clock += d / Tuning.RunSpeed + secs[t];
            exp += xp[t]; done[t] = true; prev = t; x = nx; y = ny; a = na;
            // hand-ins whose quest is now finished join the waiting list; ones handed in drop out
            var sc = Succ[t];
            for (int i = 0; i < sc.Length; i++) { int s = sc[i]; if (--left[s] == 0 && pass[s] && !done[s]) wait[wn++] = s; }
            if (isTurn[t]) for (int k = 0; k < wn; k++) if (wait[k] == t) { wait[k] = wait[--wn]; break; }
            if (t == home) bound = true;
        }
        if (detail != null) { detail.Travel = total; detail.Penalty = pen; detail.EndXp = exp; }
        return total + pen;
    }
}

public sealed class ViewStat
{
    public string Name = ""; public bool Cond; public int Tasks, Broken; public double Travel, Penalty, EndLevel, StartCost, LevelShort; public int Hearths, HubMisses, Passes;
}

public sealed class RouteResult
{
    public List<int> Seq = new();                 // every task, in guide order
    public int[] Choice = Array.Empty<int>();     // which candidate place each task uses
    public double[] Level = Array.Empty<double>(), XpBefore = Array.Empty<double>();
    public bool[] Hearth = Array.Empty<bool>();
    public List<ViewStat> Views = new();
    public bool Locked; public int LockKept, LockAdded, LockMoved, LockDropped;   // when a saved order was followed
    public List<string> Unplaced = new();
}

/// <summary>
/// Orders the tasks. The steps everyone shares are optimised first (greedy start, simulated annealing,
/// local polish, then a sweep that makes every stop pick up and hand in everything on offer there).
/// Class- and race-only steps, and steps that depend on quests from other zones, are then slotted into
/// that fixed order where they cost least.
/// </summary>
public sealed class Router
{
    readonly ZoneModel m; readonly int n; readonly Action<string> log;
    static readonly bool Debug = Environment.GetEnvironmentVariable("ROUTEBUILDER_DEBUG") == "1";
    readonly Dictionary<string, (int Index, LockedStep Step)>? saved; readonly string[] keys;
    int kept, added, moved;

    /// <param name="locked">The step order of an earlier build of this part, to keep; null plans from scratch.</param>
    public Router(ZoneModel model, Action<string> log, List<LockedStep>? locked = null)
    {
        m = model; n = m.Tasks.Count; this.log = log; keys = RouteLock.Keys(m);
        if (locked != null)
        {
            saved = new();
            for (int i = 0; i < locked.Count; i++) saved.TryAdd(locked[i].Key, (i, locked[i]));
        }
    }

    public RouteResult Solve()
    {
        var res = new RouteResult { Choice = new int[n], Level = new double[n], XpBefore = new double[n], Hearth = new bool[n] };
        var live = m.Tasks.Where(t => !t.Deferred).ToList();
        // quests most characters can do (say, everyone but warlocks) are planned with the shared route, not slotted in afterwards
        int all = BitOperations.PopCount(m.AllElig);
        ulong LayerOf(RouteTask t) => BitOperations.PopCount(t.Elig) * 2 >= all ? m.AllElig : t.Elig;
        var layers = live.GroupBy(t => (t.Cond, Elig: LayerOf(t))).OrderBy(g => g.Key.Cond).ThenByDescending(g => BitOperations.PopCount(g.Key.Elig)).ThenBy(g => g.Key.Elig).ToList();
        var master = new List<int>(); bool firmPlaced = false;
        foreach (var layer in layers)
        {
            var (cond, elig) = layer.Key;
            if (cond && !firmPlaced) { PlaceDeferred(master, res, false); firmPlaced = true; }   // so conditional steps can follow them
            var mine = layer.Select(t => t.Id).ToList();
            var backbone = master.Where(t => (m.Tasks[t].Elig & elig) == elig && (!m.Tasks[t].Cond || cond)).ToList();
            var active = new bool[n]; var movable = new bool[n];
            foreach (int t in backbone) active[t] = true;
            foreach (int t in mine) { active[t] = true; movable[t] = true; }
            string name = (elig == m.AllElig ? "everyone" : layer.First().Tag) + (cond ? " (quests that depend on other zones)" : "");
            int[] seq; double startCost;
            if (saved != null) (seq, startCost) = Keep(backbone, mine, active, movable, res.Choice, name);
            else if (backbone.Count == 0) (seq, startCost) = Optimise(mine, active, res.Choice, name);
            else (seq, startCost) = Insert(backbone, mine, active, movable, res.Choice, name);

            var ev = new Evaluator(m, active, movable);
            var sim = ev.Detail(seq, seq.Length, res.Choice);
            for (int p = 0; p < seq.Length; p++)
                if (movable[seq[p]]) { res.Level[seq[p]] = sim.Level[p]; res.XpBefore[seq[p]] = sim.XpBefore[p]; res.Hearth[seq[p]] = sim.Hearth[p]; }
            int misses = sim.Misses;
            res.Views.Add(new ViewStat { Name = name, Cond = cond, Tasks = mine.Count, Travel = sim.Travel, Penalty = sim.Penalty, EndLevel = Game.FracLevel(sim.EndXp), Hearths = sim.Hearths, HubMisses = misses, Passes = sim.Passes, StartCost = startCost, Broken = sim.Broken, LevelShort = sim.LevelShort });
            master = Merge(master, seq, movable);
        }
        if (!firmPlaced) PlaceDeferred(master, res, false);
        PlaceDeferred(master, res, true);
        res.Seq = master;
        if (saved != null)
        {
            var now = m.Tasks.Where(t => !t.Deferred).Select(t => keys[t.Id]).ToHashSet();
            res.Locked = true; res.LockKept = kept; res.LockAdded = added; res.LockMoved = moved;
            res.LockDropped = saved.Keys.Count(k => !now.Contains(k));
        }
        return res;
    }

    // ------------------------------------------------------------------ first layer: full search
    (int[] seq, double startCost) Optimise(List<int> tasks, bool[] active, int[] choice, string name)
    {
        int count = tasks.Count;
        int iters = Tries((long)count * Tuning.IterationsPerTask, Math.Min(Tuning.MinIterations, count * 20000), Tuning.MaxIterations);
        int seeds = Tuning.Seeds > 0 ? Tuning.Seeds : Math.Clamp(Environment.ProcessorCount, 4, 8);
        var results = new (double cost, double start, int[] seq, int[] ch)[seeds];
        log($"  ordering {count} steps for {name}: {seeds} runs of {iters:N0} tries, then up to {Tuning.RefineRounds} rounds of refining the best...");
        Parallel.For(0, seeds, s =>
        {
            var ev = new Evaluator(m, active); var ch = (int[])choice.Clone();
            var seq = Greedy(ev, tasks, ch, s);
            seq = Sweep(ev, seq, ch, null, out _);
            double start = ev.Detail(seq, seq.Length, ch).Travel;
            Anneal(ev, seq, ch, iters, 1000 + s, 250, 1, null);
            double c1 = ev.Cost(seq, seq.Length, ch);
            double c2 = Polish(ev, seq, ch, null);
            seq = Settle(ev, seq, ch, null);
            if (Debug) log($"    run {s}: anneal {c1:0}, polish {c2:0}");
            results[s] = (ev.Cost(seq, seq.Length, ch), start, seq, ch);
            if (Debug) log($"    run {s}: start {start:0} -> {results[s].cost:0} (travel {ev.Detail(seq, seq.Length, ch).Travel:0})");
        });
        // refine: each run reheats from its own best; after every round the weakest run is replaced by a copy of the strongest
        double lead = results.Min(r => r.cost); int flat = 0;
        for (int round = 0; round < Tuning.RefineRounds && flat < 2; round++)
        {
            int rd = round;
            Parallel.For(0, seeds, s =>
            {
                var from = results[s];
                var ev = new Evaluator(m, active); var ch = (int[])from.ch.Clone(); var seq = (int[])from.seq.Clone();
                Anneal(ev, seq, ch, iters, 5000 + 100 * rd + s, Tuning.ReheatTemperature, 1, null);
                Polish(ev, seq, ch, null);
                seq = Settle(ev, seq, ch, null);
                double c = ev.Cost(seq, seq.Length, ch);
                if (c < results[s].cost) results[s] = (c, from.start, seq, ch);
                if (Debug) log($"    round {rd + 1} run {s}: {from.cost:0} -> {c:0} (travel {ev.Detail(seq, seq.Length, ch).Travel:0})");
            });
            double now = results.Min(r => r.cost);
            flat = now > lead * 0.999 ? flat + 1 : 0;
            lead = Math.Min(lead, now);
            if (seeds >= 3)
            {
                int worst = Array.IndexOf(results, results.MaxBy(r => r.cost)), top = Array.IndexOf(results, results.MinBy(r => r.cost));
                results[worst] = (results[top].cost, results[top].start, (int[])results[top].seq.Clone(), (int[])results[top].ch.Clone());
            }
        }
        var best = results.MinBy(r => r.cost);
        Array.Copy(best.ch, choice, n);
        return (best.seq, best.start);
    }

    /// <summary>A try count kept between two limits. The upper limit wins if settings put them the wrong way round.</summary>
    static int Tries(long wanted, long atLeast, long atMost) => (int)Math.Max(0, Math.Min(Math.Max(wanted, atLeast), atMost));

    /// <summary>Nearest-available-task ordering. Seeds after the first add a little noise so runs start differently.</summary>
    int[] Greedy(Evaluator ev, List<int> tasks, int[] ch, int seed)
    {
        var rnd = new Random(seed); var done = new bool[n]; var left = tasks.ToList(); var seq = new List<int>();
        double x = m.Start.X, y = m.Start.Y; int a = m.StartArea; double xp = m.StartXp;
        while (left.Count > 0)
        {
            double lvl = Game.FracLevel(xp); double bd = double.MaxValue; int bt = -1, bc = 0;
            foreach (int id in left)
            {
                var t = m.Tasks[id];
                if (ev.Pre[id].Any(p => !done[p])) continue;
                if (ev.Any[id].Length > 0 && !ev.Any[id].Any(p => done[p])) continue;
                for (int ci = 0; ci < t.Cands.Count; ci++)
                {
                    var c = t.Cands[ci];
                    double d = m.Travel.Dist(a, x, y, c.Area, c.Pos.X, c.Pos.Y) + (c.Area == a ? 0 : 350) + Math.Max(0, ev.Need(id, ci) - lvl) * 4000
                             + (t.Kind is TaskKind.Accept or TaskKind.ItemAccept && t.Q is { Level: > 0 } gq ? Math.Max(0, gq.Level - lvl - Tuning.PickupAhead) * Tuning.AheadCost : 0);
                    if (seed > 0) d *= 1 + 0.25 * rnd.NextDouble();
                    if (d < bd) { bd = d; bt = id; bc = ci; }
                }
            }
            if (bt < 0) { seq.AddRange(left); break; }             // a dependency loop in the data; the search will sort it out
            var tk = m.Tasks[bt]; seq.Add(bt); left.Remove(bt); ch[bt] = bc; done[bt] = true; xp += tk.Xp;
            x = tk.Cands[bc].Pos.X; y = tk.Cands[bc].Pos.Y; a = tk.Cands[bc].Area;
        }
        return seq.ToArray();
    }

    /// <summary>If the search left anything behind at a hub, force it with a sweep and tidy up again.</summary>
    int[] Settle(Evaluator ev, int[] seq, int[] ch, bool[]? movable)
    {
        for (int round = 0; round < 3 && ev.Detail(seq, seq.Length, ch).Misses > 0; round++)
        {
            seq = Sweep(ev, seq, ch, movable, out _);
            Polish(ev, seq, ch, movable);
        }
        return seq;
    }

    static void MoveBlock(int[] a, int i, int j, int len, int[] tmp)
    {
        if (i == j) return;
        Array.Copy(a, i, tmp, 0, len);
        if (j > i) Array.Copy(a, i + len, a, i, j - i); else Array.Copy(a, j, a, j + len, i - j);
        Array.Copy(tmp, 0, a, j, len);
    }

    /// <summary>
    /// Simulated annealing over the order and the choice of place for each task. Moves are only proposed
    /// where they keep every task after the tasks it depends on, so no tries are wasted on impossible orders.
    /// </summary>
    void Anneal(Evaluator ev, int[] seq, int[] ch, int iters, int seed, double t0, double t1, bool[]? movable)
    {
        var rnd = new Random(seed); int len = seq.Length;
        if (len < 4) return;
        var multi = seq.Where(t => m.Tasks[t].Cands.Count > 1 && (movable == null || movable[t])).ToArray();
        var tmp = new int[Math.Max(64, len)]; var pos = new int[n];
        for (int k = 0; k < len; k++) pos[seq[k]] = k;
        double cur = ev.Cost(seq, len, ch), best = cur; var bseq = (int[])seq.Clone(); var bch = (int[])ch.Clone();
        double ratio = Math.Log(t1 / t0);
        for (int it = 0; it < iters; it++)
        {
            double temp = t0 * Math.Exp(ratio * it / iters);
            double r = rnd.NextDouble(); int kind, i = 0, j = 0, L = 1, old = 0, tk = 0;
            if (r < 0.82 || multi.Length == 0)
            {
                // move one task or a short run of tasks
                L = r < 0.48 ? 1 : r < 0.78 ? rnd.Next(2, 7) : rnd.Next(7, 41);      // one task, a short run, or a whole stretch of the route
                if (L >= len) continue;
                i = rnd.Next(len - L + 1);
                if (movable != null)
                {
                    int tries = 0;
                    while (!movable[seq[i]] && ++tries < 50) i = rnd.Next(len - L + 1);
                    if (!movable[seq[i]]) continue;
                    int run = 1;
                    while (run < L && movable[seq[i + run]]) run++;
                    L = run;
                }
                // the slots this run can go to without overtaking anything it depends on, or being overtaken by anything that depends on it
                int lo = 0, hi = len - L;
                for (int k = i; k < i + L; k++)
                {
                    int t = seq[k];
                    foreach (int p in ev.Pre[t]) { int pp = pos[p]; if (pp >= i && pp < i + L) continue; int q = (pp < i ? pp : pp - L) + 1; if (q > lo) lo = q; }
                    foreach (int sx in ev.Succ[t]) { int sp = pos[sx]; if (sp >= i && sp < i + L) continue; int q = sp < i ? sp : sp - L; if (q < hi) hi = q; }
                }
                if (hi <= lo && lo == i || hi < lo) continue;
                j = lo + rnd.Next(hi - lo + 1);
                if (j == i) continue;
                MoveBlock(seq, i, j, L, tmp); kind = 0;
            }
            else if (r < 0.87 && movable == null)
            {
                L = rnd.Next(2, 6); if (L >= len) continue;
                i = rnd.Next(len - L); Array.Reverse(seq, i, L); kind = 1;
            }
            else { tk = multi[rnd.Next(multi.Length)]; old = ch[tk]; ch[tk] = rnd.Next(m.Tasks[tk].Cands.Count); if (ch[tk] == old) continue; kind = 2; }

            double now = ev.Cost(seq, len, ch);
            if (now <= cur || rnd.NextDouble() < Math.Exp((cur - now) / temp))
            {
                cur = now;
                if (kind == 0) { int a = Math.Min(i, j), b = Math.Max(i, j) + L; for (int k = a; k < b; k++) pos[seq[k]] = k; }
                else if (kind == 1) for (int k = i; k < i + L; k++) pos[seq[k]] = k;
                if (cur < best) { best = cur; Array.Copy(seq, bseq, len); Array.Copy(ch, bch, ch.Length); }
            }
            else if (kind == 0) MoveBlock(seq, j, i, L, tmp);
            else if (kind == 1) Array.Reverse(seq, i, L);
            else ch[tk] = old;
        }
        Array.Copy(bseq, seq, len); Array.Copy(bch, ch, ch.Length);
    }

    /// <summary>Keeps taking any single move, short block move or change of place that makes the route cheaper.</summary>
    double Polish(Evaluator ev, int[] seq, int[] ch, bool[]? movable)
    {
        int len = seq.Length, window = Tuning.PolishWindow; var tmp = new int[8]; var trial = new int[len];
        double cur = ev.Cost(seq, len, ch); bool improved = true; int rounds = 0;
        while (improved && rounds++ < 40)
        {
            improved = false;
            for (int L = 1; L <= 4; L++)
                for (int i = 0; i + L <= len; i++)
                {
                    if (movable != null) { bool ok = true; for (int k = 0; k < L; k++) ok &= movable[seq[i + k]]; if (!ok) continue; }
                    int bestJ = -1; int lo = Math.Max(0, i - window), hi = Math.Min(len - L, i + window);
                    for (int j = lo; j <= hi; j++)
                    {
                        if (j == i) continue;
                        Array.Copy(seq, trial, len); MoveBlock(trial, i, j, L, tmp);
                        double v = ev.Cost(trial, len, ch);
                        if (v < cur - 1e-6) { cur = v; bestJ = j; }
                    }
                    if (bestJ >= 0) { MoveBlock(seq, i, bestJ, L, tmp); improved = true; }
                }
            foreach (int t in seq)
            {
                int k = m.Tasks[t].Cands.Count;
                if (k < 2 || (movable != null && !movable[t])) continue;
                int keep = ch[t];
                for (int c = 0; c < k; c++)
                {
                    ch[t] = c; double v = ev.Cost(seq, len, ch);
                    if (v < cur - 1e-6) { cur = v; keep = c; improved = true; }
                }
                ch[t] = keep;
            }
        }
        return cur;
    }

    /// <summary>
    /// Makes every stop "hub-complete": whenever the player is at a hub, anything that can be picked up or
    /// handed in there is pulled forward to that visit, nearest first.
    /// </summary>
    int[] Sweep(Evaluator ev, int[] seq, int[] ch, bool[]? movable, out int pulled)
    {
        var remaining = seq.ToList(); var left = new bool[n]; var o = new List<int>(seq.Length); var done = new bool[n];
        foreach (int t in seq) left[t] = true;
        double x = m.Start.X, y = m.Start.Y; double xp = m.StartXp;
        var followers = new Dictionary<int, List<int>>();
        foreach (int t in seq) if (ev.Tight[t] >= 0) { if (!followers.TryGetValue(ev.Tight[t], out var l)) followers[ev.Tight[t]] = l = new(); l.Add(t); }
        void Do(int t) { var c = m.Tasks[t].Cands[ch[t]]; x = c.Pos.X; y = c.Pos.Y; xp += m.Tasks[t].Xp; done[t] = true; left[t] = false; o.Add(t); }
        pulled = 0;
        while (remaining.Count > 0)
        {
            int head = remaining[0]; remaining.RemoveAt(0); Do(head);
            int h = ev.Hub[head][ch[head]];
            while (h >= 0)
            {
                if (remaining.Count > 0 && ev.Tight[remaining[0]] == o[^1]) break;      // an escort starts right after its pickup
                double lvl = Game.FracLevel(xp); double bd = double.MaxValue; int bu = -1, bc = 0;
                foreach (int u in ev.HubTasks[h])
                {
                    if (!left[u] || (movable != null && !movable[u])) continue;
                    var t = m.Tasks[u];
                    if (ev.Pre[u].Any(p => !done[p])) continue;
                    if (ev.Any[u].Length > 0 && !ev.Any[u].Any(p => done[p])) continue;
                    if (t.Kind == TaskKind.Accept && t.MinLevel > 1 && lvl < t.MinLevel + Tuning.Safety) continue;
                    if (t.Kind == TaskKind.Accept && t.Q is { Level: > 0 } tq && tq.Level > lvl + Tuning.PickupAhead) continue;
                    for (int ci = 0; ci < t.Cands.Count; ci++)
                    {
                        if (ev.Hub[u][ci] != h) continue;
                        double d = t.Cands[ci].Pos.To(new Pt(x, y));
                        if (d < bd) { bd = d; bu = u; bc = ci; }
                    }
                }
                if (bu < 0) break;
                if (remaining[0] != bu) pulled++;
                remaining.Remove(bu); ch[bu] = bc; Do(bu);
                if (followers.TryGetValue(bu, out var fl)) foreach (int f in fl) if (remaining.Remove(f)) Do(f);
            }
        }
        return o.ToArray();
    }

    // ------------------------------------------------------------------ later layers: slot into a fixed order
    (int[] seq, double startCost) Insert(List<int> backbone, List<int> mine, bool[] active, bool[] movable, int[] choice, string name)
    {
        log($"  slotting in {mine.Count} steps for {name}...");
        var ev = new Evaluator(m, active, movable);
        var seq = backbone.ToList();
        Slot(ev, seq, mine, choice);
        var arr = seq.ToArray();
        double start = ev.Cost(arr, arr.Length, choice);
        int iters = Tries((long)mine.Count * Tuning.IterationsPerTask / 2, Tuning.MinIterations / 10, Tuning.MaxIterations / 4);
        Anneal(ev, arr, choice, iters, 77, 60, 1, movable);
        Polish(ev, arr, choice, movable);
        arr = Settle(ev, arr, choice, movable);
        return (arr, start);
    }

    /// <summary>Inserts tasks into an order in dependency order, each where it adds least.</summary>
    void Slot(Evaluator ev, List<int> seq, List<int> tasks, int[] choice)
    {
        var placed = new bool[n];
        foreach (int t in seq) placed[t] = true;
        var todo = tasks.OrderBy(t => m.Tasks[t].Q?.Level ?? 0).ThenBy(t => m.Tasks[t].Q?.Id ?? 0).ThenBy(t => t).ToList();
        var buf = new int[seq.Count + tasks.Count];
        while (todo.Count > 0)
        {
            int pick = todo.FirstOrDefault(t => ev.Pre[t].All(p => placed[p]) && (ev.Any[t].Length == 0 || ev.Any[t].Any(p => placed[p])), -1);
            if (pick < 0) pick = todo[0];
            todo.Remove(pick);
            double best = double.MaxValue; int bi = 0, bc = 0; int len = seq.Count + 1;
            for (int c = 0; c < m.Tasks[pick].Cands.Count; c++)
            {
                choice[pick] = c;
                for (int i = 0; i <= seq.Count; i++)
                {
                    seq.CopyTo(0, buf, 0, i); buf[i] = pick; seq.CopyTo(i, buf, i + 1, seq.Count - i);
                    double v = ev.Cost(buf, len, choice);
                    if (v < best) { best = v; bi = i; bc = c; }
                }
            }
            choice[pick] = bc; seq.Insert(bi, pick); placed[pick] = true;
        }
    }

    // ------------------------------------------------------------------ keeping a saved order
    /// <summary>
    /// Follows the order of an earlier build. Steps it does not have (new quests, new objectives) and steps whose
    /// prerequisites now come later or are new are taken out and slotted in where they cost least; only those are
    /// then fine-tuned. Everything else keeps its place and its spot.
    /// </summary>
    (int[] seq, double startCost) Keep(List<int> backbone, List<int> mine, bool[] active, bool[] movable, int[] choice, string name)
    {
        var ev = new Evaluator(m, active, backbone.Count == 0 ? null : movable);
        var at = new Dictionary<int, int>();
        foreach (int t in backbone.Concat(mine))
            if (saved!.TryGetValue(keys[t], out var e)) at[t] = e.Index;
        foreach (int t in mine)
        {
            if (!at.ContainsKey(t)) continue;
            var st = saved![keys[t]].Step; var cs = m.Tasks[t].Cands; double bd = double.MaxValue;
            for (int c = 0; c < cs.Count && st.Map >= 0; c++)
            {
                var (map, p) = RouteLock.Spot(m, cs[c]);
                if (map != st.Map) continue;
                // read from a guide: the patch holding most of the step's waypoints, then the one nearest to them
                double d = st.Distance(p);
                if (st.Loop.Count > 1)
                {
                    var own = cs[c].Pts.Select(q => RouteLock.Spot(m, new Cand(cs[c].Area, new List<Pt> { q })).p).ToList();
                    d = -1000 * st.Loop.Count(l => own.Any(q => q.To(l) <= 2)) + d;
                }
                if (d < bd) { bd = d; choice[t] = c; }
            }
        }
        var loose = new bool[n];
        foreach (int t in mine) if (!at.ContainsKey(t)) loose[t] = true;
        int fresh = mine.Count(t => loose[t]);

        // the saved steps of this layer, woven into the steps already fixed, by their saved position
        var known = mine.Where(at.ContainsKey).OrderBy(t => at[t]).ToList();
        var woven = new List<int>(); int k = 0;
        foreach (int b in backbone)
        {
            if (at.TryGetValue(b, out int bi)) while (k < known.Count && at[known[k]] < bi) woven.Add(known[k++]);
            woven.Add(b);
        }
        while (k < known.Count) woven.Add(known[k++]);

        // a step whose prerequisites are not all ahead of it any more is taken out, and so is anything that follows from it
        var placed = new bool[n]; var seq = new List<int>(woven.Count + fresh);
        foreach (int t in woven)
        {
            bool ok = ev.Pre[t].All(p => placed[p]) && (ev.Any[t].Length == 0 || ev.Any[t].Any(p => placed[p]));
            if (ok || !movable[t]) { seq.Add(t); placed[t] = true; }
            else loose[t] = true;
        }
        int shifted = mine.Count(t => loose[t]) - fresh;
        var todo = mine.Where(t => loose[t]).ToList();
        log($"  keeping the saved order for {name}: {known.Count - shifted} steps kept, {fresh} new, {shifted} moved for changed prerequisites");
        kept += known.Count - shifted; added += fresh; moved += shifted;

        Slot(ev, seq, todo, choice);
        var arr = seq.ToArray();
        double start = ev.Cost(arr, arr.Length, choice);
        if (todo.Count > 0)
        {
            int iters = Tries((long)todo.Count * Tuning.IterationsPerTask / 2, Tuning.MinIterations / 10, Tuning.MaxIterations / 4);
            Anneal(ev, arr, choice, iters, 91, 60, 1, loose);
            Polish(ev, arr, choice, loose);
            arr = Settle(ev, arr, choice, loose);
        }
        return (arr, start);
    }

    /// <summary>Writes a layer's tasks back into the full order, each just ahead of the shared step that follows it.</summary>
    static List<int> Merge(List<int> master, int[] view, bool[] movable)
    {
        if (master.Count == 0) return view.ToList();
        var o = new List<int>(master.Count + view.Length); int p = 0;
        var inView = new HashSet<int>(view);
        foreach (int t in master)
        {
            if (!inView.Contains(t)) { o.Add(t); continue; }
            while (p < view.Length && view[p] != t) { if (movable[view[p]]) o.Add(view[p]); p++; }
            o.Add(t); p++;
        }
        for (; p < view.Length; p++) if (movable[view[p]]) o.Add(view[p]);
        return o;
    }

    /// <summary>
    /// Hand-ins that cannot be planned (the quest finishes outside this zone, or its objectives are unknown)
    /// go on the last visit to their NPC, where the player has had the most time to finish them.
    /// </summary>
    void PlaceDeferred(List<int> master, RouteResult res, bool cond)
    {
        foreach (var t in m.Tasks.Where(t => t.Deferred && t.Cond == cond))
        {
            int at = -1, pick = 0;
            for (int i = master.Count - 1; i >= 0 && at < 0; i--)
            {
                var o = m.Tasks[master[i]];
                if ((o.Elig & t.Elig) != t.Elig || o.Cond && !t.Cond) continue;
                var oc = o.Cands[res.Choice[o.Id]];
                for (int c = 0; c < t.Cands.Count; c++)
                    if (t.Cands[c].Area == oc.Area && t.Cands[c].Pos.To(oc.Pos) <= Tuning.HubRadius) { at = i; pick = c; break; }
            }
            int accept = m.Find(TaskKind.Accept, t.Q!.Id) is { } a ? master.IndexOf(a.Id) : -1;
            if (at < accept) at = -1;
            res.Choice[t.Id] = pick;
            if (at < 0) { at = master.Count - 1; res.Unplaced.Add(t.Q.Name); }
            res.Level[t.Id] = at >= 0 ? res.Level[master[at]] : m.StartLevel; res.XpBefore[t.Id] = at >= 0 ? res.XpBefore[master[at]] : m.StartXp;
            master.Insert(at + 1, t.Id);
        }
    }
}
