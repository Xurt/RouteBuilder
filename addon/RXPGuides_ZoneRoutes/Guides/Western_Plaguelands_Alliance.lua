-- 52-60 Western Plaguelands: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 3 parts with a level check between them (from level 52, 55, 58).
-- Edit zones/Western Plaguelands.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#name 52-60 Western Plaguelands

step << Human Paladin/Dwarf Paladin
    .goto 1422/0,-1419.43,957.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Ashlam Valorfist|r
    .turnin 8415 >>Turn in Chillwind Point
    .target Commander Ashlam Valorfist
    .isOnQuest 8415
step << Human Paladin/Dwarf Paladin
    .goto 1422/0,-1419.43,957.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Ashlam Valorfist|r
    .accept 8414 >>Accept Dispelling Evil
    .target Commander Ashlam Valorfist
step
    .goto 1422/0,-1419.43,957.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Ashlam Valorfist|r
    .turnin 5066 >>Turn in A Call to Arms: The Plaguelands!
    .target Commander Ashlam Valorfist
    .isOnQuest 5066
step
    .goto 1422/0,-1419.43,957.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Ashlam Valorfist|r
    .turnin 5091 >>Turn in A Call to Arms: The Plaguelands!
    .target Commander Ashlam Valorfist
    .isOnQuest 5091
step
    .goto 1422/0,-1417.71,965.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alchemist Arbington|r
    .turnin 5801 >>Turn in Fire Plume Forged
    .target Alchemist Arbington
    .isQuestComplete 5801
step
    .goto 1422/0,-1431.04,971.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Argent Officer Pureheart|r
    .accept 5401 >>Accept Argent Dawn Commission
    .target Argent Officer Pureheart
step
    .goto 1422/0,-1431.04,971.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Argent Officer Pureheart|r
    .turnin 5401 >>Turn in Argent Dawn Commission while you are here
    .isQuestComplete 5401
    .target Argent Officer Pureheart
step << Human Paladin/Dwarf Paladin
    #loop
    .goto 1422/0,-1198.84,1659.28,0
    .goto 1422/0,-1198.84,1659.28,40,0
    .goto 1422/0,-1133.48,1689.95,40,0
    .goto 1422/0,-1115.42,1732.38,40,0
    .goto 1422/0,-1199.70,1734.96,40,0
    .goto 1422/0,-1191.53,1772.80,40,0
    .goto 1422/0,-1172.18,1819.53,40,0
    .goto 1422/0,-1240.55,1819.81,40,0
    .goto 1422/0,-1262.48,1764.20,40,0
    .goto 1422/0,-1239.69,1719.19,40,0
    >>Kill |cRXP_ENEMY_Skeletal Flayers|r, |cRXP_ENEMY_Skeletal Sorcerers|r, |cRXP_ENEMY_Skeletal Terrors|r and |cRXP_ENEMY_Skeletal Executioners|r. Loot them for |cRXP_LOOT_Minion's Scourgestone|r
    .complete 8414,1 --Minion's Scourgestone (20)
    .mob Skeletal Flayer
    .mob Skeletal Sorcerer
    .mob Skeletal Terror
    .mob Skeletal Executioner
step << Human Paladin/Dwarf Paladin
    .goto 1422/0,-1821.48,979.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priest Thel'danis|r
    .turnin 8414 >>Turn in Dispelling Evil
    .accept 8416 >>Accept Inert Scourgestones
    .target High Priest Thel'danis
step
    .goto 1422/0,-1419.43,957.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Ashlam Valorfist|r
    .turnin 5090 >>Turn in A Call to Arms: The Plaguelands!
    .target Commander Ashlam Valorfist
    .isOnQuest 5090
step
    .goto 1422/0,-1419.43,957.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Ashlam Valorfist|r
    .turnin 8416 >>Turn in Inert Scourgestones << Human Paladin/Dwarf Paladin
    .accept 8418 >>Accept Forging the Mightstone << Human Paladin/Dwarf Paladin
    .accept 5092 >>Accept Clear the Way
    .target Commander Ashlam Valorfist
step << Hunter
    .xp 52-16950 >> Grind until you are 16950 XP away from 52
    >>If you are not yet close, do one more Cauldron quest to get you where you need to be
step
    .goto 1422/0,-1431.04,971.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Argent Officer Pureheart|r
    .turnin 5401 >>Turn in Argent Dawn Commission
    .target Argent Officer Pureheart
step
    #completewith Along11
    >>As you go: Kill |cRXP_ENEMY_Skeletal Flayers|r. Kill |cRXP_ENEMY_Slavering Ghouls|r. |cRXP_WARN_Anything left is finished later|r
    .complete 5092,1 --Skeletal Flayer slain (10)
    .complete 5092,2 --Slavering Ghoul slain (10)
    .mob Skeletal Flayer
    .mob Slavering Ghoul
step
    #label Along11
    .goto 1422/0,-1697.64,1114.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marlene Redpath|r
    .accept 5142 >>Accept Little Pamela
    .target Marlene Redpath
step
    #loop
    .goto 1422/0,-1710.54,1136.69,0
    .goto 1422/0,-1710.54,1136.69,40,0
    .goto 1422/0,-1653.78,1113.47,40,0
    .goto 1422/0,-1684.74,1068.75,40,0
    .goto 1422/0,-1620.24,1022.02,40,0
    .goto 1422/0,-1620.24,950.07,40,0
    .goto 1422/0,-1716.56,993.93,40,0
    .goto 1422/0,-1766.44,1057.57,40,0
    .goto 1422/0,-1779.34,1168.22,40,0
    .goto 1422/0,-1744.94,1217.53,40,0
    >>Kill |cRXP_ENEMY_Skeletal Flayers|r
    >>Kill |cRXP_ENEMY_Slavering Ghouls|r
    .complete 5092,1 --Skeletal Flayer slain (10)
    .complete 5092,2 --Slavering Ghoul slain (10)
    .mob Skeletal Flayer
    .mob Slavering Ghoul
step
    .goto 1422/0,-1767.30,1134.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Myranda the Hag|r
    .turnin 5861 >>Turn in Find Myranda
    .target Myranda the Hag
    .isOnQuest 5861
