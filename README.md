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

* `<Zone> (<who>).lua` - the zone's guides (one per section, see "A guide per section"). See "Getting the
  guides into the game" below.
* `<Zone> (<who>).report.txt` - what went in, what was left out and why, and what to check in game.
* `<Zone> (<who>).meta.json` - a short summary of the guide (levels, sections, quests) that `link` reads to
  suggest next zones. It is not packed into the addon.

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
  route is in at that point. A step without a `.goto` counts as being wherever its guide last sent you, and
  steps for other classic seasons (`#season 2`: Season of Discovery runes) and softcore-only steps are left out. A build for one race and class takes only the steps for it.
* RestedXP's own conditions come along (`.money`, `.xp`, class tags), so its "train if you can afford
  it" variants still choose themselves in game. Hardcore-only variants are left out.
* `--no-rxp-steps` leaves them out. The report says how many were added, and the console ends each build
  with a line saying how many came from the lock, from RestedXP and from the zone file.
* If the `--rxp` folder is not there, or has no RestedXP guides in it, the build stops and says so. On
  Windows, leave the `\` off the end of a quoted folder (`"D:\...\Guides\forever"`, not `"...\forever\"`).
* The ones placed are saved in the lock file (next section), so later builds keep them where they are, with
  or without `--rxp`, and you can move them by hand.

## Keeping the route between builds

Every build saves its step order in `locks/<Zone> (<who>).json` (the level range is in the name too, when
you give one). The next build of the same guide follows that order instead of planning from scratch, so
adding a fix to a zone file does not reshuffle the whole route:

* Steps that are still there keep their place and their spot.
* New steps (a quest you `include`d, a new objective) are slotted in where they cost least.
* A new step that a saved step needs (a quest the lock never did, an objective it did along the way) is
  slotted in ahead of it; the saved step stays where it is.
* A saved step that needs one coming later in the lock (after a new `pre` or `pickupAfter`) waits and goes
  in right after it, and so do the steps that need it. Nothing else moves.
* Only the new steps are fine-tuned afterwards. The console says how many steps were kept, added and held
  back (`ROUTEBUILDER_DEBUG=1` also lists the held-back ones and what they wait for).

A build that keeps a saved order takes a second or two. To plan a guide from scratch again (after a big
change, or to see whether the planner finds something shorter), build with `--fresh`; that also replaces
the saved order. Deleting the file does the same. The file has one line per step and can be reordered by hand.

Training, vendor and flight-path steps are lines of their own in the file, written out in full:

    "turnin:790 @1411:-4109.22,-397.61  TurnIn Sarkoth",
    {"lines":[".goto 1411/1,-4107.11,-604.18",">>Talk to |cRXP_FRIENDLY_Hraug|r",".vendor",".target Hraug"],"tag":"Warlock","from":"RestedXP: 1-6 Durotar"},
    "accept:804 @1411:-4109.22,-397.61  Accept Sarkoth",

* Each one goes in the guide right after the step above it in the file, so moving the line moves the step.
  If the guide no longer has that step, it goes by the nearest one around it that it does have.
* They come from RxpToLock or from a build with `--rxp`. You can also write your own the same way: `lines`
  are RestedXP lines as in a guide (with a `.goto` for where), `tag` is who sees it (leave it out for
  everyone), `text` is an optional instruction line, and `from` is only a note.
* A build with `--rxp` does not add a second copy of a step the file already has, wherever it stands.
  Delete a line to drop that step (with `--rxp`, the build would add it back in RestedXP's place;
  `--no-rxp-steps` stops that).
* Hand-written steps tied to a quest step belong in the zone file's `steps` instead; they are not saved here.

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
* RestedXP's guides hold two routes in one file: steps marked `#softcore` (which die on purpose to skip a walk,
  `.deathskip`) and steps marked `#hardcore`. RouteBuilder plans walking, so it follows the hardcore route and leaves
  the softcore-only steps out.
* A hearth RestedXP uses before its guide has you set the hearthstone (back to where the character started, such
  as "Hearth to the Valley of Trials") is kept as a step of its own. Later hearths are RouteBuilder's own.
