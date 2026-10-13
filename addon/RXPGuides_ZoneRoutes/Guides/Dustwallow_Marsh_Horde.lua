-- 35-46 Dustwallow Marsh: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 4 parts with a level check between them (from level 35, 38, 41, 44).
-- Edit zones/Dustwallow Marsh.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#name 35-46 Dustwallow Marsh

step
    .goto 1445/1,-2534.25,-3700.73
    >>Click the |cRXP_PICK_Hoofprints|r
    .accept 1268 >>Accept Suspicious Hoofprints
step
    .goto 1445/1,-2541.07,-3721.73
    >>Click the |cRXP_PICK_Theramore Guard Badge|r
    .accept 1269 >>Accept Lieutenant Paval Reethe
step
    .goto 1445/1,-2530.57,-3735.03
    >>Click the |cRXP_PICK_Black Shield|r
    .accept 1251 >>Accept The Black Shield
step
    .goto 1445/1,-2820.37,-3372.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mudcrush Durtfeet|r
    .accept 1177 >>Accept Hungry!
    .target Mudcrush Durtfeet
step
    .goto 1445/1,-2841.90,-3149.13
    .fp Brackenwall >> Get the Brackenwall flight path
step
    .goto 1445/1,-2887.05,-3149.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krog|r
    .turnin 1251 >>Turn in The Black Shield while you are here
    .isQuestComplete 1251
    .target Krog
step
    .goto 1445/1,-2887.05,-3149.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krog|r
    .turnin 1268 >>Turn in Suspicious Hoofprints while you are here
    .isQuestComplete 1268
    .target Krog
step
    .goto 1445/1,-2887.05,-3149.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krog|r
    .turnin 1269 >>Turn in Lieutenant Paval Reethe while you are here
    .isQuestComplete 1269
    .target Krog
step
    .goto 1445/1,-2823.52,-3106.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nazeer Bloodpike|r
    .accept 1201 >>Accept Theramore Spies
    .target Nazeer Bloodpike
step
    .goto 1445/1,-2887.05,-3149.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krog|r
    .turnin 1268 >>Turn in Suspicious Hoofprints
    .turnin 1269 >>Turn in Lieutenant Paval Reethe
    .turnin 1251 >>Turn in The Black Shield
    .accept 1321 >>Accept The Black Shield
    .target Krog
step
    .goto 1445/1,-2892.82,-3110.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Do'gol|r
    .turnin 1321 >>Turn in The Black Shield
    .target Do'gol
step
    .goto 1445/1,-3885.60,-2952.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Swamp Eye" Jarl|r
    .accept 1218 >>Accept Soothing Spices
    .target "Swamp Eye" Jarl
step
    .goto 1445/1,-4463.10,-3834.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy |cRXP_LOOT_Soothing Spices|r from |cRXP_FRIENDLY_Helenia Olden|r
    .complete 1218,1 --Soothing Spices (3)
    .target Helenia Olden
step
    .goto 1445/1,-3885.60,-2952.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Swamp Eye" Jarl|r
    .turnin 1218 >>Turn in Soothing Spices
    .accept 1206 >>Accept Jarl Needs Eyes
    .target "Swamp Eye" Jarl
step
    .goto 1445/1,-3885.60,-2940.53
    >>Click the |cRXP_PICK_Loose Dirt|r
    .accept 1238 >>Accept The Lost Report
