-- 10-24 Westfall: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 4 parts (from level 10, 16, 19, 22).
-- Split into 5 guides, listed under "10 - 23 Westfall" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Westfall.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 10 - 23 Westfall
#subweight -10
#name 10-12 Westfall: around Farmer Saldean
#next Zone Routes (Alliance)\12-14 Westfall: around Gryan Stoutmantle

step
    .goto 1436/0,1045.12,-10508.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    .turnin 143 >>Turn in Messenger to Westfall
    .target Gryan Stoutmantle
    .isOnQuest 143
step
    .goto 1436/0,1045.12,-10508.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    .turnin 132 >>Turn in The Defias Brotherhood
    .target Gryan Stoutmantle
    .isOnQuest 132
step
    .goto 1436/0,1045.12,-10508.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    .turnin 141 >>Turn in The Defias Brotherhood
    .target Gryan Stoutmantle
    .isOnQuest 141
step << Human
    .goto 1436/0,1021.67,-10500.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quartermaster Lewis|r
    .accept 6181 >>Accept A Swift Message
    .target Quartermaster Lewis
    .xp <10,1
step
    .goto 1436/0,1055.27,-10128.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Farmer Saldean|r
    .accept 109 >>Accept Report to Gryan Stoutmantle
    .target Farmer Saldean
step
    .goto 1436/0,918.42,-9851.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Farmer Furlbrow|r
    .accept 64 >>Accept The Forgotten Heirloom
    .target Farmer Furlbrow
step
    .goto 1436/0,919.47,-9853.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Verna Furlbrow|r
    .accept 151 >>Accept Poor Old Blanchy
    .accept 36 >>Accept Westfall Stew
    .target Verna Furlbrow
step
    .goto 1436/0,1055.27,-10128.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Farmer Saldean|r
    .accept 9 >>Accept The Killing Fields
    .target Farmer Saldean
step
    .goto 1436/0,1041.97,-10112.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Salma Saldean|r
    .turnin 36 >>Turn in Westfall Stew
    .accept 38 >>Accept Westfall Stew
    .accept 22 >>Accept Goretusk Liver Pie
    .target Salma Saldean
step << !Hunter
    .goto 1436/0,1045.22,-10508.800
    .xp 9+5775 >> Grind to 5775+/6500xp
step << !Hunter
    .goto 1436/0,1045.22,-10508.800
    .xp 9+5410 >> Grind to 5410+/6500xp
step << Paladin
    .goto 1436,48.249,46.729
    .xp 11+5360 >> Grind to 5360+/8800xp
step
    .goto 1436/0,1045.12,-10508.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    .turnin 109 >>Turn in Report to Gryan Stoutmantle while you are here
    .isQuestComplete 109
    .target Gryan Stoutmantle
step
    #completewith Drop136x1
    >>|cRXP_LOOT_Captain Sander's Treasure Map|r can drop from |cRXP_ENEMY_Murloc Coastrunner|r, |cRXP_ENEMY_Murloc Tidehunter|r, |cRXP_ENEMY_Murloc Warrior|r. Use it to start the quest if you get one
    .collect 1357,1,136 --Captain Sander's Treasure Map (1)
    .accept 136 >>Accept Captain Sander's Hidden Treasure
    .use 1357
step
    #completewith Drop136x1
    >>|cRXP_LOOT_Precessive Autocognition Assembly|r can drop from |cRXP_ENEMY_Harvest Golem|r, |cRXP_ENEMY_Harvest Watcher|r, |cRXP_ENEMY_Harvest Reaper|r. Use it to start the quest if you get one
    .collect 255155,1,92910 --Precessive Autocognition Assembly (1)
    .accept 92910 >>Accept Harvesting the Harvesters
    .use 255155
step
    #loop
    .goto 1436/0,1007.32,-9862.70,0
    .goto 1436/0,1007.32,-9862.70,40,0
    .goto 1436/0,977.92,-9788.27,40,0
    >>Kill |cRXP_ENEMY_Harvest Golems|r, |cRXP_ENEMY_Harvest Watchers|r, |cRXP_ENEMY_Harvest Reapers|r and |cRXP_ENEMY_Rusty Harvest Golems|r. Loot them for |cRXP_LOOT_Okra|r
    .complete 38,4 --Okra (3)
    .mob Harvest Golem
    .mob Harvest Watcher
    .mob Harvest Reaper
    .mob Rusty Harvest Golem
step
    #label Drop136x1
    .goto 1436/0,884.12,-10052.63
    >>Kill |cRXP_ENEMY_Greater Fleshrippers|r, |cRXP_ENEMY_Young Fleshrippers|r, |cRXP_ENEMY_Vultros|r and |cRXP_ENEMY_Fleshrippers|r. Loot them for |cRXP_LOOT_Stringy Vulture Meat|r
    .complete 38,1 --Stringy Vulture Meat (3)
    .mob Greater Fleshripper
    .mob Young Fleshripper
    .mob Vultros
    .mob Fleshripper
step
    .goto 1436/0,1045.12,-10508.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    .turnin 109 >>Turn in Report to Gryan Stoutmantle
    .accept 12 >>Accept The People's Militia
    .target Gryan Stoutmantle
step
    .goto 1436/0,1041.97,-10511.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Danuvin|r
    .accept 102 >>Accept Patrolling Westfall
    .target Captain Danuvin
step << Human
    .goto 1436/0,1055.27,-10128.70
    .xp 10 >> Grind to level 10
step
    #completewith Drop136x2
    >>|cRXP_LOOT_Captain Sander's Treasure Map|r can drop from |cRXP_ENEMY_Murloc Coastrunner|r, |cRXP_ENEMY_Murloc Tidehunter|r, |cRXP_ENEMY_Murloc Warrior|r. Use it to start the quest if you get one
    .collect 1357,1,136 --Captain Sander's Treasure Map (1)
    .accept 136 >>Accept Captain Sander's Hidden Treasure
    .use 1357
step
    #completewith Drop136x2
    >>|cRXP_LOOT_Precessive Autocognition Assembly|r can drop from |cRXP_ENEMY_Harvest Golem|r, |cRXP_ENEMY_Harvest Watcher|r, |cRXP_ENEMY_Harvest Reaper|r. Use it to start the quest if you get one
    .collect 255155,1,92910 --Precessive Autocognition Assembly (1)
    .accept 92910 >>Accept Harvesting the Harvesters
    .use 255155
