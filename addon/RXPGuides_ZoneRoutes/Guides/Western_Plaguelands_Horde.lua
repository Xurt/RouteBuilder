-- 52-58 Western Plaguelands: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 2 parts with a level check between them (from level 52, 55).
-- Sections (the guide starts at the one for your level): start from 52; part 2 from 55.
-- Edit zones/Western Plaguelands.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#name 52-58 Western Plaguelands

step
    .xp <55,1,RBSection1_1
    .xp 55 >>Finding the place in this guide for your level
step
    .xp <61,1,RBSection2_1
step
    #label RBSection1_1
    #completewith next
    +|cRXP_WARN_Western Plaguelands: start|r (planned from level 52)
step
    .goto 1422/0,-1582.40,1871.70
    .xp 53+100000 >>AoE Undead in the area to 53 & 100000+/167100xp
    >>Remember to try and save 12 stacks of Runecloth. You'll need it for cloth turnins later
step
    .goto 1422/0,-729.28,1784.84
    .vendor >> You should be Friendly with the Argent Dawn now, so buy as many Manna Biscuits as possible to last you to level 60
    >>If you're not, turn in scourgestones you looted until you are
step
    .goto 1422/0,-1582.40,1871.70
    .xp 58 >> AoE Undead in the area to 58
step
    .goto 1422/0,-1574.23,2883.35,120,0
    .goto 1422/0,-1511.45,3010.34,120,0
    .goto 1422/0,-1541.12,3094.05,120,0
    .goto 1422/0,-1474.04,2873.31,120,0
    .xp 59+130000 >> Grind to 59 & 130000+/209800
step
    .goto 1422/0,-1171.32,1720.91
    >>Kill |cRXP_ENEMY_Cauldron Lord Bilemaw|r and loot |cRXP_LOOT_Felstone Field Cauldron Key|r
    .complete 5229,1 --Felstone Field Cauldron Key (1)
    .mob Cauldron Lord Bilemaw
    .isOnQuest 5229
step
    .goto 1422/0,-1185.08,1738.97
    >>Click the |cRXP_PICK_Scourge Cauldron|r
    .turnin 5229 >>Turn in Target: Felstone Field
    .isOnQuest 5229
step
    .goto 1422/0,-1185.08,1738.97
    >>Click the |cRXP_PICK_Scourge Cauldron|r
    .accept 5230 >>Accept Return to the Bulwark
    .isQuestTurnedIn 5229 --any of: Target: Felstone Field
    .xp <50,1
step
    .goto 1422/0,-1234.53,1817.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Janice Felstone|r
    .accept 5021 >>Accept Better Late Than Never
    .target Janice Felstone
step
    .goto 1422/0,-1248.72,1783.12
    >>Click the |cRXP_PICK_Janice's Parcel|r
    .turnin 5021 >>Turn in Better Late Than Never
    .accept 5023 >>Accept Better Late Than Never
step
    .goto 1422/0,-1566.06,1858.51
    >>Kill |cRXP_ENEMY_Cauldron Lord Malvinious|r and loot |cRXP_LOOT_Dalson's Tears Cauldron Key|r
    .complete 5231,1 --Dalson's Tears Cauldron Key (1)
    .mob Cauldron Lord Malvinious
    .isOnQuest 5231
step
    .goto 1422/0,-1569.07,1878.87
    >>Click the |cRXP_PICK_Scourge Cauldron|r
    .turnin 5231 >>Turn in Target: Dalson's Tears
    .isOnQuest 5231
step
    .goto 1422/0,-1569.07,1878.87
    >>Click the |cRXP_PICK_Scourge Cauldron|r
    .accept 5232 >>Accept Return to the Bulwark
    .isQuestTurnedIn 5231 --any of: Target: Dalson's Tears
    .xp <50,1
step
    .goto 1422/0,-1857.17,1472.37
    >>Kill |cRXP_ENEMY_Cauldron Lord Razarch|r and loot |cRXP_LOOT_Writhing Haunt Cauldron Key|r
    .complete 5233,1 --Writhing Haunt Cauldron Key (1)
    .mob Cauldron Lord Razarch
    .isOnQuest 5233
step
    .goto 1422/0,-1863.19,1485.85
    >>Click the |cRXP_PICK_Scourge Cauldron|r
    .turnin 5233 >>Turn in Target: Writhing Haunt
    .isOnQuest 5233
