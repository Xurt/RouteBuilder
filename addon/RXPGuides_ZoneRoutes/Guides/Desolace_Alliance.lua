-- 31-40 Desolace: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 3 parts with a level check between them (from level 31, 34, 37).
-- Sections (the guide starts at the one for your level): around Vahlarriel Demonslayer from 31; part 2 from 34; part 3 from 37.
-- Edit zones/Desolace.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#name 31-40 Desolace

step
    .xp <34,1,RBSection1_1
    .xp 34 >>Finding the place in this guide for your level
step
    .xp <37,1,RBSection2_1
    .xp 37 >>Finding the place in this guide for your level
step
    .xp <61,1,RBSection3_1
step
    #label RBSection1_1
    #completewith next
    +|cRXP_WARN_Desolace: around Vahlarriel Demonslayer|r (planned from level 31)
step
    .goto 1443/1,1246.30,97.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vahlarriel Demonslayer|r
    .accept 1437 >>Accept Vahlarriel's Search
    .target Vahlarriel Demonslayer
step
    .goto 1443/1,1326.33,136.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baritanas Skyriver|r
    .fp Desolace >> Get the Desolace Flight Path
    .target Baritanas Skyriver
step << Hunter
    .goto 1443/1,1239.11,248.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Christi Galvanis|r
    .vendor >> |cRXP_BUY_Restock on |r |T132382:0|t[Razor Arrows] |cRXP_BUY_if needed|r
    .target Christi Galvanis
step
    .goto 1443/1,1242.70,214.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Anton|r
    .turnin 6141 >>Turn in Brother Anton
    .target Brother Anton
    .isOnQuest 6141
step
    .goto 1443/1,1257.09,163.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kreldig Ungor|r
    .turnin 1453 >>Turn in Reclaimers' Business in Desolace
    .target Kreldig Ungor
    .isOnQuest 1453
step
    .goto 1443/1,1257.09,163.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kreldig Ungor|r
    .accept 1458 >>Accept Reagents for Reclaimers Inc.
    .accept 1454 >>Accept The Karnitol Shipwreck
    .target Kreldig Ungor
    .isQuestTurnedIn 1453 --any of: Reclaimers' Business in Desolace
    .xp <30,1
step
    .goto 1443/1,1232.81,126.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corporal Melkins|r
    .accept 1387 >>Accept Centaur Bounty
    .target Corporal Melkins
step
    .goto 1443/1,1236.41,124.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Pentigast|r
    .accept 1382 >>Accept Strange Alliance
    .accept 1385 >>Accept Brutal Politics
    .target Captain Pentigast
step
    #completewith Drop635x1
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Kolkar Centaur|r, |cRXP_ENEMY_Kolkar Scout|r, |cRXP_ENEMY_Kolkar Mauler|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #loop
    .goto 1443/1,1081.30,-14.99,0
    .goto 1443/1,1081.30,-14.99,40,0
    .goto 1443/1,959.02,-51.87,40,0
    .goto 1443/1,1017.91,-151.10,40,0
    .goto 1443/1,927.55,-194.27,40,0
    .goto 1443/1,873.60,-143.30,40,0
    .goto 1443/1,814.70,-19.49,40,0
    .goto 1443/1,899.67,63.25,40,0
    .goto 1443/1,851.57,131.31,40,0
    .goto 1443/1,927.55,181.07,40,0
    >>Kill |cRXP_ENEMY_Hatefury Rogues|r, |cRXP_ENEMY_Hatefury Tricksters|r, |cRXP_ENEMY_Hatefury Felsworns|r and |cRXP_ENEMY_Hatefury Betrayers|r. Loot them for |cRXP_LOOT_Hatefury Claw|r
    .complete 1458,1 --Hatefury Claw (10)
    .mob Hatefury Rogue
    .mob Hatefury Trickster
    .mob Hatefury Felsworn
    .mob Hatefury Betrayer
    .isOnQuest 1458
