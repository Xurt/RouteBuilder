-- 31-45 Desolace: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 4 parts (from level 31, 34, 37, 40).
-- Split into 4 guides, listed under "31 - 41 Desolace" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Desolace.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 31 - 41 Desolace
#subweight -31
#name 31-32 Desolace: around Gurda Wildmane

step << Warrior/Hunter/Rogue/Druid/Shaman
    .goto 1443/1,1718.36,-423.01
    .xp 35 >> Grind Burning Blade mobs at Thunder Axe Fortress to level 35
step
    .goto 1443/1,2485.35,-362.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Azore Aldamort|r
    .accept 5741 >>Accept Sceptre of Light
    .target Azore Aldamort
step
    .goto 1443/1,1707.12,-1333.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Felgur Twocuts|r
    .turnin 1362 >>Turn in The Kolkar of Desolace
    .target Felgur Twocuts
    .isOnQuest 1362
step
    .goto 1443/1,1702.63,-1337.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gurda Wildmane|r
    .accept 94872 >>Accept Buying Friendship: Magram
    .accept 94873 >>Accept Buying Friendship: Gelkis
    .target Gurda Wildmane
step
    .goto 1443/1,1742.19,-1221.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nataka Longhorn|r
    .turnin 5361 >>Turn in Family Tree
    .target Nataka Longhorn
    .isOnQuest 5361
step
    .goto 1443/1,1869.87,-1178.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Takata Steelblade|r
    .turnin 1432 >>Turn in Alliance Relations
    .target Takata Steelblade
    .isOnQuest 1432
step
    .goto 1443/1,1869.87,-1178.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Takata Steelblade|r
    .accept 1433 >>Accept Alliance Relations
    .target Takata Steelblade
    .isQuestTurnedIn 1432 --any of: Alliance Relations
    .xp <30,1
step
    .goto 1443/1,1869.87,-1178.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Takata Steelblade|r
    .accept 1434 >>Accept Befouled by Satyr
    .target Takata Steelblade
    .isQuestTurnedIn 1432 --any of: Alliance Relations
    .xp <25,1
step
    .goto 1443/1,1884.26,-1150.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maurin Bonesplitter|r
    .turnin 1433 >>Turn in Alliance Relations
    .target Maurin Bonesplitter
    .isOnQuest 1433
step
    .goto 1443/1,1884.26,-1150.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maurin Bonesplitter|r
    .accept 1435 >>Accept The Burning of Spirits
    .target Maurin Bonesplitter
    .isQuestTurnedIn 1433 --any of: Alliance Relations
    .xp <25,1
step
    .goto 1443/1,1702.63,-1337.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gurda Wildmane|r
    .accept 1368 >>Accept Gelkis Alliance
    .accept 1367 >>Accept Magram Alliance
    .target Gurda Wildmane
step
    .goto 1443/1,862.81,-1591.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warug|r
    .turnin 1367 >>Turn in Magram Alliance
    .accept 92743 >>Accept A Conqueror's Crown
    .target Warug
step
    .goto 1443/1,862.81,-1591.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warug|r
    >>|cRXP_WARN_The database has no objectives for A Conqueror's Crown. Skip this step if the quest is not finished|r
    .turnin 92743 >>Turn in A Conqueror's Crown
    .target Warug
    .isOnQuest 92743
step
    .goto 1443/1,1256.64,-1927.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gorhak|r
    .turnin 94872 >>Turn in Buying Friendship: Magram
    .target Gorhak
step
    #completewith Drop635x1
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Kolkar Centaur|r, |cRXP_ENEMY_Kolkar Scout|r, |cRXP_ENEMY_Kolkar Mauler|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #loop
    .goto 1443/1,926.65,-120.82,0
    .goto 1443/1,926.65,-120.82,40,0
    .goto 1443/1,914.96,-50.67,40,0
    .goto 1443/1,984.64,-56.96,40,0
    .goto 1443/1,1044.89,-47.07,40,0
    >>Kill |cRXP_ENEMY_Hatefury Rogues|r
    .complete 1434,1 --Hatefury Rogue slain (7)
    .mob Hatefury Rogue
    .isOnQuest 1434