step
    .goto 1422/0,-1863.19,1485.85
    >>Click the |cRXP_PICK_Scourge Cauldron|r
    .accept 5234 >>Accept Return to the Bulwark
    .isQuestTurnedIn 5233 --any of: Target: Writhing Haunt
    .xp <50,1
step
    .goto 1422/0,-1893.72,1513.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mulgris Deepriver|r
    .accept 4984 >>Accept The Wildlife Suffers Too
    .target Mulgris Deepriver
step
    #loop
    .goto 1422/0,-1648.62,2011.59,0
    .goto 1422/0,-1648.62,2011.59,40,0
    .goto 1422/0,-1614.22,2047.71,40,0
    .goto 1422/0,-1622.39,2113.07,40,0
    .goto 1422/0,-1547.57,2109.06,40,0
    .goto 1422/0,-1552.30,2048.00,40,0
    .goto 1422/0,-1492.10,2051.73,40,0
    .goto 1422/0,-1438.35,2025.93,40,0
    .goto 1422/0,-1513.17,1947.38,40,0
    .goto 1422/0,-1548.43,1982.35,40,0
    >>Kill |cRXP_ENEMY_Diseased Wolfs|r
    .complete 4984,1 --Diseased Wolf slain (8)
    .mob Diseased Wolf
step
    .goto 1422/0,-1893.72,1513.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mulgris Deepriver|r
    .turnin 4984 >>Turn in The Wildlife Suffers Too
    .target Mulgris Deepriver
step
    .goto 1422/0,-1767.30,1134.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Myranda the Hag|r
    .turnin 6568 >>Turn in The Testament of Rexxar
    .target Myranda the Hag
    .isOnQuest 6568
step
    .goto 1422/0,-1767.30,1134.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Myranda the Hag|r
    .turnin 5861 >>Turn in Find Myranda
    .target Myranda the Hag
    .isOnQuest 5861
step
    .goto 1422/0,-1697.64,1114.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marlene Redpath|r
    .accept 5142 >>Accept Little Pamela
    .target Marlene Redpath
step
    .goto 1422/0,-1431.04,971.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Argent Officer Pureheart|r
    .accept 5401 >>Accept Argent Dawn Commission
    .turnin 5401 >>Turn in Argent Dawn Commission
    .target Argent Officer Pureheart
step
    .goto 1422/0,-1697.64,1114.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marlene Redpath|r
    .turnin 5152 >>Turn in Auntie Marlene
    .target Marlene Redpath
    .isOnQuest 5152
step
    .goto 1422/0,-2411.44,1206.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Artist Renfray|r
    .turnin 5846 >>Turn in Of Love and Family
    .target Artist Renfray
    .isOnQuest 5846
step
    .goto 1422/0,-2617.84,1242.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Marduke|r
    .turnin 5465 >>Turn in Soulbound Keepsake
    .target Magistrate Marduke
    .isOnQuest 5465
step
    .goto 1422/0,-2257.07,1673.61
    >>Kill |cRXP_ENEMY_Cauldron Lord Soulwrath|r and loot |cRXP_LOOT_Gahrron's Withering Cauldron Key|r
    .complete 5235,1 --Gahrron's Withering Cauldron Key (1)
    .mob Cauldron Lord Soulwrath
    .isOnQuest 5235
step
    .goto 1422/0,-2272.55,1690.53
    >>Click the |cRXP_PICK_Scourge Cauldron|r
    .turnin 5235 >>Turn in Target: Gahrron's Withering
    .isOnQuest 5235
step
    .goto 1422/0,-2272.55,1690.53
    >>Click the |cRXP_PICK_Scourge Cauldron|r
    .accept 5236 >>Accept Return to the Bulwark
    .isQuestTurnedIn 5235 --any of: Target: Gahrron's Withering
    .xp <50,1
step
    .goto 1422/0,-1661.95,2449.62
    >>Click the |cRXP_PICK_Termite Barrel|r
    .turnin 5902 >>Turn in A Plague Upon Thee
    .isOnQuest 5902
step
    .goto 1422/0,-1661.95,2449.62
    >>Click the |cRXP_PICK_Termite Barrel|r
    .accept 6390 >>Accept A Plague Upon Thee
    .isQuestTurnedIn 5902 --any of: A Plague Upon Thee
    .xp <48,1