step
    #completewith Drop635x1
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Mirefin Puddlejumper|r, |cRXP_ENEMY_Mirefin Murloc|r, |cRXP_ENEMY_Mirefin Warrior|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #label Drop635x1
    #loop
    .goto 1445/1,-3936.00,-2838.33,0
    .goto 1445/1,-3936.00,-2838.33,40,0
    .goto 1445/1,-3967.50,-2817.33,40,0
    .goto 1445/1,-3999.00,-2789.33,40,0
    .goto 1445/1,-4020.00,-2754.33,40,0
    .goto 1445/1,-4009.50,-2712.33,40,0
    .goto 1445/1,-4045.20,-2601.03,40,0
    .goto 1445/1,-3991.12,-2593.33,40,0
    .goto 1445/1,-3924.45,-2616.08,40,0
    .goto 1445/1,-3936.00,-2768.33,40,0
    >>Kill |cRXP_ENEMY_Mirefin Oracles|r, |cRXP_ENEMY_Mirefin Coastrunners|r, |cRXP_ENEMY_Mirefin Warriors|r and |cRXP_ENEMY_Mirefin Puddlejumpers|r. Loot them for |cRXP_LOOT_Mirefin Head|r
    .complete 1177,1 --Mirefin Head (12)
    .mob Mirefin Oracle
    .mob Mirefin Coastrunner
    .mob Mirefin Warrior
    .mob Mirefin Puddlejumper
step
    .trainer >> Teleport to Undercity. Train your level 38 spells
    >>Start being very careful with your money too, as it's very nice to have your mount at level 40
step
    .vendor >> Buy level 35 drink if needed
step
    #loop
    .goto 1445/1,-2850.82,-2770.08,0
    .goto 1445/1,-2850.82,-2770.08,40,0
    .goto 1445/1,-2776.80,-2842.88,40,0
    .goto 1445/1,-2818.80,-2884.53,40,0
    .goto 1445/1,-2778.90,-2928.98,40,0
    .goto 1445/1,-2686.50,-2817.33,40,0
    .goto 1445/1,-2606.70,-2821.18,40,0
    .goto 1445/1,-2562.07,-2777.78,40,0
    .goto 1445/1,-2610.37,-2747.33,40,0
    .goto 1445/1,-2736.37,-2753.28,40,0
    >>Kill |cRXP_ENEMY_Darkmist Spiders|r, |cRXP_ENEMY_Darkmist Lurkers|r, |cRXP_ENEMY_Darkmist Recluses|r and |cRXP_ENEMY_Darkmist Silkspinners|r. Loot them for |cRXP_LOOT_Unpopped Darkmist Eye|r
    .complete 1206,1 --Unpopped Darkmist Eye (40)
    .mob Darkmist Spider
    .mob Darkmist Lurker
    .mob Darkmist Recluse
    .mob Darkmist Silkspinner
step
    #completewith Drop635x2
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Mirefin Puddlejumper|r, |cRXP_ENEMY_Mirefin Murloc|r, |cRXP_ENEMY_Mirefin Warrior|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #label Drop635x2
    #loop
    .goto 1445/1,-2972.62,-2858.98,0
    .goto 1445/1,-2972.62,-2858.98,40,0
    .goto 1445/1,-3020.92,-2791.78,40,0
    .goto 1445/1,-3019.35,-2818.03,40,0
    .goto 1445/1,-3055.05,-2869.13,40,0
    .goto 1445/1,-3019.87,-2957.33,40,0
    .goto 1445/1,-2946.90,-2979.03,40,0
    .goto 1445/1,-2972.62,-2927.93,40,0
    >>Kill |cRXP_ENEMY_Theramore Infiltrators|r
    .complete 1201,1 --Theramore Infiltrator slain (9)
    .mob Theramore Infiltrator
step
    .goto 1445/1,-2823.52,-3106.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nazeer Bloodpike|r
    .turnin 1201 >>Turn in Theramore Spies
    .turnin 1238 >>Turn in The Lost Report
    .accept 1202 >>Accept The Theramore Docks
    .target Nazeer Bloodpike
step
    .goto 1445/1,-2887.05,-3149.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krog|r
    .accept 1276 >>Accept The Black Shield
    .target Krog
    .isQuestTurnedIn 1273 --any of: Questioning Reethe
    .xp <30,1
