namespace RouteBuilder;

/// <summary>A point in world yards (the game's continent coordinates).</summary>
public readonly record struct Pt(double X, double Y)
{
    public double To(Pt o) => Math.Sqrt((X - o.X) * (X - o.X) + (Y - o.Y) * (Y - o.Y));
}

/// <summary>Small geometry helpers for turning spawn points into places to stand.</summary>
public static class Geo
{
    /// <summary>Single-linkage clusters, largest first.</summary>
    public static List<List<Pt>> Cluster(IReadOnlyList<Pt> pts, double eps)
    {
        int n = pts.Count; var par = new int[n];
        for (int i = 0; i < n; i++) par[i] = i;
        int Find(int a) { while (par[a] != a) { par[a] = par[par[a]]; a = par[a]; } return a; }
        for (int i = 0; i < n; i++)
            for (int j = i + 1; j < n; j++)
                if (pts[i].To(pts[j]) <= eps) par[Find(i)] = Find(j);
        var groups = new Dictionary<int, List<Pt>>();
        for (int i = 0; i < n; i++)
        {
            int r = Find(i);
            if (!groups.TryGetValue(r, out var g)) groups[r] = g = new List<Pt>();
            g.Add(pts[i]);
        }
        return groups.Values.OrderByDescending(g => g.Count).ToList();
    }

    /// <summary>The actual point nearest the centre of a set, so a pin always lands on something real.</summary>
    public static Pt Medoid(IReadOnlyList<Pt> pts)
    {
        var c = new Pt(pts.Average(p => p.X), pts.Average(p => p.Y));
        return pts.MinBy(p => p.To(c));
    }

    /// <summary>Keeps one point per grid cell.</summary>
    public static List<Pt> Thin(IEnumerable<Pt> pts, double cell)
    {
        var seen = new Dictionary<(long, long), Pt>(); var order = new List<Pt>();
        foreach (var p in pts)
        {
            var k = ((long)Math.Round(p.X / cell), (long)Math.Round(p.Y / cell));
            if (seen.TryAdd(k, p)) order.Add(p);
        }
        return order;
    }

    /// <summary>Picks k points that are spread as far from each other as possible.</summary>
    public static List<Pt> FarthestSample(IReadOnlyList<Pt> pts, int k)
    {
        if (pts.Count <= k) return pts.ToList();
        var o = new List<Pt> { Medoid(pts) };
        while (o.Count < k) o.Add(pts.MaxBy(p => o.Min(q => p.To(q))));
        return o;
    }

    /// <summary>Largest distance between any two points.</summary>
    public static double Span(IReadOnlyList<Pt> pts)
    {
        double m = 0;
        for (int i = 0; i < pts.Count; i++)
            for (int j = i + 1; j < pts.Count; j++) m = Math.Max(m, pts[i].To(pts[j]));
        return m;
    }

    public static List<List<Pt>> KMeans(List<Pt> pts, int k, int rounds = 10)
    {
        var cents = FarthestSample(pts, k); var groups = new List<List<Pt>> { pts };
        for (int r = 0; r < rounds; r++)
        {
            var g = cents.Select(_ => new List<Pt>()).ToList();
            foreach (var p in pts)
            {
                int bi = 0; double bd = double.MaxValue;
                for (int i = 0; i < cents.Count; i++) { double d = p.To(cents[i]); if (d < bd) { bd = d; bi = i; } }
                g[bi].Add(p);
            }
            groups = g.Where(x => x.Count > 0).ToList();
            cents = groups.Select(x => new Pt(x.Average(p => p.X), x.Average(p => p.Y))).ToList();
        }
        return groups;
    }

    /// <summary>Orders points as a loop starting near <paramref name="start"/> (nearest-neighbour, then 2-opt).</summary>
    public static List<Pt> Tour(List<Pt> input, Pt start)
    {
        var pts = input.ToList();
        if (pts.Count < 3) return pts.OrderBy(p => p.To(start)).ToList();
        var cur = pts.MinBy(p => p.To(start)); var order = new List<Pt> { cur }; pts.Remove(cur);
        while (pts.Count > 0) { cur = pts.MinBy(p => p.To(order[^1])); order.Add(cur); pts.Remove(cur); }
        bool improved = true;
        while (improved)
        {
            improved = false;
            for (int i = 1; i < order.Count - 1; i++)
                for (int j = i + 1; j < order.Count; j++)
                {
                    Pt a = order[i - 1], b = order[i], c = order[j], d = order[(j + 1) % order.Count];
                    if (a.To(b) + c.To(d) > a.To(c) + b.To(d) + 1e-6) { order.Reverse(i, j - i + 1); improved = true; }
                }
        }
        return order;
    }

    /// <summary>Sorts points along their long axis (for patrol paths), nearest end to <paramref name="start"/> first.</summary>
    public static List<Pt> AlongAxis(List<Pt> pts, Pt start, int maxPts)
    {
        double mx = pts.Average(p => p.X), my = pts.Average(p => p.Y);
        double sxx = pts.Sum(p => (p.X - mx) * (p.X - mx)), syy = pts.Sum(p => (p.Y - my) * (p.Y - my)), sxy = pts.Sum(p => (p.X - mx) * (p.Y - my));
        double ang = 0.5 * Math.Atan2(2 * sxy, sxx - syy), ux = Math.Cos(ang), uy = Math.Sin(ang);
        var sorted = pts.OrderBy(p => (p.X - mx) * ux + (p.Y - my) * uy).ToList();
        int k = Math.Max(1, (int)Math.Ceiling(sorted.Count / (double)maxPts));
        var wp = new List<Pt>();
        for (int i = 0; i < sorted.Count; i += k) wp.Add(sorted[i]);
        if (wp[^1] != sorted[^1]) wp.Add(sorted[^1]);
        if (wp[^1].To(start) < wp[0].To(start)) wp.Reverse();
        return wp;
    }
}
