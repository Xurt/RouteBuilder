-- 50-56 Un'Goro Crater: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 3 parts with a level check between them (from level 50, 53, 56).
-- Edit zones/Un'Goro Crater.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#name 50-56 Un'Goro Crater

step << Druid
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .turnin 9063 >>Turn in Torwa Pathfinder
    .target Torwa Pathfinder
    .isOnQuest 9063
step << Druid
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .accept 9052 >>Accept Bloodpetal Poison
    .target Torwa Pathfinder
step
    .goto 1449/1,-1055.45,-6204.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Muigin|r
    .accept 4141 >>Accept Muigin and Larion
    .target Muigin
step
    .goto 1449/1,-1055.45,-6204.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Muigin|r
    .turnin 4143 >>Turn in Haze of Evil
    .target Muigin
    .isQuestComplete 4143
step
    .goto 1449/1,-1055.45,-6204.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Muigin|r
    .accept 4144 >>Accept Bloodpetal Sprouts
    .target Muigin
    .isQuestTurnedIn 4143 --any of: Haze of Evil
    .xp <47,1
step
    .goto 1449/1,-1119.09,-6166.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Linken|r
    .turnin 3914 >>Turn in Linken's Sword
    .target Linken
    .isOnQuest 3914
step
    .goto 1449/1,-1119.09,-6166.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Linken|r
    .accept 3941 >>Accept A Gnome's Assistance
    .target Linken
    .isQuestTurnedIn 3914 --any of: Linken's Sword
    .xp <47,1
step
    #completewith Drop3884x1
    >>|cRXP_LOOT_A Mangled Journal|r can drop from |cRXP_ENEMY_Devilsaur|r, |cRXP_ENEMY_Ironhide Devilsaur|r, |cRXP_ENEMY_Tyrant Devilsaur|r. Use it to start the quest if you get one
    .collect 11116,1,3884 --A Mangled Journal (1)
    .accept 3884 >>Accept Williden's Journal
    .use 11116
step
    #label Drop3884x1
    #loop
    .goto 1449/1,-1884.25,-6617.62,0
    .goto 1449/1,-1884.25,-6617.62,40,0
    .goto 1449/1,-1859.09,-6689.65,40,0
    .goto 1449/1,-1799.89,-6745.39,40,0
    .goto 1449/1,-1907.19,-6791.77,40,0
    .goto 1449/1,-1941.60,-6924.97,40,0
    .goto 1449/1,-2020.41,-6819.89,40,0
    .goto 1449/1,-2131.41,-6723.44,40,0
    .goto 1449/1,-1974.90,-6750.33,40,0
    .goto 1449/1,-1967.50,-6646.48,40,0
    >>Kill |cRXP_ENEMY_Bloodpetal Lashers|r, |cRXP_ENEMY_Bloodpetal Flayers|r, |cRXP_ENEMY_Bloodpetal Threshers|r and |cRXP_ENEMY_Bloodpetal Trappers|r. Loot them for |cRXP_LOOT_Bloodpetal|r
    .complete 4141,1 --Bloodpetal (15)
    .mob Bloodpetal Lasher
    .mob Bloodpetal Flayer
    .mob Bloodpetal Thresher
    .mob Bloodpetal Trapper
step
    .goto 1449/1,-1017.71,-6033.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_J.D. Collie|r
    .turnin 3941 >>Turn in A Gnome's Assistance
    .target J.D. Collie
    .isOnQuest 3941
step
    .goto 1449/1,-1017.71,-6033.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_J.D. Collie|r
    .turnin 4005 >>Turn in Aquementas
    .target J.D. Collie
    .isQuestComplete 4005
step
    .goto 1449/1,-1055.45,-6204.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Muigin|r
    .turnin 4141 >>Turn in Muigin and Larion
    .accept 4142 >>Accept A Visit to Gregan
    .target Muigin
step
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .accept 4289 >>Accept The Apes of Un'Goro
    .accept 4290 >>Accept The Fare of Lar'korwi
    .target Torwa Pathfinder
step
    .goto 1449/1,-2010.05,-7365.51
    >>Open the |cRXP_PICK_Fresh Threshadon Carcass|r. Loot it for |cRXP_LOOT_Piece of Threshadon Carcass|r
    .complete 4290,1 --Piece of Threshadon Carcass (1)
step
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .turnin 4290 >>Turn in The Fare of Lar'korwi
    .accept 4291 >>Accept The Scent of Lar'korwi
    .target Torwa Pathfinder
