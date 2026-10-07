using System.Text.Json;
using System.Text.Json.Serialization;

namespace RouteBuilder;

/// <summary>
/// A point as players read it off the map: percent across and down. Written in JSON as [x, y] for the
/// zone the file is about, or [areaId, x, y] for a linked city.
/// </summary>
public sealed class Spot
{
    public int Area; public double X, Y;
}

sealed class SpotConverter : JsonConverter<Spot>
{
    public override Spot Read(ref Utf8JsonReader r, Type t, JsonSerializerOptions o)
    {
        if (r.TokenType != JsonTokenType.StartArray) throw new JsonException("a point is written as [x, y] or [areaId, x, y]");
        var v = new List<double>();
        while (r.Read() && r.TokenType != JsonTokenType.EndArray) v.Add(r.GetDouble());
        return v.Count switch
        {
            2 => new Spot { X = v[0], Y = v[1] },
            3 => new Spot { Area = (int)v[0], X = v[1], Y = v[2] },
            _ => throw new JsonException("a point is written as [x, y] or [areaId, x, y]"),
        };
    }

    public override void Write(Utf8JsonWriter w, Spot s, JsonSerializerOptions o)
    {
        w.WriteStartArray();
        if (s.Area != 0) w.WriteNumberValue(s.Area);
        w.WriteNumberValue(Math.Round(s.X, 2)); w.WriteNumberValue(Math.Round(s.Y, 2));
        w.WriteEndArray();
    }
}

/// <summary>A city (or other separate map) whose quests belong with this zone, and how you get in and out.</summary>
public sealed class LinkedAreaFix
{
    public string Area = "";          // name or area ID
    public Spot? Gate;                // where you leave the zone (a point on the zone's map)
    public Spot? Hub;                 // where you arrive (a point on the linked area's map)
    public double? Penalty;           // yards-equivalent of the trip between the two (lift, tunnel, boat...)
    public string? EnterText, LeaveText;
}

public sealed class TargetFix { public string Kind = "mob"; public string Name = ""; }
public sealed class NearFix { public Spot Point = new(); public double Radius = 200; }

/// <summary>One objective, written out by hand because the database has it missing or wrong.</summary>
public sealed class ObjectiveFix
{
    public int? Index;                 // the objective's number in the quest log (1 = first line)
    public string Kind = "kill";       // kill, loot, object, use, talk, event, buy
    public List<int> Npcs = new(), Objects = new();
    public List<Spot> Points = new();  // fixed places, when no NPC or object marks the spot
    public NearFix? Near;              // only use spawns within this radius (yards) of a point
    public string? Label, Text;        // label = the quest-log line; text = what the guide tells the player
    public List<string> ExtraLines = new();
    public List<TargetFix> Targets = new();
    public int? Count; public double? Kills, MobLevel; public int? MinLevel;
    public bool After;                 // must come after the previous objective of this quest
    public bool Patrol;                // the NPC walks a route
    public string? Command;            // a full RXP line to use instead of ".complete quest,index"
}

public sealed class TurninCompleteFix { public int Index; public string Label = ""; }

public sealed class StartItemFix
{
    public int Item; public List<int> Npcs = new(), Anchors = new();
    public bool Passive;               // a random drop picked up while doing the anchor quests
    public string? Text, Mob; public int? MinLevel;
}

/// <summary>Corrections for one quest. Everything is optional.</summary>
public sealed class QuestFix
{
    public List<int>? Pre;                         // quests that must be handed in first (added to the database's own list)
    public List<ObjectiveFix>? Objectives;         // replaces the database's objectives entirely; [] = "has none"
    public Dictionary<string, int>? ObjectiveIndex; // NPC/object/item ID -> quest-log line, when the order differs
    public List<TurninCompleteFix> TurninComplete = new();
    public List<string> TurninPreLines = new(), TurninExtraLines = new();
    public string? TurninText, AcceptText;
    public int? AcceptFlags;
    public bool Tight;                             // the first objective must directly follow the pickup (escorts)
    public bool Optional;                          // steps hide themselves if the player is not on the quest
    public bool NoTurnin;                          // pick up only
    public StartItemFix? StartItem;
    public string? Note;
    public int? Xp;
}

public sealed class ReminderFix { public string Tag = ""; public string Text = ""; public double AtLevel = 1; }

/// <summary>
/// The hand-made part of a zone: zones/&lt;Zone name&gt;.json. The router works without one; this is where
/// in-game findings go so they survive a re-run.
/// </summary>
public sealed class ZoneConfig
{
    public Spot? Start;                 // where the player is assumed to begin
    public double? StartLevel;
    public List<LinkedAreaFix>? LinkedAreas;
    public int? Innkeeper;              // NPC ID to bind at; default = the zone's inn nearest its quest givers
    public string? BindName;            // e.g. "Brill"
    public int? BindSubzone;            // area ID of the inn's subzone, lets the hearth step skip itself when already there
    public List<int> Include = new();   // quests to force in
    public Dictionary<string, string> Exclude = new();   // quest ID -> reason
    public int? MinLevel, MaxLevel;
    public Dictionary<string, QuestFix> Quests = new();
    public List<ReminderFix> Reminders = new();

    public static readonly JsonSerializerOptions Json = new()
    {
        PropertyNamingPolicy = JsonNamingPolicy.CamelCase, PropertyNameCaseInsensitive = true, IncludeFields = true,
        ReadCommentHandling = JsonCommentHandling.Skip, AllowTrailingCommas = true, WriteIndented = true,
        DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull,
        Converters = { new SpotConverter() },
    };

    public static ZoneConfig Load(string path)
    {
        try { return JsonSerializer.Deserialize<ZoneConfig>(File.ReadAllText(path), Json) ?? new ZoneConfig(); }
        catch (JsonException e) { throw new InvalidOperationException($"{path}: {e.Message}"); }
    }

    public QuestFix? Fix(int questId) => Quests.GetValueOrDefault(questId.ToString());
}