step
    #label Drop635x1
    #loop
    .goto 1443/1,899.67,63.25,0
    .goto 1443/1,899.67,63.25,40,0
    .goto 1443/1,927.55,181.07,40,0
    .goto 1443/1,851.57,131.31,40,0
    .goto 1443/1,814.70,-19.49,40,0
    .goto 1443/1,873.60,-143.30,40,0
    .goto 1443/1,927.55,-194.27,40,0
    .goto 1443/1,1017.91,-151.10,40,0
    .goto 1443/1,1081.30,-14.99,40,0
    .goto 1443/1,959.02,-51.87,40,0
    >>Kill |cRXP_ENEMY_Hatefury Rogues|r, |cRXP_ENEMY_Hatefury Tricksters|r, |cRXP_ENEMY_Hatefury Felsworns|r and |cRXP_ENEMY_Hatefury Betrayers|r. Loot them for |cRXP_LOOT_Hatefury Horn|r
    .complete 1458,2 --Hatefury Horn (10)
    .mob Hatefury Rogue
    .mob Hatefury Trickster
    .mob Hatefury Felsworn
    .mob Hatefury Betrayer
    .isOnQuest 1458
step
    .goto 1443/1,1257.09,163.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kreldig Ungor|r
    .turnin 1458 >>Turn in Reagents for Reclaimers Inc.
    .target Kreldig Ungor
    .isOnQuest 1458
step
    .goto 1443/1,1692.29,-82.75
    >>Click the |cRXP_PICK_Malem Chest|r
    .turnin 1437 >>Turn in Vahlarriel's Search
    .accept 1465 >>Accept Vahlarriel's Search
step
    .goto 1443/1,2485.35,-362.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Azore Aldamort|r
    .accept 5741 >>Accept Sceptre of Light
    .target Azore Aldamort
step
    .goto 1443/1,2609.89,-460.78
    >>Click the |cRXP_PICK_Karnitol's Chest|r
    .turnin 1454 >>Turn in The Karnitol Shipwreck
    .isOnQuest 1454
step
    .goto 1443/1,2609.89,-460.78
    >>Click the |cRXP_PICK_Karnitol's Chest|r
    .accept 1455 >>Accept The Karnitol Shipwreck
    .isQuestTurnedIn 1454 --any of: The Karnitol Shipwreck
    .xp <30,1
step
    .goto 1443/1,2611.69,-459.58
    >>Click the |cRXP_PICK_Rackmore's Log|r
    .accept 6161 >>Accept Claim Rackmore's Treasure!
step
    #completewith Drop635x2
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Kolkar Centaur|r, |cRXP_ENEMY_Kolkar Scout|r, |cRXP_ENEMY_Kolkar Mauler|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #label Drop635x2
    #loop
    .goto 1443/1,2665.19,-489.56,0
    .goto 1443/1,2665.19,-489.56,40,0
    .goto 1443/1,2653.95,-576.20,40,0
    .goto 1443/1,2749.26,-611.58,40,0
    .goto 1443/1,2824.34,-619.97,40,0
    .goto 1443/1,2818.49,-551.92,40,0
    .goto 1443/1,2813.55,-482.37,40,0
    .goto 1443/1,2821.64,-383.14,40,0
    .goto 1443/1,2719.59,-417.01,40,0
    .goto 1443/1,2748.81,-480.27,40,0
    >>Kill |cRXP_ENEMY_Drysnap Crawlers|r and |cRXP_ENEMY_Drysnap Pincers|r. Loot them for |cRXP_LOOT_Rackmore's Silver Key|r
    .complete 6161,1 --Rackmore's Silver Key (1)
    .mob Drysnap Crawler
    .mob Drysnap Pincer
step
    .goto 1443/1,1257.09,163.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kreldig Ungor|r
    .turnin 1455 >>Turn in The Karnitol Shipwreck
    .target Kreldig Ungor
    .isOnQuest 1455
step
    .goto 1443/1,1246.30,97.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vahlarriel Demonslayer|r
    .turnin 1465 >>Turn in Vahlarriel's Search
    .accept 1438 >>Accept Vahlarriel's Search
    .target Vahlarriel Demonslayer
step
    .goto 1443/1,1752.98,-451.79
    >>Kill |cRXP_ENEMY_Burning Blade Seer|r and loot |cRXP_LOOT_Sceptre of Light|r
    .complete 5741,1 --Sceptre of Light (1)
    .mob Burning Blade Seer