step
    .goto 1422/0,-1234.53,1817.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Janice Felstone|r
    .turnin 5050 >>Turn in Good Luck Charm
    .target Janice Felstone
    .isOnQuest 5050
step
    .goto 1422/0,-1234.53,1817.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Janice Felstone|r
    .accept 5051 >>Accept Two Halves Become One
    .target Janice Felstone
    .isQuestTurnedIn 5050 --any of: Good Luck Charm
    .xp <50,1
step
    .goto 1422/0,-1234.53,1817.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Janice Felstone|r
    .turnin 5051 >>Turn in Two Halves Become One
    .target Janice Felstone
    .isOnQuest 5051
step
    .goto 1422/0,-1280.11,1452.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chromie|r
    .turnin 5941 >>Turn in Return to Chromie
    .target Chromie
    .isOnQuest 5941
step
    .goto 1422/0,-1276.24,1452.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jeziba|r
    .turnin 5162 >>Turn in Wrath of the Blue Flight
    .target Jeziba
    .isOnQuest 5162
step
    +|cRXP_WARN_That is all of Western Plaguelands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Eastern Plaguelands|r: Little Pamela
    >>|cRXP_FRIENDLY_Tirisfal Glades|r: Return to the Bulwark, Return to the Bulwark, Return to the Bulwark, A Plague Upon Thee, Return to the Bulwark
    >>|cRXP_FRIENDLY_Undercity|r: Better Late Than Never
step
    .xp 55 >>|cRXP_WARN_The rest of Western Plaguelands is planned from level 55.|r Come back to this guide then
step
    #label RBSection2_1
    #completewith next
    +|cRXP_WARN_Western Plaguelands: part 2|r (planned from level 55)
step
    .goto 1422/0,-1619.38,1943.94
    >>Click the |cRXP_PICK_Locked Cabinet|r
    .accept 5060 >>Accept Locked Away
step
    .goto 1422/0,-1657.22,1942.79
    >>Kill |cRXP_ENEMY_Farmer Dalson|r and loot |cRXP_LOOT_Dalson Cabinet Key|r
    .complete 5060,1 --Dalson Cabinet Key (1)
    .mob Farmer Dalson
step
    .goto 1422/0,-1619.38,1943.94
    >>Click the |cRXP_PICK_Locked Cabinet|r
    .turnin 5060 >>Turn in Locked Away
step
    .goto 1422/0,-1638.73,1914.13
    >>Click the |cRXP_PICK_Mrs. Dalson's Diary|r
    .accept 5058 >>Accept Mrs. Dalson's Diary
step
    .goto 1422/0,-1638.73,1914.13
    >>Click the |cRXP_PICK_Mrs. Dalson's Diary|r
    >>|cRXP_WARN_The database has no objectives for Mrs. Dalson's Diary. Skip this step if the quest is not finished|r
    .turnin 5058 >>Turn in Mrs. Dalson's Diary
    .isOnQuest 5058
step
    .goto 1422/0,-1280.11,1452.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chromie|r
    .accept 4971 >>Accept A Matter of Time
    .target Chromie
step
    #loop
    .goto 1422/0,-1527.36,1565.54,0
    .goto 1422/0,-1527.36,1565.54,40,0
    .goto 1422/0,-1591.00,1587.04,40,0
    .goto 1422/0,-1640.02,1547.77,40,0
    .goto 1422/0,-1666.68,1566.11,40,0
    .goto 1422/0,-1657.22,1520.82,40,0
    .goto 1422/0,-1741.93,1464.92,40,0
    .goto 1422/0,-1691.19,1380.07,40,0
    .goto 1422/0,-1658.51,1481.26,40,0
    .goto 1422/0,-1613.36,1478.68,40,0
    >>Kill |cRXP_ENEMY_Temporal Parasites|r
    .complete 4971,1 --Temporal Parasite slain (10)
    .mob Temporal Parasite
step
    .goto 1422/0,-1280.11,1452.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chromie|r
    .turnin 4971 >>Turn in A Matter of Time
    .accept 4972 >>Accept Counting Out Time
    .target Chromie
