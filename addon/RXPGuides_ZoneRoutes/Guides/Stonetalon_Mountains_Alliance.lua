-- 15-28 Stonetalon Mountains: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 5 parts with a level check between them (from level 15, 18, 21, 24, 27).
-- Edit zones/Stonetalon Mountains.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#name 15-28 Stonetalon Mountains

step
    .goto 1442/1,402.76,1231.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veenix|r
    .accept 78270 >>Accept Goblin Lockpicks
    .target Veenix
step
    .goto 1442/1,402.76,1231.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veenix|r
    >>|cRXP_WARN_The database has no objectives for Goblin Lockpicks. Skip this step if the quest is not finished|r
    .turnin 78270 >>Turn in Goblin Lockpicks
    .target Veenix
    .isOnQuest 78270
step
    .goto 1442/1,1255.39,1204.86
    >>Click the |cRXP_PICK_Pocket Litter|r
    .accept 79980 >>Accept Scramble
step
    .goto 1442/1,1255.39,1204.86
    >>Click the |cRXP_PICK_Pocket Litter|r
    .turnin 79192 >>Turn in Stepping Stones
    .isOnQuest 79192
step
    .goto 1442/1,1311.06,1293.10
    >>Click the |cRXP_PICK_Mound of Dirt|r
    .turnin 79980 >>Turn in Scramble
step
    .goto 1442/1,339.27,730.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gaxim Rustfizzle|r
    .turnin 1077 >>Turn in Special Delivery for Gaxim
    .target Gaxim Rustfizzle
    .isOnQuest 1077
step
    .goto 1442/1,339.27,730.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gaxim Rustfizzle|r
    .turnin 1074 >>Turn in Ineptitude + Chemicals = Fun
    .target Gaxim Rustfizzle
    .isOnQuest 1074
step
    .goto 1442/1,320.72,739.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kaela Shadowspear|r
    .turnin 1070 >>Turn in On Guard in Stonetalon
    .target Kaela Shadowspear
    .isOnQuest 1070
step
    .goto 1442/1,365.16,878.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ziz Fizziks|r
    .turnin 1483 >>Turn in Ziz Fizziks
    .target Ziz Fizziks
    .isOnQuest 1483
step
    .goto 1442/1,365.16,878.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ziz Fizziks|r
    .turnin 1095 >>Turn in Further Instructions
    .target Ziz Fizziks
    .isOnQuest 1095
step
    .goto 1442/1,1434.12,2652.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Keeper Albagorm|r
    .turnin 1056 >>Turn in Journey to Stonetalon Peak
    .target Keeper Albagorm
    .isOnQuest 1056
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Teloren|r
    .target Teloren
    .goto 1442/1,1466.44,2682.84
    .fp Stonetalon >> Get the Stonetalon Flight Path
    .fly Ashenvale >> Fly to Ashenvale
step << !Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Teloren|r
    .target Teloren
    .goto 1442/1,1466.44,2682.84
    .fp Stonetalon >> Get the Stonetalon Flight Path
    .fly Ashenvale >> Fly to Ashenvale
step << !Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Teloren|r
    .target Teloren
    .goto 1442/1,1466.44,2682.84
    .fp Stonetalon >> Get the Stonetalon Flight Path
    .fly Darkshore >> Fly to Darkshore
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Teloren|r
    .target Teloren
    .goto 1442/1,1466.44,2682.84
    .fp Stonetalon >> Get the Stonetalon Flight Path
step << Warlock
    .goto 1442/1,1507.61,2677.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Illyanie|r
    .vendor >> |cRXP_WARN_Vendor trash|r
    .target Illyanie
step
    .xp 18 >>|cRXP_WARN_The rest of Stonetalon Mountains is planned from level 18.|r Come back to this guide then
step
    .goto 1442/1,365.16,878.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ziz Fizziks|r
    .accept 1093 >>Accept Super Reaper 6000
    .target Ziz Fizziks
step
    .goto 1442/1,320.72,739.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kaela Shadowspear|r
    .accept 1085 >>Accept On Guard in Stonetalon
    .target Kaela Shadowspear
step
    .goto 1442/1,339.27,730.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gaxim Rustfizzle|r
    .turnin 1085 >>Turn in On Guard in Stonetalon
    .accept 1071 >>Accept A Gnome's Respite
    .target Gaxim Rustfizzle
step
    .goto 1442/1,402.76,1231.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veenix|r
    .turnin 78270 >>Turn in Goblin Lockpicks
    .target Veenix
    .isOnQuest 78270