step
    .goto 1443/1,1766.92,-331.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dalinda Malem|r
    .turnin 1438 >>Turn in Vahlarriel's Search
    .target Dalinda Malem
step
    .goto 1443/1,862.81,-1591.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warug|r
    .turnin 1385 >>Turn in Brutal Politics
    .accept 92743 >>Accept A Conqueror's Crown
    .accept 92841 >>Accept Valley of Bones
    .target Warug
step
    .goto 1443/1,862.81,-1591.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warug|r
    >>|cRXP_WARN_The database has no objectives for A Conqueror's Crown. Skip this step if the quest is not finished|r
    .turnin 92743 >>Turn in A Conqueror's Crown
    .target Warug
    .isOnQuest 92743
step
    #completewith Drop635x3
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Kolkar Centaur|r, |cRXP_ENEMY_Kolkar Scout|r, |cRXP_ENEMY_Kolkar Mauler|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #label Drop635x3
    #loop
    .goto 1443/1,1029.15,-1689.93,0
    .goto 1443/1,1029.15,-1689.93,40,0
    .goto 1443/1,1146.94,-1678.84,40,0
    .goto 1443/1,1242.70,-1618.58,40,0
    .goto 1443/1,1242.26,-1757.98,40,0
    .goto 1443/1,1314.19,-1884.79,40,0
    .goto 1443/1,1213.93,-2049.08,40,0
    .goto 1443/1,1084.00,-1981.93,40,0
    .goto 1443/1,1147.84,-1846.12,40,0
    .goto 1443/1,958.57,-1879.40,40,0
    >>Kill |cRXP_ENEMY_Kolkar Centaurs|r, |cRXP_ENEMY_Kolkar Scouts|r, |cRXP_ENEMY_Kolkar Maulers|r and |cRXP_ENEMY_Kolkar Windchasers|r. Loot them for |cRXP_LOOT_Centaur Ear|r
    .complete 1387,1 --Centaur Ear (15)
    .mob Kolkar Centaur
    .mob Kolkar Scout
    .mob Kolkar Mauler
    .mob Kolkar Windchaser
step
    .goto 1443/1,2604.94,-1923.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Uthek the Wise|r
    .turnin 93128 >>Turn in Khan Jehn
    .target Uthek the Wise
    .isOnQuest 93128
step
    .goto 1443/1,2604.94,-1923.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Uthek the Wise|r
    .turnin 93041 >>Turn in Facing the Truth
    .target Uthek the Wise
    .isOnQuest 93041
step
    .goto 1443/1,2604.94,-1923.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Uthek the Wise|r
    .turnin 1382 >>Turn in Strange Alliance
    .accept 93034 >>Accept Valley of Bones
    .target Uthek the Wise
step
    .goto 1443/1,2485.35,-362.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Azore Aldamort|r
    .turnin 5741 >>Turn in Sceptre of Light
    .target Azore Aldamort
step
    #completewith Drop635x4
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Kolkar Centaur|r, |cRXP_ENEMY_Kolkar Scout|r, |cRXP_ENEMY_Kolkar Mauler|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #label Drop635x4
    #loop
    .goto 1443/1,2920.55,53.06,0
    .goto 1443/1,2920.55,53.06,40,0
    .goto 1443/1,2989.79,74.95,40,0
    .goto 1443/1,3018.11,144.80,40,0
    .goto 1443/1,2988.44,214.65,40,0
    .goto 1443/1,2980.79,279.70,40,0
    .goto 1443/1,2848.62,214.65,40,0
    .goto 1443/1,2922.80,181.37,40,0
    .goto 1443/1,2948.42,120.51,40,0
    .goto 1443/1,2853.11,122.91,40,0
    >>Kill |cRXP_ENEMY_Slitherblade Nagas|r, |cRXP_ENEMY_Slitherblade Sorceress|r, |cRXP_ENEMY_Slitherblade Warriors|r and |cRXP_ENEMY_Slitherblade Myrmidons|r. Loot them for |cRXP_LOOT_Rackmore's Golden Key|r
    .complete 6161,2 --Rackmore's Golden Key (1)
    .mob Slitherblade Naga
    .mob Slitherblade Sorceress
    .mob Slitherblade Warrior
    .mob Slitherblade Myrmidon
