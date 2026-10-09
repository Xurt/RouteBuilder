-- 1-13 Tirisfal Glades: Zone Routes (Undead Paladin).
-- Made by RouteBuilder from QuestieDB's Forever data (local copy, 2026-10-06; QuestieDB is GPL-3.0).
-- The order was tuned for one character. Steps for other classes and races are left out.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- Edit zones/Tirisfal Glades.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Undead Paladin)
#name 1-13 Tirisfal Glades

step << Undead
    .goto 1420/0,1667.77,1679.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Undertaker Mordo|r
    .accept 363 >>Accept Rude Awakening
    .target Undertaker Mordo
step
    .goto 1420/0,1639.75,1843.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shadow Priest Sarvis|r
    .turnin 363 >>Turn in Rude Awakening << Undead
    .accept 364 >>Accept The Mindless Ones
    .target Shadow Priest Sarvis
step
    #loop
    .goto 1420/0,1601.34,1905.28,0
    .goto 1420/0,1601.34,1905.28,40,0
    .goto 1420/0,1548.02,1923.06,40,0
    .goto 1420/0,1528.14,1858.29,40,0
    .goto 1420/0,1455.39,1886.91,40,0
    .goto 1420/0,1455.39,1945.65,40,0
    .goto 1420/0,1477.98,2008.61,40,0
    .goto 1420/0,1581.91,2013.73,40,0
    .goto 1420/0,1641.56,1983.31,40,0
    .goto 1420/0,1662.80,1930.29,40,0
    >>Kill |cRXP_ENEMY_Wretched Zombies|r
    >>Kill |cRXP_ENEMY_Mindless Zombies|r
    .complete 364,2 --Wretched Zombie slain (8)
    .complete 364,1 --Mindless Zombie slain (8)
    .mob Wretched Zombie
    .mob Mindless Zombie
step
    .goto 1420/0,1639.75,1843.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shadow Priest Sarvis|r
    .turnin 364 >>Turn in The Mindless Ones
    .accept 98601 >>Accept A Difficult Path << Undead Paladin
    .accept 3901 >>Accept Rattling the Rattlecages
    .target Shadow Priest Sarvis
step
    .xp 2 >>Grind to level 2 (The Damned needs it)
step
    .goto 1420/0,1638.85,1847.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Novice Elreth|r
    .accept 376 >>Accept The Damned
    .target Novice Elreth
step
    #loop
    .goto 1420/0,1704.82,1859.19,0
    .goto 1420/0,1704.82,1859.19,40,0
    .goto 1420/0,1687.20,1921.55,40,0
    .goto 1420/0,1636.59,1965.23,40,0
    .goto 1420/0,1702.11,1998.67,40,0
    .goto 1420/0,1778.02,1922.75,40,0
    .goto 1420/0,1774.86,1806.47,40,0
    .goto 1420/0,1740.52,1756.77,40,0
    .goto 1420/0,1706.18,1654.04,40,0
    .goto 1420/0,1646.98,1750.14,40,0
    >>Kill |cRXP_ENEMY_Duskbats|r and |cRXP_ENEMY_Mangy Duskbats|r. Loot them for |cRXP_LOOT_Duskbat Wing|r
    >>Kill |cRXP_ENEMY_Young Scavengers|r and |cRXP_ENEMY_Ragged Scavengers|r. Loot them for |cRXP_LOOT_Scavenger Paw|r
    .complete 376,2 --Duskbat Wing (6)
    .complete 376,1 --Scavenger Paw (6)
    .mob Duskbat
    .mob Mangy Duskbat
    .mob Young Scavenger
    .mob Ragged Scavenger
step
    .goto 1420/0,1638.85,1847.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Novice Elreth|r
    .turnin 376 >>Turn in The Damned
    .target Novice Elreth
step
    .goto 1420/0,1628.45,1839.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aramis Hammerhand|r
    .turnin 98601 >>Turn in A Difficult Path << Undead Paladin
    .accept 98389 >>Accept A Light in the Darkness
    .accept 90902 >>Accept Rediscovering the Light << Undead Paladin
    .target Aramis Hammerhand
step
    .goto 1420/0,1604.96,1861.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Saltain|r
    .accept 3902 >>Accept Scavenging Deathknell
    .target Deathguard Saltain
step
    #completewith Along10
    >>As you go: Open the |cRXP_PICK_Equipment Boxes|r. Loot it for |cRXP_LOOT_Scavenged Goods|r. |cRXP_WARN_Anything left is finished later|r
    .complete 3902,1 --Scavenged Goods (1)
step
    .goto 1420/0,1580.56,1848.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Arren|r
    .accept 380 >>Accept Night Web's Hollow
    .target Executor Arren
step
    .goto 1420/0,1638.85,1847.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Novice Elreth|r
    .accept 6395 >>Accept Marla's Last Wish
    .target Novice Elreth
    .xp <3,1
step
    #label Along10
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
    >>Kill |cRXP_ENEMY_Rattlecage Skeletons|r
    .complete 3901,1 --Rattlecage Skeleton slain (12)
    .mob Rattlecage Skeleton
step
    #loop
    .goto 1420/0,1704.82,2047.47,0
    .goto 1420/0,1704.82,2047.47,40,0
    .goto 1420/0,1745.49,2057.71,40,0
    .goto 1420/0,1770.79,2016.14,40,0
    .goto 1420/0,1808.75,2054.70,40,0
    .goto 1420/0,1753.62,2107.42,40,0
    .goto 1420/0,1811.01,2131.52,40,0
    .goto 1420/0,1773.05,2175.50,40,0
    .goto 1420/0,1707.08,2162.55,40,0
    .goto 1420/0,1651.95,2136.34,40,0
    >>Kill |cRXP_ENEMY_Young Night Web Spiders|r
    .complete 380,1 --Young Night Web Spider slain (10)
    .mob Young Night Web Spider
step
    #loop
    .goto 1420/0,1811.92,2048.98,0
    .goto 1420/0,1811.92,2048.98,40,0
    .goto 1420/0,1847.16,2040.24,40,0
    .goto 1420/0,1910.88,2020.06,40,0
    .goto 1420/0,1927.14,2010.72,40,0
    .goto 1420/0,1950.19,2011.62,40,0
    .goto 1420/0,1982.27,2031.81,40,0
    .goto 1420/0,1946.12,2087.24,40,0
    .goto 1420/0,1913.14,2048.07,40,0
    .goto 1420/0,1875.63,2046.87,40,0
    >>Kill |cRXP_ENEMY_Night Web Spiders|r
    >>Attack the |cRXP_ENEMY_Webbed Forsaken|r cocoons inside Night Web's Hollow to free them
    .complete 380,2 --Night Web Spider slain (8)
    .complete 98389,1 --Webbed Forsaken freed (6)
    .mob Night Web Spider
    .mob Webbed Forsaken
step
    .goto 1420/0,1638.85,1847.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Novice Elreth|r
    .accept 6395 >>Accept Marla's Last Wish
    .target Novice Elreth
step
    .goto 1420/0,1639.75,1843.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shadow Priest Sarvis|r
    .turnin 3901 >>Turn in Rattling the Rattlecages
    .target Shadow Priest Sarvis
step
    .goto 1420/0,1628.45,1839.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aramis Hammerhand|r
    .turnin 98389 >>Turn in A Light in the Darkness
    .target Aramis Hammerhand
step
    #completewith Along16
    >>As you go: Open the |cRXP_PICK_Equipment Boxes|r. Loot it for |cRXP_LOOT_Scavenged Goods|r. |cRXP_WARN_Anything left is finished later|r
    .complete 3902,1 --Scavenged Goods (1)
