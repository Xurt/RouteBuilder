-- 14-26 Redridge Mountains: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 5 parts with a level check between them (from level 14, 17, 20, 23, 26).
-- Edit zones/Redridge Mountains.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#name 14-26 Redridge Mountains

step
    .goto 1433/0,-1902.24,-9609.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Guard Parker|r
    .accept 244 >>Accept Encroaching Gnolls
    .target Guard Parker
step
    .goto 1433/0,-2237.85,-9443.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deputy Feldon|r
    .turnin 244 >>Turn in Encroaching Gnolls
    .accept 246 >>Accept Assessing the Threat
    .accept 98407 >>Accept Show of Force
    .target Deputy Feldon
step << NightElf
    .goto 1433/0,-2234.900,-9435.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ariena Stormfeather|r
    .fp Redridge Mountains >> Get the Redridge Mountains flight path
    .target Ariena Stormfeather
step
    .goto 1433/0,-2243.06,-9259.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Verner Osgood|r
    .accept 1097 >>Accept Elmore's Task
    .accept 118 >>Accept The Price of Shoes
    .target Verner Osgood
step
    .goto 1433/0,-2221.79,-9218.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Solomon|r
    .turnin 144 >>Turn in Messenger to Westfall
    .target Magistrate Solomon
    .isOnQuest 144
step
    .goto 1433/0,-2221.79,-9218.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Solomon|r
    .turnin 146 >>Turn in Messenger to Darkshire
    .target Magistrate Solomon
    .isOnQuest 146
step
    .goto 1433/0,-2221.79,-9218.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Solomon|r
    .accept 120 >>Accept Messenger to Stormwind
    .target Magistrate Solomon
step
    .goto 1433/0,-2148.63,-9216.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Darcy|r
    .accept 129 >>Accept A Free Lunch
    .target Darcy
step << Warrior
    .goto 1433/0,-2147.76,-9222.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yorus Barleybrew|r
    .turnin 1698 >>Turn in Yorus Barleybrew
    .target Yorus Barleybrew
    .isOnQuest 1698
step
    .goto 1433/0,-2145.59,-9231.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wiley the Black|r
    .turnin 65 >>Turn in The Defias Brotherhood
    .target Wiley the Black
    .isOnQuest 65
step
    .goto 1433/0,-2145.59,-9231.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wiley the Black|r
    .accept 132 >>Accept The Defias Brotherhood
    .target Wiley the Black
    .isQuestTurnedIn 65 --any of: The Defias Brotherhood
    .xp <14,1
step
    .goto 1433/0,-2157.18,-9223.81
    .vendor >> Buy level 15 drink
step << Rogue
    .goto 1433/0,-2179.89,-9328.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lucius|r
    .turnin 2281 >>Turn in Redridge Rendezvous
    .target Lucius
    .isOnQuest 2281
step
    .goto 1433/0,-2207.24,-9351.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shawn|r
    .accept 3741 >>Accept Hilary's Necklace
    .target Shawn
step
    #loop
    .goto 1433/0,-2211.58,-9352.82,0
    .goto 1433/0,-2211.58,-9352.82,40,0
    .goto 1433/0,-2239.37,-9361.22,40,0
    .goto 1433/0,-2300.15,-9374.25,40,0
    .goto 1433/0,-2393.50,-9364.11,40,0
    .goto 1433/0,-2369.62,-9361.22,40,0
    .goto 1433/0,-2311.66,-9347.75,40,0
    >>Open the |cRXP_PICK_Glinting Mud|r. Loot it for |cRXP_LOOT_Hilary's Necklace|r
    .complete 3741,1 --Hilary's Necklace (1)
step
    .goto 1433/0,-2205.51,-9351.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hilary|r
    .turnin 3741 >>Turn in Hilary's Necklace
    .target Hilary
step
    .goto 1433/0,-1902.24,-9609.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Guard Parker|r
    .turnin 129 >>Turn in A Free Lunch
    .accept 130 >>Accept Visit the Herbalist
    .target Guard Parker
step
    #loop
    .goto 1433/0,-2185.97,-9724.79,0
    .goto 1433/0,-2185.97,-9724.79,40,0
    .goto 1433/0,-2229.60,-9750.71,40,0
    .goto 1433/0,-2218.97,-9792.99,40,0
    .goto 1433/0,-2244.80,-9791.54,40,0
    .goto 1433/0,-2274.97,-9774.16,40,0
    .goto 1433/0,-2337.93,-9788.64,40,0
    .goto 1433/0,-2318.82,-9775.32,40,0
    .goto 1433/0,-2273.89,-9725.95,40,0
    .goto 1433/0,-2243.06,-9726.09,40,0
    >>Kill |cRXP_ENEMY_Redridge Mongrels|r
    >>Kill |cRXP_ENEMY_Redridge Poachers|r
    .complete 246,1 --Redridge Mongrel slain (10)
    .complete 246,2 --Redridge Poacher slain (6)
    .mob Redridge Mongrel
    .mob Redridge Poacher