step
    #label Drop136x2
    #loop
    .goto 1436/0,1163.07,-10477.30,0
    .goto 1436/0,1163.07,-10477.30,40,0
    .goto 1436/0,913.52,-10461.20,40,0
    .goto 1436/0,948.87,-10418.50,40,0
    .goto 1436/0,1172.17,-10330.07,40,0
    .goto 1436/0,1326.17,-10627.57,40,0
    >>Kill |cRXP_ENEMY_Goretusks|r, |cRXP_ENEMY_Young Goretusks|r and |cRXP_ENEMY_Great Goretusks|r. Loot them for |cRXP_LOOT_Goretusk Liver|r
    >>Kill |cRXP_ENEMY_Goretusks|r and |cRXP_ENEMY_Young Goretusks|r. Loot them for |cRXP_LOOT_Goretusk Snout|r
    .complete 22,1 --Goretusk Liver (8)
    .complete 38,3 --Goretusk Snout (3)
    .mob Goretusk
    .mob Young Goretusk
    .mob Great Goretusk
step
    .goto 1436/0,1213.12,-10153.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ozwin Ironsprocket|r
    .accept 92911 >>Accept Harvesting the Harvesters
    .target Ozwin Ironsprocket
step
    #completewith Drop136x3
    >>|cRXP_LOOT_Captain Sander's Treasure Map|r can drop from |cRXP_ENEMY_Murloc Coastrunner|r, |cRXP_ENEMY_Murloc Tidehunter|r, |cRXP_ENEMY_Murloc Warrior|r. Use it to start the quest if you get one
    .collect 1357,1,136 --Captain Sander's Treasure Map (1)
    .accept 136 >>Accept Captain Sander's Hidden Treasure
    .use 1357
step
    #completewith Drop136x3
    >>|cRXP_LOOT_Precessive Autocognition Assembly|r can drop from |cRXP_ENEMY_Harvest Golem|r, |cRXP_ENEMY_Harvest Watcher|r, |cRXP_ENEMY_Harvest Reaper|r. Use it to start the quest if you get one
    .collect 255155,1,92910 --Precessive Autocognition Assembly (1)
    .accept 92910 >>Accept Harvesting the Harvesters
    .use 255155
step
    #loop
    .goto 1436/0,1156.07,-9647.57,0
    .goto 1436/0,1156.07,-9647.57,40,0
    .goto 1436/0,1066.47,-9601.37,40,0
    >>Kill |cRXP_ENEMY_Murloc Tidehunters|r, |cRXP_ENEMY_Murloc Oracles|r, |cRXP_ENEMY_Murloc Minor Oracles|r and |cRXP_ENEMY_Murloc Netters|r. Loot them for |cRXP_LOOT_Murloc Eye|r
    .complete 38,2 --Murloc Eye (3)
    .mob Murloc Tidehunter
    .mob Murloc Oracle
    .mob Murloc Minor Oracle
    .mob Murloc Netter
step
    #label Drop136x3
    #loop
    .goto 1436/0,980.02,-9843.57,0
    .goto 1436/0,980.02,-9843.57,40,0
    .goto 1436/0,1018.52,-9868.53,40,0
    .goto 1436/0,1113.72,-9968.63,40,0
    >>Kill |cRXP_ENEMY_Harvest Golems|r, |cRXP_ENEMY_Harvest Watchers|r, |cRXP_ENEMY_Harvest Reapers|r and |cRXP_ENEMY_Rusty Harvest Golems|r. Loot them for |cRXP_LOOT_Golem Isospring|r
    .complete 92911,1 --Golem Isospring (8)
    .mob Harvest Golem
    .mob Harvest Watcher
    .mob Harvest Reaper
    .mob Rusty Harvest Golem
step << Human
    .goto 1436/0,1021.67,-10500.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quartermaster Lewis|r
    .accept 6181 >>Accept A Swift Message
    .target Quartermaster Lewis
step << Human Mage
    .goto 1436/0,1021.60,-10500.61
    .vendor >>vendor trash
    .target Quartermaster Lewis
    >>Talk to |cRXP_FRIENDLY_Quartermaster Lewis|r
step << Human
    .goto 1436/0,1037.42,-10628.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thor|r
    .turnin 6181 >>Turn in A Swift Message
    .accept 6281 >>Accept Continue to Stormwind
    .target Thor
step << Human Mage
    .goto 1436/0,1035.67,-10627.33
    .fp Sentinel Hill >> Get the Sentinel Hill flight path
    >>Talk to |cRXP_FRIENDLY_Thor|r
    .target Thor
    .fly Stormwind >> Fly to Stormwind
step
    .goto 1436/0,1041.97,-10112.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Salma Saldean|r
    .turnin 38 >>Turn in Westfall Stew
    .turnin 22 >>Turn in Goretusk Liver Pie
    .target Salma Saldean
step
    .goto 1436/0,1127.37,-10636.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Scout Galiaan|r
    .accept 153 >>Accept Red Leather Bandanas
    .target Scout Galiaan
step
    .goto 1436/0,1037.42,-10628.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thor|r
    .fp Sentinel Hill >> Get the Sentinel Hill flight path
    .target Thor
step << Dwarf Paladin
    .hs >> Hearth to Ironforge
    >>|cRXP_BUY_Buy food/water if needed|r << !Warrior !Rogue
    >>|cRXP_BUY_Buy food if needed|r << Warrior/Rogue
    .cooldown item,6948,>2,1
step << !Paladin
    .hs >> Hearth to Thelsamar
    >>|cRXP_BUY_Buy food/water if needed|r << !Warrior !Rogue
    >>|cRXP_BUY_Buy food if needed|r << Warrior/Rogue
    .cooldown item,6948,>2,1
    .zoneskip Loch Modan
step
    .goto 1436/0,1166.57,-10653.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Heather|r
    .target Innkeeper Heather
    .home >>Set your Hearthstone to Innkeeper Heather's inn
step << Human
    .goto 1436/0,1021.67,-10500.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quartermaster Lewis|r
    .turnin 6285 >>Turn in Return to Lewis
    .target Quartermaster Lewis
    .isOnQuest 6285
step << Skyborne
    .goto 1436/0,1045.12,-10508.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    .turnin 98021 >>Turn in Journey to Sentinel Hill
    .target Gryan Stoutmantle
    .isOnQuest 98021