step
    .goto 1443/1,2884.58,190.96
    >>Click the |cRXP_PICK_Rackmore's Chest|r
    .turnin 6161 >>Turn in Claim Rackmore's Treasure!
step
    .goto 1443/1,1232.81,126.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corporal Melkins|r
    .turnin 1387 >>Turn in Centaur Bounty
    .target Corporal Melkins
step << Hunter
    .goto 1443/1,924.40,86.34,0
    .goto 1443/1,654.65,-75.55,0
    .goto 1443/1,2273.15,-1418.62,0
    .goto 1443/1,690.62,-21.59,0
    >>|cRXP_WARN_Cast|r |T132164:0|t[Tame Beast] |cRXP_WARN_on a |cRXP_ENEMY_Scorpashi Lasher|r to tame it|r
    >>Use |T132172:0|t[Eagle Eye] to scout the spawn spots north of Sargeron (marked on your map) as they're much closer than the southen spawns
    .train 2975 >>|cRXP_WARN_Attack mobs with it to learn|r |T132140:0|t[Claw (Rank 5)]
step
    +|cRXP_WARN_That is all of Desolace for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Arathi Highlands|r: Crystal in the Mountains
    >>|cRXP_FRIENDLY_Shen'dralas|r: Valley of Bones, Valley of Bones
step
    .xp 34 >>|cRXP_WARN_The rest of Desolace is planned from level 34.|r Come back to this guide then
step
    #label RBSection2_1
    #completewith next
    +|cRXP_WARN_Desolace: part 2|r (planned from level 34)
step
    .goto 1443/1,1257.09,163.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kreldig Ungor|r
    .accept 1459 >>Accept Reagents for Reclaimers Inc.
    .target Kreldig Ungor
    .isQuestTurnedIn 1458 --any of: Reagents for Reclaimers Inc.
    .xp <30,1
step
    .goto 1443/1,1257.09,163.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kreldig Ungor|r
    .accept 1456 >>Accept The Karnitol Shipwreck
    .target Kreldig Ungor
    .isQuestTurnedIn 1455 --any of: The Karnitol Shipwreck
    .xp <30,1
step
    .goto 1443/1,1766.92,-331.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dalinda Malem|r
    .accept 1439 >>Accept Search for Tyranis
    .target Dalinda Malem
    .isQuestTurnedIn 1438 --any of: Vahlarriel's Search
step
    .goto 1443/1,1850.09,-419.71
    >>Kill |cRXP_ENEMY_Tyranis Malem|r and loot |cRXP_LOOT_Tyranis' Pendant|r
    .complete 1439,1 --Tyranis' Pendant (1)
    .mob Tyranis Malem
    .isOnQuest 1439
step
    .goto 1443/1,1766.92,-331.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dalinda Malem|r
    .turnin 1439 >>Turn in Search for Tyranis
    .target Dalinda Malem
    .isOnQuest 1439
step
    .goto 1443/1,1766.92,-331.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dalinda Malem|r
    .accept 1440 >>Accept Return to Vahlarriel
    .target Dalinda Malem
    .isQuestTurnedIn 1439 --any of: Search for Tyranis
step
    .goto 1443/1,1613.61,-474.57
    >>Rescue Dalinda Malem
    .complete 1440,1 --Rescue Dalinda Malem
    .isOnQuest 1440
step
    #loop
    .goto 1443/1,1287.21,-546.22,0
    .goto 1443/1,1287.21,-546.22,40,0
    .goto 1443/1,1228.32,-689.82,40,0
    .goto 1443/1,1184.26,-858.91,40,0
    .goto 1443/1,1183.36,-1037.28,40,0
    .goto 1443/1,1212.58,-1389.24,40,0
    .goto 1443/1,1434.68,-1487.57,40,0
    .goto 1443/1,1658.12,-1500.76,40,0
    .goto 1443/1,1858.18,-1681.53,40,0
    .goto 1443/1,2082.53,-1810.44,40,0
    .goto 1443/1,2379.25,-1893.79,40,0
    .goto 1443/1,2433.65,-1893.79,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cork Gizelton|r. |cRXP_WARN_This NPC walks a patrol route|r
    .accept 5821 >>Accept Bodyguard for Hire
    .unitscan Cork Gizelton
