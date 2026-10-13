-- 50-56 Un'Goro Crater: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 3 parts with a level check between them (from level 50, 53, 56).
-- Edit zones/Un'Goro Crater.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#name 50-56 Un'Goro Crater

step << Druid
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .turnin 9063 >>Turn in Torwa Pathfinder
    .target Torwa Pathfinder
    .isOnQuest 9063
step
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .accept 4289 >>Accept The Apes of Un'Goro
    .accept 4290 >>Accept The Fare of Lar'korwi
    .target Torwa Pathfinder
step << Druid
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .accept 9052 >>Accept Bloodpetal Poison
    .target Torwa Pathfinder
    .xp <50,1
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
    .goto 1449/1,-2010.05,-7365.51
    >>Open the |cRXP_PICK_Fresh Threshadon Carcass|r. Loot it for |cRXP_LOOT_Piece of Threshadon Carcass|r
    .complete 4290,1 --Piece of Threshadon Carcass (1)
step
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .turnin 4290 >>Turn in The Fare of Lar'korwi
    .accept 4291 >>Accept The Scent of Lar'korwi
    .target Torwa Pathfinder
step << Druid
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .accept 9052 >>Accept Bloodpetal Poison
    .target Torwa Pathfinder
    .xp <50,1
step
    #completewith Drop3884x1
    >>|cRXP_LOOT_A Mangled Journal|r can drop from |cRXP_ENEMY_Devilsaur|r, |cRXP_ENEMY_Ironhide Devilsaur|r, |cRXP_ENEMY_Tyrant Devilsaur|r. Use it to start the quest if you get one
    .collect 11116,1,3884 --A Mangled Journal (1)
    .accept 3884 >>Accept Williden's Journal
    .use 11116
step
    #label Drop3884x1
    .goto 1449/1,-1945.67,-7619.33
    >>Kill |cRXP_ENEMY_Lar'korwi Mates|r. Loot them for |cRXP_LOOT_Ravasaur Pheromone Gland|r
    .complete 4291,1 --Ravasaur Pheromone Gland (2)
    .mob Lar'korwi Mate
step
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .turnin 4291 >>Turn in The Scent of Lar'korwi
    .target Torwa Pathfinder
step << Druid
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .accept 9052 >>Accept Bloodpetal Poison
    .target Torwa Pathfinder
    .xp <50,1
step
    .goto 1449/1,-1119.09,-6166.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Linken|r
    .turnin 3845 >>Turn in It's a Secret to Everybody
    .accept 3908 >>Accept It's a Secret to Everybody
    .target Linken
step
    .goto 1449/1,-1017.71,-6033.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_J.D. Collie|r
    .accept 4284 >>Accept Crystals of Power
    .target J.D. Collie
step
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
    .goto 1449/1,-1076.17,-6149.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spark Nilminer|r
    .accept 3882 >>Accept Roll the Bones
    .target Spark Nilminer
step
    .goto 1449/1,-1077.28,-6174.85
    >>Click the |cRXP_PICK_Beware of Pterrordax|r
    .accept 4501 >>Accept Beware of Pterrordax
step
    .goto 1449/1,-1151.65,-6181.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Larion|r
    .accept 4145 >>Accept Larion and Muigin
    .target Larion
step
    .goto 1449/1,-1103.18,-6252.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shizzle|r
    .accept 4503 >>Accept Shizzle's Flyer
    .target Shizzle
step
    #completewith Drop3884x2
    >>|cRXP_LOOT_A Mangled Journal|r can drop from |cRXP_ENEMY_Devilsaur|r, |cRXP_ENEMY_Ironhide Devilsaur|r, |cRXP_ENEMY_Tyrant Devilsaur|r. Use it to start the quest if you get one
    .collect 11116,1,3884 --A Mangled Journal (1)
    .accept 3884 >>Accept Williden's Journal
    .use 11116