step
    #completewith Drop3884x2
    >>|cRXP_LOOT_A Mangled Journal|r can drop from |cRXP_ENEMY_Devilsaur|r, |cRXP_ENEMY_Ironhide Devilsaur|r, |cRXP_ENEMY_Tyrant Devilsaur|r. Use it to start the quest if you get one
    .collect 11116,1,3884 --A Mangled Journal (1)
    .accept 3884 >>Accept Williden's Journal
    .use 11116
step
    #label Drop3884x2
    .goto 1449/1,-1760.67,-7940.00
    >>Kill |cRXP_ENEMY_Lar'korwi Mates|r. Loot them for |cRXP_LOOT_Ravasaur Pheromone Gland|r
    .complete 4291,1 --Ravasaur Pheromone Gland (2)
    .mob Lar'korwi Mate
step << Warrior/Rogue/Paladin/Druid
    .goto 1449/1,-1140.32,-6110.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryfe|r
    .fp Un'Goro >> Get the Un'Goro Crater Flight Path
    >>Fly or Hearth to Gadgetzan. Make sure you have the Flight Path before you Hearth
    .zoneskip Tanaris
    .target Gryfe
step << !Warrior !Rogue !Paladin !Druid
    .hs >> Hearth to Tanaris
    >>|cRXP_BUY_Buy food/water if needed|r << !Warrior !Rogue
    >>|cRXP_BUY_Buy food if needed|r << Warrior/Rogue
    .zoneskip Tanaris
step
    .goto 1449/1,-1798.41,-7658.80
    >>Click the |cRXP_PICK_A Wrecked Raft|r
    .accept 3844 >>Accept It's a Secret to Everybody
step
    .goto 1449/1,-1801.74,-7670.15
    >>Click the |cRXP_PICK_A Small Pack|r
    .turnin 3844 >>Turn in It's a Secret to Everybody
    .accept 3845 >>Accept It's a Secret to Everybody
step
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .turnin 4291 >>Turn in The Scent of Lar'korwi
    .target Torwa Pathfinder
step
    .goto 1449/1,-1182.73,-6298.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Karna Remtravel|r
    .accept 4243 >>Accept Chasing A-Me 01
    .target Karna Remtravel
step
    .goto 1449/1,-1103.18,-6252.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shizzle|r
    .accept 4503 >>Accept Shizzle's Flyer
    .target Shizzle
step
    .goto 1449/1,-1119.09,-6166.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Linken|r
    .turnin 3845 >>Turn in It's a Secret to Everybody while you are here
    .isQuestComplete 3845
    .target Linken
step
    .goto 1449/1,-1077.28,-6174.85
    >>Click the |cRXP_PICK_Beware of Pterrordax|r
    .accept 4501 >>Accept Beware of Pterrordax
step
    .goto 1449/1,-1076.17,-6149.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spark Nilminer|r
    .accept 3882 >>Accept Roll the Bones
    .target Spark Nilminer
step
    .goto 1449/1,-1017.71,-6033.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_J.D. Collie|r
    .accept 4284 >>Accept Crystals of Power
    .target J.D. Collie
step
    #completewith Along23
    >>As you go: Kill |cRXP_ENEMY_Pterrordaxes|r. Kill |cRXP_ENEMY_Fledgling Pterrordaxes|r, |cRXP_ENEMY_Pterrordaxes|r and |cRXP_ENEMY_Frenzied Pterrordaxes|r. Loot them for |cRXP_LOOT_Webbed Pterrordax Scale|r. |cRXP_WARN_Anything left is finished later|r
    .complete 4501,1 --Pterrordax slain (10)
    .complete 4503,2 --Webbed Pterrordax Scale (8)
    .mob Pterrordax
    .mob Fledgling Pterrordax
    .mob Frenzied Pterrordax
step
    #label Along23
    #loop
    .goto 1449/1,-1553.47,-6270.07,0
    .goto 1449/1,-1553.47,-6270.07,40,0
    .goto 1449/1,-1560.87,-6270.07,40,0
    .goto 1449/1,-1623.77,-6230.60,40,0
    .goto 1449/1,-1616.37,-6183.73,40,0
    .goto 1449/1,-1586.77,-6215.80,40,0
    >>Pick up |cRXP_PICK_Blue Power Crystal|r from the ground
    >>Pick up |cRXP_PICK_Green Power Crystal|r from the ground
    >>Pick up |cRXP_PICK_Yellow Power Crystal|r from the ground
    >>Pick up |cRXP_PICK_Red Power Crystal|r from the ground
    .complete 4284,4 --Blue Power Crystal (7)
    .complete 4284,3 --Green Power Crystal (7)
    .complete 4284,2 --Yellow Power Crystal (7)
    .complete 4284,1 --Red Power Crystal (7)