step
    .goto 1436/0,1166.57,-10653.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Heather|r
    .vendor >>|cRXP_BUY_Buy food/water if needed|r
    .target Innkeeper Heather
step
    .goto 1436/0,1179.87,-10635.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alba Fairmoon|r
    .accept 92742 >>Accept Testing the Wells
    .accept 92745 >>Accept The State of the Mines
    .accept 92744 >>Accept Murloc Gills
    .target Alba Fairmoon
step
    .goto 1436/0,1179.87,-10635.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alba Fairmoon|r
    .turnin 92742 >>Turn in Testing the Wells while you are here
    .isQuestComplete 92742
    .target Alba Fairmoon
step
    .goto 1436/0,1179.87,-10635.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alba Fairmoon|r
    .turnin 92752 >>Turn in Explosive Consultation
    .target Alba Fairmoon
    .isOnQuest 92752
step
    .goto 1436/0,1213.12,-10153.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ozwin Ironsprocket|r
    .accept 92909 >>Accept Harvesting the Harvesters
    .target Ozwin Ironsprocket
step
    #completewith Drop92910x4
    >>|cRXP_LOOT_Precessive Autocognition Assembly|r can drop from |cRXP_ENEMY_Harvest Golem|r, |cRXP_ENEMY_Harvest Watcher|r, |cRXP_ENEMY_Harvest Reaper|r. Use it to start the quest if you get one
    .collect 255155,1,92910 --Precessive Autocognition Assembly (1)
    .accept 92910 >>Accept Harvesting the Harvesters
    .use 255155
step
    #loop
    .goto 1436/0,1763.32,-10471.00,0
    .goto 1436/0,1763.32,-10471.00,40,0
    .goto 1436/0,1842.07,-10488.73,40,0
    .goto 1436/0,1878.82,-10248.40,40,0
    >>Kill |cRXP_ENEMY_Harvest Golems|r, |cRXP_ENEMY_Harvest Watchers|r and |cRXP_ENEMY_Harvest Reapers|r. Loot them for |cRXP_LOOT_Harvester Gyrostabilizer|r
    .complete 92909,2 --Harvester Gyrostabilizer (5)
    .mob Harvest Golem
    .mob Harvest Watcher
    .mob Harvest Reaper
step
    #label Drop92910x4
    #loop
    .goto 1436/0,1263.52,-9926.40,0
    .goto 1436/0,1263.52,-9926.40,40,0
    .goto 1436/0,1007.32,-9862.70,40,0
    .goto 1436/0,1113.72,-9968.63,40,0
    .goto 1436/0,1126.32,-10122.87,40,0
    >>Open the |cRXP_PICK_Furlbrow's Wardrobe|r. Loot it for |cRXP_LOOT_Furlbrow's Pocket Watch|r
    >>Kill |cRXP_ENEMY_Harvest Golems|r, |cRXP_ENEMY_Harvest Watchers|r, |cRXP_ENEMY_Harvest Reapers|r and |cRXP_ENEMY_Rusty Harvest Golems|r. Loot them for |cRXP_LOOT_Golem Isospring|r
    .complete 64,1 --Furlbrow's Pocket Watch (1)
    .complete 92909,1 --Golem Isospring (14)
    .mob Harvest Golem
    .mob Harvest Watcher
    .mob Harvest Reaper
    .mob Rusty Harvest Golem
step
    #completewith Drop136x4
    >>|cRXP_LOOT_Captain Sander's Treasure Map|r can drop from |cRXP_ENEMY_Murloc Coastrunner|r, |cRXP_ENEMY_Murloc Tidehunter|r, |cRXP_ENEMY_Murloc Warrior|r. Use it to start the quest if you get one
    .collect 1357,1,136 --Captain Sander's Treasure Map (1)
    .accept 136 >>Accept Captain Sander's Hidden Treasure
    .use 1357
step
    #label Drop136x4
    #loop
    .goto 1436/0,1008.37,-9838.90,0
    .goto 1436/0,1008.37,-9838.90,40,0
    .goto 1436/0,1024.47,-9702.40,40,0
    .goto 1436/0,1066.47,-9608.83,40,0
    >>Kill |cRXP_ENEMY_Riverpaw Taskmasters|r, |cRXP_ENEMY_Riverpaw Gnolls|r, |cRXP_ENEMY_Riverpaw Mongrels|r and |cRXP_ENEMY_Riverpaw Brutes|r. Loot them for |cRXP_LOOT_Gnoll Paw|r
    >>Kill |cRXP_ENEMY_Murloc Coastrunners|r, |cRXP_ENEMY_Murloc Tidehunters|r, |cRXP_ENEMY_Murloc Warriors|r and |cRXP_ENEMY_Murloc Minor Oracles|r. Loot them for |cRXP_LOOT_Longshore Murloc Gill|r
    >>Loot the |cRXP_PICK_Sack of Oats|r for |cRXP_LOOT_Handful of Oats|r
    .complete 102,1 --Gnoll Paw (8)
    .complete 92744,1 --Longshore Murloc Gill (7)
    .complete 151,1 --Handful of Oats (8)
    .mob Riverpaw Taskmaster
    .mob Riverpaw Gnoll
    .mob Riverpaw Mongrel
    .mob Riverpaw Brute
    .mob Murloc Coastrunner
    .mob Murloc Tidehunter
    .mob Murloc Warrior
    .mob Murloc Minor Oracle
step
    .goto 1436/0,918.42,-9851.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Farmer Furlbrow|r
    .turnin 64 >>Turn in The Forgotten Heirloom
    .target Farmer Furlbrow
step
    .goto 1436/0,919.47,-9853.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Verna Furlbrow|r
    .turnin 151 >>Turn in Poor Old Blanchy
    .target Verna Furlbrow
step
    .goto 1436/0,1213.12,-10153.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ozwin Ironsprocket|r
    .turnin 92909 >>Turn in Harvesting the Harvesters
    .target Ozwin Ironsprocket
step
    #completewith Drop92910x5
    >>|cRXP_LOOT_Precessive Autocognition Assembly|r can drop from |cRXP_ENEMY_Harvest Golem|r, |cRXP_ENEMY_Harvest Watcher|r, |cRXP_ENEMY_Harvest Reaper|r. Use it to start the quest if you get one
    .collect 255155,1,92910 --Precessive Autocognition Assembly (1)
    .accept 92910 >>Accept Harvesting the Harvesters
    .use 255155
