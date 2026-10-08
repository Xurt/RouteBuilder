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

* `<Zone> (<who>).lua` - the guide. See "Getting the guides into the game" below.
* `<Zone> (<who>).report.txt` - what went in, what was left out and why, and what to check in game.

Without `--race`/`--class` you get one route for the whole faction. Quests everyone can do are ordered
first; class and race quests are slotted into that order and tagged (`<< Paladin`, `<< Undead`), so they
only show for those characters. With `--race` and `--class` the whole order is tuned for that one
character, which is shorter for them (the faction report lists each class's total, so you can compare).

Other options: `--out`, `--data`, `--zone-file`, `--start-level`, `--min-level`, `--max-level`,
`--no-hearth`, `--effort` (0.2 for a quick look, 3 for a slow thorough run) and `--rxp <folder>`.
`--rxp` points at a RestedXP `Guides` folder (inside the addon); RouteBuilder reads the objective
numbers RestedXP uses and flags or fixes the ones where the database disagrees.

## Getting the guides into the game

`Make-Addon.ps1` packs everything in `guides` into a small addon of its own, which lists RestedXP as a
dependency. Nothing inside the RestedXP addon has to be edited.

    .\Make-Addon.ps1

It writes `addon\RXPGuides_ZoneRoutes`. Copy that `RXPGuides_ZoneRoutes` folder into your game's
`Interface\AddOns` folder, next to `RXPGuides`. Run the script and copy the folder again after every
build; the folder is rebuilt from scratch each time.

* Close the game completely and start it again when the addon is new or a guide file was added or
  removed. When only the contents of existing guides changed, `/reload` is enough.
* If Windows refuses to run the script, start it as
  `powershell -ExecutionPolicy Bypass -File .\Make-Addon.ps1`.
* If the game lists the addon as out of date, pass the game's interface number, for example
  `.\Make-Addon.ps1 -Interface 16001`. The default is the list RestedXP's own `.toc` uses.

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
survive the next build. The smallest useful file is one fix:

    {
      "quests": {
        "784": { "pre": [786] }      // quest 784 is not offered until 786 is handed in
      }
    }

**`docs/zone-files.md` is the full reference**: every key, what it does, what happens when it is left
out, how to find the IDs and coordinates, and worked examples. `zones/Tirisfal Glades.json` is a
complete real file.

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

# Route Testing Status
## Horde
| Zone | Complete | In Progress |
| ------------- |:-------------:|:-------------:|
|Alterac Mountains|||
|Arathi Highlands|||
|Ashenvale|||
|Azshara|||
|Badlands|||
|Blasted Lands|||
|Burning Steppes|||
|Desolace|||
|Dun Morogh|||
|Durotar||X|
|Duskwood|||
|Dustwallow Marsh|||
|Eastern Plaguelands|||
|Felwood|||
|Feralas|||
|Hillsbrad Foothills|||
|Loch Modan|||
|Moonglade|||
|Mulgore|||
|Orgrimmar|||
|Redridge Mountains|||
|Searing Gorge|||
|Silithus|||
|Silithus|||
|Silverpine Forest|||
|Stonetalon Mountains|||
|Stranglethorn Vale|||
|Swamp of Sorrows|||
|Tanaris|||
|Teldrassil|||
|The Barrens|||
|The Hinterlands|||
|Thousand Needles|||
|Thunder Bluff|||
|Tirisfal Glades|X||
|Un'Goro Crater|||
|Undercity|||
|Western Plaguelands|||
|Westfall|||
|Winterspring|||
|Zephras Isle|||

## Alliance
| Zone | Complete | In Progress |
| ------------- |:-------------:|:-------------:|
|Alterac Mountains|||
|Arathi Highlands|||
|Ashenvale|||
|Azshara|||
|Badlands|||
|Blasted Lands|||
|Burning Steppes|||
|Darkshore|||
|Darnassus|||
|Desolace|||
|Dun Morogh|||
|Durotar|||
|Duskwood|||
|Dustwallow Marsh|||
|Eastern Plaguelands|||
|Elwynn Forest|||
|Felwood|||
|Feralas|||
|Hillsbrad Foothills|||
|Ironforge|||
|Loch Modan|||
|Moonglade|||
|Redridge Mountains|||
|Riverglades|||
|Searing Gorge|||
|Silithus|||
|Stonetalon Mountains|||
|Stormwind City|||
|Stranglethorn Vale|||
|Swamp of Sorrows|||
|Tanaris|||
|Teldrassil|||
|The Barrens|||
|The Hinterlands|||
|Thousand Needles|||
|Un'Goro Crater|||
|Western Plaguelands|||
|Westfall|||
|Wetlands|||
|Winterspring|||
|Zephras Isle|||