step
    .goto 1449/1,-1017.71,-6033.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_J.D. Collie|r
    .turnin 4284 >>Turn in Crystals of Power
    .accept 4285 >>Accept The Northern Pylon
    .accept 4287 >>Accept The Eastern Pylon
    .accept 4288 >>Accept The Western Pylon
    .target J.D. Collie
step
    .goto 1449/1,-1090.60,-6145.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hol'anyee Marshal|r
    .accept 3883 >>Accept Alien Ecology
    .target Hol'anyee Marshal
step
    .goto 1449/1,-1092.82,-6142.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Williden Marshal|r
    .accept 3881 >>Accept Expedition Salvation
    .target Williden Marshal
step
    .goto 1449/1,-1119.09,-6166.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Linken|r
    .turnin 3845 >>Turn in It's a Secret to Everybody
    .accept 3908 >>Accept It's a Secret to Everybody
    .target Linken
step << !Warrior !Rogue !Paladin !Druid
    .goto 1449/1,-1140.32,-6110.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryfe|r
    .fp Un'Goro >> Get the Un'Goro Crater Flight Path
    .target Gryfe
step
    #completewith Along28
    >>As you go: Kill |cRXP_ENEMY_Pterrordaxes|r. Kill |cRXP_ENEMY_Fledgling Pterrordaxes|r, |cRXP_ENEMY_Pterrordaxes|r and |cRXP_ENEMY_Frenzied Pterrordaxes|r. Loot them for |cRXP_LOOT_Webbed Pterrordax Scale|r. |cRXP_WARN_Anything left is finished later|r
    .complete 4501,1 --Pterrordax slain (10)
    .complete 4503,2 --Webbed Pterrordax Scale (8)
    .mob Pterrordax
    .mob Fledgling Pterrordax
    .mob Frenzied Pterrordax
step
    #label Along28
    .goto 1449/1,-1557.91,-6275.99
    >>Click the |cRXP_PICK_Northern Crystal Pylon|r
    .complete 4285,1 --Northern Crystal Pylon
step
    #completewith Along29
    >>As you go: Kill |cRXP_ENEMY_Un'Goro Gorillas|r. Loot them for |cRXP_LOOT_Un'Goro Gorilla Pelt|r. Kill |cRXP_ENEMY_Un'Goro Stompers|r. Loot them for |cRXP_LOOT_Un'Goro Stomper Pelt|r. |cRXP_WARN_Anything left is finished later|r
    .complete 4289,1 --Un'Goro Gorilla Pelt (2)
    .complete 4289,2 --Un'Goro Stomper Pelt (2)
    .mob Un'Goro Gorilla
    .mob Un'Goro Stomper
step
    #label Along29
    .goto 1449/1,-1970.09,-6380.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_A-Me 01|r
    .turnin 4243 >>Turn in Chasing A-Me 01
    .target A-Me 01
step
    #completewith Drop3884x3
    >>|cRXP_LOOT_A Mangled Journal|r can drop from |cRXP_ENEMY_Devilsaur|r, |cRXP_ENEMY_Ironhide Devilsaur|r, |cRXP_ENEMY_Tyrant Devilsaur|r. Use it to start the quest if you get one
    .collect 11116,1,3884 --A Mangled Journal (1)
    .accept 3884 >>Accept Williden's Journal
    .use 11116