step
    #label Along16
    .goto 1420/0,1580.56,1848.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Arren|r
    .turnin 380 >>Turn in Night Web's Hollow
    .accept 381 >>Accept The Scarlet Crusade
    .target Executor Arren
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
    #loop
    .goto 1420/0,1514.13,1830.87,0
    .goto 1420/0,1514.13,1830.87,40,0
    .goto 1420/0,1509.61,1877.87,40,0
    .goto 1420/0,1562.93,1899.26,40,0
    .goto 1420/0,1519.10,1918.54,40,0
    .goto 1420/0,1543.95,1966.13,40,0
    .goto 1420/0,1593.21,1985.11,40,0
    .goto 1420/0,1631.17,1922.75,40,0
    .goto 1420/0,1670.93,1905.58,40,0
    .goto 1420/0,1605.41,1836.90,40,0
    >>Cast |T135920:0|t[Holy Light] on |cRXP_FRIENDLY_Injured Deathguards|r around Deathknell << Undead Paladin
    >>Open the |cRXP_PICK_Equipment Boxes|r. Loot it for |cRXP_LOOT_Scavenged Goods|r
    .complete 90902,1 << Undead Paladin --Injured Deathguard healed (5)
    .complete 3902,1 --Scavenged Goods (1)
    .target Injured Deathguard << Undead Paladin
step
    .goto 1420/0,1580.56,1848.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Arren|r
    .turnin 381 >>Turn in The Scarlet Crusade
    .accept 382 >>Accept The Red Messenger
    .target Executor Arren
step
    .goto 1420/0,1604.96,1861.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Saltain|r
    .turnin 3902 >>Turn in Scavenging Deathknell
    .target Deathguard Saltain
step << Undead Paladin
    .goto 1420/0,1628.45,1839.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aramis Hammerhand|r
    .turnin 90902 >>Turn in Rediscovering the Light
    .accept 91208 >>Accept Coming to Terms
    .accept 91209 >>Accept Continue Your Training
    .target Aramis Hammerhand
step << Undead Paladin
    #loop
    .goto 1420/0,1710.70,1885.70,0
    .goto 1420/0,1710.70,1885.70,40,0
    .goto 1420/0,1768.99,1903.17,40,0
    .goto 1420/0,1778.48,1908.60,40,0
    >>Talk to the |cRXP_FRIENDLY_Frightened Paladin|r, then kill her when she turns hostile
    .complete 91208,1 --Offer aid to the Frightened Paladin
    .skipgossip
    .mob Frightened Paladin
step
    .goto 1420/0,1624.84,1876.96
    >>Click |cRXP_PICK_Marla's Grave|r in the Deathknell graveyard
    .complete 6395,1 --Samuel's Remains Buried (1)
step
    .goto 1420/0,1638.85,1847.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Novice Elreth|r
    .turnin 6395 >>Turn in Marla's Last Wish
    .target Novice Elreth
step << Undead Paladin
    .goto 1420/0,1628.45,1839.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aramis Hammerhand|r
    .turnin 91208 >>Turn in Coming to Terms
    .target Aramis Hammerhand
step
    .goto 1420/0,1380.83,1772.73
    >>Kill |cRXP_ENEMY_Meven Korgal|r and loot |cRXP_LOOT_Scarlet Crusade Documents|r
    .complete 382,1 --Scarlet Crusade Documents (1)
    .mob Meven Korgal
