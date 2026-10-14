-- 8-29 The Barrens: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 4 parts with a level check between them (from level 8, 18, 22, 25).
-- Edit zones/The Barrens.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#name 8-29 The Barrens

step
    .goto 1413/1,-2458.95,-370.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dokimi|r
    .accept 91901 >>Accept A Sealed Crate
    .target Dokimi
step
    .goto 1413/1,-2458.95,-370.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dokimi|r
    >>|cRXP_WARN_The database has no objectives for A Sealed Crate. Skip this step if the quest is not finished|r
    .turnin 91901 >>Turn in A Sealed Crate
    .target Dokimi
    .isOnQuest 91901
step << Orc/Troll
    .goto 1413/1,-2709.24,-403.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zargh|r
    .accept 6365 >>Accept Meats to Orgrimmar
    .target Zargh
step
    .goto 1413/1,-3686.10,303.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kargal Battlescar|r
    .turnin 840 >>Turn in Conscript of the Horde
    .target Kargal Battlescar
    .isOnQuest 840
step
    .goto 1413/1,-3686.10,303.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kargal Battlescar|r
    .accept 842 >>Accept Crossroads Conscription
    .target Kargal Battlescar
    .isQuestTurnedIn 840 --any of: Conscript of the Horde
    .xp <10,1
step
    .goto 1413/1,-3694.20,256.52
    >>Destroy the Demon Seed
    .complete 809,1 --Destroy the Demon Seed
    .isOnQuest 809
step
    .goto 1413/1,-3694.20,256.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ak'Zeloth|r
    .turnin 809 >>Turn in Ak'Zeloth
    .target Ak'Zeloth
    .isOnQuest 809
step
    .goto 1413/1,-3694.20,256.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ak'Zeloth|r
    .accept 924 >>Accept The Demon Seed
    .target Ak'Zeloth
    .isQuestTurnedIn 809 --any of: Ak'Zeloth
    .xp <9,1
step
    .goto 1413/1,-3694.20,258.55
    >>Pick up |cRXP_PICK_Flawed Power Stone|r from the ground
    .collect 4986,1,924,1 --Flawed Power Stone (1)
    .isOnQuest 924
step << Warrior
    .goto 1413/1,-3596.92,185.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Uzzek|r
    .turnin 1505 >>Turn in Veteran Uzzek
    .target Uzzek
    .isOnQuest 1505
step
    .goto 1413/1,-2669.72,-482.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sergra Darkthorn|r
    .turnin 860 >>Turn in Sergra Darkthorn
    .target Sergra Darkthorn
    .isOnQuest 860
step << Orc/Troll
    .goto 1413/1,-2595.75,-437.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Devrak|r
    .turnin 6365 >>Turn in Meats to Orgrimmar while you are here
    .isQuestComplete 6365
    .target Devrak
step << Warrior
    .goto 1413/1,-3176.39,-437.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thun'grim Firegaze|r
    .turnin 1502 >>Turn in Thun'grim Firegaze
    .target Thun'grim Firegaze
    .isOnQuest 1502
step << Warrior
    .goto 1413/1,-3176.39,-437.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thun'grim Firegaze|r
    .accept 1503 >>Accept Forged Steel
    .target Thun'grim Firegaze
    .isQuestTurnedIn 1502 --any of: Thun'grim Firegaze
    .xp <10,1
step << Warrior
    .goto 1413/1,-2955.48,-188.04
    >>Open the |cRXP_PICK_Stolen Iron Chest|r. Loot it for |cRXP_LOOT_Forged Steel Bars|r
    .complete 1503,1 --Forged Steel Bars (1)
    .isOnQuest 1503
step << Warrior
    .goto 1413/1,-3176.39,-437.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thun'grim Firegaze|r
    .turnin 1503 >>Turn in Forged Steel
    .target Thun'grim Firegaze
    .isOnQuest 1503
step
    .goto 1413/1,-2669.72,-482.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sergra Darkthorn|r
    .turnin 842 >>Turn in Crossroads Conscription
    .target Sergra Darkthorn
    .isOnQuest 842
step
    .goto 1413/1,-2669.72,-482.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sergra Darkthorn|r
    .accept 844 >>Accept Plainstrider Menace
    .target Sergra Darkthorn
step << Undead Mage/Troll Mage
    .goto 1413/1,-2666.68,-529.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kil'hala|r
    .turnin 1945 >>Turn in Laughing Sisters
    .target Kil'hala
    .isQuestComplete 1945
step
    .goto 1413/1,-2672.76,-544.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tonga Runetotem|r
    .turnin 886 >>Turn in The Barrens Oases
    .target Tonga Runetotem
    .isOnQuest 886
step
    .goto 1413/1,-2672.76,-544.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tonga Runetotem|r
    .accept 870 >>Accept The Forgotten Pools
    .target Tonga Runetotem
step << Skyborne
    .goto 1413/1,-2595.75,-473.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thork|r
    .turnin 98024 >>Turn in Journey to the Crossroads
    .target Thork
    .isOnQuest 98024
step
    .goto 1413/1,-2595.75,-473.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thork|r
    .accept 871 >>Accept Disrupt the Attacks
    .accept 5041 >>Accept Supplies for the Crossroads
    .target Thork
step << Orc/Troll
    .goto 1413/1,-2595.75,-437.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Devrak|r
    .turnin 6365 >>Turn in Meats to Orgrimmar
    .accept 6384 >>Accept Ride to Orgrimmar
    .target Devrak
step << Undead/Skyborne
    .goto 1413/1,-2595.75,-437.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Devrak|r
    .fp >> Get the The Crossroads flight path
    .target Devrak
step
    .goto 1413/1,-2589.67,-424.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Helbrim|r
    .accept 1492 >>Accept Wharfmaster Dizzywig
    .accept 848 >>Accept Fungal Spores
    .target Apothecary Helbrim
step
    .goto 1413/1,-2589.67,-424.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Helbrim|r
    .turnin 1358 >>Turn in Sample for Helbrim
    .target Apothecary Helbrim
    .isOnQuest 1358
step
    .goto 1413/1,-2639.32,-436.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gazrog|r
    .accept 869 >>Accept Raptor Thieves
    .target Gazrog
step
    .goto 1413/1,-2645.40,-406.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Boorand Plainswind|r
    .target Innkeeper Boorand Plainswind
    .home >>Set your Hearthstone to Innkeeper Boorand Plainswind's inn
step
    .goto 1413/1,-2239.06,324.08
    >>Click the |cRXP_PICK_The Altar of Fire|r
    .complete 924,1 --Destroy the Demon Seed
    .isOnQuest 924
step
    #loop
    .goto 1413/1,-2752.82,-79.94,0
    .goto 1413/1,-2752.82,-79.94,40,0
    .goto 1413/1,-2813.62,-43.46,40,0
    .goto 1413/1,-2893.67,-48.86,40,0
    .goto 1413/1,-2952.44,-99.53,40,0
    .goto 1413/1,-3012.23,-155.61,40,0
    .goto 1413/1,-2961.56,-183.99,40,0
    .goto 1413/1,-2846.04,-148.18,40,0
    .goto 1413/1,-2882.52,-114.40,40,0
    .goto 1413/1,-2852.12,-89.40,40,0
    >>Kill |cRXP_ENEMY_Razormane Water Seekers|r
    >>Kill |cRXP_ENEMY_Razormane Thornweavers|r
    >>Kill |cRXP_ENEMY_Razormane Hunters|r
    .complete 871,1 --Razormane Water Seeker slain (8)
    .complete 871,2 --Razormane Thornweaver slain (8)
    .complete 871,3 --Razormane Hunter slain (3)
    .mob Razormane Water Seeker
    .mob Razormane Thornweaver
    .mob Razormane Hunter
step
    #loop
    .goto 1413/1,-2717.35,-117.78,0
    .goto 1413/1,-2717.35,-117.78,40,0
    .goto 1413/1,-2719.38,-152.23,40,0
    .goto 1413/1,-2748.76,-184.66,40,0
    .goto 1413/1,-2711.27,-213.71,40,0
    .goto 1413/1,-2649.46,-217.77,40,0
    .goto 1413/1,-2617.03,-249.52,40,0
    .goto 1413/1,-2583.59,-279.93,40,0
    .goto 1413/1,-2514.68,-267.09,40,0
    .goto 1413/1,-2547.11,-250.87,40,0
    >>Kill |cRXP_ENEMY_Greater Plainstriders|r, |cRXP_ENEMY_Ornery Plainstriders|r and |cRXP_ENEMY_Fleeting Plainstriders|r. Loot them for |cRXP_LOOT_Plainstrider Beak|r
    .complete 844,1 --Plainstrider Beak (7)
    .mob Greater Plainstrider
    .mob Ornery Plainstrider
    .mob Fleeting Plainstrider
step
    .goto 1413/1,-2669.72,-482.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sergra Darkthorn|r
    .turnin 844 >>Turn in Plainstrider Menace
    .accept 845 >>Accept The Zhevra
    .target Sergra Darkthorn
step
    .goto 1413/1,-2595.75,-473.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thork|r
    .turnin 871 >>Turn in Disrupt the Attacks
    .accept 872 >>Accept The Disruption Ends
    .target Thork
step
    .goto 1413/1,-2607.91,-475.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Darsok Swiftdagger|r
    .accept 867 >>Accept Harpy Raiders
    .target Darsok Swiftdagger
step
    .goto 1413/1,-3307.11,-214.39
    >>Kill |cRXP_ENEMY_Kreenig Snarlsnout|r and loot |cRXP_LOOT_Kreenig Snarlsnout's Tusk|r
    .complete 872,3 --Kreenig Snarlsnout's Tusk (1)
    .mob Kreenig Snarlsnout
step
    #loop
    .goto 1413/1,-3369.94,-80.62,0
    .goto 1413/1,-3369.94,-80.62,40,0
    .goto 1413/1,-3399.32,-60.35,40,0
    .goto 1413/1,-3403.38,-48.19,40,0
    .goto 1413/1,-3373.99,-38.05,40,0
    .goto 1413/1,-3402.36,-10.35,40,0
    .goto 1413/1,-3367.91,-6.30,40,0
    .goto 1413/1,-3326.36,-15.76,40,0
    >>Pick up |cRXP_PICK_Crossroads' Supply Crates|r from the ground
    >>Kill |cRXP_ENEMY_Razormane Geomancers|r
    .complete 5041,1 --Crossroads' Supply Crates (1)
    .complete 872,1 --Razormane Geomancer slain (8)
    .mob Razormane Geomancer
step
    #loop
    .goto 1413/1,-3345.62,-76.56,0
    .goto 1413/1,-3345.62,-76.56,40,0
    .goto 1413/1,-3256.44,-55.62,40,0
    .goto 1413/1,-3180.44,-80.62,40,0
    .goto 1413/1,-3122.68,-47.51,40,0
    .goto 1413/1,-3160.18,-90.75,40,0
    .goto 1413/1,-3177.40,-112.37,40,0
    .goto 1413/1,-3210.84,-85.35,40,0
    >>Kill |cRXP_ENEMY_Razormane Defenders|r
    .complete 872,2 --Razormane Defender slain (8)
    .mob Razormane Defender
step << Shaman
    .goto 1413/1,-3054.79,268.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kranal Fiss|r
    .turnin 2984 >>Turn in Call of Fire
    .target Kranal Fiss
    .isOnQuest 2984
step << Shaman
    .goto 1413/1,-3054.79,268.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kranal Fiss|r
    .turnin 2983 >>Turn in Call of Fire
    .target Kranal Fiss
    .isOnQuest 2983
step << Shaman
    .goto 1413/1,-3054.79,268.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kranal Fiss|r
    .turnin 1523 >>Turn in Call of Fire
    .target Kranal Fiss
    .isOnQuest 1523
step << Shaman
    .goto 1413/1,-3054.79,268.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kranal Fiss|r
    .turnin 1522 >>Turn in Call of Fire
    .target Kranal Fiss
    .isOnQuest 1522
step << Shaman
    .goto 1413/1,-3054.79,268.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kranal Fiss|r
    .turnin 1527 >>Turn in Call of Fire
    .target Kranal Fiss
    .isOnQuest 1527
step << skip
    .goto 1413/1,-1881.35,-2384.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Omusa|r
    .fp Camp Taurajo >> Get the Camp Taurajo flight path << !Tauren
    .target Omusa Thunderhorn
    .isOnQuest 5724
    .isQuestComplete 5723
step
    .goto 1413/1,-2645.40,-406.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Boorand|r
    .vendor >>Stock up on food and water << !Rogue !Warrior
    .vendor >>Stock up on food << Rogue/Warrior
    .target Innkeeper Boorand Plainswind
    .isOnQuest 872,5041,845
step
    .goto 1413/1,-2595.75,-473.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thork|r
    .turnin 5041 >>Turn in Supplies for the Crossroads while you are here
    .isQuestComplete 5041
    .target Thork
step
    .goto 1413/1,-2595.75,-473.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thork|r
    .turnin 872 >>Turn in The Disruption Ends while you are here
    .isQuestComplete 872
    .target Thork
step
    .goto 1413/1,-3694.20,256.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ak'Zeloth|r
    .turnin 924 >>Turn in The Demon Seed
    .target Ak'Zeloth
    .isOnQuest 924
step
    .goto 1413/1,-3728.66,-835.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gazlowe|r
    .accept 887 >>Accept Southsea Freebooters
    .target Gazlowe
step
    .goto 1413/1,-3759.06,-902.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sputtervalve|r
    .accept 894 >>Accept Samophlange
    .target Sputtervalve
step
    .goto 1413/1,-3719.54,-919.07
    >>Click the |cRXP_PICK_WANTED|r
    .accept 895 >>Accept WANTED: Baron Longshore
step << Mage/Priest/Warlock/Shaman/Druid
    .goto 1413/1,-3664.82,-1050.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Wiley|r
    >>|cRXP_BUY_Buy|r |T132796:0|t[Melon Juice] |cRXP_BUY_from him|r << Mage/Warlock/Priest/Shaman/Druid
    .vendor >> Vendor Trash
    .collect 1205,10,895,1 << Mage/Warlock/Priest/Shaman/Druid
    .target Innkeeper Wiley
    .isOnQuest 887
    .xp <15,1
step
    .goto 1413/1,-3791.48,-1698.06
    >>Kill |cRXP_ENEMY_Baron Longshore|r and loot |cRXP_LOOT_Baron Longshore's Head|r
    .complete 895,1 --Baron Longshore's Head (1)
    .mob Baron Longshore