step
    #loop
    .goto 1443/1,1017.91,-151.10,0
    .goto 1443/1,1017.91,-151.10,40,0
    .goto 1443/1,982.40,-187.67,40,0
    .goto 1443/1,945.08,-155.89,40,0
    .goto 1443/1,873.60,-143.30,40,0
    .goto 1443/1,848.42,-125.92,40,0
    .goto 1443/1,815.15,-85.44,40,0
    .goto 1443/1,782.33,-51.27,40,0
    >>Kill |cRXP_ENEMY_Hatefury Felsworns|r
    .complete 1434,2 --Hatefury Felsworn slain (7)
    .mob Hatefury Felsworn
    .isOnQuest 1434
step
    #loop
    .goto 1443/1,985.09,-113.92,0
    .goto 1443/1,985.09,-113.92,40,0
    .goto 1443/1,959.02,-51.87,40,0
    .goto 1443/1,916.76,19.48,40,0
    .goto 1443/1,986.44,11.39,40,0
    .goto 1443/1,1035.90,2.70,40,0
    >>Kill |cRXP_ENEMY_Hatefury Betrayers|r
    .complete 1434,3 --Hatefury Betrayer slain (7)
    .mob Hatefury Betrayer
    .isOnQuest 1434
step
    #label Drop635x1
    #loop
    .goto 1443/1,759.40,-258.72,0
    .goto 1443/1,759.40,-258.72,40,0
    .goto 1443/1,721.64,-238.34,40,0
    .goto 1443/1,694.66,-242.23,40,0
    .goto 1443/1,780.98,-314.48,40,0
    >>Kill |cRXP_ENEMY_Hatefury Hellcallers|r
    .complete 1434,4 --Hatefury Hellcaller slain (7)
    .mob Hatefury Hellcaller
    .isOnQuest 1434
step
    .goto 1443/1,1869.87,-1178.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Takata Steelblade|r
    .turnin 1434 >>Turn in Befouled by Satyr
    .target Takata Steelblade
    .isOnQuest 1434
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
    .turnin 1368 >>Turn in Gelkis Alliance
    .accept 93034 >>Accept Valley of Bones
    .target Uthek the Wise
step
    .goto 1443/1,3093.64,-1561.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aka'rai|r
    .accept 97265 >>Accept Hate the Hatefury
    .target Aka'rai
step
    .goto 1443/1,3150.29,-1592.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Sikewa|r
    .target Innkeeper Sikewa
    .home >>Set your Hearthstone to Innkeeper Sikewa's inn
step << Mage
    .goto 1443/1,3150.29,-1592.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Sikewa|r
    .target Innkeeper Sikewa
    .train 3566,3
step
    .goto 1443/1,3215.48,-1705.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mai'Lahii|r
    .accept 6142 >>Accept Clam Bait
    .target Mai'Lahii
step
    .goto 1443/1,3262.23,-1770.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thalon|r at the end of the dock
    .fp Shadowprey Village >> Get the Shadowprey Village flight path
    .target Thalon
    .subzoneskip 2408,1
step
    #completewith Drop1480x1
    >>|cRXP_LOOT_Flayed Demon Skin|r can drop from |cRXP_ENEMY_Burning Blade Augur|r, |cRXP_ENEMY_Burning Blade Reaver|r, |cRXP_ENEMY_Burning Blade Adept|r. Use it to start the quest if you get one
    .collect 20310,1,1480 --Flayed Demon Skin (1)
    .accept 1480 >>Accept The Corrupter
    .use 20310
step
    #label Drop1480x1
    .goto 1443/1,1752.98,-451.79
    >>Kill |cRXP_ENEMY_Burning Blade Seer|r and loot |cRXP_LOOT_Sceptre of Light|r
    .complete 5741,1 --Sceptre of Light (1)
    .mob Burning Blade Seer
step
    .goto 1443/1,1236.41,124.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Pentigast|r
    .accept 93227 >>Accept Buying Friendship: Gelkis
    .target Captain Pentigast
step
    #completewith Drop635x2
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Kolkar Centaur|r, |cRXP_ENEMY_Kolkar Scout|r, |cRXP_ENEMY_Kolkar Mauler|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #loop
    .goto 1443/1,1044.89,-47.07,0
    .goto 1443/1,1044.89,-47.07,40,0
    .goto 1443/1,984.64,-56.96,40,0
    .goto 1443/1,914.96,-50.67,40,0
    .goto 1443/1,926.65,-120.82,40,0
    >>Kill |cRXP_ENEMY_Hatefury Rogues|r
    .complete 97265,5 --Hatefury Rogue slain (8)
    .mob Hatefury Rogue