step
    #loop
    .goto 1442/1,163.96,1414.56,0
    .goto 1442/1,163.96,1414.56,40,0
    .goto 1442/1,78.99,1454.61,40,0
    .goto 1442/1,-27.95,1447.45,40,0
    .goto 1442/1,-107.55,1282.68,40,0
    .goto 1442/1,-30.39,1210.07,40,0
    .goto 1442/1,-74.34,1055.39,40,0
    .goto 1442/1,34.55,1112.38,40,0
    .goto 1442/1,81.43,1202.90,40,0
    .goto 1442/1,18.93,1308.40,40,0
    >>Kill |cRXP_ENEMY_Venture Co. Operator|r and loot |cRXP_LOOT_Super Reaper 6000 Blueprints|r
    >>Kill |cRXP_ENEMY_Venture Co. Loggers|r
    >>Kill |cRXP_ENEMY_Venture Co. Deforesters|r
    .complete 1093,1 --Super Reaper 6000 Blueprints (1)
    .complete 1071,1 --Venture Co. Logger slain (10)
    .complete 1071,2 --Venture Co. Deforester slain (10)
    .mob Venture Co. Operator
    .mob Venture Co. Logger
    .mob Venture Co. Deforester
step
    .goto 1442/1,-263.82,962.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Piznik|r
    .accept 1092 >>Accept Gerenzo's Orders
    .target Piznik
    .isQuestTurnedIn 1090 --any of: Gerenzo's Orders
    .xp <17,1
step
    .goto 1442/1,365.16,878.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ziz Fizziks|r
    .turnin 1092 >>Turn in Gerenzo's Orders
    .target Ziz Fizziks
    .isOnQuest 1092
step
    .goto 1442/1,365.16,878.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ziz Fizziks|r
    .turnin 1093 >>Turn in Super Reaper 6000
    .accept 1094 >>Accept Further Instructions
    .target Ziz Fizziks
step
    .goto 1442/1,339.27,730.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gaxim Rustfizzle|r
    .turnin 1071 >>Turn in A Gnome's Respite
    .accept 1072 >>Accept An Old Colleague
    .accept 1075 >>Accept A Scroll from Mauren
    .target Gaxim Rustfizzle
step
    +|cRXP_WARN_That is all of Stonetalon Mountains for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Ironforge|r: An Old Colleague
    >>|cRXP_FRIENDLY_Stormwind City|r: A Scroll from Mauren
    >>|cRXP_FRIENDLY_The Barrens|r: Further Instructions
step
    .xp 21 >>|cRXP_WARN_The rest of Stonetalon Mountains is planned from level 21.|r Come back to this guide then
step
    .goto 1442/1,866.19,1619.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Night Elf Courier|r
    .accept 86574 >>Accept Stonetalon Supply Run
    .target Night Elf Courier
step
    .goto 1442/1,887.67,1566.95
    >>Kill |cRXP_ENEMY_Young Pridewings|r, |cRXP_ENEMY_Pridewing Wyverns|r, |cRXP_ENEMY_Pridewing Skyhunters|r and |cRXP_ENEMY_Pridewing Consorts|r. Loot them for |cRXP_LOOT_Stonetalon Supply Bundle|r
    .complete 86574,1 --Stonetalon Supply Bundle (1)
    .mob Young Pridewing
    .mob Pridewing Wyvern
    .mob Pridewing Skyhunter
    .mob Pridewing Consort
step
    .goto 1442/1,339.27,730.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gaxim Rustfizzle|r
    .accept 1080 >>Accept Covert Ops - Beta
    .accept 1079 >>Accept Covert Ops - Alpha
    .target Gaxim Rustfizzle
    .isQuestTurnedIn 1074 --Ineptitude + Chemicals = Fun
    .isQuestTurnedIn 1077 --Special Delivery for Gaxim
    .xp <17,1
step
    .goto 1442/1,18.44,1245.23
    >>Pick up |cRXP_PICK_Venture Co. Engineering Plans|r from the ground
    .complete 1079,1 --Venture Co. Engineering Plans (1)
    .isOnQuest 1079
step
    .goto 1442/1,-390.30,985.71
    >>Open the |cRXP_PICK_Venture Co. Documents|r. Loot it for |cRXP_LOOT_Venture Co. Letters|r
    .complete 1080,1 --Venture Co. Letters (1)
    .isOnQuest 1080
