# Zone files

A zone file holds your corrections for one zone: things QuestieDB has missing or wrong, and choices
about how the zone should be planned. RouteBuilder reads it on every build, so anything you find out
in game goes here once and stays.

The app never changes the QuestieDB folder, and `update` never touches your zone files.

## Contents

- [Where the file goes](#where-the-file-goes)
- [Writing the file](#writing-the-file)
- [Common fixes](#common-fixes)
- [Zone settings](#zone-settings)
- [Quest corrections](#quest-corrections)
- [Objectives](#objectives)
- [Quests that start from an item](#quests-that-start-from-an-item)
- [Reminders](#reminders)
- [Finding IDs and coordinates](#finding-ids-and-coordinates)
- [Checking that a fix took](#checking-that-a-fix-took)
- [What a zone file cannot do](#what-a-zone-file-cannot-do)

## Where the file goes

`zones/<Zone name>.json`, in the folder you run RouteBuilder from. The name is the zone's name exactly
as `RouteBuilder zones` prints it, for example `zones/Durotar.json` or `zones/The Barrens.json`.

- A capital city has no file of its own. Its quests belong to the zone it is planned with: Undercity
  with Tirisfal Glades, Orgrimmar with Durotar, Thunder Bluff with Mulgore, Stormwind with Elwynn
  Forest, Ironforge with Dun Morogh, Darnassus with Teldrassil.
- To use a file somewhere else, pass `--zone-file <path>`.
- If there is no file in the folder you run from, the copy next to the program is used. A file in the
  folder you run from always wins.
- When a file is picked up, the first line of the build says so: `Tirisfal Glades (Horde)  using
  zones/Tirisfal Glades.json`. If that is missing, the name or the folder is wrong.

A zone needs no file at all. Everything in it is optional, so the smallest useful file is one fix:

```json
{
  "quests": {
    "784": { "pre": [786] }
  }
}
```

## Writing the file

It is ordinary JSON with three allowances: `// comments` are fine, a trailing comma is fine, and key
names are not case-sensitive.

- **Quest IDs used as keys go in quotes** (`"784": { ... }`). IDs inside lists do not
  (`"pre": [786]`). Getting this wrong stops the build with an error naming the place.
- **A misspelt key is ignored without any warning.** `"prre": [786]` does nothing. If a fix seems to
  have no effect, check the spelling first.
- **Points** are map coordinates as the game shows them, `[x, y]`, on the zone's own map. A point in
  the linked city is written `[areaId, x, y]`, for example `[1497, 66.0, 44.1]` for Undercity.
  The city IDs are Undercity 1497, Orgrimmar 1637, Thunder Bluff 1638, Stormwind 1519, Ironforge 1537,
  Darnassus 1657.
- **Text** you supply is shown to the player as written. RestedXP's colour codes work in it, and a
  double quote inside text is written `\"`:

  - `|cRXP_FRIENDLY_Name|r` for friendly NPCs
  - `|cRXP_ENEMY_Name|r` for mobs
  - `|cRXP_LOOT_Name|r` for items
  - `|cRXP_PICK_Name|r` for things you click in the world
  - `|cRXP_WARN_some text|r` for warnings
  - `|T135920:0|t` for an icon, where the number is the icon's file ID
- **Raw RXP lines** (`extraLines`, `turninPreLines`, `turninExtraLines`, `command`) are written the
  way they appear in a guide, starting with the dot and without indentation: `".skipgossip"`,
  `".use 286176"`. Class and race tags are added for you where they are needed.
- If the file cannot be read, the build stops and prints where. Line numbers in that message count
  from 0, so "LineNumber: 11" is the twelfth line.

## Common fixes

| What you see | What to add |
|---|---|
| The guide offers a quest the NPC does not have yet | [`pre`](#quest-corrections) with the quest that unlocks it |
| The report says "No objectives in the database", or the guide never sends you to do the quest | [`objectives`](#objectives) |
| The quest really has nothing to do between pickup and hand-in | `"objectives": []` |
| The step tracks the wrong line of the quest log | `objectiveIndex`, or `index` on a hand-written objective |
| The guide sends you to the wrong group of mobs | hand-written objective with `near` or `points` |
| A quest should not be in the guide | `exclude` |
| A quest is in "Left out" and you want it | `include` (read the reason first) |
| An escort starts and the guide walks you away | `tight`, usually with `acceptFlags` |
| The hand-in needs something extra (use an item, train a skill) | `turninPreLines`, `turninText` |
| A quest starts from a dropped item | [`startItem`](#quests-that-start-from-an-item) |
| The city trip is planned as if you could walk through the wall | `linkedAreas` with `gate` and `hub` |

## Zone settings

These sit at the top level of the file.

| Key | Meaning | If left out |
|---|---|---|
| `start` | Point where the player begins. | The giver of the lowest-level quest. |
| `startLevel` | Level the player arrives at. `--start-level` overrides it. | The zone's lowest quest level. |
| `minLevel`, `maxLevel` | Quest levels to include. `--min-level` and `--max-level` override them. | No lower limit; the upper limit is the level most of the zone's quests stay under, plus two. |
| `linkedAreas` | Cities planned with this zone. See below. | The capital city that belongs to the zone, reached in a straight line. |
| `innkeeper` | NPC ID of the innkeeper to bind at. | The inn nearest the zone's quest givers. |
| `bindName` | Name used in the hearthstone steps ("Hearth to Brill"). | The innkeeper's name followed by "'s inn". |
| `bindSubzone` | Area ID of the inn's subzone. Lets the hearth step skip itself when you are already there. | The step still skips when the hearthstone is on cooldown. |
| `include` | List of quest IDs to force in. | |
| `exclude` | Quest IDs to leave out, each with a reason: `{ "441": "belongs to a Silverpine chain" }`. | |
| `quests` | Corrections per quest. See [Quest corrections](#quest-corrections). | |
| `reminders` | Notes shown at a certain level. See [Reminders](#reminders). | |

Hearthstone steps are only planned for a part of the guide with at least 25 things to do.

### include and exclude

`include` gets a quest past the automatic filters (repeatable, world event, profession, reputation,
dungeon, outside the level range) and past the rule that puts off quests the zone does not get you
high enough for. It cannot bring in a quest that neither starts nor ends in the zone, a quest for the
other faction, or, when building for one character, a quest that character cannot take.

`exclude` wins over `include`. The reason you give is printed in the report's "Left out" section.

### linkedAreas

```json
"linkedAreas": [
  {
    "area": "Undercity",
    "gate": [61.92, 64.85],
    "hub": [66.0, 44.05],
    "penalty": 250,
    "enterText": "Go into the Ruins of Lordaeron and take a lift down into the Undercity",
    "leaveText": "Take a lift back up and leave the Undercity"
  }
]
```

| Key | Meaning |
|---|---|
| `area` | Name or area ID of the city. |
| `gate` | Where you leave the zone, as a point on the **zone's** map. |
| `hub` | Where you arrive, as a point on the **city's** map (plain `[x, y]`). |
| `penalty` | What the trip between the two is worth in yards of running (a lift, a tunnel). 150 if left out. |
| `enterText`, `leaveText` | The wording of the travel steps. |

`gate` and `hub` only work as a pair. Without them, distance into the city is measured in a straight
line plus 150 yards, which is fine for a city you walk into and wrong for one you reach by lift.

Writing `linkedAreas` replaces the built-in pairing, so `"linkedAreas": []` plans the zone without its
city.

## Quest corrections

Under `quests`, one entry per quest ID.

```json
"quests": {
  "98601": { "pre": [364] },
  "99156": { "pre": [356], "note": "|cRXP_WARN_Riptear is level 13|r" }
}
```

| Key | Meaning |
|---|---|
| `pre` | Quests that must be handed in first. Added to whatever the database already lists; all of them are required. |
| `objectives` | Replaces the database's objectives for this quest. `[]` means "nothing to do". See [Objectives](#objectives). |
| `objectiveIndex` | Corrects which quest-log line each database objective is. See below. |
| `acceptText` | Extra line of text on the pickup step. |
| `acceptFlags` | Passed to RestedXP as `.accept quest,<flags>`. `1` stops it accepting the quest automatically, which is what you want for an escort. |
| `tight` | The quest's first objective must come directly after the pickup, with nothing in between. For escorts and anything else that starts the moment you accept. |
| `turninText` | Extra line of text on the hand-in step. |
| `turninPreLines` | Raw RXP lines placed before the hand-in line, e.g. `".use 6866"` or `".train 2550 >>Train Cooking"`. |
| `turninExtraLines` | Raw RXP lines placed at the end of the hand-in step. |
| `turninComplete` | Objectives that finish by talking to the hand-in NPC: `[ { "index": 1, "label": "Report to Shari Stilwell in Brill" } ]`. Adds a `.complete` line to the hand-in step. |
| `optional` | The hand-in step only shows if you are on the quest, and its experience is not counted. For quests you may not manage, such as one behind an elite. |
| `noTurnin` | Pick the quest up but do not plan its hand-in. It is listed at the end of the guide with the quests that lead elsewhere. |
| `startItem` | The quest starts from an item. See [Quests that start from an item](#quests-that-start-from-an-item). |
| `note` | Line of text added to each of the quest's objective steps. |
| `xp` | Experience the hand-in gives, for the level estimate. Worth setting for a new quest once you have seen the real number. |

### How pre is used

- If the prerequisite is handed in by the same guide, the quest is simply ordered after that hand-in.
- If it is not (it belongs to another zone, was left out, or is itself uncertain), the quest's pickup
  step only shows once the prerequisite is done, and its other steps only show while you are on it.
  The report lists these under "Need a quest this guide does not hand in".

### objectiveIndex

The database lists a quest's objectives in its own order: mobs, then objects, then items. Usually that
is also the order in the quest log. When it is not, the guide ticks off the wrong line.
`objectiveIndex` says which line each one really is, keyed by the NPC, object or item ID the database
uses for that objective:

```json
"97558": { "objectiveIndex": { "278242": 1, "278243": 2, "278244": 3 } }
```

Objectives you do not mention keep counting on from the one before them. Building with `--rxp` (see
the README) compares these numbers with RestedXP's own guides and reports the ones that disagree.

## Objectives

`objectives` is a list, one entry per thing the player has to do, in the order they should appear
when order matters. It replaces everything the database has for that quest, so write all of them.

```json
"90902": {
  "pre": [98601],
  "objectives": [
    {
      "index": 1,
      "kind": "use",
      "npcs": [259377],
      "label": "Injured Deathguard healed (5)",
      "text": "Cast |T135920:0|t[Holy Light] on |cRXP_FRIENDLY_Injured Deathguards|r around Deathknell",
      "targets": [ { "kind": "target", "name": "Injured Deathguard" } ],
      "kills": 0
    }
  ]
}
```

### What it is

| Key | Meaning |
|---|---|
| `index` | Which line of the quest log this is (1 = the first). The step is written as `.complete quest,index`, so RestedXP ticks it off by itself. |
| `kind` | `kill`, `loot`, `object`, `use`, `talk`, `event` or `buy`. See the table below. `kill` if left out. |
| `label` | The quest-log line, e.g. `"Dark Neophyte slain (8)"`. Shown in the report and kept as a comment in the guide. The number the player sees comes from here. |
| `text` | What the guide tells the player. Always worth writing. Without it, `kill` says "Kill" plus the `mob` targets, `loot` says to kill them and loot the label, `object` says "Click the" plus the first object's name, and the other kinds just show the label. |
| `targets` | Names to mark: `{ "kind": "mob", "name": "Dark Neophyte" }`. `kind` is `mob` for enemies, `target` for friendly NPCs, `unitscan` for an NPC that wanders. |
| `extraLines` | Raw RXP lines added to the step: `".skipgossip"`, `".use 286176"`, a second `.complete` line. |
| `command` | A raw RXP line used **instead of** `.complete quest,index`. For a step that is not a quest-log line, such as collecting an item you need before the real objective: `".collect 3080,1,409,1 --Candle of Beckoning (1)"`. |

Give each objective an `index` or a `command`. With neither, the step has nothing to tick it off.

| `kind` | Use it for | Effect on planning |
|---|---|---|
| `kill` | Killing mobs. | Held back until you are within a level of the mobs. Shares a step with other objectives close by. |
| `loot` | Killing mobs for a drop. | Same as `kill`. |
| `object` | Clicking or gathering things in the world. | No level check against mobs. Shares a step with objectives close by. |
| `use` | Using an item or spell on something. | Same as `object`. |
| `talk` | Speaking to an NPC. | Gets a step of its own. If the NPC's recorded positions are spread over more than 120 yards it is treated as walking a route. |
| `event` | Something that happens at a place: an escort's end point, an emote, standing somewhere. | Gets a step of its own. |
| `buy` | Buying from a vendor. | Gets a step of its own. Write the `text` yourself. |

"Close by" means within 140 yards; such objectives are shown together as one step with one loop of
waypoints.

### Where it is

At least one of these must give a place inside the zone or its linked city.

| Key | Meaning |
|---|---|
| `npcs` | NPC IDs. Their spawn points from the database are used. |
| `objects` | Object IDs, used the same way. |
| `points` | Fixed points, for when nothing in the database marks the spot: `"points": [ [39.07, 48.77] ]`. |
| `near` | Only use spawns of `npcs` and `objects` within a distance of a point: `{ "point": [86.82, 43.36], "radius": 320 }`. The radius is in yards (200 if left out). For mobs that live in several places when only one of them counts. |
| `patrol` | The NPC (the first in `npcs`) walks a route. The step shows waypoints along its path instead of one pin. |

Spawn points are grouped into patches, and the router picks the patch that fits the route best. If an
objective cannot be placed at all, the quest is treated as partly outside the zone: it is still picked
up, but its hand-in step only shows once the quest is complete. The report lists it under "Hand-in
step only shows once complete", which is the sign that an ID or a point is wrong.

### How much, and when

| Key | Meaning | If left out |
|---|---|---|
| `count` | How many are needed. A spawn patch has to hold at least half this many to be considered. | 1 |
| `kills` | Roughly how many kills it takes. Drives the experience and time estimate. Set it to 0 for a `kill` that is not really a fight, and to a guess for drops (4 for a drop you expect after about four kills). | `count` for `kill` and `loot`, otherwise 0 |
| `mobLevel` | Level of the mobs involved. | From the database, else the quest's level |
| `minLevel` | Do not plan this objective before this level. | No limit beyond the usual ones |
| `after` | This objective must come after all the earlier ones in the list. It also keeps it in a step of its own. | Any order |

### More examples

Talking to several NPCs, one of whom wanders:

```json
"99141": {
  "objectives": [
    { "index": 1, "kind": "talk", "npcs": [1496], "label": "Dillinger's Report (1)",
      "text": "Talk to |cRXP_FRIENDLY_Deathguard Dillinger|r and pick \"I need a report for Executor Zygand\"",
      "extraLines": [ ".skipgossipid 142723" ],
      "targets": [ { "kind": "target", "name": "Deathguard Dillinger" } ] },
    { "index": 3, "kind": "talk", "npcs": [10666], "patrol": true, "label": "Gordo's Report (1)",
      "text": "Talk to |cRXP_FRIENDLY_Gordo|r. |cRXP_WARN_He patrols the road between Deathknell and Brill|r",
      "targets": [ { "kind": "unitscan", "name": "Gordo" } ] }
  ]
}
```

An escort: the pickup must not be automatic, the escort follows it at once, and it ends at a spot no
NPC marks:

```json
"99144": {
  "acceptText": "|cRXP_WARN_He is at the top of the tower and this starts an escort|r",
  "acceptFlags": 1,
  "tight": true,
  "objectives": [
    { "index": 1, "kind": "event", "points": [ [39.07, 48.77] ], "minLevel": 6, "kills": 4, "mobLevel": 7,
      "label": "Escort Bareth Dawnstone to safety",
      "text": "Escort |cRXP_FRIENDLY_Bareth Dawnstone|r out of Solliden Farmstead",
      "targets": [ { "kind": "target", "name": "Bareth Dawnstone" } ] }
  ]
}
```

Something to fetch first, then the real objective:

```json
"409": {
  "objectives": [
    { "kind": "object", "objects": [1586],
      "command": ".collect 3080,1,409,1 --Candle of Beckoning (1)",
      "text": "Open the |cRXP_PICK_Crate of Candles|r next to Gunther. Loot a |cRXP_LOOT_Candle of Beckoning|r" },
    { "index": 1, "kind": "kill", "objects": [1557], "after": true, "kills": 1, "mobLevel": 12,
      "label": "Lillith Nefara slain (1)",
      "text": "Click |cRXP_PICK_Lillith's Dinner Table|r to summon |cRXP_ENEMY_Lillith Nefara|r, then kill her",
      "targets": [ { "kind": "mob", "name": "Lillith Nefara" } ] }
  ]
}
```

A drop that only counts from the mobs in one place:

```json
"94440": {
  "pre": [94438],
  "objectives": [
    { "index": 1, "kind": "loot", "npcs": [1537, 1538], "kills": 4, "mobLevel": 10,
      "near": { "point": [86.82, 43.36], "radius": 320 },
      "label": "Scarlet Crusade Attack Plans (1)",
      "text": "Kill |cRXP_ENEMY_Scarlet Friars|r and |cRXP_ENEMY_Scarlet Zealots|r nearby. Loot them for the |cRXP_LOOT_Scarlet Crusade Attack Plans|r",
      "targets": [ { "kind": "mob", "name": "Scarlet Friar" }, { "kind": "mob", "name": "Scarlet Zealot" } ] }
  ]
}
```

A quest finished by doing something at the hand-in NPC:

```json
"96658": {
  "objectives": [],
  "turninPreLines": [ ".train 2550 >>Train Cooking" ],
  "turninText": "|cRXP_WARN_Learning Cooking from him completes the quest|r"
}
```

## Quests that start from an item

RouteBuilder works most of these out for itself. Use `startItem` when the database is missing the
item, or when you want to say how the quest should be handled.

| Key | Meaning |
|---|---|
| `item` | ID of the item that starts the quest. |
| `npcs` | IDs of the mobs that drop it. |
| `passive` | `false`: the item comes from a particular mob, so the guide gets a step to go and kill it. `true`: it is a random drop, so there is no step of its own. |
| `text` | What the guide says. A plain sentence is written for you if left out. |
| `mob` | Name to mark on the kill step (not passive). The first of `npcs` if left out. |
| `minLevel` | Do not plan the kill before this level (not passive). |
| `anchors` | Passive only: IDs of the quests whose kill steps the reminder should appear beside. If left out, quests in the guide that kill the same mobs are used. |

A particular mob, here an elite, with the hand-in made optional in case you cannot kill it:

```json
"95328": {
  "objectives": [],
  "optional": true,
  "startItem": {
    "item": 268812, "npcs": [260396], "passive": false, "mob": "Whispering Horror", "minLevel": 11,
    "text": "Kill the |cRXP_ENEMY_Whispering Horror|r (elite) and loot |cRXP_LOOT_Whispering Horror Residue|r. Use it to start the quest"
  }
}
```

A random drop, shown beside the steps of the quests that kill those mobs anyway:

```json
"361": {
  "startItem": {
    "item": 2839, "npcs": [1520, 1522, 1523], "passive": true, "anchors": [426, 362, 354],
    "text": "|cRXP_LOOT_A Letter to Yvette|r can drop from the Agamand Mills undead. Use it to start the quest if you get one"
  }
}
```

A passive quest's hand-in comes after its anchors' kill steps and only shows if you got the item. If
no quest in the guide kills those mobs, the quest is left out, with that reason in the report.

## Reminders

Notes that are not tied to a quest.

```json
"reminders": [
  { "tag": "Paladin", "atLevel": 6, "text": "|cRXP_WARN_Keep 10 Linen Cloth for A Lesson in Divinity|r" }
]
```

| Key | Meaning |
|---|---|
| `tag` | Who sees it, as a RestedXP tag: `"Paladin"`, `"Undead"`, `"Warrior/Rogue"`. Leave it out, or use `""`, for everyone. |
| `atLevel` | The reminder appears the first time you move on to a new area after the plan reaches this level. 1 if left out, which puts it at the start. |
| `text` | The note. |

The note disappears when the step after it is done. Reminders are only placed in the first part of a
guide.

## Finding IDs and coordinates

**Quest IDs.** The report lists every quest in the guide with its ID in square brackets, and the
first 40 left out for each reason. For any other quest, search for its name in
`QuestieDB/src/corrections/Forever/combined/foreverQuestDB.lua`. Each line starts `quest[ID]={"Name"`.

**NPC, object and item IDs.** The same folder has `foreverNpcDB.lua`, `foreverObjectDB.lua` and
`foreverItemDB.lua`, with lines starting `npc[ID]={'Name'`, `object[ID]={'Name'` and
`item[ID]={'Name'`. Several entries can share a name; the numbers in curly braces after an NPC or
object are where it spawns, keyed by zone, which tells you which one you want.

In game, target an NPC and type:

    /run print(UnitGUID("target"))

It prints something like `Creature-0-4444-0-12-5688-00001234AB`. The NPC ID is the second-to-last
piece, here 5688.

**Coordinates.** Any coordinates addon will do, or type:

    /run local m=C_Map.GetBestMapForUnit("player") local p=C_Map.GetPlayerMapPosition(m,"player") print(p.x*100, p.y*100)

**Subzone IDs** (for `bindSubzone`) are in `QuestieDB/support/Forever/Zones/areaIdToUiMapId.lua`, on
lines like `[159] = 1420, -- Brill -> Tirisfal Glades`. The first number is the one to use.

**An NPC the database has no position for.** Give the objective `points` instead of `npcs`, and name
the NPC in `targets` so the guide can still mark it.

## Checking that a fix took

Build the zone again and look at three places.

1. The first line of the build names the zone file it used.
2. The report. A `pre` you added shows in the order of the guide, or under "Need a quest this guide
   does not hand in". A quest you gave objectives no longer appears under "No objectives in the
   database". A bad ID shows up under "Hand-in step only shows once complete".
3. The "Checks" section at the top of the report. It replays the guide as every race and class; a
   correction that contradicts another one (two quests each needing the other, say) shows up there
   as an order problem.

`--effort 0.2` makes these test builds quick.

## What a zone file cannot do

- Remove a prerequisite the database has, or say "any one of these quests" rather than "all of them".
- Change where a quest is picked up or handed in, or the level it needs.
- Change the count of a database objective without rewriting that quest's `objectives`.
- Warn you about a misspelt key or a quest ID that matches nothing. Both are ignored silently.