step
    #completewith Along35
    >>As you go: Kill |cRXP_ENEMY_Defias Smugglers|r, |cRXP_ENEMY_Defias Pathstalkers|r, |cRXP_ENEMY_Defias Highwaymans|r and |cRXP_ENEMY_Defias Knuckledusters|r. Loot them for |cRXP_LOOT_Red Leather Bandana|r. |cRXP_WARN_Anything left is finished later|r
    .complete 153,1 --Red Leather Bandana (15)
    .mob Defias Smuggler
    .mob Defias Pathstalker
    .mob Defias Highwayman
    .mob Defias Knuckleduster
step
    #label Drop92910x5
    #loop
    .goto 1436/0,1706.27,-10550.80,0
    .goto 1436/0,1706.27,-10550.80,40,0
    .goto 1436/0,1620.52,-10648.33,40,0
    >>Kill |cRXP_ENEMY_Harvest Watchers|r
    .complete 9,1 --Harvest Watcher slain (20)
    .mob Harvest Watcher
step
    .goto 1436/0,1055.27,-10128.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Farmer Saldean|r
    .turnin 9 >>Turn in The Killing Fields
    .target Farmer Saldean
step
    #loop
    .goto 1436/0,1243.22,-10501.80,0
    .goto 1436/0,1243.22,-10501.80,40,0
    .goto 1436/0,1330.72,-10490.13,40,0
    >>Kill |cRXP_ENEMY_Defias Trappers|r
    .complete 12,1 --Defias Trapper slain (15)
    .mob Defias Trapper
step
    #completewith Along35
    >>As you go: Kill |cRXP_ENEMY_Kobold Diggers|r. |cRXP_WARN_Anything left is finished later|r
    .complete 92745,1 --Kobold Digger slain (4)
    .mob Kobold Digger
step
    #label Along35
    #loop
    .goto 1436/0,1451.12,-9998.27,0
    .goto 1436/0,1451.12,-9998.27,40,0
    .goto 1436/0,1415.77,-9878.33,40,0
    .goto 1436/0,1287.32,-9847.77,40,0
    >>Kill |cRXP_ENEMY_Defias Smugglers|r
    .complete 12,2 --Defias Smuggler slain (15)
    .mob Defias Smuggler
step
    #loop
    .goto 1436/0,1402.82,-10311.40,0
    .goto 1436/0,1402.82,-10311.40,40,0
    .goto 1436/0,1328.62,-10487.57,40,0
    .goto 1436/0,1217.67,-10491.77,40,0
    >>Kill |cRXP_ENEMY_Defias Smugglers|r, |cRXP_ENEMY_Defias Pathstalkers|r, |cRXP_ENEMY_Defias Highwaymans|r and |cRXP_ENEMY_Defias Knuckledusters|r. Loot them for |cRXP_LOOT_Red Leather Bandana|r
    .complete 153,1 --Red Leather Bandana (15)
    .mob Defias Smuggler
    .mob Defias Pathstalker
    .mob Defias Highwayman
    .mob Defias Knuckleduster
step
    #loop
    .goto 1436/0,1448.67,-9939.47,0
    .goto 1436/0,1448.67,-9939.47,40,0
    .goto 1436/0,1430.47,-9877.40,40,0
    >>Kill |cRXP_ENEMY_Kobold Diggers|r
    .complete 92745,1 --Kobold Digger slain (4)
    .mob Kobold Digger
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 10 - 23 Westfall
#subweight -10
#name 12-14 Westfall: around Gryan Stoutmantle
--RouteBuilder:next
#next Zone Routes (Alliance)\10-15 Darkshore: around Thundris Windweaver;Zone Routes (Alliance)\11-15 Zephras Isle: around Elegael Thornpaw;Zone Routes (Alliance)\9-12 Teldrassil: around Priestess A'moora

step
    .goto 1436/0,1045.12,-10508.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    .turnin 12 >>Turn in The People's Militia
    .target Gryan Stoutmantle
    .isOnQuest 12
step
    .goto 1436/0,1045.12,-10508.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    .accept 13 >>Accept The People's Militia
    .target Gryan Stoutmantle
    .isQuestTurnedIn 12 --any of: The People's Militia
step
    .goto 1436/0,1041.97,-10511.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Danuvin|r
    .turnin 102 >>Turn in Patrolling Westfall
    .target Captain Danuvin
    .isOnQuest 102
step
    .goto 1436/0,1127.37,-10636.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Scout Galiaan|r
    .turnin 153 >>Turn in Red Leather Bandanas
    .target Scout Galiaan
    .isOnQuest 153
step
    .goto 1436/0,1179.87,-10635.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alba Fairmoon|r
    .accept 92747 >>Accept Moonbrook Espionage
    .target Alba Fairmoon
step
    .goto 1436/0,1179.87,-10635.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alba Fairmoon|r
    .turnin 92742 >>Turn in Testing the Wells
    .target Alba Fairmoon
    .isOnQuest 92742
step
    .goto 1436/0,1179.87,-10635.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alba Fairmoon|r
    .turnin 92744 >>Turn in Murloc Gills
    .target Alba Fairmoon
    .isOnQuest 92744
step
    .goto 1436/0,1037.42,-10628.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thor|r
    .fp Westfall >> Get the Westfall flight path
    .target Thor
step << Shaman
    .goto 1436/0,1421.72,-10797.20
    >>Click the |cRXP_PICK_Forgotten Shrine|r
    .turnin 94502 >>Turn in Call of Water
    .isQuestComplete 94502
step
    #loop
    .goto 1436/0,1463.72,-10979.90,0
    .goto 1436/0,1463.72,-10979.90,40,0
    .goto 1436/0,1548.42,-11024.70,40,0
    >>Kill |cRXP_ENEMY_Defias Looters|r
    .complete 13,2 --Defias Looter slain (15)
    .mob Defias Looter
    .isOnQuest 13
step << Rogue
    .goto 1436/0,619.52,-11035.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Agent Kearnen|r
    .turnin 2360 >>Turn in Mathias and the Defias
    .target Agent Kearnen
    .isOnQuest 2360
step << !Dwarf Rogue
    .collect 6452,1 >> Craft an |T134437:0|t[Anti-Venom]
    .train 7934,3