step
    #loop
    .goto 1449/1,-1879.44,-6376.63,0
    .goto 1449/1,-1879.44,-6376.63,40,0
    .goto 1449/1,-1903.12,-6351.96,40,0
    .goto 1449/1,-1921.99,-6318.41,40,0
    .goto 1449/1,-1959.36,-6339.87,40,0
    .goto 1449/1,-1973.05,-6306.33,40,0
    .goto 1449/1,-2011.53,-6340.37,40,0
    .goto 1449/1,-2021.52,-6401.79,40,0
    .goto 1449/1,-1960.10,-6390.44,40,0
    .goto 1449/1,-1916.81,-6393.89,40,0
    >>Kill |cRXP_ENEMY_Un'Goro Stompers|r. Loot them for |cRXP_LOOT_Un'Goro Stomper Pelt|r
    >>Kill |cRXP_ENEMY_Un'Goro Thunderers|r. Loot them for |cRXP_LOOT_Un'Goro Thunderer Pelt|r
    >>Kill |cRXP_ENEMY_Un'Goro Gorillas|r. Loot them for |cRXP_LOOT_Un'Goro Gorilla Pelt|r
    .complete 4289,2 --Un'Goro Stomper Pelt (2)
    .complete 4289,3 --Un'Goro Thunderer Pelt (2)
    .complete 4289,1 --Un'Goro Gorilla Pelt (2)
    .mob Un'Goro Stomper
    .mob Un'Goro Thunderer
    .mob Un'Goro Gorilla
step
    #loop
    .goto 1449/1,-1967.50,-6646.48,0
    .goto 1449/1,-1967.50,-6646.48,40,0
    .goto 1449/1,-2076.65,-6667.20,40,0
    .goto 1449/1,-2086.27,-6749.34,40,0
    .goto 1449/1,-2017.45,-6700.25,40,0
    .goto 1449/1,-1974.90,-6750.33,40,0
    .goto 1449/1,-1941.60,-6924.97,40,0
    .goto 1449/1,-1927.17,-6853.19,40,0
    .goto 1449/1,-1907.19,-6791.77,40,0
    .goto 1449/1,-1799.89,-6745.39,40,0
    >>Kill |cRXP_ENEMY_Bloodpetal Threshers|r
    >>Kill |cRXP_ENEMY_Bloodpetal Lashers|r
    .complete 4145,4 --Bloodpetal Thresher slain (5)
    .complete 4145,1 --Bloodpetal Lasher slain (5)
    .mob Bloodpetal Thresher
    .mob Bloodpetal Lasher
step
    #label Drop3884x2
    #loop
    .goto 1449/1,-1683.71,-7083.08,0
    .goto 1449/1,-1683.71,-7083.08,40,0
    .goto 1449/1,-1650.78,-7077.16,40,0
    .goto 1449/1,-1602.68,-7112.93,40,0
    .goto 1449/1,-1736.25,-7172.62,40,0
    .goto 1449/1,-1701.10,-7113.17,40,0
    >>Kill |cRXP_ENEMY_Bloodpetal Flayers|r
    .complete 4145,3 --Bloodpetal Flayer slain (5)
    .mob Bloodpetal Flayer
step
    .goto 1449/1,-2002.65,-6867.99
    >>Pick up |cRXP_PICK_Crate of Foodstuffs|r from the ground
    .complete 3881,1 --Crate of Foodstuffs (1)
step
    #completewith Drop3884x3
    >>|cRXP_LOOT_A Mangled Journal|r can drop from |cRXP_ENEMY_Devilsaur|r, |cRXP_ENEMY_Ironhide Devilsaur|r, |cRXP_ENEMY_Tyrant Devilsaur|r. Use it to start the quest if you get one
    .collect 11116,1,3884 --A Mangled Journal (1)
    .accept 3884 >>Accept Williden's Journal
    .use 11116
step
    #label Drop3884x3
    #loop
    .goto 1449/1,-2241.30,-6943.96,0
    .goto 1449/1,-2241.30,-6943.96,40,0
    .goto 1449/1,-2212.07,-7218.75,40,0
    .goto 1449/1,-2215.77,-7519.93,40,0
    .goto 1449/1,-2039.65,-7642.52,40,0
    .goto 1449/1,-1877.96,-7461.71,40,0
    .goto 1449/1,-1713.31,-7302.61,40,0
    .goto 1449/1,-1579.00,-7141.29,40,0
    .goto 1449/1,-1836.89,-7145.98,40,0
    .goto 1449/1,-1963.06,-7269.31,40,0
    >>Kill |cRXP_ENEMY_Devilsaurs|r, |cRXP_ENEMY_Ironhide Devilsaurs|r, |cRXP_ENEMY_Tyrant Devilsaurs|r and |cRXP_ENEMY_Stegodons|r. Loot them for |cRXP_LOOT_Bloodpetal Sprout|r. It can also be picked up from |cRXP_PICK_Bloodpetal Sprout|r on the ground
    .complete 4148,1 --Bloodpetal Sprout (1)
    .mob Devilsaur
    .mob Ironhide Devilsaur
    .mob Tyrant Devilsaur
    .mob Stegodon
    .isOnQuest 4148