step
    #loop
    .goto 1433/0,-1937.19,-9526.28,0
    .goto 1433/0,-1937.19,-9526.28,40,0
    .goto 1433/0,-1933.50,-9494.86,40,0
    .goto 1433/0,-1899.20,-9463.01,40,0
    .goto 1433/0,-1897.25,-9470.10,40,0
    .goto 1433/0,-1865.99,-9556.25,40,0
    .goto 1433/0,-1897.90,-9547.85,40,0
    .goto 1433/0,-1906.37,-9534.82,40,0
    .goto 1433/0,-1917.00,-9551.47,40,0
    >>Kill |cRXP_ENEMY_Redridge Thrashers|r. Loot them for |cRXP_LOOT_Spiked Collar|r
    .complete 98407,1 --Spiked Collar (5)
    .mob Redridge Thrasher
step
    .goto 1433/0,-2634.54,-9588.54
    .xp 20-7687 >> Grind until you are 7687 xp away from level 20 << !Rogue
    .xp 20-10012 >> Grind until you are 10012 xp away from level 20 << Rogue
step
    .goto 1433/0,-2045.30,-9245.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Martie Jainrose|r
    .turnin 130 >>Turn in Visit the Herbalist
    .accept 131 >>Accept Delivering Daffodils
    .target Martie Jainrose
step
    .goto 1433/0,-2148.63,-9216.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Darcy|r
    .turnin 131 >>Turn in Delivering Daffodils
    .target Darcy
step
    .goto 1433/0,-2237.85,-9443.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deputy Feldon|r
    .turnin 246 >>Turn in Assessing the Threat
    .turnin 98407 >>Turn in Show of Force
    .target Deputy Feldon
step
    .goto 1433/0,-2634.54,-9588.54
    .xp 20 >> Grind until you are level 20
step
    .goto 1433/0,-2243.06,-9259.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Verner Osgood|r
    .turnin 119 >>Turn in Return to Verner
    .target Verner Osgood
    .isOnQuest 119
step
    .goto 1433/0,-2221.79,-9218.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Solomon|r
    .turnin 121 >>Turn in Messenger to Stormwind
    .target Magistrate Solomon
    .isOnQuest 121
step
    .goto 1433/0,-2221.79,-9218.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Solomon|r
    .accept 143 >>Accept Messenger to Westfall
    .target Magistrate Solomon
    .isQuestTurnedIn 121 --any of: Messenger to Stormwind
    .xp <14,1
step
    .hs >> Hearth to Stormwind City
    .zoneskip Stormwind City
step
    .goto 1433/0,-2234.89,-9435.060
    >>Talk to |cRXP_FRIENDLY_Ariena|r
    .fp Redridge Mountains >> Get the Redridge Mountains flight path
step
    .goto 1433/0,-2268.46,-9279.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Foreman Oslow|r
    .turnin 345 >>Turn in Ink Supplies
    .target Foreman Oslow
    .isOnQuest 345
step
    .goto 1433/0,-2145.59,-9211.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barkeep Daniels|r
    .accept 116 >>Accept Dry Times
    .target Barkeep Daniels
step
    .goto 1433/0,-2145.59,-9211.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barkeep Daniels|r
    .turnin 116 >>Turn in Dry Times
    .target Barkeep Daniels
    .isQuestComplete 116
step
    .goto 1433/0,-2240.10,-9248.14
    >>Talk to |cRXP_FRIENDLY_Dorin|r
    .vendor >> Vendor Trash
    .target Dorin Songblade
    .isOnQuest 89
step
    .goto 1433/0,-1982.21,-8929.740,20,0
    .goto 1433/0,-2040.17,-8918.45,20,0
    .goto 1433/0,-2046.03,-8793.06,20,0
    .goto 1433/0,-2009.56,-8766.85,20,0
    .goto 1433/0,-1979.38,-8792.62,20,0
    .goto 1433/0,-1919.47,-8822.30,20,0
    .goto 1433/0,-1950.29,-8858.07,20,0
    .goto 1433/0,-1919.25,-8879.64,20,0
    .goto 1433/0,-1982.21,-8929.740,20,0
    .xp 21+14365 >> Grind to 14365+/25200xp
step
    .goto 1433/0,-1982.21,-8929.740,20,0
    .goto 1433/0,-2040.17,-8918.45,20,0
    .goto 1433/0,-2046.03,-8793.06,20,0
    .goto 1433/0,-2009.56,-8766.85,20,0
    .goto 1433/0,-1979.38,-8792.62,20,0
    .goto 1433/0,-1919.47,-8822.30,20,0
    .goto 1433/0,-1950.29,-8858.07,20,0
    .goto 1433/0,-1919.25,-8879.64,20,0
    .goto 1433/0,-1982.21,-8929.740,20,0
    .xp 21+15715 >> Grind to 15715+/25200xp
step
    .goto 1433/0,-2158.69,-9234.38,0,0
    .vendor >> Vendor Trash. You can sell the |T134708:0|t[Mining Pick] now if you wish
    .target Kimberly Hiett
step << !Human !Warlock
    .goto 1433/0,-2345.31,-9435.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ariena Stormfeather|r
    .fp Redridge Mountains >> Get the Redridge Mountains flight path
    .target Ariena Stormfeather
step << Hunter
    .goto 1433/0,-2345.31,-9435.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ariena Stormfeather|r
    .fp Redridge Mountains >> Get the Redridge Mountains flight path
    .target Ariena Stormfeather
step
    .goto 1433/0,-3404.89,-9253.06
    >>Click the |cRXP_PICK_Old Lion Statue|r
    .turnin 94 >>Turn in A Watchful Eye
    .isOnQuest 94