step
    #loop
    .goto 1413/1,-3881.67,-1614.96,0
    .goto 1413/1,-3881.67,-1614.96,40,0
    .goto 1413/1,-3878.63,-1551.45,40,0
    .goto 1413/1,-3878.63,-1379.17,40,0
    .goto 1413/1,-3909.03,-1354.17,40,0
    .goto 1413/1,-3884.71,-1323.09,40,0
    .goto 1413/1,-3819.86,-1316.33,40,0
    .goto 1413/1,-3820.87,-1387.28,40,0
    .goto 1413/1,-3845.19,-1485.24,40,0
    .goto 1413/1,-3819.86,-1541.99,40,0
    >>Kill |cRXP_ENEMY_Southsea Brigands|r
    >>Kill |cRXP_ENEMY_Southsea Cannoneers|r
    .complete 887,1 --Southsea Brigand slain (12)
    .complete 887,2 --Southsea Cannoneer slain (6)
    .mob Southsea Brigand
    .mob Southsea Cannoneer
step
    .goto 1413/1,-3728.66,-835.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gazlowe|r
    .turnin 887 >>Turn in Southsea Freebooters
    .turnin 895 >>Turn in WANTED: Baron Longshore
    .accept 890 >>Accept The Missing Shipment
    .target Gazlowe
step
    .goto 1413/1,-3796.55,-985.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wharfmaster Dizzywig|r
    .turnin 1492 >>Turn in Wharfmaster Dizzywig
    .turnin 890 >>Turn in The Missing Shipment
    .accept 892 >>Accept The Missing Shipment
    .accept 896 >>Accept Miner's Fortune
    .target Wharfmaster Dizzywig
step
    .goto 1413/1,-3728.66,-835.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gazlowe|r
    .turnin 892 >>Turn in The Missing Shipment
    .accept 888 >>Accept Stolen Booty
    .target Gazlowe
step
    #loop
    .goto 1413/1,-2686.95,-846.10,0
    .goto 1413/1,-2686.95,-846.10,40,0
    .goto 1413/1,-2641.35,-871.77,40,0
    .goto 1413/1,-2584.60,-887.31,40,0
    .goto 1413/1,-2529.88,-944.74,40,0
    .goto 1413/1,-2568.39,-949.47,40,0
    .goto 1413/1,-2617.03,-938.66,40,0
    .goto 1413/1,-2651.48,-948.79,40,0
    >>Kill |cRXP_ENEMY_Zhevra Runners|r, |cRXP_ENEMY_Zhevra Chargers|r and |cRXP_ENEMY_Zhevra Coursers|r. Loot them for |cRXP_LOOT_Zhevra Hooves|r
    .complete 845,1 --Zhevra Hooves (4)
    .mob Zhevra Runner
    .mob Zhevra Charger
    .mob Zhevra Courser
step << !Druid
    .goto 1413/1,-1881.35,-2383.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Omusa|r
    .fp Camp Taurajo >> Get the Camp Taurajo flight path
    .target Omusa Thunderhorn
step << Druid
    .goto 1413/1,-1881.35,-2383.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Omusa|r
    .fp Camp Taurajo >> Get the Camp Taurajo flight path
    .fly Thunder Bluff >>Fly to Thunder Bluff << Tauren
    .target Omusa Thunderhorn
step << Tauren
    .xp 9 >>Grind to level 9 (Journey to the Crossroads needs it)
step << Tauren
    .goto 1413/1,-1924.92,-2347.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kirge Sternhorn|r
    .accept 854 >>Accept Journey to the Crossroads
    .target Kirge Sternhorn
step
    .goto 1413/1,-2595.75,-473.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thork|r
    .turnin 5041 >>Turn in Supplies for the Crossroads
    .turnin 872 >>Turn in The Disruption Ends
    .turnin 854 >>Turn in Journey to the Crossroads << Tauren
    .target Thork
step
    .goto 1413/1,-2669.72,-482.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sergra Darkthorn|r
    .turnin 845 >>Turn in The Zhevra
    .accept 903 >>Accept Prowlers of the Barrens
    .target Sergra Darkthorn
step << Tauren
    .xp 10 >>Grind to level 10 (A Bundle of Hides needs it)
step << Tauren
    .goto 1413/1,-2566.36,-350.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jahan Hawkwing|r
    .accept 6361 >>Accept A Bundle of Hides
    .target Jahan Hawkwing
step << Tauren
    .goto 1413/1,-2595.75,-437.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Devrak|r
    .turnin 6361 >>Turn in A Bundle of Hides
    .target Devrak
step << Tauren
    .goto 1413/1,-2595.75,-437.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Devrak|r
    .accept 6362 >>Accept Ride to Thunder Bluff
    .target Devrak
    .xp <10,1
step << Tauren
    .goto 1413/1,-2566.36,-350.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jahan Hawkwing|r
    .turnin 6364 >>Turn in Return to Jahan
    .target Jahan Hawkwing
    .isOnQuest 6364
step << Troll Hunter/Orc Hunter/Skyborne Hunter
    .goto 1413/1,-2556.23,-351.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_Talk to|r |cRXP_FRIENDLY_Uthrok|r
    .vendor >> |cRXP_BUY_Buy a|r |T135490:0|t[|cRXP_FRIENDLY_Fine Longbow|r] |cRXP_BUY_from him if it's available and stock up on arrows|r
    >>|cRXP_WARN_If it's not up, buy a|r |T135490:0|t[Reinforced Bow] |cRXP_WARN_instead|r
    .collect 2515,1200,870,1 << Hunter
    .target Uthrok
    .isOnQuest 903
step
    .goto 1413/1,-1971.54,-306.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Regthar Deathgate|r
    .accept 850 >>Accept Kolkar Leaders
    .accept 855 >>Accept Centaur Bracers
    .target Regthar Deathgate
step
    .goto 1413/1,-1943.16,90.32
    >>Explore the waters of the Forgotten Pools
    .complete 870,1 --Explore the waters of the Forgotten Pools
step
    .goto 1413/1,-1714.15,23.43
    >>Kill |cRXP_ENEMY_Barak Kodobane|r and loot |cRXP_LOOT_Barak's Head|r
    .complete 850,1 --Barak's Head (1)
    .mob Barak Kodobane
step
    .goto 1413/1,-1971.54,-306.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Regthar Deathgate|r
    .turnin 850 >>Turn in Kolkar Leaders
    .target Regthar Deathgate
step
    #loop
    .goto 1413/1,-1544.92,282.19,0
    .goto 1413/1,-1544.92,282.19,40,0
    .goto 1413/1,-1621.94,331.51,40,0
    .goto 1413/1,-1574.31,356.51,40,0
    .goto 1413/1,-1552.02,480.15,40,0
    .goto 1413/1,-1501.35,477.45,40,0
    .goto 1413/1,-1483.11,415.97,40,0
    .goto 1413/1,-1518.58,384.21,40,0
    .goto 1413/1,-1442.58,349.08,40,0
    .goto 1413/1,-1443.59,295.71,40,0
    >>Kill |cRXP_ENEMY_Witchwing Harpies|r, |cRXP_ENEMY_Witchwing Roguefeathers|r, |cRXP_ENEMY_Witchwing Slayers|r and |cRXP_ENEMY_Witchwing Ambushers|r. Loot them for |cRXP_LOOT_Witchwing Talon|r
    .complete 867,1 --Witchwing Talon (8)
    .mob Witchwing Harpy
    .mob Witchwing Roguefeather
    .mob Witchwing Slayer
    .mob Witchwing Ambusher
step
    .goto 1413/1,-1815.48,787.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vrang Wildgore|r
    .accept 95494 >>Accept Bruised Pride and Lion Hides
    .accept 95507 >>Accept Vrang's Game
    .target Vrang Wildgore
step
    .goto 1413/1,-1815.48,786.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vrang|r
    >>|cRXP_FRIENDLY_Vrang|r |cRXP_WARN_sells|r |T133476:0|t[|cRXP_FRIENDLY_Heavy Spiked Mace|r] |cRXP_WARN_which is a limited supply item|r << Tauren Warrior/Tauren Shaman/Druid
    .vendor	>> Vendor trash and repair
    .target Vrang Wildgore
step
    #loop
    .goto 1413/1,-3630.36,-577.88,0
    .goto 1413/1,-3630.36,-577.88,40,0
    .goto 1413/1,-3622.26,-598.82,40,0
    .goto 1413/1,-3645.56,-643.41,40,0
    .goto 1413/1,-3676.98,-617.06,40,0
    .goto 1413/1,-3668.87,-580.58,40,0
    .goto 1413/1,-3651.64,-570.44,40,0
    >>Kill |cRXP_ENEMY_Savannah Patriarches|r and |cRXP_ENEMY_Savannah Matriarches|r. Loot them for |cRXP_LOOT_Savannah Lion Hide|r
    .complete 95494,1 --Savannah Lion Hide (6)
    .mob Savannah Patriarch
    .mob Savannah Matriarch
step << Warrior
    .xp 10 >>Grind to level 10 (Path of Defense needs it)
step << Warrior
    .goto 1413/1,-3596.92,185.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Uzzek|r
    .accept 1498 >>Accept Path of Defense
    .target Uzzek
step << Warrior
    .goto 1413/1,-3596.92,185.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Uzzek|r
    .turnin 1498 >>Turn in Path of Defense
    .target Uzzek
    .isQuestComplete 1498
step << Warrior
    .goto 1413/1,-3596.92,185.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Uzzek|r
    .accept 1502 >>Accept Thun'grim Firegaze
    .target Uzzek
    .isQuestTurnedIn 1498,1819 --any of: Path of Defense, Ulag the Cleaver
    .xp <10,1
step
    #loop
    .goto 1413/1,-2200.55,761.21,0
    .goto 1413/1,-2200.55,761.21,40,0
    .goto 1413/1,-2139.75,774.72,40,0
    .goto 1413/1,-2078.95,734.19,40,0
    .goto 1413/1,-2139.75,734.19,40,0
    >>Loot the |cRXP_PICK_Sprung Traps|r for |cRXP_LOOT_Trapped Game|r
    .complete 95507,1 --Trapped Game (8)
step
    .goto 1413/1,-1815.48,787.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vrang Wildgore|r
    .turnin 95494 >>Turn in Bruised Pride and Lion Hides
    .turnin 95507 >>Turn in Vrang's Game
    .accept 95495 >>Accept The Hermit Tanner
    .target Vrang Wildgore
step
    .goto 1413/1,-1634.10,839.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Walton|r
    .turnin 95495 >>Turn in The Hermit Tanner
    .accept 95621 >>Accept Trouble in the Valley
    .target Walton
step
    #loop
    .goto 1413/1,-1658.42,639.60,0
    .goto 1413/1,-1658.42,639.60,40,0
    .goto 1413/1,-1617.88,616.63,40,0
    .goto 1413/1,-1590.52,587.58,40,0
    .goto 1413/1,-1522.63,553.80,40,0
    .goto 1413/1,-1552.02,521.37,40,0
    .goto 1413/1,-1601.67,486.91,40,0
    .goto 1413/1,-1709.08,506.50,40,0
    .goto 1413/1,-1655.38,535.55,40,0
    .goto 1413/1,-1627.00,575.42,40,0
    >>Kill |cRXP_ENEMY_Corporal Adamore|r and loot |cRXP_LOOT_Benedict's Orders|r
    .complete 95621,1 --Benedict's Orders (1)
    .mob Corporal Adamore
step
    .goto 1413/1,-1634.10,839.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Walton|r
    .turnin 95621 >>Turn in Trouble in the Valley
    .accept 95508 >>Accept Unwelcome Guests
    .target Walton
step
    .goto 1413/1,-1634.10,839.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Walton|r
    >>|cRXP_WARN_The database has no objectives for Unwelcome Guests. Skip this step if the quest is not finished|r
    .turnin 95508 >>Turn in Unwelcome Guests
    .target Walton
    .isOnQuest 95508
step
    .goto 1413/1,-2253.24,1246.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kadrak|r
    .turnin 6542 >>Turn in Report to Kadrak
    .target Kadrak
    .isOnQuest 6542
step
    .goto 1413/1,-2686.95,825.40
    >>Click the |cRXP_PICK_Control Console|r
    .turnin 894 >>Turn in Samophlange
    .accept 900 >>Accept Samophlange
step
    .goto 1413/1,-2679.86,831.48
    >>Click the |cRXP_PICK_Main Control Valve|r
    >>Click the |cRXP_PICK_Regulator Valve|r
    >>Click the |cRXP_PICK_Fuel Control Valve|r
    .complete 900,1 --Shut off Main Control Valve
    .complete 900,3 --Shut off Regulator Valve
    .complete 900,2 --Shut off Fuel Control Valve
step
    .goto 1413/1,-2686.95,825.40
    >>Click the |cRXP_PICK_Control Console|r
    .turnin 900 >>Turn in Samophlange
    .accept 901 >>Accept Samophlange
step
    .goto 1413/1,-2731.54,910.53
    >>Kill |cRXP_ENEMY_Tinkerer Sniggles|r and loot |cRXP_LOOT_Console Key|r
    .complete 901,1 --Console Key (1)
    .mob Tinkerer Sniggles
step
    .goto 1413/1,-2686.95,825.40
    >>Click the |cRXP_PICK_Control Console|r
    .turnin 901 >>Turn in Samophlange
    .accept 902 >>Accept Samophlange
step
    #loop
    .goto 1413/1,-2917.99,851.07,0
    .goto 1413/1,-2917.99,851.07,40,0
    .goto 1413/1,-2947.38,913.90,40,0
    .goto 1413/1,-2975.75,978.76,40,0
    .goto 1413/1,-2949.40,1082.13,40,0
    .goto 1413/1,-2909.88,1042.27,40,0
    .goto 1413/1,-2919.00,988.22,40,0
    >>Kill |cRXP_ENEMY_Sunscale Lashtails|r, |cRXP_ENEMY_Sunscale Screechers|r, |cRXP_ENEMY_Sunscale Scytheclaws|r and |cRXP_ENEMY_Ishamuhales|r. Loot them for |cRXP_LOOT_Raptor Head|r
    .complete 869,1 --Raptor Head (12)
    .mob Sunscale Lashtail
    .mob Sunscale Screecher
    .mob Sunscale Scytheclaw
    .mob Ishamuhale