step
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .turnin 4289 >>Turn in The Apes of Un'Goro
    .accept 9052 >>Accept Bloodpetal Poison << Druid
    .target Torwa Pathfinder
step << Druid
    #loop
    .goto 1449/1,-868.60,-6652.40,0
    .goto 1449/1,-868.60,-6652.40,40,0
    .goto 1449/1,-838.63,-6586.05,40,0
    .goto 1449/1,-884.51,-6537.21,40,0
    >>Loot the |cRXP_PICK_Bloodpetal Sprouts|r for |cRXP_LOOT_Bloodcap|r
    .complete 9052,2 --Bloodcap (8)
step
    #completewith Drop3884x4
    >>|cRXP_LOOT_A Mangled Journal|r can drop from |cRXP_ENEMY_Devilsaur|r, |cRXP_ENEMY_Ironhide Devilsaur|r, |cRXP_ENEMY_Tyrant Devilsaur|r. Use it to start the quest if you get one
    .collect 11116,1,3884 --A Mangled Journal (1)
    .accept 3884 >>Accept Williden's Journal
    .use 11116
step
    #label Drop3884x4
    #loop
    .goto 1449/1,-1095.41,-7958.50,0
    .goto 1449/1,-1095.41,-7958.50,40,0
    .goto 1449/1,-1188.28,-7985.14,40,0
    .goto 1449/1,-1254.88,-7977.49,40,0
    .goto 1449/1,-1325.92,-7931.37,40,0
    .goto 1449/1,-1546.07,-8142.27,40,0
    .goto 1449/1,-1553.47,-8191.60,40,0
    .goto 1449/1,-1338.87,-8181.73,40,0
    .goto 1449/1,-1268.20,-8071.23,40,0
    .goto 1449/1,-1163.12,-8052.73,40,0
    >>Open the |cRXP_PICK_Gorishi Hive Hatchery|r. Loot it for |cRXP_LOOT_Hive Wall Sample|r
    >>Kill |cRXP_ENEMY_Gorishi Wasps|r and |cRXP_ENEMY_Gorishi Stingers|r. Loot them for |cRXP_LOOT_Gorishi Sting|r << Druid
    >>Kill |cRXP_ENEMY_Pterrordaxes|r
    .complete 3883,1 --Hive Wall Sample (1)
    .complete 9052,1 << Druid --Gorishi Sting (8)
    .complete 4501,1 --Pterrordax slain (10)
    .mob Gorishi Wasp << Druid
    .mob Gorishi Stinger << Druid
    .mob Pterrordax
step << Druid
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .turnin 9052 >>Turn in Bloodpetal Poison
    .target Torwa Pathfinder
step
    .goto 1449/1,-889.32,-7596.15
    >>Pick up |cRXP_PICK_Research Equipment|r from the ground
    .complete 3881,2 --Research Equipment (1)
step
    #completewith Drop3884x5
    >>|cRXP_LOOT_A Mangled Journal|r can drop from |cRXP_ENEMY_Devilsaur|r, |cRXP_ENEMY_Ironhide Devilsaur|r, |cRXP_ENEMY_Tyrant Devilsaur|r. Use it to start the quest if you get one
    .collect 11116,1,3884 --A Mangled Journal (1)
    .accept 3884 >>Accept Williden's Journal
    .use 11116
step
    #loop
    .goto 1449/1,-785.72,-7044.85,0
    .goto 1449/1,-785.72,-7044.85,40,0
    .goto 1449/1,-777.21,-6971.83,40,0
    .goto 1449/1,-780.17,-6911.40,40,0
    .goto 1449/1,-737.62,-6850.47,40,0
    .goto 1449/1,-730.96,-6968.38,40,0
    >>Kill |cRXP_ENEMY_Bloodpetal Trappers|r
    .complete 4145,2 --Bloodpetal Trapper slain (5)
    .mob Bloodpetal Trapper
