-- 1-15 Tirisfal Glades: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 2 parts with a level check between them (from level 1, 16).
-- Edit zones/Tirisfal Glades.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#name 1-15 Tirisfal Glades

step << Undead
    .goto 1420/0,1667.77,1679.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Undertaker Mordo|r
    .accept 363 >>Accept Rude Awakening
    .target Undertaker Mordo
step << Priest/Mage
    .goto 1420/0,1574.23,1866.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Joshua|r
    >>|cRXP_BUY_Buy|r |T132794:0|t[Refreshing Spring Water] |cRXP_BUY_from him|r
    .vendor >> Vendor Trash
    .collect 159,10,383,1
    .target Joshua Kien
step
    .goto 1420/0,1639.75,1843.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shadow Priest Sarvis|r
    .turnin 363 >>Turn in Rude Awakening << Undead
    .accept 364 >>Accept The Mindless Ones
    .target Shadow Priest Sarvis
step << Mage
    .goto 1420/0,1635.23,1847.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Isabella|r
    .train 1459 >> Train |T135932:0|t[Arcane Intellect]
    .target Isabella
step << Warlock
    .goto 1420/0,1641.11,1836.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kayla|r
    .vendor >>Vendor Trash
    .target Kayla Smithe
    .money >0.1
step << Warlock
    .goto 1420/0,1636.59,1839.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maximillion|r
    .train 348 >>Train |T135817:0|t[Immolate]
    .target Maximillion
step << Warrior
    .goto 1420/0,1556.61,1862.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dannal|r
    .train 6673 >>Train |T132333:0|t[Battle Shout]
    .target Dannal Stern
step << Warlock
    .goto 1420/0,1633.42,1836.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Venya Marthand|r
    .accept 1470 >>Accept Piercing the Veil
    .target Venya Marthand
step << Warlock
    #loop
    .goto 1420/0,1543.05,1939.62,0
    .goto 1420/0,1543.05,1939.62,40,0
    .goto 1420/0,1578.30,1977.58,40,0
    .goto 1420/0,1631.62,2005.90,40,0
    .goto 1420/0,1577.84,2052.59,40,0
    .goto 1420/0,1531.30,2025.78,40,0
    .goto 1420/0,1503.74,2006.50,40,0
    .goto 1420/0,1529.04,1979.99,40,0
    .goto 1420/0,1484.76,1943.24,40,0
    .goto 1420/0,1467.59,1898.05,40,0
    >>Kill |cRXP_ENEMY_Rattlecage Skeletons|r. Loot them for |cRXP_LOOT_Rattlecage Skull|r
    .complete 1470,1 --Rattlecage Skull (3)
    .mob Rattlecage Skeleton
step << Warlock
    .goto 1420/0,1633.42,1836.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Venya Marthand|r
    .turnin 1470 >>Turn in Piercing the Veil
    .target Venya Marthand
step
    #loop
    .goto 1420/0,1662.80,1930.29,0
    .goto 1420/0,1662.80,1930.29,40,0
    .goto 1420/0,1641.56,1983.31,40,0
    .goto 1420/0,1581.91,2013.73,40,0
    .goto 1420/0,1477.98,2008.61,40,0
    .goto 1420/0,1455.39,1945.65,40,0
    .goto 1420/0,1455.39,1886.91,40,0
    .goto 1420/0,1528.14,1858.29,40,0
    .goto 1420/0,1516.84,1913.11,40,0
    .goto 1420/0,1562.93,1940.83,40,0
    >>Kill |cRXP_ENEMY_Mindless Zombies|r
    >>Kill |cRXP_ENEMY_Wretched Zombies|r
    .complete 364,1 --Mindless Zombie slain (8)
    .complete 364,2 --Wretched Zombie slain (8)
    .mob Mindless Zombie
    .mob Wretched Zombie
step << Mage/Warlock/Priest
    .goto 1420/0,1576.94,1861.6,8,0
    .goto 1420/0,1574.23,1866.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Joshua|r
    >>|cRXP_BUY_Buy|r |T132794:0|t[Refreshing Spring Water] |cRXP_BUY_from him|r
    .collect 159,10,383,1
    .vendor >> Vendor Trash
    .target Joshua Kien
    .isOnQuest 364
    .money <0.0050
step << Mage/Warlock/Priest
    .goto 1420/0,1576.94,1861.6,8,0
    .goto 1420/0,1574.23,1866.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Joshua|r
    >>|cRXP_BUY_Buy|r |T132794:0|t[Refreshing Spring Water] |cRXP_BUY_from him|r
    .collect 159,5,383,1
    .vendor >> Vendor Trash
    .target Joshua Kien
    .isOnQuest 364
    .money >0.0050
step
    .goto 1420/0,1639.75,1843.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shadow Priest Sarvis|r
    .turnin 364 >>Turn in The Mindless Ones
    .accept 3095 >>Accept Simple Scroll << Undead Warrior
    .accept 98601 >>Accept A Difficult Path << Undead Paladin
    .accept 3096 >>Accept Encrypted Scroll << Undead Rogue
    .accept 3097 >>Accept Hallowed Scroll << Undead Priest
    .accept 3098 >>Accept Glyphic Scroll << Undead Mage
    .accept 3099 >>Accept Tainted Scroll << Undead Warlock
    .accept 3901 >>Accept Rattling the Rattlecages
    .target Shadow Priest Sarvis
step << Undead Rogue
    .goto 1420/0,1563.38,1859.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_David Trias|r
    .turnin 3096 >>Turn in Encrypted Scroll while you are here
    .isQuestComplete 3096
    .target David Trias
step << Undead Warrior
    .goto 1420/0,1556.15,1862.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dannal Stern|r
    .turnin 3095 >>Turn in Simple Scroll while you are here
    .isQuestComplete 3095
    .target Dannal Stern
step
    .goto 1420/0,1638.85,1847.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Novice Elreth|r
    .accept 376 >>Accept The Damned
    .target Novice Elreth
step
    #completewith Along12
    >>As you go: Kill |cRXP_ENEMY_Duskbats|r and |cRXP_ENEMY_Mangy Duskbats|r. Loot them for |cRXP_LOOT_Duskbat Wing|r. |cRXP_WARN_Anything left is finished later|r
    .complete 376,2 --Duskbat Wing (6)
    .mob Duskbat
    .mob Mangy Duskbat
step << Undead Paladin
    .goto 1420/0,1630.71,1835.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aramis Hammerhand|r
    .turnin 98601 >>Turn in A Difficult Path
    .accept 90902 >>Accept Rediscovering the Light
    .target Aramis Hammerhand
step << Undead Priest
    .goto 1420/0,1627.55,1848.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dark Cleric Duesten|r
    .turnin 3097 >>Turn in Hallowed Scroll
    .target Dark Cleric Duesten
step << Undead Mage
    .goto 1420/0,1635.68,1847.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Isabella|r
    .turnin 3098 >>Turn in Glyphic Scroll
    .target Isabella
step << Undead Warlock
    .goto 1420/0,1636.59,1839.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maximillion|r
    .turnin 3099 >>Turn in Tainted Scroll
    .target Maximillion
step
    #completewith Along12
    >>As you go: Kill |cRXP_ENEMY_Rattlecage Skeletons|r. |cRXP_WARN_Anything left is finished later|r
    .complete 3901,1 --Rattlecage Skeleton slain (12)
    .mob Rattlecage Skeleton
step
    #label Along12
    #loop
    .goto 1420/0,1673.64,1942.03,0
    .goto 1420/0,1673.64,1942.03,40,0
    .goto 1420/0,1701.66,1973.36,40,0
    .goto 1420/0,1630.71,2162.25,40,0
    .goto 1420/0,1587.33,2104.41,40,0
    .goto 1420/0,1612.64,2077.30,40,0
    .goto 1420/0,1591.85,2041.15,40,0
    .goto 1420/0,1642.91,2006.50,40,0
    .goto 1420/0,1636.59,1965.23,40,0
    >>Kill |cRXP_ENEMY_Young Scavengers|r and |cRXP_ENEMY_Ragged Scavengers|r. Loot them for |cRXP_LOOT_Scavenger Paw|r
    .complete 376,1 --Scavenger Paw (6)
    .mob Young Scavenger
    .mob Ragged Scavenger
step
    #loop
    .goto 1420/0,1702.11,1998.67,0
    .goto 1420/0,1702.11,1998.67,40,0
    .goto 1420/0,1691.26,1907.39,40,0
    .goto 1420/0,1669.12,1863.41,40,0
    .goto 1420/0,1646.98,1750.14,40,0
    .goto 1420/0,1706.18,1654.04,40,0
    .goto 1420/0,1740.52,1756.77,40,0
    .goto 1420/0,1774.86,1806.47,40,0
    .goto 1420/0,1716.57,1827.86,40,0
    .goto 1420/0,1778.02,1922.75,40,0
    >>Kill |cRXP_ENEMY_Duskbats|r and |cRXP_ENEMY_Mangy Duskbats|r. Loot them for |cRXP_LOOT_Duskbat Wing|r
    .complete 376,2 --Duskbat Wing (6)
    .mob Duskbat
    .mob Mangy Duskbat
step
    .goto 1420/0,1638.85,1847.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Novice Elreth|r
    .turnin 376 >>Turn in The Damned while you are here
    .isQuestComplete 376
    .target Novice Elreth
step
    #loop
    .goto 1420/0,1668.22,1889.92,0
    .goto 1420/0,1668.22,1889.92,40,0
    .goto 1420/0,1621.68,1789.30,40,0
    .goto 1420/0,1582.36,1846.84,40,0
    .goto 1420/0,1514.13,1830.87,40,0
    .goto 1420/0,1467.59,1898.05,40,0
    .goto 1420/0,1557.51,1925.77,40,0
    .goto 1420/0,1503.74,2006.50,40,0
    .goto 1420/0,1577.84,2052.59,40,0
    .goto 1420/0,1631.62,2005.90,40,0
    >>Kill |cRXP_ENEMY_Rattlecage Skeletons|r
    >>Cast |T135920:0|t[Holy Light] on |cRXP_FRIENDLY_Injured Deathguards|r around Deathknell << Undead Paladin
    .complete 3901,1 --Rattlecage Skeleton slain (12)
    .complete 90902,1 << Undead Paladin --Injured Deathguard healed (5)
    .mob Rattlecage Skeleton
    .target Injured Deathguard << Undead Paladin
step
    .goto 1420/0,1595.47,1985.41,30,0
    .goto 1420/0,1627.55,2008.61,30,0
    .goto 1420/0,1584.17,2024.88,30,0
    .goto 1420/0,1575.58,2053.8,30,0
    .goto 1420/0,1529.49,2044.16,30,0
    .goto 1420/0,1512.32,2007.1,30,0
    .goto 1420/0,1499.67,1975.47,30,0
    .goto 1420/0,1487.47,1938.12,30,0
    .goto 1420/0,1541.69,1939.32,30,0
    .xp 3+895 >>Grind to 895+/1400xp << Paladin
    .xp 3+940 >>Grind to 940+/1400xp << Warrior/Rogue
    .xp 3+980 >>Grind to 980+/1400xp << !Warrior !Rogue !Paladin
step << Mage/Warlock/Priest/Paladin
    .goto 1420/0,1576.04,1861.60,8,0
    .goto 1420/0,1574.23,1866.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Joshua|r
    >>|cRXP_BUY_Buy|r |T132794:0|t[Refreshing Spring Water] |cRXP_BUY_from him|r << !Paladin
    >>|cRXP_WARN_Do NOT go below 1 Silver|r << Mage/Warlock/Priest
    .vendor >> Vendor Trash
    .target Joshua Kien
    .money >0.1
    .isOnQuest 3901
step << Undead Paladin
    .goto 1420/0,1630.71,1835.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aramis Hammerhand|r
    .turnin 90902 >>Turn in Rediscovering the Light while you are here
    .isQuestComplete 90902
    .target Aramis Hammerhand
step
    .goto 1420/0,1639.75,1843.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shadow Priest Sarvis|r
    .turnin 3901 >>Turn in Rattling the Rattlecages
    .target Shadow Priest Sarvis
step
    .goto 1420/0,1638.85,1847.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Novice Elreth|r
    .turnin 376 >>Turn in The Damned
    .accept 6395 >>Accept Marla's Last Wish
    .target Novice Elreth
step << Paladin
    .goto 1420/0,1568.35,1859.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archibald|r
    .vendor >> Vendor Trash
    .target Archibald Kava
    .money >0.1
    .isOnQuest 90902
step
    .goto 1420/0,1630.71,1835.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aramis Hammerhand|r
    .turnin 90902 >>Turn in Rediscovering the Light << Undead Paladin
    .accept 91208 >>Accept Coming to Terms << Undead Paladin
    .accept 91209 >>Accept Continue Your Training << Undead Paladin
    .accept 98389 >>Accept A Light in the Darkness
    .target Aramis Hammerhand
step << Paladin
    .goto 1420/0,1628.300,1837.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aramis Hammerhand|r
    .train 20271 >>Train |T135959:0|t[Judgement]
    .train 19740 >>Train |T135906:0|t[Blessing of Might]
    .target Aramis Hammerhand
    .money <0.02
step << Paladin
    .goto 1420/0,1628.300,1837.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aramis Hammerhand|r
    .train 20271 >>Train |T135959:0|t[Judgement]
    .target Aramis Hammerhand
    .money <0.01
step << Priest
    .goto 1420/0,1627.55,1848.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duesten|r
    .train 589 >> Train your class spells
    .target Dark Cleric Duesten
    .money <0.021
step << Priest
    .goto 1420/0,1627.55,1848.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duesten|r
    .train 2052 >> Train |T135929:0|t[Lesser Heal Rank 2]
    .train 589 >> Train |T136207:0|t[Shadow Word: Pain]
    .target Dark Cleric Duesten
    .money <0.02
step << Priest
    .goto 1420/0,1627.55,1848.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duesten|r
    .train 1243 >> Train |T135987:0|t[Power Word: Fortitude]
    .train 589 >> Train |T136207:0|t[Shadow Word: Pain]
    .target Dark Cleric Duesten
    .money <0.011
step << Priest
    .goto 1420/0,1627.55,1848.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duesten|r
    .train 589 >> Train |T136207:0|t[Shadow Word: Pain]
    .target Dark Cleric Duesten
    .money <0.01
step << Warlock
    .goto 1420/0,1636.59,1839.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maximillion|r
    .train 172 >> Train |T136118:0|t[Corruption]
    .target Maximillion
step << Mage
    .goto 1420/0,1635.23,1847.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Isabella|r
    .train 116 >> Train |T135846:0|t[Frostbolt]
    .target Isabella
step
    .goto 1420/0,1604.96,1861.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Saltain|r
    .accept 3902 >>Accept Scavenging Deathknell
    .target Deathguard Saltain
step
    #completewith Along19
    >>As you go: Loot the |cRXP_PICK_Equipment Boxes|r for |cRXP_LOOT_Scavenged Goods|r. |cRXP_WARN_Anything left is finished later|r
    .complete 3902,1 --Scavenged Goods (6)
step
    #label Along19
    .goto 1420/0,1580.56,1848.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Arren|r
    .accept 380 >>Accept Night Web's Hollow
    .target Executor Arren
step << Rogue/Warrior/Paladin
    .goto 1420/0,1568.35,1859.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archibald|r
    .vendor >> Vendor Trash
    .target Archibald Kava
    .money >0.1
    .isOnQuest 3095 << Warrior
    .isOnQuest 3096 << Rogue