step
    .goto 1443/1,1213.48,-1245.34
    >>Escort Gizelton Caravan past Kolkar Centaur Village
    .complete 5821,1 --Escort Gizelton Caravan past Kolkar Centaur Village
step
    .goto 1443/1,862.81,-1591.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warug|r
    .turnin 92743 >>Turn in A Conqueror's Crown
    .target Warug
    .isOnQuest 92743
step
    .goto 1443/1,1497.17,-1402.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Smeed Scrabblescrew|r
    .turnin 5821 >>Turn in Bodyguard for Hire
    .accept 5561 >>Accept Kodo Roundup
    .target Smeed Scrabblescrew
step
    #loop
    .goto 1443/1,1730.05,-1426.11,0
    .goto 1443/1,1730.05,-1426.11,40,0
    .goto 1443/1,1793.44,-1443.80,40,0
    .goto 1443/1,1876.62,-1412.62,40,0
    .goto 1443/1,1884.71,-1365.85,40,0
    .goto 1443/1,1808.28,-1376.35,40,0
    >>Kill |cRXP_ENEMY_Aged Kodos|r, |cRXP_ENEMY_Dying Kodos|r and |cRXP_ENEMY_Ancient Kodos|r
    .complete 5561,1 --Aged Kodo (5)
    .mob Aged Kodo
    .mob Dying Kodo
    .mob Ancient Kodo
step
    .goto 1443/1,1497.17,-1402.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Smeed Scrabblescrew|r
    .turnin 5561 >>Turn in Kodo Roundup
    .target Smeed Scrabblescrew
step
    #loop
    .goto 1443/1,1378.48,-596.59,0
    .goto 1443/1,1378.48,-596.59,40,0
    .goto 1443/1,1388.37,-542.63,40,0
    .goto 1443/1,1400.51,-481.77,40,0
    >>Kill |cRXP_ENEMY_Scorpashi Snappers|r, |cRXP_ENEMY_Scorpashi Lashers|r and |cRXP_ENEMY_Scorpashi Venomlashes|r. Loot them for |cRXP_LOOT_Scorpashi Venom|r
    .complete 1459,1 --Scorpashi Venom (1)
    .mob Scorpashi Snapper
    .mob Scorpashi Lasher
    .mob Scorpashi Venomlash
    .isOnQuest 1459
step
    #loop
    .goto 1443/1,1821.32,-1247.44,0
    .goto 1443/1,1821.32,-1247.44,40,0
    .goto 1443/1,1868.08,-1270.52,40,0
    .goto 1443/1,1962.49,-1245.64,40,0
    .goto 1443/1,1897.75,-1229.75,40,0
    >>Kill |cRXP_ENEMY_Aged Kodos|r. Loot them for |cRXP_LOOT_Aged Kodo Hide|r
    .complete 1459,2 --Aged Kodo Hide (3)
    .mob Aged Kodo
    .isOnQuest 1459
step
    #loop
    .goto 1443/1,2853.11,122.91,0
    .goto 1443/1,2853.11,122.91,40,0
    .goto 1443/1,2842.77,159.19,40,0
    .goto 1443/1,2848.62,214.65,40,0
    .goto 1443/1,2885.03,218.25,40,0
    .goto 1443/1,2922.80,181.37,40,0
    .goto 1443/1,2986.64,179.57,40,0
    .goto 1443/1,2989.79,74.95,40,0
    .goto 1443/1,2944.83,77.34,40,0
    .goto 1443/1,2922.35,112.12,40,0
    >>Kill |cRXP_ENEMY_Slitherblade Tidehunters|r and |cRXP_ENEMY_Slitherblade Sea Witches|r. Loot them for |cRXP_LOOT_Karnitol's Satchel|r
    .complete 1456,1 --Karnitol's Satchel (1)
    .mob Slitherblade Tidehunter
    .mob Slitherblade Sea Witch
    .isOnQuest 1456