step
    #loop
    .goto 1413/1,-2849.08,701.76,0
    .goto 1413/1,-2849.08,701.76,40,0
    .goto 1413/1,-2834.90,660.54,40,0
    .goto 1413/1,-2776.12,588.93,40,0
    .goto 1413/1,-2778.15,526.09,40,0
    .goto 1413/1,-3034.52,522.04,40,0
    .goto 1413/1,-3016.28,627.44,40,0
    .goto 1413/1,-2951.43,608.52,40,0
    .goto 1413/1,-2914.95,625.41,40,0
    .goto 1413/1,-2869.35,593.66,40,0
    >>Kill |cRXP_ENEMY_Savannah Prowlers|r. Loot them for |cRXP_LOOT_Prowler Claws|r
    .complete 903,1 --Prowler Claws (7)
    .mob Savannah Prowler
step
    .goto 1413/1,-3102.42,1105.78
    >>Grinding to level 16 here is important, due to the next 3 quests being quite hard
    .xp 16
step
    #loop
    .goto 1413/1,-3577.67,1240.91,0
    .goto 1413/1,-3577.67,1240.91,40,0
    .goto 1413/1,-3621.24,1278.07,40,0
    .goto 1413/1,-3645.56,1246.99,40,0
    .goto 1413/1,-3683.06,1236.85,40,0
    .goto 1413/1,-3680.02,1280.77,40,0
    .goto 1413/1,-3650.63,1325.36,40,0
    .goto 1413/1,-3690.15,1355.09,40,0
    .goto 1413/1,-3633.40,1387.52,40,0
    .goto 1413/1,-3564.50,1345.63,40,0
    >>Kill |cRXP_ENEMY_Venture Co. Enforcers|r, |cRXP_ENEMY_Venture Co. Overseers|r and |cRXP_ENEMY_Boss Copperplugs|r. Loot them for |cRXP_LOOT_Cats Eye Emerald|r
    .complete 896,1 --Cats Eye Emerald (1)
    .mob Venture Co. Enforcer
    .mob Venture Co. Overseer
    .mob Boss Copperplug
step
    .goto 1413/1,-2645.40,-406.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Boorand|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Boorand Plainswind
step
    .goto 1413/1,-2669.72,-482.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sergra Darkthorn|r
    .turnin 903 >>Turn in Prowlers of the Barrens while you are here
    .isQuestComplete 903
    .target Sergra Darkthorn
step
    .goto 1413/1,-2607.91,-475.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Darsok Swiftdagger|r
    .turnin 867 >>Turn in Harpy Raiders while you are here
    .isQuestComplete 867
    .target Darsok Swiftdagger
step
    #completewith next
    .hs >>Hearth to Innkeeper Boorand Plainswind's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1413/1,-2639.32,-436.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gazrog|r
    .turnin 869 >>Turn in Raptor Thieves
    .accept 3281 >>Accept Stolen Silver
    .target Gazrog
step << Tauren
    .goto 1413/1,-2595.75,-437.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Devrak|r
    .accept 6362 >>Accept Ride to Thunder Bluff
    .target Devrak
step
    .goto 1413/1,-2607.91,-475.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Darsok Swiftdagger|r
    .turnin 867 >>Turn in Harpy Raiders
    .accept 875 >>Accept Harpy Lieutenants
    .target Darsok Swiftdagger
step
    .goto 1413/1,-2641.35,-521.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mankrik|r
    .accept 899 >>Accept Consumed by Hatred
    .target Mankrik
step
    .goto 1413/1,-2672.76,-544.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tonga Runetotem|r
    .turnin 870 >>Turn in The Forgotten Pools
    .accept 877 >>Accept The Stagnant Oasis
    .target Tonga Runetotem
step
    .goto 1413/1,-2669.72,-482.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sergra Darkthorn|r
    .turnin 903 >>Turn in Prowlers of the Barrens
    .accept 881 >>Accept Echeyakee
    .target Sergra Darkthorn
step << Shaman
    .goto 1413/1,-3054.79,268.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kranal Fiss|r
    .accept 1524 >>Accept Call of Fire
    .target Kranal Fiss
step << Orc/Troll
    .goto 1413/1,-2709.24,-403.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zargh|r
    .turnin 6386 >>Turn in Return to the Crossroads.
    .target Zargh
    .isOnQuest 6386
step
    .goto 1413/1,-3037.56,451.10
    >>Kill |cRXP_ENEMY_Echeyakee|r and loot |cRXP_LOOT_Echeyakee's Hide|r
    .complete 881,1 --Echeyakee's Hide (1)
    .mob Echeyakee
step
    .goto 1413/1,-2669.72,-482.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sergra Darkthorn|r
    .turnin 881 >>Turn in Echeyakee
    .accept 905 >>Accept The Angry Scytheclaws
    .target Sergra Darkthorn
step << Rogue
    .goto 1413/1,-3768.18,-841.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wrenix the Wretched|r
    .turnin 2382 >>Turn in Wrenix of Ratchet
    .target Wrenix the Wretched
    .isOnQuest 2382
step
    .goto 1413/1,-3768.18,-841.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wrenix the Wretched|r
    .accept 97253 >>Accept Parts and Pieces
    .target Wrenix the Wretched
step
    .goto 1413/1,-3759.06,-902.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sputtervalve|r
    .turnin 902 >>Turn in Samophlange
    .accept 3921 >>Accept Wenikee Boltbucket
    .target Sputtervalve
step
    .goto 1413/1,-3796.55,-985.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wharfmaster Dizzywig|r
    .turnin 896 >>Turn in Miner's Fortune
    .target Wharfmaster Dizzywig
step
    .goto 1413/1,-3697.24,-929.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mebok Mizzyrix|r
    .accept 865 >>Accept Raptor Horns
    .target Mebok Mizzyrix
step
    .goto 1413/1,-3664.82,-1050.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to|cRXP_FRIENDLY_Innkeeper Wiley|r
    >>|cRXP_BUY_Buy|r |T132796:0|t[Melon Juice] |cRXP_BUY_from him|r << Mage/Warlock/Priest/Shaman/Druid
    .vendor >> Vendor Trash
    .collect 1205,10,888,1 << Mage/Warlock/Priest/Shaman/Druid
    .target Innkeeper Wiley
step
    #loop
    .goto 1413/1,-3457.08,-1286.61,0
    .goto 1413/1,-3457.08,-1286.61,40,0
    .goto 1413/1,-3357.78,-1273.09,40,0
    .goto 1413/1,-3339.54,-1321.06,40,0
    .goto 1413/1,-3289.88,-1368.36,40,0
    .goto 1413/1,-3383.11,-1380.52,40,0
    .goto 1413/1,-3418.58,-1421.06,40,0
    .goto 1413/1,-3495.59,-1415.65,40,0
    .goto 1413/1,-3508.76,-1342.01,40,0
    .goto 1413/1,-3437.83,-1354.85,40,0
    >>Kill |cRXP_ENEMY_Sunscale Lashtails|r, |cRXP_ENEMY_Sunscale Screechers|r and |cRXP_ENEMY_Sunscale Scytheclaws|r. Loot them for |cRXP_LOOT_Sunscale Feather|r
    .collect 5165,1,905,1 --Sunscale Feather (1)
    .mob Sunscale Lashtail
    .mob Sunscale Screecher
    .mob Sunscale Scytheclaw
step
    .goto 1413/1,-3659.75,-1488.62
    >>Open the |cRXP_PICK_Pile of Complicated Parts|r. Loot it for |cRXP_LOOT_Handful of Complicated Parts|r
    .complete 97253,1 --Handful of Complicated Parts (1)
step
    .goto 1413/1,-3819.86,-1714.95
    >>Open the |cRXP_PICK_Fragile - Do Not Drop|r. Loot it for |cRXP_LOOT_Telescopic Lens|r
    >>Open the |cRXP_PICK_Drizzlik's Emporium|r. Loot it for |cRXP_LOOT_Shipment of Boots|r
    .complete 888,2 --Telescopic Lens (1)
    .complete 888,1 --Shipment of Boots (1)
step
    .goto 1413/1,-3258.47,-2027.09
    >>Pick up |cRXP_PICK_Stolen Silver|r from the ground
    .complete 3281,1 --Stolen Silver (1)
step
    #completewith Along101
    >>As you go: Kill |cRXP_ENEMY_Kolkar Wranglers|r, |cRXP_ENEMY_Kolkar Stormers|r, |cRXP_ENEMY_Kolkar Pack Runners|r and |cRXP_ENEMY_Kolkar Marauders|r. Loot them for |cRXP_LOOT_Centaur Bracers|r. |cRXP_WARN_Anything left is finished later|r
    .complete 855,1 --Centaur Bracers (15)
    .mob Kolkar Wrangler
    .mob Kolkar Stormer
    .mob Kolkar Pack Runner
    .mob Kolkar Marauder
step
    #label Along101
    #loop
    .goto 1413/1,-2982.84,-1381.19,0
    .goto 1413/1,-2982.84,-1381.19,40,0
    .goto 1413/1,-3026.42,-1323.09,40,0
    .goto 1413/1,-3066.95,-1300.80,40,0
    .goto 1413/1,-3012.23,-1275.80,40,0
    .goto 1413/1,-3024.39,-1233.23,40,0
    .goto 1413/1,-3081.14,-1187.97,40,0
    .goto 1413/1,-2962.58,-1208.91,40,0
    .goto 1413/1,-2967.64,-1262.28,40,0
    .goto 1413/1,-2977.78,-1303.50,40,0
    >>Click the |cRXP_PICK_Bubbling Fissure|r
    >>Loot the |cRXP_PICK_Laden Mushrooms|r for |cRXP_LOOT_Fungal Spores|r
    .complete 877,1 --Test the Dried Seeds
    .complete 848,1 --Fungal Spores (4)
step
    .goto 1413/1,-2589.67,-424.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Helbrim|r
    .turnin 848 >>Turn in Fungal Spores
    .target Apothecary Helbrim
step
    .goto 1413/1,-2639.32,-436.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gazrog|r
    .turnin 3281 >>Turn in Stolen Silver while you are here
    .isQuestComplete 3281
    .target Gazrog
step
    .goto 1413/1,-2707.22,-1502.81
    >>Click the |cRXP_PICK_Blue Raptor Nest|r
    .complete 905,1 --Visit Blue Raptor Nest
step
    .goto 1413/1,-2693.03,-1533.21
    >>Click the |cRXP_PICK_Red Raptor Nest|r
    >>Click the |cRXP_PICK_Yellow Raptor Nest|r
    .complete 905,3 --Visit Red Raptor Nest
    .complete 905,2 --Visit Yellow Raptor Nest
step
    .goto 1413/1,-1881.35,-2384.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Omusa|r
    .fp Camp Taurajo >> Get the Camp Taurajo flight path << !Tauren
    .target Omusa Thunderhorn
    .isOnQuest 5724
step
    .goto 1413/1,-2641.35,-521.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mankrik|r
    .accept 95774 >>Accept Her Name Is Olgra
    .target Mankrik
step
    .goto 1413/1,-2672.76,-544.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tonga Runetotem|r
    .turnin 877 >>Turn in The Stagnant Oasis
    .accept 880 >>Accept Altered Beings
    .target Tonga Runetotem
step
    .goto 1413/1,-2669.72,-482.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sergra Darkthorn|r
    .turnin 905 >>Turn in The Angry Scytheclaws
    .accept 3261 >>Accept Jorn Skyseer
    .target Sergra Darkthorn
step
    .goto 1413/1,-2639.32,-436.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gazrog|r
    .turnin 3281 >>Turn in Stolen Silver
    .target Gazrog
step
    #loop
    .goto 1413/1,-1976.60,-876.50,0
    .goto 1413/1,-1976.60,-876.50,40,0
    .goto 1413/1,-2019.16,-956.23,40,0
    .goto 1413/1,-2043.48,-1149.46,40,0
    .goto 1413/1,-2018.15,-1116.35,40,0
    .goto 1413/1,-1981.67,-1085.27,40,0
    .goto 1413/1,-1918.84,-1078.51,40,0
    .goto 1413/1,-1945.19,-1011.63,40,0
    .goto 1413/1,-1883.38,-990.01,40,0
    .goto 1413/1,-1868.18,-937.98,40,0
    >>Kill |cRXP_ENEMY_Kolkar Wranglers|r, |cRXP_ENEMY_Kolkar Stormers|r, |cRXP_ENEMY_Kolkar Pack Runners|r and |cRXP_ENEMY_Kolkar Marauders|r. Loot them for |cRXP_LOOT_Centaur Bracers|r
    .complete 855,1 --Centaur Bracers (15)
    .mob Kolkar Wrangler
    .mob Kolkar Stormer
    .mob Kolkar Pack Runner
    .mob Kolkar Marauder
step
    .goto 1413/1,-1971.54,-306.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Regthar Deathgate|r
    .turnin 855 >>Turn in Centaur Bracers
    .target Regthar Deathgate
step << Tauren Druid
    .goto 1413/1,-2281.62,336.24
    >>Open the |cRXP_PICK_Dreadmist Peak Pool|r. Loot it for |cRXP_LOOT_Filled Dreadmist Peak Sampler|r
    .complete 6127,1 --Filled Dreadmist Peak Sampler (1)
    .isOnQuest 6127
step
    #loop
    .goto 1413/1,-1447.64,533.53,0
    .goto 1413/1,-1447.64,533.53,40,0
    .goto 1413/1,-1405.08,558.52,40,0
    .goto 1413/1,-1347.32,553.12,40,0
    .goto 1413/1,-1286.52,516.64,40,0
    .goto 1413/1,-1253.08,549.07,40,0
    .goto 1413/1,-1151.75,550.42,40,0
    .goto 1413/1,-1220.66,503.80,40,0
    .goto 1413/1,-1310.84,420.70,40,0
    .goto 1413/1,-1380.76,475.42,40,0
    >>Kill |cRXP_ENEMY_Witchwing Slayers|r. Loot them for |cRXP_LOOT_Harpy Lieutenant Ring|r
    .complete 875,1 --Harpy Lieutenant Ring (6)
    .mob Witchwing Slayer
step
    .goto 1413/1,-950.10,-271.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Seereth Stonebreak|r
    .turnin 1061 >>Turn in The Spirits of Stonetalon
    .target Seereth Stonebreak
    .isOnQuest 1061
step
    .goto 1413/1,-950.10,-271.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Seereth Stonebreak|r
    .accept 1062 >>Accept Goblin Invaders
    .target Seereth Stonebreak
step
    .goto 1413/1,-943.00,-263.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Makaba Flathoof|r
    .accept 6548 >>Accept Avenge My Village
    .target Makaba Flathoof
step
    .goto 1413/1,-943.00,-263.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Makaba Flathoof|r
    .turnin 6548 >>Turn in Avenge My Village
    .target Makaba Flathoof
    .isQuestComplete 6548