step << Undead Warrior
    .goto 1420/0,1556.15,1862.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dannal Stern|r
    .turnin 3095 >>Turn in Simple Scroll
    .target Dannal Stern
step << Warrior
    .goto 1420/0,1556.61,1862.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dannal|r
    .train 100 >> Train |T132337:0|t[Charge]
    .train 772 >> Train |T132155:0|t[Rend]
    .target Dannal Stern
    .money <0.02
step << Warrior
    .goto 1420/0,1556.61,1862.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dannal|r
    .train 772 >> Train |T132155:0|t[Rend]
    .target Dannal Stern
    .money <0.01
step << Undead Rogue
    .goto 1420/0,1563.38,1859.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_David Trias|r
    .turnin 3096 >>Turn in Encrypted Scroll
    .target David Trias
step << Rogue/Warrior/Paladin
    .goto 1420/0,1577.100,1854.600
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Walter Mason|r upstairs
    >>|cRXP_BUY_Buy a|r |T134708:0|t[Mining Pick] |cRXP_BUY_from|r |cRXP_BUY_him|r
    .train 2575 >> Train |T136248:0|t[Mining]
    .collect 2901,1,792,1
    >>|cRXP_WARN_This will allow you to find|r |T135232:0|t|cRXP_LOOT_[Rough Stones]|r |cRXP_WARN_from nodes in order to craft|r |T135248:0|t[Sharpening Stones] |cRXP_WARN_(+2 Weapon Damage for 30 minutes)|r
    .target Walter Mason
step
    #loop
    .goto 1420/0,1535.82,1858.59,0
    .goto 1420/0,1535.82,1858.59,40,0
    .goto 1420/0,1516.84,1848.65,40,0
    .goto 1420/0,1487.92,1903.17,40,0
    .goto 1420/0,1492.44,1912.51,40,0
    .goto 1420/0,1552.09,1991.44,40,0
    .goto 1420/0,1593.21,1985.11,40,0
    .goto 1420/0,1598.63,1971.26,40,0
    .goto 1420/0,1562.93,1899.26,40,0
    .goto 1420/0,1548.02,1891.42,40,0
    >>Loot the |cRXP_PICK_Equipment Boxes|r for |cRXP_LOOT_Scavenged Goods|r
    .complete 3902,1 --Scavenged Goods (6)
step
    .goto 1420/0,1604.96,1861.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Saltain|r
    .turnin 3902 >>Turn in Scavenging Deathknell while you are here
    .isQuestComplete 3902
    .target Deathguard Saltain
step << Undead Paladin
    #loop
    .goto 1420/0,1710.70,1885.70,0
    .goto 1420/0,1710.70,1885.70,40,0
    .goto 1420/0,1746.39,1906.79,40,0
    .goto 1420/0,1768.99,1903.17,40,0
    .goto 1420/0,1767.63,1939.32,40,0
    .goto 1420/0,1747.75,1958.60,40,0
    .goto 1420/0,1749.10,1938.12,40,0
    >>Talk to the |cRXP_FRIENDLY_Frightened Paladin|r, then kill her when she turns hostile
    .complete 91208,1 --Offer aid to the Frightened Paladin
    .skipgossip
    .mob Frightened Paladin
step
    #completewith Along24
    >>As you go: Attack the |cRXP_ENEMY_Webbed Forsaken|r cocoons inside Night Web's Hollow to free them. |cRXP_WARN_Anything left is finished later|r
    .complete 98389,1 --Webbed Forsaken freed (6)
    .mob Webbed Forsaken
step
    #label Along24
    #loop
    .goto 1420/0,1770.79,2016.14,0
    .goto 1420/0,1770.79,2016.14,40,0
    .goto 1420/0,1704.82,2047.47,40,0
    .goto 1420/0,1651.95,2136.34,40,0
    .goto 1420/0,1707.08,2162.55,40,0
    .goto 1420/0,1773.05,2175.50,40,0
    .goto 1420/0,1811.01,2131.52,40,0
    .goto 1420/0,1753.62,2107.42,40,0
    .goto 1420/0,1745.49,2057.71,40,0
    .goto 1420/0,1808.75,2054.70,40,0
    >>Kill |cRXP_ENEMY_Young Night Web Spiders|r
    .complete 380,1 --Young Night Web Spider slain (10)
    .mob Young Night Web Spider
step
    #loop
    .goto 1420/0,1798.81,2055.00,0
    .goto 1420/0,1798.81,2055.00,40,0
    .goto 1420/0,1847.16,2040.24,40,0
    .goto 1420/0,1910.88,2020.06,40,0
    .goto 1420/0,1927.14,2010.72,40,0
    .goto 1420/0,1950.19,2011.62,40,0
    .goto 1420/0,1982.27,2031.81,40,0
    .goto 1420/0,1946.12,2087.24,40,0
    .goto 1420/0,1905.00,2053.50,40,0
    .goto 1420/0,1875.63,2046.87,40,0
    >>Kill |cRXP_ENEMY_Night Web Spiders|r
    >>Attack the |cRXP_ENEMY_Webbed Forsaken|r cocoons inside Night Web's Hollow to free them
    .complete 380,2 --Night Web Spider slain (8)
    .complete 98389,1 --Webbed Forsaken freed (6)
    .mob Night Web Spider
    .mob Webbed Forsaken
step
    .goto 1420/0,1604.96,1861.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Saltain|r
    .turnin 3902 >>Turn in Scavenging Deathknell
    .target Deathguard Saltain
step
    .goto 1420/0,1580.56,1848.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Arren|r
    .turnin 380 >>Turn in Night Web's Hollow
    .accept 381 >>Accept The Scarlet Crusade
    .target Executor Arren
step
    .goto 1420/0,1630.71,1835.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aramis Hammerhand|r
    .turnin 91208 >>Turn in Coming to Terms << Undead Paladin
    .turnin 98389 >>Turn in A Light in the Darkness
    .target Aramis Hammerhand
step << Rogue/Warrior/Paladin
    .goto 1420/0,1568.35,1859.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archibald|r
    .vendor >> Vendor Trash
    .target Archibald Kava
    .isOnQuest 6395
step << Warlock/Mage/Priest
    .goto 1420/0,1574.23,1866.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Joshua|r
    >>|cRXP_BUY_Buy|r |T132794:0|t[Refreshing Spring Water] |cRXP_BUY_from him|r
    .collect 159,15,383,1 << Warlock/Mage/Priest
    .vendor >> Vendor Trash
    .target Joshua Kien
    .isOnQuest 6395
step
    #loop
    .goto 1420/0,1395.29,1814.30,0
    .goto 1420/0,1395.29,1814.30,40,0
    .goto 1420/0,1379.92,1861.90,40,0
    .goto 1420/0,1375.86,1983.00,40,0
    .goto 1420/0,1285.93,1877.57,40,0
    .goto 1420/0,1285.03,1814.61,40,0
    .goto 1420/0,1282.77,1747.43,40,0
    .goto 1420/0,1330.67,1678.74,40,0
    .goto 1420/0,1385.35,1745.92,40,0
    .goto 1420/0,1335.19,1789.60,40,0
    >>Kill |cRXP_ENEMY_Scarlet Converts|r, |cRXP_ENEMY_Scarlet Initiates|r and |cRXP_ENEMY_Meven Korgals|r. Loot them for |cRXP_LOOT_Scarlet Armband|r
    >>Kill |cRXP_ENEMY_Samuel Fipps|r. Loot him for |cRXP_LOOT_Samuel's Remains|r
    .complete 381,1 --Scarlet Armband (12)
    .collect 16333,1,6395,1 --Samuel's Remains (1)
    .mob Scarlet Convert
    .mob Scarlet Initiate
    .mob Meven Korgal
    .mob Samuel Fipps
step
    .goto 1420/0,1624.84,1876.96
    >>Click |cRXP_PICK_Marla's Grave|r in the Deathknell graveyard
    .complete 6395,1 --Samuel's Remains Buried (1)
step
    .goto 1420/0,1580.56,1848.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Arren|r
    .turnin 381 >>Turn in The Scarlet Crusade while you are here
    .isQuestComplete 381
    .target Executor Arren
step
    .goto 1420/0,1638.85,1847.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Novice Elreth|r
    .turnin 6395 >>Turn in Marla's Last Wish
    .target Novice Elreth
step << Undead Priest
    .goto 1420/0,1627.55,1848.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dark Cleric Duesten|r
    .accept 5651 >>Accept In Favor of Darkness
    .target Dark Cleric Duesten
step
    .goto 1420/0,1580.56,1848.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Arren|r
    .turnin 381 >>Turn in The Scarlet Crusade
    .accept 382 >>Accept The Red Messenger
    .target Executor Arren
step
    .goto 1420/0,1568.35,1859.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archibald|r
    .vendor >> Vendor Trash
    .target Archibald Kava
step
    .goto 1420/0,1380.83,1772.73
    >>Kill |cRXP_ENEMY_Meven Korgal|r and loot |cRXP_LOOT_Scarlet Crusade Documents|r
    .complete 382,1 --Scarlet Crusade Documents (1)
    .mob Meven Korgal
step
    .goto 1420/0,1580.56,1848.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Arren|r
    .turnin 382 >>Turn in The Red Messenger
    .accept 383 >>Accept Vital Intelligence
    .accept 96656 >>Accept The Adventurer
    .target Executor Arren
step
    .goto 1420/0,1493.34,2044.76,50,0
    .goto 1420/0,1436.41,2133.93,50,0
    .goto 1420/0,1369.08,2124.89,50,0
    .goto 1420/0,1327.05,2048.68,50,0
    .goto 1420/0,1338.35,1939.93,50,0
    .goto 1420/0,1400.71,1766.71,50,0
    .goto 1420/0,1385.80,1744.11,50,0
    .goto 1420/0,1368.17,1728.15,50,0
    .goto 1420/0,1342.42,1741.40,50,0
    .goto 1420/0,1313.95,1735.08,50,0
    .goto 1420/0,1320.28,1752.25,50,0
    .goto 1420/0,1314.85,1765.80,50,0
    .goto 1420/0,1294.07,1780.56,50,0
    .goto 1420/0,1283.67,1817.02,50,0
    .goto 1420/0,1289.55,1841.72,50,0
    .goto 1420/0,1286.84,1877.27,50,0
    .goto 1420/0,1333.38,1868.53,50,0
    .goto 1420/0,1364.56,1867.93,50,0
    .goto 1420/0,1383.54,1866.72,50,0
    .goto 1420/0,1368.17,1831.48,50,0
    .goto 1420/0,1341.06,1790.51,50,0
    .goto 1420/0,1364.56,1784.18,50,0
    .goto 1420/0,1400.71,1766.71,50,0
    .xp 5+1940 >>Grind to 1940+/2800xp << !Paladin
    .xp 5+1850 >>Grind to 1850+/2800xp << Paladin
step
    .goto 1420/0,1305.82,2126.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Calvin Montague|r
    .accept 8 >>Accept A Rogue's Deal
    .target Calvin Montague
step
    .goto 1420/0,1184.71,2205.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Simmer|r
    .accept 365 >>Accept Fields of Grief
    .target Deathguard Simmer
step
    #loop
    .goto 1420/0,1189.68,2195.69,0
    .goto 1420/0,1189.68,2195.69,40,0
    .goto 1420/0,1175.68,2183.64,40,0
    .goto 1420/0,1087.56,2189.96,40,0
    .goto 1420/0,987.70,2135.14,40,0
    .goto 1420/0,884.22,2107.72,40,0
    .goto 1420/0,744.13,2106.82,40,0
    .goto 1420/0,688.10,2174.30,40,0
    .goto 1420/0,620.77,2225.51,40,0
    .goto 1420/0,496.96,2255.94,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gordo|r. |cRXP_WARN_This NPC walks a patrol route|r
    .accept 5481 >>Accept Gordo's Task
    .unitscan Gordo
step << Priest
    .goto 1420/0,656.92,2164.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bowen|r
    .train 3908 >> Train |T136249:0|t[Tailoring]. Save up your |T132889:0|t[Linen Cloth]. This will allow you to create a wand later
    .target Bowen Brisboise
step
    #loop
    .goto 1420/0,391.22,2289.38,0
    .goto 1420/0,391.22,2289.38,40,0
    .goto 1420/0,398.00,2315.58,40,0
    .goto 1420/0,388.96,2343.00,40,0
    .goto 1420/0,395.74,2396.62,40,0
    .goto 1420/0,328.41,2348.42,40,0
    .goto 1420/0,308.98,2372.82,40,0
    .goto 1420/0,333.38,2416.20,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Bartholomew|r. |cRXP_WARN_This NPC walks a patrol route|r
    .accept 86784 >>Accept Sticks and Bones
    .unitscan Deathguard Bartholomew
step << Undead Paladin
    .goto 1420/0,310.79,2252.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shari Stilwell|r
    .turnin 91209 >>Turn in Continue Your Training while you are here
    .isQuestComplete 91209
    .target Shari Stilwell
step
    #completewith Along40
    >>As you go: Pick up |cRXP_PICK_Dry Branch|r from the ground. |cRXP_WARN_Anything left is finished later|r
    .complete 86784,1 --Dry Branch (6)
step
    #label Along40
    .goto 1420/0,403.42,2287.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Dillinger|r
    .accept 404 >>Accept A Putrid Task
    .target Deathguard Dillinger
step
    #completewith Along44
    >>As you go: Pick up |cRXP_PICK_Gloom Weed|r from the ground. |cRXP_WARN_Anything left is finished later|r
    .complete 5481,1 --Gloom Weed (3)
step
    #completewith Along41
    >>As you go: Kill |cRXP_ENEMY_Rotting Dead|r and |cRXP_ENEMY_Ravaged Corpses|r. Loot them for |cRXP_LOOT_Putrid Claw|r. |cRXP_WARN_Anything left is finished later|r
    .complete 404,1 --Putrid Claw (7)
    .mob Rotting Dead
    .mob Ravaged Corpse
step
    #label Along41
    #loop
    .goto 1420/0,426.01,2295.10,0
    .goto 1420/0,426.01,2295.10,40,0
    .goto 1420/0,480.24,2313.17,40,0
    .goto 1420/0,602.25,2283.05,40,0
    .goto 1420/0,570.61,2228.82,40,0
    .goto 1420/0,543.50,2159.54,40,0
    .goto 1420/0,507.35,2271.00,40,0
    .goto 1420/0,457.65,2255.94,40,0
    .goto 1420/0,371.79,2246.90,40,0
    .goto 1420/0,317.56,2283.05,40,0
    >>Pick up |cRXP_PICK_Dry Branch|r from the ground
    .complete 86784,1 --Dry Branch (6)
step
    .goto 1420/0,447.25,2166.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eleanor Shackleton|r
    .turnin 86784 >>Turn in Sticks and Bones
    .turnin 96656 >>Turn in The Adventurer
    .accept 96607 >>Accept The Great Outdoors
    .target Eleanor Shackleton
step
    .goto 1420/0,447.25,2166.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eleanor Shackleton|r
    .turnin 96607 >>Turn in The Great Outdoors
    .target Eleanor Shackleton
    .isQuestComplete 96607