step
    #label Drop3884x3
    #loop
    .goto 1449/1,-1960.10,-6390.44,0
    .goto 1449/1,-1960.10,-6390.44,40,0
    .goto 1449/1,-1916.81,-6393.89,40,0
    .goto 1449/1,-1879.44,-6376.63,40,0
    .goto 1449/1,-1903.12,-6351.96,40,0
    .goto 1449/1,-1921.99,-6318.41,40,0
    .goto 1449/1,-1959.36,-6339.87,40,0
    .goto 1449/1,-1973.05,-6306.33,40,0
    .goto 1449/1,-2011.53,-6340.37,40,0
    .goto 1449/1,-2021.52,-6401.79,40,0
    >>Kill |cRXP_ENEMY_Un'Goro Gorillas|r. Loot them for |cRXP_LOOT_Un'Goro Gorilla Pelt|r
    >>Kill |cRXP_ENEMY_Un'Goro Stompers|r. Loot them for |cRXP_LOOT_Un'Goro Stomper Pelt|r
    >>Kill |cRXP_ENEMY_Un'Goro Thunderers|r. Loot them for |cRXP_LOOT_Un'Goro Thunderer Pelt|r
    .complete 4289,1 --Un'Goro Gorilla Pelt (2)
    .complete 4289,2 --Un'Goro Stomper Pelt (2)
    .complete 4289,3 --Un'Goro Thunderer Pelt (2)
    .mob Un'Goro Gorilla
    .mob Un'Goro Stomper
    .mob Un'Goro Thunderer
step
    .goto 1449/1,-2002.65,-6867.99
    >>Pick up |cRXP_PICK_Crate of Foodstuffs|r from the ground
    .complete 3881,1 --Crate of Foodstuffs (1)
step
    .goto 1449/1,-2321.59,-7199.51
    >>Click the |cRXP_PICK_Eastern Crystal Pylon|r
    .complete 4287,1 --Eastern Crystal Pylon
step
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .turnin 4289 >>Turn in The Apes of Un'Goro
    .target Torwa Pathfinder
step
    #completewith Drop3884x4
    >>|cRXP_LOOT_A Mangled Journal|r can drop from |cRXP_ENEMY_Devilsaur|r, |cRXP_ENEMY_Ironhide Devilsaur|r, |cRXP_ENEMY_Tyrant Devilsaur|r. Use it to start the quest if you get one
    .collect 11116,1,3884 --A Mangled Journal (1)
    .accept 3884 >>Accept Williden's Journal
    .use 11116
step
    #loop
    .goto 1449/1,-2008.57,-7814.94,0
    .goto 1449/1,-2008.57,-7814.94,40,0
    .goto 1449/1,-1808.77,-7822.09,40,0
    .goto 1449/1,-1597.13,-7785.34,40,0
    .goto 1449/1,-1456.53,-7810.01,40,0
    .goto 1449/1,-1421.01,-8058.15,40,0
    .goto 1449/1,-1575.67,-8250.80,40,0
    .goto 1449/1,-1612.67,-8097.87,40,0
    .goto 1449/1,-1625.62,-7939.75,40,0
    .goto 1449/1,-1756.23,-8019.18,40,0
    >>Kill |cRXP_ENEMY_Devilsaurs|r, |cRXP_ENEMY_Ironhide Devilsaurs|r, |cRXP_ENEMY_Tyrant Devilsaurs|r and |cRXP_ENEMY_Stegodons|r. Loot them for |cRXP_LOOT_Bloodpetal Sprout|r. It can also be picked up from |cRXP_PICK_Bloodpetal Sprout|r on the ground
    .complete 4144,1 --Bloodpetal Sprout (1)
    .mob Devilsaur
    .mob Ironhide Devilsaur
    .mob Tyrant Devilsaur
    .mob Stegodon
    .isOnQuest 4144
step
    #label Drop3884x4
    #loop
    .goto 1449/1,-1116.87,-8142.27,0
    .goto 1449/1,-1116.87,-8142.27,40,0
    .goto 1449/1,-1102.07,-8152.13,40,0
    .goto 1449/1,-1116.87,-8201.47,40,0
    .goto 1449/1,-1079.87,-8250.80,40,0
    .goto 1449/1,-1057.67,-8206.40,40,0
    .goto 1449/1,-1079.87,-8191.60,40,0
    .goto 1449/1,-1065.07,-8112.67,40,0
    .goto 1449/1,-1050.27,-8088.00,40,0
    .goto 1449/1,-1087.27,-8122.53,40,0
    >>Kill |cRXP_ENEMY_Pterrordaxes|r
    >>Kill |cRXP_ENEMY_Fledgling Pterrordaxes|r, |cRXP_ENEMY_Pterrordaxes|r and |cRXP_ENEMY_Frenzied Pterrordaxes|r. Loot them for |cRXP_LOOT_Webbed Pterrordax Scale|r
    .complete 4501,1 --Pterrordax slain (10)
    .complete 4503,2 --Webbed Pterrordax Scale (8)
    .mob Pterrordax
    .mob Fledgling Pterrordax
    .mob Frenzied Pterrordax