step
    .goto 1445/1,-2820.37,-3372.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mudcrush Durtfeet|r
    .turnin 1177 >>Turn in Hungry!
    .target Mudcrush Durtfeet
step
    .goto 1445/1,-3885.60,-2940.53
    >>Click the |cRXP_PICK_Loose Dirt|r
    .accept 1239 >>Accept The Severed Head
step
    .goto 1445/1,-3885.60,-2952.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Swamp Eye" Jarl|r
    .turnin 1206 >>Turn in Jarl Needs Eyes
    .accept 1203 >>Accept Jarl Needs a Blade
    .target "Swamp Eye" Jarl
step << Undead
    .trainer >> Train your class spells
step
    .trainer >> Train your class spells
step
    .goto 1445/1,-3885.60,-2952.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Swamp Eye" Jarl|r
    .turnin 1203 >>Turn in Jarl Needs a Blade
    .target "Swamp Eye" Jarl
    .isQuestComplete 1203
step
    .goto 1445/1,-3977.47,-2767.63,0
    .goto 1445/1,-4007.92,-2599.98,0
    .goto 1445/1,-3819.45,-2561.83,0
    .goto 1445/1,-3977.47,-2767.63,60,0
    .goto 1445/1,-4007.92,-2599.98,60,0
    .goto 1445/1,-3819.45,-2561.83,60,0
    .xp 37+71300 >> Grind |cRXP_ENEMY_Murlocs|r until you are at least 71300+/76100xp
step
    .goto 1445/1,-3977.47,-2767.63,0
    .goto 1445/1,-4007.92,-2599.98,0
    .goto 1445/1,-3819.45,-2561.83,0
    .goto 1445/1,-3977.47,-2767.63,60,0
    .goto 1445/1,-4007.92,-2599.98,60,0
    .goto 1445/1,-3819.45,-2561.83,60,0
    .xp 37+74000 >> Grind |cRXP_ENEMY_Murlocs|r until you are at least 74000+/76100xp
step
    .goto 1445/1,-3977.47,-2767.63,0
    .goto 1445/1,-4007.92,-2599.98,0
    .goto 1445/1,-3819.45,-2561.83,0
    .goto 1445/1,-3977.47,-2767.63,60,0
    .goto 1445/1,-4007.92,-2599.98,60,0
    .goto 1445/1,-3819.45,-2561.83,60,0
    .xp 37+64130 >> Grind |cRXP_ENEMY_Murlocs|r until you are at least 66500+/76100xp
step
    .goto 1445/1,-3977.47,-2767.63,0
    .goto 1445/1,-4007.92,-2599.98,0
    .goto 1445/1,-3819.45,-2561.83,0
    .goto 1445/1,-3977.47,-2767.63,60,0
    .goto 1445/1,-4007.92,-2599.98,60,0
    .goto 1445/1,-3819.45,-2561.83,60,0
    .xp 37+67980 >> Grind |cRXP_ENEMY_Murlocs|r until you are at least 71900+/76100xp
step
    .goto 1445/1,-3977.47,-2767.63,0
    .goto 1445/1,-4007.92,-2599.98,0
    .goto 1445/1,-3819.45,-2561.83,0
    .goto 1445/1,-3977.47,-2767.63,60,0
    .goto 1445/1,-4007.92,-2599.98,60,0
    .goto 1445/1,-3819.45,-2561.83,60,0
    .xp 39+80575 >>Grind |cRXP_ENEMY_Murlocs|r until you are at least 80575+/85700xp
step
    .goto 1445/1,-4470.97,-3616.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Janene|r
    .target Innkeeper Janene
    .home >>Set your Hearthstone to Innkeeper Janene's inn
