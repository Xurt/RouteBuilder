-- 35-45 Badlands: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 3 parts with a level check between them (from level 35, 38, 41).
-- Edit zones/Badlands.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#name 35-45 Badlands

step
    .goto 1418/0,-3407.99,-6609.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Ryedol|r
    .accept 719 >>Accept A Dwarf and His Tools
    .target Prospector Ryedol
step
    .goto 1418/0,-3417.44,-6607.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sigrun Ironhew|r
    .accept 718 >>Accept Mirages
    .target Sigrun Ironhew
step
    #completewith Drop635x1
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Dustbelcher Ogre|r, |cRXP_ENEMY_Dustbelcher Brute|r, |cRXP_ENEMY_Dustbelcher Wyrmhunter|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #label Drop635x1
    #loop
    .goto 1418/0,-3404.76,-6458.56,0
    .goto 1418/0,-3404.76,-6458.56,40,0
    .goto 1418/0,-3408.24,-6444.13,40,0
    .goto 1418/0,-3435.35,-6451.59,40,0
    .goto 1418/0,-3435.35,-6410.63,40,0
    .goto 1418/0,-3411.97,-6404.99,40,0
    .goto 1418/0,-3369.93,-6416.77,40,0
    .goto 1418/0,-3359.48,-6458.39,40,0
    >>Kill |cRXP_ENEMY_Shadowforge Tunnelers|r, |cRXP_ENEMY_Shadowforge Darkweavers|r, |cRXP_ENEMY_Shadowforge Chanters|r and |cRXP_ENEMY_Shadowforge Warriors|r. Loot them for |cRXP_LOOT_Ryedol's Lucky Pick|r
    .complete 719,1 --Ryedol's Lucky Pick (1)
    .mob Shadowforge Tunneler
    .mob Shadowforge Darkweaver
    .mob Shadowforge Chanter
    .mob Shadowforge Warrior
step
    .goto 1418/0,-3398.29,-6452.42
    >>Click the |cRXP_PICK_Crumpled Map|r
    .accept 720 >>Accept A Sign of Hope
step
    .goto 1418/0,-3735.84,-6254.42
    >>Open the |cRXP_PICK_Excavation Supply Crate|r. Loot it for |cRXP_LOOT_Supply Crate|r
    .complete 718,1 --Supply Crate (1)
step
    .goto 1418/0,-3417.44,-6607.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sigrun Ironhew|r
    .turnin 718 >>Turn in Mirages
    .accept 733 >>Accept Scrounging
    .target Sigrun Ironhew
step
    .goto 1418/0,-3407.99,-6609.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Ryedol|r
    .turnin 719 >>Turn in A Dwarf and His Tools
    .turnin 720 >>Turn in A Sign of Hope
    .target Prospector Ryedol
step
    .goto 1418/0,-3407.99,-6609.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Ryedol|r
    .accept 721 >>Accept A Sign of Hope
    .target Prospector Ryedol
    .xp <35,1
step
    .goto 1418/0,-3345.06,-6924.38
    >>Click the |cRXP_PICK_Battered Dwarven Skeleton|r
    .turnin 738 >>Turn in Find Agmond
    .isOnQuest 738
step
    #completewith Drop635x2
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Dustbelcher Ogre|r, |cRXP_ENEMY_Dustbelcher Brute|r, |cRXP_ENEMY_Dustbelcher Wyrmhunter|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #label Drop635x2
    #loop
    .goto 1418/0,-2419.71,-7118.08,0
    .goto 1418/0,-2419.71,-7118.08,40,0
    .goto 1418/0,-2343.09,-7115.75,40,0
    .goto 1418/0,-2278.66,-7088.39,40,0
    .goto 1418/0,-2281.90,-7186.57,40,0
    .goto 1418/0,-2278.17,-7250.08,40,0
    .goto 1418/0,-2326.42,-7248.75,40,0
    .goto 1418/0,-2352.29,-7218.41,40,0
    .goto 1418/0,-2342.59,-7176.95,40,0
    .goto 1418/0,-2313.74,-7144.28,40,0
    >>Kill |cRXP_ENEMY_Dustbelcher Ogres|r, |cRXP_ENEMY_Dustbelcher Brutes|r, |cRXP_ENEMY_Dustbelcher Wyrmhunters|r and |cRXP_ENEMY_Dustbelcher Maulers|r. Loot them for |cRXP_LOOT_Scrap Metal|r
    .complete 733,1 --Scrap Metal (1)
    .mob Dustbelcher Ogre
    .mob Dustbelcher Brute
    .mob Dustbelcher Wyrmhunter
    .mob Dustbelcher Mauler
