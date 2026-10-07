# RouteBuilder

Builds leveling routes for WoW Forever in RestedXP (RXPGuides) format, one guide per zone, from
QuestieDB's quest data. The aim is every quest a character can do in the zone, in an order that keeps
running to a minimum. What comes out is a base to play-test and correct, not a finished guide.

## Setting up

You need the .NET 8 SDK and, for the first download, git (without git it downloads a zip instead).

    dotnet build -c Release
    dotnet run -c Release -- update

`update` fetches QuestieDB into a `QuestieDB` folder next to where you run it and runs QuestieDB's own
export script (it ships its own Lua for Windows and Linux). Run it again whenever you want newer data.

## Building a guide

    dotnet run -c Release -- zones --faction Horde
    dotnet run -c Release -- build --zone "Tirisfal Glades" --faction Horde
    dotnet run -c Release -- build --zone "Tirisfal Glades" --race Undead --class Paladin
    dotnet run -c Release -- build --zone all --faction Alliance

A zone takes a minute or two at the default effort; `--effort 0.2` is much quicker and usually within a
few percent. Each build writes two files into `guides`:

* `<Zone> (<who>).lua` - the guide. Load it the same way as any other custom RXP guide file.
* `<Zone> (<who>).report.txt` - what went in, what was left out and why, and what to check in game.

Without `--race`/`--class` you get one route for the whole faction. Quests everyone can do are ordered
first; class and race quests are slotted into that order and tagged (`<< Paladin`, `<< Undead`), so they
only show for those characters. With `--race` and `--class` the whole order is tuned for that one
character, which is shorter for them (the faction report lists each class's total, so you can compare).

Other options: `--out`, `--data`, `--zone-file`, `--start-level`, `--min-level`, `--max-level`,
`--no-hearth`, `--effort` (0.2 for a quick look, 3 for a slow thorough run) and `--rxp <folder>`.
`--rxp` points at a RestedXP `Guides` folder (inside the addon); RouteBuilder reads the objective
numbers RestedXP uses and flags or fixes the ones where the database disagrees.

## How a zone is planned

* **Which quests.** Everything that starts or ends in the zone (or its capital city) for the faction,
  within the zone's level range. Repeatable, event, profession, reputation and dungeon quests are left
  out. The report lists every quest left out with the reason.
* **Quests that leave the zone** are picked up and carried. The last step of the guide lists what is
  still in the log and where each one goes, so you can pick the next zone by it.
* **Quests that arrive from another zone** get a hand-in step that only shows if you have the quest.
  The same goes for quests whose prerequisite is in another zone: their steps show once that is done.
* **Level.** The plan assumes you arrive at the zone's lowest quest level and tracks experience as it
  goes. If the zone covers more levels than its own quests give, the guide is cut into parts with a
  level check between them ("the rest is planned from level 18; come back then").
* **Hubs.** Whenever you are at a quest hub, everything you can pick up or hand in there is part of
  that stop. Nothing on offer is left for a later visit.
* **Quest log.** Forever's 40 slots are checked for every race/class combination.
* **Checks.** The finished guide is replayed as each race/class combination; anything out of order
  (hand-in before pickup, a prerequisite skipped, a step shown to the wrong class) is reported.

## Zone files: where your corrections go

QuestieDB is missing prerequisites and some objectives for the quests that are new in Forever. The
report's "Worth checking in game" section lists them. Fixes go in `zones/<Zone name>.json`, so they
survive the next build. `zones/Tirisfal Glades.json` is a worked example. Everything is optional:

    {
      "start": [30.0, 72.8],                // where the player begins; points are map coordinates [x, y]
      "startLevel": 1,
      "innkeeper": 5688, "bindName": "Brill", "bindSubzone": 159,
      "linkedAreas": [ { "area": "Undercity", "gate": [61.9, 64.9], "hub": [66.0, 44.0], "penalty": 250,
                         "enterText": "Take a lift down", "leaveText": "Take a lift back up" } ],
      "include": [1234],                    // force a quest in
      "exclude": { "441": "belongs to a Silverpine chain" },
      "quests": {
        "98601": { "pre": [364] },          // must come after quest 364
        "96896": { "objectives": [] },      // really has no objectives
        "90902": { "objectives": [ {
            "index": 1, "kind": "use", "npcs": [259377],
            "label": "Injured Deathguard healed (5)",
            "text": "Cast Holy Light on Injured Deathguards",
            "targets": [ { "kind": "target", "name": "Injured Deathguard" } ], "kills": 0 } ] },
        "97558": { "objectiveIndex": { "278242": 1, "278243": 2 } }   // quest-log line for each item/NPC
      },
      "reminders": [ { "tag": "Paladin", "atLevel": 6, "text": "Keep 10 Linen Cloth" } ]
    }

Per quest you can set: `pre`, `objectives` (replaces the database's list), `objectiveIndex`,
`acceptText`, `acceptFlags`, `turninText`, `turninPreLines`, `turninExtraLines`, `turninComplete`,
`tight` (first objective must directly follow the pickup, for escorts), `optional`, `noTurnin`,
`startItem`, `note`, `xp`.

Per objective: `index` (its line in the quest log), `kind` (kill, loot, object, use, talk, event, buy),
`npcs`, `objects`, `points`, `near` (`{ "point": [x, y], "radius": 300 }`), `label`, `text`,
`extraLines` (raw RXP lines), `targets`, `count`, `kills`, `mobLevel`, `minLevel`, `after` (must follow
the previous objective), `patrol`, `command` (a raw RXP line instead of `.complete`).

## Settings

The numbers the router's judgement rests on are in `src/Tuning.cs`, each with a comment. To change one
without recompiling, put it in a `settings.json` in the folder you run from, for example:

    { "HubRadius": 110, "VisitGap": 2, "RefineRounds": 2, "Seeds": 8 }

## What it does not know

* Distances are straight lines. It has no idea about cliffs, rivers, caves or which floor an NPC is on.
* Levels are an estimate: quest experience for new Forever quests is guessed from classic quests of the
  same level, and kill experience is a rough share of the kills each objective needs.
* Prerequisites for new quests are only as good as the database plus your zone file.
* It plans one zone at a time. Linking zones into one leveling path is up to you, using the list at
  the end of each guide.
* Flight paths, boats, vendors, training and gear are not planned.

## Data and licences

Quest data comes from QuestieDB (GPL-3.0), downloaded by `update` and not included here. Guides built
from it carry a note saying so. RestedXP's guides are only read for objective numbers when you pass
`--rxp`; nothing from them is copied into the output.