step
    .goto 1449/1,-1268.20,-8071.23
    >>Open the |cRXP_PICK_Gorishi Hive Hatchery|r. Loot it for |cRXP_LOOT_Hive Wall Sample|r
    .complete 3883,1 --Hive Wall Sample (1)
step
    #completewith Drop3884x5
    >>|cRXP_LOOT_A Mangled Journal|r can drop from |cRXP_ENEMY_Devilsaur|r, |cRXP_ENEMY_Ironhide Devilsaur|r, |cRXP_ENEMY_Tyrant Devilsaur|r. Use it to start the quest if you get one
    .collect 11116,1,3884 --A Mangled Journal (1)
    .accept 3884 >>Accept Williden's Journal
    .use 11116
step
    #label Drop3884x5
    #loop
    .goto 1449/1,-1196.05,-7691.85,0
    .goto 1449/1,-1196.05,-7691.85,40,0
    .goto 1449/1,-1196.05,-7576.17,40,0
    .goto 1449/1,-1202.34,-7488.11,40,0
    .goto 1449/1,-1403.25,-7421.75,40,0
    .goto 1449/1,-1497.60,-7455.30,40,0
    .goto 1449/1,-1416.57,-7583.81,40,0
    .goto 1449/1,-1330.36,-7517.71,40,0
    .goto 1449/1,-1296.69,-7611.44,40,0
    .goto 1449/1,-1353.30,-7688.89,40,0
    >>Kill |cRXP_ENEMY_Young Diemetradons|r, |cRXP_ENEMY_Diemetradons|r and |cRXP_ENEMY_Elder Diemetradons|r. Loot them for |cRXP_LOOT_Webbed Diemetradon Scale|r
    >>Kill |cRXP_ENEMY_Stegodons|r, |cRXP_ENEMY_Plated Stegodons|r, |cRXP_ENEMY_Spiked Stegodons|r and |cRXP_ENEMY_Thunderstomp Stegodons|r. Loot them for |cRXP_LOOT_Dinosaur Bone|r. It can also be picked up from |cRXP_PICK_Dinosaur Bone|r on the ground
    .complete 4503,1 --Webbed Diemetradon Scale (8)
    .complete 3882,1 --Dinosaur Bone (8)
    .mob Young Diemetradon
    .mob Diemetradon
    .mob Elder Diemetradon
    .mob Stegodon
    .mob Plated Stegodon
    .mob Spiked Stegodon
    .mob Thunderstomp Stegodon
step
    .goto 1449/1,-889.32,-7596.15
    >>Pick up |cRXP_PICK_Research Equipment|r from the ground
    .complete 3881,2 --Research Equipment (1)
step
    .goto 1449/1,-349.49,-7426.69
    >>Click the |cRXP_PICK_Western Crystal Pylon|r
    .complete 4288,1 --Western Crystal Pylon
step
    #completewith Drop3884x6
    >>|cRXP_LOOT_A Mangled Journal|r can drop from |cRXP_ENEMY_Devilsaur|r, |cRXP_ENEMY_Ironhide Devilsaur|r, |cRXP_ENEMY_Tyrant Devilsaur|r. Use it to start the quest if you get one
    .collect 11116,1,3884 --A Mangled Journal (1)
    .accept 3884 >>Accept Williden's Journal
    .use 11116
step
    #label Drop3884x6
    #loop
    .goto 1449/1,-813.47,-7017.47,0
    .goto 1449/1,-813.47,-7017.47,40,0
    .goto 1449/1,-843.07,-6992.80,40,0
    .goto 1449/1,-850.47,-6973.07,40,0
    .goto 1449/1,-865.27,-6933.60,40,0
    .goto 1449/1,-887.47,-6889.20,40,0
    .goto 1449/1,-961.47,-6899.07,40,0
    .goto 1449/1,-1028.07,-6874.40,40,0
    .goto 1449/1,-1042.87,-6864.53,40,0
    .goto 1449/1,-1013.27,-6948.40,40,0
    >>Kill |cRXP_ENEMY_Frenzied Pterrordaxes|r
    .complete 4501,2 --Frenzied Pterrordax slain (15)
    .mob Frenzied Pterrordax