step
    #loop
    .goto 1422/0,-1429.32,1408.16,0
    .goto 1422/0,-1429.32,1408.16,40,0
    .goto 1422/0,-1419.00,1371.47,40,0
    .goto 1422/0,-1384.60,1297.79,40,0
    .goto 1422/0,-1379.87,1257.37,40,0
    .goto 1422/0,-1425.45,1247.34,40,0
    .goto 1422/0,-1457.70,1259.67,40,0
    .goto 1422/0,-1511.45,1278.59,40,0
    .goto 1422/0,-1578.53,1275.15,40,0
    .goto 1422/0,-1510.59,1347.67,40,0
    >>Loot the |cRXP_PICK_Small Lockboxes|r for |cRXP_LOOT_Andorhal Watch|r
    .complete 4972,1 --Andorhal Watch (5)
step
    .goto 1422/0,-1280.11,1452.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chromie|r
    .turnin 4972 >>Turn in Counting Out Time
    .target Chromie
step
    .goto 1422/0,-1815.89,2562.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kirsta Deepshadow|r
    .accept 6004 >>Accept Unfinished Business
    .target Kirsta Deepshadow
step
    .goto 1422/0,-1814.60,2087.85
    >>Kill |cRXP_ENEMY_Scarlet Medics|r
    >>Kill |cRXP_ENEMY_Scarlet Hunters|r
    .complete 6004,1 --Scarlet Medic slain (2)
    .complete 6004,2 --Scarlet Hunter slain (2)
    .mob Scarlet Medic
    .mob Scarlet Hunter
step
    #completewith Along12
    >>As you go: Kill |cRXP_ENEMY_Scarlet Knights|r. |cRXP_WARN_Anything left is finished later|r
    .complete 6004,4 --Scarlet Knight slain (2)
    .mob Scarlet Knight
step
    #label Along12
    .goto 1422/0,-1852.44,2289.95
    >>Kill |cRXP_ENEMY_Scarlet Mages|r
    .complete 6004,3 --Scarlet Mage slain (8)
    .mob Scarlet Mage
step
    #loop
    .goto 1422/0,-1766.01,2206.53,0
    .goto 1422/0,-1766.01,2206.53,40,0
    .goto 1422/0,-1764.29,2183.88,40,0
    .goto 1422/0,-1726.02,2173.85,40,0
    >>Kill |cRXP_ENEMY_Scarlet Knights|r
    .complete 6004,4 --Scarlet Knight slain (2)
    .mob Scarlet Knight
step
    .goto 1422/0,-1815.89,2562.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kirsta Deepshadow|r
    .turnin 6004 >>Turn in Unfinished Business
    .accept 6023 >>Accept Unfinished Business
    .target Kirsta Deepshadow
step
    .goto 1422/0,-2070.02,2331.80
    >>Kill |cRXP_ENEMY_Huntsman Radley|r
    .complete 6023,1 --Huntsman Radley slain (1)
    .mob Huntsman Radley
step
    .goto 1422/0,-1954.78,2689.56
    >>Kill |cRXP_ENEMY_Cavalier Durgen|r
    .complete 6023,2 --Cavalier Durgen slain (1)
    .mob Cavalier Durgen
step
    .goto 1422/0,-1815.89,2562.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kirsta Deepshadow|r
    .turnin 6023 >>Turn in Unfinished Business
    .target Kirsta Deepshadow
step
    .goto 1422/0,-1893.72,1513.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mulgris Deepriver|r
    .accept 4985 >>Accept The Wildlife Suffers Too
    .target Mulgris Deepriver
    .isQuestTurnedIn 4984 --any of: The Wildlife Suffers Too
step
    #loop
    .goto 1422/0,-2115.17,1821.25,0
    .goto 1422/0,-2115.17,1821.25,40,0
    .goto 1422/0,-2070.88,1848.77,40,0
    .goto 1422/0,-2112.59,1917.85,40,0
    .goto 1422/0,-2186.12,1949.67,40,0
    .goto 1422/0,-2244.17,2018.47,40,0
    .goto 1422/0,-2286.31,1936.49,40,0
    .goto 1422/0,-2244.60,1880.87,40,0
    .goto 1422/0,-2199.88,1903.52,40,0
    .goto 1422/0,-2182.25,1815.51,40,0
    >>Kill |cRXP_ENEMY_Diseased Grizzlies|r
    .complete 4985,1 --Diseased Grizzly slain (8)
    .mob Diseased Grizzly
    .isOnQuest 4985
step
    .goto 1422/0,-1893.72,1513.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mulgris Deepriver|r
    .turnin 4985 >>Turn in The Wildlife Suffers Too
    .target Mulgris Deepriver
    .isOnQuest 4985