step
    .goto 1442/1,339.27,730.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gaxim Rustfizzle|r
    .turnin 1080 >>Turn in Covert Ops - Beta
    .target Gaxim Rustfizzle
    .isOnQuest 1080
step
    .goto 1442/1,339.27,730.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gaxim Rustfizzle|r
    .turnin 1079 >>Turn in Covert Ops - Alpha
    .target Gaxim Rustfizzle
    .isOnQuest 1079
step
    .goto 1442/1,339.27,730.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gaxim Rustfizzle|r
    .accept 1091 >>Accept Kaela's Update
    .target Gaxim Rustfizzle
    .isQuestTurnedIn 1079 --Covert Ops - Alpha
    .isQuestTurnedIn 1080 --Covert Ops - Beta
    .xp <17,1
step
    .goto 1442/1,320.72,739.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kaela Shadowspear|r
    .turnin 1091 >>Turn in Kaela's Update
    .target Kaela Shadowspear
    .isOnQuest 1091
step
    .goto 1442/1,402.76,1231.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veenix|r
    .turnin 78270 >>Turn in Goblin Lockpicks
    .target Veenix
    .isOnQuest 78270
step
    .goto 1442/1,1498.09,2729.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Faralia|r
    .turnin 86574 >>Turn in Stonetalon Supply Run
    .target Innkeeper Faralia
step
    .xp 24 >>|cRXP_WARN_The rest of Stonetalon Mountains is planned from level 24.|r Come back to this guide then
step
    .goto 1442/1,1434.12,2652.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Keeper Albagorm|r
    .accept 1057 >>Accept Reclaiming the Charred Vale
    .target Keeper Albagorm
step
    .goto 1442/1,402.76,1231.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veenix|r
    .turnin 78270 >>Turn in Goblin Lockpicks
    .target Veenix
    .isOnQuest 78270
step
    .goto 1442/1,320.72,739.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kaela Shadowspear|r
    .accept 1084 >>Accept Wounded Ancients
    .target Kaela Shadowspear
    .isQuestTurnedIn 1091 --any of: Kaela's Update
    .xp <22,1
step
    .goto 1442/1,320.72,739.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kaela Shadowspear|r
    .accept 1083 >>Accept Enraged Spirits
    .target Kaela Shadowspear
    .isQuestTurnedIn 1091 --any of: Kaela's Update
    .xp <20,1
step
    #loop
    .goto 1442/1,1655.33,941.43,0
    .goto 1442/1,1655.33,941.43,40,0
    .goto 1442/1,1679.75,948.91,40,0
    .goto 1442/1,1715.40,949.24,40,0
    .goto 1442/1,1741.77,919.93,40,0
    .goto 1442/1,1798.41,877.60,40,0
    .goto 1442/1,1781.81,901.70,40,0
    .goto 1442/1,1735.42,987.99,40,0
    .goto 1442/1,1691.47,1003.29,40,0
    >>Kill |cRXP_ENEMY_Bloodfury Harpies|r
    >>Kill |cRXP_ENEMY_Bloodfury Ambushers|r
    .complete 1057,1 --Bloodfury Harpy slain (7)
    .complete 1057,2 --Bloodfury Ambusher slain (7)
    .mob Bloodfury Harpy
    .mob Bloodfury Ambusher
step
    #completewith Along7
    >>As you go: Kill |cRXP_ENEMY_Bloodfury Roguefeathers|r. |cRXP_WARN_Anything left is finished later|r
    .complete 1057,4 --Bloodfury Roguefeather slain (7)
    .mob Bloodfury Roguefeather
step
    #loop
    .goto 1442/1,1777.90,719.02,0
    .goto 1442/1,1777.90,719.02,40,0
    .goto 1442/1,1769.11,650.97,40,0
    .goto 1442/1,1819.90,600.17,40,0
    >>Kill |cRXP_ENEMY_Bloodfury Slayers|r
    .complete 1057,3 --Bloodfury Slayer slain (7)
    .mob Bloodfury Slayer
step
    #loop
    .goto 1442/1,1785.23,519.09,0
    .goto 1442/1,1785.23,519.09,40,0
    .goto 1442/1,1726.14,512.90,40,0
    .goto 1442/1,1622.61,478.39,40,0
    .goto 1442/1,1651.91,523.00,40,0
    >>Kill |cRXP_ENEMY_Rogue Flame Spirits|r, |cRXP_ENEMY_Burning Ravagers|r and |cRXP_ENEMY_Burning Destroyers|r. Loot them for |cRXP_LOOT_Smoldering Embers|r
    .complete 1083,1 --Smoldering Embers (8)
    .mob Rogue Flame Spirit
    .mob Burning Ravager
    .mob Burning Destroyer
    .isOnQuest 1083