step
    #label Drop635x2
    #loop
    .goto 1443/1,982.40,-187.67,0
    .goto 1443/1,982.40,-187.67,40,0
    .goto 1443/1,873.60,-143.30,40,0
    .goto 1443/1,788.18,-113.62,40,0
    .goto 1443/1,678.93,-20.09,40,0
    .goto 1443/1,684.32,-220.05,40,0
    .goto 1443/1,795.37,-256.32,40,0
    .goto 1443/1,816.05,-414.01,40,0
    .goto 1443/1,882.14,-351.06,40,0
    .goto 1443/1,886.63,-277.91,40,0
    >>Kill |cRXP_ENEMY_Hatefury Tricksters|r
    >>Kill |cRXP_ENEMY_Hatefury Hellcallers|r
    >>Kill |cRXP_ENEMY_Hatefury Shadowstalkers|r
    >>Kill |cRXP_ENEMY_Hatefury Felsworns|r
    .complete 97265,1 --Hatefury Trickster slain (8)
    .complete 97265,2 --Hatefury Hellcaller slain (8)
    .complete 97265,3 --Hatefury Shadowstalker slain (8)
    .complete 97265,4 --Hatefury Felsworn slain (8)
    .mob Hatefury Trickster
    .mob Hatefury Hellcaller
    .mob Hatefury Shadowstalker
    .mob Hatefury Felsworn
step
    .goto 1443/1,1884.26,-1150.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maurin Bonesplitter|r
    .turnin 1480 >>Turn in The Corrupter
    .target Maurin Bonesplitter
    .isOnQuest 1480
step
    .goto 1443/1,1884.26,-1150.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maurin Bonesplitter|r
    .accept 1481 >>Accept The Corrupter
    .target Maurin Bonesplitter
    .isQuestTurnedIn 1480 --any of: The Corrupter
    .xp <25,1
step
    #completewith Drop635x3
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Kolkar Centaur|r, |cRXP_ENEMY_Kolkar Scout|r, |cRXP_ENEMY_Kolkar Mauler|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #label Drop635x3
    #loop
    .goto 1443/1,794.47,-263.52,0
    .goto 1443/1,794.47,-263.52,40,0
    .goto 1443/1,795.37,-256.32,40,0
    .goto 1443/1,771.54,-89.04,40,0
    .goto 1443/1,846.62,-185.27,40,0
    >>Kill |cRXP_ENEMY_Hatefury Shadowstalker|r and loot |cRXP_LOOT_Shadowstalker Scalp|r
    .complete 1481,1 --Shadowstalker Scalp (1)
    .mob Hatefury Shadowstalker
    .isOnQuest 1481
step
    .goto 1443/1,1884.26,-1150.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maurin Bonesplitter|r
    .turnin 1481 >>Turn in The Corrupter
    .target Maurin Bonesplitter
    .isOnQuest 1481
step
    .goto 1443/1,1931.47,-1144.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Harnor|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Harnor
    .subzoneskip 597,1
step << !Warrior !Hunter !Rogue !Druid !Shaman
    .goto 1443/1,1180.66,-1754.08,60,0
    .goto 1443/1,1182.46,-1820.34,60,0
    .goto 1443/1,1254.39,-1817.34,60,0
    .goto 1443/1,1279.57,-1912.07,60,0
    .goto 1443/1,1248.10,-1947.75,60,0
    .goto 1443/1,1150.99,-1976.53,60,0
    .goto 1443/1,987.34,-1896.78,60,0
    .goto 1443/1,1043.54,-1799.05,60,0
    .goto 1443/1,935.19,-1747.49,60,0
    .goto 1443/1,1104.23,-1881.79,60,0
    .xp 35+17000 >> Grind to level 35 17000/67100
step
    #completewith Drop635x4
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Kolkar Centaur|r, |cRXP_ENEMY_Kolkar Scout|r, |cRXP_ENEMY_Kolkar Mauler|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #completewith Drop635x4
    >>|cRXP_LOOT_Flayed Demon Skin|r can drop from |cRXP_ENEMY_Burning Blade Augur|r, |cRXP_ENEMY_Burning Blade Reaver|r, |cRXP_ENEMY_Burning Blade Adept|r. Use it to start the quest if you get one
    .collect 20310,1,1480 --Flayed Demon Skin (1)
    .accept 1480 >>Accept The Corrupter
    .use 20310