step
    .goto 1418/0,-3135.61,-6760.21
    >>Talk to |cRXP_FRIENDLY_Jazzrik|r
    .vendor 9179 >> Vendor Trash. Repair
    .target Jazzrik
step
    .goto 1418/0,-3133.62,-6767.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rigglefuzz|r
    .accept 2418 >>Accept Power Stones
    .accept 703 >>Accept Barbecued Buzzard Wings
    .target Rigglefuzz
step
    .goto 1418/0,-3417.44,-6607.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sigrun Ironhew|r
    .turnin 733 >>Turn in Scrounging
    .target Sigrun Ironhew
step
    .goto 1418/0,-3407.99,-6609.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Ryedol|r
    .accept 721 >>Accept A Sign of Hope
    .target Prospector Ryedol
    .xp <35,1
step
    #completewith Drop635x3
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Dustbelcher Ogre|r, |cRXP_ENEMY_Dustbelcher Brute|r, |cRXP_ENEMY_Dustbelcher Wyrmhunter|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #label Drop635x3
    #loop
    .goto 1418/0,-3382.62,-6247.78,0
    .goto 1418/0,-3382.62,-6247.78,40,0
    .goto 1418/0,-3367.69,-6201.35,40,0
    .goto 1418/0,-3337.84,-6135.02,40,0
    .goto 1418/0,-3337.84,-6065.37,40,0
    .goto 1418/0,-3352.77,-6095.22,40,0
    .goto 1418/0,-3372.67,-6154.92,40,0
    .goto 1418/0,-3402.52,-6191.40,40,0
    .goto 1418/0,-3447.29,-6171.50,40,0
    .goto 1418/0,-3432.37,-6241.15,40,0
    >>Kill |cRXP_ENEMY_Shadowforge Surveyors|r, |cRXP_ENEMY_Shadowforge Ruffians|r and |cRXP_ENEMY_Shadowforge Diggers|r. Loot them for |cRXP_LOOT_Dentrium Power Stone|r
    >>Kill |cRXP_ENEMY_Shadowforge Surveyors|r, |cRXP_ENEMY_Shadowforge Ruffians|r and |cRXP_ENEMY_Shadowforge Diggers|r. Loot them for |cRXP_LOOT_An'Alleum Power Stone|r
    .complete 2418,1 --Dentrium Power Stone (8)
    .complete 2418,2 --An'Alleum Power Stone (8)
    .mob Shadowforge Surveyor
    .mob Shadowforge Ruffian
    .mob Shadowforge Digger
step
    .goto 1418/0,-3133.62,-6767.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rigglefuzz|r
    .turnin 2418 >>Turn in Power Stones
    .accept 705 >>Accept Pearl Diving
    .target Rigglefuzz
step
    .goto 1418/0,-3129.39,-6763.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Martek the Exiled|r
    .turnin 1106 >>Turn in Martek the Exiled
    .target Martek the Exiled
    .isOnQuest 1106
step
    .goto 1418/0,-3357.49,-7164.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Theldurin the Lost|r
    .turnin 737 >>Turn in Forbidden Knowledge
    .target Theldurin the Lost
    .isOnQuest 737