step
    .goto 1422/0,-1903.18,2665.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lord Tirion Fordring|r
    .accept 5542 >>Accept Demon Dogs
    .accept 5543 >>Accept Blood Tinged Skies
    .accept 5544 >>Accept Carrion Grubbage
    .target Lord Tirion Fordring
step
    .goto 1422/0,-1893.72,1513.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mulgris Deepriver|r
    .accept 4987 >>Accept Glyphed Oaken Branch
    .target Mulgris Deepriver
    .isQuestTurnedIn 4985 --any of: The Wildlife Suffers Too
step
    .goto 1422/0,-1767.30,1134.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Myranda the Hag|r
    .accept 6570 >>Accept Emberstrife
    .target Myranda the Hag
    .isQuestTurnedIn 6569 --any of: Oculus Illusions
    .xp <55,1
step
    .goto 1422/0,-1767.30,1134.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Myranda the Hag|r
    .accept 5862 >>Accept Scarlet Subterfuge
    .target Myranda the Hag
    .isQuestTurnedIn 5861 --any of: Find Myranda
    .xp <52,1
step
    .goto 1422/0,-1697.64,1114.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marlene Redpath|r
    .accept 5153 >>Accept A Strange Historian
    .target Marlene Redpath
    .isQuestTurnedIn 5152 --any of: Auntie Marlene
    .xp <50,1
step
    .goto 1422/0,-1720.43,1166.21
    >>Open the |cRXP_PICK_Joseph Redpath's Monument|r. Loot it for |cRXP_LOOT_Joseph's Wedding Ring|r
    .complete 5153,1 --Joseph's Wedding Ring (1)
    .isOnQuest 5153
step
    .goto 1422/0,-1280.11,1452.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chromie|r
    .turnin 5153 >>Turn in A Strange Historian
    .target Chromie
    .isOnQuest 5153
step
    .goto 1422/0,-1280.11,1452.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chromie|r
    .accept 5721 >>Accept The Battle of Darrowshire
    .target Chromie
    .isQuestTurnedIn 5941 --any of: Return to Chromie
    .xp <55,1
step
    .goto 1422/0,-1280.11,1452.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chromie|r
    .accept 5154 >>Accept The Annals of Darrowshire
    .target Chromie
    .isQuestTurnedIn 5153 --any of: A Strange Historian
    .xp <50,1
step
    .goto 1422/0,-1458.13,1360.86
    >>Open the |cRXP_PICK_Musty Tome|r. Loot it for |cRXP_LOOT_Annals of Darrowshire|r
    .complete 5154,1 --Annals of Darrowshire (1)
    .isOnQuest 5154
step
    .goto 1422/0,-1280.11,1452.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chromie|r
    .turnin 5154 >>Turn in The Annals of Darrowshire
    .target Chromie
    .isOnQuest 5154
step
    .goto 1422/0,-1280.11,1452.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chromie|r
    .accept 5210 >>Accept Brother Carlin
    .target Chromie
    .isQuestTurnedIn 5154 --any of: The Annals of Darrowshire
    .xp <50,1
step
    .goto 1422/0,-1815.89,2562.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kirsta Deepshadow|r
    .accept 6025 >>Accept Unfinished Business
    .target Kirsta Deepshadow
step
    .goto 1422/0,-1553.16,2843.50
    >>Overlook Hearthglen from a high vantage point
    .complete 6025,1 --Overlook Hearthglen from a high vantage point
step
    .goto 1422/0,-1390.19,2942.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Highlord Taelan Fordring|r
    .turnin 5862 >>Turn in Scarlet Subterfuge
    .target Highlord Taelan Fordring
    .isOnQuest 5862
step
    .goto 1422/0,-1815.89,2562.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kirsta Deepshadow|r
    .turnin 6025 >>Turn in Unfinished Business
    .target Kirsta Deepshadow
step
    +|cRXP_WARN_End of the Western Plaguelands route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Dustwallow Marsh|r: Emberstrife
    >>|cRXP_FRIENDLY_Eastern Plaguelands|r: Brother Carlin, Demon Dogs, Blood Tinged Skies, Carrion Grubbage, The Battle of Darrowshire
    >>|cRXP_FRIENDLY_Thunder Bluff|r: Glyphed Oaken Branch
]])