step
    .goto 1445/1,-4730.32,-3824.98
    >>Open the |cRXP_PICK_Captain's Footlocker|r. Loot it for |cRXP_LOOT_Captain's Documents|r
    .complete 1202,1 --Captain's Documents (1)
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 1953 >>Turn in Return to the Marsh
    .target Tabetha
    .isOnQuest 1953
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 1951 >>Turn in Rituals of Power
    .target Tabetha
    .isQuestComplete 1951
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 1947 >>Turn in Journey to the Marsh
    .target Tabetha
    .isOnQuest 1947
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .accept 1949 >>Accept Hidden Secrets
    .target Tabetha
    .isQuestTurnedIn 1947 --any of: Journey to the Marsh
    .xp <30,1
step << Mage
    .xp 35 >>Grind to level 35 (The Infernal Orb needs it)
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .accept 1954 >>Accept The Infernal Orb
    .target Tabetha
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 1954 >>Turn in The Infernal Orb
    .target Tabetha
    .isQuestComplete 1954
step
    .goto 1445/1,-2823.52,-3106.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nazeer Bloodpike|r
    .turnin 1239 >>Turn in The Severed Head
    .turnin 1202 >>Turn in The Theramore Docks
    .accept 1240 >>Accept The Troll Witchdoctor
    .target Nazeer Bloodpike
step << Warlock
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 1799 >>Turn in Fragments of the Orb of Orahil
    .target Tabetha
    .isQuestComplete 1799
step
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 2861 >>Turn in Tabetha's Task
    .target Tabetha
    .isOnQuest 2861
step
    #loop
    .goto 1445/1,-3778.50,-4294.33,0
    .goto 1445/1,-3778.50,-4294.33,40,0
    .goto 1445/1,-3852.00,-4280.33,40,0
    .goto 1445/1,-3926.02,-4309.03,40,0
    .goto 1445/1,-3999.00,-4243.23,40,0
    .goto 1445/1,-3946.50,-4217.33,40,0
    .goto 1445/1,-3984.82,-4139.98,40,0
    .goto 1445/1,-3894.00,-4175.33,40,0
    .goto 1445/1,-3894.52,-4236.58,40,0
    .goto 1445/1,-3831.00,-4217.33,40,0
    >>Kill |cRXP_ENEMY_Muckshell Razorclaws|r, |cRXP_ENEMY_Muckshell Clackers|r, |cRXP_ENEMY_Muckshell Scrabblers|r and |cRXP_ENEMY_Muckshell Snapclaws|r. Loot them for |cRXP_LOOT_Jeweled Pendant|r
    .complete 1261,1 --Jeweled Pendant (1)
    .mob Muckshell Razorclaw
    .mob Muckshell Clacker
    .mob Muckshell Scrabbler
    .mob Muckshell Snapclaw
    .isOnQuest 1261
step
    .goto 1445/1,-2823.52,-3106.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nazeer Bloodpike|r
    .turnin 1261 >>Turn in Marg Speaks
    .target Nazeer Bloodpike
    .isOnQuest 1261
step
    .goto 1445/1,-2823.52,-3106.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nazeer Bloodpike|r
    .accept 1262 >>Accept Report to Zor
    .target Nazeer Bloodpike
    .isQuestTurnedIn 1261 --any of: Marg Speaks
    .xp <30,1
step
    .goto 1445/1,-2608.27,-4348.23
    >>Click the |cRXP_PICK_Musty Scroll|r
    .turnin 625 >>Turn in Cortello's Riddle
    .isOnQuest 625
step
    .goto 1445/1,-2608.27,-4348.23
    >>Click the |cRXP_PICK_Musty Scroll|r
    .accept 626 >>Accept Cortello's Riddle
    .isQuestTurnedIn 625 --any of: Cortello's Riddle
    .xp <35,1
step
    .goto 1445/1,-3521.25,-4668.83
    .xp 47+118800 >> Grind to level 47+118800
step
    .goto 1445/1,-3949.65,-5103.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Emberstrife|r
    .turnin 6570 >>Turn in Emberstrife
    .target Emberstrife
    .isOnQuest 6570