* Setting the hearthstone is only taken from a step on this zone's maps, in a guide that does its quests.
* Of all the guides in the files, it follows the ones that are about this zone: those named after it ("1-6 Mulgore")
  and any doing at least a fifth as many of its steps as the busiest one, in order of their starting levels. Guides
  that only pass through (a class quest in the capital, a hand-in on the way to the next zone) are listed and left
  out; the build slots in what they had.
* A guide RestedXP only offers some characters (its header says `<< Human Mage`, as the AoE mage guides do) is
  that character's route, so a faction lock does not follow it; it is listed as "Not followed". A lock for one
  race and class (`--race`, `--class`) follows it when it is theirs. With `--rxp`, the build still takes its
  training and vendor steps, shown only to those characters.
* Where RestedXP offers a pickup early "if you are already level N" (`.xp <N`) and plans it again later, the
  later one is used.
* RestedXP's own grind steps (`.xp 5+1740 >>Grind to ...`) go in too, and the lock is marked `"levels": "RestedXP"`.
  The build then trusts RestedXP's level timing: the pickups it keeps in RestedXP's places get no "be level N"
  check of RouteBuilder's (whose experience figures for new Forever quests are estimates). Quests RestedXP does not
  do, which RouteBuilder slots in, still get one where needed. Building with `--fresh` drops the mark.
* RestedXP's training, vendor and flight-path steps for this zone go in too, in RestedXP's places (on this
  zone's maps, from the guides that do its quests).
* If the files have nothing for the zone, the lock that is there is left alone.
* A lock that was already there is kept as `.bak`. The new one is an ordinary lock from then on: edit it,
  or build with `--fresh` to go back to RouteBuilder's own plan.
* Distances are still measured in straight lines, so a RestedXP order usually comes out a little longer
  in the report than RouteBuilder's own plan; RestedXP plans around terrain and grinding, which RouteBuilder
  does not see.

## A guide per section

A zone's route is split into sections where it arrives at a new main quest hub (a place with four or more
pickups) a couple of levels further on, and each section is a guide of its own. In RestedXP's guide list
they sit under a heading inside "Zone Routes (Horde)" that gives the levels they cover and the zone's
name, so Durotar shows as one entry, "1 - 12 Durotar", that opens to "1-4 Durotar: around Gornek",
"4-7 Durotar: around Orgnil Soulscar" and so on. The headings are listed lowest level first. Pick the
guide for your level, or start at the first and do everything.

* Each guide leads on to the next with `#next`, so playing from the first is the same as one long guide.
* Start at any of them: a step that needs a quest from an earlier one hides itself unless you did that
  quest. A pickup whose prerequisite was handed in earlier gets `.isQuestTurnedIn`, and an objective or
  hand-in of a quest picked up earlier gets `.isOnQuest`. Played in order, these always pass.
* A zone planned in several parts ("the rest is planned from level 20") gets a guide per part as well, such
  as "20-21 The Barrens". A part that only some classes have quests in is only listed for them.
* The range in a guide's name runs from the level it is planned from to where the next one starts (the
  last one: to the level you are expected to finish at). A last stretch of only a few steps, or less than
  a level, stays with the section before it.
* Sections are named after the town when the zone file names it under `hubs`, otherwise after the busiest
  quest giver there. In a zone file, `"split": false` keeps the zone in one guide, which then starts at
  the section for your level by itself (level jumps at its top; you can still scroll back), and
  `"sections": false` makes it one guide that always starts at the top. See docs/zone-files.md.
* The settings `SectionHubPickups`, `SectionMinSteps` and `SectionLevelStep` set how big a hub has to be,
  how many steps a section has at least, and how many levels apart sections start.
* It is still one .lua file per zone, and one lock file: the zone is planned as one route and only split
  when it is written out.

## Suggesting the next zone (link)

    dotnet run -c Release -- link

Run this after building. It reads the `.meta.json` of every guide in `guides` and writes into each guide
the zones that suit its end level best:

* At the end of the zone's last guide, a step listing up to three zones, and `#next` in that guide's
  header, so RestedXP loads the best one when you complete that step. It loads the guide for the section
  of that zone you would start at, not necessarily its first.
* At the end of each earlier part ("the rest of this zone is planned from level N"), the same for the
  level you are at there.
* Zones are ranked by how many levels of quest experience they still hold for a player of that level,
  starting from the section they would start at, with less counted for quests five or more levels below
  you (as the game does). Quests carried from this zone that are handed in there count in its favour
  ("2 quests from here hand in there"), and a zone across the sea counts for a little less.
* Only guides that are built are considered, so build the zones you want suggested first. A guide made
  for one race and class is suggested over the faction's guide of the same zone for that character.
* `"suggest": false` in a zone file keeps that zone out of everyone's suggestions (for a starting zone
  others cannot reach, say). `LinkSuggestions`, `LinkMinLevels` and `LinkOtherContinent` in settings.json
  change how many are listed, the least worth listing, and the sea crossing's weight.
* Running it again replaces the suggestions. Building a guide again takes them out of that guide until
  you link again (Rebuild-All.ps1 does that for you).

## Rebuilding every zone (Rebuild-All.ps1)

`Rebuild-All.ps1` runs RxpToLock and then the build for every zone of both factions, and packs the addon
at the end:

    .\Rebuild-All.ps1 -Rxp "D:\World of Warcraft\_classic_beta_\Interface\AddOns\RXPGuides\Guides\forever"

* It reads every RestedXP guide file in that folder (not its subfolders; `-Recurse` adds them). A zone
  RestedXP's guides do not cover keeps its lock as it was.
* `-Faction Horde` or `-Zone "Durotar","Mulgore"` narrows it down; `-NoRxpToLock` builds from the locks as
  they are; `-Fresh` plans every zone from scratch; `-Update` fetches QuestieDB first; `-NoLink` skips
  the next-zone suggestions; `-NoAddon` skips Make-Addon.ps1.
* After the builds it runs `link` over every guide in `guides` (also ones built before this run), then
  Make-Addon.ps1.
* The console shows a line or two per zone and a summary of zones with problems; everything else goes to
  `rebuild.log`.

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
  within the zone's level range. Repeatable, holiday, profession, reputation and dungeon quests are left
  out; escorts, exploration and other scripted quests are planned like any other. The report lists every quest left out with the reason.
* **Quests that leave the zone** are picked up and carried. The last step of the guide lists what is
  still in the log and where each one goes, and `link` adds the zones that suit your level best.
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
* **Loops.** Objective steps get a `#loop` of waypoints over the spawns. The spawns are split into groups,
  about one per 120 yards across (`LoopSpacing`, at most `LoopMaxPoints`), and each waypoint goes on the
  busiest spawn of its group, so the arrow leads through the thick of the mobs rather than round the edge.
  The loop starts at the waypoint nearest to where you come from. A patch under 110 yards across
  (`LoopSingleSpan`) gets one pin at its busiest spot instead. When the chosen spot holds fewer
  than the objective needs (five Lazy Peons that each sleep somewhere else), the loop takes in the
  objective's other known spawn points, nearest first (`SpreadRange`).
* **Doing things together.** Objectives next to each other in the route whose mobs or objects share an
  area become one step. An objective whose area you pass through earlier (after picking it up) is also
  shown "as you go" at those stops, with RestedXP's `#completewith`; its own step later finishes whatever
  is left and skips itself if nothing is. "As you go" is only offered once you are at the level the plan
  waits for, and at most `MaxAsYouGo` of them are on screen at once (`OverlapRadius`, `OverlapShare`).
* **Early hand-ins.** When a stop (or a training or vendor step) is within reach of a quest giver whose quest is
  already finished but handed in further down the guide (a RestedXP order does that now and then), the guide
  offers the hand-in there too: "Turn in X while you are here". It only shows once the quest is complete, and
  the hand-in planned later skips itself.
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