step
    +|cRXP_WARN_That is all of Redridge Mountains for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Elwynn Forest|r: The Price of Shoes
    >>|cRXP_FRIENDLY_Stormwind City|r: Messenger to Stormwind, Elmore's Task
    >>|cRXP_FRIENDLY_Westfall|r: Messenger to Westfall, The Defias Brotherhood
    >>|cRXP_FRIENDLY_Westfall, Stormwind City, Duskwood, Elwynn Forest and back here|r: Dry Times
step
    .xp 17 >>|cRXP_WARN_The rest of Redridge Mountains is planned from level 17.|r Come back to this guide then
step
    .goto 1433/0,-2268.46,-9279.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Foreman Oslow|r
    .accept 125 >>Accept The Lost Tools
    .target Foreman Oslow
step
    .goto 1433/0,-2172.51,-9261.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dockmaster Baren|r
    .accept 127 >>Accept Selling Fish
    .target Dockmaster Baren
step
    .goto 1433/0,-2063.10,-9209.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chef Breanna|r
    .accept 92 >>Accept Redridge Goulash
    .target Chef Breanna
step
    #loop
    .goto 1433/0,-2008.18,-9522.08,0
    .goto 1433/0,-2008.18,-9522.08,40,0
    .goto 1433/0,-2057.67,-9535.84,40,0
    .goto 1433/0,-2053.11,-9548.72,40,0
    >>Kill |cRXP_ENEMY_Tarantulas|r, |cRXP_ENEMY_Greater Tarantulas|r and |cRXP_ENEMY_Chatters|r. Loot them for |cRXP_LOOT_Crisp Spider Meat|r
    .complete 92,3 --Crisp Spider Meat (1)
    .mob Tarantula
    .mob Greater Tarantula
    .mob Chatter
step
    #loop
    .goto 1433/0,-2172.73,-9666.15,0
    .goto 1433/0,-2172.73,-9666.15,40,0
    .goto 1433/0,-2247.19,-9557.85,40,0
    .goto 1433/0,-2294.08,-9527.44,40,0
    .goto 1433/0,-2307.54,-9459.24,40,0
    .goto 1433/0,-2340.53,-9591.87,40,0
    .goto 1433/0,-2252.18,-9620.68,40,0
    .goto 1433/0,-2227.87,-9708.86,40,0
    .goto 1433/0,-2185.53,-9723.78,40,0
    .goto 1433/0,-2107.60,-9710.89,40,0
    >>Kill |cRXP_ENEMY_Bellygrubs|r and |cRXP_ENEMY_Great Goretusks|r. Loot them for |cRXP_LOOT_Great Goretusk Snout|r
    >>Kill |cRXP_ENEMY_Dire Condor|r and loot |cRXP_LOOT_Tough Condor Meat|r
    .complete 92,1 --Great Goretusk Snout (5)
    .complete 92,2 --Tough Condor Meat (1)
    .mob Bellygrub
    .mob Great Goretusk
    .mob Dire Condor
step
    .goto 1433/0,-2063.10,-9209.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chef Breanna|r
    .turnin 92 >>Turn in Redridge Goulash
    .target Chef Breanna
step << Rogue
    .goto 1433/0,-2179.89,-9328.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lucius|r
    .accept 2282 >>Accept Alther's Mill
    .target Lucius
    .isQuestTurnedIn 2281 --any of: Redridge Rendezvous
    .xp <16,1
step
    #loop
    .goto 1433/0,-2457.97,-9514.12,0
    .goto 1433/0,-2457.97,-9514.12,40,0
    .goto 1433/0,-2458.19,-9554.23,40,0
    .goto 1433/0,-2639.89,-9619.53,40,0
    .goto 1433/0,-2676.79,-9578.84,40,0
    .goto 1433/0,-2653.78,-9521.07,40,0
    .goto 1433/0,-2607.11,-9564.22,40,0
    .goto 1433/0,-2566.08,-9560.45,40,0
    .goto 1433/0,-2559.35,-9524.11,40,0
    .goto 1433/0,-2533.52,-9493.56,40,0
    >>Kill |cRXP_ENEMY_Murloc Flesheaters|r, |cRXP_ENEMY_Murloc Nightcrawlers|r, |cRXP_ENEMY_Murloc Tidecallers|r and |cRXP_ENEMY_Murloc Minor Tidecallers|r. Loot them for |cRXP_LOOT_Spotted Sunfish|r
    .complete 127,1 --Spotted Sunfish (10)
    .mob Murloc Flesheater
    .mob Murloc Nightcrawler
    .mob Murloc Tidecaller
    .mob Murloc Minor Tidecaller
step
    .goto 1433/0,-2472.08,-9366.43
    >>Open the |cRXP_PICK_Sunken Chest|r. Loot it for |cRXP_LOOT_Oslow's Toolbox|r
    .complete 125,1 --Oslow's Toolbox (1)
step << Rogue
    .goto 1433/0,-2700.46,-9222.07
    >>Open the |cRXP_PICK_Lucius's Lockbox|r. Loot it for |cRXP_LOOT_Token of Thievery|r
    .complete 2282,1 --Token of Thievery (1)
    .isOnQuest 2282
step
    .goto 1433/0,-2172.51,-9261.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dockmaster Baren|r
    .turnin 127 >>Turn in Selling Fish
    .target Dockmaster Baren