step
    #label Drop635x4
    #loop
    .goto 1443/1,1648.68,-408.02,0
    .goto 1443/1,1648.68,-408.02,40,0
    .goto 1443/1,1639.24,-336.37,40,0
    .goto 1443/1,1676.10,-284.50,40,0
    .goto 1443/1,1658.12,-220.35,40,0
    .goto 1443/1,1697.68,-193.97,40,0
    .goto 1443/1,1744.89,-187.07,40,0
    .goto 1443/1,1775.91,-286.60,40,0
    .goto 1443/1,1749.83,-354.06,40,0
    .goto 1443/1,1709.37,-323.48,40,0
    >>Kill |cRXP_ENEMY_Burning Blade Augurs|r, |cRXP_ENEMY_Burning Blade Reavers|r, |cRXP_ENEMY_Burning Blade Adepts|r and |cRXP_ENEMY_Burning Blade Felsworns|r. Loot them for |cRXP_LOOT_Infused Burning Gem|r
    .complete 1435,1 --Infused Burning Gem (15)
    .mob Burning Blade Augur
    .mob Burning Blade Reaver
    .mob Burning Blade Adept
    .mob Burning Blade Felsworn
    .isOnQuest 1435
step
    .goto 1443/1,2485.35,-362.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Azore Aldamort|r
    .turnin 5741 >>Turn in Sceptre of Light
    .target Azore Aldamort
step
    .goto 1443/1,2611.69,-459.58
    >>Click the |cRXP_PICK_Rackmore's Log|r
    .accept 6161 >>Accept Claim Rackmore's Treasure!
step
    #loop
    .goto 1443/1,2695.76,-369.35,0
    .goto 1443/1,2695.76,-369.35,40,0
    .goto 1443/1,2678.67,-325.28,40,0
    .goto 1443/1,2643.16,-298.00,40,0
    .goto 1443/1,2637.31,-297.40,40,0
    .goto 1443/1,2581.11,-279.11,40,0
    .goto 1443/1,2649.00,-221.85,40,0
    .goto 1443/1,2690.36,-241.03,40,0
    .goto 1443/1,2763.20,-309.39,40,0
    .goto 1443/1,2759.60,-346.56,40,0
    >>Kill |cRXP_ENEMY_Enraged Reef Crawler|r and loot |cRXP_LOOT_Soft-shelled Clam|r. It can also be picked up from |cRXP_PICK_Giant Softshell Clam|r on the ground
    .collect 15874,1,6142,1 --Soft-shelled Clam (1)
    .mob Enraged Reef Crawler
step
    #loop
    .goto 1443/1,2678.67,-325.28,0
    .goto 1443/1,2678.67,-325.28,40,0
    .goto 1443/1,2643.16,-298.00,40,0
    .goto 1443/1,2637.31,-297.40,40,0
    .goto 1443/1,2581.11,-279.11,40,0
    .goto 1443/1,2649.00,-221.85,40,0
    .goto 1443/1,2690.36,-241.03,40,0
    .goto 1443/1,2763.20,-309.39,40,0
    .goto 1443/1,2759.60,-346.56,40,0
    .goto 1443/1,2695.76,-369.35,40,0
    >>Kill |cRXP_ENEMY_Enraged Reef Crawler|r and loot |cRXP_LOOT_Soft-shelled Clam Meat|r. It can also be picked up from |cRXP_PICK_Giant Softshell Clam|r on the ground
    .complete 6142,1 --Soft-shelled Clam Meat (1)
    .mob Enraged Reef Crawler
step
    #completewith Drop635x5
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Kolkar Centaur|r, |cRXP_ENEMY_Kolkar Scout|r, |cRXP_ENEMY_Kolkar Mauler|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #loop
    .goto 1443/1,2719.59,-417.01,0
    .goto 1443/1,2719.59,-417.01,40,0
    .goto 1443/1,2821.64,-383.14,40,0
    .goto 1443/1,2813.55,-482.37,40,0
    .goto 1443/1,2818.49,-551.92,40,0
    .goto 1443/1,2824.34,-619.97,40,0
    .goto 1443/1,2749.26,-611.58,40,0
    .goto 1443/1,2653.95,-576.20,40,0
    .goto 1443/1,2665.19,-489.56,40,0
    .goto 1443/1,2748.81,-480.27,40,0
    >>Kill |cRXP_ENEMY_Drysnap Crawlers|r and |cRXP_ENEMY_Drysnap Pincers|r. Loot them for |cRXP_LOOT_Rackmore's Silver Key|r
    .complete 6161,1 --Rackmore's Silver Key (1)
    .mob Drysnap Crawler
    .mob Drysnap Pincer