step
    #label Along44
    .goto 1420/0,447.25,2166.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eleanor Shackleton|r
    .accept 96658 >>Accept Camping 101: Cooking
    .target Eleanor Shackleton
    .isQuestTurnedIn 95998,96101,96604,96605,96606,96607,96608 --any of: The Great Outdoors, The Great Outdoors, The Great Outdoors, The Great Outdoors, The Great Outdoors, The Great Outdoors, The Great Outdoors
    .xp <4,1
step
    .goto 1420/0,295.42,2278.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Zygand|r
    .turnin 383 >>Turn in Vital Intelligence
    .accept 427 >>Accept At War With The Scarlet Crusade
    .accept 99141 >>Accept Patience
    .accept 99134 >>Accept Discipline
    .target Executor Zygand
step << Rogue
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Oliver|r
    .vendor >> Vendor trash. Sell your weapon if it gives you enough money for a |T135641:0|t[Stiletto] (3s 81c). You'll come back later if you don't have enough yet
    .target Oliver Dwor
step << Warrior
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Oliver|r
    .vendor >> Vendor trash. Sell your weapon if it gives you enough money for a |T135321:0|t[Gladius] (5s 10c). You'll come back later if you don't have enough yet
    .target Oliver Dwor
step << Undead Paladin
    .goto 1420/0,310.79,2252.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shari Stilwell|r
    .complete 91209,1 --Report to Shari Stilwell in Brill
    .turnin 91209 >>Turn in Continue Your Training
    .target Shari Stilwell
step << Paladin
    .goto 1420/0,311.600,2250.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shari Stilwell|r
    .train 679 >>Train |T626003:0|t[Holy Strike]
    .target Shari Stilwell
    .xp <6,1
step << Paladin
    .goto 1420/0,316.66,2227.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Oliver|r
    .vendor >> Vendor trash. Sell your weapon if it gives you enough money for a |T133053:0|t[Wooden Mallet] (6s 66c). You'll come back later if you don't have enough yet
    .target Oliver Dwor
step
    .goto 1420/0,346.94,2258.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Johaan|r
    .accept 367 >>Accept A New Plague
    .target Apothecary Johaan
    .xp <6,1
step
    .goto 1420/0,244.36,2269.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Renee|r
    .turnin 8 >>Turn in A Rogue's Deal
    .target Innkeeper Renee
    .home >>Set your Hearthstone to Brill
step << Undead Priest
    .goto 1420/0,251.14,2265.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dark Cleric Beryl|r
    .turnin 5651 >>Turn in In Favor of Darkness
    .accept 5650 >>Accept Garments of Darkness
    .target Dark Cleric Beryl
step << Priest
    .goto 1420/0,251.14,2265.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Beryl|r on the second floor
    .train 591 >>Train |T135924:0|t[Smite]
    .train 17 >>Train |T135940:0|t[Power Word: Shield]
    .train 2052 >>Train |T135929:0|t[Lesser Heal Rank 2]
    .target Dark Cleric Beryl
step << Mage
    .goto 1420/0,233.06,2256.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cain|r on the second floor
    .train 143 >> Train |T135812:0|t[Fireball]
    .train 2136 >>Train |T135807:0|t[Fire Blast]
    .target Cain Firesong
step << Warrior
    .goto 1420/0,238.49,2255.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Austil|r
    .train 3127 >>Train |T132269:0|t[Parry]
    .target Austil de Mon
    .money <0.01
step << Rogue
    .goto 1420/0,243.01,2271.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marion|r on the second floor
    .train 1757 >> Train |T136189:0|t[Sinister Strike]
    .target Marion Call
    .money <0.01
step << Warlock
    .goto 1420/0,251.59,2252.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gina Lang|r on the second floor
    >>|cRXP_BUY_Buy the|r |T133738:0|t[Grimoire of Blood Pact] |cRXP_BUY_from her|r
    .collect 16321,1,404,1
    .vendor >>Vendor Trash
    .target Gina Lang
    .train 6307,1
step << Warlock
    .goto 1420/0,250.24,2259.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rupert|r
    .train 695 >> Train |T136197:0|t[Shadow Bolt]
    .train 1454 >> Train |T136126:0|t[Life Tap]
    .target Rupert Boch
    .money <0.02
step << Warlock
    .goto 1420/0,250.24,2259.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rupert|r
    .train 695 >> Train |T136197:0|t[Shadow Bolt]
    .target Rupert Boch
step << Priest/Warlock
    .goto 1420/0,242.55,2284.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vance|r
    .train 7411 >> Train |T136244:0|t[Enchanting]
    >>|cRXP_WARN_This together with|r |T136249:0|t[Tailoring] |cRXP_WARN_will allow you to create a wand later|r
    .target Vance Undergloom
step
    .goto 1420/0,242.10,2286.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_William Pickman|r
    >>|cRXP_WARN_Learning Cooking from him completes the quest|r
    .train 2550 >>Train Cooking
    .turnin 96658 >>Turn in Camping 101: Cooking
    .target William Pickman
    .isOnQuest 96658
step
    .goto 1420/0,243.200,2288.100
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_William|r
    .train 2550 >>Train Cooking
    .target William Pickman
    .money <0.001
step
    .goto 1420/0,82.59,2022.17
    >>Talk to |cRXP_FRIENDLY_Deathguard Kristof|r and pick "I need a report for Executor Zygand"
    .complete 99141,2 --Kristof's Report (1)
    .skipgossipid 142730
    .target Deathguard Kristof
step
    .goto 1420/0,76.72,2026.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shelene Rhobart|r
    .accept 97558 >>Accept Hides for the Forsaken
    .target Shelene Rhobart
step
    .goto 1420/0,346.94,2258.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Johaan|r
    .accept 367 >>Accept A New Plague
    .target Apothecary Johaan
step << Undead Priest
    .goto 1420/0,359.14,2436.69
    >>Interact with |cRXP_FRIENDLY_Deathguard Kel|r
    .complete 5650,1 --Deathguard Kel
    .target Deathguard Kel
step
    #completewith Along55
    >>As you go: Pick up |cRXP_PICK_Gloom Weed|r from the ground. |cRXP_WARN_Anything left is finished later|r
    .complete 5481,1 --Gloom Weed (3)
step
    #loop
    .goto 1420/0,561.58,2206.23,0
    .goto 1420/0,561.58,2206.23,40,0
    .goto 1420/0,510.97,2116.76,40,0
    .goto 1420/0,556.15,2054.70,40,0
    .goto 1420/0,610.38,2011.92,40,0
    .goto 1420/0,685.39,2043.86,40,0
    .goto 1420/0,651.05,2117.36,40,0
    .goto 1420/0,805.59,2176.11,40,0
    .goto 1420/0,745.04,2205.93,40,0
    .goto 1420/0,672.29,2261.66,40,0
    >>Kill |cRXP_ENEMY_Rotting Dead|r and |cRXP_ENEMY_Ravaged Corpses|r. Loot them for |cRXP_LOOT_Putrid Claw|r
    .complete 404,1 --Putrid Claw (7)
    .mob Rotting Dead
    .mob Ravaged Corpse
step << Paladin
    #completewith next
    +|cRXP_WARN_Keep 10|r |T132889:0|t[Linen Cloth] |cRXP_WARN_for the Paladin quest A Lesson in Divinity. Do not vendor it|r
step
    #completewith Along56
    >>As you go: Kill |cRXP_ENEMY_Greater Duskbats|r and |cRXP_ENEMY_Vampiric Duskbats|r. Loot them for |cRXP_LOOT_Duskbat Wing Membrane|r. |cRXP_WARN_Anything left is finished later|r
    .complete 97558,1 --Duskbat Wing Membrane (8)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
step
    #label Along55
    #loop
    .goto 1420/0,496.96,2255.94,0
    .goto 1420/0,496.96,2255.94,40,0
    .goto 1420/0,620.77,2225.51,40,0
    .goto 1420/0,688.10,2174.30,40,0
    .goto 1420/0,744.13,2106.82,40,0
    .goto 1420/0,884.22,2107.72,40,0
    .goto 1420/0,987.70,2135.14,40,0
    .goto 1420/0,1087.56,2189.96,40,0
    .goto 1420/0,1175.68,2183.64,40,0
    .goto 1420/0,1189.68,2195.69,40,0
    >>Talk to |cRXP_FRIENDLY_Gordo|r and pick "I need a report for Executor Zygand". |cRXP_WARN_He is an abomination who patrols the road between Deathknell and Brill|r
    .complete 99141,3 --Gordo's Report (1)
    .unitscan Gordo
step
    #label Along56
    #loop
    .goto 1420/0,985.89,2187.55,0
    .goto 1420/0,985.89,2187.55,40,0
    .goto 1420/0,1073.10,2179.72,40,0
    .goto 1420/0,1155.34,2194.78,40,0
    .goto 1420/0,1239.39,2206.53,40,0
    .goto 1420/0,1245.72,2311.67,40,0
    .goto 1420/0,1134.55,2345.11,40,0
    .goto 1420/0,1097.50,2262.56,40,0
    .goto 1420/0,1012.55,2313.48,40,0
    .goto 1420/0,923.53,2303.53,40,0
    >>Pick up |cRXP_PICK_Gloom Weed|r from the ground
    .complete 5481,1 --Gloom Weed (3)
step
    .goto 1420/0,1305.82,2126.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Calvin Montague|r
    .accept 590 >>Accept A Rogue's Deal
    .target Calvin Montague
step
    .goto 1420/0,1307.62,2128.21
    >>Defeat Calvin Montague
    .complete 590,1 --Defeat Calvin Montague
step
    .goto 1420/0,1305.82,2126.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Calvin Montague|r
    .turnin 590 >>Turn in A Rogue's Deal
    .target Calvin Montague
step
    #completewith Along61
    >>As you go: Kill |cRXP_ENEMY_Scarlet Warriors|r. |cRXP_WARN_Anything left is finished later|r
    .complete 427,1 --Scarlet Warrior slain (10)
    .mob Scarlet Warrior
step
    #loop
    .goto 1420/0,1354.17,2265.58,0
    .goto 1420/0,1354.17,2265.58,40,0
    .goto 1420/0,1346.94,2305.04,40,0
    .goto 1420/0,1324.79,2351.13,40,0
    .goto 1420/0,1348.29,2363.78,40,0
    .goto 1420/0,1399.81,2360.47,40,0
    .goto 1420/0,1446.35,2336.97,40,0
    .goto 1420/0,1471.20,2304.74,40,0
    .goto 1420/0,1439.12,2304.14,40,0
    .goto 1420/0,1396.64,2293.59,40,0
    >>Pick up |cRXP_PICK_Tirisfal Pumpkin|r from the ground
    .complete 365,1 --Tirisfal Pumpkin (10)
step
    #label Along61
    .goto 1420/0,1589.14,2442.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bareth Dawnstone|r
    >>|cRXP_WARN_He is at the top of the tower and this starts an escort. It is easy to pull three Scarlet Warriors up there|r
    .accept 99144,1 >>Accept Seeking Refuge
    .target Bareth Dawnstone
step
    #completewith Along62
    >>As you go: Kill |cRXP_ENEMY_Decrepit Darkhounds|r, |cRXP_ENEMY_Cursed Darkhounds|r and |cRXP_ENEMY_Ravenous Darkhounds|r. Loot them for |cRXP_LOOT_Darkhound Blood|r. Kill |cRXP_ENEMY_Decrepit Darkhounds|r and |cRXP_ENEMY_Cursed Darkhounds|r. Loot them for |cRXP_LOOT_Darkhound Hide|r. |cRXP_WARN_Anything left is finished later|r
    .complete 367,1 --Darkhound Blood (5)
    .complete 97558,2 --Darkhound Hide (6)
    .mob Decrepit Darkhound
    .mob Cursed Darkhound
    .mob Ravenous Darkhound
step
    #label Along62
    .goto 1420/0,1267.86,2368.30
    >>Escort |cRXP_FRIENDLY_Bareth Dawnstone|r out of Solliden Farmstead
    .complete 99144,1 --Escort Bareth Dawnstone to safety
    .target Bareth Dawnstone
step
    #loop
    .goto 1420/0,1485.66,2396.32,0
    .goto 1420/0,1485.66,2396.32,40,0
    .goto 1420/0,1514.13,2473.14,40,0
    .goto 1420/0,1580.56,2481.87,40,0
    .goto 1420/0,1577.84,2430.06,40,0
    .goto 1420/0,1552.54,2384.87,40,0
    .goto 1420/0,1648.79,2403.25,40,0
    .goto 1420/0,1656.92,2292.99,40,0
    .goto 1420/0,1559.32,2295.10,40,0
    .goto 1420/0,1490.63,2289.07,40,0
    >>Kill |cRXP_ENEMY_Scarlet Warriors|r
    .complete 427,1 --Scarlet Warrior slain (10)
    .mob Scarlet Warrior
step
    #loop
    .goto 1420/0,1195.56,2546.34,0
    .goto 1420/0,1195.56,2546.34,40,0
    .goto 1420/0,1126.87,2548.45,40,0
    .goto 1420/0,1107.44,2613.22,40,0
    .goto 1420/0,1057.28,2544.53,40,0
    .goto 1420/0,1001.70,2515.61,40,0
    .goto 1420/0,1074.91,2474.95,40,0
    .goto 1420/0,1105.63,2329.74,40,0
    .goto 1420/0,1157.60,2367.40,40,0
    .goto 1420/0,1141.33,2480.97,40,0
    >>Kill |cRXP_ENEMY_Decrepit Darkhounds|r, |cRXP_ENEMY_Cursed Darkhounds|r and |cRXP_ENEMY_Ravenous Darkhounds|r. Loot them for |cRXP_LOOT_Darkhound Blood|r
    >>Kill |cRXP_ENEMY_Decrepit Darkhounds|r and |cRXP_ENEMY_Cursed Darkhounds|r. Loot them for |cRXP_LOOT_Darkhound Hide|r
    .complete 367,1 --Darkhound Blood (5)
    .complete 97558,2 --Darkhound Hide (6)
    .mob Decrepit Darkhound
    .mob Cursed Darkhound
    .mob Ravenous Darkhound
step
    #completewith next
    .hs >>Hearth to Brill. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
    .subzoneskip 159
step
    .goto 1420/0,403.42,2287.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Dillinger|r
    .turnin 404 >>Turn in A Putrid Task
    .accept 426 >>Accept The Mills Overrun
    .target Deathguard Dillinger
step
    .goto 1420/0,346.94,2258.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Johaan|r
    .turnin 367 >>Turn in A New Plague while you are here
    .isQuestComplete 367
    .target Apothecary Johaan
step
    .goto 1420/0,346.94,2258.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Johaan|r
    .turnin 365 >>Turn in Fields of Grief while you are here
    .isQuestComplete 365
    .target Apothecary Johaan
step
    .goto 1420/0,437.76,2365.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Junior Apothecary Holland|r
    .turnin 5481 >>Turn in Gordo's Task while you are here
    .isQuestComplete 5481
    .target Junior Apothecary Holland
step
    .goto 1420/0,403.42,2287.57
    >>Talk to |cRXP_FRIENDLY_Deathguard Dillinger|r and pick "I need a report for Executor Zygand"
    .complete 99141,1 --Dillinger's Report (1)
    .skipgossipid 142723
    .target Deathguard Dillinger
step
    .goto 1420/0,346.94,2258.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Johaan|r
    .turnin 367 >>Turn in A New Plague
    .turnin 365 >>Turn in Fields of Grief
    .accept 368 >>Accept A New Plague
    .accept 407 >>Accept Fields of Grief
    .target Apothecary Johaan