step
    .goto 1449/1,-1608.97,-7743.90,45,0
    .goto 1449/1,-1645.23,-7667.68,45,0
    .goto 1449/1,-1606.75,-7565.56,45,0
    .goto 1449/1,-1715.53,-7502.91,45,0
    .goto 1449/1,-1754.38,-7478.49,45,0
    .goto 1449/1,-1718.12,-7447.16,45,0
    .goto 1449/1,-1705.91,-7251.06,45,0
    .goto 1449/1,-1630.80,-7259.94,45,0
    .goto 1449/1,-1608.60,-7216.03,45,0
    .goto 1449/1,-1577.15,-7240.21,45,0
    .goto 1449/1,-1635.24,-7403.25,45,0
    .goto 1449/1,-1608.97,-7495.51,45,0
    .goto 1449/1,-1576.78,-7514.99,45,0
    .goto 1449/1,-1551.25,-7548.05,45,0
    .goto 1449/1,-1509.81,-7443.21,45,0
    .goto 1449/1,-1399.55,-7419.53,45,0
    .goto 1449/1,-1386.97,-7525.85,45,0
    .goto 1449/1,-1408.80,-7633.39,45,0
    .goto 1449/1,-1419.53,-7713.81,45,0
    .goto 1449/1,-1310.75,-7755.25,45,0
    .goto 1449/1,-1277.08,-7673.11,45,0
    .goto 1449/1,-1277.82,-7534.48,45,0
    .goto 1449/1,-1275.23,-7440.99,45,0
    .goto 1449/1,-1147.58,-7479.72,45,0
    .goto 1449/1,-1089.12,-7491.31,45,0
    .goto 1449/1,-1200.86,-7606.75,45,0
    .goto 1449/1,-1193.09,-7703.94,45,0
    .goto 1449/1,-1160.16,-7741.19,45,0
    .goto 1449/1,-1085.05,-7746.61,45,0
    .goto 1449/1,-1091.71,-7604.29,45,0
    .goto 1449/1,-1069.51,-7549.77,45,0
    .goto 1449/1,-1075.06,-7473.55,45,0
    .goto 1449/1,-1169.04,-7450.12,45,0
    .xp 51+89865 >>AoE |cRXP_ENEMY_Diemetradons|r to 89865+/153900xp
    >>|cRXP_WARN_Be careful as |cRXP_ENEMY_Young Diemetradons|r cast|r |T132109:0|t[Tendon Rip] |cRXP_WARN_B(reduces movespeed by 70% for 8 seconds), and|r |cRXP_ENEMY_Fledgling Pterrordaxes|r cast|r |T132338:0|t[Swoop] |cRXP_WARN_(deals 50 extra damage and stuns for 2 seconds)|r
step
    .goto 1449/1,-1055.45,-6204.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Muigin|r
    .turnin 4144 >>Turn in Bloodpetal Sprouts
    .target Muigin
    .isOnQuest 4144
step
    .goto 1449/1,-1092.82,-6142.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Williden Marshal|r
    .turnin 3884 >>Turn in Williden's Journal
    .target Williden Marshal
    .isOnQuest 3884
step
    .goto 1449/1,-1103.18,-6252.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shizzle|r
    .turnin 4503 >>Turn in Shizzle's Flyer
    .target Shizzle
step
    .goto 1449/1,-1080.61,-6176.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spraggle Frock|r
    .turnin 4501 >>Turn in Beware of Pterrordax
    .target Spraggle Frock
step
    .goto 1449/1,-1076.17,-6149.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spark Nilminer|r
    .turnin 3882 >>Turn in Roll the Bones
    .target Spark Nilminer
step
    .goto 1449/1,-1090.60,-6145.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hol'anyee Marshal|r
    .turnin 3883 >>Turn in Alien Ecology
    .target Hol'anyee Marshal
step
    .goto 1449/1,-1092.82,-6142.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Williden Marshal|r
    .turnin 3881 >>Turn in Expedition Salvation
    .target Williden Marshal
step
    .goto 1449/1,-1017.71,-6033.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_J.D. Collie|r
    .turnin 4285 >>Turn in The Northern Pylon
    .turnin 4287 >>Turn in The Eastern Pylon
    .turnin 4288 >>Turn in The Western Pylon
    .accept 4321 >>Accept Making Sense of It
    .turnin 4321 >>Turn in Making Sense of It
    .target J.D. Collie
step
    .hs >> Hearth to Gadgetzan