step
    #label Along7
    #loop
    .goto 1442/1,1647.52,546.44,0
    .goto 1442/1,1647.52,546.44,40,0
    .goto 1442/1,1578.17,716.09,40,0
    .goto 1442/1,1758.86,699.81,40,0
    >>Kill |cRXP_ENEMY_Charred Ancients|r, |cRXP_ENEMY_Blackened Ancients|r and |cRXP_ENEMY_Vengeful Ancients|r. Loot them for |cRXP_LOOT_Corroded Shrapnel|r
    .complete 1084,1 --Corroded Shrapnel (1)
    .mob Charred Ancient
    .mob Blackened Ancient
    .mob Vengeful Ancient
    .isOnQuest 1084
step
    #loop
    .goto 1442/1,1550.83,612.22,0
    .goto 1442/1,1550.83,612.22,40,0
    .goto 1442/1,1510.78,639.90,40,0
    .goto 1442/1,1451.21,713.49,40,0
    .goto 1442/1,1514.20,749.31,40,0
    .goto 1442/1,1520.55,714.14,40,0
    .goto 1442/1,1551.80,701.44,40,0
    .goto 1442/1,1543.50,665.95,40,0
    >>Kill |cRXP_ENEMY_Bloodfury Roguefeathers|r
    .complete 1057,4 --Bloodfury Roguefeather slain (7)
    .mob Bloodfury Roguefeather
step
    .goto 1442/1,320.72,739.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kaela Shadowspear|r
    .turnin 1083 >>Turn in Enraged Spirits
    .target Kaela Shadowspear
    .isOnQuest 1083
step
    .goto 1442/1,320.72,739.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kaela Shadowspear|r
    .turnin 1084 >>Turn in Wounded Ancients
    .target Kaela Shadowspear
    .isOnQuest 1084
step
    .goto 1442/1,320.72,739.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kaela Shadowspear|r
    .accept 1082 >>Accept Update for Sentinel Thenysil
    .target Kaela Shadowspear
    .isQuestTurnedIn 1083 --Enraged Spirits
    .isQuestTurnedIn 1084 --Wounded Ancients
    .xp <17,1
step
    .goto 1442/1,1434.12,2652.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Keeper Albagorm|r
    .turnin 1057 >>Turn in Reclaiming the Charred Vale
    .accept 1059 >>Accept Reclaiming the Charred Vale
    .target Keeper Albagorm
step
    +|cRXP_WARN_That is all of Stonetalon Mountains for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Ashenvale|r: Update for Sentinel Thenysil
    >>|cRXP_FRIENDLY_Feralas|r: Reclaiming the Charred Vale
step
    .xp 27 >>|cRXP_WARN_The rest of Stonetalon Mountains is planned from level 27.|r Come back to this guide then
step
    .goto 1442/1,339.27,730.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gaxim Rustfizzle|r
    .accept 2931 >>Accept Castpipe's Task
    .target Gaxim Rustfizzle
step
    .goto 1442/1,365.16,878.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ziz Fizziks|r
    .accept 1096 >>Accept Gerenzo Wrenchwhistle
    .target Ziz Fizziks
    .isQuestTurnedIn 1095 --any of: Further Instructions
    .xp <16,1
step
    .goto 1442/1,402.76,1231.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veenix|r
    .turnin 78270 >>Turn in Goblin Lockpicks
    .target Veenix
    .isOnQuest 78270
step
    .goto 1442/1,96.57,1606.03
    >>Kill |cRXP_ENEMY_Gerenzo Wrenchwhistle|r and loot |cRXP_LOOT_Gerenzo's Mechanical Arm|r
    .complete 1096,1 --Gerenzo's Mechanical Arm (1)
    .mob Gerenzo Wrenchwhistle
    .isOnQuest 1096
step
    .goto 1442/1,365.16,878.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ziz Fizziks|r
    .turnin 1096 >>Turn in Gerenzo Wrenchwhistle
    .target Ziz Fizziks
    .isOnQuest 1096
step
    +|cRXP_WARN_End of the Stonetalon Mountains route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Ironforge|r: Castpipe's Task
]])
