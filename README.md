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
With git it fetches only the newest QuestieDB commit; a `QuestieDB` folder left by an earlier zip
download is replaced by a git copy, so later updates are quick. If git fails it says why, then falls
back to the zip.

## Building a guide

    dotnet run -c Release -- zones --faction Horde
    dotnet run -c Release -- build --zone "Tirisfal Glades" --faction Horde
    dotnet run -c Release -- build --zone "Tirisfal Glades" --race Undead --class Paladin
    dotnet run -c Release -- build --zone all --faction Alliance

A zone takes a minute or two at the default effort. `--effort` takes a number from 0.01 to 100 and
scales how long the search runs: `--effort 0.2` is good for test builds while you edit a zone file
(a few seconds, with a route up to about 10% longer), and values above 1 rarely find a shorter route.
Each build writes two files into `guides`:

* `<Zone> (<who>).lua` - the guide. See "Getting the guides into the game" below.
* `<Zone> (<who>).report.txt` - what went in, what was left out and why, and what to check in game.

The console also lists any other guide files of the same zone still in `guides` (other level ranges,
for instance); delete the ones a build replaces, or the addon loads both.

Without `--race`/`--class` you get one route for the whole faction. Quests everyone can do are ordered
first; class and race quests are slotted into that order and tagged (`<< Paladin`, `<< Undead`), so they
only show for those characters. With `--race` and `--class` the whole order is tuned for that one
character, which is shorter for them (the faction report lists each class's total, so you can compare).

Other options: `--out`, `--data`, `--zone-file`, `--start-level`, `--min-level`, `--max-level`,
`--no-hearth`, `--effort` and `--rxp <folder>`.

To break a zone into smaller guides, build it once per level range:

    dotnet run -c Release -- build --zone Durotar --faction Horde --min-level 1 --max-level 5
    dotnet run -c Release -- build --zone Durotar --faction Horde --min-level 6 --max-level 10

Each range holds the zone's quests of those levels (both ends included), is planned from the range's
lowest level, and is written as `<Zone> <min>-<max> (<who>).lua`, so the ranges sit side by side.
Quests near the top that need a level the range does not quite reach stay in, behind a short "grind
to level N" step. A quest whose prerequisite sits in an earlier range only shows once that
prerequisite is done, so play the ranges in order.
`--rxp` points at a RestedXP `Guides` folder (inside the addon, best its `forever` folder). RouteBuilder
reads the objective numbers RestedXP uses and flags or fixes the ones where the database disagrees, and
copies in RestedXP's training, vendor and flight-path steps for the zone:

* Each one is placed next to the quest step it comes after in RestedXP's guide (or the one before it,
  when RestedXP does both at one NPC), so it moves with that step if the route changes. If our guide
  does not have that quest, the nearest one RestedXP does around it is used.
* Only steps for this faction, on this zone's maps, and from a RestedXP guide whose level range the
  route is in at that point. A build for one race and class takes only the steps for it.
* RestedXP's own conditions come along (`.money`, `.xp`, class tags), so its "train if you can afford
  it" variants still choose themselves in game. Hardcore-only variants are left out.
* `--no-rxp-steps` leaves them out. The report says how many were added.

## Keeping the route between builds

Every build saves its step order in `locks/<Zone> (<who>).json` (the level range is in the name too, when
you give one). The next build of the same guide follows that order instead of planning from scratch, so
adding a fix to a zone file does not reshuffle the whole route:

* Steps that are still there keep their place and their spot.
* New steps (a quest you `include`d, a new objective) are slotted in where they cost least.
* Steps whose prerequisites changed (a new `pre` or `pickupAfter`) are taken out and slotted in again
  after what they now need, together with the steps that follow from them.
* Only those slotted-in steps are fine-tuned afterwards. The console and the report say how many steps
  were kept, added and moved.

A build that keeps a saved order takes a second or two. To plan a guide from scratch again (after a big
change, or to see whether the planner finds something shorter), build with `--fresh`; that also replaces
the saved order. Deleting the file does the same. The file has one line per step and can be reordered by hand.

Guides built before this existed have no saved order. To keep the route of one you already have, build
once with `--order-from`, pointing at that guide, with the same options it was built with:

    dotnet run -c Release -- build --zone Durotar --faction Horde --order-from "guides/Durotar (Horde).lua"

From then on the saved order in `locks` is used.

## Starting from a RestedXP guide (RxpToLock)

`RxpToLock` is a second, small program in this folder. It reads RestedXP guide files and saves their step
order (pickups, objectives, hand-ins) as the zone's lock file. The next build follows RestedXP's order
for every quest both have and slots in the zone's quests RestedXP skips. Quests RouteBuilder does not count
as part of the zone (RestedXP's guides visit other zones too) are left out. Run it from this folder, with
the options of the build you will run next:

    dotnet run --project RxpToLock -c Release -- --zone Durotar --faction Horde "<RXPGuides>\Guides\forever\Horde-01-12_Durotar.lua"
    dotnet run -c Release -- build --zone Durotar --faction Horde --rxp "<RXPGuides>\Guides\forever"

* It lists the quests it left out as belonging elsewhere, the zone's quests RestedXP does not do, and any
  objective numbers RouteBuilder does not have.
* Pass the RestedXP folder with `--rxp` when building, so objective numbers match RestedXP's.
* `--race` and `--class` take only the steps RestedXP shows that character. Without them every class's
  and race's steps are taken, for a faction guide.
* `--guides "1-6 Durotar,6-10 Durotar"` takes only those guides (by their `#name`) from the files.
* A lock that was already there is kept as `.bak`. The new one is an ordinary lock from then on: edit it,
  or build with `--fresh` to go back to RouteBuilder's own plan.
* Distances are still measured in straight lines, so a RestedXP order usually comes out a little longer
  in the report than RouteBuilder's own plan; RestedXP plans around terrain and grinding, which RouteBuilder
  does not see.

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
  that stop. Nothing on offer is left for a later visit. A quest more than three levels above you is
  not "on offer" yet: it is picked up on a later visit, close to when you can do it (`PickupAhead`,
  `AheadCost` in settings).
* **Finishing what you pick up.** Carrying a picked-up quest whose objectives are not done yet costs a
  little per yard (`Open`), so the plan picks up a group of quests, does them, and hands them in before
  moving on, instead of leaving a starting area with its quests half done.
* **Loops.** Objective steps get a `#loop` of waypoints over the spawns. When the chosen spot holds fewer
  than the objective needs (five Lazy Peons that each sleep somewhere else), the loop takes in the
  objective's other known spawn points, nearest first (`SpreadRange`).
* **Doing things together.** Objectives next to each other in the route whose mobs or objects share an
  area become one step. An objective whose area you pass through earlier (after picking it up) is also
  shown "as you go" at those stops, with RestedXP's `#completewith`; its own step later finishes whatever
  is left and skips itself if nothing is. "As you go" is only offered once you are at the level the plan
  waits for, and at most `MaxAsYouGo` of them are on screen at once (`OverlapRadius`, `OverlapShare`).
* **Passing by.** When a finished quest's hand-in lies on or just off the way between two stops, the
  plan hands it in on the way rather than carrying it past. "On the way" is judged in straight lines
  (`PassRadius`, `PassDetour` and `PassMiss` in settings), so a road that bends through a town is not seen.
* **Quest log.** Forever's 40 slots are checked for every race/class combination.
* **Checks.** The finished guide is replayed as each race/class combination that exists (classic's,
  plus Forever's, such as Undead Paladin, Orc Mage and Skyborne; more are picked up from the quest data); anything out of order
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