step
    #label Drop635x5
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
    .goto 1443/1,1884.26,-1150.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maurin Bonesplitter|r
    .turnin 1435 >>Turn in The Burning of Spirits
    .target Maurin Bonesplitter
    .isOnQuest 1435
step
    .goto 1443/1,1869.87,-1178.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Takata Steelblade|r
    .accept 1436 >>Accept Alliance Relations
    .target Takata Steelblade
    .isQuestTurnedIn 1434 --Befouled by Satyr
    .isQuestTurnedIn 1435 --The Burning of Spirits
    .xp <30,1
step << Hunter
    .goto 1443/1,2324.85,-1652.15,0
    .goto 1443/1,2514.13,-1775.37,50,0
    .goto 1443/1,2324.85,-1652.15,50,0
    .goto 1443/1,2284.84,-1359.56,50,0
    .train 16831 >>|cRXP_WARN_Attack mobs with it to learn|r |T132140:0|t[Claw (Rank 5)]
step
    #completewith next
    .hs >>Hearth to Innkeeper Sikewa's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1443/1,3107.13,-1714.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Roon Wildmane|r
    .accept 5763 >>Accept Hunting in Stranglethorn
    .target Roon Wildmane
step
    .goto 1443/1,3215.48,-1705.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mai'Lahii|r
    .turnin 6142 >>Turn in Clam Bait
    .target Mai'Lahii
step << Mage
    .zoneskip Thunder Bluff
    .train 3566,3
step
    +|cRXP_WARN_That is all of Desolace for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Arathi Highlands|r: Crystal in the Mountains
    >>|cRXP_FRIENDLY_Orgrimmar|r: Alliance Relations
    >>|cRXP_FRIENDLY_Shen'dralas|r: Valley of Bones
    >>|cRXP_FRIENDLY_Stranglethorn Vale|r: Hunting in Stranglethorn
    >>|cRXP_FRIENDLY_another zone|r: Hate the Hatefury, Buying Friendship: Gelkis, Buying Friendship: Gelkis
step
    +|cRXP_WARN_The rest of Desolace is planned from level 34.|r Load its guide for level 34 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 31 - 41 Desolace
#subweight -31
#name 34-35 Desolace

step
    .goto 1443/1,1760.62,-333.37
    >>Click the |cRXP_PICK_Mysterious Book|r
    .accept 79950 >>Accept Demons and You
step
    .goto 1443/1,1760.62,-333.37
    >>Open the |cRXP_PICK_Mysterious Book|r. Loot it for |cRXP_LOOT_Demons and You|r
    .complete 79950,1 --Demons and You (1)
step
    .goto 1443/1,1707.12,-1333.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Felgur Twocuts|r
    .accept 1365 >>Accept Khan Dez'hepah
    .target Felgur Twocuts
step
    #loop
    .goto 1443/1,951.37,-980.92,0
    .goto 1443/1,951.37,-980.92,40,0
    .goto 1443/1,924.40,-944.95,40,0
    .goto 1443/1,888.43,-890.98,40,0
    .goto 1443/1,906.42,-855.01,40,0
    .goto 1443/1,942.38,-801.05,40,0
    .goto 1443/1,933.39,-837.02,40,0
    >>Kill |cRXP_ENEMY_Khan Dez'hepah|r and loot |cRXP_LOOT_Khan Dez'hepah's Head|r
    .complete 1365,1 --Khan Dez'hepah's Head (1)
    .mob Khan Dez'hepah
step
    .goto 1443/1,1884.26,-1150.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maurin Bonesplitter|r
    .accept 1482 >>Accept The Corrupter
    .target Maurin Bonesplitter
    .isQuestTurnedIn 1481 --any of: The Corrupter
    .xp <25,1
step
    .goto 1443/1,1707.12,-1333.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Felgur Twocuts|r
    .turnin 1365 >>Turn in Khan Dez'hepah
    .accept 1366 >>Accept Centaur Bounty
    .target Felgur Twocuts
step
    .goto 1443/1,1497.17,-1402.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Smeed Scrabblescrew|r
    .accept 5561 >>Accept Kodo Roundup
    .target Smeed Scrabblescrew