step
    .goto 1418/0,-3357.49,-7164.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Theldurin the Lost|r
    .turnin 687 >>Turn in Theldurin the Lost
    .target Theldurin the Lost
    .isOnQuest 687
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .accept 713 >>Accept Coolant Heads Prevail
    .target Lotwil Veriatus
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .turnin 713 >>Turn in Coolant Heads Prevail
    .target Lotwil Veriatus
    .isQuestComplete 713
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .accept 714 >>Accept Gyro... What?
    .target Lotwil Veriatus
    .isQuestTurnedIn 713 --any of: Coolant Heads Prevail
    .xp <35,1
step
    .goto 1418/0,-3653.01,-6787.07
    >>Kill |cRXP_ENEMY_Starving Buzzards|r, |cRXP_ENEMY_Buzzards|r, |cRXP_ENEMY_Giant Buzzards|r and |cRXP_ENEMY_Zaricotls|r. Loot them for |cRXP_LOOT_Buzzard Wing|r
    .complete 703,1 --Buzzard Wing (4)
    .mob Starving Buzzard
    .mob Buzzard
    .mob Giant Buzzard
    .mob Zaricotl
step
    .goto 1418/0,-3133.62,-6767.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rigglefuzz|r
    .turnin 703 >>Turn in Barbecued Buzzard Wings
    .target Rigglefuzz
step
    .goto 1418/0,-3133.62,-6767.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rigglefuzz|r
    .turnin 705 >>Turn in Pearl Diving
    .target Rigglefuzz
    .isQuestComplete 705
step
    .goto 1418/0,-2721.44,-6623.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lucien Tosselwrench|r
    .accept 715 >>Accept Liquid Stone
    .target Lucien Tosselwrench
    .isQuestTurnedIn 714 --any of: Gyro... What?
    .xp <35,1
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .turnin 714 >>Turn in Gyro... What?
    .target Lotwil Veriatus
    .isQuestComplete 714
step
    .goto 1418/0,-2721.44,-6623.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lucien Tosselwrench|r
    .turnin 715 >>Turn in Liquid Stone
    .target Lucien Tosselwrench
    .isQuestComplete 715
step
    .goto 1418/0,-3407.99,-6609.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Ryedol|r
    .accept 721 >>Accept A Sign of Hope
    .target Prospector Ryedol
step
    #completewith Drop635x4
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Dustbelcher Ogre|r, |cRXP_ENEMY_Dustbelcher Brute|r, |cRXP_ENEMY_Dustbelcher Wyrmhunter|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #label Drop635x4
    #loop
    .goto 1418/0,-3404.76,-6458.56,0
    .goto 1418/0,-3404.76,-6458.56,40,0
    .goto 1418/0,-3359.48,-6458.39,40,0
    .goto 1418/0,-3387.34,-6448.28,40,0
    .goto 1418/0,-3411.97,-6404.99,40,0
    .goto 1418/0,-3416.45,-6425.39,40,0
    >>Kill |cRXP_ENEMY_Dustbelcher Ogres|r, |cRXP_ENEMY_Dustbelcher Brutes|r, |cRXP_ENEMY_Dustbelcher Maulers|r and |cRXP_ENEMY_Dustbelcher Shamans|r. Loot them for |cRXP_LOOT_Healing Potion|r
    .complete 715,1 --Healing Potion (1)
    .mob Dustbelcher Ogre
    .mob Dustbelcher Brute
    .mob Dustbelcher Mauler
    .mob Dustbelcher Shaman
    .isOnQuest 715
step
    .goto 1418/0,-3021.93,-6065.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hammertoe Grez|r
    .turnin 721 >>Turn in A Sign of Hope
    .target Hammertoe Grez
step
    +|cRXP_WARN_That is all of Badlands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Arathi Highlands|r: Crystal in the Mountains
    >>|cRXP_FRIENDLY_Stranglethorn Vale and back here|r: Pearl Diving
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Coolant Heads Prevail
step
    .xp 38 >>|cRXP_WARN_The rest of Badlands is planned from level 38.|r Come back to this guide then
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .accept 710 >>Accept Study of the Elements: Rock
    .target Lotwil Veriatus