step
    .goto 1433/0,-2268.46,-9279.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Foreman Oslow|r
    .turnin 125 >>Turn in The Lost Tools
    .accept 89 >>Accept The Everstill Bridge
    .accept 98386 >>Accept Alther's Mill
    .target Foreman Oslow
step
    #loop
    .goto 1433/0,-2609.06,-9131.87,0
    .goto 1433/0,-2609.06,-9131.87,40,0
    .goto 1433/0,-2668.98,-9162.85,40,0
    .goto 1433/0,-2708.27,-9184.43,40,0
    .goto 1433/0,-2740.40,-9200.21,40,0
    .goto 1433/0,-2810.95,-9250.16,40,0
    .goto 1433/0,-2784.68,-9202.82,40,0
    .goto 1433/0,-2767.54,-9199.78,40,0
    .goto 1433/0,-2738.66,-9127.52,40,0
    .goto 1433/0,-2736.71,-9101.75,40,0
    >>Kill |cRXP_ENEMY_Greater Tarantulas|r
    .complete 98386,1 --Greater Tarantula slain (12)
    .mob Greater Tarantula
step
    .goto 1433/0,-2268.46,-9279.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Foreman Oslow|r
    .turnin 98386 >>Turn in Alther's Mill
    .target Foreman Oslow
step << Rogue
    .goto 1433/0,-2179.89,-9332.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Arantir|r
    .accept 2358 >>Accept Horns of Nez'ra
    .target Arantir
step << Rogue
    #loop
    .goto 1433/0,-2378.52,-9237.42,0
    .goto 1433/0,-2378.52,-9237.42,40,0
    .goto 1433/0,-2402.40,-9172.27,40,0
    .goto 1433/0,-2451.90,-9175.16,40,0
    .goto 1433/0,-2513.55,-9156.63,40,0
    >>Kill |cRXP_ENEMY_Gath'Ilzoggs|r, |cRXP_ENEMY_Blackrock Champions|r, |cRXP_ENEMY_Blackrock Shadowcasters|r and |cRXP_ENEMY_Blackrock Renegades|r. Loot them for |cRXP_LOOT_Horns of Nez'ra|r
    .complete 2358,1 --Horns of Nez'ra (1)
    .mob Gath'Ilzogg
    .mob Blackrock Champion
    .mob Blackrock Shadowcaster
    .mob Blackrock Renegade
step << Rogue
    .goto 1433/0,-2179.89,-9332.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Arantir|r
    .turnin 2358 >>Turn in Horns of Nez'ra
    .target Arantir
step << Rogue
    .goto 1433/0,-2179.89,-9328.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lucius|r
    .turnin 2282 >>Turn in Alther's Mill
    .target Lucius
    .isOnQuest 2282
step
    .goto 1433/0,-2243.06,-9259.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Verner Osgood|r
    .accept 124 >>Accept A Baying of Gnolls
    .target Verner Osgood
    .isQuestTurnedIn 119 --any of: Return to Verner
    .xp <15,1
step
    .goto 1433/0,-2243.06,-9259.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Verner Osgood|r
    .accept 122 >>Accept Underbelly Scales
    .target Verner Osgood
    .isQuestTurnedIn 119 --any of: Return to Verner
    .xp <14,1
step
    #loop
    .goto 1433/0,-2092.84,-9114.93,0
    .goto 1433/0,-2092.84,-9114.93,40,0
    .goto 1433/0,-2091.75,-9080.47,40,0
    .goto 1433/0,-2094.36,-9047.31,40,0
    .goto 1433/0,-2007.96,-9056.43,40,0
    .goto 1433/0,-2037.27,-9099.44,40,0
    .goto 1433/0,-2023.16,-9154.60,40,0
    .goto 1433/0,-2061.15,-9129.84,40,0
    >>Kill |cRXP_ENEMY_Redridge Brutes|r
    .complete 124,1 --Redridge Brute slain (10)
    .mob Redridge Brute
    .isOnQuest 124
step
    #loop
    .goto 1433/0,-2040.96,-9085.82,0
    .goto 1433/0,-2040.96,-9085.82,40,0
    .goto 1433/0,-2010.13,-9052.09,40,0
    .goto 1433/0,-2077.64,-8971.15,40,0
    .goto 1433/0,-2089.80,-9006.62,40,0
    .goto 1433/0,-2108.25,-9034.57,40,0
    .goto 1433/0,-2156.45,-9114.06,40,0
    .goto 1433/0,-2091.97,-9114.78,40,0
    >>Kill |cRXP_ENEMY_Redridge Mystics|r
    .complete 124,2 --Redridge Mystic slain (8)
    .mob Redridge Mystic
    .isOnQuest 124