step
    #loop
    .goto 1443/1,1242.70,-1618.58,0
    .goto 1443/1,1242.70,-1618.58,40,0
    .goto 1443/1,1146.94,-1678.84,40,0
    .goto 1443/1,1029.15,-1689.93,40,0
    .goto 1443/1,958.57,-1879.40,40,0
    .goto 1443/1,1147.84,-1846.12,40,0
    .goto 1443/1,1084.00,-1981.93,40,0
    .goto 1443/1,1213.93,-2049.08,40,0
    .goto 1443/1,1314.19,-1884.79,40,0
    .goto 1443/1,1242.26,-1757.98,40,0
    >>Kill |cRXP_ENEMY_Kolkar Centaurs|r, |cRXP_ENEMY_Kolkar Scouts|r, |cRXP_ENEMY_Kolkar Maulers|r and |cRXP_ENEMY_Kolkar Windchasers|r. Loot them for |cRXP_LOOT_Centaur Ear|r
    .complete 1366,1 --Centaur Ear (15)
    .mob Kolkar Centaur
    .mob Kolkar Scout
    .mob Kolkar Mauler
    .mob Kolkar Windchaser
step
    .goto 1443/1,862.81,-1591.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warug|r
    .turnin 92743 >>Turn in A Conqueror's Crown
    .target Warug
    .isOnQuest 92743
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
    .goto 1443/1,1497.17,-1402.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Smeed Scrabblescrew|r
    .turnin 5821 >>Turn in Bodyguard for Hire
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
    .goto 1443/1,1707.12,-1333.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Felgur Twocuts|r
    .turnin 1366 >>Turn in Centaur Bounty
    .target Felgur Twocuts
step
    .goto 1443/1,3184.90,-1732.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drulzegar Skraghook|r
    .accept 6143 >>Accept Other Fish to Fry
    .target Drulzegar Skraghook
step
    #completewith Along17
    >>As you go: Kill |cRXP_ENEMY_Slitherblade Sorceress|r. |cRXP_WARN_Anything left is finished later|r
    .complete 6143,3 --Slitherblade Sorceress slain (5)
    .mob Slitherblade Sorceress
step
    .goto 1443/1,2988.44,214.65
    >>Kill |cRXP_ENEMY_Slitherblade Oracle|r and loot |cRXP_LOOT_Oracle Crystal|r
    .complete 1482,1 --Oracle Crystal (1)
    .mob Slitherblade Oracle
    .isOnQuest 1482
step
    #label Along17
    #loop
    .goto 1443/1,2821.19,-77.65,0
    .goto 1443/1,2821.19,-77.65,40,0
    .goto 1443/1,2845.47,-123.52,40,0
    .goto 1443/1,2786.57,-248.83,40,0
    .goto 1443/1,2770.84,-221.55,40,0
    .goto 1443/1,2715.99,-218.85,40,0
    .goto 1443/1,2796.02,-116.62,40,0
    >>Kill |cRXP_ENEMY_Slitherblade Myrmidons|r
    .complete 6143,1 --Slitherblade Myrmidon slain (7)
    .mob Slitherblade Myrmidon
step
    #loop
    .goto 1443/1,2752.41,-247.03,0
    .goto 1443/1,2752.41,-247.03,40,0
    .goto 1443/1,2820.74,-211.36,40,0
    .goto 1443/1,2641.81,-207.76,40,0
    .goto 1443/1,2603.59,-241.63,40,0
    .goto 1443/1,2582.46,-186.77,40,0
    .goto 1443/1,2519.07,-184.97,40,0
    .goto 1443/1,2481.31,-151.10,40,0
    .goto 1443/1,2504.24,-257.82,40,0
    .goto 1443/1,2618.88,-412.52,40,0
    >>Kill |cRXP_ENEMY_Slitherblade Nagas|r
    >>Kill |cRXP_ENEMY_Slitherblade Sorceress|r
    .complete 6143,2 --Slitherblade Naga slain (7)
    .complete 6143,3 --Slitherblade Sorceress slain (5)
    .mob Slitherblade Naga
    .mob Slitherblade Sorceress
step
    .goto 1443/1,1884.26,-1150.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maurin Bonesplitter|r
    .turnin 1482 >>Turn in The Corrupter
    .target Maurin Bonesplitter
    .isOnQuest 1482
step
    .goto 1443/1,1884.26,-1150.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maurin Bonesplitter|r
    .accept 1484 >>Accept The Corrupter
    .target Maurin Bonesplitter
    .isQuestTurnedIn 1482 --any of: The Corrupter
    .xp <25,1
step
    .goto 1443/1,1869.87,-1178.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Takata Steelblade|r
    .turnin 1484 >>Turn in The Corrupter
    .target Takata Steelblade
    .isOnQuest 1484