step
    .goto 1422/0,-1419.43,957.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Ashlam Valorfist|r
    .turnin 5092 >>Turn in Clear the Way
    .accept 5215 >>Accept The Scourge Cauldrons
    .target Commander Ashlam Valorfist
step
    .goto 1422/0,-1431.04,944.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess MacDonnell|r
    .turnin 5215 >>Turn in The Scourge Cauldrons
    .accept 5216 >>Accept Target: Felstone Field
    .target High Priestess MacDonnell
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
    .goto 1422/0,-1171.32,1720.91
    >>Kill |cRXP_ENEMY_Cauldron Lord Bilemaw|r and loot |cRXP_LOOT_Felstone Field Cauldron Key|r
    .complete 5216,1 --Felstone Field Cauldron Key (1)
    .mob Cauldron Lord Bilemaw
step
    .goto 1422/0,-1185.08,1738.97
    >>Click the |cRXP_PICK_Scourge Cauldron|r
    .turnin 5216 >>Turn in Target: Felstone Field
    .accept 5217 >>Accept Return to Chillwind Camp
step
    .goto 1422/0,-1234.53,1817.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Janice Felstone|r
    .accept 5021 >>Accept Better Late Than Never
    .target Janice Felstone
step
    .goto 1422/0,-1248.72,1783.12
    >>Click the |cRXP_PICK_Janice's Parcel|r
    .turnin 5021 >>Turn in Better Late Than Never
    .accept 5022 >>Accept Better Late Than Never
step
    .goto 1422/0,-1431.04,944.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess MacDonnell|r
    .turnin 5217 >>Turn in Return to Chillwind Camp
    .target High Priestess MacDonnell
step
    .goto 1422/0,-1425.45,966.98
    >>Talk to |cRXP_FRIENDLY_Lightspark|r
    .vendor 10857 >> Vendor Trash (and all your old food). Repair
    >>|cRXP_BUY_Buy some|r |T133989:0|t[Enriched Manna Biscuits] |cRXP_BUY_from him|r
    .collect 13724,260
    .target Argent Quartermaster Lightspark