step
    .goto 1413/1,-943.00,-263.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Makaba Flathoof|r
    .accept 6629 >>Accept Kill Grundig Darkcloud
    .target Makaba Flathoof
    .isQuestTurnedIn 6548 --any of: Avenge My Village
    .xp <12,1
step << Tauren Druid
    #completewith next
    .hs >>Hearth to Innkeeper Boorand Plainswind's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step << Tauren Druid
    .goto 1413/1,-2672.76,-544.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tonga Runetotem|r
    .turnin 6127 >>Turn in The Principal Source
    .target Tonga Runetotem
    .isOnQuest 6127
step
    .goto 1413/1,-3759.06,-902.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sputtervalve|r
    .turnin 1094 >>Turn in Further Instructions
    .target Sputtervalve
    .isOnQuest 1094
step
    .goto 1413/1,-3768.18,-841.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wrenix the Wretched|r
    .turnin 97253 >>Turn in Parts and Pieces while you are here
    .isQuestComplete 97253
    .target Wrenix the Wretched
step
    .goto 1413/1,-3728.66,-835.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gazlowe|r
    .turnin 888 >>Turn in Stolen Booty while you are here
    .isQuestComplete 888
    .target Gazlowe
step << Shaman
    .goto 1413/1,-4047.86,-1345.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Islen Waterseer|r
    .turnin 96 >>Turn in Call of Water
    .target Islen Waterseer
    .isOnQuest 96
step << Shaman
    .goto 1413/1,-4047.86,-1345.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Islen Waterseer|r
    .turnin 2986 >>Turn in Call of Water
    .target Islen Waterseer
    .isOnQuest 2986
step << Shaman
    .goto 1413/1,-4047.86,-1345.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Islen Waterseer|r
    .turnin 2985 >>Turn in Call of Water
    .target Islen Waterseer
    .isOnQuest 2985
step << Shaman
    .goto 1413/1,-4047.86,-1345.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Islen Waterseer|r
    .turnin 1529 >>Turn in Call of Water
    .target Islen Waterseer
    .isOnQuest 1529
step << Shaman
    .goto 1413/1,-4047.86,-1345.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Islen Waterseer|r
    .turnin 1528 >>Turn in Call of Water
    .target Islen Waterseer
    .isOnQuest 1528
step << Warlock
    #completewith next
    .hs >>Hearth to Innkeeper Boorand Plainswind's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step << Warlock
    .goto 1413/1,-2639.32,-436.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gazrog|r
    .turnin 1509 >>Turn in News of Dogran
    .target Gazrog
    .isOnQuest 1509
step
    .goto 1413/1,-2607.91,-475.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Darsok Swiftdagger|r
    .turnin 875 >>Turn in Harpy Lieutenants while you are here
    .isQuestComplete 875
    .target Darsok Swiftdagger
step
    .goto 1413/1,-950.10,-271.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Seereth Stonebreak|r
    .turnin 1062 >>Turn in Goblin Invaders
    .target Seereth Stonebreak
    .isQuestComplete 1062
step
    .goto 1413/1,-1995.86,-2375.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Byula|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Byula
    .isOnQuest 3261
step
    .goto 1413/1,-1922.90,-2383.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jorn Skyseer|r
    .turnin 3261 >>Turn in Jorn Skyseer
    .target Jorn Skyseer
step
    #loop
    .goto 1413/1,-2251.22,-2049.39,0
    .goto 1413/1,-2251.22,-2049.39,40,0
    .goto 1413/1,-2219.80,-2004.12,40,0
    .goto 1413/1,-2147.86,-1948.72,40,0
    .goto 1413/1,-2169.14,-1863.59,40,0
    .goto 1413/1,-2219.80,-1789.95,40,0
    .goto 1413/1,-2282.63,-1834.54,40,0
    .goto 1413/1,-2331.27,-1873.73,40,0
    .goto 1413/1,-2248.18,-1932.50,40,0
    .goto 1413/1,-2297.83,-1994.66,40,0
    >>Kill |cRXP_ENEMY_Razormane Raiders|r. Loot them for |cRXP_LOOT_Olgra's Adornments|r
    .complete 95774,1 --Olgra's Adornments (4)
    .mob Razormane Raider
step
    #loop
    .goto 1413/1,-2361.67,-2007.50,0
    .goto 1413/1,-2361.67,-2007.50,40,0
    .goto 1413/1,-2498.47,-1938.59,40,0
    .goto 1413/1,-2622.10,-1968.31,40,0
    .goto 1413/1,-2812.60,-2003.45,40,0
    .goto 1413/1,-2643.38,-2285.18,40,0
    .goto 1413/1,-2487.32,-2289.23,40,0
    .goto 1413/1,-2377.88,-2208.84,40,0
    .goto 1413/1,-2456.92,-2108.17,40,0
    .goto 1413/1,-2565.35,-2094.65,40,0
    >>Kill |cRXP_ENEMY_Bristleback Hunters|r, |cRXP_ENEMY_Bristleback Water Seekers|r, |cRXP_ENEMY_Bristleback Thornweavers|r and |cRXP_ENEMY_Bristleback Geomancers|r. Loot them for |cRXP_LOOT_Bristleback Quilboar Tusk|r
    .complete 899,1 --Bristleback Quilboar Tusk (60)
    .mob Bristleback Hunter
    .mob Bristleback Water Seeker
    .mob Bristleback Thornweaver
    .mob Bristleback Geomancer
step << Warlock/Shaman
    .goto 1413/1,-2515.7,-2076.41,60,0
    .goto 1413/1,-2518.74,-2125.73,60,0
    .goto 1413/1,-2517.72,-2223.7,60,0
    .goto 1413/1,-2486.31,-2254.1,60,0
    .goto 1413/1,-2494.42,-2282.48,60,0
    .goto 1413/1,-2531.91,-2272.34,60,0
    .goto 1413/1,-2571.43,-2295.31,60,0
    .goto 1413/1,-2620.07,-2285.18,60,0
    .goto 1413/1,-2625.14,-2245.32,60,0
    .goto 1413/1,-2755.86,-2082.49,60,0
    .goto 1413/1,-2813.62,-2054.12,60,0
    .goto 1413/1,-2811.59,-2004.12,60,0
    .goto 1413/1,-2783.22,-1949.39,60,0
    .goto 1413/1,-2747.75,-1889.26,60,0
    .goto 1413/1,-2709.24,-1913.59,60,0
    .goto 1413/1,-2706.2,-1948.72,60,0
    .goto 1413/1,-2687.96,-1973.04,60,0
    .goto 1413/1,-2678.84,-2016.28,60,0
    .goto 1413/1,-2584.6,-2050.74,60,0
    .xp 19+9500 >> Grind to 9500+/21300 xp
step
    #loop
    .goto 1413/1,-2463.00,-1541.32,0
    .goto 1413/1,-2463.00,-1541.32,40,0
    .goto 1413/1,-2480.23,-1504.83,40,0
    .goto 1413/1,-2716.34,-1498.75,40,0
    .goto 1413/1,-2709.24,-1513.62,40,0
    .goto 1413/1,-2687.96,-1537.26,40,0
    .goto 1413/1,-2661.62,-1537.26,40,0
    >>Kill |cRXP_ENEMY_Sunscale Scytheclaws|r, |cRXP_ENEMY_Ishamuhales|r and |cRXP_ENEMY_Takk the Leapers|r. Loot them for |cRXP_LOOT_Intact Raptor Horn|r
    .complete 865,1 --Intact Raptor Horn (5)
    .mob Sunscale Scytheclaw
    .mob Ishamuhale
    .mob Takk the Leaper
step
    .goto 1413/1,-1886.42,-2387.20
    .fp Camp Taurajo >> Get the Camp Taurajo flight path
    .fly Crossroads >>Fly to Crossroads
step
    #loop
    .goto 1413/1,-3014.26,-1333.90,0
    .goto 1413/1,-3014.26,-1333.90,40,0
    .goto 1413/1,-3043.64,-1316.33,40,0
    .goto 1413/1,-3054.79,-1281.88,40,0
    .goto 1413/1,-3048.71,-1223.77,40,0
    .goto 1413/1,-3013.24,-1190.67,40,0
    .goto 1413/1,-2984.87,-1220.40,40,0
    .goto 1413/1,-2950.42,-1240.66,40,0
    .goto 1413/1,-3011.22,-1254.18,40,0
    .goto 1413/1,-2978.79,-1281.88,40,0
    >>Kill |cRXP_ENEMY_Oasis Snapjaws|r. Loot them for |cRXP_LOOT_Altered Snapjaw Shell|r
    .complete 880,1 --Altered Snapjaw Shell (8)
    .mob Oasis Snapjaw
step
    .goto 1413/1,-3768.18,-841.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wrenix the Wretched|r
    .turnin 97253 >>Turn in Parts and Pieces
    .target Wrenix the Wretched
step
    .goto 1413/1,-3728.66,-835.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gazlowe|r
    .turnin 888 >>Turn in Stolen Booty
    .target Gazlowe
step
    .goto 1413/1,-3697.24,-929.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mebok Mizzyrix|r
    .turnin 865 >>Turn in Raptor Horns
    .target Mebok Mizzyrix
step << Warrior
    .goto 1413/1,-3680.02,-982.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grazlix|r
    .vendor >>Buy |T134583:0|t[|cRXP_FRIENDLY_Mighty Chain Pants|r] from him if it's up
    .target Grazlix
    .money <0.619
    .isQuestTurnedIn 865
step << Rogue/Hunter/Warrior/Shaman/Druid
    .goto 1413/1,-3675.96,-985.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vexspindle|r
    .vendor >> Buy |T132603:0|t[|cRXP_FRIENDLY_Wolf Bracers|r] from him if they're up
    .target Vexspindle
    .money <0.3515
    .isQuestTurnedIn 865
step
    #completewith next
    .hs >>Hearth to Innkeeper Boorand Plainswind's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1413/1,-2607.91,-475.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Darsok Swiftdagger|r
    .turnin 875 >>Turn in Harpy Lieutenants
    .target Darsok Swiftdagger
step
    .goto 1413/1,-2641.35,-521.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mankrik|r
    .turnin 899 >>Turn in Consumed by Hatred
    .turnin 95774 >>Turn in Her Name Is Olgra
    .target Mankrik
step
    .goto 1413/1,-2672.76,-544.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tonga Runetotem|r
    .turnin 880 >>Turn in Altered Beings
    .accept 3301 >>Accept Mura Runetotem
    .target Tonga Runetotem
step
    .goto 1413/1,-3664.82,-1050.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Wiley|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Wiley
    .subzoneskip 392,1
step
    .goto 1413/1,-2645.40,-406.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Boorand|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Boorand Plainswind
    .subzoneskip 380,1
step
    .goto 1413/1,-2589.67,-424.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Helbrim|r
    .accept 853 >>Accept Apothecary Zamah
    .target Apothecary Helbrim
step << !Tauren !Skyborne
    .goto 1413/1,-1891.48,-2391.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mangletooth|r
    >>|cRXP_WARN_Skip this step if you have the Thunder Bluff flight path|r
    .target Mangletooth
    .train 2645,1 << Shaman
    .train 5118,1 << Hunter
step
    .goto 1413/1,-2347.48,857.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wenikee Boltbucket|r
    .turnin 3921 >>Turn in Wenikee Boltbucket
    .accept 3922 >>Accept Nugget Slugs
    .target Wenikee Boltbucket
step
    #loop
    .goto 1413/1,-3012.23,1015.25,0
    .goto 1413/1,-3012.23,1015.25,40,0
    .goto 1413/1,-3001.08,1072.68,40,0
    .goto 1413/1,-3041.62,1151.05,40,0
    .goto 1413/1,-3185.51,1126.73,40,0
    .goto 1413/1,-3175.38,1057.14,40,0
    .goto 1413/1,-3170.31,998.36,40,0
    .goto 1413/1,-3121.67,1017.27,40,0
    .goto 1413/1,-3089.24,1063.89,40,0
    .goto 1413/1,-3055.80,953.77,40,0
    >>Loot the |cRXP_PICK_Tool Buckets|r for |cRXP_LOOT_Nugget Slug|r
    .complete 3922,1 --Nugget Slug (15)
step
    .goto 1413/1,-2347.48,857.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wenikee Boltbucket|r
    .turnin 3922 >>Turn in Nugget Slugs
    .accept 3923 >>Accept Rilli Greasygob
    .target Wenikee Boltbucket
step
    .goto 1413/1,-2072.87,-3379.02
    >>Click the |cRXP_PICK_Burned-Out Remains|r
    .accept 79007 >>Accept ... and that note you found
    .accept 79192 >>Accept Stepping Stones
step
    .goto 1413/1,-1633.08,-3116.88
    >>Kill |cRXP_ENEMY_Silithid Harvester|r and loot |cRXP_LOOT_Harvester's Head|r. Use it to start the quest
    .collect 5138,1,897 --Harvester's Head (1)
    .accept 897 >>Accept The Harvester
    .use 5138
    .mob Silithid Harvester
step
    .goto 1413/1,-950.10,-271.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Seereth Stonebreak|r
    .accept 1063 >>Accept The Elder Crone
    .accept 1068 >>Accept Shredding Machines
    .target Seereth Stonebreak
    .isQuestTurnedIn 1062 --any of: Goblin Invaders
    .xp <13,1
step
    .goto 1413/1,-943.00,-263.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Makaba Flathoof|r
    .turnin 6523 >>Turn in Protect Kaya
    .target Makaba Flathoof
    .isQuestComplete 6523
step
    .goto 1413/1,-943.00,-263.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Makaba Flathoof|r
    .accept 6401 >>Accept Kaya's Alive
    .target Makaba Flathoof
    .isQuestTurnedIn 6523 --any of: Protect Kaya
    .xp <12,1
step
    .goto 1413/1,-943.00,-263.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Makaba Flathoof|r
    .turnin 6629 >>Turn in Kill Grundig Darkcloud
    .target Makaba Flathoof
    .isQuestComplete 6629
step
    .goto 1413/1,-950.10,-271.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Seereth Stonebreak|r
    .turnin 1068 >>Turn in Shredding Machines
    .target Seereth Stonebreak
    .isQuestComplete 1068
step << !Mage
    .goto 1413/1,-2645.40,-406.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Boorand|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Boorand Plainswind
    .train 425343,3 << Shaman
step << Warrior
    .goto 1413/1,-1903.64,-2402.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ruga Ragetotem|r
    .turnin 1823 >>Turn in Speak with Ruga
    .target Ruga Ragetotem
    .isOnQuest 1823
step
    .goto 1413/1,-1995.86,-2376.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Byula|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Byula