step
    +|cRXP_WARN_That is all of Dustwallow Marsh for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Arathi Highlands|r: Crystal in the Mountains
    >>|cRXP_FRIENDLY_Orgrimmar|r: Report to Zor
    >>|cRXP_FRIENDLY_Stranglethorn Vale|r: The Troll Witchdoctor
    >>|cRXP_FRIENDLY_The Hinterlands|r: Cortello's Riddle
    >>|cRXP_FRIENDLY_Thousand Needles|r: Hidden Secrets << Mage
    >>|cRXP_FRIENDLY_Thunder Bluff|r: The Black Shield
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Jarl Needs a Blade
    >>|cRXP_FRIENDLY_Desolace and back here|r: The Infernal Orb << Mage
step
    .xp 38 >>|cRXP_WARN_The rest of Dustwallow Marsh is planned from level 38.|r Come back to this guide then
step
    .goto 1445/1,-2892.82,-3110.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Do'gol|r
    .accept 1322 >>Accept The Black Shield
    .target Do'gol
step
    #loop
    .goto 1445/1,-3322.27,-3324.13,0
    .goto 1445/1,-3322.27,-3324.13,40,0
    .goto 1445/1,-3362.70,-3375.58,40,0
    .goto 1445/1,-3386.85,-3439.98,40,0
    .goto 1445/1,-3434.62,-3516.98,40,0
    .goto 1445/1,-3167.40,-3787.88,40,0
    .goto 1445/1,-3211.50,-3589.78,40,0
    .goto 1445/1,-3161.62,-3562.83,40,0
    .goto 1445/1,-3219.37,-3518.38,40,0
    .goto 1445/1,-3248.77,-3485.48,40,0
    >>Kill |cRXP_ENEMY_Darkfang Creepers|r, |cRXP_ENEMY_Darkfang Spiders|r, |cRXP_ENEMY_Darkfang Venomspitters|r and |cRXP_ENEMY_Giant Darkfang Spiders|r. Loot them for |cRXP_LOOT_Acidic Venom Sac|r
    .complete 1322,1 --Acidic Venom Sac (6)
    .mob Darkfang Creeper
    .mob Darkfang Spider
    .mob Darkfang Venomspitter
    .mob Giant Darkfang Spider
step
    .goto 1445/1,-2892.82,-3110.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Do'gol|r
    .turnin 1322 >>Turn in The Black Shield
    .accept 1323 >>Accept The Black Shield
    .target Do'gol
step
    .goto 1445/1,-2887.05,-3149.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krog|r
    .turnin 1323 >>Turn in The Black Shield
    .target Krog
step << Warlock
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .accept 4961 >>Accept Cleansing of the Orb of Orahil
    .target Tabetha
    .isQuestTurnedIn 1799 --Fragments of the Orb of Orahil
    .isQuestTurnedIn 4962 --Shard of a Felhound
    .xp <35,1
step << Warlock
    .goto 1445/1,-3378.97,-4027.28
    >>Kill |cRXP_ENEMY_Demon of the Orb|r
    .complete 4961,1 --Demon of the Orb slain (1)
    .mob Demon of the Orb
    .isOnQuest 4961
step << Warlock
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 4961 >>Turn in Cleansing of the Orb of Orahil
    .target Tabetha
    .isOnQuest 4961
step << Warlock
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .accept 4976 >>Accept Returning the Cleansed Orb
    .target Tabetha
    .isQuestTurnedIn 4961 --any of: Cleansing of the Orb of Orahil
    .xp <35,1