step
    #loop
    .goto 1418/0,-2653.78,-6681.44,0
    .goto 1418/0,-2653.78,-6681.44,40,0
    .goto 1418/0,-2636.86,-6613.61,40,0
    .goto 1418/0,-2487.37,-6512.45,40,0
    .goto 1418/0,-2410.50,-6519.25,40,0
    .goto 1418/0,-2445.82,-6582.77,40,0
    .goto 1418/0,-2497.07,-6598.35,40,0
    .goto 1418/0,-2547.07,-6602.50,40,0
    .goto 1418/0,-2554.03,-6648.27,40,0
    .goto 1418/0,-2580.40,-6684.59,40,0
    >>Kill |cRXP_ENEMY_Lesser Rock Elementals|r. Loot them for |cRXP_LOOT_Small Stone Shard|r
    .complete 710,1 --Small Stone Shard (10)
    .mob Lesser Rock Elemental
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .turnin 710 >>Turn in Study of the Elements: Rock
    .accept 711 >>Accept Study of the Elements: Rock
    .target Lotwil Veriatus
step
    #loop
    .goto 1418/0,-2491.10,-6489.07,0
    .goto 1418/0,-2491.10,-6489.07,40,0
    .goto 1418/0,-2453.29,-6474.81,40,0
    .goto 1418/0,-2423.93,-6491.23,40,0
    .goto 1418/0,-2377.17,-6457.89,40,0
    .goto 1418/0,-2413.49,-6443.96,40,0
    .goto 1418/0,-2465.23,-6423.73,40,0
    >>Kill |cRXP_ENEMY_Rock Elementals|r. Loot them for |cRXP_LOOT_Large Stone Slab|r
    .complete 711,1 --Large Stone Slab (3)
    .mob Rock Elemental
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .turnin 711 >>Turn in Study of the Elements: Rock
    .target Lotwil Veriatus
step
    .goto 1418/0,-3129.39,-6763.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Martek the Exiled|r
    .accept 1108 >>Accept Indurium
    .target Martek the Exiled
    .isQuestTurnedIn 1106 --any of: Martek the Exiled
    .xp <28,1
step
    .goto 1418/0,-3133.62,-6767.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rigglefuzz|r
    .turnin 705 >>Turn in Pearl Diving
    .target Rigglefuzz
    .isQuestComplete 705
step
    #loop
    .goto 1418/0,-3314.46,-6956.06,0
    .goto 1418/0,-3314.46,-6956.06,40,0
    .goto 1418/0,-3345.80,-6956.89,40,0
    .goto 1418/0,-3348.04,-6985.58,40,0
    .goto 1418/0,-3384.11,-6983.42,40,0
    .goto 1418/0,-3384.61,-7043.95,40,0
    .goto 1418/0,-3352.27,-7077.78,40,0
    .goto 1418/0,-3291.08,-7082.42,40,0
    .goto 1418/0,-3255.75,-7048.59,40,0
    .goto 1418/0,-3320.18,-7023.55,40,0
    >>Kill |cRXP_ENEMY_Stonevault Bashers|r, |cRXP_ENEMY_Stonevault Shamans|r, |cRXP_ENEMY_Stonevault Bonesnappers|r and |cRXP_ENEMY_Stonevault Seers|r. Loot them for |cRXP_LOOT_Indurium Flake|r
    .complete 1108,1 --Indurium Flake (10)
    .mob Stonevault Basher
    .mob Stonevault Shaman
    .mob Stonevault Bonesnapper
    .mob Stonevault Seer
    .isOnQuest 1108
step
    .goto 1418/0,-3129.39,-6763.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Martek the Exiled|r
    .turnin 1108 >>Turn in Indurium
    .target Martek the Exiled
    .isOnQuest 1108