step << !Rogue !Shaman
    .goto 1413/1,-1995.86,-2376.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Byula|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Byula
step
    .goto 1413/1,-1922.90,-2383.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jorn Skyseer|r
    .turnin 897 >>Turn in The Harvester while you are here
    .isQuestComplete 897
    .target Jorn Skyseer
step << Rogue
    .goto 1413/1,-2995.00,1236.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Taskmaster Fizzule|r
    .turnin 2458 >>Turn in Deep Cover
    .target Taskmaster Fizzule
    .isOnQuest 2458
step << Warlock
    .goto 1413/1,-1898.58,-2391.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grunt Logmar|r
    .turnin 1511 >>Turn in Ken'zigla's Draught
    .target Grunt Logmar
    .isOnQuest 1511
step
    .goto 1413/1,-1922.90,-2383.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jorn Skyseer|r
    .turnin 897 >>Turn in The Harvester
    .target Jorn Skyseer
step << Rogue
    .goto 1413/1,-2584.60,-427.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hula'mahi|r
    .vendor >>|cRXP_BUY_Stock up on|r |T134387:0|t[Flash Powder] |cRXP_BUY_and supplies for|r |T132273:0|t[Instant Poison]
    .target Hula'mahi
    .subzoneskip 380,1
step
    +|cRXP_WARN_That is all of The Barrens for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Durotar|r: Call of Fire << Shaman
    >>|cRXP_FRIENDLY_Orgrimmar|r: Ride to Orgrimmar << Orc/Troll
    >>|cRXP_FRIENDLY_Orgrimmar|r: Rilli Greasygob
    >>|cRXP_FRIENDLY_Silverpine Forest|r: Mura Runetotem
    >>|cRXP_FRIENDLY_Stonetalon Mountains|r: Kaya's Alive, Stepping Stones
    >>|cRXP_FRIENDLY_Thunder Bluff|r: Ride to Thunder Bluff << Tauren
    >>|cRXP_FRIENDLY_Thunder Bluff|r: Apothecary Zamah, The Elder Crone
    >>|cRXP_FRIENDLY_Westfall|r: ... and that note you found
    >>|cRXP_FRIENDLY_Durotar and back here|r: Path of Defense << Warrior
    >>|cRXP_FRIENDLY_Stonetalon Mountains and back here|r: Avenge My Village, Goblin Invaders
step
    .xp 18 >>|cRXP_WARN_The rest of The Barrens is planned from level 18.|r Come back to this guide then
step
    .goto 1413/1,-3771.22,-894.07
    .fp Ratchet >> Get the Ratchet flight path
step
    .goto 1413/1,-3686.10,-981.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brewmaster Drohn|r
    .accept 821 >>Accept Chen's Empty Keg
    .target Brewmaster Drohn
    .isQuestTurnedIn 819 --any of: Chen's Empty Keg
    .xp <11,1
step
    .goto 1413/1,-2458.95,-370.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dokimi|r
    .turnin 91901 >>Turn in A Sealed Crate
    .target Dokimi
    .isOnQuest 91901
step
    .goto 1413/1,-1971.54,-306.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Regthar Deathgate|r
    .accept 851 >>Accept Verog the Dervish
    .target Regthar Deathgate
step
    #completewith Drop884x1
    >>|cRXP_LOOT_Owatanka's Tailspike|r can drop from |cRXP_ENEMY_Owatanka|r. Use it to start the quest if you get one
    .collect 5102,1,884 --Owatanka's Tailspike (1)
    .accept 884 >>Accept Owatanka
    .use 5102
step
    #label Drop884x1
    #loop
    .goto 1413/1,-1508.44,68.02,0
    .goto 1413/1,-1508.44,68.02,40,0
    .goto 1413/1,-1491.22,92.34,40,0
    .goto 1413/1,-1460.82,213.96,40,0
    .goto 1413/1,-1470.95,250.44,40,0
    .goto 1413/1,-1520.60,205.17,40,0
    .goto 1413/1,-1544.92,207.88,40,0
    .goto 1413/1,-1534.79,191.66,40,0
    .goto 1413/1,-1523.64,138.96,40,0
    >>Kill |cRXP_ENEMY_Savannah Patriarches|r, |cRXP_ENEMY_Savannah Highmanes|r, |cRXP_ENEMY_Savannah Huntress|r and |cRXP_ENEMY_Savannah Matriarches|r. Loot them for |cRXP_LOOT_Savannah Lion Tusk|r
    .complete 821,1 --Savannah Lion Tusk (5)
    .mob Savannah Patriarch
    .mob Savannah Highmane
    .mob Savannah Huntress
    .mob Savannah Matriarch
    .isOnQuest 821
step
    .goto 1413/1,-1634.10,839.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Walton|r
    .turnin 95508 >>Turn in Unwelcome Guests
    .target Walton
    .isOnQuest 95508
step
    .goto 1413/1,-3104.44,1109.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wizzlecrank's Shredder|r
    .accept 858 >>Accept Ignition
    .target Wizzlecrank's Shredder
step
    .goto 1413/1,-3079.11,1032.81
    >>Kill |cRXP_ENEMY_Supervisor Lugwizzle|r and loot |cRXP_LOOT_Ignition Key|r
    .complete 858,1 --Ignition Key (1)
    .mob Supervisor Lugwizzle
step
    .goto 1413/1,-3104.44,1109.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wizzlecrank's Shredder|r
    .turnin 858 >>Turn in Ignition
    .accept 863 >>Accept The Escape
    .target Wizzlecrank's Shredder
step
    .goto 1413/1,-2986.90,1093.62
    >>Escort Wizzlecrank out of the Venture Co. drill site
    .complete 863,1 --Escort Wizzlecrank out of the Venture Co. drill site
step << Warrior
    .goto 1413/1,-3596.92,185.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Uzzek|r
    .turnin 1498 >>Turn in Path of Defense
    .target Uzzek
    .isQuestComplete 1498
step
    .goto 1413/1,-2645.40,-406.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Boorand Plainswind|r
    .target Innkeeper Boorand Plainswind
    .home >>Set your Hearthstone to Innkeeper Boorand Plainswind's inn
step
    .goto 1413/1,-2641.35,-521.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mankrik|r
    .accept 4921 >>Accept Lost in Battle
    .target Mankrik
step << Tauren Druid
    .goto 1413/1,-2672.76,-544.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tonga Runetotem|r
    .accept 6128 >>Accept Gathering the Cure
    .target Tonga Runetotem
    .isQuestTurnedIn 6127 --any of: The Principal Source
    .xp <14,1
step
    .goto 1413/1,-2711.27,-350.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gur'ak|r
    .accept 97003 >>Accept Chol'aruk the Ravener
    .target Gur'ak
step << Rogue
    .goto 1413/1,-3768.18,-841.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wrenix the Wretched|r
    .accept 2381 >>Accept Plundering the Plunderers
    .target Wrenix the Wretched
    .isQuestTurnedIn 2382 --any of: Wrenix of Ratchet
    .xp <16,1
step
    .goto 1413/1,-3759.06,-902.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sputtervalve|r
    .turnin 863 >>Turn in The Escape
    .accept 1483 >>Accept Ziz Fizziks
    .target Sputtervalve
step
    .goto 1413/1,-3697.24,-929.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mebok Mizzyrix|r
    .accept 1069 >>Accept Deepmoss Spider Eggs
    .target Mebok Mizzyrix
step
    .goto 1413/1,-3689.14,-1024.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Thalo'thas Brightsun|r
    .accept 891 >>Accept The Guns of Northwatch
    .target Captain Thalo'thas Brightsun
step << Rogue
    .goto 1413/1,-3941.46,-1461.59
    >>Kill |cRXP_ENEMY_Polly|r and loot |cRXP_LOOT_Southsea Treasure|r
    .complete 2381,1 --Southsea Treasure (1)
    .mob Polly
    .isOnQuest 2381
step
    .goto 1413/1,-2753.83,-1207.56
    >>Kill |cRXP_ENEMY_Verog the Dervish|r and loot |cRXP_LOOT_Verog's Head|r
    .complete 851,1 --Verog's Head (1)
    .mob Verog the Dervish
step
    .goto 1413/1,-2375.86,-1787.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Beaten Corpse|r
    .complete 4921,1 --Beaten Corpse
    .target Beaten Corpse
step
    .goto 1413/1,-1891.48,-2391.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mangletooth|r
    .accept 878 >>Accept Tribes at War
    .target Mangletooth
step
    #completewith next
    .hs >>Hearth to Innkeeper Boorand Plainswind's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1413/1,-2641.35,-521.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mankrik|r
    .turnin 4921 >>Turn in Lost in Battle
    .target Mankrik
step
    .goto 1413/1,-1971.54,-306.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Regthar Deathgate|r
    .turnin 851 >>Turn in Verog the Dervish
    .accept 852 >>Accept Hezrul Bloodmark
    .target Regthar Deathgate
step
    .goto 1413/1,-2042.47,-1167.02
    >>Kill |cRXP_ENEMY_Hezrul Bloodmark|r and loot |cRXP_LOOT_Hezrul's Head|r
    .complete 852,1 --Hezrul's Head (1)
    .mob Hezrul Bloodmark
step
    .goto 1413/1,-1971.54,-306.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Regthar Deathgate|r
    .turnin 852 >>Turn in Hezrul Bloodmark
    .accept 4021 >>Accept Counterattack!
    .target Regthar Deathgate
step
    .goto 1413/1,-1971.54,-306.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Regthar Deathgate|r
    .turnin 4021 >>Turn in Counterattack!
    .target Regthar Deathgate
    .isQuestComplete 4021
step
    .goto 1413/1,-943.00,-263.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Makaba Flathoof|r
    .turnin 6548 >>Turn in Avenge My Village
    .target Makaba Flathoof
    .isQuestComplete 6548
step
    .goto 1413/1,-1922.90,-2383.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jorn Skyseer|r
    .accept 882 >>Accept Ishamuhale
    .target Jorn Skyseer
step
    #completewith Along29
    >>As you go: Kill |cRXP_ENEMY_Bristleback Geomancers|r. |cRXP_WARN_Anything left is finished later|r
    .complete 878,3 --Bristleback Geomancer slain (12)
    .mob Bristleback Geomancer
step
    #label Along29
    #loop
    .goto 1413/1,-2487.32,-2289.23,0
    .goto 1413/1,-2487.32,-2289.23,40,0
    .goto 1413/1,-2517.72,-2227.08,40,0
    .goto 1413/1,-2517.72,-2085.20,40,0
    .goto 1413/1,-2577.51,-2046.69,40,0
    .goto 1413/1,-2682.90,-2014.93,40,0
    .goto 1413/1,-2611.96,-2114.25,40,0
    .goto 1413/1,-2549.14,-2157.49,40,0
    .goto 1413/1,-2586.63,-2212.21,40,0
    .goto 1413/1,-2569.40,-2295.99,40,0
    >>Kill |cRXP_ENEMY_Bristleback Water Seekers|r
    >>Kill |cRXP_ENEMY_Bristleback Thornweavers|r
    .complete 878,1 --Bristleback Water Seeker slain (6)
    .complete 878,2 --Bristleback Thornweaver slain (12)
    .mob Bristleback Water Seeker
    .mob Bristleback Thornweaver
step
    #loop
    .goto 1413/1,-2689.99,-1970.34,0
    .goto 1413/1,-2689.99,-1970.34,40,0
    .goto 1413/1,-2719.38,-1984.53,40,0
    .goto 1413/1,-2750.79,-2047.36,40,0
    .goto 1413/1,-2790.31,-2030.47,40,0
    .goto 1413/1,-2813.62,-2053.44,40,0
    .goto 1413/1,-2812.60,-2003.45,40,0
    .goto 1413/1,-2780.18,-1981.15,40,0
    .goto 1413/1,-2750.79,-1918.99,40,0
    .goto 1413/1,-2703.16,-1929.80,40,0
    >>Kill |cRXP_ENEMY_Bristleback Geomancers|r
    .complete 878,3 --Bristleback Geomancer slain (12)
    .mob Bristleback Geomancer
step
    #loop
    .goto 1413/1,-2714.31,-1047.44,0
    .goto 1413/1,-2714.31,-1047.44,40,0
    .goto 1413/1,-2782.20,-1025.14,40,0
    .goto 1413/1,-2783.22,-872.45,40,0
    .goto 1413/1,-2785.24,-785.97,40,0
    .goto 1413/1,-2775.11,-822.45,40,0
    .goto 1413/1,-2750.79,-915.01,40,0
    .goto 1413/1,-2729.51,-927.17,40,0
    .goto 1413/1,-2736.60,-996.76,40,0
    >>Kill |cRXP_ENEMY_Zhevra Runners|r, |cRXP_ENEMY_Zhevra Chargers|r and |cRXP_ENEMY_Zhevra Coursers|r. Loot them for |cRXP_LOOT_Fresh Zhevra Carcass|r
    .collect 10338,1,882,1 --Fresh Zhevra Carcass (1)
    .mob Zhevra Runner
    .mob Zhevra Charger
    .mob Zhevra Courser
step
    #completewith Drop884x2
    >>|cRXP_LOOT_Owatanka's Tailspike|r can drop from |cRXP_ENEMY_Owatanka|r. Use it to start the quest if you get one
    .collect 5102,1,884 --Owatanka's Tailspike (1)
    .accept 884 >>Accept Owatanka
    .use 5102
step
    #loop
    .goto 1413/1,-2495.43,-1955.48,0
    .goto 1413/1,-2495.43,-1955.48,40,0
    .goto 1413/1,-2456.92,-1948.72,40,0
    .goto 1413/1,-2384.98,-2012.23,40,0
    .goto 1413/1,-2402.20,-2060.20,40,0
    .goto 1413/1,-2452.87,-2057.50,40,0
    .goto 1413/1,-2445.78,-1995.34,40,0
    .goto 1413/1,-2544.07,-1966.96,40,0
    >>Kill |cRXP_ENEMY_Stormhides|r, |cRXP_ENEMY_Thunderheads|r, |cRXP_ENEMY_Stormsnouts|r and |cRXP_ENEMY_Owatankas|r. Loot them for |cRXP_LOOT_Thunder Lizard Horn|r
    .complete 821,3 --Thunder Lizard Horn (1)
    .mob Stormhide
    .mob Thunderhead
    .mob Stormsnout
    .mob Owatanka
    .isOnQuest 821