step
    #loop
    .goto 1433/0,-2108.25,-9034.57,0
    .goto 1433/0,-2108.25,-9034.57,40,0
    .goto 1433/0,-2092.84,-9114.93,40,0
    .goto 1433/0,-2023.16,-9154.60,40,0
    .goto 1433/0,-2010.13,-9052.09,40,0
    .goto 1433/0,-1917.22,-8848.22,40,0
    .goto 1433/0,-2009.26,-8766.56,40,0
    .goto 1433/0,-2072.43,-8839.97,40,0
    .goto 1433/0,-2040.31,-8917.14,40,0
    .goto 1433/0,-2127.14,-8907.30,40,0
    >>Kill |cRXP_ENEMY_Redridge Brutes|r, |cRXP_ENEMY_Redridge Mystics|r, |cRXP_ENEMY_Redridge Bashers|r and |cRXP_ENEMY_Redridge Drudgers|r. Loot them for |cRXP_LOOT_Iron Pike|r
    >>Kill |cRXP_ENEMY_Redridge Brutes|r, |cRXP_ENEMY_Redridge Mystics|r, |cRXP_ENEMY_Redridge Bashers|r and |cRXP_ENEMY_Redridge Drudgers|r. Loot them for |cRXP_LOOT_Iron Rivet|r
    .complete 89,1 --Iron Pike (5)
    .complete 89,2 --Iron Rivet (5)
    .mob Redridge Brute
    .mob Redridge Mystic
    .mob Redridge Basher
    .mob Redridge Drudger
step
    #loop
    .goto 1433/0,-2289.95,-9491.10,0
    .goto 1433/0,-2289.95,-9491.10,40,0
    .goto 1433/0,-2165.78,-9654.13,40,0
    .goto 1433/0,-2238.29,-9670.64,40,0
    .goto 1433/0,-2307.10,-9681.93,40,0
    .goto 1433/0,-2314.27,-9637.34,40,0
    .goto 1433/0,-2351.60,-9644.58,40,0
    .goto 1433/0,-2390.24,-9628.65,40,0
    .goto 1433/0,-2327.29,-9565.95,40,0
    .goto 1433/0,-2373.96,-9487.19,40,0
    >>Kill |cRXP_ENEMY_Black Dragon Whelps|r and |cRXP_ENEMY_Snarlflares|r. Loot them for |cRXP_LOOT_Underbelly Whelp Scale|r
    .complete 122,1 --Underbelly Whelp Scale (6)
    .mob Black Dragon Whelp
    .mob Snarlflare
    .isOnQuest 122
step
    .goto 1433/0,-2243.06,-9259.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Verner Osgood|r
    .turnin 124 >>Turn in A Baying of Gnolls
    .target Verner Osgood
    .isOnQuest 124
step
    .goto 1433/0,-2243.06,-9259.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Verner Osgood|r
    .turnin 122 >>Turn in Underbelly Scales
    .target Verner Osgood
    .isOnQuest 122
step
    .goto 1433/0,-2268.46,-9279.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Foreman Oslow|r
    .turnin 89 >>Turn in The Everstill Bridge
    .target Foreman Oslow
step
    .goto 1433/0,-2145.59,-9211.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barkeep Daniels|r
    .turnin 116 >>Turn in Dry Times
    .target Barkeep Daniels
    .isQuestComplete 116
step
    .xp 20 >>|cRXP_WARN_The rest of Redridge Mountains is planned from level 20.|r Come back to this guide then
step
    .goto 1433/0,-2221.79,-9218.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Solomon|r
    .accept 145 >>Accept Messenger to Darkshire
    .target Magistrate Solomon
    .isQuestTurnedIn 144 --any of: Messenger to Westfall
    .xp <18,1
step
    .goto 1433/0,-2172.51,-9261.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dockmaster Baren|r
    .accept 150 >>Accept Murloc Poachers
    .target Dockmaster Baren
    .xp <20,1
step
    .goto 1433/0,-2297.98,-9284.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Marris|r
    .accept 20 >>Accept Blackrock Menace
    .accept 98387 >>Accept Blackrock Blockade
    .target Marshal Marris
step
    #loop
    .goto 1433/0,-3067.33,-9709.59,0
    .goto 1433/0,-3067.33,-9709.59,40,0
    .goto 1433/0,-3105.97,-9713.79,40,0
    .goto 1433/0,-3201.27,-9792.55,40,0
    .goto 1433/0,-3254.67,-9821.80,40,0
    .goto 1433/0,-3242.51,-9782.13,40,0
    .goto 1433/0,-3232.31,-9741.88,40,0
    .goto 1433/0,-3160.46,-9735.50,40,0
    .goto 1433/0,-3152.64,-9655.72,40,0
    .goto 1433/0,-3092.08,-9673.97,40,0
    >>Kill |cRXP_ENEMY_Blackrock Champions|r, |cRXP_ENEMY_Blackrock Shadowcasters|r, |cRXP_ENEMY_Blackrock Renegades|r and |cRXP_ENEMY_Blackrock Grunts|r. Loot them for |cRXP_LOOT_Battleworn Axe|r
    .complete 20,1 --Battleworn Axe (10)
    .mob Blackrock Champion
    .mob Blackrock Shadowcaster
    .mob Blackrock Renegade
    .mob Blackrock Grunt
step
    .goto 1433/0,-2297.98,-9284.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Marris|r
    .turnin 20 >>Turn in Blackrock Menace
    .target Marshal Marris
step
    .goto 1433/0,-2172.51,-9261.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dockmaster Baren|r
    .accept 150 >>Accept Murloc Poachers
    .target Dockmaster Baren