step
    .goto 1436/0,1966.32,-11407.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Grayson|r
    .accept 103 >>Accept Keeper of the Flame
    .target Captain Grayson
step
    .goto 1436/0,1509.92,-11100.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Odd Child|r
    .accept 92110 >>Accept My First Real Potion
    .accept 92109 >>Accept My First Alchemy Set
    .target Odd Child
step
    #completewith Drop136x5
    >>|cRXP_LOOT_Captain Sander's Treasure Map|r can drop from |cRXP_ENEMY_Murloc Coastrunner|r, |cRXP_ENEMY_Murloc Tidehunter|r, |cRXP_ENEMY_Murloc Warrior|r. Use it to start the quest if you get one
    .collect 1357,1,136 --Captain Sander's Treasure Map (1)
    .accept 136 >>Accept Captain Sander's Hidden Treasure
    .use 1357
step
    #completewith Drop92910x6
    >>|cRXP_LOOT_Precessive Autocognition Assembly|r can drop from |cRXP_ENEMY_Harvest Golem|r, |cRXP_ENEMY_Harvest Watcher|r, |cRXP_ENEMY_Harvest Reaper|r. Use it to start the quest if you get one
    .collect 255155,1,92910 --Precessive Autocognition Assembly (1)
    .accept 92910 >>Accept Harvesting the Harvesters
    .use 255155
step
    #completewith Along50
    >>As you go: Kill |cRXP_ENEMY_Harvest Golems|r, |cRXP_ENEMY_Defias Smugglers|r, |cRXP_ENEMY_Riverpaw Taskmasters|r and |cRXP_ENEMY_Harvest Watchers|r. Loot them for |cRXP_LOOT_Silverleaf|r. It can also be picked up from |cRXP_PICK_Silverleaf|r on the ground. |cRXP_WARN_Anything left is finished later|r
    .complete 92109,3 --Silverleaf (5)
    .mob Harvest Golem
    .mob Defias Smuggler
    .mob Riverpaw Taskmaster
    .mob Harvest Watcher
step
    #label Along50
    #loop
    .goto 1436/0,1072.77,-10814.00,0
    .goto 1436/0,1072.77,-10814.00,40,0
    .goto 1436/0,945.37,-10202.20,40,0
    .goto 1436/0,930.67,-10363.90,40,0
    .goto 1436/0,834.07,-10568.07,40,0
    .goto 1436/0,627.57,-11086.53,40,0
    .goto 1436/0,760.22,-10999.27,40,0
    >>Pick up |cRXP_PICK_Peacebloom|r from the ground
    .complete 92109,2 --Peacebloom (5)
step
    .goto 1436/0,999.27,-10661.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy |cRXP_LOOT_Empty Vial|r from |cRXP_FRIENDLY_Gina MacGregor|r
    .complete 92109,1 --Empty Vial (5)
    .target Gina MacGregor
step
    #label Drop92910x6
    #loop
    .goto 1436/0,913.52,-10461.20,0
    .goto 1436/0,913.52,-10461.20,40,0
    .goto 1436/0,1130.87,-10354.57,40,0
    .goto 1436/0,1011.52,-10225.30,40,0
    .goto 1436/0,1126.32,-10122.87,40,0
    .goto 1436/0,884.12,-10052.63,40,0
    >>Kill |cRXP_ENEMY_Harvest Golems|r, |cRXP_ENEMY_Defias Smugglers|r, |cRXP_ENEMY_Riverpaw Taskmasters|r and |cRXP_ENEMY_Harvest Watchers|r. Loot them for |cRXP_LOOT_Silverleaf|r. It can also be picked up from |cRXP_PICK_Silverleaf|r on the ground
    >>Kill |cRXP_ENEMY_Harvest Golems|r, |cRXP_ENEMY_Harvest Watchers|r, |cRXP_ENEMY_Harvest Reapers|r and |cRXP_ENEMY_Rusty Harvest Golems|r. Loot them for |cRXP_LOOT_Flask of Oil|r
    .complete 92109,3 --Silverleaf (5)
    .complete 103,1 --Flask of Oil (5)
    .mob Harvest Golem
    .mob Defias Smuggler
    .mob Riverpaw Taskmaster
    .mob Harvest Watcher
    .mob Harvest Reaper
    .mob Rusty Harvest Golem
step
    #label Drop136x5
    #loop
    .goto 1436/0,1156.07,-9647.57,0
    .goto 1436/0,1156.07,-9647.57,40,0
    .goto 1436/0,1066.47,-9601.37,40,0
    >>Kill |cRXP_ENEMY_Murloc Tidehunters|r, |cRXP_ENEMY_Murloc Oracles|r, |cRXP_ENEMY_Murloc Minor Oracles|r and |cRXP_ENEMY_Murloc Netters|r. Loot them for |cRXP_LOOT_Murloc Eye|r
    .complete 92110,1 --Murloc Eye (3)
    .mob Murloc Tidehunter
    .mob Murloc Oracle
    .mob Murloc Minor Oracle
    .mob Murloc Netter
step
    #completewith next
    .hs >>Hearth to Innkeeper Heather's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1436/0,1179.87,-10635.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alba Fairmoon|r
    .accept 92748 >>Accept Explosive Consultation
    .target Alba Fairmoon
step
    .goto 1436/0,1509.92,-11100.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Odd Child|r
    .turnin 92110 >>Turn in My First Real Potion
    .turnin 92109 >>Turn in My First Alchemy Set
    .target Odd Child
step
    #completewith Along56
    >>As you go: Loot the |cRXP_PICK_Suspicious Crates|r for |cRXP_LOOT_Suspicious Industrial Supplies|r. |cRXP_WARN_Anything left is finished later|r
    .complete 92747,1 --Suspicious Industrial Supplies (8)
step
    #label Along56
    #loop
    .goto 1436/0,1526.37,-11013.97,0
    .goto 1436/0,1526.37,-11013.97,40,0
    .goto 1436/0,1470.72,-10991.33,40,0
    >>Kill |cRXP_ENEMY_Defias Pillagers|r
    .complete 13,1 --Defias Pillager slain (15)
    .mob Defias Pillager
    .isOnQuest 13
step
    #loop
    .goto 1436/0,1529.17,-11003.00,0
    .goto 1436/0,1529.17,-11003.00,40,0
    .goto 1436/0,1427.67,-11038.00,40,0
    >>Loot the |cRXP_PICK_Suspicious Crates|r for |cRXP_LOOT_Suspicious Industrial Supplies|r
    .complete 92747,1 --Suspicious Industrial Supplies (8)