step
    #label Drop884x2
    #loop
    .goto 1413/1,-3149.03,-515.72,0
    .goto 1413/1,-3149.03,-515.72,40,0
    .goto 1413/1,-3111.54,-485.99,40,0
    .goto 1413/1,-3148.02,-446.13,40,0
    .goto 1413/1,-3095.32,-430.59,40,0
    .goto 1413/1,-3135.86,-383.30,40,0
    .goto 1413/1,-3180.44,-356.27,40,0
    .goto 1413/1,-3212.87,-450.18,40,0
    .goto 1413/1,-3286.84,-545.45,40,0
    .goto 1413/1,-3220.98,-503.56,40,0
    >>Kill |cRXP_ENEMY_Greater Plainstriders|r, |cRXP_ENEMY_Ornery Plainstriders|r and |cRXP_ENEMY_Fleeting Plainstriders|r. Loot them for |cRXP_LOOT_Plainstrider Kidney|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob Greater Plainstrider
    .mob Ornery Plainstrider
    .mob Fleeting Plainstrider
    .isOnQuest 821
step
    .goto 1413/1,-3436.82,-454.91
    >>Kill |cRXP_ENEMY_Ishamuhale|r and loot |cRXP_LOOT_Ishamuhale's Fang|r
    .complete 882,1 --Ishamuhale's Fang (1)
    .mob Ishamuhale
step << Tauren Druid
    #loop
    .goto 1413/1,-3444.92,-1417.00,0
    .goto 1413/1,-3444.92,-1417.00,40,0
    .goto 1413/1,-3445.94,-1427.81,40,0
    .goto 1413/1,-3463.16,-1463.62,40,0
    .goto 1413/1,-3495.59,-1435.24,40,0
    .goto 1413/1,-3478.36,-1433.22,40,0
    >>Pick up |cRXP_PICK_Earthroot|r from the ground
    .complete 6128,1 --Earthroot (5)
    .isOnQuest 6128
step
    #completewith Along36
    >>As you go: Kill |cRXP_ENEMY_Theramore Marines|r, |cRXP_ENEMY_Theramore Preservers|r, |cRXP_ENEMY_Captain Fairmounts|r and |cRXP_ENEMY_Cannoneer Smythes|r. Loot them for |cRXP_LOOT_Theramore Medal|r. |cRXP_WARN_Anything left is finished later|r
    .complete 891,4 --Theramore Medal (10)
    .mob Theramore Marine
    .mob Theramore Preserver
    .mob Captain Fairmount
    .mob Cannoneer Smythe
step
    #label Along36
    .goto 1413/1,-3500.66,-2087.90
    >>Kill |cRXP_ENEMY_Cannoneer Whessan|r
    .complete 891,2 --Cannoneer Whessan slain (1)
    .mob Cannoneer Whessan
step
    #loop
    .goto 1413/1,-3509.78,-2093.98,0
    .goto 1413/1,-3509.78,-2093.98,40,0
    .goto 1413/1,-3535.11,-2145.33,40,0
    .goto 1413/1,-3585.78,-2150.06,40,0
    .goto 1413/1,-3621.24,-2174.38,40,0
    .goto 1413/1,-3687.11,-2201.40,40,0
    .goto 1413/1,-3729.67,-2231.13,40,0
    .goto 1413/1,-3779.32,-2214.24,40,0
    .goto 1413/1,-3653.67,-2122.36,40,0
    .goto 1413/1,-3645.56,-2064.25,40,0
    >>Kill |cRXP_ENEMY_Cannoneer Smythe|r
    >>Kill |cRXP_ENEMY_Theramore Marines|r, |cRXP_ENEMY_Theramore Preservers|r, |cRXP_ENEMY_Captain Fairmounts|r and |cRXP_ENEMY_Cannoneer Smythes|r. Loot them for |cRXP_LOOT_Theramore Medal|r
    >>Kill |cRXP_ENEMY_Captain Fairmount|r
    .complete 891,3 --Cannoneer Smythe slain (1)
    .complete 891,4 --Theramore Medal (10)
    .complete 891,1 --Captain Fairmount slain (1)
    .mob Cannoneer Smythe
    .mob Theramore Marine
    .mob Theramore Preserver
    .mob Captain Fairmount
step
    .goto 1413/1,-3655.70,-2100.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gilthares Firebough|r
    .accept 898 >>Accept Free From the Hold
    .target Gilthares Firebough
step
    .goto 1413/1,-3687.11,-1028.52
    >>Escort Gilthares Firebough back to Ratchet
    .complete 898,1 --Escort Gilthares Firebough back to Ratchet
step
    .goto 1413/1,-3689.14,-1024.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Thalo'thas Brightsun|r
    .turnin 891 >>Turn in The Guns of Northwatch
    .turnin 898 >>Turn in Free From the Hold
    .target Captain Thalo'thas Brightsun
step << Rogue
    .goto 1413/1,-3768.18,-841.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wrenix the Wretched|r
    .turnin 2381 >>Turn in Plundering the Plunderers
    .target Wrenix the Wretched
    .isOnQuest 2381
step
    .goto 1413/1,-3759.06,-902.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sputtervalve|r
    .accept 1095 >>Accept Further Instructions
    .target Sputtervalve
    .isQuestTurnedIn 1094 --any of: Further Instructions
    .xp <16,1
step
    .goto 1413/1,-3719.54,-919.07
    >>Click the |cRXP_PICK_WANTED|r
    .accept 92706 >>Accept WANTED: Bruuz
step
    .goto 1413/1,-3697.24,-929.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mebok Mizzyrix|r
    .turnin 1069 >>Turn in Deepmoss Spider Eggs
    .target Mebok Mizzyrix
    .isQuestComplete 1069
step
    .goto 1413/1,-3686.10,-981.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brewmaster Drohn|r
    .turnin 821 >>Turn in Chen's Empty Keg
    .target Brewmaster Drohn
    .isOnQuest 821
step
    #loop
    .goto 1413/1,-3900.92,-1036.63,0
    .goto 1413/1,-3900.92,-1036.63,40,0
    .goto 1413/1,-3936.39,-1042.71,40,0
    .goto 1413/1,-3983.00,-1017.71,40,0
    .goto 1413/1,-4005.30,-1056.22,40,0
    .goto 1413/1,-3970.84,-1073.79,40,0
    .goto 1413/1,-4001.24,-1134.59,40,0
    .goto 1413/1,-3925.24,-1237.29,40,0
    .goto 1413/1,-3904.98,-1181.21,40,0
    .goto 1413/1,-3882.68,-1127.84,40,0
    >>Kill |cRXP_ENEMY_Bruuz|r and loot |cRXP_LOOT_Bruuz's Dorsal Fin|r
    .complete 92706,1 --Bruuz's Dorsal Fin (1)
    .mob Bruuz
step
    .goto 1413/1,-3728.66,-835.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gazlowe|r
    .turnin 92706 >>Turn in WANTED: Bruuz
    .target Gazlowe
step
    .goto 1413/1,-2595.75,-473.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thork|r
    .accept 6541 >>Accept Report to Kadrak
    .target Thork
step
    .goto 1413/1,-2607.91,-475.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Darsok Swiftdagger|r
    .accept 876 >>Accept Serena Bloodfeather
    .target Darsok Swiftdagger
step
    .goto 1413/1,-2552.18,-389.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Korran|r
    .accept 868 >>Accept Egg Hunt
    .target Korran
step
    .goto 1413/1,-1891.48,-2391.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mangletooth|r
    .turnin 878 >>Turn in Tribes at War
    .accept 5052 >>Accept Blood Shards of Agamaggan
    .target Mangletooth
step
    .goto 1413/1,-1922.90,-2383.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jorn Skyseer|r
    .turnin 882 >>Turn in Ishamuhale while you are here
    .isQuestComplete 882
    .target Jorn Skyseer
step
    #loop
    .goto 1413/1,-1883.38,-1922.37,0
    .goto 1413/1,-1883.38,-1922.37,40,0
    .goto 1413/1,-1761.78,-1934.53,40,0
    .goto 1413/1,-1714.15,-1873.05,40,0
    .goto 1413/1,-1746.58,-1892.64,40,0
    .goto 1413/1,-1795.22,-1888.59,40,0
    .goto 1413/1,-1845.88,-1879.13,40,0
    .goto 1413/1,-1905.67,-1854.81,40,0
    .goto 1413/1,-1940.12,-1855.48,40,0
    .goto 1413/1,-1985.72,-1875.08,40,0
    >>Kill |cRXP_ENEMY_Bristleback Hunters|r, |cRXP_ENEMY_Bristleback Water Seekers|r, |cRXP_ENEMY_Bristleback Thornweavers|r and |cRXP_ENEMY_Bristleback Geomancers|r. Loot them for |cRXP_LOOT_Blood Shard|r. It can also be picked up from |cRXP_PICK_Copper Vein|r on the ground
    .complete 5052,1 --Blood Shard (1)
    .mob Bristleback Hunter
    .mob Bristleback Water Seeker
    .mob Bristleback Thornweaver
    .mob Bristleback Geomancer
step
    .goto 1413/1,-1891.48,-2391.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mangletooth|r
    .turnin 5052 >>Turn in Blood Shards of Agamaggan
    .target Mangletooth
step
    .goto 1413/1,-1922.90,-2383.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jorn Skyseer|r
    .turnin 882 >>Turn in Ishamuhale
    .accept 907 >>Accept Enraged Thunder Lizards
    .target Jorn Skyseer
step
    #loop
    .goto 1413/1,-2189.40,-2499.35,0
    .goto 1413/1,-2189.40,-2499.35,40,0
    .goto 1413/1,-2286.68,-2510.16,40,0
    .goto 1413/1,-2378.90,-2615.56,40,0
    .goto 1413/1,-2349.51,-2558.81,40,0
    .goto 1413/1,-2336.34,-2525.03,40,0
    .goto 1413/1,-2320.12,-2477.73,40,0
    .goto 1413/1,-2337.35,-2421.66,40,0
    .goto 1413/1,-2289.72,-2406.12,40,0
    .goto 1413/1,-2269.46,-2434.49,40,0
    >>Kill |cRXP_ENEMY_Stormhides|r, |cRXP_ENEMY_Thunderheads|r and |cRXP_ENEMY_Stormsnouts|r. Loot them for |cRXP_LOOT_Thunder Lizard Blood|r
    .complete 907,1 --Thunder Lizard Blood (3)
    .mob Stormhide
    .mob Thunderhead
    .mob Stormsnout
step
    .goto 1413/1,-1922.90,-2383.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jorn Skyseer|r
    .turnin 907 >>Turn in Enraged Thunder Lizards
    .accept 913 >>Accept Cry of the Thunderhawk
    .target Jorn Skyseer
step
    .goto 1413/1,-2259.32,-602.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Falla Sagewind|r
    .accept 3369 >>Accept In Nightmares
    .target Falla Sagewind
    .isQuestTurnedIn 6981 --any of: The Glowing Shard
    .xp <15,1
step
    .goto 1413/1,-1345.30,790.26
    >>Kill |cRXP_ENEMY_Serena Bloodfeather|r and loot |cRXP_LOOT_Serena's Head|r
    .complete 876,1 --Serena's Head (1)
    .mob Serena Bloodfeather
step
    .goto 1413/1,-2253.24,1246.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kadrak|r
    .turnin 6541 >>Turn in Report to Kadrak
    .accept 6543 >>Accept The Warsong Reports
    .target Kadrak
step
    #completewith next
    .hs >>Hearth to Innkeeper Boorand Plainswind's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1413/1,-2607.91,-475.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Darsok Swiftdagger|r
    .turnin 876 >>Turn in Serena Bloodfeather
    .accept 1060 >>Accept Letter to Jin'Zil
    .target Darsok Swiftdagger
step
    .goto 1413/1,-950.10,-271.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Seereth Stonebreak|r
    .turnin 1062 >>Turn in Goblin Invaders
    .target Seereth Stonebreak
    .isQuestComplete 1062
step << Tauren Druid
    .goto 1413/1,-2018.15,-2989.86
    >>Kill |cRXP_ENEMY_Lost Barrens Kodos|r and |cRXP_ENEMY_Barrens Kodos|r. Loot them for |cRXP_LOOT_Kodo Horn|r
    .complete 6128,2 --Kodo Horn (5)
    .mob Lost Barrens Kodo
    .mob Barrens Kodo
    .isOnQuest 6128
step
    #loop
    .goto 1413/1,-2188.39,-3105.39,0
    .goto 1413/1,-2188.39,-3105.39,40,0
    .goto 1413/1,-2170.15,-3141.20,40,0
    .goto 1413/1,-2217.78,-3179.03,40,0
    .goto 1413/1,-2251.22,-3175.65,40,0
    .goto 1413/1,-2300.87,-3106.74,40,0
    >>Loot the |cRXP_PICK_Silithid Mounds|r for |cRXP_LOOT_Silithid Egg|r
    .complete 868,1 --Silithid Egg (12)
step
    #loop
    .goto 1413/1,-2142.79,-3364.15,0
    .goto 1413/1,-2142.79,-3364.15,40,0
    .goto 1413/1,-2150.90,-3414.15,40,0
    .goto 1413/1,-2190.42,-3470.90,40,0
    >>Kill |cRXP_ENEMY_Thunderhawk Hatchlings|r, |cRXP_ENEMY_Greater Thunderhawks|r and |cRXP_ENEMY_Thunderhawk Cloudscrapers|r. Loot them for |cRXP_LOOT_Thunderhawk Wings|r
    .complete 913,1 --Thunderhawk Wings (1)
    .mob Thunderhawk Hatchling
    .mob Greater Thunderhawk
    .mob Thunderhawk Cloudscraper
step
    .goto 1413/1,-2038.42,-3116.88
    >>Kill |cRXP_ENEMY_Aean Swiftriver|r and loot |cRXP_LOOT_Runed Scroll|r. Use it to start the quest
    .collect 10621,1,3513 --Runed Scroll (1)
    .accept 3513 >>Accept The Runed Scroll
    .use 10621
    .mob Aean Swiftriver
step
    .goto 1413/1,-1922.90,-2383.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jorn Skyseer|r
    .turnin 884 >>Turn in Owatanka
    .target Jorn Skyseer
    .isOnQuest 884
step
    .goto 1413/1,-1922.90,-2383.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jorn Skyseer|r
    .turnin 913 >>Turn in Cry of the Thunderhawk
    .accept 874 >>Accept Mahren Skyseer
    .target Jorn Skyseer
step << Tauren Druid
    .goto 1413/1,-2672.76,-544.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tonga Runetotem|r
    .turnin 6128 >>Turn in Gathering the Cure
    .target Tonga Runetotem
    .isOnQuest 6128