step
    #loop
    .goto 1433/0,-2347.70,-9392.49,0
    .goto 1433/0,-2347.70,-9392.49,40,0
    .goto 1433/0,-2419.77,-9322.41,40,0
    .goto 1433/0,-2448.21,-9221.93,40,0
    .goto 1433/0,-2489.67,-9255.67,40,0
    .goto 1433/0,-2508.34,-9319.95,40,0
    .goto 1433/0,-2581.93,-9320.39,40,0
    .goto 1433/0,-2626.43,-9389.89,40,0
    .goto 1433/0,-2465.79,-9475.02,40,0
    .goto 1433/0,-2455.59,-9380.62,40,0
    >>Kill |cRXP_ENEMY_Murloc Flesheaters|r, |cRXP_ENEMY_Murloc Nightcrawlers|r, |cRXP_ENEMY_Murloc Tidecallers|r and |cRXP_ENEMY_Murloc Minor Tidecallers|r. Loot them for |cRXP_LOOT_Murloc Fin|r
    .complete 150,1 --Murloc Fin (8)
    .mob Murloc Flesheater
    .mob Murloc Nightcrawler
    .mob Murloc Tidecaller
    .mob Murloc Minor Tidecaller
step
    .goto 1433/0,-2172.51,-9261.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dockmaster Baren|r
    .turnin 150 >>Turn in Murloc Poachers
    .target Dockmaster Baren
step
    .goto 1433/0,-2268.46,-9279.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Foreman Oslow|r
    .accept 347 >>Accept Rethban Ore
    .target Foreman Oslow
    .isQuestTurnedIn 345 --any of: Ink Supplies
    .xp <20,1
step << Warrior
    .goto 1433/0,-2147.76,-9222.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yorus Barleybrew|r
    .accept 1702 >>Accept The Shieldsmith
    .target Yorus Barleybrew
    .isQuestTurnedIn 1699 --any of: The Rethban Gauntlet
    .xp <20,1
step
    .goto 1433/0,-2145.59,-9211.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barkeep Daniels|r
    .turnin 116 >>Turn in Dry Times
    .target Barkeep Daniels
    .isQuestComplete 116
step
    #loop
    .goto 1433/0,-2004.05,-8972.89,0
    .goto 1433/0,-2004.05,-8972.89,40,0
    .goto 1433/0,-2040.31,-8917.14,40,0
    .goto 1433/0,-2012.30,-8871.53,40,0
    .goto 1433/0,-2073.95,-8842.00,40,0
    .goto 1433/0,-2032.71,-8826.50,40,0
    .goto 1433/0,-2009.26,-8766.56,40,0
    .goto 1433/0,-1975.62,-8822.74,40,0
    .goto 1433/0,-1904.85,-8849.96,40,0
    .goto 1433/0,-1945.87,-8904.98,40,0
    >>Kill |cRXP_ENEMY_Redridge Drudgers|r. Loot them for |cRXP_LOOT_Rethban Ore|r. It can also be picked up from |cRXP_PICK_Tin Vein|r on the ground
    .complete 347,1 --Rethban Ore (5)
    .mob Redridge Drudger
    .isOnQuest 347
step
    .goto 1433/0,-2297.98,-9284.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Marris|r
    .accept 115 >>Accept Shadow Magic
    .target Marshal Marris
step
    .goto 1433/0,-3404.89,-9253.06
    >>Click the |cRXP_PICK_Old Lion Statue|r
    .accept 248 >>Accept Looking Further
    .isQuestTurnedIn 94 --any of: A Watchful Eye
    .xp <20,1
step
    .goto 1433/0,-3320.01,-9176.90,60,0
    .goto 1433/0,-3419.87,-9106.10,60,0
    .goto 1433/0,-3432.90,-9245.10,60,0
    .goto 1433/0,-3366.25,-9187.18,60,0
    .goto 1433/0,-3364.08,-9100.74
    .xp 28-8910
step
    #loop
    .goto 1433/0,-3084.91,-9356.59,0
    .goto 1433/0,-3084.91,-9356.59,40,0
    .goto 1433/0,-3059.73,-9380.04,40,0
    .goto 1433/0,-3090.77,-9407.26,40,0
    .goto 1433/0,-3073.19,-9440.13,40,0
    .goto 1433/0,-3059.08,-9421.60,40,0
    .goto 1433/0,-3021.31,-9406.83,40,0
    .goto 1433/0,-2991.35,-9367.88,40,0
    .goto 1433/0,-3026.95,-9358.32,40,0
    .goto 1433/0,-3047.57,-9339.79,40,0
    >>Kill |cRXP_ENEMY_Blackrock Shadowcasters|r. Loot them for |cRXP_LOOT_Midnight Orb|r
    .complete 115,1 --Midnight Orb (3)
    .mob Blackrock Shadowcaster
step
    .goto 1433/0,-2943.81,-9296.64
    >>Click the |cRXP_PICK_An Empty Jar|r
    .turnin 248 >>Turn in Looking Further
    .isOnQuest 248
step
    .goto 1433/0,-2297.98,-9284.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Marris|r
    .turnin 115 >>Turn in Shadow Magic
    .target Marshal Marris
step
    .goto 1433/0,-2297.98,-9284.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Marris|r
    .turnin 98387 >>Turn in Blackrock Blockade
    .target Marshal Marris
    .isQuestComplete 98387
step
    +|cRXP_WARN_That is all of Redridge Mountains for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Duskwood|r: Messenger to Darkshire
    >>|cRXP_FRIENDLY_Elwynn Forest|r: Rethban Ore
    >>|cRXP_FRIENDLY_Stormwind City|r: The Shieldsmith << Warrior
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Blackrock Blockade
step
    .xp 23 >>|cRXP_WARN_The rest of Redridge Mountains is planned from level 23.|r Come back to this guide then