step << Druid
    #loop
    .goto 1449/1,-1325.92,-7931.37,0
    .goto 1449/1,-1325.92,-7931.37,40,0
    .goto 1449/1,-1297.80,-7986.13,40,0
    .goto 1449/1,-1163.12,-8052.73,40,0
    .goto 1449/1,-1143.51,-8004.38,40,0
    .goto 1449/1,-1095.41,-7958.50,40,0
    .goto 1449/1,-1188.28,-7985.14,40,0
    .goto 1449/1,-1254.88,-7977.49,40,0
    >>Kill |cRXP_ENEMY_Gorishi Wasps|r and |cRXP_ENEMY_Gorishi Stingers|r. Loot them for |cRXP_LOOT_Gorishi Sting|r
    .complete 9052,1 --Gorishi Sting (8)
    .mob Gorishi Wasp
    .mob Gorishi Stinger
step
    .goto 1449/1,-1017.71,-6033.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_J.D. Collie|r
    .accept 3961 >>Accept Linken's Adventure
    .target J.D. Collie
    .isQuestTurnedIn 4005 --any of: Aquementas
    .xp <47,1
step
    .goto 1449/1,-1017.71,-6033.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_J.D. Collie|r
    .accept 3942 >>Accept Linken's Memory
    .target J.D. Collie
    .isQuestTurnedIn 3941 --any of: A Gnome's Assistance
    .xp <47,1
step
    .goto 1449/1,-1119.09,-6166.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Linken|r
    .turnin 3961 >>Turn in Linken's Adventure
    .target Linken
    .isOnQuest 3961
step
    .goto 1449/1,-1970.09,-6380.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_A-Me 01|r
    .accept 4244 >>Accept Chasing A-Me 01
    .target A-Me 01
step
    .goto 1449/1,-1970.09,-6380.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_A-Me 01|r
    .turnin 4244 >>Turn in Chasing A-Me 01
    .target A-Me 01
    .isQuestComplete 4244
step << Druid
    #loop
    .goto 1449/1,-884.51,-6537.21,0
    .goto 1449/1,-884.51,-6537.21,40,0
    .goto 1449/1,-838.63,-6586.05,40,0
    .goto 1449/1,-868.60,-6652.40,40,0
    >>Loot the |cRXP_PICK_Bloodpetal Sprouts|r for |cRXP_LOOT_Bloodcap|r
    .complete 9052,2 --Bloodcap (8)
step << Druid
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .turnin 9052 >>Turn in Bloodpetal Poison
    .target Torwa Pathfinder
step
    .goto 1449/1,-1970.09,-6380.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_A-Me 01|r
    .accept 4245 >>Accept Chasing A-Me 01
    .target A-Me 01
    .isQuestTurnedIn 4244 --any of: Chasing A-Me 01
    .xp <48,1
step
    .goto 1449/1,-1184.58,-6306.57
    >>Protect A-Me 01 until you reach Karna Remtravel
    .complete 4245,1 --Protect A-Me 01 until you reach Karna Remtravel
    .isOnQuest 4245
step
    .goto 1449/1,-1182.73,-6298.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Karna Remtravel|r
    .turnin 4245 >>Turn in Chasing A-Me 01
    .target Karna Remtravel
    .isOnQuest 4245
step
    +|cRXP_WARN_That is all of Un'Goro Crater for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Felwood|r: Linken's Memory
    >>|cRXP_FRIENDLY_Feralas|r: A Visit to Gregan
    >>|cRXP_FRIENDLY_Winterspring|r: It's a Secret to Everybody
    >>|cRXP_FRIENDLY_Searing Gorge and back here|r: Chasing A-Me 01
step
    .xp 53 >>|cRXP_WARN_The rest of Un'Goro Crater is planned from level 53.|r Come back to this guide then
step
    .goto 1449/1,-1080.61,-6176.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spraggle Frock|r
    .accept 4492 >>Accept Lost!
    .target Spraggle Frock
step
    .goto 1449/1,-1083.94,-6171.15
    >>Escort Ringo to Spraggle Frock at Marshal's Refuge
    .complete 4492,1 --Escort Ringo to Spraggle Frock at Marshal's Refuge
step
    .goto 1449/1,-611.08,-7210.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krakle|r
    .accept 974 >>Accept Finding the Source
    .target Krakle
step
    .goto 1449/1,-1386.97,-7196.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ringo|r
    .turnin 4492 >>Turn in Lost!
    .accept 4491 >>Accept A Little Help From My Friends
    .target Ringo
step
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .accept 4301 >>Accept The Mighty U'cha
    .target Torwa Pathfinder