step
    .goto 1445/1,-3885.60,-2952.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Swamp Eye" Jarl|r
    .turnin 1203 >>Turn in Jarl Needs a Blade
    .target "Swamp Eye" Jarl
    .isQuestComplete 1203
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 1954 >>Turn in The Infernal Orb
    .target Tabetha
    .isQuestComplete 1954
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .accept 1957 >>Accept Mana Surges
    .target Tabetha
    .isQuestTurnedIn 1956 --any of: Power in Uldaman
    .xp <35,1
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .accept 1952 >>Accept Mage's Wand
    .target Tabetha
    .isQuestTurnedIn 1948 --Items of Power
    .isQuestTurnedIn 1951 --Rituals of Power
    .xp <30,1
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .accept 1948 >>Accept Items of Power
    .target Tabetha
    .isQuestTurnedIn 1947 --any of: Journey to the Marsh
    .xp <30,1
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 1952 >>Turn in Mage's Wand
    .target Tabetha
    .isOnQuest 1952
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .accept 1955 >>Accept The Exorcism
    .target Tabetha
    .isQuestTurnedIn 1954 --any of: The Infernal Orb
    .xp <35,1
step << Mage
    .goto 1445/1,-3381.07,-4026.23
    >>Kill |cRXP_ENEMY_Mana Surges|r
    .complete 1957,1 --Mana Surge slain (12)
    .mob Mana Surge
    .isOnQuest 1957
step << Mage
    .goto 1445/1,-3378.97,-4027.28
    >>Kill |cRXP_ENEMY_Demon of the Orb|r
    .complete 1955,1 --Demon of the Orb slain (1)
    .mob Demon of the Orb
    .isOnQuest 1955
step << Mage
    .goto 1445/1,-3369.00,-4035.33
    >>Kill the Demon of the Orb
    .complete 1955,2 --Kill the Demon of the Orb
    .isOnQuest 1955
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 1957 >>Turn in Mana Surges
    .target Tabetha
    .isOnQuest 1957
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .accept 1958 >>Accept Celestial Power
    .target Tabetha
    .isQuestTurnedIn 1957 --any of: Mana Surges
    .xp <35,1
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 1955 >>Turn in The Exorcism
    .target Tabetha
    .isOnQuest 1955
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 1958 >>Turn in Celestial Power
    .target Tabetha
    .isOnQuest 1958
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .accept 1956 >>Accept Power in Uldaman
    .target Tabetha
    .isQuestTurnedIn 1955 --any of: The Exorcism
    .xp <35,1
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 1948 >>Turn in Items of Power
    .target Tabetha
    .isQuestComplete 1948
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 1956 >>Turn in Power in Uldaman
    .target Tabetha
    .isQuestComplete 1956
step << Mage
    #loop
    .goto 1445/1,-3289.72,-4306.23,0
    .goto 1445/1,-3289.72,-4306.23,40,0
    .goto 1445/1,-3336.97,-4323.03,40,0
    .goto 1445/1,-3330.15,-4374.48,40,0
    .goto 1445/1,-3228.82,-4333.18,40,0
    >>Open the |cRXP_PICK_Gold Vein|r. Loot it for |cRXP_LOOT_Jade|r
    .complete 1948,1 --Jade (1)
    .isOnQuest 1948
step
    +|cRXP_WARN_That is all of Dustwallow Marsh for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_The Barrens|r: Returning the Cleansed Orb << Warlock
step
    .xp 41 >>|cRXP_WARN_The rest of Dustwallow Marsh is planned from level 41.|r Come back to this guide then
step
    .goto 1445/1,-3885.60,-2952.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Swamp Eye" Jarl|r
    .turnin 1203 >>Turn in Jarl Needs a Blade
    .target "Swamp Eye" Jarl
    .isQuestComplete 1203
step
    .goto 1445/1,-2880.22,-3132.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Overlord Mok'Morokk|r
    .accept 1166 >>Accept Overlord Mok'Morokk's Concern
    .target Overlord Mok'Morokk
step
    .goto 1445/1,-2925.37,-3191.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Draz'Zilb|r
    .accept 1169 >>Accept Identifying the Brood
    .target Draz'Zilb
step
    .goto 1445/1,-2936.92,-3131.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tharg|r
    .accept 1168 >>Accept Army of the Black Dragon
    .target Tharg