step
    .goto 1433/0,-2243.06,-9259.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Verner Osgood|r
    .accept 126 >>Accept Howling in the Hills
    .target Verner Osgood
    .isQuestTurnedIn 124 --any of: A Baying of Gnolls
    .xp <15,1
step
    .goto 1433/0,-2210.93,-9241.77
    >>Click the |cRXP_PICK_Wanted: Incinerator Gar'im|r
    .accept 95999 >>Accept WANTED: Incinerator Gar'im
step
    .goto 1433/0,-2045.30,-9245.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Martie Jainrose|r
    .accept 34 >>Accept An Unwelcome Guest
    .target Martie Jainrose
step
    .goto 1433/0,-1911.14,-9288.97
    >>Kill |cRXP_ENEMY_Bellygrub|r and loot |cRXP_LOOT_Bellygrub's Tusk|r
    .complete 34,1 --Bellygrub's Tusk (1)
    .mob Bellygrub
step
    .goto 1433/0,-2045.30,-9245.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Martie Jainrose|r
    .turnin 34 >>Turn in An Unwelcome Guest
    .target Martie Jainrose
step
    #loop
    .goto 1433/0,-3132.24,-9782.42,0
    .goto 1433/0,-3132.24,-9782.42,40,0
    .goto 1433/0,-3156.11,-9770.54,40,0
    .goto 1433/0,-3196.49,-9764.32,40,0
    .goto 1433/0,-3234.70,-9724.36,40,0
    .goto 1433/0,-3244.47,-9743.61,40,0
    .goto 1433/0,-3236.65,-9771.27,40,0
    .goto 1433/0,-3237.30,-9798.05,40,0
    .goto 1433/0,-3264.01,-9819.34,40,0
    .goto 1433/0,-3200.83,-9810.22,40,0
    >>Kill |cRXP_ENEMY_Incinerator Gar'im|r and loot |cRXP_LOOT_Broken Staff of Incinerator Gar'im|r
    .complete 95999,1 --Broken Staff of Incinerator Gar'im (1)
    .mob Incinerator Gar'im
step
    .goto 1433/0,-2297.98,-9284.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Marris|r
    .turnin 98387 >>Turn in Blackrock Blockade
    .target Marshal Marris
    .isQuestComplete 98387
step
    .goto 1433/0,-2221.79,-9218.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Solomon|r
    .turnin 95999 >>Turn in WANTED: Incinerator Gar'im
    .target Magistrate Solomon
step
    .goto 1433/0,-2215.93,-9215.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bailiff Conacher|r
    .accept 91 >>Accept Solomon's Law
    .target Bailiff Conacher
step
    .goto 1433/0,-2145.59,-9211.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barkeep Daniels|r
    .turnin 116 >>Turn in Dry Times
    .target Barkeep Daniels
    .isQuestComplete 116
step
    .goto 1433/0,-2297.98,-9284.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Marris|r
    .accept 19 >>Accept Tharil'zun
    .target Marshal Marris
step
    .goto 1433/0,-2255.44,-9412.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Guard Howe|r
    .accept 128 >>Accept Blackrock Bounty
    .target Guard Howe
step
    .goto 1433/0,-2170.99,-8884.56
    >>Kill |cRXP_ENEMY_Yowler|r and loot |cRXP_LOOT_Yowler's Paw|r
    .complete 126,1 --Yowler's Paw (1)
    .mob Yowler
    .isOnQuest 126
step
    #completewith Along13
    >>As you go: Kill |cRXP_ENEMY_Shadowhide Darkweavers|r, |cRXP_ENEMY_Shadowhide Slayers|r, |cRXP_ENEMY_Shadowhide Brutes|r and |cRXP_ENEMY_Shadowhide Gnolls|r. Loot them for |cRXP_LOOT_Shadowhide Pendant|r. |cRXP_WARN_Anything left is finished later|r
    .complete 91,1 --Shadowhide Pendant (10)
    .mob Shadowhide Darkweaver
    .mob Shadowhide Slayer
    .mob Shadowhide Brute
    .mob Shadowhide Gnoll
step
    #label Along13
    .goto 1433/0,-3078.40,-9435.21
    >>Kill |cRXP_ENEMY_Tharil'zun|r and loot |cRXP_LOOT_Tharil'zun's Head|r
    .complete 19,1 --Tharil'zun's Head (1)
    .mob Tharil'zun
step
    #loop
    .goto 1433/0,-2345.74,-8685.77,0
    .goto 1433/0,-2345.74,-8685.77,40,0
    .goto 1433/0,-2253.48,-8656.95,40,0
    .goto 1433/0,-2147.76,-8693.58,40,0
    .goto 1433/0,-2162.09,-8719.21,40,0
    .goto 1433/0,-2191.61,-8824.77,40,0
    .goto 1433/0,-2213.76,-8779.74,40,0
    .goto 1433/0,-2258.47,-8764.97,40,0
    .goto 1433/0,-2213.32,-8737.46,40,0
    .goto 1433/0,-2231.99,-8702.56,40,0
    >>Kill |cRXP_ENEMY_Blackrock Champions|r
    .complete 128,1 --Blackrock Champion slain (15)
    .mob Blackrock Champion