step << Tauren Druid
    .goto 1413/1,-2672.76,-544.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tonga Runetotem|r
    .accept 6129 >>Accept Curing the Sick
    .target Tonga Runetotem
    .isQuestTurnedIn 6128 --any of: Gathering the Cure
    .xp <14,1
step
    .goto 1413/1,-2552.18,-389.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Korran|r
    .turnin 868 >>Turn in Egg Hunt
    .target Korran
step
    #loop
    .goto 1413/1,-3199.70,-205.61,0
    .goto 1413/1,-3199.70,-205.61,40,0
    .goto 1413/1,-3208.82,-214.39,40,0
    .goto 1413/1,-3234.15,-250.20,40,0
    .goto 1413/1,-3244.28,-231.28,40,0
    .goto 1413/1,-3260.50,-192.77,40,0
    .goto 1413/1,-3244.28,-146.83,40,0
    >>Kill |cRXP_ENEMY_Chol'aruk|r and loot |cRXP_LOOT_Chol'aruk's Head|r
    .complete 97003,1 --Chol'aruk's Head (1)
    .mob Chol'aruk
step
    .goto 1413/1,-4048.87,-1350.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mahren Skyseer|r
    .turnin 874 >>Turn in Mahren Skyseer
    .target Mahren Skyseer
step
    .goto 1413/1,-2711.27,-350.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gur'ak|r
    .turnin 97003 >>Turn in Chol'aruk the Ravener
    .target Gur'ak
step << Tauren Druid
    #loop
    .goto 1413/1,-2890.63,130.85,0
    .goto 1413/1,-2890.63,130.85,40,0
    .goto 1413/1,-2879.48,140.99,40,0
    .goto 1413/1,-3117.62,388.27,40,0
    .goto 1413/1,-3189.56,386.92,40,0
    .goto 1413/1,-3212.87,228.14,40,0
    .goto 1413/1,-3221.99,207.88,40,0
    >>Interact with |cRXP_FRIENDLY_Sickly Gazelles|r
    .complete 6129,1 --Sickly Gazelle (10)
    .target Sickly Gazelle
    .isOnQuest 6129
step
    .goto 1413/1,-2253.24,1246.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kadrak|r
    .turnin 3513 >>Turn in The Runed Scroll
    .accept 3514 >>Accept Horde Presence
    .target Kadrak
step
    .goto 1413/1,-2253.24,1246.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kadrak|r
    .turnin 6543 >>Turn in The Warsong Reports
    .target Kadrak
    .isQuestComplete 6543
step
    .goto 1413/1,-2253.24,1246.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kadrak|r
    .turnin 3514 >>Turn in Horde Presence
    .target Kadrak
    .isQuestComplete 3514
step
    +|cRXP_WARN_That is all of The Barrens for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Moonglade|r: Curing the Sick << Tauren Druid
    >>|cRXP_FRIENDLY_Stonetalon Mountains|r: Letter to Jin'Zil, Ziz Fizziks, Further Instructions
    >>|cRXP_FRIENDLY_Thunder Bluff|r: In Nightmares
    >>|cRXP_FRIENDLY_Ashenvale and back here|r: The Warsong Reports
    >>|cRXP_FRIENDLY_Stonetalon Mountains and back here|r: Deepmoss Spider Eggs, Horde Presence
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Counterattack!
step
    .xp 22 >>|cRXP_WARN_The rest of The Barrens is planned from level 22.|r Come back to this guide then
step << Warrior
    .goto 1413/1,-1903.64,-2402.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ruga Ragetotem|r
    .accept 1824 >>Accept Trial at the Field of Giants
    .target Ruga Ragetotem
step << Warrior
    #loop
    .goto 1413/1,-1786.10,-3077.01,0
    .goto 1413/1,-1786.10,-3077.01,40,0
    .goto 1413/1,-1789.14,-3152.01,40,0
    .goto 1413/1,-1717.19,-3160.12,40,0
    .goto 1413/1,-1746.58,-3216.19,40,0
    .goto 1413/1,-1703.00,-3289.84,40,0
    .goto 1413/1,-1642.20,-3231.06,40,0
    .goto 1413/1,-1653.35,-3148.63,40,0
    .goto 1413/1,-1620.92,-3050.66,40,0
    .goto 1413/1,-1686.79,-3088.50,40,0
    >>Kill |cRXP_ENEMY_Silithid Creepers|r, |cRXP_ENEMY_Silithid Grubs|r, |cRXP_ENEMY_Silithid Swarmers|r and |cRXP_ENEMY_Silithid Harvesters|r. Loot them for |cRXP_LOOT_Twitching Antenna|r
    .complete 1824,1 --Twitching Antenna (5)
    .mob Silithid Creeper
    .mob Silithid Grub
    .mob Silithid Swarmer
    .mob Silithid Harvester
step << Warrior
    .goto 1413/1,-1903.64,-2402.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ruga Ragetotem|r
    .turnin 1824 >>Turn in Trial at the Field of Giants
    .accept 1825 >>Accept Speak with Thun'grim
    .target Ruga Ragetotem
step << Shaman
    .goto 1413/1,-4047.86,-1345.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Islen Waterseer|r
    .accept 1530 >>Accept Call of Water
    .target Islen Waterseer
step << Shaman
    .goto 1413/1,-1776.98,-3617.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brine|r
    .accept 220 >>Accept Call of Water
    .target Brine
    .isQuestTurnedIn 1534 --any of: Call of Water
    .xp <20,1
step << Shaman
    .goto 1413/1,-1776.98,-3617.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brine|r
    .turnin 1530 >>Turn in Call of Water
    .accept 1535 >>Accept Call of Water
    .target Brine
step << Shaman
    .goto 1413/1,-1864.12,-3572.92
    >>Open the |cRXP_PICK_Quilboar Watering Hole|r. Loot it for |cRXP_LOOT_Filled Brown Waterskin|r
    .complete 1535,1 --Filled Brown Waterskin (1)
step << Shaman
    .goto 1413/1,-1776.98,-3617.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brine|r
    .turnin 1535 >>Turn in Call of Water
    .accept 1536 >>Accept Call of Water
    .target Brine
step << Shaman
    .goto 1413/1,-1776.98,-3617.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brine|r
    .turnin 1536 >>Turn in Call of Water
    .target Brine
    .isQuestComplete 1536
step
    .goto 1413/1,-2458.95,-370.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dokimi|r
    .turnin 91901 >>Turn in A Sealed Crate
    .target Dokimi
    .isOnQuest 91901
step
    .goto 1413/1,-2253.24,1246.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kadrak|r
    .turnin 3514 >>Turn in Horde Presence
    .target Kadrak
    .isQuestComplete 3514
step
    .goto 1413/1,-2253.24,1246.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kadrak|r
    .turnin 6543 >>Turn in The Warsong Reports
    .target Kadrak
    .isQuestComplete 6543
step
    .goto 1413/1,-1634.10,839.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Walton|r
    .turnin 95508 >>Turn in Unwelcome Guests
    .target Walton
    .isOnQuest 95508
step
    .goto 1413/1,-1971.54,-306.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Regthar Deathgate|r
    .turnin 4021 >>Turn in Counterattack!
    .target Regthar Deathgate
    .isQuestComplete 4021
step
    .goto 1413/1,-943.00,-263.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Makaba Flathoof|r
    .turnin 6548 >>Turn in Avenge My Village
    .target Makaba Flathoof
    .isQuestComplete 6548
step
    .goto 1413/1,-3697.24,-929.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mebok Mizzyrix|r
    .turnin 1069 >>Turn in Deepmoss Spider Eggs
    .target Mebok Mizzyrix
    .isQuestComplete 1069
step << Shaman
    .goto 1413/1,-4047.86,-1345.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Islen Waterseer|r
    .turnin 220 >>Turn in Call of Water
    .target Islen Waterseer
    .isOnQuest 220
step << Shaman
    .goto 1413/1,-4047.86,-1345.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Islen Waterseer|r
    .accept 63 >>Accept Call of Water
    .target Islen Waterseer
    .isQuestTurnedIn 220 --any of: Call of Water
    .xp <20,1
step << Warlock
    .goto 1413/1,-2639.32,-436.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gazrog|r
    .accept 1510 >>Accept News of Dogran
    .target Gazrog
    .isQuestTurnedIn 1509 --any of: News of Dogran
    .xp <20,1
step
    .goto 1413/1,-950.10,-271.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Seereth Stonebreak|r
    .turnin 1062 >>Turn in Goblin Invaders
    .target Seereth Stonebreak
    .isQuestComplete 1062
step << Shaman
    .goto 1413/1,-1776.98,-3617.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brine|r
    .accept 1534 >>Accept Call of Water
    .target Brine
    .isQuestTurnedIn 1536 --any of: Call of Water
    .xp <20,1
step << Shaman
    .goto 1413/1,-1776.98,-3617.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brine|r
    .turnin 1534 >>Turn in Call of Water
    .target Brine
    .isQuestComplete 1534
step << Warlock
    .goto 1413/1,-1898.58,-2391.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grunt Logmar|r
    .accept 1515 >>Accept Dogran's Captivity
    .target Grunt Logmar
    .isQuestTurnedIn 1511 --any of: Ken'zigla's Draught
    .xp <20,1
step << Warlock
    .goto 1413/1,-1764.82,-1623.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grunt Dogran|r
    .turnin 1515 >>Turn in Dogran's Captivity
    .target Grunt Dogran
    .isOnQuest 1515
step << Warlock
    .goto 1413/1,-1764.82,-1623.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grunt Dogran|r
    .accept 1512 >>Accept Love's Gift
    .target Grunt Dogran
    .isQuestTurnedIn 1515 --any of: Dogran's Captivity
    .xp <20,1
step
    .goto 1413/1,-1947.22,-2284.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tatternack Steelforge|r
    .accept 893 >>Accept Weapons of Choice
    .target Tatternack Steelforge
step
    .goto 1413/1,-1898.58,-2391.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grunt Logmar|r
    .accept 97250 >>Accept Wrongly Blamed, Justly Corrected
    .target Grunt Logmar
step
    #loop
    .goto 1413/1,-2300.87,-3537.79,0
    .goto 1413/1,-2300.87,-3537.79,40,0
    .goto 1413/1,-2253.24,-3571.57,40,0
    .goto 1413/1,-2277.56,-3658.73,40,0
    .goto 1413/1,-2339.38,-3660.08,40,0
    .goto 1413/1,-2363.70,-3635.08,40,0
    .goto 1413/1,-2325.19,-3610.08,40,0
    .goto 1413/1,-2369.78,-3581.71,40,0
    .goto 1413/1,-2406.26,-3565.49,40,0
    .goto 1413/1,-2387.00,-3532.38,40,0
    >>Kill |cRXP_ENEMY_Encroaching Soldiers|r
    >>Kill |cRXP_ENEMY_Outraged Pillagers|r
    .complete 97250,1 --Encroaching Soldier slain (8)
    .complete 97250,2 --Outraged Pillager slain (8)
    .mob Encroaching Soldier
    .mob Outraged Pillager
step
    #loop
    .goto 1413/1,-1870.20,-3789.80,0
    .goto 1413/1,-1870.20,-3789.80,40,0
    .goto 1413/1,-1902.63,-3871.55,40,0
    .goto 1413/1,-1733.40,-4014.11,40,0
    .goto 1413/1,-1611.80,-3939.11,40,0
    .goto 1413/1,-1508.44,-3891.14,40,0
    .goto 1413/1,-1547.96,-3783.04,40,0
    .goto 1413/1,-1583.43,-3679.00,40,0
    .goto 1413/1,-1683.75,-3881.68,40,0
    .goto 1413/1,-1810.42,-3845.20,40,0
    >>Kill |cRXP_ENEMY_Razormane Pathfinders|r and |cRXP_ENEMY_Razormane Stalkers|r. Loot them for |cRXP_LOOT_Razormane Backstabber|r
    >>Kill |cRXP_ENEMY_Razormane Seer|r and loot |cRXP_LOOT_Charred Razormane Wand|r
    >>Kill |cRXP_ENEMY_Razormane Warfrenzy|r and loot |cRXP_LOOT_Razormane War Shield|r
    .complete 893,1 --Razormane Backstabber (1)
    .complete 893,2 --Charred Razormane Wand (1)
    .complete 893,3 --Razormane War Shield (1)
    .mob Razormane Pathfinder
    .mob Razormane Stalker
    .mob Razormane Seer
    .mob Razormane Warfrenzy
step
    .goto 1413/1,-1947.22,-2284.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tatternack Steelforge|r
    .turnin 893 >>Turn in Weapons of Choice
    .target Tatternack Steelforge
step
    .goto 1413/1,-1922.90,-2383.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jorn Skyseer|r
    .accept 6382 >>Accept The Ashenvale Hunt
    .target Jorn Skyseer
step
    .goto 1413/1,-1898.58,-2391.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grunt Logmar|r
    .turnin 97250 >>Turn in Wrongly Blamed, Justly Corrected
    .target Grunt Logmar
step << Warrior
    .goto 1413/1,-3176.39,-437.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thun'grim Firegaze|r
    .turnin 1825 >>Turn in Speak with Thun'grim
    .target Thun'grim Firegaze
step << Warlock
    .goto 1413/1,-2373.83,-2252.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doan Karhan|r
    .accept 1740 >>Accept The Orb of Soran'ruk
    .target Doan Karhan
step << Warlock
    .goto 1413/1,-2373.83,-2252.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doan Karhan|r
    .turnin 1740 >>Turn in The Orb of Soran'ruk
    .target Doan Karhan
    .isQuestComplete 1740
step << Warrior
    .goto 1413/1,-3596.92,185.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Uzzek|r
    .turnin 1498 >>Turn in Path of Defense
    .target Uzzek
    .isQuestComplete 1498
step
    +|cRXP_WARN_That is all of The Barrens for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Ashenvale|r: The Ashenvale Hunt
    >>|cRXP_FRIENDLY_Orgrimmar|r: Love's Gift << Warlock
    >>|cRXP_FRIENDLY_Silverpine Forest|r: Call of Water << Shaman
    >>|cRXP_FRIENDLY_Stonetalon Mountains|r: News of Dogran << Warlock
    >>|cRXP_FRIENDLY_Hillsbrad Foothills and back here|r: Call of Water << Shaman
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: The Orb of Soran'ruk << Warlock
step
    .xp 25 >>|cRXP_WARN_The rest of The Barrens is planned from level 25.|r Come back to this guide then
step
    .goto 1413/1,-3697.24,-929.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mebok Mizzyrix|r
    .accept 1221 >>Accept Blueleaf Tubers
    .target Mebok Mizzyrix