step
    .goto 1443/1,1257.09,163.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kreldig Ungor|r
    .turnin 1456 >>Turn in The Karnitol Shipwreck
    .target Kreldig Ungor
    .isOnQuest 1456
step
    .goto 1443/1,1257.09,163.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kreldig Ungor|r
    .accept 1457 >>Accept The Karnitol Shipwreck
    .target Kreldig Ungor
    .isQuestTurnedIn 1456 --any of: The Karnitol Shipwreck
    .xp <30,1
step
    .goto 1443/1,1257.09,163.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kreldig Ungor|r
    .turnin 1459 >>Turn in Reagents for Reclaimers Inc.
    .target Kreldig Ungor
    .isOnQuest 1459
step
    .goto 1443/1,1246.30,97.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vahlarriel Demonslayer|r
    .turnin 1440 >>Turn in Return to Vahlarriel
    .target Vahlarriel Demonslayer
    .isOnQuest 1440
step
    +|cRXP_WARN_That is all of Desolace for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Ironforge|r: The Karnitol Shipwreck
step
    .xp 37 >>|cRXP_WARN_The rest of Desolace is planned from level 37.|r Come back to this guide then
step
    #label RBSection3_1
    #completewith next
    +|cRXP_WARN_Desolace: part 3|r (planned from level 37)
step
    .goto 1443/1,1242.70,214.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Anton|r
    .accept 261 >>Accept Down the Scarlet Path
    .target Brother Anton
step
    .goto 1443/1,1236.41,124.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Pentigast|r
    .accept 93224 >>Accept Carved Centaur Totems
    .target Captain Pentigast
step
    .goto 1443/1,1431.08,-716.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bibbly F'utzbuckle|r
    .accept 5501 >>Accept Bone Collector
    .target Bibbly F'utzbuckle
step
    .goto 1443/1,862.81,-1591.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warug|r
    .turnin 92743 >>Turn in A Conqueror's Crown
    .target Warug
    .isOnQuest 92743
step
    #loop
    .goto 1443/1,1357.35,-1991.22,0
    .goto 1443/1,1357.35,-1991.22,40,0
    .goto 1443/1,1348.36,-2083.25,40,0
    .goto 1443/1,1359.60,-2163.00,40,0
    .goto 1443/1,1361.39,-2216.96,40,0
    .goto 1443/1,1399.61,-2246.04,40,0
    .goto 1443/1,1401.86,-2309.90,40,0
    .goto 1443/1,1353.75,-2285.31,40,0
    .goto 1443/1,1318.68,-2248.14,40,0
    .goto 1443/1,1302.50,-2142.01,40,0
    >>Kill |cRXP_ENEMY_Undead Ravagers|r
    .complete 261,1 --Undead Ravager slain (30)
    .mob Undead Ravager
step
    #loop
    .goto 1443/1,2433.65,-1893.79,0
    .goto 1443/1,2433.65,-1893.79,40,0
    .goto 1443/1,2379.25,-1893.79,40,0
    .goto 1443/1,2082.53,-1810.44,40,0
    .goto 1443/1,1858.18,-1681.53,40,0
    .goto 1443/1,1658.12,-1500.76,40,0
    .goto 1443/1,1434.68,-1487.57,40,0
    .goto 1443/1,1212.58,-1389.24,40,0
    .goto 1443/1,1183.36,-1037.28,40,0
    .goto 1443/1,1184.26,-858.91,40,0
    .goto 1443/1,1228.32,-689.82,40,0
    .goto 1443/1,1287.21,-546.22,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rigger Gizelton|r. |cRXP_WARN_This NPC walks a patrol route|r
    .accept 5943 >>Accept Gizelton Caravan
    .unitscan Rigger Gizelton
step
    .goto 1443/1,1729.60,-1580.20
    >>Escort Gizelton Caravan past Mannoroc Coven
    .complete 5943,1 --Escort Gizelton Caravan past Mannoroc Coven