step
    #completewith Drop136x6
    >>|cRXP_LOOT_Captain Sander's Treasure Map|r can drop from |cRXP_ENEMY_Murloc Coastrunner|r, |cRXP_ENEMY_Murloc Tidehunter|r, |cRXP_ENEMY_Murloc Warrior|r. Use it to start the quest if you get one
    .collect 1357,1,136 --Captain Sander's Treasure Map (1)
    .accept 136 >>Accept Captain Sander's Hidden Treasure
    .use 1357
step
    #completewith Drop136x6
    >>|cRXP_LOOT_Precessive Autocognition Assembly|r can drop from |cRXP_ENEMY_Harvest Golem|r, |cRXP_ENEMY_Harvest Watcher|r, |cRXP_ENEMY_Harvest Reaper|r. Use it to start the quest if you get one
    .collect 255155,1,92910 --Precessive Autocognition Assembly (1)
    .accept 92910 >>Accept Harvesting the Harvesters
    .use 255155
step
    #label Drop136x6
    #loop
    .goto 1436/0,1646.77,-10615.43,0
    .goto 1436/0,1646.77,-10615.43,40,0
    .goto 1436/0,1755.27,-10676.57,40,0
    >>Kill |cRXP_ENEMY_Harvest Golems|r, |cRXP_ENEMY_Harvest Watchers|r, |cRXP_ENEMY_Harvest Reapers|r and |cRXP_ENEMY_Murloc Hunters|r. Loot them for |cRXP_LOOT_Copper Modulator|r. It can also be picked up from |cRXP_PICK_Box of Assorted Parts|r on the ground
    .complete 92911,2 --Copper Modulator (4)
    .mob Harvest Golem
    .mob Harvest Watcher
    .mob Harvest Reaper
    .mob Murloc Hunter
    .isOnQuest 92911
step
    #loop
    .goto 1436/0,1978.92,-10580.20,0
    .goto 1436/0,1978.92,-10580.20,40,0
    .goto 1436/0,1939.72,-10477.77,40,0
    >>Kill |cRXP_ENEMY_Riverpaw Miners|r
    .complete 92745,2 --Riverpaw Miner slain (6)
    .mob Riverpaw Miner
    .isOnQuest 92745
step
    .goto 1436/0,2109.82,-10514.17
    >>Click the |cRXP_PICK_Captain's Footlocker|r
    .turnin 136 >>Turn in Captain Sander's Hidden Treasure
    .isOnQuest 136
step
    .goto 1436/0,2109.82,-10514.17
    >>Click the |cRXP_PICK_Captain's Footlocker|r
    .accept 138 >>Accept Captain Sander's Hidden Treasure
    .isQuestTurnedIn 136 --any of: Captain Sander's Hidden Treasure
    .xp <10,1
step
    .goto 1436/0,1966.32,-11407.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Grayson|r
    .turnin 103 >>Turn in Keeper of the Flame
    .target Captain Grayson
step
    .goto 1436/0,1662.87,-11353.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alba Fairmoon|r
    .accept 92819 >>Accept Destruction in Deadmines
    .target Alba Fairmoon
step
    .goto 1436/0,1662.87,-11353.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alba Fairmoon|r
    >>|cRXP_WARN_The database has no objectives for Destruction in Deadmines. Skip this step if the quest is not finished|r
    .turnin 92819 >>Turn in Destruction in Deadmines
    .target Alba Fairmoon
    .isOnQuest 92819
step
    .goto 1436/0,1598.47,-10515.10
    >>Click the |cRXP_PICK_Broken Barrel|r
    .turnin 138 >>Turn in Captain Sander's Hidden Treasure
    .isOnQuest 138
step
    .goto 1436/0,1598.47,-10515.10
    >>Click the |cRXP_PICK_Broken Barrel|r
    .accept 139 >>Accept Captain Sander's Hidden Treasure
    .isQuestTurnedIn 138 --any of: Captain Sander's Hidden Treasure
    .xp <10,1
step
    .goto 1436/0,1179.87,-10635.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alba Fairmoon|r
    .turnin 92745 >>Turn in The State of the Mines
    .target Alba Fairmoon
    .isOnQuest 92745
step
    .goto 1436/0,1179.87,-10635.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alba Fairmoon|r
    .turnin 92747 >>Turn in Moonbrook Espionage
    .target Alba Fairmoon
step
    .goto 1436/0,1045.12,-10508.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    .turnin 13 >>Turn in The People's Militia
    .target Gryan Stoutmantle
    .isOnQuest 13
step
    .goto 1436/0,1213.12,-10153.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ozwin Ironsprocket|r
    .turnin 92910 >>Turn in Harvesting the Harvesters
    .target Ozwin Ironsprocket
    .isOnQuest 92910
step
    .goto 1436/0,1213.12,-10153.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ozwin Ironsprocket|r
    .turnin 92911 >>Turn in Harvesting the Harvesters
    .target Ozwin Ironsprocket
    .isOnQuest 92911
step
    .goto 1436/0,1594.62,-9797.37
    >>Click the |cRXP_PICK_Old Jug|r
    .turnin 139 >>Turn in Captain Sander's Hidden Treasure
    .isOnQuest 139
step
    .goto 1436/0,1594.62,-9797.37
    >>Click the |cRXP_PICK_Old Jug|r
    .accept 140 >>Accept Captain Sander's Hidden Treasure
    .isQuestTurnedIn 139 --any of: Captain Sander's Hidden Treasure
    .xp <10,1
step
    .goto 1436/0,2107.72,-9794.57
    >>Click the |cRXP_PICK_Locked Chest|r
    .turnin 140 >>Turn in Captain Sander's Hidden Treasure
    .isOnQuest 140
step << Human Paladin/Dwarf Paladin
    .goto 1436/0,1557.52,-11482.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Daphne Stilwell|r
    .turnin 1650 >>Turn in The Tome of Valor
    .target Daphne Stilwell
    .isOnQuest 1650
step
    +|cRXP_WARN_That is all of Westfall for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Stormwind City|r: Continue to Stormwind << Human
    >>|cRXP_FRIENDLY_Stormwind City|r: Explosive Consultation