step
    .goto 1449/1,-1305.20,-7092.45
    >>Click the |cRXP_PICK_Fire Plume Ridge Hot Spot|r
    .complete 974,1 --Fire Plume Ridge Hot Spot
step
    .goto 1449/1,-611.08,-7210.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krakle|r
    .turnin 974 >>Turn in Finding the Source
    .accept 980 >>Accept The New Springs
    .target Krakle
step
    .goto 1449/1,-1083.94,-6171.15
    >>Escort Ringo to Spraggle Frock at Marshal's Refuge
    .complete 4491,1 --Escort Ringo to Spraggle Frock at Marshal's Refuge
step
    .goto 1449/1,-1080.61,-6176.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spraggle Frock|r
    .turnin 4491 >>Turn in A Little Help From My Friends
    .target Spraggle Frock
step
    .goto 1449/1,-1987.85,-6276.48
    >>Kill |cRXP_ENEMY_U'cha|r and loot |cRXP_LOOT_U'cha's Pelt|r
    .complete 4301,1 --U'cha's Pelt (1)
    .mob U'cha
step
    .goto 1449/1,-1970.09,-6380.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_A-Me 01|r
    .turnin 4244 >>Turn in Chasing A-Me 01
    .target A-Me 01
    .isQuestComplete 4244
step
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .turnin 4301 >>Turn in The Mighty U'cha
    .accept 9051 >>Accept Toxic Test << Druid
    .target Torwa Pathfinder
step << Druid
    .goto 1449/1,-2212.07,-6781.65
    >>Kill |cRXP_ENEMY_Devilsaurs|r, |cRXP_ENEMY_Ironhide Devilsaurs|r and |cRXP_ENEMY_Tyrant Devilsaurs|r
    .complete 9051,1 --Devilsaur (8)
    .mob Devilsaur
    .mob Ironhide Devilsaur
    .mob Tyrant Devilsaur
step << Druid
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .turnin 9051 >>Turn in Toxic Test
    .accept 9053 >>Accept A Better Ingredient
    .target Torwa Pathfinder
step << Druid
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .turnin 9053 >>Turn in A Better Ingredient
    .target Torwa Pathfinder
    .isQuestComplete 9053
step
    +|cRXP_WARN_That is all of Un'Goro Crater for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Winterspring|r: The New Springs
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: A Better Ingredient << Druid
step
    .xp 56 >>|cRXP_WARN_The rest of Un'Goro Crater is planned from level 56.|r Come back to this guide then
step << Druid
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .turnin 9053 >>Turn in A Better Ingredient
    .target Torwa Pathfinder
    .isQuestComplete 9053
step
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .accept 4292 >>Accept The Bait for Lar'korwi
    .target Torwa Pathfinder
step
    .goto 1449/1,-2413.72,-7195.81
    >>Kill |cRXP_ENEMY_Lar'korwi|r and loot |cRXP_LOOT_Lar'korwi's Head|r
    .complete 4292,1 --Lar'korwi's Head (1)
    .mob Lar'korwi
step
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .turnin 4292 >>Turn in The Bait for Lar'korwi
    .target Torwa Pathfinder
step
    .goto 1449/1,-1970.09,-6380.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_A-Me 01|r
    .turnin 4244 >>Turn in Chasing A-Me 01
    .target A-Me 01
    .isQuestComplete 4244
step
    .goto 1449/1,-1119.09,-6166.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Linken|r
    .accept 3962 >>Accept It's Dangerous to Go Alone
    .target Linken
    .isQuestTurnedIn 3961 --any of: Linken's Adventure
    .xp <47,1
step
    .goto 1449/1,-1294.84,-7183.47
    >>Kill |cRXP_ENEMY_Blazerunner|r
    .complete 3962,1 --Blazerunner slain (1)
    .mob Blazerunner
    .isOnQuest 3962
step
    .goto 1449/1,-1327.03,-7199.26
    >>Open the |cRXP_PICK_Ornate Chest|r. Loot it for |cRXP_LOOT_Golden Flame|r
    .complete 3962,2 --Golden Flame (1)
    .isOnQuest 3962
step
    .goto 1449/1,-1119.09,-6166.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Linken|r
    .turnin 3962 >>Turn in It's Dangerous to Go Alone
    .target Linken
    .isOnQuest 3962
step
    +|cRXP_WARN_End of the Un'Goro Crater route.|r
]])