step
    #loop
    .goto 1443/1,1785.80,-1461.49,0
    .goto 1443/1,1785.80,-1461.49,40,0
    .goto 1443/1,1838.85,-1383.84,40,0
    .goto 1443/1,1934.16,-1347.27,40,0
    .goto 1443/1,2031.72,-1349.36,40,0
    .goto 1443/1,2101.86,-1276.82,40,0
    .goto 1443/1,1999.80,-1259.13,40,0
    .goto 1443/1,1887.41,-1303.80,40,0
    .goto 1443/1,1810.53,-1290.31,40,0
    .goto 1443/1,1787.15,-1358.06,40,0
    >>Loot the |cRXP_PICK_Kodo Bones|r for |cRXP_LOOT_Kodo Bone|r
    .complete 5501,1 --Kodo Bone (10)
step
    .goto 1443/1,1497.17,-1402.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Smeed Scrabblescrew|r
    .turnin 5943 >>Turn in Gizelton Caravan
    .target Smeed Scrabblescrew
step
    .goto 1443/1,1431.08,-716.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bibbly F'utzbuckle|r
    .turnin 5501 >>Turn in Bone Collector
    .target Bibbly F'utzbuckle
step
    .goto 1443/1,2485.35,-362.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Azore Aldamort|r
    .accept 6027 >>Accept Book of the Ancients
    .target Azore Aldamort
    .isQuestTurnedIn 5741 --any of: Sceptre of Light
step
    .goto 1443/1,2963.71,252.12
    >>Kill |cRXP_ENEMY_Lord Kragaru|r and loot |cRXP_LOOT_Book of the Ancients|r
    .complete 6027,1 --Book of the Ancients (1)
    .mob Lord Kragaru
    .isOnQuest 6027
step
    .goto 1443/1,2485.35,-362.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Azore Aldamort|r
    .turnin 6027 >>Turn in Book of the Ancients
    .target Azore Aldamort
    .isOnQuest 6027
step
    .goto 1443/1,1242.70,214.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Anton|r
    .turnin 261 >>Turn in Down the Scarlet Path
    .accept 1052 >>Accept Down the Scarlet Path
    .target Brother Anton
step
    #loop
    .goto 1443/1,2644.96,-1153.90,0
    .goto 1443/1,2644.96,-1153.90,40,0
    .goto 1443/1,2552.34,-1375.15,40,0
    .goto 1443/1,2647.20,-1388.94,40,0
    .goto 1443/1,2617.08,-1318.19,40,0
    .goto 1443/1,2654.85,-1288.51,40,0
    .goto 1443/1,2682.27,-1248.93,40,0
    .goto 1443/1,2716.89,-1219.26,40,0
    .goto 1443/1,2758.70,-1151.20,40,0
    .goto 1443/1,2693.51,-1179.98,40,0
    >>Kill |cRXP_ENEMY_Maraudine Scouts|r, |cRXP_ENEMY_Maraudine Wranglers|r, |cRXP_ENEMY_Maraudine Maulers|r and |cRXP_ENEMY_Maraudine Windchasers|r. Loot them for |cRXP_LOOT_Carved Centaur Totem|r
    .complete 93224,1 --Carved Centaur Totem (5)
    .mob Maraudine Scout
    .mob Maraudine Wrangler
    .mob Maraudine Mauler
    .mob Maraudine Windchaser
step
    .goto 1443/1,2707.00,-1151.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Melizza Brimbuzzle|r
    .accept 6132 >>Accept Get Me Out of Here!
    .target Melizza Brimbuzzle
step
    .goto 1443/1,2428.26,-1394.03
    >>Melizza Brimbuzzle escorted to safety
    .complete 6132,1 --Melizza Brimbuzzle escorted to safety
step
    .goto 1443/1,2082.98,-1401.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hornizz Brimbuzzle|r
    .turnin 6132 >>Turn in Get Me Out of Here!
    .target Hornizz Brimbuzzle
step
    .goto 1443/1,1257.09,163.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kreldig Ungor|r
    .accept 1466 >>Accept Reagents for Reclaimers Inc.
    .target Kreldig Ungor
    .isQuestTurnedIn 1459 --any of: Reagents for Reclaimers Inc.
    .xp <30,1
step
    .goto 1443/1,1236.41,124.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Pentigast|r
    .turnin 93224 >>Turn in Carved Centaur Totems while you are here
    .isQuestComplete 93224
    .target Captain Pentigast