step
    .goto 1420/0,310.79,2252.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shari Stilwell|r
    .turnin 99144 >>Turn in Seeking Refuge while you are here
    .isQuestComplete 99144
    .target Shari Stilwell
step
    .goto 1420/0,295.42,2278.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Zygand|r
    .turnin 99141 >>Turn in Patience while you are here
    .isQuestComplete 99141
    .target Executor Zygand
step
    .goto 1420/0,295.42,2278.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Zygand|r
    .turnin 427 >>Turn in At War With The Scarlet Crusade while you are here
    .isQuestComplete 427
    .target Executor Zygand
step
    .goto 1420/0,347.84,2265.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carolai Anise|r
    .accept 95314 >>Accept That Shadowvale Green Elixir
    .target Carolai Anise
step
    #loop
    .goto 1420/0,312.59,2259.55,0
    .goto 1420/0,312.59,2259.55,40,0
    .goto 1420/0,290.45,2273.11,40,0
    .goto 1420/0,246.62,2295.70,40,0
    .goto 1420/0,243.46,2288.77,40,0
    .goto 1420/0,257.47,2239.37,40,0
    >>Use |T133490:0|t[Executor's Motivator] on any five |cRXP_FRIENDLY_Deathguards|r in and around Brill
    .complete 99134,1 --Deathguards motivated (5)
    .use 286176
step << Undead Priest
    .goto 1420/0,251.14,2265.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dark Cleric Beryl|r
    .turnin 5650 >>Turn in Garments of Darkness while you are here
    .isQuestComplete 5650
    .target Dark Cleric Beryl
step
    .goto 1420/0,233.06,2292.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captured Scarlet Zealot|r
    .turnin 407 >>Turn in Fields of Grief while you are here
    .isQuestComplete 407
    .target Captured Scarlet Zealot
step
    .goto 1420/0,295.42,2278.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Zygand|r
    .turnin 427 >>Turn in At War With The Scarlet Crusade
    .turnin 99141 >>Turn in Patience
    .turnin 99134 >>Turn in Discipline
    .accept 370 >>Accept At War With The Scarlet Crusade
    .target Executor Zygand
step
    .goto 1420/0,280.06,2270.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Burgess|r
    .accept 374 >>Accept Proof of Demise
    .target Deathguard Burgess
step
    .goto 1420/0,288.64,2286.06
    >>Click the |cRXP_PICK_Wanted!|r
    .accept 398 >>Accept Wanted: Maggot Eye
step
    .goto 1420/0,265.15,2305.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Sevren|r
    .accept 358 >>Accept Graverobbers
    .target Magistrate Sevren
step << Paladin
    .goto 1420/0,311.600,2251.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shari Stilwell|r
    .train 853 >>Train your class spells
    .target Shari Stilwell
    .xp <8,1
step
    .goto 1420/0,310.79,2252.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shari Stilwell|r
    .turnin 99144 >>Turn in Seeking Refuge
    .target Shari Stilwell
step << Undead Priest
    .goto 1420/0,251.14,2265.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dark Cleric Beryl|r
    .turnin 5650 >>Turn in Garments of Darkness
    .target Dark Cleric Beryl
step << Priest
    .goto 1420/0,251.14,2265.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Beryl|r on the second floor
    .train 591 >>Train |T135924:0|t[Smite]
    .train 17 >>Train |T135940:0|t[Power Word: Shield]
    .target Dark Cleric Beryl
step
    .goto 1420/0,236.68,2249.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gretchen Dedmar|r
    .accept 375 >>Accept The Chill of Death
    .target Gretchen Dedmar
step << Priest
    .goto 1420/0,251.14,2265.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Beryl|r on the second floor
    .train 139 >> Train your class spells
    .target Dark Cleric Beryl
    .xp <8,1
step << Mage
    .goto 1420/0,233.06,2256.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cain|r on the second floor
    .train 205 >> Train your class spells
    .target Cain Firesong
    .xp <8,1
step << Warrior
    .goto 1420/0,238.49,2255.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Austil|r
    .train 284 >> Train your class spells
    .target Austil de Mon
    .xp <8,1
step << Rogue
    .goto 1420/0,243.01,2271.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marion|r on the second floor
    .train 6760 >> Train your class spells
    .target Marion Call
    .xp <8,1
step << Warlock
    .goto 1420/0,250.24,2259.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rupert|r
    .train 980 >> Train your class spells
    .target Rupert Boch
    .xp <8,1
step
    .goto 1420/0,243.200,2288.100
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_William|r
    .train 2550 >>Train Cooking
    .target William Pickman
step << Rogue/Warrior
    .goto 1420/0,240.29,2246.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Neela|r
    >>|cRXP_WARN_Try to make them during points at which you're waiting for things, such as Zeppelins|r
    .train 3273 >>Train |T135966:0|t[First Aid]
    .target Nurse Neela
step
    .goto 1420/0,437.76,2365.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Junior Apothecary Holland|r
    .turnin 5481 >>Turn in Gordo's Task
    .accept 5482 >>Accept Doom Weed
    .target Junior Apothecary Holland
step
    #loop
    .goto 1420/0,514.13,1999.87,0
    .goto 1420/0,514.13,1999.87,40,0
    .goto 1420/0,476.17,1941.43,40,0
    .goto 1420/0,545.76,1908.60,40,0
    .goto 1420/0,583.27,1853.47,40,0
    .goto 1420/0,643.82,1920.04,40,0
    .goto 1420/0,741.88,1978.49,40,0
    .goto 1420/0,809.66,2041.15,40,0
    .goto 1420/0,733.74,2050.18,40,0
    .goto 1420/0,589.59,1978.18,40,0
    >>Kill |cRXP_ENEMY_Greater Duskbats|r and |cRXP_ENEMY_Vampiric Duskbats|r. Loot them for |cRXP_LOOT_Duskbat Pelt|r
    >>Kill |cRXP_ENEMY_Greater Duskbats|r and |cRXP_ENEMY_Vampiric Duskbats|r. Loot them for |cRXP_LOOT_Duskbat Wing Membrane|r
    .complete 375,1 --Duskbat Pelt (5)
    .complete 97558,1 --Duskbat Wing Membrane (8)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
step << Rogue/Warrior
    .goto 1420/0,482.50,1951.07,0
    .goto 1420/0,403.42,2085.73,50,0
    .goto 1420/0,413.36,1979.99,50,0
    .goto 1420/0,482.50,1951.07,50,0
    .goto 1420/0,560.22,1901.06,50,0
    .goto 1420/0,645.63,1961.92,50,0
    .goto 1420/0,750.46,1993.55,50,0
    .goto 1420/0,869.76,2003.79,50,0
    .goto 1420/0,950.64,2039.040,50,0
    .goto 1420/0,1068.13,1975.47,50,0
    .xp 7+3260 >> Grind to 3260+/4500
step
    .goto 1420/0,275.54,2259.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy |cRXP_LOOT_Coarse Thread|r from |cRXP_FRIENDLY_Abigail Shiel|r
    .complete 375,2 --Coarse Thread (1)
    .target Abigail Shiel
step
    .goto 1420/0,236.68,2249.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gretchen Dedmar|r
    .turnin 375 >>Turn in The Chill of Death
    .target Gretchen Dedmar
step << Undead Paladin
    .goto 1420/0,310.79,2252.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shari Stilwell|r
    .accept 91282 >>Accept A Second Home
    .target Shari Stilwell
    .xp <8,1
step
    #loop
    .goto 1420/0,348.74,2505.37,0
    .goto 1420/0,348.74,2505.37,40,0
    .goto 1420/0,474.82,2447.23,40,0
    .goto 1420/0,602.25,2514.11,40,0
    .goto 1420/0,625.29,2587.31,40,0
    .goto 1420/0,560.22,2663.23,40,0
    .goto 1420/0,429.18,2817.77,40,0
    .goto 1420/0,421.50,2680.40,40,0
    .goto 1420/0,485.66,2598.16,40,0
    .goto 1420/0,381.28,2573.45,40,0
    >>Kill |cRXP_ENEMY_Rot Hide Graverobbers|r
    >>Kill |cRXP_ENEMY_Rot Hide Gnolls|r, |cRXP_ENEMY_Rot Hide Mongrels|r and |cRXP_ENEMY_Rot Hide Graverobbers|r. Loot them for |cRXP_LOOT_Embalming Ichor|r
    >>Pick up |cRXP_PICK_Doom Weed|r from the ground
    .complete 358,1 --Rot Hide Graverobber slain (8)
    .complete 358,3 --Embalming Ichor (8)
    .complete 5482,1 --Doom Weed (10)
    .mob Rot Hide Graverobber
    .mob Rot Hide Gnoll
    .mob Rot Hide Mongrel
step
    #completewith Along82
    >>As you go: Kill |cRXP_ENEMY_Rot Hide Mongrels|r. |cRXP_WARN_Anything left is finished later|r
    .complete 358,2 --Rot Hide Mongrel slain (5)
    .mob Rot Hide Mongrel
step
    #completewith Along82
    >>As you go: Kill |cRXP_ENEMY_Vile Fin Puddlejumpers|r, |cRXP_ENEMY_Vile Fin Minor Oracles|r, |cRXP_ENEMY_Vile Fin Muckdwellers|r and |cRXP_ENEMY_Vile Fin Seers|r. Loot them for |cRXP_LOOT_Vile Fin Scale|r. |cRXP_WARN_Anything left is finished later|r
    .complete 368,1 --Vile Fin Scale (5)
    .mob Vile Fin Puddlejumper
    .mob Vile Fin Minor Oracle
    .mob Vile Fin Muckdweller
    .mob Vile Fin Seer
step
    #label Along82
    .goto 1420/0,382.63,2910.55
    >>Kill |cRXP_ENEMY_Maggot Eye|r and loot |cRXP_LOOT_Maggot Eye's Paw|r
    .complete 398,1 --Maggot Eye's Paw (1)
    .mob Maggot Eye
step
    #loop
    .goto 1420/0,413.81,2778.00,0
    .goto 1420/0,413.81,2778.00,40,0
    .goto 1420/0,384.89,2749.69,40,0
    .goto 1420/0,325.70,2750.29,40,0
    .goto 1420/0,279.61,2712.33,40,0
    .goto 1420/0,300.85,2668.05,40,0
    .goto 1420/0,313.95,2681.60,40,0
    .goto 1420/0,349.20,2720.16,40,0
    .goto 1420/0,385.80,2707.81,40,0
    .goto 1420/0,487.47,2821.99,40,0
    >>Kill |cRXP_ENEMY_Rot Hide Mongrels|r
    .complete 358,2 --Rot Hide Mongrel slain (5)
    .mob Rot Hide Mongrel
step
    #loop
    .goto 1420/0,203.24,2912.96,0
    .goto 1420/0,203.24,2912.96,40,0
    .goto 1420/0,182.45,2949.11,40,0
    .goto 1420/0,197.37,2985.56,40,0
    .goto 1420/0,116.93,2961.77,40,0
    .goto 1420/0,82.14,2975.62,40,0
    .goto 1420/0,52.77,3012.98,40,0
    .goto 1420/0,43.73,2940.08,40,0
    .goto 1420/0,86.66,2920.80,40,0
    .goto 1420/0,139.53,2915.07,40,0
    >>Kill |cRXP_ENEMY_Vile Fin Puddlejumpers|r, |cRXP_ENEMY_Vile Fin Minor Oracles|r, |cRXP_ENEMY_Vile Fin Muckdwellers|r and |cRXP_ENEMY_Vile Fin Seers|r. Loot them for |cRXP_LOOT_Vile Fin Scale|r
    >>Kill |cRXP_ENEMY_Vile Fin Minor Oracles|r and |cRXP_ENEMY_Vile Fin Muckdwellers|r. Loot them for |cRXP_LOOT_Vile Fin Murloc Skin|r
    .complete 368,1 --Vile Fin Scale (5)
    .complete 97558,3 --Vile Fin Murloc Skin (3)
    .mob Vile Fin Puddlejumper
    .mob Vile Fin Minor Oracle
    .mob Vile Fin Muckdweller
    .mob Vile Fin Seer
step
    .goto 1420/0,244.36,2262.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Coleman Farthing|r
    .accept 354 >>Accept Deaths in the Family
    .accept 362 >>Accept The Haunted Mills
    .target Coleman Farthing
step
    .goto 1420/0,295.42,2278.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Zygand|r
    .turnin 398 >>Turn in Wanted: Maggot Eye
    .target Executor Zygand
step
    .goto 1420/0,346.94,2258.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Johaan|r
    .turnin 368 >>Turn in A New Plague while you are here
    .isQuestComplete 368
    .target Apothecary Johaan
step
    .goto 1420/0,265.15,2305.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Sevren|r
    .turnin 358 >>Turn in Graverobbers
    .accept 405 >>Accept The Prodigal Lich
    .accept 359 >>Accept Forsaken Duties
    .target Magistrate Sevren
step
    .goto 1420/0,76.72,2026.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shelene Rhobart|r
    .turnin 97558 >>Turn in Hides for the Forsaken
    .target Shelene Rhobart
step
    .goto 1420/0,74.00,2022.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Linnea|r
    .turnin 359 >>Turn in Forsaken Duties
    .accept 360 >>Accept Return to the Magistrate
    .target Deathguard Linnea
step
    .goto 1420/0,346.94,2258.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Johaan|r
    .turnin 368 >>Turn in A New Plague
    .accept 369 >>Accept A New Plague
    .target Apothecary Johaan
step
    .goto 1420/0,437.76,2365.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Junior Apothecary Holland|r
    .turnin 5482 >>Turn in Doom Weed
    .accept 99142 >>Accept Tomb Weed
    .target Junior Apothecary Holland
step
    #completewith Drop361x1
    >>|T134939:0|t[|cRXP_LOOT_A Letter to Yvette|r] can drop from the Agamand Mills undead. Use it to start the quest if you get one
    .collect 2839,1,361 --A Letter to Yvette (1)
    .accept 361 >>Accept A Letter Undelivered
    .use 2839
step
    #completewith Along94
    >>As you go: Kill |cRXP_ENEMY_Darkeye Bonecasters|r and |cRXP_ENEMY_Shadowvale Mystics|r. Loot them for |cRXP_LOOT_Blackened Skull|r. |cRXP_WARN_Anything left is finished later|r
    .complete 426,2 --Blackened Skull (3)
    .mob Darkeye Bonecaster
    .mob Shadowvale Mystic
step
    .goto 1420/0,894.16,2609.00
    >>Kill |cRXP_ENEMY_Devlin Agamand|r and loot |cRXP_LOOT_Devlin's Remains|r
    .complete 362,1 --Devlin's Remains (1)
    .mob Devlin Agamand
step
    #completewith Along94
    >>As you go: Kill |cRXP_ENEMY_Rattlecage Soldiers|r and |cRXP_ENEMY_Cracked Skull Soldiers|r. Loot them for |cRXP_LOOT_Notched Rib|r. |cRXP_WARN_Anything left is finished later|r
    .complete 426,1 --Notched Rib (5)
    .mob Rattlecage Soldier
    .mob Cracked Skull Soldier
step
    .goto 1420/0,785.71,2742.76
    >>Kill |cRXP_ENEMY_Nissa Agamand|r and loot |cRXP_LOOT_Nissa's Remains|r
    .complete 354,2 --Nissa's Remains (1)
    .mob Nissa Agamand
step
    #label Along94
    .goto 1420/0,1045.08,2824.09
    >>Kill |cRXP_ENEMY_Thurman Agamand|r and loot |cRXP_LOOT_Thurman's Remains|r
    .complete 354,3 --Thurman's Remains (1)
    .mob Thurman Agamand
step
    #label Drop361x1
    #loop
    .goto 1420/0,987.70,2786.74,0
    .goto 1420/0,987.70,2786.74,40,0
    .goto 1420/0,1104.73,2778.61,40,0
    .goto 1420/0,1104.28,2865.37,40,0
    .goto 1420/0,1063.61,2975.92,40,0
    .goto 1420/0,980.47,2979.54,40,0
    .goto 1420/0,921.27,2954.54,40,0
    .goto 1420/0,828.18,2960.56,40,0
    .goto 1420/0,946.12,2883.14,40,0
    .goto 1420/0,1006.67,2888.86,40,0
    >>Kill |cRXP_ENEMY_Gregor Agamand|r and loot |cRXP_LOOT_Gregor's Remains|r
    >>Kill |cRXP_ENEMY_Rattlecage Soldiers|r and |cRXP_ENEMY_Cracked Skull Soldiers|r. Loot them for |cRXP_LOOT_Notched Rib|r
    >>Kill |cRXP_ENEMY_Darkeye Bonecasters|r and |cRXP_ENEMY_Shadowvale Mystics|r. Loot them for |cRXP_LOOT_Blackened Skull|r
    .complete 354,1 --Gregor's Remains (1)
    .complete 426,1 --Notched Rib (5)
    .complete 426,2 --Blackened Skull (3)
    .mob Gregor Agamand
    .mob Rattlecage Soldier
    .mob Cracked Skull Soldier
    .mob Darkeye Bonecaster
    .mob Shadowvale Mystic
step
    .goto 1420/0,857.56,2793.97,60,0
    .goto 1420/0,880.15,2884.04,60,0
    .goto 1420/0,953.35,2926.22,60,0
    .goto 1420/0,1025.2,2908.44,60,0
    .goto 1420/0,1040.56,2793.07,60,0
    .goto 1420/0,918.56,2780.11,60,0
    .goto 1420/0,953.35,2926.22,60,0
    .xp 9+3840 >> Grind to 4320+/6500xp
step
    .goto 1420/0,857.56,2793.97,60,0
    .goto 1420/0,880.15,2884.04,60,0
    .goto 1420/0,953.35,2926.22,60,0
    .goto 1420/0,1025.2,2908.44,60,0
    .goto 1420/0,1040.56,2793.07,60,0
    .goto 1420/0,918.56,2780.11,60,0
    .goto 1420/0,953.35,2926.22,60,0
    .xp 9+3360 >> Grind to 3360+/6500xp
step
    #completewith next
    .hs >>Hearth to Brill. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
    .subzoneskip 159
step
    .goto 1420/0,403.42,2287.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Dillinger|r
    .turnin 426 >>Turn in The Mills Overrun
    .target Deathguard Dillinger
step
    .goto 1420/0,250.69,2252.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yvette Farthing|r
    .turnin 361 >>Turn in A Letter Undelivered
    .target Yvette Farthing
    .isOnQuest 361
step
    .goto 1420/0,244.36,2262.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Coleman Farthing|r
    .turnin 354 >>Turn in Deaths in the Family
    .turnin 362 >>Turn in The Haunted Mills
    .accept 355 >>Accept Speak with Sevren
    .target Coleman Farthing
step
    .goto 1420/0,265.15,2305.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Sevren|r
    .turnin 360 >>Turn in Return to the Magistrate
    .turnin 355 >>Turn in Speak with Sevren
    .target Magistrate Sevren
step << Priest
    .goto 1420/0,251.14,2265.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Beryl|r on the second floor
    .trainer >> Train your class spells
    .target Dark Cleric Beryl
step << Warrior
    .goto 1420/0,238.49,2254.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Austil|r
    .trainer >> Train your class spells
    .target Austil de Mon << Warrior
step << Warlock
    .goto 1420/0,250.24,2259.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rupert|r
    .train 707 >> Train your class spells
    .target Rupert Boch
step << Rogue
    .goto 1420/0,243.01,2270.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marion|r inside the inn
    .trainer >> Train your class spells
    .target Marion Call
step << Undead Mage/Troll Mage
    .goto 1420/0,233.06,2256.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cain Firesong|r
    .accept 1881 >>Accept Speak with Anastasia
    .target Cain Firesong
step << Undead Paladin
    .goto 1420/0,310.79,2252.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shari Stilwell|r
    .accept 91282 >>Accept A Second Home
    .target Shari Stilwell
step << Paladin
    .goto 1420/0,311.600,2251.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shari Stilwell|r
    .trainer >>Train your class spells
    .target Shari Stilwell
step << Warlock
    .goto 1420/0,248.88,2250.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ageron Kargal|r
    .accept 1478 >>Accept Halgar's Summons
    .target Ageron Kargal
    .xp <10,1
step << Undead Rogue
    .goto 1420/0,243.01,2271.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marion Call|r
    .accept 1885 >>Accept Mennet Carkad
    .target Marion Call
    .xp <10,1
step << Warrior
    .goto 1420/0,238.49,2254.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Austil de Mon|r
    .accept 1818 >>Accept Speak with Dillinger
    .target Austil de Mon
    .xp <10,1
step
    #completewith next
    .goto 1420/0,235.32,1883.89
    .zone 1458 >>Go into the Ruins of Lordaeron and take a lift down into the Undercity
    .zoneskip 1458
step << Undead
    .goto 1458/0,283.27,1610.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gordon Wendham|r
    .turnin 6323 >>Turn in Ride to the Undercity
    .target Gordon Wendham
    .isOnQuest 6323
step << Undead Priest
    .goto 1458/0,400.60,1768.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aelthalyste|r
    .turnin 5660 >>Turn in Touch of Weakness
    .target Aelthalyste
    .isOnQuest 5660
step << Undead Priest
    .goto 1458/0,400.60,1768.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aelthalyste|r
    .turnin 5662 >>Turn in Touch of Weakness
    .target Aelthalyste
    .isOnQuest 5662
step << Undead Priest
    .goto 1458/0,400.60,1768.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aelthalyste|r
    .turnin 5663 >>Turn in Touch of Weakness
    .target Aelthalyste
    .isOnQuest 5663
step << Undead Priest
    .goto 1458/0,400.60,1768.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aelthalyste|r
    .turnin 5661 >>Turn in Touch of Weakness
    .target Aelthalyste
    .isOnQuest 5661
step << Troll Priest
    .goto 1458/0,400.60,1768.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aelthalyste|r
    .accept 5657 >>Accept Hex of Weakness
    .target Aelthalyste
    .xp <10,1
step << Undead Priest
    .goto 1458/0,400.60,1768.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aelthalyste|r
    .accept 5658 >>Accept Touch of Weakness
    .target Aelthalyste
    .xp <10,1
step
    .goto 1458/0,172.27,1667.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Oran Snakewrithe|r
    .turnin 84397 >>Turn in Northern Kalimdor - A Comprehensive Guide
    .target Oran Snakewrithe
    .isOnQuest 84397
step
    .goto 1458/0,172.27,1667.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Oran Snakewrithe|r
    .turnin 84399 >>Turn in Ka-Boom!
    .target Oran Snakewrithe
    .isOnQuest 84399
step
    .goto 1458/0,66.65,1766.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bethor Iceshard|r
    .turnin 405 >>Turn in The Prodigal Lich
    .accept 357 >>Accept The Lich's Identity
    .target Bethor Iceshard
step << Undead Mage/Troll Mage
    .goto 1458/0,56.38,1813.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Anastasia Hartwell|r
    .turnin 1881 >>Turn in Speak with Anastasia while you are here
    .isQuestComplete 1881
    .target Anastasia Hartwell
step
    #completewith next
    .goto 1420/0,235.32,1883.89
    .zone 1420 >>Take a lift back up and leave the Undercity
    .zoneskip 1420
step
    #loop
    .goto 1420/0,577.84,1750.44,0
    .goto 1420/0,577.84,1750.44,40,0
    .goto 1420/0,642.46,1757.67,40,0
    .goto 1420/0,653.76,1808.28,40,0
    .goto 1420/0,705.27,1801.35,40,0
    .goto 1420/0,767.18,1764.30,40,0
    .goto 1420/0,763.57,1821.23,40,0
    .goto 1420/0,855.75,1837.80,40,0
    .goto 1420/0,753.17,1888.11,40,0
    .goto 1420/0,608.57,1849.25,40,0
    >>Kill |cRXP_ENEMY_Captain Perrine|r
    >>Kill |cRXP_ENEMY_Scarlet Zealots|r
    >>Kill |cRXP_ENEMY_Scarlet Missionaries|r
    >>Kill |cRXP_ENEMY_Scarlet Warriors|r, |cRXP_ENEMY_Scarlet Missionaries|r, |cRXP_ENEMY_Scarlet Zealots|r and |cRXP_ENEMY_Scarlet Friars|r. Loot them for |cRXP_LOOT_Scarlet Insignia Ring|r
    .complete 370,1 --Captain Perrine slain (1)
    .complete 370,2 --Scarlet Zealot slain (3)
    .complete 370,3 --Scarlet Missionary slain (3)
    .complete 374,1 --Scarlet Insignia Ring (10)
    .mob Captain Perrine
    .mob Scarlet Zealot
    .mob Scarlet Missionary
    .mob Scarlet Warrior
    .mob Scarlet Friar
step << Rogue
    .goto 1458/0,323.57,1668.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to|r |cRXP_FRIENDLY_Archibald|r in the War Quarter
    .train 201 >>Train 1h Swords
    .target Archibald
step << Warrior/Rogue
    .goto 1458/0,335.37,1638.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brom|r
    .train 2575 >> Train |T136248:0|t[Mining]
    >>|cRXP_WARN_This will allow you to find|r |T135232:0|t|cRXP_LOOT_[Rough Stones]|r |cRXP_WARN_from nodes in order to craft|r |T135248:0|t[Sharpening Stones] |cRXP_WARN_(+2 Weapon Damage for 30 minutes)|r
    .target Brom Killian
step << Warrior/Rogue
    .goto 1458/0,329.04,1641.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sarah|r
    >>|cRXP_BUY_Buy a|r |T134708:0|t[Mining Pick] |cRXP_BUY_from|r |cRXP_FRIENDLY_Sarah|r
    .collect 2901,1,371,1
    .target Sarah Killian
    .train 2575,3
step << Warrior/Rogue
    .goto 1458/0,295.94,1691.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Basil Frye|r
    .train 2018 >> Train |T136241:0|t[Blacksmithing]
    .target Basil Frye
    .train 2575,3
step << Undead Mage/Troll Mage
    #completewith next
    .goto 1420/0,235.32,1883.89
    .zone 1458 >>Go into the Ruins of Lordaeron and take a lift down into the Undercity
    .zoneskip 1458
step << Undead Mage/Troll Mage
    .goto 1458/0,56.38,1813.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Anastasia Hartwell|r
    .turnin 1881 >>Turn in Speak with Anastasia
    .accept 1882 >>Accept The Balnir Farmstead
    .target Anastasia Hartwell
step << Undead Mage/Troll Mage
    #completewith next
    .goto 1420/0,235.32,1883.89
    .zone 1420 >>Take a lift back up and leave the Undercity
    .zoneskip 1420
step
    .goto 1420/0,280.06,2270.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Burgess|r
    .turnin 374 >>Turn in Proof of Demise
    .target Deathguard Burgess
step
    .goto 1420/0,295.42,2278.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Zygand|r
    .turnin 370 >>Turn in At War With The Scarlet Crusade
    .accept 371 >>Accept At War With The Scarlet Crusade
    .target Executor Zygand
step
    .goto 1420/0,265.15,2305.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Sevren|r
    .accept 408 >>Accept The Family Crypt
    .target Magistrate Sevren
step << Undead Rogue
    .goto 1420/0,243.01,2271.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marion Call|r
    .accept 1885 >>Accept Mennet Carkad
    .target Marion Call
    .xp <10,1
step << Warrior
    .goto 1420/0,238.49,2254.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Austil de Mon|r
    .accept 1818 >>Accept Speak with Dillinger
    .target Austil de Mon
    .xp <10,1
step << Warlock
    .goto 1420/0,248.88,2250.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ageron Kargal|r
    .accept 1478 >>Accept Halgar's Summons
    .target Ageron Kargal
    .xp <10,1
step
    #loop
    .goto 1420/0,-319.58,2023.97,0
    .goto 1420/0,-319.58,2023.97,40,0
    .goto 1420/0,-351.21,2051.09,40,0
    .goto 1420/0,-396.40,2063.14,40,0
    .goto 1420/0,-455.14,2066.15,40,0
    .goto 1420/0,-486.77,2036.02,40,0
    .goto 1420/0,-472.31,1976.98,40,0
    .goto 1420/0,-414.47,2005.90,40,0
    .goto 1420/0,-400.92,1960.71,40,0
    .goto 1420/0,-355.73,1966.74,40,0
    >>Pick up |cRXP_PICK_Balnir Snapdragons|r from the ground << Undead Mage/Troll Mage
    >>Pick up |cRXP_PICK_Tomb Weed|r from the ground
    .complete 1882,1 << Undead Mage/Troll Mage --Balnir Snapdragons (1)
    .complete 99142,1 --Tomb Weed (5)
step
    #loop
    .goto 1420/0,-505.75,2142.67,0
    .goto 1420/0,-505.75,2142.67,40,0
    .goto 1420/0,-450.62,2184.24,40,0
    .goto 1420/0,-520.66,2169.18,40,0
    .goto 1420/0,-653.97,2237.86,40,0
    .goto 1420/0,-611.04,2177.01,40,0
    .goto 1420/0,-625.05,2112.84,40,0
    .goto 1420/0,-556.81,2165.26,40,0
    .goto 1420/0,-554.55,2143.27,40,0
    .goto 1420/0,-530.15,2143.57,40,0
    >>Kill |cRXP_ENEMY_Scarlet Friars|r
    >>Kill |cRXP_ENEMY_Captain Vachon|r
    .complete 371,2 --Scarlet Friar slain (5)
    .complete 371,1 --Captain Vachon slain (1)
    .mob Scarlet Friar
    .mob Captain Vachon
step
    #loop
    .goto 1420/0,-747.96,2258.95,0
    .goto 1420/0,-747.96,2258.95,40,0
    .goto 1420/0,-826.58,2177.61,40,0
    .goto 1420/0,-847.37,2111.64,40,0
    .goto 1420/0,-951.30,2182.13,40,0
    .goto 1420/0,-851.44,2254.73,40,0
    .goto 1420/0,-915.15,2352.64,40,0
    .goto 1420/0,-848.72,2353.54,40,0
    .goto 1420/0,-786.82,2416.50,40,0
    .goto 1420/0,-784.56,2327.94,40,0
    >>Kill |cRXP_ENEMY_Vicious Night Web Spiders|r. Loot them for |cRXP_LOOT_Vicious Night Web Spider Venom|r
    .complete 369,1 --Vicious Night Web Spider Venom (4)
    .mob Vicious Night Web Spider
step
    .goto 1420/0,-37.61,2569.54
    >>Open the |cRXP_PICK_Gunther's Books|r. Loot it for |cRXP_LOOT_The Lich's Spellbook|r
    .complete 357,1 --The Lich's Spellbook (1)
step
    .goto 1420/0,346.94,2258.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Johaan|r
    .turnin 369 >>Turn in A New Plague
    .accept 492 >>Accept A New Plague
    .target Apothecary Johaan
step
    .goto 1420/0,295.42,2278.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Zygand|r
    .turnin 371 >>Turn in At War With The Scarlet Crusade
    .accept 372 >>Accept At War With The Scarlet Crusade
    .target Executor Zygand
step
    .goto 1420/0,244.81,2269.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Renee|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Renee
step
    .goto 1420/0,233.06,2292.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captured Scarlet Zealot|r
    .turnin 407 >>Turn in Fields of Grief
    .target Captured Scarlet Zealot
step
    .goto 1420/0,234.42,2289.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captured Mountaineer|r
    .turnin 492 >>Turn in A New Plague
    .target Captured Mountaineer
step << Priest
    .goto 1420/0,251.14,2265.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Beryl|r on the second floor
    .trainer >> Train your class spells
    .target Dark Cleric Beryl
    .xp <12,1
step << Warrior
    .goto 1420/0,238.49,2255.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Austil|r
    .train 7384 >>Train Train your class spells
    .target Austil de Mon
    .xp <12,1
step << Warlock
    .goto 1420/0,250.24,2259.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rupert|r
    .train 755 >> Train your class spells
    .target Rupert Boch
    .xp <12,1
step << Rogue
    .goto 1420/0,243.01,2270.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marion|r
    .train 1766 >> Train your class spells
    .target Marion Call
    .xp <12,1
step << Mage
    .goto 1420/0,233.52,2256.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cain|r inside the inn
    .train 145 >> Train your class spells
    .target Cain Firesong
    .xp <12,1
step << Paladin
    .goto 1420/0,311.600,2251.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shari Stilwell|r
    .train 678 >> Train your class spells
    .target Shari Stilwell
    .xp <12,1
step
    .goto 1420/0,437.76,2365.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Junior Apothecary Holland|r
    .turnin 99142 >>Turn in Tomb Weed
    .target Junior Apothecary Holland
step << Undead Paladin
    .goto 1420/0,2048.70,2476.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Breton Samuels|r
    .turnin 91282 >>Turn in A Second Home
    .accept 91285 >>Accept Murlocs at the Gates
    .target Breton Samuels
step
    .goto 1420/0,2041.47,2423.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hilda the Breaker|r
    .accept 99152 >>Accept As Above, So Below
    .target Hilda the Breaker
step
    .goto 1420/0,2119.64,2435.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ephram Barbaro|r
    .accept 99153 >>Accept The One That Got Away
    .target Ephram Barbaro
step << Undead Paladin
    #loop
    .goto 1420/0,2174.77,2215.87,0
    .goto 1420/0,2174.77,2215.87,40,0
    .goto 1420/0,2275.99,2134.23,40,0
    .goto 1420/0,2264.69,2093.56,40,0
    .goto 1420/0,2257.92,2059.22,40,0
    .goto 1420/0,2224.48,2055.61,40,0
    .goto 1420/0,2223.12,2014.33,40,0
    .goto 1420/0,2207.76,1970.65,40,0
    .goto 1420/0,2172.06,2016.74,40,0
    .goto 1420/0,2217.25,2118.27,40,0
    >>Kill |cRXP_ENEMY_Vile Fin Seers|r
    >>Kill |cRXP_ENEMY_Vile Fin Attackers|r
    .complete 91285,2 --Vile Fin Seer slain (8)
    .complete 91285,1 --Vile Fin Attacker slain (8)
    .mob Vile Fin Seer
    .mob Vile Fin Attacker
step << Undead Paladin
    .goto 1420/0,2048.70,2476.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Breton Samuels|r
    .turnin 91285 >>Turn in Murlocs at the Gates
    .accept 91294 >>Accept Touring the Grounds
    .target Breton Samuels
step << Undead Paladin
    .goto 1420/0,2038.76,2423.73
    >>Talk to |cRXP_FRIENDLY_Hilda the Breaker|r outside the keep
    .complete 91294,1 --Speak with Hilda the Breaker
    .target Hilda the Breaker
step << Undead Paladin
    #loop
    .goto 1420/0,2017.97,2342.40,0
    .goto 1420/0,2017.97,2342.40,40,0
    .goto 1420/0,1950.64,2332.15,40,0
    .goto 1420/0,1887.83,2317.69,40,0
    .goto 1420/0,1890.09,2378.85,40,0
    >>Talk to |cRXP_FRIENDLY_Ander Solliden|r. |cRXP_WARN_He patrols the road outside the keep|r
    .complete 91294,3 --Speak with Ander Solliden
    .unitscan Ander Solliden
step << Undead Paladin
    .goto 1420/0,2009.38,2489.10
    >>Talk to |cRXP_FRIENDLY_Jorin Croge|r inside the keep
    .complete 91294,2 --Speak with Jorin Croge
    .target Jorin Croge
step << Undead Paladin
    .goto 1420/0,2036.50,2490.31
    >>Talk to |cRXP_FRIENDLY_Danitha Morr|r upstairs in the keep
    .complete 91294,4 --Speak with Danitha Morr
    .target Danitha Morr
step << Undead Paladin
    .goto 1420/0,2036.50,2490.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Danitha Morr|r
    .turnin 91294 >>Turn in Touring the Grounds
    .accept 91317 >>Accept The Tarnished
    .target Danitha Morr
step << Undead Paladin
    .goto 1420/0,2009.38,2489.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jorin Croge|r
    .accept 91316 >>Accept Making Repairs
    .target Jorin Croge
step
    #completewith Along136
    >>As you go: Kill |cRXP_ENEMY_Shadowvale Lurchers|r and |cRXP_ENEMY_Shadowvale Mystics|r. Loot them for |cRXP_LOOT_Faintly Glowing Bone|r. |cRXP_WARN_Anything left is finished later|r
    .complete 99152,1 --Faintly Glowing Bone (6)
    .mob Shadowvale Lurcher
    .mob Shadowvale Mystic
step << Undead Paladin
    #loop
    .goto 1420/0,2406.13,2056.51,0
    .goto 1420/0,2406.13,2056.51,40,0
    .goto 1420/0,2412.01,1989.33,40,0
    .goto 1420/0,2478.43,1959.81,40,0
    .goto 1420/0,2461.71,1899.56,40,0
    .goto 1420/0,2495.60,1849.25,40,0
    .goto 1420/0,2537.63,1939.93,40,0
    .goto 1420/0,2581.01,2016.74,40,0
    .goto 1420/0,2526.78,2013.73,40,0
    .goto 1420/0,2473.46,2027.29,40,0
    >>Kill |cRXP_ENEMY_Rudolph Gelhardt|r upstairs. Loot him for his |cRXP_LOOT_Head|r
    >>Kill |cRXP_ENEMY_Tarnished Zealots|r
    >>Kill |cRXP_ENEMY_Tarnished Drudges|r
    .complete 91317,1 --Rudolph Gelhardt's Head (1)
    .complete 91317,3 --Tarnished Zealot slain (6)
    .complete 91317,2 --Tarnished Drudge slain (8)
    .mob Rudolph Gelhardt
    .mob Tarnished Zealot
    .mob Tarnished Drudge
step
    #completewith Along136
    >>As you go: Open the |cRXP_PICK_Bottle|r. Loot it for |cRXP_LOOT_Bottle of Whispering Elixir|r. |cRXP_WARN_Anything left is finished later|r
    .complete 95314,1 --Bottle of Whispering Elixir (1)
step
    #label Along136
    #loop
    .goto 1420/0,2610.38,1914.62,0
    .goto 1420/0,2610.38,1914.62,40,0
    .goto 1420/0,2601.79,1964.33,40,0
    .goto 1420/0,2611.28,1969.45,40,0
    .goto 1420/0,2608.57,1989.33,40,0
    .goto 1420/0,2600.89,2011.32,40,0
    .goto 1420/0,2609.93,2031.81,40,0
    .goto 1420/0,2593.21,2037.83,40,0
    .goto 1420/0,2612.19,2059.82,40,0
    .goto 1420/0,2646.08,2042.65,40,0
    >>Kill the |cRXP_ENEMY_Whispering Horror|r (elite) and loot |T134438:0|t[|cRXP_LOOT_Whispering Horror Residue|r]. Use it to start the quest. |cRXP_WARN_Bring a partner if you can; skip this step if you cannot kill it|r
    .collect 268812,1,95328 --Whispering Horror Residue (1)
    .accept 95328 >>Accept Whispering Horror Residue
    .use 268812
    .mob Whispering Horror
step
    #loop
    .goto 1420/0,2597.27,1907.69,0
    .goto 1420/0,2597.27,1907.69,40,0
    .goto 1420/0,2643.82,1862.81,40,0
    .goto 1420/0,2643.82,1817.32,40,0
    .goto 1420/0,2576.94,1725.74,40,0
    .goto 1420/0,2579.20,1784.48,40,0
    .goto 1420/0,2573.78,1833.28,40,0
    .goto 1420/0,2497.86,1836.60,40,0
    .goto 1420/0,2449.51,1857.38,40,0
    .goto 1420/0,2521.81,1896.55,40,0
    >>Pick up |cRXP_PICK_Glowing Crystal Fragment|r from the ground
    >>Kill |cRXP_ENEMY_Shadowvale Lurchers|r and |cRXP_ENEMY_Shadowvale Mystics|r. Loot them for |cRXP_LOOT_Faintly Glowing Bone|r
    >>Open the |cRXP_PICK_Lumber Pile|r. Loot it for |cRXP_LOOT_Sturdy Lumber|r << Undead Paladin
    >>Open the |cRXP_PICK_Bottle|r. Loot it for |cRXP_LOOT_Bottle of Whispering Elixir|r
    .complete 99153,1 --Glowing Crystal Fragment (1)
    .complete 99152,1 --Faintly Glowing Bone (6)
    .complete 91316,1 << Undead Paladin --Sturdy Lumber (1)
    .complete 95314,1 --Bottle of Whispering Elixir (1)
    .mob Shadowvale Lurcher
    .mob Shadowvale Mystic
step
    .goto 1420/0,2041.47,2423.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hilda the Breaker|r
    .turnin 99152 >>Turn in As Above, So Below
    .target Hilda the Breaker
step
    .goto 1420/0,2119.64,2435.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ephram Barbaro|r
    .turnin 99153 >>Turn in The One That Got Away
    .target Ephram Barbaro
step << Undead Paladin
    .goto 1420/0,2009.38,2489.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jorin Croge|r
    .turnin 91316 >>Turn in Making Repairs
    .target Jorin Croge
step << Undead Paladin
    .goto 1420/0,2036.50,2490.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Danitha Morr|r
    .turnin 91317 >>Turn in The Tarnished
    .accept 95803 >>Accept A Token of Good Faith
    .accept 94427 >>Accept A Lesson in Divinity
    .target Danitha Morr
step
    #completewith next
    .hs >>Hearth to Brill. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
    .subzoneskip 159
step
    .goto 1420/0,347.84,2265.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carolai Anise|r
    .turnin 95314 >>Turn in That Shadowvale Green Elixir
    .target Carolai Anise
step
    #completewith next
    .goto 1420/0,235.32,1883.89
    .zone 1458 >>Go into the Ruins of Lordaeron and take a lift down into the Undercity
    .zoneskip 1458
step
    .goto 1458/0,66.65,1766.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bethor Iceshard|r
    .turnin 357 >>Turn in The Lich's Identity
    .accept 366 >>Accept Return the Book
    .target Bethor Iceshard
step << Undead Mage/Troll Mage
    .goto 1458/0,56.38,1813.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Anastasia Hartwell|r
    .turnin 1882 >>Turn in The Balnir Farmstead
    .target Anastasia Hartwell
step << Undead Paladin
    .goto 1458/0,243.84,1636.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tanis Alderwood|r
    >>|cRXP_WARN_She wants 10|r |T132889:0|t[Linen Cloth]|cRXP_WARN_. The auction house is next to her if you are short|r
    .turnin 94427 >>Turn in A Lesson in Divinity
    .accept 94434 >>Accept A Lesson in Divinity
    .turnin 94434 >>Turn in A Lesson in Divinity
    .accept 94435 >>Accept A Lesson in Divinity
    .target Tanis Alderwood
step
    .goto 1458/0,401.76,1784.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Father Lankester|r
    .turnin 95328 >>Turn in Whispering Horror Residue
    .target Father Lankester
    .isOnQuest 95328
step << Undead Paladin
    .goto 1458/0,316.28,1290.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lady Sylvanas Windrunner|r
    .turnin 95803 >>Turn in A Token of Good Faith
    .target Lady Sylvanas Windrunner
step
    #completewith next
    .goto 1420/0,235.32,1883.89
    .zone 1420 >>Take a lift back up and leave the Undercity
    .zoneskip 1420
step << Undead Paladin
    .goto 1420/0,2036.50,2490.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Danitha Morr|r
    .turnin 94435 >>Turn in A Lesson in Divinity
    .accept 94436 >>Accept A Lesson in Divinity
    .target Danitha Morr
step << Undead Paladin
    .goto 1420/0,2041.47,2495.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Billmuth|r
    .turnin 94436 >>Turn in A Lesson in Divinity
    .accept 94438 >>Accept A Lesson in Divinity
    .target Deathguard Billmuth
step << Undead Paladin
    .goto 1420/0,-883.52,2400.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Falgan|r
    >>Use the |T133439:0|t[Symbol of Life] on |cRXP_FRIENDLY_Deathguard Falgan|r to resurrect him, then talk to him
    .use 6866
    .turnin 94438 >>Turn in A Lesson in Divinity
    .accept 94440 >>Accept A Lesson in Divinity
    .target Deathguard Falgan
step << Undead Paladin
    #loop
    .goto 1420/0,-879.00,2484.28,0
    .goto 1420/0,-879.00,2484.28,40,0
    .goto 1420/0,-890.30,2530.38,40,0
    .goto 1420/0,-917.86,2544.84,40,0
    .goto 1420/0,-935.94,2514.11,40,0
    .goto 1420/0,-953.11,2554.78,40,0
    .goto 1420/0,-913.79,2580.99,40,0
    .goto 1420/0,-855.50,2577.07,40,0
    .goto 1420/0,-822.97,2549.66,40,0
    .goto 1420/0,-843.75,2528.27,40,0
    >>Kill |cRXP_ENEMY_Scarlet Friars|r and |cRXP_ENEMY_Scarlet Zealots|r nearby. Loot them for the |cRXP_LOOT_Scarlet Crusade Attack Plans|r
    .complete 94440,1 --Scarlet Crusade Attack Plans (1)
    .mob Scarlet Friar
    .mob Scarlet Zealot
step << Undead Paladin
    .goto 1420/0,2041.47,2495.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Billmuth|r
    .turnin 94440 >>Turn in A Lesson in Divinity
    .accept 94441 >>Accept A Lesson in Divinity
    .target Deathguard Billmuth
step << Undead Paladin
    .goto 1420/0,2036.50,2490.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Danitha Morr|r
    .turnin 94441 >>Turn in A Lesson in Divinity
    .target Danitha Morr
step
    #completewith next
    .goto 1420/0,235.32,1883.89
    .zone 1458 >>Go into the Ruins of Lordaeron and take a lift down into the Undercity
    .zoneskip 1458
step
    .goto 1458/0,400.60,1768.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aelthalyste|r
    .accept 5658 >>Accept Touch of Weakness << Undead Priest
    .accept 5657 >>Accept Hex of Weakness << Troll Priest
    .target Aelthalyste
step << Undead Priest
    .goto 1458/0,400.60,1768.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aelthalyste|r
    >>|cRXP_WARN_The database has no objectives for Touch of Weakness. Skip this step if the quest is not finished|r
    .turnin 5658 >>Turn in Touch of Weakness
    .target Aelthalyste
    .isOnQuest 5658
step << Priest
    .goto 1458/0,403.29,1760.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aelthalyste|r
    .target Aelthalyste
    .train 2652,1
step << Priest
    .goto 1458/0,201.05,1686.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Victor|r
    .train 3908 >> Train |T136249:0|t[Tailoring]
    .target Victor Ward
step << Priest
    .goto 1458/0,201.05,1686.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Victor|r
    .train 7623 >> Train |T132662:0|t[Brown Linen Robe]
    .target Victor Ward
step << Undead Priest
    .goto 1458/0,403.29,1760.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aelthalyste|r
    .target Aelthalyste
    .train 2652,1
step << Undead
    .goto 1458/0,283.27,1610.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gordon Wendham|r
    .accept 6322 >>Accept Michael Garrett
    .target Gordon Wendham
    .isQuestTurnedIn 6323 --any of: Ride to the Undercity
    .xp <10,1
step << Undead
    .goto 1458/0,266.39,1567.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Michael Garrett|r
    .turnin 6322 >>Turn in Michael Garrett
    .target Michael Garrett
    .isOnQuest 6322
step << Undead Warrior
    .goto 1458/0,418.35,1767.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baltus Fowler|r
    .train 285 >> Train your class spells
    .target Baltus Fowler
    .xp <16,1
step << Rogue/Warrior
    .goto 1458/0,171.03,1524.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to|r |cRXP_FRIENDLY_Mary|r in the Rogues' Quarter
    .train 3273 >>Train |T135966:0|t[First Aid]
    .target Mary Edras
step << Rogue/Warrior
    .goto 1458/0,171.03,1524.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to|r |cRXP_FRIENDLY_Mary|r in the Rogues' Quarter
    .train 3276 >> Train |T133688:0|t[Heavy Linen Bandage]
    .target Mary Edras
step << Rogue/Warrior
    .goto 1458/0,171.03,1524.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to|r |cRXP_FRIENDLY_Mary|r in the Rogues' Quarter
    .train 3274 >> Train Journeyman First Aid
    .target Mary Edras
step << Undead
    .goto 1458/0,266.39,1567.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Michael Garrett|r
    .accept 6324 >>Accept Return to Podrig
    .target Michael Garrett
    .isQuestTurnedIn 6322 --any of: Michael Garrett
    .xp <10,1
step
    #completewith next
    .goto 1420/0,235.32,1883.89
    .zone 1420 >>Take a lift back up and leave the Undercity
    .zoneskip 1420
step
    #loop
    .goto 1420/0,155.79,2063.74,0
    .goto 1420/0,155.79,2063.74,40,0
    .goto 1420/0,165.28,2133.93,40,0
    .goto 1420/0,214.54,2162.85,40,0
    .goto 1420/0,243.01,2199.30,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Terrence|r. |cRXP_WARN_This NPC walks a patrol route|r
    .accept 96895 >>Accept The Argent Emissary
    .unitscan Deathguard Terrence
step << Warrior
    .goto 1420/0,238.49,2254.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Austil de Mon|r
    .accept 1818 >>Accept Speak with Dillinger
    .target Austil de Mon
step << Warrior
    .goto 1420/0,403.42,2287.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Dillinger|r
    .turnin 1818 >>Turn in Speak with Dillinger
    .accept 1819 >>Accept Ulag the Cleaver
    .target Deathguard Dillinger
step << Warrior
    .goto 1420/0,346.03,2383.06
    >>Kill |cRXP_ENEMY_Ulag the Cleaver|r
    .complete 1819,1 --Ulag the Cleaver slain (1)
    .mob Ulag the Cleaver
step << Warrior
    .goto 1420/0,403.42,2287.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Dillinger|r
    .turnin 1819 >>Turn in Ulag the Cleaver
    .accept 1820 >>Accept Speak with Coleman
    .target Deathguard Dillinger
step << Warlock
    .goto 1420/0,248.88,2250.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ageron Kargal|r
    .accept 1478 >>Accept Halgar's Summons
    .target Ageron Kargal
step << Undead Rogue
    .goto 1420/0,243.01,2271.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marion Call|r
    .accept 1885 >>Accept Mennet Carkad
    .target Marion Call
step
    .goto 1420/0,346.94,2258.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Johaan|r
    >>|cRXP_WARN_This one is handed in at the Sepulcher in Silverpine Forest. It rides along until you head there|r
    .accept 445 >>Accept Delivery to Silverpine Forest
    .target Apothecary Johaan
step << Warrior
    .goto 1420/0,244.36,2262.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Coleman Farthing|r
    .turnin 1820 >>Turn in Speak with Coleman
    .accept 1821 >>Accept Agamand Heirlooms
    .target Coleman Farthing
step << Priest
    .goto 1420/0,251.14,2265.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Beryl|r on the second floor
    .train 588 >>Train |T135926:0|t[Inner Fire]
    .target Dark Cleric Beryl
    .xp <12,1
step << Mage
    .goto 1420/0,233.06,2256.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cain|r on the second floor
    .train 145 >> Train |T135812:0|t[Fireball Rank 3]
    .target Cain Firesong
    .xp <12,1
step << Warrior
    .goto 1420/0,238.49,2255.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Austil|r
    .train 7384 >>Train |T132223:0|t[Overpower]
    .target Austil de Mon
    .xp <12,1
step << Rogue
    .goto 1420/0,243.01,2271.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marion|r on the second floor
    .train 1766 >> Train |T132219:0|t[Kick]
    .target Marion Call
    .xp <12,1
step << Warlock
    .goto 1420/0,250.24,2259.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rupert|r
    .train 755 >> Train |T136168:0|t[Health Funnel]
    .target Rupert Boch
    .xp <12,1
step << !Mage
    .goto 1420/0,244.81,2269.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Renee|r
    >>|cRXP_BUY_Buy|r |T132815:0|t[Ice Cold Milk] |cRXP_BUY_from her|r << Mage/Priest/Shaman
    >>|cRXP_BUY_Buy|r |T134532:0|t[Red-speckled Mushroom] |cRXP_BUY_from her|r << Warrior/Rogue
    >>|cRXP_BUY_Buy|r |T132815:0|t[Ice Cold Milk] |cRXP_BUY_and|r |T134532:0|t[Red-speckled Mushroom] |cRXP_BUY_from her|r << Warlock/Hunter
    .vendor >> Vendor Trash
    .collect 1179,20,96897,1 << Mage/Priest/Shaman
    .collect 4605,20,96897,1 << Rogue/Warrior
    .collect 1179,15,96897,1 << Warlock/Hunter
    .collect 4605,15,96897,1 << Warlock/Hunter
    .money <0.050 << !Warlock !Hunter
    .money <0.075 << Warlock/Hunter
    .target Innkeeper Renee
step
    .goto 1420/0,74.00,2022.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Linnea|r
    .accept 356 >>Accept Rear Guard Patrol
    .target Deathguard Linnea
step
    .goto 1420/0,56.38,1996.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hadric Harlson|r
    .turnin 96895 >>Turn in The Argent Emissary
    .accept 96897 >>Accept The Cult of the Damned
    .accept 96898 >>Accept Remnants of War
    .target Hadric Harlson
step
    #loop
    .goto 1420/0,49.15,2027.29,0
    .goto 1420/0,49.15,2027.29,40,0
    .goto 1420/0,-76.92,2038.74,40,0
    .goto 1420/0,-172.27,1929.38,40,0
    .goto 1420/0,-158.26,1802.86,40,0
    .goto 1420/0,-88.67,1829.07,40,0
    .goto 1420/0,-16.82,1820.63,40,0
    .goto 1420/0,-49.81,1911.01,40,0
    .goto 1420/0,18.42,1952.88,40,0
    .goto 1420/0,127.33,1943.54,40,0
    >>Kill |cRXP_ENEMY_Dark Neophytes|r and |cRXP_ENEMY_Dark Enforcers|r. |cRXP_WARN_They hit hard; Enforcers have an instant 50-70 damage ability|r
    >>Kill |cRXP_ENEMY_Dark Neophytes|r
    >>Kill |cRXP_ENEMY_Dark Neophytes|r and |cRXP_ENEMY_Dark Enforcers|r. Loot them for |cRXP_LOOT_Necrotic Crystal Fragment|r. It can also be picked up from |cRXP_PICK_Naxxramas Crystal Fragment|r on the ground
    .complete 96897,2 --Dark Enforcer slain (8)
    .complete 96897,1 --Dark Neophyte slain (8)
    .complete 96898,1 --Necrotic Crystal Fragment (12)
    .mob Dark Enforcer
    .mob Dark Neophyte
step
    #loop
    .goto 1420/0,-317.77,1945.95,0
    .goto 1420/0,-317.77,1945.95,40,0
    .goto 1420/0,-349.85,1980.59,40,0
    .goto 1420/0,-407.24,1997.46,40,0
    .goto 1420/0,-438.87,1946.25,40,0
    .goto 1420/0,-488.58,1991.14,40,0
    .goto 1420/0,-512.08,2048.68,40,0
    .goto 1420/0,-423.51,2068.26,40,0
    .goto 1420/0,-366.12,2084.22,40,0
    .goto 1420/0,-336.75,2044.76,40,0
    >>Kill |cRXP_ENEMY_Bleeding Horrors|r
    >>Kill |cRXP_ENEMY_Wandering Spirits|r
    .complete 356,1 --Bleeding Horror slain (8)
    .complete 356,2 --Wandering Spirit slain (8)
    .mob Bleeding Horror
    .mob Wandering Spirit
step
    .goto 1420/0,56.38,1996.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hadric Harlson|r
    .turnin 96897 >>Turn in The Cult of the Damned
    .turnin 96898 >>Turn in Remnants of War
    .accept 96899 >>Accept Bandarion Keep
    .target Hadric Harlson
step << Horde !Hunter
    .goto 1458/0,266.39,1567.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Michael Garrett::4551|r
    .fp Undercity >> Get the Undercity flight path
    .target Michael Garrett::4551
step
    .goto 1420/0,74.00,2022.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Linnea|r
    .turnin 356 >>Turn in Rear Guard Patrol while you are here
    .isQuestComplete 356
    .target Deathguard Linnea
step
    .goto 1420/0,-48.45,2574.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gunther Arcanus|r
    .turnin 366 >>Turn in Return the Book
    .accept 409 >>Accept Proving Allegiance
    .target Gunther Arcanus
step
    .goto 1420/0,-46.65,2571.65
    >>Open the |cRXP_PICK_Crate of Candles|r next to Gunther. Loot a |cRXP_LOOT_Candle of Beckoning|r
    .collect 3080,1,409,1 --Candle of Beckoning (1)
step
    .goto 1420/0,22.04,2485.49
    >>Click |cRXP_PICK_Lillith's Dinner Table|r on the smaller island to summon |cRXP_ENEMY_Lillith Nefara|r, then kill her
    .complete 409,1 --Lillith Nefara slain (1)
    .mob Lillith Nefara
step
    .goto 1420/0,-48.45,2574.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gunther Arcanus|r
    .turnin 409 >>Turn in Proving Allegiance
    .accept 411 >>Accept The Prodigal Lich Returns
    .target Gunther Arcanus
step
    .goto 1420/0,-557.27,3076.84
    >>Kill |cRXP_ENEMY_Scarlet Bodyguards|r
    >>Kill |cRXP_ENEMY_Captain Melrache|r
    .complete 372,2 --Scarlet Bodyguard slain (2)
    .complete 372,1 --Captain Melrache slain (1)
    .mob Scarlet Bodyguard
    .mob Captain Melrache
step
    #loop
    .goto 1420/0,540.79,2934.95,0
    .goto 1420/0,540.79,2934.95,40,0
    .goto 1420/0,595.02,2939.17,40,0
    .goto 1420/0,689.46,2971.10,40,0
    .goto 1420/0,689.46,2889.16,40,0
    .goto 1420/0,837.22,2874.10,40,0
    .goto 1420/0,784.80,2925.92,40,0
    .goto 1420/0,786.16,2976.23,40,0
    .goto 1420/0,656.92,3060.88,40,0
    .goto 1420/0,614.90,2994.00,40,0
    >>Kill |cRXP_ENEMY_Wailing Ancestors|r
    >>Open the |cRXP_PICK_Agamand Weapon Rack|r. Loot it for |cRXP_LOOT_Agamand Family Mace|r << Warrior
    >>Kill |cRXP_ENEMY_Captain Dargol|r and loot |cRXP_LOOT_Dargol's Skull|r
    >>Open the |cRXP_PICK_Agamand Weapon Rack|r. Loot it for |cRXP_LOOT_Agamand Family Sword|r << Warrior
    >>Open the |cRXP_PICK_Agamand Weapon Rack|r. Loot it for |cRXP_LOOT_Agamand Family Axe|r << Warrior
    >>Open the |cRXP_PICK_Agamand Weapon Rack|r. Loot it for |cRXP_LOOT_Agamand Family Dagger|r << Warrior
    >>Kill |cRXP_ENEMY_Rotting Ancestors|r
    .complete 408,1 --Wailing Ancestor slain (8)
    .complete 1821,3 << Warrior --Agamand Family Mace (1)
    .complete 408,3 --Dargol's Skull (1)
    .complete 1821,4 << Warrior --Agamand Family Sword (1)
    .complete 1821,1 << Warrior --Agamand Family Axe (1)
    .complete 1821,2 << Warrior --Agamand Family Dagger (1)
    .complete 408,2 --Rotting Ancestor slain (8)
    .mob Wailing Ancestor
    .mob Captain Dargol
    .mob Rotting Ancestor
step
    .goto 1420/0,2040.56,2485.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Leonid Barthalomew the Revered|r
    >>|cRXP_WARN_Wait for Danitha Morr and Leonid to finish talking, then hand it in|r
    .turnin 96899 >>Turn in Bandarion Keep
    .accept 96896 >>Accept A Righteous Cause
    .turnin 96896 >>Turn in A Righteous Cause
    .accept 98545 >>Accept Leonid's Letter
    .target Leonid Barthalomew the Revered
step << Warrior
    #completewith next
    .hs >>Hearth to Brill. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
    .subzoneskip 159
step << Warrior
    .goto 1420/0,244.36,2262.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Coleman Farthing|r
    .turnin 1821 >>Turn in Agamand Heirlooms
    .accept 1822 >>Accept Heirloom Weapon
    .turnin 1822 >>Turn in Heirloom Weapon
    .target Coleman Farthing
step
    .goto 1420/0,295.42,2278.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Zygand|r
    .turnin 372 >>Turn in At War With The Scarlet Crusade while you are here
    .isQuestComplete 372
    .target Executor Zygand
step
    #completewith next
    .hs >>Hearth to Brill. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
    .subzoneskip 159
step
    .goto 1420/0,265.15,2305.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Sevren|r
    .turnin 408 >>Turn in The Family Crypt
    .target Magistrate Sevren
step
    .goto 1420/0,295.42,2278.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Zygand|r
    .turnin 372 >>Turn in At War With The Scarlet Crusade
    .target Executor Zygand
step
    #completewith next
    .goto 1420/0,235.32,1883.89
    .zone 1458 >>Go into the Ruins of Lordaeron and take a lift down into the Undercity
    .zoneskip 1458
step
    .goto 1458/0,392.16,1442.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Zinge|r
    .turnin 1359 >>Turn in Zinge's Delivery
    .target Apothecary Zinge
    .isOnQuest 1359
step
    .goto 1458/0,392.16,1442.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Zinge|r
    .accept 1358 >>Accept Sample for Helbrim
    .target Apothecary Zinge
    .isQuestTurnedIn 1359 --any of: Zinge's Delivery
    .xp <10,1
step
    .goto 1458/0,404.83,1434.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Apothecary Faranell|r
    .turnin 447 >>Turn in A Recipe For Death
    .target Master Apothecary Faranell
    .isQuestComplete 447
step
    .goto 1458/0,404.83,1434.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Apothecary Faranell|r
    .accept 450 >>Accept A Recipe For Death
    .target Master Apothecary Faranell
    .isQuestTurnedIn 447 --any of: A Recipe For Death
    .xp <9,1
step
    .goto 1458/0,202.88,1577.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Glix Xizzix|r
    .turnin 98545 >>Turn in Leonid's Letter
    .target Glix Xizzix
step
    .goto 1458/0,66.65,1766.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bethor Iceshard|r
    .turnin 411 >>Turn in The Prodigal Lich Returns
    .target Bethor Iceshard
step << Warlock
    .goto 1458/0,57.15,1711.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carendin Halgar|r
    .turnin 1478 >>Turn in Halgar's Summons while you are here
    .isQuestComplete 1478
    .target Carendin Halgar
step
    #completewith next
    .goto 1420/0,235.32,1883.89
    .zone 1420 >>Take a lift back up and leave the Undercity
    .zoneskip 1420
step
    .goto 1420/0,74.00,2022.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Linnea|r
    .turnin 356 >>Turn in Rear Guard Patrol
    .accept 99156 >>Accept Rear Guard Patrol
    .target Deathguard Linnea
step << !Undead
    .goto 1458/0,266.39,1567.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Michael|r
    .fp Undercity >> Get the Undercity flight path
    .target Michael Garrett
step
    #loop
    .goto 1420/0,-606.07,2463.80,0
    .goto 1420/0,-606.07,2463.80,40,0
    .goto 1420/0,-681.53,2447.83,40,0
    .goto 1420/0,-715.87,2517.72,40,0
    .goto 1420/0,-766.94,2562.01,40,0
    .goto 1420/0,-766.48,2648.47,40,0
    .goto 1420/0,-710.45,2570.14,40,0
    .goto 1420/0,-680.18,2591.53,40,0
    .goto 1420/0,-639.05,2609.60,40,0
    .goto 1420/0,-665.72,2495.73,40,0
    >>Kill |cRXP_ENEMY_Riptear|r and loot |cRXP_LOOT_Riptear's Heart|r
    >>|cRXP_WARN_Riptear is level 13|r
    .complete 99156,1 --Riptear's Heart (1)
    .mob Riptear
step
    .goto 1420/0,74.00,2022.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Linnea|r
    .turnin 99156 >>Turn in Rear Guard Patrol
    .target Deathguard Linnea
step
    #completewith next
    .goto 1420/0,235.32,1883.89
    .zone 1458 >>Go into the Ruins of Lordaeron and take a lift down into the Undercity
    .zoneskip 1458
step << Warlock
    .goto 1458/0,57.15,1711.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carendin Halgar|r
    .turnin 1478 >>Turn in Halgar's Summons
    .target Carendin Halgar
step << Undead Rogue
    .goto 1458/0,72.02,1435.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mennet Carkad|r
    .turnin 1885 >>Turn in Mennet Carkad
    .accept 1886 >>Accept The Deathstalkers
    .target Mennet Carkad
step << Rogue
    .goto 1458/0,323.57,1668.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_Talk to|r |cRXP_FRIENDLY_Archibald|r in the War Quarter
    .train 201 >>Train 1h Swords
    .target Archibald
    .money <0.1
step << Undead Rogue
    .goto 1458/0,72.02,1435.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mennet Carkad|r
    .turnin 1886 >>Turn in The Deathstalkers
    .target Mennet Carkad
    .isQuestComplete 1886
step << Undead Warlock
    .goto 1458/0,57.15,1711.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carendin Halgar|r
    .accept 1473 >>Accept Creature of the Void
    .target Carendin Halgar
step
    #completewith next
    .goto 1420/0,235.32,1883.89
    .zone 1420 >>Take a lift back up and leave the Undercity
    .zoneskip 1420
step << Undead Warlock
    .goto 1420/0,726.06,1801.95
    >>Open the |cRXP_PICK_Perrine's Chest|r. Loot it for |cRXP_LOOT_Egalin's Grimoire|r
    .complete 1473,1 --Egalin's Grimoire (1)
step
    #completewith next
    .goto 1420/0,235.32,1883.89
    .zone 1458 >>Go into the Ruins of Lordaeron and take a lift down into the Undercity
    .zoneskip 1458
step << Undead Warlock
    .goto 1458/0,57.15,1711.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carendin Halgar|r
    .turnin 1473 >>Turn in Creature of the Void
    .accept 1471 >>Accept The Binding
    .target Carendin Halgar
step << Undead Warlock
    .goto 1458/0,57.15,1711.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carendin Halgar|r
    .turnin 1471 >>Turn in The Binding
    .target Carendin Halgar
    .isQuestComplete 1471
step << Priest
    .goto 1458/0,273.87,1482.360
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lavinia|r
    .train 7411 >> Train |T136244:0|t[Enchanting]
    .target Lavinia Crowe
step << Priest
    .goto 1458/0,194.24,1681.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Josef|r
    .train 3908 >> Train |T136249:0|t[Tailoring]
    .target Josef Gregorian
step << Priest
    .goto 1458/0,194.34,1681.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Josef|r
    .train 7623 >> Train |T132662:0|t[Brown Linen Robe]
    .target Josef Gregorian
step << Priest
    .goto 1458/0,273.2,1491.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Malcomb|r
    .train 14293 >> Train |T135139:0|t[Lesser Magic Wand]
    .target Malcomb Wynn
step << Rogue
    .goto 1458/0,68.66,1416.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carolyn|r
    .train 1766 >> Train |T132219:0|t[Kick]
    .target Carolyn Ward
    .xp <12,1
    .money <0.08
step << Mage
    .goto 1458/0,56.38,1813.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Anastasia|r
    .train 145 >> Train |T135812:0|t[Fireball Rank 3]
    .target Anastasia Hartwell
    .xp <12,1
    .money <0.08
step << Warlock
    .goto 1458/0,20.02,1776.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Richard|r
    .train 755 >> Train |T136168:0|t[Health Funnel]
    .target Richard Kerwin
    .xp <12,1
    .money <0.08
step << Priest
    .goto 1458/0,416.91,1757.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lazarus|r
    .train 588 >>Train |T135926:0|t[Inner Fire]
    .target Father Lazarus
    .xp <12,1
    .money <0.08
step << Warrior
    .goto 1458/0,418.35,1767.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baltus Fowler|r
    .train 7384 >>Train |T132223:0|t[Overpower]
    .target Baltus Fowler
    .xp <12,1
    .money <0.08
step << Undead Rogue
    .goto 1458/0,72.02,1435.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mennet Carkad|r
    .accept 1898 >>Accept The Deathstalkers
    .target Mennet Carkad
    .isQuestTurnedIn 1886 --any of: The Deathstalkers
    .xp <10,1
step << Undead Rogue
    .goto 1458/0,68.66,1416.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carolyn|r
    .train 1758 >> Train your class spells
    .target Carolyn Ward
    .xp <14,1
    .xp >16,1
    .isOnQuest 1898 << Undead
step << Undead Rogue
    .goto 1458/0,68.66,1416.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carolyn|r
    .train 6761 >> Train your class spells
    .target Carolyn Ward
    .xp <16,1
    .isOnQuest 1898 << Undead
step << Undead Rogue
    .goto 1458/0,68.66,1416.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carolyn|r
    .train 1758 >> Train your class spells
    .target Carolyn Ward
    .xp <14,1
    .xp >16,1
step << Undead Rogue
    .goto 1458/0,68.66,1416.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carolyn|r
    .train 6761 >> Train your class spells
    .target Carolyn Ward
    .xp <16,1
step << Undead Rogue
    .goto 1458/0,347.36,1389.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Andron Gant|r
    .turnin 1898 >>Turn in The Deathstalkers
    .target Andron Gant
    .isOnQuest 1898
step << Undead Rogue
    .goto 1458/0,347.36,1389.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Andron Gant|r
    .accept 1899 >>Accept The Deathstalkers
    .target Andron Gant
    .isQuestTurnedIn 1898 --any of: The Deathstalkers
    .xp <10,1
step << Undead Rogue
    .goto 1458/0,341.70,1385.32
    >>Open the |cRXP_PICK_Andron's Bookshelf|r. Loot it for |cRXP_LOOT_Andron's Ledger|r
    .complete 1899,1 --Andron's Ledger (1)
    .isOnQuest 1899
step << Undead Rogue
    .goto 1458/0,72.02,1435.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mennet Carkad|r
    .turnin 1899 >>Turn in The Deathstalkers
    .target Mennet Carkad
    .isOnQuest 1899
step << Undead Rogue
    .goto 1458/0,72.02,1435.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mennet Carkad|r
    .accept 1978 >>Accept The Deathstalkers
    .target Mennet Carkad
    .isQuestTurnedIn 1899 --any of: The Deathstalkers
    .xp <10,1
step << Undead Rogue
    .goto 1458/0,333.54,1287.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Varimathras|r
    .turnin 1978 >>Turn in The Deathstalkers
    .target Varimathras
    .isOnQuest 1978
step << !Rogue !Warrior
    .goto 1458/0,171.03,1524.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to|r |cRXP_FRIENDLY_Mary|r in the Rogues' Quarter
    .train 3276 >> Train |T133688:0|t[Heavy Linen Bandage]
    .target Mary Edras
step << !Rogue !Warrior
    .goto 1458/0,171.03,1524.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to|r |cRXP_FRIENDLY_Mary|r in the Rogues' Quarter
    .train 3274 >> Train Journeyman First Aid
    .target Mary Edras
step << Mage
    .goto 1458/0,56.38,1813.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Anastasia|r
    .train 2137 >> Train your class spells
    .target Anastasia Hartwell
    .xp <14,1
    .xp >16,1
step << Mage
    .goto 1458/0,56.38,1813.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Anastasia|r
    .train 2120 >> Train your class spells
    .target Anastasia Hartwell
    .xp <16,1
step << Undead Warlock
    .goto 1458/0,20.02,1776.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Richard|r
    .train 6222 >> Train your class spells
    .target Richard Kerwin
    .xp <14,1
    .xp >16,1
step << Undead Warlock
    .goto 1458/0,20.02,1776.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Richard|r
    .train 1455 >> Train your class spells
    .target Richard Kerwin
    .xp <16,1
step << Paladin
    .goto 1458/0,418.500,1782.600
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garen|r
    .train 647 >>Train your class spells
    .target Garen Largo
    .xp <14,1
    .xp >16,1
step << Paladin
    .goto 1458/0,418.500,1782.600
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garen|r
    .train 7294 >>Train your class spells
    .target Garen Largo
    .xp <16,1
step
    +|cRXP_WARN_That is all of Tirisfal Glades for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Orgrimmar|r: Hex of Weakness << Troll Priest
    >>|cRXP_FRIENDLY_Silverpine Forest|r: Delivery to Silverpine Forest, A Recipe For Death
    >>|cRXP_FRIENDLY_Silverpine Forest|r: Return to Podrig << Undead
    >>|cRXP_FRIENDLY_The Barrens|r: Sample for Helbrim
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: The Great Outdoors
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: The Binding << Undead Warlock
    >>|cRXP_FRIENDLY_Silverpine Forest and back here|r: The Deathstalkers << Undead Rogue
step << Undead Mage/Troll Mage
    .xp 16 >>|cRXP_WARN_The rest of Tirisfal Glades is planned from level 16.|r Come back to this guide then
step << Undead Mage/Troll Mage
    .goto 1420/0,233.06,2256.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cain Firesong|r
    .accept 1959 >>Accept Report to Anastasia
    .target Cain Firesong
step
    #completewith next
    .goto 1420/0,235.32,1883.89
    .zone 1458 >>Go into the Ruins of Lordaeron and take a lift down into the Undercity
    .zoneskip 1458
step << Undead Mage/Troll Mage
    .goto 1458/0,194.34,1681.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Josef Gregorian|r
    .accept 1962 >>Accept Spellfire Robes
    .target Josef Gregorian
    .isQuestTurnedIn 1961 --any of: Gathering Materials
    .xp <15,1
step << Undead Mage/Troll Mage
    .goto 1458/0,194.34,1681.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Josef Gregorian|r
    .turnin 1962 >>Turn in Spellfire Robes
    .target Josef Gregorian
    .isOnQuest 1962
step << Undead Mage/Troll Mage
    .goto 1458/0,56.38,1813.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Anastasia Hartwell|r
    .turnin 1959 >>Turn in Report to Anastasia
    .target Anastasia Hartwell
step << Orc Mage/Undead Mage/Troll Mage
    .goto 1458/0,56.38,1813.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Anastasia Hartwell|r
    .accept 1961 >>Accept Gathering Materials
    .target Anastasia Hartwell
    .isQuestTurnedIn 1960 --any of: Investigate the Alchemist Shop
    .xp <15,1
step
    #completewith next
    .goto 1420/0,235.32,1883.89
    .zone 1420 >>Take a lift back up and leave the Undercity
    .zoneskip 1420
step
    .goto 1420/0,447.25,2166.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eleanor Shackleton|r
    .turnin 96607 >>Turn in The Great Outdoors
    .target Eleanor Shackleton
    .isQuestComplete 96607
step << Orc Mage/Undead Mage/Troll Mage
    .goto 1420/0,788.42,2762.64
    >>Loot the |cRXP_PICK_Battered Chests|r for |cRXP_LOOT_Linen Cloth|r
    .complete 1961,1 --Linen Cloth (10)
    .isOnQuest 1961
step
    #completewith next
    .goto 1420/0,235.32,1883.89
    .zone 1458 >>Go into the Ruins of Lordaeron and take a lift down into the Undercity
    .zoneskip 1458
step << Undead Rogue
    .goto 1458/0,72.02,1435.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mennet Carkad|r
    .turnin 1886 >>Turn in The Deathstalkers
    .target Mennet Carkad
    .isQuestComplete 1886
step << Undead Priest
    .goto 1458/0,400.60,1768.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aelthalyste|r
    .turnin 5658 >>Turn in Touch of Weakness
    .target Aelthalyste
    .isOnQuest 5658
step << Undead Warlock
    .goto 1458/0,57.15,1711.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carendin Halgar|r
    .turnin 1471 >>Turn in The Binding
    .target Carendin Halgar
    .isQuestComplete 1471
step << Orc Mage/Undead Mage/Troll Mage
    .goto 1458/0,194.34,1681.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Josef Gregorian|r
    .turnin 1961 >>Turn in Gathering Materials
    .target Josef Gregorian
    .isQuestComplete 1961
step
    +|cRXP_WARN_End of the Tirisfal Glades route.|r
]])