step
    .goto 1418/0,-3129.39,-6763.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Martek the Exiled|r
    .accept 1137 >>Accept News for Fizzle
    .target Martek the Exiled
    .isQuestTurnedIn 1108 --any of: Indurium
    .xp <28,1
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .turnin 713 >>Turn in Coolant Heads Prevail
    .target Lotwil Veriatus
    .isQuestComplete 713
step
    .goto 1418/0,-3357.49,-7164.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Theldurin the Lost|r
    .accept 709 >>Accept Solution to Doom
    .target Theldurin the Lost
step
    .goto 1418/0,-3021.93,-6065.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hammertoe Grez|r
    .accept 722 >>Accept Amulet of Secrets
    .target Hammertoe Grez
step
    .goto 1418/0,-3057.75,-6201.68
    >>Kill |cRXP_ENEMY_Magregan Deepshadow|r and loot |cRXP_LOOT_Hammertoe's Amulet|r
    >>Open the |cRXP_PICK_Ancient Chest|r. Loot it for |cRXP_LOOT_Tablet of Ryun'eh|r
    .complete 722,1 --Hammertoe's Amulet (1)
    .complete 709,1 --Tablet of Ryun'eh (1)
    .mob Magregan Deepshadow
step
    .goto 1418/0,-3021.93,-6065.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hammertoe Grez|r
    .turnin 722 >>Turn in Amulet of Secrets
    .accept 723 >>Accept Prospect of Faith
    .target Hammertoe Grez
step
    .goto 1418/0,-3357.49,-7164.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Theldurin the Lost|r
    .turnin 709 >>Turn in Solution to Doom
    .accept 727 >>Accept To Ironforge for Yagyin's Digest
    .target Theldurin the Lost
step
    .goto 1418/0,-3407.99,-6609.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Ryedol|r
    .turnin 723 >>Turn in Prospect of Faith
    .accept 724 >>Accept Prospect of Faith
    .target Prospector Ryedol
step
    +|cRXP_WARN_That is all of Badlands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Ironforge|r: Prospect of Faith, To Ironforge for Yagyin's Digest
    >>|cRXP_FRIENDLY_Thousand Needles|r: News for Fizzle
step
    .xp 41 >>|cRXP_WARN_The rest of Badlands is planned from level 41.|r Come back to this guide then
step
    .goto 1418/0,-3619.92,-6789.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garek|r
    .accept 732 >>Accept Tremors of the Earth
    .target Garek
step
    .goto 1418/0,-3345.06,-6924.38
    >>Click the |cRXP_PICK_Battered Dwarven Skeleton|r
    .accept 739 >>Accept Murdaloc
    .isQuestTurnedIn 738 --any of: Find Agmond
    .xp <30,1
step
    #loop
    .goto 1418/0,-3345.80,-6956.89,0
    .goto 1418/0,-3345.80,-6956.89,40,0
    .goto 1418/0,-3314.46,-6956.06,40,0
    .goto 1418/0,-3255.75,-7048.59,40,0
    .goto 1418/0,-3291.08,-7082.42,40,0
    .goto 1418/0,-3352.27,-7077.78,40,0
    .goto 1418/0,-3384.61,-7043.95,40,0
    .goto 1418/0,-3356.50,-7045.77,40,0
    .goto 1418/0,-3327.15,-7002.66,40,0
    .goto 1418/0,-3384.11,-6983.42,40,0
    >>Kill |cRXP_ENEMY_Stonevault Bonesnappers|r
    .complete 739,2 --Stonevault Bonesnapper slain (12)
    .mob Stonevault Bonesnapper
    .isOnQuest 739
step
    .goto 1418/0,-3313.71,-6989.22
    >>Kill |cRXP_ENEMY_Murdaloc|r
    .complete 739,1 --Murdaloc slain (1)
    .mob Murdaloc
    .isOnQuest 739
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .accept 712 >>Accept Study of the Elements: Rock
    .target Lotwil Veriatus