step
    #loop
    .goto 1449/1,-813.47,-7017.47,0
    .goto 1449/1,-813.47,-7017.47,40,0
    .goto 1449/1,-717.27,-7061.87,40,0
    .goto 1449/1,-598.87,-7071.73,40,0
    .goto 1449/1,-539.67,-7140.80,40,0
    .goto 1449/1,-495.27,-7101.33,40,0
    .goto 1449/1,-413.87,-7027.33,40,0
    .goto 1449/1,-487.87,-6943.47,40,0
    .goto 1449/1,-561.87,-7007.60,40,0
    .goto 1449/1,-680.27,-7017.47,40,0
    >>Kill |cRXP_ENEMY_Frenzied Pterrordaxes|r
    >>Kill |cRXP_ENEMY_Fledgling Pterrordaxes|r, |cRXP_ENEMY_Pterrordaxes|r and |cRXP_ENEMY_Frenzied Pterrordaxes|r. Loot them for |cRXP_LOOT_Webbed Pterrordax Scale|r
    .complete 4501,2 --Frenzied Pterrordax slain (15)
    .complete 4503,2 --Webbed Pterrordax Scale (8)
    .mob Frenzied Pterrordax
    .mob Fledgling Pterrordax
    .mob Pterrordax
step
    #loop
    .goto 1449/1,-550.40,-7319.39,0
    .goto 1449/1,-550.40,-7319.39,40,0
    .goto 1449/1,-724.30,-7491.07,40,0
    .goto 1449/1,-619.96,-7518.20,40,0
    .goto 1449/1,-551.14,-7518.69,40,0
    .goto 1449/1,-531.53,-7668.17,40,0
    .goto 1449/1,-448.65,-7621.06,40,0
    .goto 1449/1,-464.93,-7451.11,40,0
    .goto 1449/1,-412.76,-7383.27,40,0
    .goto 1449/1,-516.73,-7405.72,40,0
    >>Kill |cRXP_ENEMY_Stegodons|r, |cRXP_ENEMY_Plated Stegodons|r, |cRXP_ENEMY_Spiked Stegodons|r and |cRXP_ENEMY_Thunderstomp Stegodons|r. Loot them for |cRXP_LOOT_Dinosaur Bone|r. It can also be picked up from |cRXP_PICK_Dinosaur Bone|r on the ground
    .complete 3882,1 --Dinosaur Bone (8)
    .mob Stegodon
    .mob Plated Stegodon
    .mob Spiked Stegodon
    .mob Thunderstomp Stegodon
step
    #label Drop3884x5
    #loop
    .goto 1449/1,-890.80,-7638.57,0
    .goto 1449/1,-890.80,-7638.57,40,0
    .goto 1449/1,-908.56,-7842.07,40,0
    .goto 1449/1,-1025.11,-7847.25,40,0
    .goto 1449/1,-1093.93,-7759.93,40,0
    .goto 1449/1,-1196.05,-7691.85,40,0
    .goto 1449/1,-1207.15,-7620.32,40,0
    .goto 1449/1,-1181.25,-7513.76,40,0
    .goto 1449/1,-1118.35,-7690.87,40,0
    .goto 1449/1,-1026.22,-7671.38,40,0
    >>Kill |cRXP_ENEMY_Young Diemetradons|r, |cRXP_ENEMY_Diemetradons|r and |cRXP_ENEMY_Elder Diemetradons|r. Loot them for |cRXP_LOOT_Webbed Diemetradon Scale|r
    .complete 4503,1 --Webbed Diemetradon Scale (8)
    .mob Young Diemetradon
    .mob Diemetradon
    .mob Elder Diemetradon
step
    .goto 1449/1,-1092.82,-6142.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Williden Marshal|r
    .turnin 3884 >>Turn in Williden's Journal
    .target Williden Marshal
    .isOnQuest 3884
step
    .goto 1449/1,-1080.61,-6176.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spraggle Frock|r
    .turnin 4501 >>Turn in Beware of Pterrordax
    .target Spraggle Frock
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
    .goto 1449/1,-1076.17,-6149.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spark Nilminer|r
    .turnin 3882 >>Turn in Roll the Bones
    .target Spark Nilminer
step
    .goto 1449/1,-1103.18,-6252.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shizzle|r
    .turnin 4503 >>Turn in Shizzle's Flyer
    .target Shizzle
step
    .goto 1449/1,-1151.65,-6181.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Larion|r
    .turnin 4145 >>Turn in Larion and Muigin
    .accept 4147 >>Accept Marvon's Workshop
    .target Larion