step
    .goto 1443/1,3184.90,-1732.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drulzegar Skraghook|r
    .turnin 6143 >>Turn in Other Fish to Fry
    .target Drulzegar Skraghook
step
    +|cRXP_WARN_That is all of Desolace for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Undercity|r: Demons and You
step
    +|cRXP_WARN_The rest of Desolace is planned from level 37.|r Load its guide for level 37 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 31 - 41 Desolace
#subweight -31
#name 37-38 Desolace

step
    .goto 1443/1,1431.08,-716.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bibbly F'utzbuckle|r
    .accept 5501 >>Accept Bone Collector
    .target Bibbly F'utzbuckle
step
    .goto 1443/1,1702.63,-1337.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gurda Wildmane|r
    .accept 93225 >>Accept Carved Centaur Totems
    .target Gurda Wildmane
step
    #loop
    .goto 1443/1,1787.15,-1358.06,0
    .goto 1443/1,1787.15,-1358.06,40,0
    .goto 1443/1,1810.53,-1290.31,40,0
    .goto 1443/1,1887.41,-1303.80,40,0
    .goto 1443/1,1999.80,-1259.13,40,0
    .goto 1443/1,2101.86,-1276.82,40,0
    .goto 1443/1,2031.72,-1349.36,40,0
    .goto 1443/1,1934.16,-1347.27,40,0
    .goto 1443/1,1838.85,-1383.84,40,0
    .goto 1443/1,1785.80,-1461.49,40,0
    >>Loot the |cRXP_PICK_Kodo Bones|r for |cRXP_LOOT_Kodo Bone|r
    .complete 5501,1 --Kodo Bone (10)
step
    #loop
    .goto 1443/1,2552.34,-1375.15,0
    .goto 1443/1,2552.34,-1375.15,40,0
    .goto 1443/1,2644.96,-1153.90,40,0
    .goto 1443/1,2693.51,-1179.98,40,0
    .goto 1443/1,2758.70,-1151.20,40,0
    .goto 1443/1,2716.89,-1219.26,40,0
    .goto 1443/1,2682.27,-1248.93,40,0
    .goto 1443/1,2654.85,-1288.51,40,0
    .goto 1443/1,2617.08,-1318.19,40,0
    .goto 1443/1,2647.20,-1388.94,40,0
    >>Kill |cRXP_ENEMY_Maraudine Scouts|r, |cRXP_ENEMY_Maraudine Wranglers|r, |cRXP_ENEMY_Maraudine Maulers|r and |cRXP_ENEMY_Maraudine Windchasers|r. Loot them for |cRXP_LOOT_Carved Centaur Totem|r
    .complete 93225,1 --Carved Centaur Totem (5)
    .mob Maraudine Scout
    .mob Maraudine Wrangler
    .mob Maraudine Mauler
    .mob Maraudine Windchaser
step
    .goto 1443/1,3072.51,-1592.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Taiga Wisemane|r
    .accept 5381 >>Accept Hand of Iruxos
    .target Taiga Wisemane
step
    .goto 1443/1,3150.29,-1592.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Sikewa|r
    .target Innkeeper Sikewa
    .home >>Set your Hearthstone to Innkeeper Sikewa's inn
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
    .goto 1443/1,1702.63,-1337.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gurda Wildmane|r
    .turnin 93225 >>Turn in Carved Centaur Totems
    .target Gurda Wildmane
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
    .goto 1443/1,1760.62,-345.36
    >>Kill |cRXP_ENEMY_Demon Spirit|r and loot |cRXP_LOOT_Demon Box|r
    .complete 5381,1 --Demon Box (1)
    .mob Demon Spirit
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
    .goto 1443/1,1742.19,-1221.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nataka Longhorn|r
    .accept 5386 >>Accept Catch of the Day
    .target Nataka Longhorn
step
    .goto 1443/1,862.81,-1591.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warug|r
    .turnin 92743 >>Turn in A Conqueror's Crown
    .target Warug
    .isOnQuest 92743
step
    #completewith next
    .hs >>Hearth to Innkeeper Sikewa's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1443/1,3224.02,-1739.99
    >>Kill |cRXP_ENEMY_Jinar'Zillens|r. Loot them for |cRXP_LOOT_Bloodbelly Fish|r
    .complete 5386,1 --Bloodbelly Fish (2)
    .mob Jinar'Zillen
step
    .goto 1443/1,1742.19,-1221.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nataka Longhorn|r
    .turnin 5386 >>Turn in Catch of the Day
    .target Nataka Longhorn