step
    #loop
    .goto 1418/0,-2244.59,-7114.26,0
    .goto 1418/0,-2244.59,-7114.26,40,0
    .goto 1418/0,-2215.48,-7165.67,40,0
    .goto 1418/0,-2181.40,-7214.76,40,0
    .goto 1418/0,-2148.07,-7186.73,40,0
    .goto 1418/0,-2114.99,-7219.23,40,0
    .goto 1418/0,-2118.22,-7291.04,40,0
    .goto 1418/0,-2150.81,-7252.40,40,0
    .goto 1418/0,-2201.80,-7277.94,40,0
    .goto 1418/0,-2251.80,-7218.74,40,0
    >>Kill |cRXP_ENEMY_Greater Rock Elementals|r. Loot them for |cRXP_LOOT_Bracers of Rock Binding|r
    .complete 712,1 --Bracers of Rock Binding (5)
    .mob Greater Rock Elemental
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .turnin 712 >>Turn in Study of the Elements: Rock
    .target Lotwil Veriatus
step
    .goto 1418/0,-2393.09,-7141.46
    >>Kill |cRXP_ENEMY_Boss Tho'grun|r and loot |cRXP_LOOT_Sign of the Earth|r
    .complete 732,1 --Sign of the Earth (1)
    .mob Boss Tho'grun
step
    .goto 1418/0,-3619.92,-6789.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garek|r
    .turnin 732 >>Turn in Tremors of the Earth
    .target Garek
step
    .goto 1418/0,-3417.44,-6607.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sigrun Ironhew|r
    .accept 706 >>Accept Fiery Blaze Enchantments
    .target Sigrun Ironhew
step
    .goto 1418/0,-3133.62,-6767.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rigglefuzz|r
    .turnin 705 >>Turn in Pearl Diving
    .target Rigglefuzz
    .isQuestComplete 705
step
    #loop
    .goto 1418/0,-4104.99,-6431.19,0
    .goto 1418/0,-4104.99,-6431.19,40,0
    .goto 1418/0,-4103.99,-6398.86,40,0
    .goto 1418/0,-4182.10,-6363.87,40,0
    .goto 1418/0,-4210.95,-6350.77,40,0
    .goto 1418/0,-4211.70,-6363.04,40,0
    .goto 1418/0,-4161.45,-6395.54,40,0
    .goto 1418/0,-4150.01,-6447.94,40,0
    .goto 1418/0,-4129.36,-6462.70,40,0
    >>Kill |cRXP_ENEMY_Scalding Whelps|r and |cRXP_ENEMY_Scorched Guardians|r. Loot them for |cRXP_LOOT_Black Drake's Heart|r
    .complete 706,1 --Black Drake's Heart (1)
    .mob Scalding Whelp
    .mob Scorched Guardian
step
    .goto 1418/0,-3357.49,-7164.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Theldurin the Lost|r
    .accept 692 >>Accept The Lost Fragments
    .target Theldurin the Lost
    .isQuestTurnedIn 687 --any of: Theldurin the Lost
    .xp <30,1
step
    #loop
    .goto 1418/0,-3435.35,-7248.59,0
    .goto 1418/0,-3435.35,-7248.59,40,0
    .goto 1418/0,-3473.41,-7262.02,40,0
    .goto 1418/0,-3485.85,-7276.61,40,0
    .goto 1418/0,-3473.41,-7283.08,40,0
    .goto 1418/0,-3454.51,-7309.28,40,0
    .goto 1418/0,-3461.47,-7335.82,40,0
    .goto 1418/0,-3427.89,-7308.62,40,0
    .goto 1418/0,-3387.34,-7308.29,40,0
    .goto 1418/0,-3419.18,-7281.09,40,0
    >>Kill |cRXP_ENEMY_Enraged Rock Elemental|r and loot |cRXP_LOOT_Torn Scroll Fragment|r
    .complete 692,1 --Torn Scroll Fragment (1)
    .mob Enraged Rock Elemental
    .isOnQuest 692