step
    .goto 1449/1,-1182.73,-6298.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Karna Remtravel|r
    .accept 4243 >>Accept Chasing A-Me 01
    .target Karna Remtravel
step
    .goto 1449/1,-1970.09,-6380.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_A-Me 01|r
    .turnin 4243 >>Turn in Chasing A-Me 01
    .accept 4244 >>Accept Chasing A-Me 01
    .target A-Me 01
step
    .goto 1449/1,-1970.09,-6380.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_A-Me 01|r
    .turnin 4244 >>Turn in Chasing A-Me 01
    .target A-Me 01
    .isQuestComplete 4244
step << Druid
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .accept 9053 >>Accept A Better Ingredient
    .target Torwa Pathfinder
    .isQuestTurnedIn 9051 --any of: Toxic Test
    .xp <50,1
step << Druid
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .turnin 9053 >>Turn in A Better Ingredient
    .target Torwa Pathfinder
    .isQuestComplete 9053
step
    .goto 1449/1,-1151.65,-6181.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Larion|r
    .turnin 4146 >>Turn in Zapper Fuel
    .target Larion
    .isQuestComplete 4146
step
    .goto 1449/1,-1151.65,-6181.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Larion|r
    .accept 4148 >>Accept Bloodpetal Zapper
    .target Larion
    .isQuestTurnedIn 4146 --any of: Zapper Fuel
    .xp <47,1
step
    .goto 1449/1,-1151.65,-6181.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Larion|r
    .turnin 4148 >>Turn in Bloodpetal Zapper
    .target Larion
    .isOnQuest 4148
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
    .goto 1449/1,-1017.71,-6033.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_J.D. Collie|r
    .turnin 3941 >>Turn in A Gnome's Assistance
    .target J.D. Collie
    .isOnQuest 3941
step
    .goto 1449/1,-1017.71,-6033.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_J.D. Collie|r
    .accept 3942 >>Accept Linken's Memory
    .target J.D. Collie
    .isQuestTurnedIn 3941 --any of: A Gnome's Assistance
    .xp <47,1
step
    .goto 1449/1,-1017.71,-6033.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_J.D. Collie|r
    .turnin 4005 >>Turn in Aquementas
    .target J.D. Collie
    .isQuestComplete 4005
step
    .goto 1449/1,-1017.71,-6033.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_J.D. Collie|r
    .accept 3961 >>Accept Linken's Adventure
    .target J.D. Collie
    .isQuestTurnedIn 4005 --any of: Aquementas
    .xp <47,1
step
    .goto 1449/1,-1119.09,-6166.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Linken|r
    .turnin 3961 >>Turn in Linken's Adventure
    .target Linken
    .isOnQuest 3961
step
    +|cRXP_WARN_That is all of Un'Goro Crater for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Felwood|r: Linken's Memory
    >>|cRXP_FRIENDLY_The Barrens|r: Marvon's Workshop
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
    .goto 1449/1,-2117.35,-7840.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torwa Pathfinder|r
    .accept 4301 >>Accept The Mighty U'cha
    .target Torwa Pathfinder
step
    .goto 1449/1,-611.08,-7210.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krakle|r
    .accept 974 >>Accept Finding the Source
    .target Krakle
step
    .goto 1449/1,-1305.20,-7092.45
    >>Click the |cRXP_PICK_Fire Plume Ridge Hot Spot|r
    .complete 974,1 --Fire Plume Ridge Hot Spot
step
    .goto 1449/1,-1083.94,-6171.15
    >>Escort Ringo to Spraggle Frock at Marshal's Refuge
    .complete 4492,1 --Escort Ringo to Spraggle Frock at Marshal's Refuge
step
    .goto 1449/1,-611.08,-7210.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krakle|r
    .turnin 974 >>Turn in Finding the Source
    .accept 980 >>Accept The New Springs
    .target Krakle
step
    .goto 1449/1,-1386.97,-7196.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ringo|r
    .turnin 4492 >>Turn in Lost!
    .target Ringo
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
    .target Torwa Pathfinder
step
    +|cRXP_WARN_That is all of Un'Goro Crater for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Winterspring|r: The New Springs
step
    .xp 56 >>|cRXP_WARN_The rest of Un'Goro Crater is planned from level 56.|r Come back to this guide then
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