step
    .goto 1413/1,-3694.20,-927.85
    >>Open the |cRXP_PICK_Snufflenose Command Sticks|r. Loot it for |cRXP_LOOT_Snufflenose Command Stick|r
    >>Pick up |cRXP_PICK_Snufflenose Owner's Manual|r from the ground
    >>Open the |cRXP_PICK_Crate with Holes|r. Loot it for |cRXP_LOOT_Crate With Holes|r
    .complete 1221,4 --Snufflenose Command Stick (1)
    .complete 1221,3 --Snufflenose Owner's Manual (1)
    .complete 1221,2 --Crate With Holes (1)
step
    .goto 1413/1,-3697.24,-929.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mebok Mizzyrix|r
    .turnin 1221 >>Turn in Blueleaf Tubers
    .target Mebok Mizzyrix
    .isQuestComplete 1221
step
    .goto 1413/1,-2645.40,-406.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Boorand Plainswind|r
    .target Innkeeper Boorand Plainswind
    .home >>Set your Hearthstone to Innkeeper Boorand Plainswind's inn
step
    .goto 1413/1,-2458.95,-370.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dokimi|r
    .turnin 91901 >>Turn in A Sealed Crate
    .target Dokimi
    .isOnQuest 91901
step
    .goto 1413/1,-2253.24,1246.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kadrak|r
    .turnin 3514 >>Turn in Horde Presence
    .target Kadrak
    .isQuestComplete 3514
step
    .goto 1413/1,-2253.24,1246.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kadrak|r
    .turnin 6543 >>Turn in The Warsong Reports
    .target Kadrak
    .isQuestComplete 6543
step
    .goto 1413/1,-1634.10,839.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Walton|r
    .turnin 95508 >>Turn in Unwelcome Guests
    .target Walton
    .isOnQuest 95508
step
    .goto 1413/1,-1971.54,-306.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Regthar Deathgate|r
    .turnin 4021 >>Turn in Counterattack!
    .target Regthar Deathgate
    .isQuestComplete 4021
step
    .goto 1413/1,-943.00,-263.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Makaba Flathoof|r
    .turnin 6548 >>Turn in Avenge My Village
    .target Makaba Flathoof
    .isQuestComplete 6548
step << Warrior
    .goto 1413/1,-3596.92,185.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Uzzek|r
    .turnin 1498 >>Turn in Path of Defense
    .target Uzzek
    .isQuestComplete 1498
step
    .goto 1413/1,-3697.24,-929.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mebok Mizzyrix|r
    .turnin 1069 >>Turn in Deepmoss Spider Eggs
    .target Mebok Mizzyrix
    .isQuestComplete 1069
step
    .goto 1413/1,-950.10,-271.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Seereth Stonebreak|r
    .turnin 1062 >>Turn in Goblin Invaders
    .target Seereth Stonebreak
    .isQuestComplete 1062
step << Rogue
    .goto 1413/1,-2995.00,1236.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Taskmaster Fizzule|r
    .accept 2478 >>Accept Mission: Possible But Not Probable
    .target Taskmaster Fizzule
    .isQuestTurnedIn 2458 --any of: Deep Cover
    .xp <20,1
step << Rogue
    .goto 1413/1,-2930.15,1209.15
    >>Kill |cRXP_ENEMY_Foreman Silixiz|r and loot |cRXP_LOOT_Silixiz's Tower Key|r
    .complete 2478,5 --Silixiz's Tower Key (1)
    .mob Foreman Silixiz
    .isOnQuest 2478
step << Rogue
    .goto 1413/1,-2922.04,1224.02
    >>Kill |cRXP_ENEMY_Mutated Venture Co. Drones|r
    .complete 2478,1 --Mutated Venture Co. Drone slain (2)
    .mob Mutated Venture Co. Drone
    .isOnQuest 2478
step << Rogue
    .goto 1413/1,-2931.16,1234.83
    >>Kill |cRXP_ENEMY_Venture Co. Patrollers|r
    .complete 2478,3 --Venture Co. Patroller slain (2)
    .mob Venture Co. Patroller
    .isOnQuest 2478
step << Rogue
    .goto 1413/1,-2928.12,1219.29
    >>Kill |cRXP_ENEMY_Venture Co. Lookouts|r
    .complete 2478,2 --Venture Co. Lookout slain (2)
    .mob Venture Co. Lookout
    .isOnQuest 2478
step << Rogue
    .goto 1413/1,-2925.08,1234.83
    >>Kill |cRXP_ENEMY_Grand Foreman Puzik Gallywix|r and loot |cRXP_LOOT_Gallywix's Head|r
    .complete 2478,4 --Gallywix's Head (1)
    .mob Grand Foreman Puzik Gallywix
    .isOnQuest 2478
step << Rogue
    .goto 1413/1,-2926.10,1236.85
    >>Open the |cRXP_PICK_Gallywix's Lockbox|r. Loot it for |cRXP_LOOT_Cache of Zanzil's Altered Mixture|r
    .complete 2478,6 --Cache of Zanzil's Altered Mixture (1)
    .isOnQuest 2478
step
    .goto 1413/1,-1891.48,-2391.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mangletooth|r
    .accept 879 >>Accept Betrayal from Within
    .target Mangletooth
step << Shaman
    .goto 1413/1,-1776.98,-3617.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brine|r
    .turnin 1536 >>Turn in Call of Water
    .target Brine
    .isQuestComplete 1536
step
    #loop
    .goto 1413/1,-2047.54,-3509.41,0
    .goto 1413/1,-2047.54,-3509.41,40,0
    .goto 1413/1,-2043.48,-3557.38,40,0
    .goto 1413/1,-2018.15,-3644.54,40,0
    .goto 1413/1,-2053.62,-3763.45,40,0
    .goto 1413/1,-2050.58,-3873.58,40,0
    .goto 1413/1,-2050.58,-4009.38,40,0
    .goto 1413/1,-2012.07,-4122.21,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gann Stonespire|r. |cRXP_WARN_This NPC walks a patrol route|r
    .accept 843 >>Accept Gann's Reclamation
    .unitscan Gann Stonespire
step
    .goto 1413/1,-1949.24,-3797.23
    >>Kill |cRXP_ENEMY_Kuz|r and loot |cRXP_LOOT_Kuz's Skull|r
    .complete 879,1 --Kuz's Skull (1)
    .mob Kuz
step
    .goto 1413/1,-1445.62,-3828.98
    >>Kill |cRXP_ENEMY_Lok Orcbane|r and loot |cRXP_LOOT_Lok's Skull|r
    .complete 879,3 --Lok's Skull (1)
    .mob Lok Orcbane
step
    .goto 1413/1,-1810.42,-4012.75
    >>Kill |cRXP_ENEMY_Nak|r and loot |cRXP_LOOT_Nak's Skull|r
    .complete 879,2 --Nak's Skull (1)
    .mob Nak
step
    #loop
    .goto 1413/1,-2145.83,-4053.97,0
    .goto 1413/1,-2145.83,-4053.97,40,0
    .goto 1413/1,-2181.30,-4084.37,40,0
    .goto 1413/1,-2211.70,-4105.31,40,0
    .goto 1413/1,-2243.11,-4143.15,40,0
    .goto 1413/1,-2260.34,-4222.87,40,0
    .goto 1413/1,-2215.75,-4191.12,40,0
    .goto 1413/1,-2184.34,-4180.98,40,0
    .goto 1413/1,-2125.56,-4168.82,40,0
    .goto 1413/1,-2190.42,-4134.37,40,0
    >>Kill |cRXP_ENEMY_Prospector Khazgorm|r and loot |cRXP_LOOT_Khazgorm's Journal|r
    >>Kill |cRXP_ENEMY_Bael'dun Excavators|r
    >>Kill |cRXP_ENEMY_Bael'dun Foremans|r
    .complete 843,3 --Khazgorm's Journal (1)
    .complete 843,1 --Bael'dun Excavator slain (15)
    .complete 843,2 --Bael'dun Foreman slain (8)
    .mob Prospector Khazgorm
    .mob Bael'dun Excavator
    .mob Bael'dun Foreman
step
    #loop
    .goto 1413/1,-2012.07,-4122.21,0
    .goto 1413/1,-2012.07,-4122.21,40,0
    .goto 1413/1,-2050.58,-4009.38,40,0
    .goto 1413/1,-2050.58,-3873.58,40,0
    .goto 1413/1,-2053.62,-3763.45,40,0
    .goto 1413/1,-2018.15,-3644.54,40,0
    .goto 1413/1,-2043.48,-3557.38,40,0
    .goto 1413/1,-2047.54,-3509.41,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gann Stonespire|r. |cRXP_WARN_This NPC walks a patrol route|r
    .turnin 843 >>Turn in Gann's Reclamation
    .accept 846 >>Accept Revenge of Gann
    .unitscan Gann Stonespire
step
    #loop
    .goto 1413/1,-2286.68,-4047.21,0
    .goto 1413/1,-2286.68,-4047.21,40,0
    .goto 1413/1,-2322.15,-4086.40,40,0
    .goto 1413/1,-2311.00,-4118.83,40,0
    .goto 1413/1,-2332.28,-4124.23,40,0
    .goto 1413/1,-2352.55,-4107.34,40,0
    .goto 1413/1,-2360.66,-4071.53,40,0
    .goto 1413/1,-2394.10,-4085.72,40,0
    .goto 1413/1,-2419.43,-4070.18,40,0
    .goto 1413/1,-2404.23,-4035.05,40,0
    >>Kill |cRXP_ENEMY_Bael'dun Soldiers|r, |cRXP_ENEMY_Bael'dun Riflemans|r, |cRXP_ENEMY_Bael'dun Officers|r and |cRXP_ENEMY_Lord Cyrik Blackforges|r. Loot them for |cRXP_LOOT_Nitroglycerin|r
    >>Kill |cRXP_ENEMY_Bael'dun Soldiers|r, |cRXP_ENEMY_Bael'dun Riflemans|r, |cRXP_ENEMY_Bael'dun Officers|r and |cRXP_ENEMY_Lord Cyrik Blackforges|r. Loot them for |cRXP_LOOT_Wood Pulp|r
    >>Kill |cRXP_ENEMY_Bael'dun Soldiers|r, |cRXP_ENEMY_Bael'dun Riflemans|r, |cRXP_ENEMY_Bael'dun Officers|r and |cRXP_ENEMY_Lord Cyrik Blackforges|r. Loot them for |cRXP_LOOT_Sodium Nitrate|r
    .complete 846,1 --Nitroglycerin (6)
    .complete 846,2 --Wood Pulp (1)
    .complete 846,3 --Sodium Nitrate (1)
    .mob Bael'dun Soldier
    .mob Bael'dun Rifleman
    .mob Bael'dun Officer
    .mob Lord Cyrik Blackforge
step
    #loop
    .goto 1413/1,-2012.07,-4122.21,0
    .goto 1413/1,-2012.07,-4122.21,40,0
    .goto 1413/1,-2050.58,-4009.38,40,0
    .goto 1413/1,-2050.58,-3873.58,40,0
    .goto 1413/1,-2053.62,-3763.45,40,0
    .goto 1413/1,-2018.15,-3644.54,40,0
    .goto 1413/1,-2043.48,-3557.38,40,0
    .goto 1413/1,-2047.54,-3509.41,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gann Stonespire|r. |cRXP_WARN_This NPC walks a patrol route|r
    .turnin 846 >>Turn in Revenge of Gann
    .accept 849 >>Accept Revenge of Gann
    .unitscan Gann Stonespire
step
    .goto 1413/1,-2136.71,-4172.88
    >>Click the |cRXP_PICK_Bael Modan Flying Machine|r
    .complete 849,1 --Bael Modan Flying Machine destroyed
step
    #loop
    .goto 1413/1,-2012.07,-4122.21,0
    .goto 1413/1,-2012.07,-4122.21,40,0
    .goto 1413/1,-2050.58,-4009.38,40,0
    .goto 1413/1,-2050.58,-3873.58,40,0
    .goto 1413/1,-2053.62,-3763.45,40,0
    .goto 1413/1,-2018.15,-3644.54,40,0
    .goto 1413/1,-2043.48,-3557.38,40,0
    .goto 1413/1,-2047.54,-3509.41,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gann Stonespire|r. |cRXP_WARN_This NPC walks a patrol route|r
    .turnin 849 >>Turn in Revenge of Gann
    .unitscan Gann Stonespire
step
    .goto 1413/1,-1947.22,-2284.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tatternack Steelforge|r
    .accept 1153 >>Accept A New Ore Sample
    .target Tatternack Steelforge
step
    .goto 1413/1,-1947.22,-2284.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tatternack Steelforge|r
    .turnin 1153 >>Turn in A New Ore Sample
    .target Tatternack Steelforge
    .isQuestComplete 1153
step
    .goto 1413/1,-1891.48,-2391.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mangletooth|r
    .turnin 879 >>Turn in Betrayal from Within
    .accept 906 >>Accept Betrayal from Within
    .target Mangletooth
step << Warlock
    .goto 1413/1,-2373.83,-2252.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doan Karhan|r
    .turnin 1740 >>Turn in The Orb of Soran'ruk
    .target Doan Karhan
    .isQuestComplete 1740
step
    #completewith next
    .hs >>Hearth to Innkeeper Boorand Plainswind's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1413/1,-2595.75,-473.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thork|r
    .turnin 906 >>Turn in Betrayal from Within
    .target Thork
step
    .goto 1413/1,-4048.87,-1350.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mahren Skyseer|r
    .accept 873 >>Accept Isha Awak
    .target Mahren Skyseer
step
    #loop
    .goto 1413/1,-3923.22,-1738.60,0
    .goto 1413/1,-3923.22,-1738.60,40,0
    .goto 1413/1,-3902.95,-1792.65,40,0
    .goto 1413/1,-3882.68,-1806.16,40,0
    .goto 1413/1,-3923.22,-1819.68,40,0
    >>Kill |cRXP_ENEMY_Isha Awak|r and loot |cRXP_LOOT_Heart of Isha Awak|r
    .complete 873,1 --Heart of Isha Awak (1)
    .mob Isha Awak
step
    .goto 1413/1,-4048.87,-1350.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mahren Skyseer|r
    .turnin 873 >>Turn in Isha Awak
    .target Mahren Skyseer
step
    +|cRXP_WARN_End of the The Barrens route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Orgrimmar|r: Mission: Possible But Not Probable << Rogue
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Blueleaf Tubers
    >>|cRXP_FRIENDLY_Thousand Needles and back here|r: A New Ore Sample
]])