step
    #loop
    .goto 1418/0,-3419.18,-7281.09,0
    .goto 1418/0,-3419.18,-7281.09,40,0
    .goto 1418/0,-3435.35,-7248.59,40,0
    .goto 1418/0,-3473.41,-7262.02,40,0
    .goto 1418/0,-3485.85,-7276.61,40,0
    .goto 1418/0,-3473.41,-7283.08,40,0
    .goto 1418/0,-3454.51,-7309.28,40,0
    .goto 1418/0,-3461.47,-7335.82,40,0
    .goto 1418/0,-3427.89,-7308.62,40,0
    .goto 1418/0,-3387.34,-7308.29,40,0
    >>Kill |cRXP_ENEMY_Enraged Rock Elemental|r and loot |cRXP_LOOT_Crumpled Scroll Fragment|r
    .complete 692,2 --Crumpled Scroll Fragment (1)
    .mob Enraged Rock Elemental
    .isOnQuest 692
step
    #loop
    .goto 1418/0,-3419.18,-7281.09,0
    .goto 1418/0,-3419.18,-7281.09,40,0
    .goto 1418/0,-3435.35,-7248.59,40,0
    .goto 1418/0,-3473.41,-7262.02,40,0
    .goto 1418/0,-3485.85,-7276.61,40,0
    .goto 1418/0,-3473.41,-7283.08,40,0
    .goto 1418/0,-3454.51,-7309.28,40,0
    .goto 1418/0,-3461.47,-7335.82,40,0
    .goto 1418/0,-3427.89,-7308.62,40,0
    .goto 1418/0,-3387.34,-7308.29,40,0
    >>Kill |cRXP_ENEMY_Enraged Rock Elemental|r and loot |cRXP_LOOT_Singed Scroll Fragment|r
    .complete 692,3 --Singed Scroll Fragment (1)
    .mob Enraged Rock Elemental
    .isOnQuest 692
step
    .goto 1418/0,-3357.49,-7164.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Theldurin the Lost|r
    .turnin 692 >>Turn in The Lost Fragments
    .target Theldurin the Lost
    .isOnQuest 692
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .turnin 713 >>Turn in Coolant Heads Prevail
    .target Lotwil Veriatus
    .isQuestComplete 713
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .accept 734 >>Accept This Is Going to Be Hard
    .target Lotwil Veriatus
    .isQuestTurnedIn 714 --Gyro... What?
    .xp <35,1
step
    .goto 1418/0,-2721.44,-6623.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lucien Tosselwrench|r
    .turnin 734 >>Turn in This Is Going to Be Hard
    .target Lucien Tosselwrench
    .isOnQuest 734
step
    .goto 1418/0,-2721.44,-6623.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lucien Tosselwrench|r
    .accept 777 >>Accept This Is Going to Be Hard
    .target Lucien Tosselwrench
    .isQuestTurnedIn 734 --any of: This Is Going to Be Hard
    .xp <35,1
step
    .goto 1418/0,-2721.44,-6623.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lucien Tosselwrench|r
    .accept 716 >>Accept Stone Is Better than Cloth
    .target Lucien Tosselwrench
step
    .goto 1418/0,-2721.44,-6623.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lucien Tosselwrench|r
    .turnin 716 >>Turn in Stone Is Better than Cloth
    .target Lucien Tosselwrench
    .isQuestComplete 716
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .turnin 777 >>Turn in This Is Going to Be Hard
    .target Lotwil Veriatus
    .isOnQuest 777
step
    .goto 1418/0,-3417.44,-6607.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sigrun Ironhew|r
    .turnin 706 >>Turn in Fiery Blaze Enchantments
    .target Sigrun Ironhew
step
    +|cRXP_WARN_End of the Badlands route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Loch Modan|r: Murdaloc
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Stone Is Better than Cloth
]])