step
    #completewith Along6
    >>As you go: Kill |cRXP_ENEMY_Firemane Scouts|r. Kill |cRXP_ENEMY_Firemane Ash Tails|r. |cRXP_WARN_Anything left is finished later|r
    .complete 1168,1 --Firemane Scout slain (10)
    .complete 1168,2 --Firemane Ash Tail slain (10)
    .mob Firemane Scout
    .mob Firemane Ash Tail
step
    #completewith Along4
    >>As you go: Kill |cRXP_ENEMY_Searing Hatchlings|r and |cRXP_ENEMY_Searing Whelps|r. Loot them for |cRXP_LOOT_Searing Tongue|r. Kill |cRXP_ENEMY_Searing Hatchlings|r and |cRXP_ENEMY_Searing Whelps|r. Loot them for |cRXP_LOOT_Searing Heart|r. |cRXP_WARN_Anything left is finished later|r
    .complete 1169,1 --Searing Tongue (15)
    .complete 1169,2 --Searing Heart (15)
    .mob Searing Hatchling
    .mob Searing Whelp
step
    #label Along4
    .goto 1445/1,-3312.82,-4344.73
    >>Pick up |cRXP_PICK_Mok'Morokk's Snuff|r from the ground
    .complete 1166,1 --Mok'Morokk's Snuff (1)
step
    .goto 1445/1,-3004.65,-4328.28
    >>Pick up |cRXP_PICK_Mok'Morokk's Grog|r from the ground
    .complete 1166,2 --Mok'Morokk's Grog (1)
step
    #label Along6
    #loop
    .goto 1445/1,-2961.07,-4388.83,0
    .goto 1445/1,-2961.07,-4388.83,40,0
    .goto 1445/1,-2960.02,-4421.38,40,0
    .goto 1445/1,-2962.65,-4466.18,40,0
    .goto 1445/1,-2898.60,-4468.28,40,0
    .goto 1445/1,-2928.52,-4387.43,40,0
    >>Pick up |cRXP_PICK_Mok'Morokk's Strongbox|r from the ground
    >>Kill |cRXP_ENEMY_Firemane Scalebanes|r
    .complete 1166,3 --Mok'Morokk's Strongbox (1)
    .complete 1168,3 --Firemane Scalebane slain (5)
    .mob Firemane Scalebane
step
    #completewith Along7
    >>As you go: Kill |cRXP_ENEMY_Searing Hatchlings|r and |cRXP_ENEMY_Searing Whelps|r. Loot them for |cRXP_LOOT_Searing Tongue|r. Kill |cRXP_ENEMY_Searing Hatchlings|r and |cRXP_ENEMY_Searing Whelps|r. Loot them for |cRXP_LOOT_Searing Heart|r. |cRXP_WARN_Anything left is finished later|r
    .complete 1169,1 --Searing Tongue (15)
    .complete 1169,2 --Searing Heart (15)
    .mob Searing Hatchling
    .mob Searing Whelp
step
    #label Along7
    #loop
    .goto 1445/1,-3211.50,-4434.33,0
    .goto 1445/1,-3211.50,-4434.33,40,0
    .goto 1445/1,-3190.50,-4350.33,40,0
    .goto 1445/1,-3274.50,-4350.33,40,0
    .goto 1445/1,-3274.50,-4287.33,40,0
    .goto 1445/1,-3327.00,-4287.33,40,0
    .goto 1445/1,-3369.00,-4322.33,40,0
    .goto 1445/1,-3390.00,-4378.33,40,0
    .goto 1445/1,-3327.00,-4399.33,40,0
    .goto 1445/1,-3327.00,-4455.33,40,0
    >>Kill |cRXP_ENEMY_Firemane Scouts|r
    >>Kill |cRXP_ENEMY_Firemane Ash Tails|r
    .complete 1168,1 --Firemane Scout slain (10)
    .complete 1168,2 --Firemane Ash Tail slain (10)
    .mob Firemane Scout
    .mob Firemane Ash Tail