step
    .goto 1420/0,1580.56,1848.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Arren|r
    .turnin 382 >>Turn in The Red Messenger
    .accept 96656 >>Accept The Adventurer
    .accept 383 >>Accept Vital Intelligence
    .target Executor Arren
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
    .xp 5 >>Grind to level 5 (Gordo's Task needs it)
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
step
    #loop
    .goto 1420/0,755.43,2322.81,0
    .goto 1420/0,755.43,2322.81,40,0
    .goto 1420/0,675.45,2285.16,40,0
    .goto 1420/0,622.58,2214.97,40,0
    .goto 1420/0,709.79,2179.12,40,0
    .goto 1420/0,598.63,2071.27,40,0
    .goto 1420/0,476.62,2100.19,40,0
    .goto 1420/0,496.96,2216.47,40,0
    .goto 1420/0,494.25,2306.25,40,0
    .goto 1420/0,607.67,2324.02,40,0
    >>Pick up |cRXP_PICK_Gloom Weed|r from the ground
    .complete 5481,1 --Gloom Weed (3)
step
    .goto 1420/0,447.25,2166.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eleanor Shackleton|r
    .turnin 96656 >>Turn in The Adventurer
    .accept 96607 >>Accept The Great Outdoors
    .target Eleanor Shackleton
step
    .goto 1420/0,449.96,2164.06
    >>Type /sit next to the |cRXP_PICK_Basic Campfire|r and stay seated for about a minute until you gain the Boosted Rest buff
    .complete 96607,1 --Use the /sit emote near the campfire
    .macro Sit,134400 >>/sit
    .timer 59, RP
    .complete 96607,2 --Gain the Boosted Rest buff
step
    .goto 1420/0,447.25,2166.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eleanor Shackleton|r
    .turnin 96607 >>Turn in The Great Outdoors
    .accept 96658 >>Accept Camping 101: Cooking
    .target Eleanor Shackleton
step
    .goto 1420/0,437.76,2365.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Junior Apothecary Holland|r
    .turnin 5481 >>Turn in Gordo's Task
    .accept 5482 >>Accept Doom Weed
    .target Junior Apothecary Holland
step
    .goto 1420/0,403.42,2287.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Dillinger|r
    .accept 404 >>Accept A Putrid Task
    .target Deathguard Dillinger
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
step
    #completewith Along42
    >>As you go: Pick up |cRXP_PICK_Dry Branch|r from the ground. |cRXP_WARN_Anything left is finished later|r
    .complete 86784,1 --Dry Branch (6)
step
    .goto 1420/0,346.94,2258.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Johaan|r
    .turnin 365 >>Turn in Fields of Grief
    .accept 407 >>Accept Fields of Grief
    .target Apothecary Johaan
step << Undead Paladin
    .goto 1420/0,310.79,2252.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shari Stilwell|r
    .complete 91209,1 --Report to Shari Stilwell in Brill
    .turnin 91209 >>Turn in Continue Your Training
    .target Shari Stilwell
step
    .goto 1420/0,295.42,2278.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Zygand|r
    .turnin 383 >>Turn in Vital Intelligence
    .accept 99134 >>Accept Discipline
    .accept 427 >>Accept At War With The Scarlet Crusade
    .accept 99141 >>Accept Patience
    .target Executor Zygand
step
    .goto 1420/0,346.94,2258.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Johaan|r
    .accept 367 >>Accept A New Plague
    .target Apothecary Johaan
    .xp <6,1
step
    #label Along42
    #loop
    .goto 1420/0,290.45,2273.11,0
    .goto 1420/0,290.45,2273.11,40,0
    .goto 1420/0,312.59,2259.55,40,0
    .goto 1420/0,257.47,2239.37,40,0
    .goto 1420/0,243.46,2288.77,40,0
    .goto 1420/0,246.62,2295.70,40,0
    >>Use |T133490:0|t[Executor's Motivator] on any five |cRXP_FRIENDLY_Deathguards|r in and around Brill
    .complete 99134,1 --Deathguards motivated (5)
    .use 286176
step
    .goto 1420/0,244.36,2269.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Renee|r
    .turnin 8 >>Turn in A Rogue's Deal
    .target Innkeeper Renee
    .home >>Set your Hearthstone to Brill
step
    .goto 1420/0,288.64,2286.06
    >>Click the |cRXP_PICK_Wanted!|r
    .accept 398 >>Accept Wanted: Maggot Eye
    .xp <6,1
step
    .goto 1420/0,242.10,2285.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_William Pickman|r
    >>|cRXP_WARN_Learning Cooking from him completes the quest|r
    .train 2550 >>Train Cooking
    .turnin 96658 >>Turn in Camping 101: Cooking
    .target William Pickman
step
    .goto 1420/0,233.06,2292.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captured Scarlet Zealot|r
    .turnin 407 >>Turn in Fields of Grief
    .target Captured Scarlet Zealot
step
    #completewith Along49
    >>As you go: Pick up |cRXP_PICK_Dry Branch|r from the ground. |cRXP_WARN_Anything left is finished later|r
    .complete 86784,1 --Dry Branch (6)
step
    .goto 1420/0,265.15,2305.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Sevren|r
    .accept 358 >>Accept Graverobbers
    .target Magistrate Sevren
step
    .xp 6 >>Grind to level 6 (Wanted: Maggot Eye needs it)
step
    .goto 1420/0,288.64,2286.06
    >>Click the |cRXP_PICK_Wanted!|r
    .accept 398 >>Accept Wanted: Maggot Eye
step
    .goto 1420/0,295.42,2278.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Zygand|r
    .turnin 99134 >>Turn in Discipline
    .target Executor Zygand
step
    #label Along49
    .goto 1420/0,346.94,2258.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Johaan|r
    .accept 367 >>Accept A New Plague
    .target Apothecary Johaan
step << Paladin
    #completewith next
    +|cRXP_WARN_Keep 10|r |T132889:0|t[Linen Cloth] |cRXP_WARN_for the Paladin quest A Lesson in Divinity. Do not vendor it|r
step
    #loop
    .goto 1420/0,345.13,2123.39,0
    .goto 1420/0,345.13,2123.39,40,0
    .goto 1420/0,538.98,2219.79,40,0
    .goto 1420/0,543.50,2159.54,40,0
    .goto 1420/0,507.35,2096.27,40,0
    .goto 1420/0,454.93,2042.65,40,0
    .goto 1420/0,436.41,1939.62,40,0
    .goto 1420/0,312.59,1964.63,40,0
    .goto 1420/0,347.84,2008.01,40,0
    .goto 1420/0,407.94,2054.10,40,0
    >>Kill |cRXP_ENEMY_Decrepit Darkhounds|r, |cRXP_ENEMY_Cursed Darkhounds|r and |cRXP_ENEMY_Ravenous Darkhounds|r. Loot them for |cRXP_LOOT_Darkhound Blood|r
    >>Pick up |cRXP_PICK_Dry Branch|r from the ground
    .complete 367,1 --Darkhound Blood (1)
    .complete 86784,1 --Dry Branch (6)
    .mob Decrepit Darkhound
    .mob Cursed Darkhound
    .mob Ravenous Darkhound
step
    .goto 1420/0,447.25,2166.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eleanor Shackleton|r
    .turnin 86784 >>Turn in Sticks and Bones
    .target Eleanor Shackleton
step
    .goto 1420/0,346.94,2258.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Johaan|r
    .turnin 367 >>Turn in A New Plague
    .accept 368 >>Accept A New Plague
    .target Apothecary Johaan
step
    .goto 1420/0,347.84,2265.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carolai Anise|r
    .accept 95314 >>Accept That Shadowvale Green Elixir
    .target Carolai Anise
    .xp <7,1
step
    #completewith Along53
    >>As you go: Kill |cRXP_ENEMY_Rotting Dead|r and |cRXP_ENEMY_Ravaged Corpses|r. Loot them for |cRXP_LOOT_Putrid Claw|r. |cRXP_WARN_Anything left is finished later|r
    .complete 404,1 --Putrid Claw (7)
    .mob Rotting Dead
    .mob Ravaged Corpse
step
    #label Along53
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
    #loop
    .goto 1420/0,531.30,2290.28,0
    .goto 1420/0,531.30,2290.28,40,0
    .goto 1420/0,524.98,2367.40,40,0
    .goto 1420/0,487.02,2440.60,40,0
    .goto 1420/0,595.92,2480.67,40,0
    .goto 1420/0,683.58,2469.52,40,0
    .goto 1420/0,687.65,2408.07,40,0
    .goto 1420/0,716.57,2282.75,40,0
    .goto 1420/0,640.66,2280.64,40,0
    .goto 1420/0,613.54,2373.73,40,0
    >>Kill |cRXP_ENEMY_Rotting Dead|r and |cRXP_ENEMY_Ravaged Corpses|r. Loot them for |cRXP_LOOT_Putrid Claw|r
    .complete 404,1 --Putrid Claw (7)
    .mob Rotting Dead
    .mob Ravaged Corpse
step
    #loop
    .goto 1420/0,602.25,2514.11,0
    .goto 1420/0,602.25,2514.11,40,0
    .goto 1420/0,474.82,2447.23,40,0
    .goto 1420/0,348.74,2505.37,40,0
    .goto 1420/0,381.28,2573.45,40,0
    .goto 1420/0,421.50,2680.40,40,0
    .goto 1420/0,429.18,2817.77,40,0
    .goto 1420/0,485.66,2598.16,40,0
    .goto 1420/0,560.22,2663.23,40,0
    .goto 1420/0,625.29,2587.31,40,0
    >>Kill |cRXP_ENEMY_Rot Hide Gnolls|r, |cRXP_ENEMY_Rot Hide Mongrels|r and |cRXP_ENEMY_Rot Hide Graverobbers|r. Loot them for |cRXP_LOOT_Embalming Ichor|r
    >>Kill |cRXP_ENEMY_Rot Hide Graverobbers|r
    >>Pick up |cRXP_PICK_Doom Weed|r from the ground
    .complete 358,3 --Embalming Ichor (8)
    .complete 358,1 --Rot Hide Graverobber slain (8)
    .complete 5482,1 --Doom Weed (10)
    .mob Rot Hide Gnoll
    .mob Rot Hide Mongrel
    .mob Rot Hide Graverobber
step
    #loop
    .goto 1420/0,386.70,2969.00,0
    .goto 1420/0,386.70,2969.00,40,0
    .goto 1420/0,426.01,2984.96,40,0
    .goto 1420/0,407.49,3039.19,40,0
    .goto 1420/0,371.34,3021.11,40,0
    .goto 1420/0,318.92,2982.55,40,0
    .goto 1420/0,280.06,3017.80,40,0
    .goto 1420/0,238.94,3025.93,40,0
    .goto 1420/0,243.91,2987.97,40,0
    .goto 1420/0,251.14,2951.82,40,0
    >>Kill |cRXP_ENEMY_Vile Fin Puddlejumpers|r, |cRXP_ENEMY_Vile Fin Minor Oracles|r, |cRXP_ENEMY_Vile Fin Muckdwellers|r and |cRXP_ENEMY_Vile Fin Seers|r. Loot them for |cRXP_LOOT_Vile Fin Scale|r
    .complete 368,1 --Vile Fin Scale (5)
    .mob Vile Fin Puddlejumper
    .mob Vile Fin Minor Oracle
    .mob Vile Fin Muckdweller
    .mob Vile Fin Seer
step
    #loop
    .goto 1420/0,487.47,2821.99,0
    .goto 1420/0,487.47,2821.99,40,0
    .goto 1420/0,413.81,2778.00,40,0
    .goto 1420/0,384.89,2749.69,40,0
    .goto 1420/0,325.70,2750.29,40,0
    .goto 1420/0,279.61,2712.33,40,0
    .goto 1420/0,300.85,2668.05,40,0
    .goto 1420/0,313.95,2681.60,40,0
    .goto 1420/0,349.20,2720.16,40,0
    .goto 1420/0,385.80,2707.81,40,0
    >>Kill |cRXP_ENEMY_Rot Hide Mongrels|r
    .complete 358,2 --Rot Hide Mongrel slain (8)
    .mob Rot Hide Mongrel
step
    .goto 1420/0,437.76,2365.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Junior Apothecary Holland|r
    .turnin 5482 >>Turn in Doom Weed
    .accept 99142 >>Accept Tomb Weed
    .target Junior Apothecary Holland
step
    .goto 1420/0,403.42,2287.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Dillinger|r
    .turnin 404 >>Turn in A Putrid Task
    .target Deathguard Dillinger
step
    .goto 1420/0,403.42,2287.57
    >>Talk to |cRXP_FRIENDLY_Deathguard Dillinger|r and pick "I need a report for Executor Zygand"
    .complete 99141,1 --Dillinger's Report (1)
    .skipgossipid 142723
    .target Deathguard Dillinger
step
    .goto 1420/0,403.42,2287.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Dillinger|r
    .accept 426 >>Accept The Mills Overrun
    .target Deathguard Dillinger
step
    .goto 1420/0,347.84,2265.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carolai Anise|r
    .accept 95314 >>Accept That Shadowvale Green Elixir
    .target Carolai Anise
step
    .goto 1420/0,346.94,2258.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Johaan|r
    .turnin 368 >>Turn in A New Plague
    .accept 369 >>Accept A New Plague
    .target Apothecary Johaan
step
    .goto 1420/0,265.15,2305.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Sevren|r
    .turnin 358 >>Turn in Graverobbers
    .accept 405 >>Accept The Prodigal Lich
    .accept 359 >>Accept Forsaken Duties
    .target Magistrate Sevren
step
    .goto 1420/0,244.36,2262.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Coleman Farthing|r
    .accept 362 >>Accept The Haunted Mills
    .accept 354 >>Accept Deaths in the Family
    .target Coleman Farthing
step
    .goto 1420/0,236.68,2249.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gretchen Dedmar|r
    .accept 375 >>Accept The Chill of Death
    .target Gretchen Dedmar
step << Undead Paladin
    .goto 1420/0,310.79,2252.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shari Stilwell|r
    .accept 91282 >>Accept A Second Home
    .target Shari Stilwell
    .xp <8,1
step
    #loop
    .goto 1420/0,139.53,2183.94,0
    .goto 1420/0,139.53,2183.94,40,0
    .goto 1420/0,108.80,2076.69,40,0
    .goto 1420/0,74.00,2132.12,40,0
    .goto 1420/0,3.96,2133.63,40,0
    .goto 1420/0,-38.96,2207.13,40,0
    .goto 1420/0,-137.93,2220.39,40,0
    .goto 1420/0,2.16,2277.02,40,0
    .goto 1420/0,27.01,2222.50,40,0
    .goto 1420/0,156.25,2354.75,40,0
    >>Kill |cRXP_ENEMY_Greater Duskbats|r and |cRXP_ENEMY_Vampiric Duskbats|r. Loot them for |cRXP_LOOT_Duskbat Pelt|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
step
    .goto 1420/0,76.72,2026.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shelene Rhobart|r
    .accept 97558 >>Accept Hides for the Forsaken
    .target Shelene Rhobart
step
    .goto 1420/0,74.00,2022.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Linnea|r
    .turnin 359 >>Turn in Forsaken Duties
    .accept 356 >>Accept Rear Guard Patrol
    .accept 360 >>Accept Return to the Magistrate
    .target Deathguard Linnea
step
    #completewith Along70
    >>As you go: Kill |cRXP_ENEMY_Greater Duskbats|r and |cRXP_ENEMY_Vampiric Duskbats|r. Loot them for |cRXP_LOOT_Duskbat Wing Membrane|r. |cRXP_WARN_Anything left is finished later|r
    .complete 97558,1 --Duskbat Wing Membrane (8)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
step
    #label Along70
    .goto 1420/0,86.20,2024.28
    >>Talk to |cRXP_FRIENDLY_Deathguard Kristof|r and pick "I need a report for Executor Zygand"
    .complete 99141,2 --Kristof's Report (1)
    .skipgossipid 142730
    .target Deathguard Kristof
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
step
    .goto 1458/0,66.65,1766.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bethor Iceshard|r
    .turnin 405 >>Turn in The Prodigal Lich
    .accept 357 >>Accept The Lich's Identity
    .target Bethor Iceshard
step
    #completewith next
    .goto 1420/0,235.32,1883.89
    .zone 1420 >>Take a lift back up and leave the Undercity
    .zoneskip 1420
step
    #completewith next
    .hs >>Hearth to Brill. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
    .subzoneskip 159
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
step
    .goto 1420/0,265.15,2305.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Sevren|r
    .turnin 360 >>Turn in Return to the Magistrate
    .target Magistrate Sevren
step
    .goto 1420/0,295.42,2278.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Zygand|r
    .turnin 99141 >>Turn in Patience
    .target Executor Zygand
step << Undead Paladin
    .xp 8 >>Grind to level 8 (A Second Home needs it)
step << Undead Paladin
    .goto 1420/0,310.79,2252.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shari Stilwell|r
    .accept 91282 >>Accept A Second Home
    .target Shari Stilwell
step
    #completewith Drop361x1
    >>|T134939:0|t[|cRXP_LOOT_A Letter to Yvette|r] can drop from the Agamand Mills undead. Use it to start the quest if you get one
    .collect 2839,1,361 --A Letter to Yvette (1)
    .accept 361 >>Accept A Letter Undelivered
    .use 2839
step
    #completewith Drop361x1
    >>As you go: Kill |cRXP_ENEMY_Darkeye Bonecasters|r and |cRXP_ENEMY_Shadowvale Mystics|r. Loot them for |cRXP_LOOT_Blackened Skull|r. |cRXP_WARN_Anything left is finished later|r
    .complete 426,2 --Blackened Skull (3)
    .mob Darkeye Bonecaster
    .mob Shadowvale Mystic
step
    #label Drop361x1
    #loop
    .goto 1420/0,741.42,2513.20,0
    .goto 1420/0,741.42,2513.20,40,0
    .goto 1420/0,805.14,2547.85,40,0
    .goto 1420/0,817.79,2689.13,40,0
    .goto 1420/0,795.65,2728.00,40,0
    .goto 1420/0,879.70,2721.07,40,0
    .goto 1420/0,952.00,2660.52,40,0
    .goto 1420/0,961.94,2619.55,40,0
    .goto 1420/0,894.16,2609.00,40,0
    .goto 1420/0,830.89,2504.77,40,0
    >>Kill |cRXP_ENEMY_Rattlecage Soldiers|r and |cRXP_ENEMY_Cracked Skull Soldiers|r. Loot them for |cRXP_LOOT_Notched Rib|r
    >>Kill |cRXP_ENEMY_Devlin Agamand|r and loot |cRXP_LOOT_Devlin's Remains|r
    .complete 426,1 --Notched Rib (5)
    .complete 362,1 --Devlin's Remains (1)
    .mob Rattlecage Soldier
    .mob Cracked Skull Soldier
    .mob Devlin Agamand
step
    #loop
    .goto 1420/0,1107.44,2613.22,0
    .goto 1420/0,1107.44,2613.22,40,0
    .goto 1420/0,1126.87,2548.45,40,0
    .goto 1420/0,1214.08,2556.28,40,0
    .goto 1420/0,1191.94,2483.08,40,0
    .goto 1420/0,1294.97,2412.59,40,0
    .goto 1420/0,1339.25,2477.66,40,0
    .goto 1420/0,1280.96,2492.42,40,0
    .goto 1420/0,1318.02,2588.82,40,0
    .goto 1420/0,1213.63,2641.84,40,0
    >>Kill |cRXP_ENEMY_Decrepit Darkhounds|r and |cRXP_ENEMY_Cursed Darkhounds|r. Loot them for |cRXP_LOOT_Darkhound Hide|r
    .complete 97558,2 --Darkhound Hide (6)
    .mob Decrepit Darkhound
    .mob Cursed Darkhound
step
    #loop
    .goto 1420/0,1821.86,2428.55,0
    .goto 1420/0,1821.86,2428.55,40,0
    .goto 1420/0,1847.61,2441.51,40,0
    .goto 1420/0,1890.09,2411.08,40,0
    .goto 1420/0,1881.96,2377.34,40,0
    .goto 1420/0,1858.46,2380.96,40,0
    .goto 1420/0,1855.30,2413.19,40,0
    >>Kill |cRXP_ENEMY_Vile Fin Minor Oracles|r and |cRXP_ENEMY_Vile Fin Muckdwellers|r. Loot them for |cRXP_LOOT_Vile Fin Murloc Skin|r
    .complete 97558,3 --Vile Fin Murloc Skin (3)
    .mob Vile Fin Minor Oracle
    .mob Vile Fin Muckdweller
step
    .goto 1420/0,2039.21,2418.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hilda the Breaker|r
    .accept 99152 >>Accept As Above, So Below
    .target Hilda the Breaker
step << Undead Paladin
    .goto 1420/0,2045.99,2472.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Breton Samuels|r
    .turnin 91282 >>Turn in A Second Home
    .accept 91285 >>Accept Murlocs at the Gates
    .target Breton Samuels
step
    .goto 1420/0,2122.81,2433.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ephram Barbaro|r
    .accept 99153 >>Accept The One That Got Away
    .target Ephram Barbaro
step << Undead Paladin
    #loop
    .goto 1420/0,2196.91,2309.56,0
    .goto 1420/0,2196.91,2309.56,40,0
    .goto 1420/0,2258.82,2302.93,40,0
    .goto 1420/0,2319.37,2293.89,40,0
    .goto 1420/0,2367.27,2186.65,40,0
    .goto 1420/0,2443.64,2115.86,40,0
    .goto 1420/0,2392.12,2075.79,40,0
    .goto 1420/0,2336.54,2110.13,40,0
    .goto 1420/0,2250.69,2177.61,40,0
    .goto 1420/0,2280.96,2241.18,40,0
    >>Kill |cRXP_ENEMY_Vile Fin Seers|r
    .complete 91285,2 --Vile Fin Seer slain (8)
    .mob Vile Fin Seer
step
    #completewith Along85
    >>As you go: Kill |cRXP_ENEMY_Darkeye Bonecasters|r and |cRXP_ENEMY_Shadowvale Mystics|r. Loot them for |cRXP_LOOT_Blackened Skull|r. |cRXP_WARN_Anything left is finished later|r
    .complete 426,2 --Blackened Skull (3)
    .mob Darkeye Bonecaster
    .mob Shadowvale Mystic
step
    #label Along85
    #loop
    .goto 1420/0,2460.36,1855.88,0
    .goto 1420/0,2460.36,1855.88,40,0
    .goto 1420/0,2527.23,1834.19,40,0
    .goto 1420/0,2572.87,1857.68,40,0
    .goto 1420/0,2610.38,1848.95,40,0
    .goto 1420/0,2608.12,1916.43,40,0
    .goto 1420/0,2644.72,1861.30,40,0
    .goto 1420/0,2646.08,1812.50,40,0
    .goto 1420/0,2604.05,1785.99,40,0
    .goto 1420/0,2576.94,1725.74,40,0
    >>Pick up |cRXP_PICK_Glowing Crystal Fragment|r from the ground
    >>Open the |cRXP_PICK_Bottle|r. Loot it for |cRXP_LOOT_Bottle of Whispering Elixir|r
    >>Kill |cRXP_ENEMY_Shadowvale Lurchers|r and |cRXP_ENEMY_Shadowvale Mystics|r. Loot them for |cRXP_LOOT_Faintly Glowing Bone|r
    .complete 99153,1 --Glowing Crystal Fragment (1)
    .complete 95314,1 --Bottle of Whispering Elixir (1)
    .complete 99152,1 --Faintly Glowing Bone (6)
    .mob Shadowvale Lurcher
    .mob Shadowvale Mystic
step << Undead Paladin
    #loop
    .goto 1420/0,2413.81,2115.86,0
    .goto 1420/0,2413.81,2115.86,40,0
    .goto 1420/0,2369.53,2168.88,40,0
    .goto 1420/0,2399.35,2217.38,40,0
    .goto 1420/0,2364.11,2246.30,40,0
    .goto 1420/0,2331.12,2275.52,40,0
    .goto 1420/0,2217.70,2118.87,40,0
    .goto 1420/0,2203.69,2044.16,40,0
    .goto 1420/0,2262.89,2092.36,40,0
    .goto 1420/0,2327.50,2137.85,40,0
    >>Kill |cRXP_ENEMY_Vile Fin Attackers|r
    .complete 91285,1 --Vile Fin Attacker slain (8)
    .mob Vile Fin Attacker
step
    .goto 1420/0,2122.81,2433.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ephram Barbaro|r
    .turnin 99153 >>Turn in The One That Got Away
    .target Ephram Barbaro
step << Undead Paladin
    .goto 1420/0,2045.99,2472.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Breton Samuels|r
    .turnin 91285 >>Turn in Murlocs at the Gates
    .accept 91294 >>Accept Touring the Grounds
    .target Breton Samuels
step
    .goto 1420/0,2039.21,2418.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hilda the Breaker|r
    .turnin 99152 >>Turn in As Above, So Below
    .target Hilda the Breaker
step << Undead Paladin
    .goto 1420/0,2036.95,2411.68
    >>Talk to |cRXP_FRIENDLY_Hilda the Breaker|r outside the keep
    .complete 91294,1 --Speak with Hilda the Breaker
    .target Hilda the Breaker
step << Undead Paladin
    #loop
    .goto 1420/0,2025.20,2342.09,0
    .goto 1420/0,2025.20,2342.09,40,0
    .goto 1420/0,1952.45,2329.44,40,0
    .goto 1420/0,1887.38,2317.99,40,0
    >>Talk to |cRXP_FRIENDLY_Ander Solliden|r. |cRXP_WARN_He patrols the road outside the keep|r
    .complete 91294,3 --Speak with Ander Solliden
    .unitscan Ander Solliden
step << Undead Paladin
    .goto 1420/0,2009.84,2488.80
    >>Talk to |cRXP_FRIENDLY_Jorin Croge|r inside the keep
    .complete 91294,2 --Speak with Jorin Croge
    .target Jorin Croge
step << Undead Paladin
    .goto 1420/0,2036.95,2490.91
    >>Talk to |cRXP_FRIENDLY_Danitha Morr|r upstairs in the keep
    .complete 91294,4 --Speak with Danitha Morr
    .target Danitha Morr
step << Undead Paladin
    .goto 1420/0,2036.95,2490.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Danitha Morr|r
    .turnin 91294 >>Turn in Touring the Grounds
    .target Danitha Morr
step << Undead Paladin
    .xp 9 >>Grind to level 9 (The Tarnished needs it)
step << Undead Paladin
    .goto 1420/0,2036.95,2490.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Danitha Morr|r
    .accept 91317 >>Accept The Tarnished
    .target Danitha Morr
step << Undead Paladin
    .goto 1420/0,2009.84,2488.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jorin Croge|r
    .accept 91316 >>Accept Making Repairs
    .target Jorin Croge
step
    #loop
    .goto 1420/0,1648.79,2403.25,0
    .goto 1420/0,1648.79,2403.25,40,0
    .goto 1420/0,1580.56,2481.87,40,0
    .goto 1420/0,1514.13,2473.14,40,0
    .goto 1420/0,1577.84,2430.06,40,0
    .goto 1420/0,1552.54,2384.87,40,0
    .goto 1420/0,1485.66,2396.32,40,0
    .goto 1420/0,1490.63,2289.07,40,0
    .goto 1420/0,1559.32,2295.10,40,0
    .goto 1420/0,1656.92,2292.99,40,0
    >>Kill |cRXP_ENEMY_Scarlet Warriors|r
    .complete 427,1 --Scarlet Warrior slain (10)
    .mob Scarlet Warrior
step
    .goto 1420/0,1589.14,2441.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bareth Dawnstone|r
    >>|cRXP_WARN_He is at the top of the tower and this starts an escort. It is easy to pull three Scarlet Warriors up there|r
    .accept 99144,1 >>Accept Seeking Refuge
    .target Bareth Dawnstone
step
    .goto 1420/0,1267.86,2368.30
    >>Escort |cRXP_FRIENDLY_Bareth Dawnstone|r out of Solliden Farmstead
    .complete 99144,1 --Escort Bareth Dawnstone to safety
    .target Bareth Dawnstone
step
    #completewith Drop361x2
    >>|T134939:0|t[|cRXP_LOOT_A Letter to Yvette|r] can drop from the Agamand Mills undead. Use it to start the quest if you get one
    .collect 2839,1,361 --A Letter to Yvette (1)
    .accept 361 >>Accept A Letter Undelivered
    .use 2839
step
    #completewith Along99
    >>As you go: Kill |cRXP_ENEMY_Darkeye Bonecasters|r and |cRXP_ENEMY_Shadowvale Mystics|r. Loot them for |cRXP_LOOT_Blackened Skull|r. |cRXP_WARN_Anything left is finished later|r
    .complete 426,2 --Blackened Skull (3)
    .mob Darkeye Bonecaster
    .mob Shadowvale Mystic
step
    #label Along99
    .goto 1420/0,1045.08,2824.09
    >>Kill |cRXP_ENEMY_Thurman Agamand|r and loot |cRXP_LOOT_Thurman's Remains|r
    .complete 354,3 --Thurman's Remains (1)
    .mob Thurman Agamand
step
    #label Drop361x2
    #loop
    .goto 1420/0,927.60,2874.40,0
    .goto 1420/0,927.60,2874.40,40,0
    .goto 1420/0,915.40,2831.93,40,0
    .goto 1420/0,913.59,2786.74,40,0
    .goto 1420/0,887.83,2750.59,40,0
    .goto 1420/0,779.38,2728.30,40,0
    .goto 1420/0,809.66,2827.11,40,0
    .goto 1420/0,869.76,2811.44,40,0
    .goto 1420/0,854.84,2922.90,40,0
    .goto 1420/0,921.27,2954.54,40,0
    >>Kill |cRXP_ENEMY_Gregor Agamand|r and loot |cRXP_LOOT_Gregor's Remains|r
    >>Kill |cRXP_ENEMY_Darkeye Bonecasters|r and |cRXP_ENEMY_Shadowvale Mystics|r. Loot them for |cRXP_LOOT_Blackened Skull|r
    >>Kill |cRXP_ENEMY_Nissa Agamand|r and loot |cRXP_LOOT_Nissa's Remains|r
    .complete 354,1 --Gregor's Remains (1)
    .complete 426,2 --Blackened Skull (3)
    .complete 354,2 --Nissa's Remains (1)
    .mob Gregor Agamand
    .mob Darkeye Bonecaster
    .mob Shadowvale Mystic
    .mob Nissa Agamand
step
    #completewith next
    .hs >>Hearth to Brill. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
    .subzoneskip 159
step
    .goto 1420/0,244.36,2262.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Coleman Farthing|r
    .turnin 354 >>Turn in Deaths in the Family
    .turnin 362 >>Turn in The Haunted Mills
    .accept 355 >>Accept Speak with Sevren
    .target Coleman Farthing
step
    .goto 1420/0,250.69,2252.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yvette Farthing|r
    .turnin 361 >>Turn in A Letter Undelivered
    .target Yvette Farthing
    .isOnQuest 361
step
    .goto 1420/0,295.42,2278.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Zygand|r
    .turnin 427 >>Turn in At War With The Scarlet Crusade
    .accept 370 >>Accept At War With The Scarlet Crusade
    .target Executor Zygand
step
    .goto 1420/0,280.06,2270.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Burgess|r
    .accept 374 >>Accept Proof of Demise
    .target Deathguard Burgess
step
    .goto 1420/0,310.79,2252.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shari Stilwell|r
    .turnin 99144 >>Turn in Seeking Refuge
    .target Shari Stilwell
step
    .goto 1420/0,347.84,2265.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carolai Anise|r
    .turnin 95314 >>Turn in That Shadowvale Green Elixir
    .target Carolai Anise
step
    .goto 1420/0,403.42,2287.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Dillinger|r
    .turnin 426 >>Turn in The Mills Overrun
    .target Deathguard Dillinger
step
    .xp 10 >>Grind to level 10 (The Argent Emissary needs it)
step
    #loop
    .goto 1420/0,243.01,2199.30,0
    .goto 1420/0,243.01,2199.30,40,0
    .goto 1420/0,214.54,2162.85,40,0
    .goto 1420/0,165.28,2133.93,40,0
    .goto 1420/0,155.79,2063.74,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Terrence|r. |cRXP_WARN_This NPC walks a patrol route|r
    .accept 96895 >>Accept The Argent Emissary
    .unitscan Deathguard Terrence
step
    .goto 1420/0,265.15,2305.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Sevren|r
    .turnin 355 >>Turn in Speak with Sevren
    .accept 408 >>Accept The Family Crypt
    .target Magistrate Sevren
step
    #loop
    .goto 1420/0,177.94,2339.68,0
    .goto 1420/0,177.94,2339.68,40,0
    .goto 1420/0,106.54,2326.73,40,0
    .goto 1420/0,133.65,2508.08,40,0
    .goto 1420/0,108.35,2619.24,40,0
    .goto 1420/0,247.52,2669.85,40,0
    .goto 1420/0,242.10,2590.93,40,0
    .goto 1420/0,173.87,2580.68,40,0
    .goto 1420/0,192.40,2511.40,40,0
    .goto 1420/0,173.87,2419.82,40,0
    >>Kill |cRXP_ENEMY_Greater Duskbats|r and |cRXP_ENEMY_Vampiric Duskbats|r. Loot them for |cRXP_LOOT_Duskbat Wing Membrane|r
    .complete 97558,1 --Duskbat Wing Membrane (8)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
step
    .goto 1420/0,-37.61,2569.54
    >>Open the |cRXP_PICK_Gunther's Books|r. Loot it for |cRXP_LOOT_The Lich's Spellbook|r
    .complete 357,1 --The Lich's Spellbook (1)
step
    #loop
    .goto 1420/0,-786.82,2416.50,0
    .goto 1420/0,-786.82,2416.50,40,0
    .goto 1420/0,-848.72,2353.54,40,0
    .goto 1420/0,-915.15,2352.64,40,0
    .goto 1420/0,-951.30,2182.13,40,0
    .goto 1420/0,-847.37,2111.64,40,0
    .goto 1420/0,-826.58,2177.61,40,0
    .goto 1420/0,-851.44,2254.73,40,0
    .goto 1420/0,-747.96,2258.95,40,0
    .goto 1420/0,-784.56,2327.94,40,0
    >>Kill |cRXP_ENEMY_Vicious Night Web Spiders|r. Loot them for |cRXP_LOOT_Vicious Night Web Spider Venom|r
    .complete 369,1 --Vicious Night Web Spider Venom (4)
    .mob Vicious Night Web Spider
step
    #loop
    .goto 1420/0,-653.97,2237.86,0
    .goto 1420/0,-653.97,2237.86,40,0
    .goto 1420/0,-657.58,2185.75,40,0
    .goto 1420/0,-631.82,2123.39,40,0
    .goto 1420/0,-554.55,2143.27,40,0
    .goto 1420/0,-505.75,2142.67,40,0
    .goto 1420/0,-454.24,2127.30,40,0
    .goto 1420/0,-405.89,2113.45,40,0
    .goto 1420/0,-451.98,2177.01,40,0
    .goto 1420/0,-611.04,2177.01,40,0
    >>Kill |cRXP_ENEMY_Scarlet Warriors|r, |cRXP_ENEMY_Scarlet Missionaries|r, |cRXP_ENEMY_Scarlet Zealots|r and |cRXP_ENEMY_Scarlet Friars|r. Loot them for |cRXP_LOOT_Scarlet Insignia Ring|r
    >>Kill |cRXP_ENEMY_Scarlet Zealots|r
    .complete 374,1 --Scarlet Insignia Ring (10)
    .complete 370,2 --Scarlet Zealot slain (3)
    .mob Scarlet Warrior
    .mob Scarlet Missionary
    .mob Scarlet Zealot
    .mob Scarlet Friar
step
    #loop
    .goto 1420/0,-512.08,2048.68,0
    .goto 1420/0,-512.08,2048.68,40,0
    .goto 1420/0,-477.74,1984.81,40,0
    .goto 1420/0,-446.10,1948.66,40,0
    .goto 1420/0,-400.92,1960.71,40,0
    .goto 1420/0,-355.73,1966.74,40,0
    .goto 1420/0,-319.58,2023.97,40,0
    .goto 1420/0,-366.12,2084.22,40,0
    .goto 1420/0,-423.51,2068.26,40,0
    .goto 1420/0,-414.47,2005.90,40,0
    >>Pick up |cRXP_PICK_Tomb Weed|r from the ground
    >>Kill |cRXP_ENEMY_Bleeding Horrors|r
    >>Kill |cRXP_ENEMY_Wandering Spirits|r
    .complete 99142,1 --Tomb Weed (5)
    .complete 356,1 --Bleeding Horror slain (8)
    .complete 356,2 --Wandering Spirit slain (8)
    .mob Bleeding Horror
    .mob Wandering Spirit
step
    .goto 1420/0,76.72,2026.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shelene Rhobart|r
    .turnin 97558 >>Turn in Hides for the Forsaken
    .target Shelene Rhobart
step
    .goto 1420/0,74.00,2022.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Linnea|r
    .turnin 356 >>Turn in Rear Guard Patrol
    .accept 99156 >>Accept Rear Guard Patrol
    .target Deathguard Linnea
step
    .goto 1420/0,56.38,1995.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hadric Harlson|r
    .turnin 96895 >>Turn in The Argent Emissary
    .accept 96897 >>Accept The Cult of the Damned
    .accept 96898 >>Accept Remnants of War
    .target Hadric Harlson
step
    #loop
    .goto 1420/0,18.42,1945.05,0
    .goto 1420/0,18.42,1945.05,40,0
    .goto 1420/0,-37.16,2000.78,40,0
    .goto 1420/0,-49.81,1911.01,40,0
    .goto 1420/0,-134.31,1917.93,40,0
    .goto 1420/0,-158.26,1802.86,40,0
    .goto 1420/0,-88.67,1829.07,40,0
    .goto 1420/0,-16.82,1820.63,40,0
    .goto 1420/0,18.42,1873.05,40,0
    .goto 1420/0,102.92,1937.52,40,0
    >>Kill |cRXP_ENEMY_Dark Neophytes|r and |cRXP_ENEMY_Dark Enforcers|r. Loot them for |cRXP_LOOT_Necrotic Crystal Fragment|r. It can also be picked up from |cRXP_PICK_Naxxramas Crystal Fragment|r on the ground
    >>Kill |cRXP_ENEMY_Dark Neophytes|r
    >>Kill |cRXP_ENEMY_Dark Neophytes|r and |cRXP_ENEMY_Dark Enforcers|r. |cRXP_WARN_They hit hard; Enforcers have an instant 50-70 damage ability|r
    .complete 96898,1 --Necrotic Crystal Fragment (12)
    .complete 96897,1 --Dark Neophyte slain (8)
    .complete 96897,2 --Dark Enforcer slain (8)
    .mob Dark Neophyte
    .mob Dark Enforcer
step
    .goto 1420/0,56.38,1995.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hadric Harlson|r
    .turnin 96897 >>Turn in The Cult of the Damned
    .turnin 96898 >>Turn in Remnants of War
    .accept 96899 >>Accept Bandarion Keep
    .target Hadric Harlson
step
    .goto 1420/0,346.94,2258.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Johaan|r
    >>|cRXP_WARN_This one is handed in at the Sepulcher in Silverpine Forest. It rides along until you head there|r
    .turnin 369 >>Turn in A New Plague
    .accept 492 >>Accept A New Plague
    .accept 445 >>Accept Delivery to Silverpine Forest
    .target Apothecary Johaan
step
    .goto 1420/0,280.06,2270.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Burgess|r
    .turnin 374 >>Turn in Proof of Demise
    .target Deathguard Burgess
step
    .goto 1420/0,234.42,2289.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captured Mountaineer|r
    .turnin 492 >>Turn in A New Plague
    .target Captured Mountaineer
step
    .goto 1420/0,437.76,2365.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Junior Apothecary Holland|r
    .turnin 99142 >>Turn in Tomb Weed
    .target Junior Apothecary Holland
step
    #loop
    .goto 1420/0,648.34,1806.47,0
    .goto 1420/0,648.34,1806.47,40,0
    .goto 1420/0,621.68,1785.69,40,0
    .goto 1420/0,726.51,1737.49,40,0
    .goto 1420/0,767.18,1764.30,40,0
    .goto 1420/0,855.75,1837.80,40,0
    .goto 1420/0,825.92,1826.05,40,0
    .goto 1420/0,763.57,1821.23,40,0
    .goto 1420/0,722.44,1795.02,40,0
    .goto 1420/0,699.40,1828.16,40,0
    >>Kill |cRXP_ENEMY_Captain Perrine|r
    >>Kill |cRXP_ENEMY_Scarlet Missionaries|r
    .complete 370,1 --Captain Perrine slain (1)
    .complete 370,3 --Scarlet Missionary slain (3)
    .mob Captain Perrine
    .mob Scarlet Missionary
step << Undead Paladin
    #loop
    .goto 1420/0,2289.55,1957.40,0
    .goto 1420/0,2289.55,1957.40,40,0
    .goto 1420/0,2376.76,1919.74,40,0
    .goto 1420/0,2409.29,1833.89,40,0
    .goto 1420/0,2472.56,1901.37,40,0
    .goto 1420/0,2558.86,1819.12,40,0
    .goto 1420/0,2649.24,1816.11,40,0
    .goto 1420/0,2599.53,1924.56,40,0
    .goto 1420/0,2531.30,2018.55,40,0
    .goto 1420/0,2406.13,2056.51,40,0
    >>Kill |cRXP_ENEMY_Tarnished Drudges|r
    >>Kill |cRXP_ENEMY_Tarnished Zealots|r
    >>Kill |cRXP_ENEMY_Rudolph Gelhardt|r upstairs. Loot him for his |cRXP_LOOT_Head|r
    >>Open the |cRXP_PICK_Lumber Pile|r. Loot it for |cRXP_LOOT_Sturdy Lumber|r
    .complete 91317,2 --Tarnished Drudge slain (8)
    .complete 91317,3 --Tarnished Zealot slain (6)
    .complete 91317,1 --Rudolph Gelhardt's Head (1)
    .complete 91316,1 --Sturdy Lumber (1)
    .mob Tarnished Drudge
    .mob Tarnished Zealot
    .mob Rudolph Gelhardt
step
    #loop
    .goto 1420/0,2602.24,1975.17,0
    .goto 1420/0,2602.24,1975.17,40,0
    .goto 1420/0,2612.19,1988.13,40,0
    .goto 1420/0,2646.08,2042.65,40,0
    .goto 1420/0,2612.19,2059.82,40,0
    .goto 1420/0,2593.21,2037.83,40,0
    .goto 1420/0,2609.93,2031.81,40,0
    .goto 1420/0,2600.89,2011.32,40,0
    >>Kill the |cRXP_ENEMY_Whispering Horror|r (elite) and loot |T134438:0|t[|cRXP_LOOT_Whispering Horror Residue|r]. Use it to start the quest. |cRXP_WARN_Bring a partner if you can; skip this step if you cannot kill it|r
    .collect 268812,1,95328 --Whispering Horror Residue (1)
    .accept 95328 >>Accept Whispering Horror Residue
    .use 268812
    .mob Whispering Horror
step << Undead Paladin
    .goto 1420/0,2009.84,2488.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jorin Croge|r
    .turnin 91316 >>Turn in Making Repairs
    .target Jorin Croge
step
    .goto 1420/0,2038.76,2488.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Leonid Barthalomew the Revered|r
    >>|cRXP_WARN_Wait for Danitha Morr and Leonid to finish talking, then hand it in|r
    .turnin 96899 >>Turn in Bandarion Keep
    .accept 96896 >>Accept A Righteous Cause
    .turnin 96896 >>Turn in A Righteous Cause
    .accept 98545 >>Accept Leonid's Letter
    .target Leonid Barthalomew the Revered
step << Undead Paladin
    .goto 1420/0,2036.95,2490.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Danitha Morr|r
    .turnin 91317 >>Turn in The Tarnished
    .target Danitha Morr
step << Undead Paladin
    .xp 12 >>Grind to level 12 (A Lesson in Divinity needs it)
step << Undead Paladin
    .goto 1420/0,2036.95,2490.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Danitha Morr|r
    .accept 94427 >>Accept A Lesson in Divinity
    .accept 95803 >>Accept A Token of Good Faith
    .target Danitha Morr
step
    #completewith next
    .hs >>Hearth to Brill. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
    .subzoneskip 159
step
    .goto 1420/0,295.42,2278.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Zygand|r
    .turnin 370 >>Turn in At War With The Scarlet Crusade
    .accept 371 >>Accept At War With The Scarlet Crusade
    .target Executor Zygand
step
    #completewith next
    .goto 1420/0,235.32,1883.89
    .zone 1458 >>Go into the Ruins of Lordaeron and take a lift down into the Undercity
    .zoneskip 1458
step << Undead
    .goto 1458/0,283.27,1610.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gordon Wendham|r
    .accept 6322 >>Accept Michael Garrett
    .target Gordon Wendham
    .isQuestTurnedIn 6323 --any of: Ride to the Undercity
    .xp <10,1
step << Undead Paladin
    .goto 1458/0,243.65,1635.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tanis Alderwood|r
    .turnin 94427 >>Turn in A Lesson in Divinity
    .target Tanis Alderwood
step
    .goto 1458/0,203.84,1576.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Glix Xizzix|r
    .turnin 98545 >>Turn in Leonid's Letter
    .target Glix Xizzix
step << Undead
    .goto 1458/0,266.39,1567.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Michael Garrett|r
    .turnin 6322 >>Turn in Michael Garrett
    .target Michael Garrett
    .isOnQuest 6322
step << Undead
    .goto 1458/0,266.39,1567.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Michael Garrett|r
    .accept 6324 >>Accept Return to Podrig
    .target Michael Garrett
    .isQuestTurnedIn 6322 --any of: Michael Garrett
    .xp <10,1
step << Undead Paladin
    .goto 1458/0,243.65,1635.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tanis Alderwood|r
    .accept 94434 >>Accept A Lesson in Divinity
    .target Tanis Alderwood
    .xp <12,1
step << Undead Paladin
    .goto 1458/0,316.28,1290.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lady Sylvanas Windrunner|r
    .turnin 95803 >>Turn in A Token of Good Faith
    .target Lady Sylvanas Windrunner
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
    .goto 1458/0,401.76,1784.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Father Lankester|r
    .turnin 95328 >>Turn in Whispering Horror Residue
    .target Father Lankester
    .isOnQuest 95328
step
    .goto 1458/0,66.65,1766.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bethor Iceshard|r
    .turnin 357 >>Turn in The Lich's Identity
    .accept 366 >>Accept Return the Book
    .target Bethor Iceshard
step << Undead Paladin
    .goto 1458/0,243.65,1635.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tanis Alderwood|r
    >>|cRXP_WARN_She wants 10|r |T132889:0|t[Linen Cloth]|cRXP_WARN_. The auction house is next to her if you are short|r
    .accept 94434 >>Accept A Lesson in Divinity
    .turnin 94434 >>Turn in A Lesson in Divinity
    .accept 94435 >>Accept A Lesson in Divinity
    .target Tanis Alderwood
step
    #completewith next
    .goto 1420/0,235.32,1883.89
    .zone 1420 >>Take a lift back up and leave the Undercity
    .zoneskip 1420
step
    #loop
    .goto 1420/0,-450.62,2184.24,0
    .goto 1420/0,-450.62,2184.24,40,0
    .goto 1420/0,-505.75,2142.67,40,0
    .goto 1420/0,-528.35,2146.58,40,0
    .goto 1420/0,-554.55,2143.27,40,0
    .goto 1420/0,-625.05,2112.84,40,0
    .goto 1420/0,-653.97,2237.86,40,0
    .goto 1420/0,-611.04,2177.01,40,0
    .goto 1420/0,-556.81,2165.26,40,0
    .goto 1420/0,-520.66,2169.18,40,0
    >>Kill |cRXP_ENEMY_Captain Vachon|r
    >>Kill |cRXP_ENEMY_Scarlet Friars|r
    .complete 371,1 --Captain Vachon slain (1)
    .complete 371,2 --Scarlet Friar slain (5)
    .mob Captain Vachon
    .mob Scarlet Friar
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
    .goto 1420/0,382.63,2910.55
    >>Kill |cRXP_ENEMY_Maggot Eye|r and loot |cRXP_LOOT_Maggot Eye's Paw|r
    .complete 398,1 --Maggot Eye's Paw (1)
    .mob Maggot Eye
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
    >>Kill |cRXP_ENEMY_Captain Dargol|r and loot |cRXP_LOOT_Dargol's Skull|r
    >>Kill |cRXP_ENEMY_Wailing Ancestors|r
    >>Kill |cRXP_ENEMY_Rotting Ancestors|r
    .complete 408,3 --Dargol's Skull (1)
    .complete 408,1 --Wailing Ancestor slain (8)
    .complete 408,2 --Rotting Ancestor slain (8)
    .mob Captain Dargol
    .mob Wailing Ancestor
    .mob Rotting Ancestor
step << Undead Paladin
    .goto 1420/0,2036.95,2490.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Danitha Morr|r
    .turnin 94435 >>Turn in A Lesson in Divinity
    .accept 94436 >>Accept A Lesson in Divinity
    .target Danitha Morr
step << Undead Paladin
    .goto 1420/0,2041.47,2496.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Billmuth|r
    .turnin 94436 >>Turn in A Lesson in Divinity
    .accept 94438 >>Accept A Lesson in Divinity
    .target Deathguard Billmuth
step
    .goto 1420/0,295.42,2278.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Zygand|r
    .turnin 371 >>Turn in At War With The Scarlet Crusade
    .turnin 398 >>Turn in Wanted: Maggot Eye
    .accept 372 >>Accept At War With The Scarlet Crusade
    .target Executor Zygand
step
    .goto 1420/0,265.15,2305.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Sevren|r
    .turnin 408 >>Turn in The Family Crypt
    .target Magistrate Sevren
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
step << Undead Paladin
    .goto 1420/0,-883.07,2399.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Falgan|r
    >>Use the |T133439:0|t[Symbol of Life] on |cRXP_FRIENDLY_Deathguard Falgan|r to resurrect him, then talk to him
    .use 6866
    .turnin 94438 >>Turn in A Lesson in Divinity
    .accept 94440 >>Accept A Lesson in Divinity
    .target Deathguard Falgan
step
    #loop
    .goto 1420/0,-870.41,2380.35,0
    .goto 1420/0,-870.41,2380.35,40,0
    .goto 1420/0,-783.20,2356.25,40,0
    .goto 1420/0,-629.11,2480.67,40,0
    .goto 1420/0,-715.87,2517.72,40,0
    .goto 1420/0,-762.42,2457.17,40,0
    .goto 1420/0,-810.77,2514.41,40,0
    .goto 1420/0,-855.50,2577.07,40,0
    .goto 1420/0,-953.11,2554.78,40,0
    .goto 1420/0,-897.08,2490.61,40,0
    >>Kill |cRXP_ENEMY_Scarlet Friars|r and |cRXP_ENEMY_Scarlet Zealots|r nearby. Loot them for the |cRXP_LOOT_Scarlet Crusade Attack Plans|r << Undead Paladin
    >>Kill |cRXP_ENEMY_Riptear|r and loot |cRXP_LOOT_Riptear's Heart|r
    >>|cRXP_WARN_Riptear is level 13|r
    .complete 94440,1 << Undead Paladin --Scarlet Crusade Attack Plans (1)
    .complete 99156,1 --Riptear's Heart (1)
    .mob Scarlet Friar << Undead Paladin
    .mob Scarlet Zealot << Undead Paladin
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
step
    .goto 1458/0,66.65,1766.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bethor Iceshard|r
    .turnin 411 >>Turn in The Prodigal Lich Returns
    .target Bethor Iceshard
step
    #completewith next
    .goto 1420/0,235.32,1883.89
    .zone 1420 >>Take a lift back up and leave the Undercity
    .zoneskip 1420
step
    #completewith next
    .hs >>Hearth to Brill. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
    .subzoneskip 159
step
    .goto 1420/0,295.42,2278.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Executor Zygand|r
    .turnin 372 >>Turn in At War With The Scarlet Crusade
    .target Executor Zygand
step << Undead Paladin
    .goto 1420/0,2041.47,2496.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Billmuth|r
    .turnin 94440 >>Turn in A Lesson in Divinity
    .accept 94441 >>Accept A Lesson in Divinity
    .target Deathguard Billmuth
step << Undead Paladin
    .goto 1420/0,2036.95,2490.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Danitha Morr|r
    .turnin 94441 >>Turn in A Lesson in Divinity
    .target Danitha Morr
step
    +|cRXP_WARN_End of the Tirisfal Glades route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Silverpine Forest|r: Delivery to Silverpine Forest, A Recipe For Death
    >>|cRXP_FRIENDLY_Silverpine Forest|r: Return to Podrig << Undead
    >>|cRXP_FRIENDLY_The Barrens|r: Sample for Helbrim
]])