step
    +|cRXP_WARN_Suggested next zones at level 13|r: |cRXP_FRIENDLY_Darkshore|r (about 2.1 levels of quests, starting around Thundris Windweaver), |cRXP_FRIENDLY_Zephras Isle|r (about 1.3 levels of quests, starting around Elegael Thornpaw), |cRXP_FRIENDLY_Teldrassil|r (about 1.1 levels of quests, starting around Priestess A'moora). Completing this step loads the guide for Darkshore --RouteBuilder:next
step
    +|cRXP_WARN_The rest of Westfall is planned from level 16.|r Load its guide for level 16 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 10 - 23 Westfall
#subweight -10
#name 16-17 Westfall
--RouteBuilder:next
#next Zone Routes (Alliance)\10-15 Darkshore: around Thundris Windweaver;Zone Routes (Alliance)\11-15 Zephras Isle: around Elegael Thornpaw;Zone Routes (Alliance)\14-16 Loch Modan: around Marek Ironheart

step
    .goto 1436/0,1045.12,-10508.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    .accept 144 >>Accept Messenger to Westfall
    .target Gryan Stoutmantle
    .isQuestTurnedIn 143 --any of: Messenger to Westfall
    .xp <14,1
step
    .goto 1436/0,1045.12,-10508.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    .accept 142 >>Accept The Defias Brotherhood
    .target Gryan Stoutmantle
    .isQuestTurnedIn 141 --any of: The Defias Brotherhood
    .xp <14,1
step
    .goto 1436/0,1045.12,-10508.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    .accept 135 >>Accept The Defias Brotherhood
    .target Gryan Stoutmantle
    .isQuestTurnedIn 132 --any of: The Defias Brotherhood
    .xp <14,1
step
    .goto 1436/0,1045.12,-10508.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    .accept 65 >>Accept The Defias Brotherhood
    .target Gryan Stoutmantle
step
    .goto 1436/0,1438.17,-11017.70
    >>Kill |cRXP_ENEMY_Defias Messenger|r and loot |cRXP_LOOT_A Mysterious Message|r
    .complete 142,1 --A Mysterious Message (1)
    .mob Defias Messenger
    .isOnQuest 142
step
    .goto 1436/0,1045.12,-10508.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    .accept 14 >>Accept The People's Militia
    .target Gryan Stoutmantle
    .isQuestTurnedIn 13 --any of: The People's Militia
step
    .goto 1436/0,1045.12,-10508.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    .turnin 142 >>Turn in The Defias Brotherhood
    .target Gryan Stoutmantle
    .isOnQuest 142
step
    .goto 1436/0,1067.87,-10508.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_The Defias Traitor|r
    .accept 155 >>Accept The Defias Brotherhood
    .target The Defias Traitor
    .isQuestTurnedIn 142 --any of: The Defias Brotherhood
    .xp <14,1
step
    .goto 1436/0,1527.42,-11069.03
    >>Escort The Defias Traitor to discover where VanCleef is hiding
    .complete 155,1 --Escort The Defias Traitor to discover where VanCleef is hiding
    .isOnQuest 155
step
    .goto 1436/0,1713.62,-11157.70
    >>Kill |cRXP_ENEMY_Defias Knuckledusters|r
    .complete 14,3 --Defias Knuckleduster slain (5)
    .mob Defias Knuckleduster
    .isOnQuest 14
step
    .goto 1436/0,1722.02,-11155.13
    >>Kill |cRXP_ENEMY_Defias Pathstalkers|r
    .complete 14,2 --Defias Pathstalker slain (5)
    .mob Defias Pathstalker
    .isOnQuest 14
step
    .goto 1436/0,1966.32,-11407.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Grayson|r
    .accept 152 >>Accept The Coast Isn't Clear
    .target Captain Grayson
step
    .goto 1436/0,1662.87,-11353.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alba Fairmoon|r
    .turnin 92819 >>Turn in Destruction in Deadmines
    .target Alba Fairmoon
    .isOnQuest 92819
step
    #loop
    .goto 1436/0,1685.97,-11296.30,0
    .goto 1436/0,1685.97,-11296.30,40,0
    .goto 1436/0,1544.92,-11279.03,40,0
    >>Kill |cRXP_ENEMY_Defias Highwaymans|r
    .complete 14,1 --Defias Highwayman slain (8)
    .mob Defias Highwayman
    .isOnQuest 14
step
    .goto 1436/0,1045.12,-10508.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    .turnin 14 >>Turn in The People's Militia
    .target Gryan Stoutmantle
    .isOnQuest 14
step
    .goto 1436/0,1045.12,-10508.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryan Stoutmantle|r
    .turnin 155 >>Turn in The Defias Brotherhood
    .target Gryan Stoutmantle
    .isOnQuest 155
step
    #loop
    .goto 1436/0,909.67,-10411.27,0
    .goto 1436/0,909.67,-10411.27,40,0
    .goto 1436/0,1202.97,-10658.60,40,0
    .goto 1436/0,1759.82,-11187.10,40,0
    .goto 1436/0,1878.82,-11074.87,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mouse|r. |cRXP_WARN_This NPC walks a patrol route|r
    .accept 93928 >>Accept Of Mice and Milk
    .unitscan Mouse
step
    #loop
    .goto 1436/0,1066.47,-9608.83,0
    .goto 1436/0,1066.47,-9608.83,40,0
    .goto 1436/0,1157.12,-9606.73,40,0
    >>Kill |cRXP_ENEMY_Murloc Coastrunners|r
    .complete 152,1 --Murloc Coastrunner slain (7)
    .mob Murloc Coastrunner
step
    .goto 1436/0,1708.02,-10580.20
    >>Click the |cRXP_PICK_Burned-Out Remains|r
    .accept 79008 >>Accept ... and that note you found
    .accept 79192 >>Accept Stepping Stones
step
    .goto 1436/0,2142.02,-10540.53
    >>Kill |cRXP_ENEMY_Murloc Warriors|r
    .complete 152,2 --Murloc Warrior slain (7)
    .mob Murloc Warrior
step
    #loop
    .goto 1436/0,2053.12,-10651.60,0
    .goto 1436/0,2053.12,-10651.60,40,0
    .goto 1436/0,2078.32,-10787.40,40,0
    >>Kill |cRXP_ENEMY_Murloc Oracles|r
    .complete 152,4 --Murloc Oracle slain (7)
    .mob Murloc Oracle
step
    #loop
    .goto 1436/0,2069.57,-11073.70,0
    .goto 1436/0,2069.57,-11073.70,40,0
    .goto 1436/0,2084.62,-11122.93,40,0
    >>Kill |cRXP_ENEMY_Murloc Tidehunters|r
    .complete 152,3 --Murloc Tidehunter slain (7)
    .mob Murloc Tidehunter
step
    .goto 1436/0,1966.32,-11407.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Grayson|r
    .turnin 152 >>Turn in The Coast Isn't Clear
    .target Captain Grayson
step
    +|cRXP_WARN_That is all of Westfall for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Redridge Mountains|r: Messenger to Westfall, The Defias Brotherhood
    >>|cRXP_FRIENDLY_Stonetalon Mountains|r: Stepping Stones
    >>|cRXP_FRIENDLY_Stormwind City|r: The Defias Brotherhood
    >>|cRXP_FRIENDLY_Stranglethorn Vale|r: Of Mice and Milk
    >>|cRXP_FRIENDLY_The Barrens|r: ... and that note you found
step
    +|cRXP_WARN_Suggested next zones at level 16|r: |cRXP_FRIENDLY_Darkshore|r (about 1.6 levels of quests, starting around Thundris Windweaver), |cRXP_FRIENDLY_Zephras Isle|r (about 0.9 levels of quests, starting around Elegael Thornpaw), |cRXP_FRIENDLY_Loch Modan|r (about 0.7 levels of quests, starting around Marek Ironheart). Completing this step loads the guide for Darkshore --RouteBuilder:next
step
    +|cRXP_WARN_The rest of Westfall is planned from level 19.|r Load its guide for level 19 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 10 - 23 Westfall
#subweight -10
#name 19-20 Westfall
--RouteBuilder:next
#next Zone Routes (Alliance)\17-19 Darkshore: around Archaeologist Hollee;Zone Routes (Alliance)\20-21 Wetlands: around Karl Boran

step
    .goto 1436/0,1427.67,-11042.67
    >>Click the |cRXP_PICK_Spellbook|r
    .accept 78142 >>Accept Bewitchments and Glamours
step
    .goto 1436/0,1427.67,-11042.67
    >>Open the |cRXP_PICK_Spellbook|r. Loot it for |cRXP_LOOT_Bewitchments and Glamours|r
    .complete 78142,1 --Bewitchments and Glamours (1)
step
    .goto 1436/0,1172.17,-10655.33
    >>Click the |cRXP_PICK_Gnomish Tome|r
    .accept 79093 >>Accept Rumi of Gnomeregan: The Collected Works
step
    .goto 1436/0,1172.17,-10655.33
    >>Open the |cRXP_PICK_Gnomish Tome|r. Loot it for |cRXP_LOOT_Rumi of Gnomeregan: The Collected Works|r
    .complete 79093,1 --Rumi of Gnomeregan: The Collected Works (1)
step
    .goto 1436/0,1662.87,-11353.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alba Fairmoon|r
    .turnin 92819 >>Turn in Destruction in Deadmines
    .target Alba Fairmoon
    .isOnQuest 92819
step
    .goto 1436/0,1966.32,-11407.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Grayson|r
    .accept 104 >>Accept The Coastal Menace
    .target Captain Grayson
step
    .goto 1436/0,1992.22,-11172.17
    >>Kill |cRXP_ENEMY_Old Murk-Eye|r and loot |cRXP_LOOT_Scale of Old Murk-Eye|r
    .complete 104,1 --Scale of Old Murk-Eye (1)
    .mob Old Murk-Eye
step
    .goto 1436/0,1966.32,-11407.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Grayson|r
    .turnin 104 >>Turn in The Coastal Menace
    .target Captain Grayson
step
    +|cRXP_WARN_That is all of Westfall for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Undercity|r: Bewitchments and Glamours, Rumi of Gnomeregan: The Collected Works
step
    +|cRXP_WARN_Suggested next zones at level 19|r: |cRXP_FRIENDLY_Darkshore|r (about 0.8 levels of quests, starting around Archaeologist Hollee), |cRXP_FRIENDLY_Wetlands|r (about 0.7 levels of quests, starting around Karl Boran). Completing this step loads the guide for Darkshore --RouteBuilder:next
step << Shaman
    +|cRXP_WARN_The rest of Westfall is planned from level 22.|r Load its guide for level 22 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Shaman
#version 1
#group Zone Routes (Alliance)
#subgroup 10 - 23 Westfall
#subweight -10
#name 22-23 Westfall
--RouteBuilder:next
#next Zone Routes (Alliance)\20-21 Wetlands: around Karl Boran

step << Shaman
    .goto 1436/0,1421.72,-10797.20
    >>Click the |cRXP_PICK_Forgotten Shrine|r
    .accept 94503 >>Accept Call of Water
step
    .goto 1436/0,1662.87,-11353.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alba Fairmoon|r
    .turnin 92819 >>Turn in Destruction in Deadmines
    .target Alba Fairmoon
    .isOnQuest 92819
step << Rogue
    .goto 1436/0,619.52,-11035.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Agent Kearnen|r
    .accept 2359 >>Accept Klaven's Tower
    .target Agent Kearnen
    .isQuestTurnedIn 2360 --any of: Mathias and the Defias
    .xp <20,1
step << Rogue
    .goto 1436/0,585.22,-11126.43
    >>Kill |cRXP_ENEMY_Malformed Defias Drone|r and loot |cRXP_LOOT_Defias Tower Key|r
    .complete 2359,2 --Defias Tower Key (1)
    .mob Malformed Defias Drone
    .isOnQuest 2359
step << Rogue
    .goto 1436/0,552.32,-11125.03
    >>Open the |cRXP_PICK_Duskwood Chest|r. Loot it for |cRXP_LOOT_Klaven Mortwake's Journal|r
    .complete 2359,1 --Klaven Mortwake's Journal (1)
    .isOnQuest 2359
step
    +|cRXP_WARN_End of the Westfall route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Silverpine Forest|r: Call of Water << Shaman
    >>|cRXP_FRIENDLY_Stormwind City|r: Klaven's Tower << Rogue
step
    +|cRXP_WARN_Suggested next zones at level 22|r: |cRXP_FRIENDLY_Wetlands|r (about 0.5 levels of quests, starting around Karl Boran). Completing this step loads the guide for Wetlands --RouteBuilder:next
]])