step
    #loop
    .goto 1445/1,-3379.50,-4658.33,0
    .goto 1445/1,-3379.50,-4658.33,40,0
    .goto 1445/1,-3579.00,-4763.33,40,0
    .goto 1445/1,-3526.50,-4889.33,40,0
    .goto 1445/1,-3432.00,-4994.33,40,0
    .goto 1445/1,-3295.50,-4924.33,40,0
    .goto 1445/1,-3148.50,-4854.33,40,0
    .goto 1445/1,-3211.50,-4763.33,40,0
    .goto 1445/1,-3306.00,-4791.33,40,0
    .goto 1445/1,-3390.00,-4840.33,40,0
    >>Kill |cRXP_ENEMY_Searing Hatchlings|r and |cRXP_ENEMY_Searing Whelps|r. Loot them for |cRXP_LOOT_Searing Tongue|r
    >>Kill |cRXP_ENEMY_Searing Hatchlings|r and |cRXP_ENEMY_Searing Whelps|r. Loot them for |cRXP_LOOT_Searing Heart|r
    .complete 1169,1 --Searing Tongue (15)
    .complete 1169,2 --Searing Heart (15)
    .mob Searing Hatchling
    .mob Searing Whelp
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 1954 >>Turn in The Infernal Orb
    .target Tabetha
    .isQuestComplete 1954
step
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .accept 2846 >>Accept Tiara of the Deep
    .target Tabetha
step
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 2846 >>Turn in Tiara of the Deep
    .target Tabetha
    .isQuestComplete 2846
step
    .goto 1445/1,-2925.37,-3191.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Draz'Zilb|r
    .turnin 1169 >>Turn in Identifying the Brood
    .accept 1170 >>Accept The Brood of Onyxia
    .target Draz'Zilb
step
    .goto 1445/1,-2880.22,-3132.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Overlord Mok'Morokk|r
    .turnin 1166 >>Turn in Overlord Mok'Morokk's Concern
    .turnin 1170 >>Turn in The Brood of Onyxia
    .accept 1171 >>Accept The Brood of Onyxia
    .target Overlord Mok'Morokk
step
    .goto 1445/1,-2936.92,-3131.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tharg|r
    .turnin 1168 >>Turn in Army of the Black Dragon
    .target Tharg
step
    .goto 1445/1,-2925.37,-3191.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Draz'Zilb|r
    .turnin 1171 >>Turn in The Brood of Onyxia
    .target Draz'Zilb
step
    +|cRXP_WARN_That is all of Dustwallow Marsh for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Tiara of the Deep
step
    .xp 44 >>|cRXP_WARN_The rest of Dustwallow Marsh is planned from level 44.|r Come back to this guide then
step
    .goto 1445/1,-3885.60,-2952.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Swamp Eye" Jarl|r
    .turnin 1203 >>Turn in Jarl Needs a Blade
    .target "Swamp Eye" Jarl
    .isQuestComplete 1203
step
    .goto 1445/1,-2925.37,-3191.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Draz'Zilb|r
    .accept 1172 >>Accept The Brood of Onyxia
    .target Draz'Zilb
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 1954 >>Turn in The Infernal Orb
    .target Tabetha
    .isQuestComplete 1954
step
    .goto 1445/1,-3787.42,-4572.58
    >>Click the |cRXP_PICK_Egg of Onyxia|r
    .complete 1172,1 --Egg of Onyxia destroyed
step
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 2846 >>Turn in Tiara of the Deep
    .target Tabetha
    .isQuestComplete 2846
step
    .goto 1445/1,-2925.37,-3191.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Draz'Zilb|r
    .turnin 1172 >>Turn in The Brood of Onyxia
    .target Draz'Zilb
step
    +|cRXP_WARN_End of the Dustwallow Marsh route.|r
]])