step
    .goto 1433/0,-2243.06,-9259.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Verner Osgood|r
    .turnin 126 >>Turn in Howling in the Hills
    .target Verner Osgood
    .isOnQuest 126
step
    .goto 1433/0,-2297.98,-9284.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Marris|r
    .turnin 19 >>Turn in Tharil'zun while you are here
    .isQuestComplete 19
    .target Marshal Marris
step
    .goto 1433/0,-2255.44,-9412.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Guard Howe|r
    .turnin 128 >>Turn in Blackrock Bounty
    .target Guard Howe
step
    #completewith Drop178x1
    >>|cRXP_LOOT_Glowing Shadowhide Pendant|r can drop from |cRXP_ENEMY_Shadowhide Darkweaver|r, |cRXP_ENEMY_Shadowhide Slayer|r, |cRXP_ENEMY_Shadowhide Brute|r. Use it to start the quest if you get one
    .collect 1962,1,178 --Glowing Shadowhide Pendant (1)
    .accept 178 >>Accept Theocritus' Retrieval
    .use 1962
step
    #label Drop178x1
    #loop
    .goto 1433/0,-3062.55,-9236.84,0
    .goto 1433/0,-3062.55,-9236.84,40,0
    .goto 1433/0,-3139.62,-9159.52,40,0
    .goto 1433/0,-3183.03,-9098.57,40,0
    .goto 1433/0,-3218.42,-9010.10,40,0
    .goto 1433/0,-3333.91,-9100.59,40,0
    .goto 1433/0,-3346.06,-9159.81,40,0
    .goto 1433/0,-3290.27,-9167.34,40,0
    .goto 1433/0,-3234.70,-9122.60,40,0
    .goto 1433/0,-3192.15,-9213.97,40,0
    >>Kill |cRXP_ENEMY_Shadowhide Darkweavers|r, |cRXP_ENEMY_Shadowhide Slayers|r, |cRXP_ENEMY_Shadowhide Brutes|r and |cRXP_ENEMY_Shadowhide Gnolls|r. Loot them for |cRXP_LOOT_Shadowhide Pendant|r
    .complete 91,1 --Shadowhide Pendant (10)
    .mob Shadowhide Darkweaver
    .mob Shadowhide Slayer
    .mob Shadowhide Brute
    .mob Shadowhide Gnoll
step
    .goto 1433/0,-2297.98,-9284.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Marris|r
    .turnin 19 >>Turn in Tharil'zun
    .target Marshal Marris
step
    .goto 1433/0,-2215.93,-9215.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bailiff Conacher|r
    .turnin 91 >>Turn in Solomon's Law
    .target Bailiff Conacher
step
    +|cRXP_WARN_That is all of Redridge Mountains for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Elwynn Forest|r: Theocritus' Retrieval
step
    .xp 26 >>|cRXP_WARN_The rest of Redridge Mountains is planned from level 26.|r Come back to this guide then
step
    .goto 1433/0,-2297.98,-9284.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Marris|r
    .turnin 98387 >>Turn in Blackrock Blockade
    .target Marshal Marris
    .isQuestComplete 98387
step
    .goto 1433/0,-2151.45,-9247.41
    >>Click the |cRXP_PICK_Wanted: Lieutenant Fangore|r
    .accept 180 >>Accept Wanted: Lieutenant Fangore
step
    .goto 1433/0,-2145.59,-9211.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barkeep Daniels|r
    .turnin 116 >>Turn in Dry Times
    .target Barkeep Daniels
    .isQuestComplete 116
step
    .goto 1433/0,-2213.76,-9243.36
    >>Click the |cRXP_PICK_Wanted: Gath'Ilzogg|r
    .accept 169 >>Accept Wanted: Gath'Ilzogg
step
    .goto 1433/0,-3081.87,-9382.79
    >>Kill |cRXP_ENEMY_Gath'Ilzogg|r and loot |cRXP_LOOT_Head of Gath'Ilzogg|r
    .complete 169,1 --Head of Gath'Ilzogg (1)
    .mob Gath'Ilzogg
step
    .goto 1433/0,-2221.79,-9218.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Solomon|r
    .turnin 169 >>Turn in Wanted: Gath'Ilzogg
    .target Magistrate Solomon
step
    .goto 1433/0,-3311.33,-9111.60
    >>Kill |cRXP_ENEMY_Lieutenant Fangore|r and loot |cRXP_LOOT_Fangore's Paw|r
    .complete 180,1 --Fangore's Paw (1)
    .mob Lieutenant Fangore
step
    .goto 1433/0,-3404.89,-9253.06
    >>Click the |cRXP_PICK_Old Lion Statue|r
    .accept 249 >>Accept Morganth
    .isQuestTurnedIn 248 --any of: Looking Further
    .xp <20,1
step
    .goto 1433/0,-3309.81,-9291.57
    >>Kill |cRXP_ENEMY_Morganth|r and loot |cRXP_LOOT_Pendant of Shadow|r
    .complete 249,1 --Pendant of Shadow (1)
    .mob Morganth
    .isOnQuest 249
step
    .goto 1433/0,-2221.79,-9218.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Solomon|r
    .turnin 180 >>Turn in Wanted: Lieutenant Fangore
    .target Magistrate Solomon
step
    +|cRXP_WARN_End of the Redridge Mountains route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Elwynn Forest|r: Morganth
]])