step
    .goto 1443/1,3072.51,-1592.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Taiga Wisemane|r
    .turnin 5381 >>Turn in Hand of Iruxos
    .accept 5581 >>Accept Portals of the Legion
    .target Taiga Wisemane
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
    #loop
    .goto 1443/1,1760.62,-1934.26,0
    .goto 1443/1,1760.62,-1934.26,40,0
    .goto 1443/1,1805.58,-1922.27,40,0
    .goto 1443/1,1850.54,-1946.25,40,0
    .goto 1443/1,1886.51,-1952.25,40,0
    .goto 1443/1,1949.45,-1976.23,40,0
    .goto 1443/1,1877.52,-1994.22,40,0
    .goto 1443/1,1859.53,-1988.22,40,0
    .goto 1443/1,1850.54,-2060.17,40,0
    >>Kill |cRXP_ENEMY_Demon Portal Guardians|r
    .complete 5581,1 --Portals Banished (8)
    .mob Demon Portal Guardian
step
    .goto 1443/1,2082.98,-1401.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hornizz Brimbuzzle|r
    .turnin 6134 >>Turn in Ghost-o-plasm Round Up
    .target Hornizz Brimbuzzle
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
    .goto 1443/1,3072.51,-1592.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Taiga Wisemane|r
    .turnin 5581 >>Turn in Portals of the Legion
    .target Taiga Wisemane
step
    +|cRXP_WARN_The rest of Desolace is planned from level 40.|r Load its guide for level 40 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 31 - 41 Desolace
#subweight -31
#name 40-41 Desolace

step
    .goto 1443/1,2277.20,-1914.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Umarak|r
    .accept 96222 >>Accept Khan Hratha
    .target Umarak
step
    #loop
    .goto 1443/1,2787.02,-1211.76,0
    .goto 1443/1,2787.02,-1211.76,40,0
    .goto 1443/1,2850.41,-1218.06,40,0
    .goto 1443/1,2915.15,-1211.16,40,0
    .goto 1443/1,2853.56,-1148.80,40,0
    .goto 1443/1,2901.22,-1117.63,40,0
    .goto 1443/1,2926.39,-1067.26,40,0
    .goto 1443/1,2820.74,-1081.65,40,0
    .goto 1443/1,2695.76,-1141.61,40,0
    .goto 1443/1,2758.70,-1151.20,40,0
    >>Kill |cRXP_ENEMY_Maraudine Scouts|r, |cRXP_ENEMY_Maraudine Wranglers|r, |cRXP_ENEMY_Maraudine Maulers|r and |cRXP_ENEMY_Maraudine Windchasers|r. Loot them for |cRXP_LOOT_War Horn Mouthpiece|r
    >>Kill |cRXP_ENEMY_Khan Hratha|r and loot |cRXP_LOOT_Maraudine Key Fragment|r
    .complete 96222,2 --War Horn Mouthpiece (1)
    .complete 96222,1 --Maraudine Key Fragment (1)
    .mob Maraudine Scout
    .mob Maraudine Wrangler
    .mob Maraudine Mauler
    .mob Maraudine Windchaser
    .mob Khan Hratha
step
    .goto 1443/1,1869.87,-1178.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Takata Steelblade|r
    .accept 1488 >>Accept The Corrupter
    .target Takata Steelblade
    .isQuestTurnedIn 1484 --any of: The Corrupter
    .xp <25,1
step
    .goto 1443/1,1672.96,-1818.54
    >>Kill |cRXP_ENEMY_Lord Azrethoc|r
    .complete 1488,1 --Lord Azrethoc slain (1)
    .mob Lord Azrethoc
    .isOnQuest 1488
step
    .goto 1443/1,1719.71,-1879.10
    >>Kill |cRXP_ENEMY_Jugkar Grim'rod|r
    .complete 1488,2 --Jugkar Grim'rod slain (1)
    .mob Jugkar Grim'rod
    .isOnQuest 1488
step
    .goto 1443/1,1869.87,-1178.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Takata Steelblade|r
    .turnin 1488 >>Turn in The Corrupter
    .target Takata Steelblade
    .isOnQuest 1488
step
    .goto 1443/1,862.81,-1591.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warug|r
    .turnin 92743 >>Turn in A Conqueror's Crown
    .target Warug
    .isOnQuest 92743
step
    +|cRXP_WARN_End of the Desolace route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_another zone|r: Khan Hratha
]])