step
    #loop
    .goto 1443/1,1614.06,-1812.54,0
    .goto 1443/1,1614.06,-1812.54,40,0
    .goto 1443/1,1676.10,-1811.04,40,0
    .goto 1443/1,1727.36,-1877.30,40,0
    .goto 1443/1,1685.99,-1877.30,40,0
    >>Kill |cRXP_ENEMY_Mana Eaters|r, |cRXP_ENEMY_Mage Hunters|r and |cRXP_ENEMY_Ley Hunters|r. Loot them for |cRXP_LOOT_Felhound Brain|r
    .complete 1466,1 --Felhound Brain (10)
    .mob Mana Eater
    .mob Mage Hunter
    .mob Ley Hunter
    .isOnQuest 1466
step
    #loop
    .goto 1443/1,1879.31,-2046.98,0
    .goto 1443/1,1879.31,-2046.98,40,0
    .goto 1443/1,1868.97,-2100.34,40,0
    .goto 1443/1,1902.24,-2086.55,40,0
    .goto 1443/1,1894.60,-2064.97,40,0
    .goto 1443/1,1956.64,-2023.30,40,0
    >>Kill |cRXP_ENEMY_Nether Maidens|r, |cRXP_ENEMY_Nether Sisters|r and |cRXP_ENEMY_Nether Sorceress|r. Loot them for |cRXP_LOOT_Nether Wing|r
    .complete 1466,2 --Nether Wing (10)
    .mob Nether Maiden
    .mob Nether Sister
    .mob Nether Sorceress
    .isOnQuest 1466
step
    #loop
    .goto 1443/1,1904.94,-2051.78,0
    .goto 1443/1,1904.94,-2051.78,40,0
    .goto 1443/1,1920.68,-2001.41,40,0
    .goto 1443/1,1943.61,-2043.38,40,0
    .goto 1443/1,1933.71,-2130.02,40,0
    .goto 1443/1,1913.03,-2075.76,40,0
    .goto 1443/1,1871.67,-2063.17,40,0
    >>Kill |cRXP_ENEMY_Doomwarder Captains|r, |cRXP_ENEMY_Lord Azrethocs|r and |cRXP_ENEMY_Kaskks|r. Loot them for |cRXP_LOOT_Doomwarder Blood|r
    .complete 1466,3 --Doomwarder Blood (1)
    .mob Doomwarder Captain
    .mob Lord Azrethoc
    .mob Kaskk
    .isOnQuest 1466
step
    .goto 1443/1,1257.09,163.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kreldig Ungor|r
    .turnin 1466 >>Turn in Reagents for Reclaimers Inc.
    .target Kreldig Ungor
    .isOnQuest 1466
step
    .goto 1443/1,1257.09,163.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kreldig Ungor|r
    .accept 1467 >>Accept Reagents for Reclaimers Inc.
    .target Kreldig Ungor
    .isQuestTurnedIn 1466 --any of: Reagents for Reclaimers Inc.
    .xp <30,1
step
    .goto 1443/1,2082.98,-1401.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hornizz Brimbuzzle|r
    .accept 6134 >>Accept Ghost-o-plasm Round Up
    .target Hornizz Brimbuzzle
step
    .goto 1443/1,1347.91,-2294.91
    >>Kill |cRXP_ENEMY_Magrami Spectres|r. Loot them for |cRXP_LOOT_Ghost-o-plasm|r
    .complete 6134,1 --Ghost-o-plasm (8)
    .mob Magrami Spectre
step
    .goto 1443/1,2082.98,-1401.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hornizz Brimbuzzle|r
    .turnin 6134 >>Turn in Ghost-o-plasm Round Up
    .target Hornizz Brimbuzzle
step
    .goto 1443/1,1236.41,124.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Pentigast|r
    .turnin 93224 >>Turn in Carved Centaur Totems
    .target Captain Pentigast
step
    +|cRXP_WARN_End of the Desolace route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Hillsbrad Foothills|r: Down the Scarlet Path
    >>|cRXP_FRIENDLY_Ironforge|r: Reagents for Reclaimers Inc.
]])