step
    .goto 1422/0,-1654.21,1845.04,25,0
    .goto 1422/0,-1580.68,1866.54,25,0
    .goto 1422/0,-1600.03,1814.94,25,0
    .goto 1422/0,-1563.91,1758.75,25,0
    .goto 1422/0,-1511.88,1804.05,25,0
    .goto 1422/0,-1548.00,1837.87,25,0
    .goto 1422/0,-1566.92,1865.39,25,0
    .goto 1422/0,-1569.07,1892.91,25,0
    .goto 1422/0,-1520.05,1887.75,25,0
    .goto 1422/0,-1514.89,1851.63,25,0
    .goto 1422/0,-1544.99,1924.16,25,0
    .goto 1422/0,-1576.81,1948.24,25,0
    .goto 1422/0,-1597.02,1942.79,25,0
    .goto 1422/0,-1603.04,1918.71,25,0
    .goto 1422/0,-1597.02,1942.79,25,0
    .goto 1422/0,-1623.25,1953.11,25,0
    .goto 1422/0,-1637.01,1931.90,25,0
    .goto 1422/0,-1660.66,1916.13,25,0
    .goto 1422/0,-1649.48,1888.61,25,0
    .goto 1422/0,-1654.21,1845.04,25,0
    .xp 54 >>AoE |cRXP_ENEMY_Blighted Zombies|r, |cRXP_ENEMY_Rotting Cadavers|r, |cRXP_ENEMY_Skeletal Terrors|r, and the |cRXP_ENEMY_Wandering Skeleton|r to Level 54. Loot them for |T132903:0|t[|cRXP_LOOT_Runecloth|r], |T133447:0|t[|cRXP_LOOT_Minion's Scourgestones|r], and |T133724:0|t[|cRXP_LOOT_Bone Fragments|r]
    >>|cRXP_WARN_Be careful as |cRXP_ENEMY_Blighted Zombies|r cast|r |T135914:0|t[Volatile Infection] |cRXP_WARN_(deals 156 nature damage every 15 seconds, causing pushback, dispellable with|r |T135841:0|t[Ice Block]|cRXP_WARN_), and |cRXP_ENEMY_Skeletal Terrors|r cast|r |T136183:0|t[Fear]|cRXP_WARN_, (Fearing you for 4 seconds IF they've been rooted by|r |T135848:0|t[Frost Nova]|cRXP_WARN_. Remember to|r |T135736:0|t[Blink] |cRXP_WARN_out of range of their cast if needed|r
    >>|cRXP_WARN_Avoid aggroing the |cRXP_ENEMY_Scarlets|r. If you do, run away|r
step
    .goto 1422/0,-1425.45,966.98
    >>Talk to |cRXP_FRIENDLY_Lightspark|r
    .vendor 10857 >> Vendor Trash. Repair
    >>|cRXP_BUY_Buy some|r |T133989:0|t[Enriched Manna Biscuits] |cRXP_BUY_from him|r
    .collect 13724,260
    .target Argent Quartermaster Lightspark
step
    .goto 1422/0,-1654.21,1845.04,25,0
    .goto 1422/0,-1580.68,1866.54,25,0
    .goto 1422/0,-1600.03,1814.94,25,0
    .goto 1422/0,-1563.91,1758.75,25,0
    .goto 1422/0,-1511.88,1804.05,25,0
    .goto 1422/0,-1548.00,1837.87,25,0
    .goto 1422/0,-1566.92,1865.39,25,0
    .goto 1422/0,-1569.07,1892.91,25,0
    .goto 1422/0,-1520.05,1887.75,25,0
    .goto 1422/0,-1514.89,1851.63,25,0
    .goto 1422/0,-1544.99,1924.16,25,0
    .goto 1422/0,-1576.81,1948.24,25,0
    .goto 1422/0,-1597.02,1942.79,25,0
    .goto 1422/0,-1603.04,1918.71,25,0
    .goto 1422/0,-1614.65,1936.77,25,0
    .goto 1422/0,-1603.04,1918.71,25,0
    .goto 1422/0,-1597.02,1942.79,25,0
    .goto 1422/0,-1623.25,1953.11,25,0
    .goto 1422/0,-1637.01,1931.90,25,0
    .goto 1422/0,-1660.66,1916.13,25,0
    .goto 1422/0,-1649.48,1888.61,25,0
    .goto 1422/0,-1654.21,1845.04,25,0
    .xp 56 >>AoE |cRXP_ENEMY_Blighted Zombies|r, |cRXP_ENEMY_Rotting Cadavers|r, |cRXP_ENEMY_Skeletal Terrors|r, and the |cRXP_ENEMY_Wandering Skeleton|r to Level 56. Loot them for |T132903:0|t[|cRXP_LOOT_Runecloth|r], |T133447:0|t[|cRXP_LOOT_Minion's Scourgestones|r], and |T133724:0|t[|cRXP_LOOT_Bone Fragments|r]
    >>|cRXP_WARN_Be careful as |cRXP_ENEMY_Blighted Zombies|r cast|r |T135914:0|t[Volatile Infection] |cRXP_WARN_(deals 156 nature damage every 15 seconds, causing pushback, dispellable with|r |T135841:0|t[Ice Block]|cRXP_WARN_), and |cRXP_ENEMY_Skeletal Terrors|r cast|r |T136183:0|t[Fear]|cRXP_WARN_, (Fearing you for 4 seconds IF they've been rooted by|r |T135848:0|t[Frost Nova]|cRXP_WARN_. Remember to|r |T135736:0|t[Blink] |cRXP_WARN_out of range of their cast if needed|r
    >>|cRXP_WARN_Avoid aggroing the |cRXP_ENEMY_Scarlets|r. If you do, run away|r
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
    .goto 1422/0,-1654.21,1845.04,25,0
    .goto 1422/0,-1580.68,1866.54,25,0
    .goto 1422/0,-1600.03,1814.94,25,0
    .goto 1422/0,-1563.91,1758.75,25,0
    .goto 1422/0,-1511.88,1804.05,25,0
    .goto 1422/0,-1548.00,1837.87,25,0
    .goto 1422/0,-1566.92,1865.39,25,0
    .goto 1422/0,-1569.07,1892.91,25,0
    .goto 1422/0,-1520.05,1887.75,25,0
    .goto 1422/0,-1514.89,1851.63,25,0
    .goto 1422/0,-1544.99,1924.16,25,0
    .goto 1422/0,-1576.81,1948.24,25,0
    .goto 1422/0,-1597.02,1942.79,25,0
    .goto 1422/0,-1603.04,1918.71,25,0
    .goto 1422/0,-1614.65,1936.77,25,0
    .goto 1422/0,-1603.04,1918.71,25,0
    .goto 1422/0,-1597.02,1942.79,25,0
    .goto 1422/0,-1623.25,1953.11,25,0
    .goto 1422/0,-1637.01,1931.90,25,0
    .goto 1422/0,-1660.66,1916.13,25,0
    .goto 1422/0,-1649.48,1888.61,25,0
    .goto 1422/0,-1654.21,1845.04,25,0
    .xp 57 >>AoE |cRXP_ENEMY_Blighted Zombies|r, |cRXP_ENEMY_Rotting Cadavers|r, |cRXP_ENEMY_Skeletal Terrors|r, and the |cRXP_ENEMY_Wandering Skeleton|r to Level 57. Loot them for |T132903:0|t[|cRXP_LOOT_Runecloth|r], |T133447:0|t[|cRXP_LOOT_Minion's Scourgestones|r], and |T133724:0|t[|cRXP_LOOT_Bone Fragments|r]
    >>|cRXP_WARN_Be careful as |cRXP_ENEMY_Blighted Zombies|r cast|r |T135914:0|t[Volatile Infection] |cRXP_WARN_(deals 156 nature damage every 15 seconds, causing pushback, dispellable with|r |T135841:0|t[Ice Block]|cRXP_WARN_), and |cRXP_ENEMY_Skeletal Terrors|r cast|r |T136183:0|t[Fear]|cRXP_WARN_, (Fearing you for 4 seconds IF they've been rooted by|r |T135848:0|t[Frost Nova]|cRXP_WARN_. Remember to|r |T135736:0|t[Blink] |cRXP_WARN_out of range of their cast if needed|r
    >>|cRXP_WARN_Avoid aggroing the |cRXP_ENEMY_Scarlets|r. If you do, run away|r
step
    .goto 1422/0,-1654.21,1845.04,25,0
    .goto 1422/0,-1580.68,1866.54,25,0
    .goto 1422/0,-1600.03,1814.94,25,0
    .goto 1422/0,-1563.91,1758.75,25,0
    .goto 1422/0,-1511.88,1804.05,25,0
    .goto 1422/0,-1548.00,1837.87,25,0
    .goto 1422/0,-1566.92,1865.39,25,0
    .goto 1422/0,-1569.07,1892.91,25,0
    .goto 1422/0,-1520.05,1887.75,25,0
    .goto 1422/0,-1514.89,1851.63,25,0
    .goto 1422/0,-1544.99,1924.16,25,0
    .goto 1422/0,-1576.81,1948.24,25,0
    .goto 1422/0,-1597.02,1942.79,25,0
    .goto 1422/0,-1603.04,1918.71,25,0
    .goto 1422/0,-1614.65,1936.77,25,0
    .goto 1422/0,-1603.04,1918.71,25,0
    .goto 1422/0,-1597.02,1942.79,25,0
    .goto 1422/0,-1623.25,1953.11,25,0
    .goto 1422/0,-1637.01,1931.90,25,0
    .goto 1422/0,-1660.66,1916.13,25,0
    .goto 1422/0,-1649.48,1888.61,25,0
    .goto 1422/0,-1654.21,1845.04,25,0
    .xp 57+188350 >>AoE |cRXP_ENEMY_Blighted Zombies|r, |cRXP_ENEMY_Rotting Cadavers|r, |cRXP_ENEMY_Skeletal Terrors|r, and the |cRXP_ENEMY_Wandering Skeleton|r to 188350+/195000xp. Loot them for |T132903:0|t[|cRXP_LOOT_Runecloth|r], |T133447:0|t[|cRXP_LOOT_Minion's Scourgestones|r], and |T133724:0|t[|cRXP_LOOT_Bone Fragments|r]
    >>|cRXP_WARN_Be careful as |cRXP_ENEMY_Blighted Zombies|r cast|r |T135914:0|t[Volatile Infection] |cRXP_WARN_(deals 156 nature damage every 15 seconds, causing pushback, dispellable with|r |T135841:0|t[Ice Block]|cRXP_WARN_), and |cRXP_ENEMY_Skeletal Terrors|r cast|r |T136183:0|t[Fear]|cRXP_WARN_, (Fearing you for 4 seconds IF they've been rooted by|r |T135848:0|t[Frost Nova]|cRXP_WARN_. Remember to|r |T135736:0|t[Blink] |cRXP_WARN_out of range of their cast if needed|r
    >>|cRXP_WARN_Avoid aggroing the |cRXP_ENEMY_Scarlets|r. If you do, run away|r
step
    .goto 1422/0,-1893.72,1513.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mulgris Deepriver|r
    .accept 4984 >>Accept The Wildlife Suffers Too
    .target Mulgris Deepriver
step
    .goto 1422/0,-1863.19,1486.13
    .xp 58 >> Grind to level 58
step
    .goto 1422/0,-1450.39,934.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathaniel Dumah|r
    .accept 5903 >>Accept A Plague Upon Thee
    .target Nathaniel Dumah
step
    .goto 1422/0,-1458.56,944.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Flint Shadowmore|r
    .turnin 6184 >>Turn in Flint Shadowmore
    .target Flint Shadowmore
    .isOnQuest 6184
step
    .goto 1422/0,-1450.39,934.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathaniel Dumah|r
    .turnin 5903 >>Turn in A Plague Upon Thee
    .target Nathaniel Dumah
    .isQuestComplete 5903
step << Human Paladin/Dwarf Paladin
    .goto 1422/0,-1419.43,957.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Ashlam Valorfist|r
    .turnin 8418 >>Turn in Forging the Mightstone
    .target Commander Ashlam Valorfist
    .isQuestComplete 8418
step
    #loop
    .goto 1422/0,-1513.17,1947.38,0
    .goto 1422/0,-1513.17,1947.38,40,0
    .goto 1422/0,-1548.43,1982.35,40,0
    .goto 1422/0,-1648.62,2011.59,40,0
    .goto 1422/0,-1614.22,2047.71,40,0
    .goto 1422/0,-1622.39,2113.07,40,0
    .goto 1422/0,-1547.57,2109.06,40,0
    .goto 1422/0,-1552.30,2048.00,40,0
    .goto 1422/0,-1492.10,2051.73,40,0
    .goto 1422/0,-1438.35,2025.93,40,0
    >>Kill |cRXP_ENEMY_Diseased Wolfs|r
    .complete 4984,1 --Diseased Wolf slain (8)
    .mob Diseased Wolf
step
    .goto 1422/0,-1893.72,1513.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mulgris Deepriver|r
    .turnin 4984 >>Turn in The Wildlife Suffers Too
    .target Mulgris Deepriver
step
    .goto 1422/0,-1450.39,934.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathaniel Dumah|r
    .accept 5904 >>Accept A Plague Upon Thee
    .target Nathaniel Dumah
    .isQuestTurnedIn 5903 --any of: A Plague Upon Thee
    .xp <48,1
step
    .goto 1422/0,-1697.64,1114.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marlene Redpath|r
    .turnin 5152 >>Turn in Auntie Marlene
    .target Marlene Redpath
    .isOnQuest 5152
step
    .goto 1422/0,-1661.95,2449.62
    >>Click the |cRXP_PICK_Termite Barrel|r
    .turnin 5904 >>Turn in A Plague Upon Thee
    .isOnQuest 5904
step
    .goto 1422/0,-1661.95,2449.62
    >>Click the |cRXP_PICK_Termite Barrel|r
    .accept 6389 >>Accept A Plague Upon Thee
    .isQuestTurnedIn 5904 --any of: A Plague Upon Thee
    .xp <48,1
step
    .goto 1422/0,-1654.21,1845.04,25,0
    .goto 1422/0,-1580.68,1866.54,25,0
    .goto 1422/0,-1600.03,1814.94,25,0
    .goto 1422/0,-1563.91,1758.75,25,0
    .goto 1422/0,-1511.88,1804.05,25,0
    .goto 1422/0,-1548.00,1837.87,25,0
    .goto 1422/0,-1566.92,1865.39,25,0
    .goto 1422/0,-1569.07,1892.91,25,0
    .goto 1422/0,-1520.05,1887.75,25,0
    .goto 1422/0,-1514.89,1851.63,25,0
    .goto 1422/0,-1544.99,1924.16,25,0
    .goto 1422/0,-1576.81,1948.24,25,0
    .goto 1422/0,-1597.02,1942.79,25,0
    .goto 1422/0,-1603.04,1918.71,25,0
    .goto 1422/0,-1614.65,1936.77,25,0
    .goto 1422/0,-1603.04,1918.71,25,0
    .goto 1422/0,-1597.02,1942.79,25,0
    .goto 1422/0,-1623.25,1953.11,25,0
    .goto 1422/0,-1637.01,1931.90,25,0
    .goto 1422/0,-1660.66,1916.13,25,0
    .goto 1422/0,-1649.48,1888.61,25,0
    .goto 1422/0,-1654.21,1845.04,25,0
    .xp 59+132800 >>AoE |cRXP_ENEMY_Blighted Zombies|r, |cRXP_ENEMY_Rotting Cadavers|r, |cRXP_ENEMY_Skeletal Terrors|r, and the |cRXP_ENEMY_Wandering Skeleton|r to 132800+/209800xp. Loot them for |T132903:0|t[|cRXP_LOOT_Runecloth|r] and |T133447:0|t[|cRXP_LOOT_Minion's Scourgestones|r]
    >>|cRXP_WARN_Be careful as |cRXP_ENEMY_Blighted Zombies|r cast|r |T135914:0|t[Volatile Infection] |cRXP_WARN_(deals 156 nature damage every 15 seconds, causing pushback, dispellable with|r |T135841:0|t[Ice Block]|cRXP_WARN_), and |cRXP_ENEMY_Skeletal Terrors|r cast|r |T136183:0|t[Fear]|cRXP_WARN_, (Fearing you for 4 seconds IF they've been rooted by|r |T135848:0|t[Frost Nova]|cRXP_WARN_. Remember to|r |T135736:0|t[Blink] |cRXP_WARN_out of range of their cast if needed|r
    >>|cRXP_WARN_Avoid aggroing the |cRXP_ENEMY_Scarlets|r. If you do, run away|r
step
    .goto 1422/0,-1425.45,966.98
    >>Talk to |cRXP_FRIENDLY_Lightspark|r
    .vendor 10857 >> Vendor Trash (and all your food if you aren't playing this character at 60). Repair
    .target Argent Quartermaster Lightspark
step
    .goto 1422/0,-1450.39,934.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathaniel Dumah|r
    .turnin 6389 >>Turn in A Plague Upon Thee
    .target Nathaniel Dumah
    .isOnQuest 6389
step
    .goto 1422/0,-1654.21,1845.04,25,0
    .goto 1422/0,-1580.68,1866.54,25,0
    .goto 1422/0,-1600.03,1814.94,25,0
    .goto 1422/0,-1563.91,1758.75,25,0
    .goto 1422/0,-1511.88,1804.05,25,0
    .goto 1422/0,-1548.00,1837.87,25,0
    .goto 1422/0,-1566.92,1865.39,25,0
    .goto 1422/0,-1569.07,1892.91,25,0
    .goto 1422/0,-1520.05,1887.75,25,0
    .goto 1422/0,-1514.89,1851.63,25,0
    .goto 1422/0,-1544.99,1924.16,25,0
    .goto 1422/0,-1576.81,1948.24,25,0
    .goto 1422/0,-1597.02,1942.79,25,0
    .goto 1422/0,-1603.04,1918.71,25,0
    .goto 1422/0,-1614.65,1936.77,25,0
    .goto 1422/0,-1603.04,1918.71,25,0
    .goto 1422/0,-1597.02,1942.79,25,0
    .goto 1422/0,-1623.25,1953.11,25,0
    .goto 1422/0,-1637.01,1931.90,25,0
    .goto 1422/0,-1660.66,1916.13,25,0
    .goto 1422/0,-1649.48,1888.61,25,0
    .goto 1422/0,-1654.21,1845.04,25,0
    .xp 60 >>AoE |cRXP_ENEMY_Blighted Zombies|r, |cRXP_ENEMY_Rotting Cadavers|r, |cRXP_ENEMY_Skeletal Terrors|r, and the |cRXP_ENEMY_Wandering Skeleton|r to Level 60
    >>|cRXP_WARN_Be careful as |cRXP_ENEMY_Blighted Zombies|r cast|r |T135914:0|t[Volatile Infection] |cRXP_WARN_(deals 156 nature damage every 15 seconds, causing pushback, dispellable with|r |T135841:0|t[Ice Block]|cRXP_WARN_), and |cRXP_ENEMY_Skeletal Terrors|r cast|r |T136183:0|t[Fear]|cRXP_WARN_, (Fearing you for 4 seconds IF they've been rooted by|r |T135848:0|t[Frost Nova]|cRXP_WARN_. Remember to|r |T135736:0|t[Blink] |cRXP_WARN_out of range of their cast if needed|r
    >>|cRXP_WARN_Avoid aggroing the |cRXP_ENEMY_Scarlets|r. If you do, run away|r
step
    .goto 1422/0,-1431.04,971.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Argent Officer Pureheart|r
    .turnin 6028 >>Turn in The Everlook Report
    .target Argent Officer Pureheart
    .isOnQuest 6028
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
    +|cRXP_WARN_That is all of Western Plaguelands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Eastern Plaguelands|r: Little Pamela
    >>|cRXP_FRIENDLY_Stormwind City|r: Better Late Than Never
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Forging the Mightstone << Human Paladin/Dwarf Paladin
    >>|cRXP_FRIENDLY_Eastern Plaguelands and back here|r: A Plague Upon Thee
step
    .xp 55 >>|cRXP_WARN_The rest of Western Plaguelands is planned from level 55.|r Come back to this guide then
step
    .goto 1422/0,-1419.43,957.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Ashlam Valorfist|r
    .accept 5097 >>Accept All Along the Watchtowers
    .target Commander Ashlam Valorfist
step
    .goto 1422/0,-1305.48,1314.13
    >>Using the Beacon Torch, mark each tower in Andorhal; you will need to stand in the doorway of the tower to successfully mark it.
    .complete 5097,1 --Andorhal Tower One
    .target Andorhal Tower One
step
    .goto 1422/0,-1403.52,1467.79
    >>Using the Beacon Torch, mark each tower in Andorhal; you will need to stand in the doorway of the tower to successfully mark it.
    .complete 5097,2 --Andorhal Tower Two
    .target Andorhal Tower Two
step
    .goto 1422/0,-1431.04,944.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess MacDonnell|r
    .accept 5219 >>Accept Target: Dalson's Tears
    .target High Priestess MacDonnell
step
    .goto 1422/0,-1451.68,966.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Weldon Barov|r
    .accept 5344 >>Accept The Last Barov
    .target Weldon Barov
    .isQuestTurnedIn 5343 --any of: Barov Family Fortune
    .xp <52,1
step
    .goto 1422/0,-1566.06,1858.51
    >>Kill |cRXP_ENEMY_Cauldron Lord Malvinious|r and loot |cRXP_LOOT_Dalson's Tears Cauldron Key|r
    .complete 5219,1 --Dalson's Tears Cauldron Key (1)
    .mob Cauldron Lord Malvinious
step
    .goto 1422/0,-1569.07,1878.87
    >>Click the |cRXP_PICK_Scourge Cauldron|r
    .turnin 5219 >>Turn in Target: Dalson's Tears
    .accept 5220 >>Accept Return to Chillwind Camp
step
    .goto 1422/0,-1619.38,1943.94
    >>Click the |cRXP_PICK_Locked Cabinet|r
    .accept 5060 >>Accept Locked Away
step
    .goto 1422/0,-1431.04,944.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess MacDonnell|r
    .turnin 5220 >>Turn in Return to Chillwind Camp
    .accept 5222 >>Accept Target: Writhing Haunt
    .target High Priestess MacDonnell
step
    .goto 1422/0,-1587.99,1329.90
    >>Using the Beacon Torch, mark each tower in Andorhal; you will need to stand in the doorway of the tower to successfully mark it.
    .complete 5097,4 --Andorhal Tower Four
    .target Andorhal Tower Four
step
    .goto 1422/0,-1488.23,1553.50
    >>Using the Beacon Torch, mark each tower in Andorhal; you will need to stand in the doorway of the tower to successfully mark it.
    .complete 5097,3 --Andorhal Tower Three
    .target Andorhal Tower Three
step
    .goto 1422/0,-1857.17,1472.37
    >>Kill |cRXP_ENEMY_Cauldron Lord Razarch|r and loot |cRXP_LOOT_Writhing Haunt Cauldron Key|r
    .complete 5222,1 --Writhing Haunt Cauldron Key (1)
    .mob Cauldron Lord Razarch
step
    .goto 1422/0,-1863.19,1485.85
    >>Click the |cRXP_PICK_Scourge Cauldron|r
    .turnin 5222 >>Turn in Target: Writhing Haunt
    .accept 5223 >>Accept Return to Chillwind Camp
step
    .goto 1422/0,-1431.04,944.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess MacDonnell|r
    .turnin 5223 >>Turn in Return to Chillwind Camp
    .target High Priestess MacDonnell
step
    .goto 1422/0,-1419.43,957.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Ashlam Valorfist|r
    .turnin 5097 >>Turn in All Along the Watchtowers
    .accept 5533 >>Accept Scholomance
    .target Commander Ashlam Valorfist
step
    .goto 1422/0,-1417.71,965.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alchemist Arbington|r
    .turnin 5533 >>Turn in Scholomance
    .accept 5537 >>Accept Skeletal Fragments
    .target Alchemist Arbington
step
    #completewith Along17
    >>As you go: Kill |cRXP_ENEMY_Skeletal Flayers|r, |cRXP_ENEMY_Skeletal Sorcerers|r, |cRXP_ENEMY_Skeletal Terrors|r and |cRXP_ENEMY_Skeletal Executioners|r. Loot them for |cRXP_LOOT_Skeletal Fragments|r. |cRXP_WARN_Anything left is finished later|r
    .complete 5537,1 --Skeletal Fragments (15)
    .mob Skeletal Flayer
    .mob Skeletal Sorcerer
    .mob Skeletal Terror
    .mob Skeletal Executioner
step
    .goto 1422/0,-1657.22,1942.79
    >>Kill |cRXP_ENEMY_Farmer Dalson|r and loot |cRXP_LOOT_Dalson Cabinet Key|r
    .complete 5060,1 --Dalson Cabinet Key (1)
    .mob Farmer Dalson
step
    #label Along17
    .goto 1422/0,-1619.38,1943.94
    >>Click the |cRXP_PICK_Locked Cabinet|r
    .turnin 5060 >>Turn in Locked Away
step
    #loop
    .goto 1422/0,-1620.24,1938.49,0
    .goto 1422/0,-1620.24,1938.49,40,0
    .goto 1422/0,-1615.08,1949.96,40,0
    .goto 1422/0,-1566.06,1948.53,40,0
    .goto 1422/0,-1556.60,1918.14,40,0
    .goto 1422/0,-1520.05,1876.00,40,0
    .goto 1422/0,-1553.59,1885.46,40,0
    .goto 1422/0,-1585.41,1889.47,40,0
    .goto 1422/0,-1651.63,1898.93,40,0
    .goto 1422/0,-1643.46,1916.42,40,0
    >>Kill |cRXP_ENEMY_Skeletal Flayers|r, |cRXP_ENEMY_Skeletal Sorcerers|r, |cRXP_ENEMY_Skeletal Terrors|r and |cRXP_ENEMY_Skeletal Executioners|r. Loot them for |cRXP_LOOT_Skeletal Fragments|r
    .complete 5537,1 --Skeletal Fragments (15)
    .mob Skeletal Flayer
    .mob Skeletal Sorcerer
    .mob Skeletal Terror
    .mob Skeletal Executioner
step
    .goto 1422/0,-1893.72,1513.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mulgris Deepriver|r
    .accept 4985 >>Accept The Wildlife Suffers Too
    .target Mulgris Deepriver
step
    #loop
    .goto 1422/0,-2323.72,1940.50,0
    .goto 1422/0,-2323.72,1940.50,40,0
    .goto 1422/0,-2354.68,1998.98,40,0
    .goto 1422/0,-2315.98,2071.79,40,0
    .goto 1422/0,-2415.74,2104.76,40,0
    .goto 1422/0,-2509.48,2061.47,40,0
    .goto 1422/0,-2512.06,1977.19,40,0
    .goto 1422/0,-2432.08,1996.97,40,0
    .goto 1422/0,-2455.73,1935.05,40,0
    .goto 1422/0,-2391.23,1925.02,40,0
    >>Kill |cRXP_ENEMY_Diseased Grizzlies|r
    .complete 4985,1 --Diseased Grizzly slain (8)
    .mob Diseased Grizzly
step
    .goto 1422/0,-1450.39,934.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathaniel Dumah|r
    .turnin 5903 >>Turn in A Plague Upon Thee
    .target Nathaniel Dumah
    .isQuestComplete 5903
step
    .goto 1422/0,-1417.71,965.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alchemist Arbington|r
    .turnin 5537 >>Turn in Skeletal Fragments
    .target Alchemist Arbington
step
    .xp 55 >>Grind to level 55 (Mold Rhymes With... needs it)
step
    .goto 1422/0,-1417.71,965.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alchemist Arbington|r
    .accept 5538 >>Accept Mold Rhymes With...
    .target Alchemist Arbington
step
    .goto 1422/0,-1451.68,966.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Weldon Barov|r
    .turnin 5344 >>Turn in The Last Barov
    .target Weldon Barov
    .isQuestComplete 5344
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
    .goto 1422/0,-1767.30,1134.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Myranda the Hag|r
    .accept 5862 >>Accept Scarlet Subterfuge
    .target Myranda the Hag
    .isQuestTurnedIn 5861 --any of: Find Myranda
    .xp <52,1
step
    .goto 1422/0,-1893.72,1513.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mulgris Deepriver|r
    .turnin 4985 >>Turn in The Wildlife Suffers Too
    .accept 4986 >>Accept Glyphed Oaken Branch
    .target Mulgris Deepriver
step
    .goto 1422/0,-1815.89,2562.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kirsta Deepshadow|r
    .accept 6004 >>Accept Unfinished Business
    .target Kirsta Deepshadow
step
    .goto 1422/0,-1337.73,1878.29
    >>Kill |cRXP_ENEMY_Scarlet Medics|r
    >>Kill |cRXP_ENEMY_Scarlet Hunters|r
    .complete 6004,1 --Scarlet Medic slain (2)
    .complete 6004,2 --Scarlet Hunter slain (2)
    .mob Scarlet Medic
    .mob Scarlet Hunter
step
    #completewith Along30
    >>As you go: Kill |cRXP_ENEMY_Scarlet Knights|r. |cRXP_WARN_Anything left is finished later|r
    .complete 6004,4 --Scarlet Knight slain (2)
    .mob Scarlet Knight
step
    #label Along30
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
    .goto 1422/0,-1280.11,1452.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chromie|r
    .accept 5721 >>Accept The Battle of Darrowshire
    .target Chromie
    .isQuestTurnedIn 5941 --any of: Return to Chromie
    .xp <55,1
step
    .goto 1422/0,-1280.11,1452.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chromie|r
    .turnin 5153 >>Turn in A Strange Historian
    .target Chromie
    .isOnQuest 5153
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
step << Human Paladin/Dwarf Paladin
    .goto 1422/0,-1419.43,957.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Ashlam Valorfist|r
    .turnin 8418 >>Turn in Forging the Mightstone
    .target Commander Ashlam Valorfist
    .isQuestComplete 8418
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
    .goto 1422/0,-1903.18,2665.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lord Tirion Fordring|r
    .accept 5542 >>Accept Demon Dogs
    .accept 5543 >>Accept Blood Tinged Skies
    .accept 5544 >>Accept Carrion Grubbage
    .target Lord Tirion Fordring
step
    .goto 1422/0,-1390.19,2942.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Highlord Taelan Fordring|r
    .turnin 5862 >>Turn in Scarlet Subterfuge
    .target Highlord Taelan Fordring
    .isOnQuest 5862
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
    #completewith Along49
    >>As you go: Loot the |cRXP_PICK_Small Lockboxes|r for |cRXP_LOOT_Andorhal Watch|r. |cRXP_WARN_Anything left is finished later|r
    .complete 4972,1 --Andorhal Watch (5)
step
    #label Along49
    .goto 1422/0,-1280.11,1452.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chromie|r
    .accept 5210 >>Accept Brother Carlin
    .target Chromie
    .isQuestTurnedIn 5154 --any of: The Annals of Darrowshire
    .xp <50,1
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
    +|cRXP_WARN_That is all of Western Plaguelands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Darnassus|r: Glyphed Oaken Branch
    >>|cRXP_FRIENDLY_Eastern Plaguelands|r: Brother Carlin, Demon Dogs, Blood Tinged Skies, Carrion Grubbage, The Battle of Darrowshire
    >>|cRXP_FRIENDLY_Tanaris|r: Mold Rhymes With...
step
    .xp 58 >>|cRXP_WARN_The rest of Western Plaguelands is planned from level 58.|r Come back to this guide then
step
    .goto 1422/0,-1276.24,1452.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jeziba|r
    .accept 5164 >>Accept Catalogue of the Wayward
    .target Jeziba
    .isQuestTurnedIn 5162 --any of: Wrath of the Blue Flight
    .xp <57,1
step
    .goto 1422/0,-1275.38,1457.47
    >>Click the |cRXP_PICK_Catalogue of the Wayward|r
    .turnin 5164 >>Turn in Catalogue of the Wayward
    .isOnQuest 5164
step
    .goto 1422/0,-1275.38,1457.47
    >>Click the |cRXP_PICK_Catalogue of the Wayward|r
    .accept 5166 >>Accept Breastplate of the Chromatic Flight
    .accept 5167 >>Accept Legplates of the Chromatic Defier
    .isQuestTurnedIn 5164 --any of: Catalogue of the Wayward
    .xp <57,1
step
    .goto 1422/0,-1276.24,1452.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jeziba|r
    .turnin 5166 >>Turn in Breastplate of the Chromatic Flight
    .target Jeziba
    .isQuestComplete 5166
step
    .goto 1422/0,-1276.24,1452.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jeziba|r
    .turnin 5167 >>Turn in Legplates of the Chromatic Defier
    .target Jeziba
    .isQuestComplete 5167
step
    .goto 1422/0,-1638.73,1914.13
    >>Click the |cRXP_PICK_Mrs. Dalson's Diary|r
    .turnin 5058 >>Turn in Mrs. Dalson's Diary
    .isOnQuest 5058
step
    #loop
    .goto 1422/0,-1879.53,1549.20,0
    .goto 1422/0,-1879.53,1549.20,40,0
    .goto 1422/0,-1875.23,1500.47,40,0
    .goto 1422/0,-1870.93,1460.33,40,0
    .goto 1422/0,-1827.93,1460.33,40,0
    .goto 1422/0,-1557.03,1319.87,40,0
    .goto 1422/0,-1496.83,1311.27,40,0
    .goto 1422/0,-1462.43,1345.67,40,0
    .goto 1422/0,-1385.03,1345.67,40,0
    .goto 1422/0,-1445.23,1408.73,40,0
    >>Pick up |cRXP_PICK_Blood of Heroes|r from the ground
    .complete 5166,3 --Blood of Heroes (10)
    .isOnQuest 5166
step
    #loop
    .goto 1422/0,-1462.43,1345.67,0
    .goto 1422/0,-1462.43,1345.67,40,0
    .goto 1422/0,-1385.03,1345.67,40,0
    .goto 1422/0,-1445.23,1408.73,40,0
    .goto 1422/0,-1879.53,1549.20,40,0
    .goto 1422/0,-1875.23,1500.47,40,0
    .goto 1422/0,-1870.93,1460.33,40,0
    .goto 1422/0,-1827.93,1460.33,40,0
    .goto 1422/0,-1557.03,1319.87,40,0
    .goto 1422/0,-1496.83,1311.27,40,0
    >>Pick up |cRXP_PICK_Blood of Heroes|r from the ground
    .complete 5167,3 --Blood of Heroes (10)
    .isOnQuest 5167
step
    .goto 1422/0,-1431.04,944.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess MacDonnell|r
    .accept 5225 >>Accept Target: Gahrron's Withering
    .target High Priestess MacDonnell
step
    .goto 1422/0,-1419.43,957.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Ashlam Valorfist|r
    .accept 211 >>Accept Alas, Andorhal
    .target Commander Ashlam Valorfist
step
    .goto 1422/0,-1417.71,965.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alchemist Arbington|r
    .accept 5803 >>Accept Araj's Scarab
    .target Alchemist Arbington
    .isQuestTurnedIn 5801 --any of: Fire Plume Forged
    .xp <55,1
step
    .goto 1422/0,-1529.94,1382.65
    >>Open the |cRXP_PICK_Araj's Phylactery|r. Loot it for |cRXP_LOOT_Araj's Phylactery Shard|r
    .complete 211,1 --Araj's Phylactery Shard (1)
step
    .goto 1422/0,-1529.94,1382.65
    >>Open the |cRXP_PICK_Araj's Phylactery|r. Loot it for |cRXP_LOOT_Araj's Scarab|r
    .complete 5803,1 --Araj's Scarab (1)
    .isOnQuest 5803
step
    .goto 1422/0,-2257.07,1673.61
    >>Kill |cRXP_ENEMY_Cauldron Lord Soulwrath|r and loot |cRXP_LOOT_Gahrron's Withering Cauldron Key|r
    .complete 5225,1 --Gahrron's Withering Cauldron Key (1)
    .mob Cauldron Lord Soulwrath
step
    .goto 1422/0,-2272.55,1690.53
    >>Click the |cRXP_PICK_Scourge Cauldron|r
    .turnin 5225 >>Turn in Target: Gahrron's Withering
    .accept 5226 >>Accept Return to Chillwind Camp
step
    .goto 1422/0,-2617.84,1242.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Marduke|r
    .accept 5461 >>Accept The Human, Ras Frostwhisper
    .target Magistrate Marduke
    .isQuestTurnedIn 5384 --any of: Kirtonos the Herald
    .xp <57,1
step
    .goto 1422/0,-2617.84,1242.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Marduke|r
    .accept 5462 >>Accept The Dying, Ras Frostwhisper
    .target Magistrate Marduke
    .isQuestTurnedIn 5461 --any of: The Human, Ras Frostwhisper
    .xp <57,1
step
    .goto 1422/0,-2617.84,1242.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Marduke|r
    .turnin 5461 >>Turn in The Human, Ras Frostwhisper
    .target Magistrate Marduke
    .isQuestComplete 5461
step
    .goto 1422/0,-1450.39,934.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathaniel Dumah|r
    .turnin 5903 >>Turn in A Plague Upon Thee
    .target Nathaniel Dumah
    .isQuestComplete 5903
step
    .goto 1422/0,-1458.56,944.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Flint Shadowmore|r
    .accept 6186 >>Accept The Blightcaller Cometh
    .target Flint Shadowmore
    .isQuestTurnedIn 6185 --any of: The Eastern Plagues
    .xp <56,1
step << Mage/Hunter/Druid
    .goto 1422/0,-1617.23,2976.80
    >>|cRXP_WARN_Head to the top of the tower marked on your map. Look for a red book laying in a corner next to a bookshelf, it's guarded by a|r |cRXP_ENEMY_Scarlet Priest|r. |cRXP_WARN_Loot it for the rune of |r |T132849:0|t[Arcane Specialization]. |cRXP_WARN_You can skip this step if you don't feel like getting this rune|r
    .collect 226413,1
    .train 453702,1
step
    .goto 1422/0,-1431.04,944.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess MacDonnell|r
    .turnin 5226 >>Turn in Return to Chillwind Camp
    .target High Priestess MacDonnell
step
    .goto 1422/0,-1419.43,957.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Ashlam Valorfist|r
    .turnin 211 >>Turn in Alas, Andorhal
    .accept 5237 >>Accept Mission Accomplished!
    .turnin 5237 >>Turn in Mission Accomplished!
    .target Commander Ashlam Valorfist
step << Human Paladin/Dwarf Paladin
    .goto 1422/0,-1419.43,957.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Ashlam Valorfist|r
    .turnin 8418 >>Turn in Forging the Mightstone
    .target Commander Ashlam Valorfist
    .isQuestComplete 8418
step
    .goto 1422/0,-1417.71,965.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alchemist Arbington|r
    .turnin 5803 >>Turn in Araj's Scarab
    .target Alchemist Arbington
    .isOnQuest 5803
step
    .goto 1422/0,-1417.71,965.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alchemist Arbington|r
    .accept 5505 >>Accept The Key to Scholomance
    .target Alchemist Arbington
    .isQuestTurnedIn 5803 --any of: Araj's Scarab
    .xp <55,1
step
    .goto 1422/0,-1417.71,965.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alchemist Arbington|r
    .turnin 5505 >>Turn in The Key to Scholomance
    .target Alchemist Arbington
    .isOnQuest 5505
step
    +|cRXP_WARN_End of the Western Plaguelands route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Eastern Plaguelands|r: The Dying, Ras Frostwhisper
    >>|cRXP_FRIENDLY_Stormwind City|r: The Blightcaller Cometh
]])
