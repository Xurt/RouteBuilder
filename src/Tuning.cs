using System.Reflection;
using System.Text.Json;

namespace RouteBuilder;

/// <summary>
/// Every number the router's judgement rests on, in one place. Distances are yards, and the
/// penalties are "yards-equivalent" so they can be weighed against walking.
/// Any of these can be overridden without recompiling by putting them in settings.json next to the exe.
/// </summary>
public static class Tuning
{
    // --- level gates ---
    public static double Margin = 2;          // non-combat objectives may be attempted this many levels below quest level
    public static double MobMargin = 1;       // kill/loot objectives need the player within this many levels of the mobs
    public static double Safety = 0.25;       // plan level-gated pickups this far past the level they unlock at
    public static double LateFree = 3;        // levels past quest level before doing it "late" starts to cost
    public static double LateCost = 220;      // cost per level of lateness
    // --- xp model ---
    public static double KillXp = 0.65;       // share of full-value kill xp earned (players are usually above what they kill)
    public static double SharedKillXp = 0.25; // a second objective on the same mobs only adds this share of kills
    public static double DeliveryXp = 0.30;   // quests with no xp on record and no objectives are assumed to pay this share
    public static double ClassQuestXp = 0.50; // class quests with no xp on record are assumed to pay this share
    // --- route shape ---
    public static double HubRadius = 90;      // anything on offer within this range of where you stand is picked up / handed in
    public static double HubMiss = 2500;      // cost of walking away from a pickup or hand-in that was within reach
<<<<<<< HEAD
    public static double Pickup = 0.02;       // cost per yard walked before a quest is picked up
    public static double Hold = 0.02;         // cost per yard of carrying a finished quest
=======
    public static double PickupAhead = 3;     // a quest more than this many levels above you is not picked up "while you are there"
    public static double AheadCost = 600;     // ...and picking it up anyway costs this much per level beyond that (0 = off)
    public static double Pickup = 0.02;       // cost per yard walked before a quest is picked up
    public static double Open = 0.15;         // cost per yard of carrying a picked-up quest before its objectives are done (pick up, do, hand in)
    public static double Hold = 0.02;         // cost per yard of carrying a finished quest
    public static double TownRadius = 250;    // quest givers this close one after another are one visit to a town: each NPC is talked to once
>>>>>>> zone/Durotar-Horde-vendor_trainer
    public static double PassMiss = 800;      // cost of running past a finished quest's hand-in without stopping (0 = off)
    public static double PassRadius = 150;    // a hand-in this close to the straight line you run along counts as passed
    public static double PassDetour = 0.2;    // ...and so does one that going via would lengthen the leg by at most this share (capped at 3 x PassRadius)
    public static double Thin = 150;          // cost of a spawn patch smaller than the kills needed (respawn waits)
    public static double MergeRadius = 140;   // objectives closer than this share one guide step
    public static double OverlapRadius = 60;  // a spot this close to an objective's spawns counts as inside its area
    public static double OverlapShare = 0.3;  // back-to-back objectives sharing this much of their area become one step
    public static int MaxAsYouGo = 3;         // at most this many "as you go" objectives on screen at once (0 = none)
    public static double ClusterEps = 75;     // spawn points closer than this belong to the same patch
    public static double ClusterSpan = 240;   // patches wider than this are split up
    public static double SpreadRange = 700;   // a step's loop may reach this far for spawns when its patch has too few (a third of it for kills)
    public static int MaxPatches = 8;         // candidate patches kept per objective
    public static double PatrolRange = 120;   // an NPC whose points span more than this is treated as patrolling
    // --- travel ---
    public static double RunSpeed = 7;        // yards per second on foot
    public static double AreaChange = 150;    // extra cost of crossing between a zone and a linked city with no gate defined
    public static double HearthCooldown = 3600;
    public static double HearthMinLeg = 550;  // only hearth for legs longer than this
    public static double HearthCost = 110;    // cost of the cast
    public static double HearthRadius = 170;  // "arriving at the inn" means within this range of the innkeeper
    // --- hard rules ---
    public static double OrderPenalty = 300000; // per broken prerequisite
    public static double LevelPenalty = 6000;  // per level short of a gate
    // --- search effort ---
    public static int IterationsPerTask = 8000;
    public static int MinIterations = 400000;
    public static int MaxIterations = 6000000;
    public static int Seeds = 0;              // parallel runs; 0 = one per processor core (at least 4, at most 8)
    public static double ReheatTemperature = 100; // how far each refining round loosens the route before tightening it again
    public static int RefineRounds = 2;       // extra rounds in which every run reheats from its own best route
    public static int PolishWindow = 70;
    // --- zone scope ---
    public static double VisitStretch = 1;         // a part may end with mobs this many levels beyond the usual limit
    public static int MaxVisits = 8;               // a zone's guide is split into at most this many parts
    public static int VisitGap = 3;                // levels the player is assumed to gain elsewhere before coming back for the next part
    public static double ZoneTopPercentile = 0.90; // the zone's "top level" ignores the highest-level stragglers
    public static int ZoneLevelSlack = 2;          // quests this far above the zone's top level are still included

    public static void Load(string path)
    {
        if (!File.Exists(path)) return;
        using var doc = JsonDocument.Parse(File.ReadAllText(path), new JsonDocumentOptions { CommentHandling = JsonCommentHandling.Skip, AllowTrailingCommas = true });
        foreach (var prop in doc.RootElement.EnumerateObject())
        {
            var f = typeof(Tuning).GetField(prop.Name, BindingFlags.Public | BindingFlags.Static | BindingFlags.IgnoreCase);
            if (f == null) { Console.WriteLine($"settings.json: unknown setting '{prop.Name}' ignored"); continue; }
            if (f.FieldType == typeof(int)) f.SetValue(null, prop.Value.GetInt32());
            else f.SetValue(null, prop.Value.GetDouble());
        }
    }

    public static IEnumerable<(string name, string value)> All() =>
        typeof(Tuning).GetFields(BindingFlags.Public | BindingFlags.Static).Select(f => (f.Name, Convert.ToString(f.GetValue(null), System.Globalization.CultureInfo.InvariantCulture)!));
}
