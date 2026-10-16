-- 39-53 The Hinterlands: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 5 parts with a level check between them (from level 39, 42, 45, 48, 51).
-- Sections (the guide starts at the one for your level): start from 39; part 2 from 42; around Huntsman Markhor from 45; around Katoom the Angler from 48; part 5 from 51.
-- Edit zones/The Hinterlands.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#name 39-53 The Hinterlands

step
    .xp <42,1,RBSection1_1
    .xp 42 >>Finding the place in this guide for your level
step
    .xp <45,1,RBSection2_1
    .xp 45 >>Finding the place in this guide for your level
step
    .xp <48,1,RBSection3_1
    .xp 48 >>Finding the place in this guide for your level
step
    .xp <51,1,RBSection4_1
    .xp 51 >>Finding the place in this guide for your level
step
    .xp <61,1,RBSection5_1
step
    #label RBSection1_1
    #completewith next
    +|cRXP_WARN_The Hinterlands: start|r (planned from level 39)
step
    .goto 1425/0,-3512.71,-832.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Horde Warbringer|r
    .accept 98888 >>Accept Conflict at Darkspear Islands
    .accept 98887 >>Accept Conflict at Darkspear Islands
    .target Horde Warbringer
step
    .goto 1425/0,-3512.71,-832.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Horde Warbringer|r
    .turnin 98887 >>Turn in Conflict at Darkspear Islands
    .target Horde Warbringer
    .isQuestComplete 98887
step
    .goto 1425/0,-3512.71,-832.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Horde Warbringer|r
    .turnin 98888 >>Turn in Conflict at Darkspear Islands
    .target Horde Warbringer
    .isQuestComplete 98888
step
    .goto 1425/0,-2874.38,-463.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Atal'ai Exile|r
    .accept 1446 >>Accept Jammal'an the Prophet
    .target Atal'ai Exile
step
    .goto 1425/0,-2874.38,-463.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Atal'ai Exile|r
    .turnin 1446 >>Turn in Jammal'an the Prophet
    .target Atal'ai Exile
    .isQuestComplete 1446
step
    .goto 1425/0,-2603.34,219.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gilveradin Sunchaser|r
    .turnin 650 >>Turn in Ripple Recovery
    .target Gilveradin Sunchaser
    .isOnQuest 650
step << Hunter
    .goto 1425/0,-4655.00,-42.53,0
    .goto 1425/0,-4655.00,-42.53,50,0
    .goto 1425/0,-4547.20,-119.53,50,0
    .goto 1425/0,-4547.20,-181.13,50,0
    .goto 1425/0,-4454.80,-294.07,50,0
    .goto 1425/0,-4485.60,-381.33,50,0
    .goto 1425/0,-4585.70,-309.47,50,0
    .goto 1425/0,-4578.00,-181.13,50,0
    >>|cRXP_WARN_Cast|r |T132164:0|t[Tame Beast] |cRXP_WARN_on a |cRXP_ENEMY_Saltwater Snapjaw|r to tame it|r
    .train 17267 >>|cRXP_WARN_Attack mobs with it to learn|r |T132278:0|t[Bite (Rank 7)]
    .xp <49,1
step << Hunter
    .goto 1425/0,-4620.35,-573.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Markhor|r
    .target Huntsman Markhor
    .train 17267,3
    .zoneskip The Hinterlands,1
    .xp <49,1
step
    .goto 1425/0,-4685.42,264.95
    >>Click the |cRXP_PICK_Cortello's Treasure|r
    .turnin 626 >>Turn in Cortello's Riddle
    .isOnQuest 626
step
    .goto 1425/0,-2874.38,-463.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Atal'ai Exile|r
    .turnin 1429 >>Turn in The Atal'ai Exile
    .target Atal'ai Exile
    .isOnQuest 1429
step
    .goto 1425/0,-2874.38,-463.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Atal'ai Exile|r
    .accept 1444 >>Accept Return to Fel'Zerul
    .target Atal'ai Exile
    .isQuestTurnedIn 1429 --any of: The Atal'ai Exile
    .xp <38,1
step
    +|cRXP_WARN_That is all of The Hinterlands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Swamp of Sorrows|r: Return to Fel'Zerul
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Conflict at Darkspear Islands, Conflict at Darkspear Islands, Jammal'an the Prophet
step
    +|cRXP_WARN_Until level 42, suggested zones|r: |cRXP_FRIENDLY_Stranglethorn Vale|r (about 0.5 levels of quests, starting around Far Seer Mok'thardin). Then come back to this The Hinterlands guide --RouteBuilder:next
step
    .xp 42 >>|cRXP_WARN_The rest of The Hinterlands is planned from level 42.|r Come back to this guide then
step
    #label RBSection2_1
    #completewith next
    +|cRXP_WARN_The Hinterlands: part 2|r (planned from level 42)
step
    .goto 1425/0,-2481.29,-42.53
    >>Click the |cRXP_PICK_Venom Bottle|r
    .accept 2933 >>Accept Venom Bottles
step
    .goto 1425/0,-2874.38,-463.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Atal'ai Exile|r
    .turnin 1446 >>Turn in Jammal'an the Prophet
    .target Atal'ai Exile
    .isQuestComplete 1446
step
    .goto 1425/0,-3512.71,-832.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Horde Warbringer|r
    .turnin 98888 >>Turn in Conflict at Darkspear Islands
    .target Horde Warbringer
    .isQuestComplete 98888
step
    .goto 1425/0,-3512.71,-832.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Horde Warbringer|r
    .turnin 98887 >>Turn in Conflict at Darkspear Islands
    .target Horde Warbringer
    .isQuestComplete 98887
step
    +|cRXP_WARN_That is all of The Hinterlands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Hillsbrad Foothills|r: Venom Bottles
step
    .xp 45 >>|cRXP_WARN_The rest of The Hinterlands is planned from level 45.|r Come back to this guide then
step
    #label RBSection3_1
    #completewith next
    +|cRXP_WARN_The Hinterlands: around Huntsman Markhor|r (planned from level 45)
step
    .goto 1425/0,-2603.34,219.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gilveradin Sunchaser|r
    .accept 77 >>Accept A Sticky Situation
    .target Gilveradin Sunchaser
    .isQuestTurnedIn 650 --any of: Ripple Recovery
    .xp <42,1
step
    .goto 1425/0,-2874.38,-463.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Atal'ai Exile|r
    .turnin 1446 >>Turn in Jammal'an the Prophet
    .target Atal'ai Exile
    .isQuestComplete 1446
step
    .goto 1425/0,-3512.71,-832.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Horde Warbringer|r
    .turnin 98887 >>Turn in Conflict at Darkspear Islands
    .target Horde Warbringer
    .isQuestComplete 98887
step
    .goto 1425/0,-3512.71,-832.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Horde Warbringer|r
    .turnin 98888 >>Turn in Conflict at Darkspear Islands
    .target Horde Warbringer
    .isQuestComplete 98888
step
    .goto 1425/0,-4548.36,-590.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Smith Slagtree|r
    .accept 7839 >>Accept Vilebranch Hooligans
    .target Smith Slagtree
step
    .goto 1425/0,-4583.39,-622.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lard|r
    .target Lard
    .home >>Set your Hearthstone to Lard's inn
step
    .goto 1425/0,-4608.80,-541.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mystic Yayo'jin|r
    .accept 7844 >>Accept Cannibalistic Cousins
    .target Mystic Yayo'jin
step
    .goto 1425/0,-4631.13,-563.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Otho Moji'ko|r
    .accept 7841 >>Accept Message to the Wildhammer
    .target Otho Moji'ko
step
    .goto 1425/0,-4622.66,-574.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Huntsman Markhor|r
    .accept 7828 >>Accept Stalking the Stalkers
    .accept 7829 >>Accept Hunt the Savages
    .accept 7830 >>Accept Avenging the Fallen
    .target Huntsman Markhor
step
    #completewith Along9
    >>As you go: Kill |cRXP_ENEMY_Vilebranch Scalpers|r. |cRXP_WARN_Anything left is finished later|r
    .complete 7844,1 --Vilebranch Scalper slain (30)
    .mob Vilebranch Scalper
step
    #label Along9
    .goto 1425/0,-4131.40,316.80
    >>Pick up |cRXP_PICK_Slagtree's Lost Tools|r from the ground
    .complete 7839,1 --Slagtree's Lost Tools (1)
step
    #loop
    .goto 1425/0,-3788.37,352.22,0
    .goto 1425/0,-3788.37,352.22,40,0
    .goto 1425/0,-3752.56,337.33,40,0
    .goto 1425/0,-3779.90,412.02,40,0
    .goto 1425/0,-3801.46,475.42,40,0
    >>Open the |cRXP_PICK_Horde Supply Crate|r. Loot it for |cRXP_LOOT_Hinterlands Honey Ripple|r
    .complete 77,1 --Hinterlands Honey Ripple (1)
    .isOnQuest 77
step
    #completewith Along11
    >>As you go: Kill |cRXP_ENEMY_Highvale Scouts|r. Kill |cRXP_ENEMY_Highvale Rangers|r. Kill |cRXP_ENEMY_Highvale Marksmans|r. |cRXP_WARN_Anything left is finished later|r
    .complete 7841,1 --Highvale Scout slain (15)
    .complete 7841,3 --Highvale Ranger slain (15)
    .complete 7841,4 --Highvale Marksman slain (15)
    .mob Highvale Scout
    .mob Highvale Ranger
    .mob Highvale Marksman
step
    #label Along11
    .goto 1425/0,-2758.11,262.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rin'ji|r
    .accept 2742 >>Accept Rin'ji is Trapped!
    .target Rin'ji
step
    .goto 1425/0,-2906.33,20.86
    >>Escort Rin'ji to safety
    .complete 2742,1 --Escort Rin'ji to safety
step
    #completewith Drop485x1
    >>|cRXP_LOOT_OOX-09/HL Distress Beacon|r can drop from |cRXP_ENEMY_Saltwater Snapjaw|r, |cRXP_ENEMY_Vilebranch Axe Thrower|r, |cRXP_ENEMY_Vilebranch Witch Doctor|r. Use it to start the quest if you get one
    .collect 8704,1,485 --OOX-09/HL Distress Beacon (1)
    .accept 485 >>Accept Find OOX-09/HL!
    .use 8704
step
    #loop
    .goto 1425/0,-2847.04,144.32,0
    .goto 1425/0,-2847.04,144.32,40,0
    .goto 1425/0,-2776.20,140.47,40,0
    .goto 1425/0,-2680.72,151.76,40,0
    .goto 1425/0,-2665.71,279.33,40,0
    .goto 1425/0,-2816.63,370.70,40,0
    .goto 1425/0,-2887.08,214.39,40,0
    .goto 1425/0,-2799.69,258.28,40,0
    .goto 1425/0,-2739.63,215.42,40,0
    .goto 1425/0,-2803.92,195.91,40,0
    >>Kill |cRXP_ENEMY_Highvale Scouts|r
    >>Kill |cRXP_ENEMY_Highvale Outrunners|r
    >>Kill |cRXP_ENEMY_Highvale Rangers|r
    >>Kill |cRXP_ENEMY_Highvale Marksmans|r
    .complete 7841,1 --Highvale Scout slain (15)
    .complete 7841,2 --Highvale Outrunner slain (15)
    .complete 7841,3 --Highvale Ranger slain (15)
    .complete 7841,4 --Highvale Marksman slain (15)
    .mob Highvale Scout
    .mob Highvale Outrunner
    .mob Highvale Ranger
    .mob Highvale Marksman
step
    #completewith Along14
    >>As you go: Kill |cRXP_ENEMY_Savage Owlbeasts|r. |cRXP_WARN_Anything left is finished later|r
    .complete 7829,1 --Savage Owlbeast slain (20)
    .mob Savage Owlbeast
step
    #label Along14
    #loop
    .goto 1425/0,-3377.96,-59.73,0
    .goto 1425/0,-3377.96,-59.73,40,0
    .goto 1425/0,-3415.69,-48.69,40,0
    .goto 1425/0,-3492.69,-10.71,40,0
    .goto 1425/0,-3518.48,-43.82,40,0
    .goto 1425/0,-3570.46,-72.31,40,0
    .goto 1425/0,-3424.16,-111.83,40,0
    >>Kill |cRXP_ENEMY_Silvermane Howlers|r
    .complete 7828,2 --Silvermane Howler slain (10)
    .mob Silvermane Howler
step
    #loop
    .goto 1425/0,-4266.54,199.50,0
    .goto 1425/0,-4266.54,199.50,40,0
    .goto 1425/0,-4287.33,247.76,40,0
    .goto 1425/0,-4331.22,264.95,40,0
    .goto 1425/0,-4343.15,255.97,40,0
    .goto 1425/0,-4353.16,219.78,40,0
    >>Kill |cRXP_ENEMY_Vilebranch Scalpers|r
    .complete 7844,1 --Vilebranch Scalper slain (30)
    .mob Vilebranch Scalper
step
    #loop
    .goto 1425/0,-3483.45,-148.28,0
    .goto 1425/0,-3483.45,-148.28,40,0
    .goto 1425/0,-3381.42,-151.62,40,0
    .goto 1425/0,-3290.95,-213.99,40,0
    .goto 1425/0,-3320.59,-244.53,40,0
    .goto 1425/0,-3342.54,-282.52,40,0
    .goto 1425/0,-3386.43,-268.66,40,0
    .goto 1425/0,-3406.06,-239.91,40,0
    .goto 1425/0,-3470.36,-286.88,40,0
    .goto 1425/0,-3454.96,-186.27,40,0
    >>Kill |cRXP_ENEMY_Vilebranch Soothsayers|r
    .complete 7844,2 --Vilebranch Soothsayer slain (15)
    .mob Vilebranch Soothsayer
step
    #label Drop485x1
    #loop
    .goto 1425/0,-3823.40,65.27,0
    .goto 1425/0,-3823.40,65.27,40,0
    .goto 1425/0,-3808.00,173.07,40,0
    .goto 1425/0,-3908.10,229.53,40,0
    .goto 1425/0,-3992.80,301.40,40,0
    .goto 1425/0,-4144.88,219.01,40,0
    .goto 1425/0,-3977.40,132.00,40,0
    .goto 1425/0,-4085.20,106.33,40,0
    .goto 1425/0,-4108.30,-6.60,40,0
    .goto 1425/0,-3931.20,-16.87,40,0
    >>Kill |cRXP_ENEMY_Razorbeak Skylord|r and loot |cRXP_LOOT_Skylord Plume|r
    >>Kill |cRXP_ENEMY_Silvermane Stalkers|r
    >>Kill |cRXP_ENEMY_Savage Owlbeasts|r
    .complete 7830,1 --Skylord Plume (1)
    .complete 7828,1 --Silvermane Stalker slain (10)
    .complete 7829,1 --Savage Owlbeast slain (20)
    .mob Razorbeak Skylord
    .mob Silvermane Stalker
    .mob Savage Owlbeast
step
    .goto 1425/0,-4897.55,-47.92
    >>Click the |cRXP_PICK_Rin'ji's Secret|r
    .turnin 2742 >>Turn in Rin'ji is Trapped!
    .accept 2782 >>Accept Rin'ji's Secret
step
    #completewith next
    .hs >>Hearth to Lard's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1425/0,-4548.36,-590.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Smith Slagtree|r
    .turnin 7839 >>Turn in Vilebranch Hooligans
    .target Smith Slagtree
step
    .goto 1425/0,-4608.80,-541.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mystic Yayo'jin|r
    .turnin 7844 >>Turn in Cannibalistic Cousins
    .target Mystic Yayo'jin
step
    .goto 1425/0,-4622.66,-574.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Huntsman Markhor|r
    .turnin 7828 >>Turn in Stalking the Stalkers
    .turnin 7829 >>Turn in Hunt the Savages
    .turnin 7830 >>Turn in Avenging the Fallen
    .target Huntsman Markhor
step
    .goto 1425/0,-4631.13,-563.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Otho Moji'ko|r
    .turnin 7841 >>Turn in Message to the Wildhammer
    .accept 7842 >>Accept Another Message to the Wildhammer
    .target Otho Moji'ko
step
    #completewith Drop485x2
    >>|cRXP_LOOT_OOX-09/HL Distress Beacon|r can drop from |cRXP_ENEMY_Saltwater Snapjaw|r, |cRXP_ENEMY_Vilebranch Axe Thrower|r, |cRXP_ENEMY_Vilebranch Witch Doctor|r. Use it to start the quest if you get one
    .collect 8704,1,485 --OOX-09/HL Distress Beacon (1)
    .accept 485 >>Accept Find OOX-09/HL!
    .use 8704
step
    #label Drop485x2
    #loop
    .goto 1425/0,-2845.12,-28.93,0
    .goto 1425/0,-2845.12,-28.93,40,0
    .goto 1425/0,-2789.29,-70.51,40,0
    .goto 1425/0,-2723.46,-106.19,40,0
    .goto 1425/0,-2653.39,-46.13,40,0
    .goto 1425/0,-2681.49,15.22,40,0
    .goto 1425/0,-2475.90,-16.87,40,0
    .goto 1425/0,-2452.80,96.07,40,0
    .goto 1425/0,-2599.10,229.53,40,0
    .goto 1425/0,-2752.72,-14.04,40,0
    >>Kill |cRXP_ENEMY_Witherbark Hideskinners|r, |cRXP_ENEMY_Trained Razorbeaks|r, |cRXP_ENEMY_Razorbeak Gryphons|r and |cRXP_ENEMY_Razorbeak Skylords|r. Loot them for |cRXP_LOOT_Long Elegant Feather|r
    .complete 7842,1 --Long Elegant Feather (10)
    .mob Witherbark Hideskinner
    .mob Trained Razorbeak
    .mob Razorbeak Gryphon
    .mob Razorbeak Skylord
step
    .goto 1425/0,-4631.13,-563.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Otho Moji'ko|r
    .turnin 7842 >>Turn in Another Message to the Wildhammer
    .target Otho Moji'ko
step
    .goto 1425/0,-4585.70,-620.03,15,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lard|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Lard
    .subzoneskip 3317,1
step
    .goto 1425/0,-2603.34,219.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gilveradin Sunchaser|r
    .turnin 77 >>Turn in A Sticky Situation
    .target Gilveradin Sunchaser
    .isOnQuest 77
step
    .goto 1425/0,-2603.34,219.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gilveradin Sunchaser|r
    .accept 81 >>Accept Ripple Delivery
    .target Gilveradin Sunchaser
    .isQuestTurnedIn 77 --any of: A Sticky Situation
    .xp <42,1
step
    .goto 1425/0,-3474.98,500.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Homing Robot OOX-09/HL|r
    .turnin 485 >>Turn in Find OOX-09/HL!
    .target Homing Robot OOX-09/HL
    .isOnQuest 485
step
    .goto 1425/0,-3474.98,500.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Homing Robot OOX-09/HL|r
    .accept 836 >>Accept Rescue OOX-09/HL!
    .target Homing Robot OOX-09/HL
    .isQuestTurnedIn 485 --any of: Find OOX-09/HL!
    .xp <43,1
step
    .goto 1425/0,-4621.89,-108.24
    >>Escort OOX-09/HL to the shoreline beyond Overlook Cliff
    .complete 836,1 --Escort OOX-09/HL to the shoreline beyond Overlook Cliff
    .isOnQuest 836
step
    +|cRXP_WARN_That is all of The Hinterlands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Orgrimmar|r: Ripple Delivery
    >>|cRXP_FRIENDLY_Stranglethorn Vale|r: Rescue OOX-09/HL!
    >>|cRXP_FRIENDLY_Undercity|r: Rin'ji's Secret
step
    .xp 48 >>|cRXP_WARN_The rest of The Hinterlands is planned from level 48.|r Come back to this guide then
step
    #label RBSection4_1
    #completewith next
    +|cRXP_WARN_The Hinterlands: around Katoom the Angler|r (planned from level 48)
step
    .goto 1425/0,-4583.39,-622.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lard|r
    .accept 7840 >>Accept Lard Lost His Lunch
    .target Lard
    .home >>Set your Hearthstone to Lard's inn
step
    .goto 1425/0,-4667.71,-626.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Katoom the Angler|r
    .accept 7815 >>Accept Snapjaws, Mon!
    .accept 7816 >>Accept Gammerita, Mon!
    .target Katoom the Angler
step
    #completewith Along3
    >>As you go: Kill |cRXP_ENEMY_Saltwater Snapjaws|r. |cRXP_WARN_Anything left is finished later|r
    .complete 7815,1 --Saltwater Snapjaw slain (15)
    .mob Saltwater Snapjaw
step
    .goto 1425/0,-4670.40,-27.90
    >>Kill |cRXP_ENEMY_Gammerita|r and loot |cRXP_LOOT_Katoom's Best Lure|r
    .complete 7816,1 --Katoom's Best Lure (1)
    .mob Gammerita
step
    #label Along3
    .goto 1425/0,-4832.10,409.20
    >>Kill |cRXP_ENEMY_Vilebranch Kidnapper|r and loot |cRXP_LOOT_Lard's Lunch|r. It can also be picked up from |cRXP_PICK_Lard's Picnic Basket|r on the ground
    .complete 7840,1 --Lard's Lunch (1)
    .mob Vilebranch Kidnapper
step
    #loop
    .goto 1425/0,-4551.44,-117.99,0
    .goto 1425/0,-4551.44,-117.99,40,0
    .goto 1425/0,-4551.44,-180.88,40,0
    .goto 1425/0,-4505.62,-207.06,40,0
    .goto 1425/0,-4554.52,-253.00,40,0
    .goto 1425/0,-4448.26,-286.11,40,0
    .goto 1425/0,-4452.49,-355.15,40,0
    .goto 1425/0,-4588.40,-344.63,40,0
    .goto 1425/0,-4645.38,-220.92,40,0
    .goto 1425/0,-4598.02,-206.80,40,0
    >>Kill |cRXP_ENEMY_Saltwater Snapjaws|r
    .complete 7815,1 --Saltwater Snapjaw slain (15)
    .mob Saltwater Snapjaw
step
    .goto 1425/0,-4667.71,-626.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Katoom the Angler|r
    .turnin 7815 >>Turn in Snapjaws, Mon!
    .turnin 7816 >>Turn in Gammerita, Mon!
    .target Katoom the Angler
step
    .goto 1425/0,-4583.39,-622.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lard|r
    .turnin 7840 >>Turn in Lard Lost His Lunch
    .target Lard
step
    .goto 1425/0,-4619.58,-560.74
    >>Click the |cRXP_PICK_Call to Arms!|r
    .accept 7862 >>Accept Job Opening: Guard Captain of Revantusk Village
step
    .goto 1425/0,-4631.13,-563.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Otho Moji'ko|r
    .accept 7843 >>Accept The Final Message to the Wildhammer
    .target Otho Moji'ko
    .isQuestTurnedIn 7842 --any of: Another Message to the Wildhammer
step
    .goto 1425/0,-4622.66,-574.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Huntsman Markhor|r
    .accept 7849 >>Accept Separation Anxiety
    .target Huntsman Markhor
step
    .goto 1425/0,-4585.70,-616.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Primal Torntusk|r
    .accept 7845 >>Accept Kidnapped Elder Torntusk!
    .accept 7850 >>Accept Dark Vessels
    .target Primal Torntusk
step
    .goto 1425/0,-3966.24,-467.32
    >>Open the |cRXP_PICK_Pile of Bones|r. Loot it for |cRXP_LOOT_Huntsman Malkhor's Bones|r
    .complete 7849,2 --Huntsman Malkhor's Bones (1)
step
    #completewith Along16
    >>As you go: Pick up |cRXP_PICK_Vessel of Tainted Blood|r from the ground. |cRXP_WARN_Anything left is finished later|r
    .complete 7850,1 --Vessel of Tainted Blood (1)
step
    .goto 1425/0,-3829.56,-195.51
    >>Open the |cRXP_PICK_Pile of Skulls|r. Loot it for |cRXP_LOOT_Huntsman Malkhor's Skull|r
    .complete 7849,1 --Huntsman Malkhor's Skull (1)
step
    .goto 1425/0,-3873.07,-531.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elder Torntusk|r
    .turnin 7845 >>Turn in Kidnapped Elder Torntusk!
    .target Elder Torntusk
step
    #loop
    .goto 1425/0,-3906.18,-268.14,0
    .goto 1425/0,-3906.18,-268.14,40,0
    .goto 1425/0,-3915.42,-217.32,40,0
    .goto 1425/0,-3913.88,-189.35,40,0
    .goto 1425/0,-3835.72,-256.85,40,0
    >>Kill |cRXP_ENEMY_Vilebranch Soul Eaters|r
    .complete 7862,4 --Vilebranch Soul Eater slain (20)
    .mob Vilebranch Soul Eater
step
    #completewith Along15
    >>As you go: Kill |cRXP_ENEMY_Vilebranch Shadow Hunters|r. |cRXP_WARN_Anything left is finished later|r
    .complete 7862,2 --Vilebranch Shadow Hunter slain (20)
    .mob Vilebranch Shadow Hunter
step
    #label Along15
    #loop
    .goto 1425/0,-4010.51,-241.96,0
    .goto 1425/0,-4010.51,-241.96,40,0
    .goto 1425/0,-4052.09,-242.99,40,0
    .goto 1425/0,-4200.70,-396.73,40,0
    .goto 1425/0,-4136.79,-404.95,40,0
    .goto 1425/0,-4136.02,-376.46,40,0
    .goto 1425/0,-4061.72,-399.81,40,0
    .goto 1425/0,-4060.56,-343.86,40,0
    .goto 1425/0,-4022.06,-329.23,40,0
    .goto 1425/0,-4051.71,-266.86,40,0
    >>Kill |cRXP_ENEMY_Vilebranch Berserkers|r
    .complete 7862,1 --Vilebranch Berserker slain (20)
    .mob Vilebranch Berserker
step
    #label Along16
    #loop
    .goto 1425/0,-3997.81,-529.69,0
    .goto 1425/0,-3997.81,-529.69,40,0
    .goto 1425/0,-4019.75,-579.48,40,0
    .goto 1425/0,-4021.29,-642.11,40,0
    .goto 1425/0,-4005.51,-672.91,40,0
    .goto 1425/0,-4043.62,-668.29,40,0
    .goto 1425/0,-4062.10,-642.11,40,0
    .goto 1425/0,-4111.77,-596.93,40,0
    .goto 1425/0,-4156.43,-608.74,40,0
    .goto 1425/0,-4186.07,-521.47,40,0
    >>Kill |cRXP_ENEMY_Vilebranch Blood Drinkers|r
    .complete 7862,3 --Vilebranch Blood Drinker slain (20)
    .mob Vilebranch Blood Drinker
step
    #loop
    .goto 1425/0,-4137.95,-518.14,0
    .goto 1425/0,-4137.95,-518.14,40,0
    .goto 1425/0,-4192.62,-410.59,40,0
    .goto 1425/0,-4232.27,-315.88,40,0
    .goto 1425/0,-4176.45,-252.23,40,0
    .goto 1425/0,-4088.28,-244.02,40,0
    .goto 1425/0,-3983.56,-226.56,40,0
    .goto 1425/0,-3967.39,-335.13,40,0
    .goto 1425/0,-4007.43,-407.51,40,0
    .goto 1425/0,-4075.96,-366.19,40,0
    >>Kill |cRXP_ENEMY_Vilebranch Shadow Hunters|r
    >>Pick up |cRXP_PICK_Vessel of Tainted Blood|r from the ground
    .complete 7862,2 --Vilebranch Shadow Hunter slain (20)
    .complete 7850,1 --Vessel of Tainted Blood (1)
    .mob Vilebranch Shadow Hunter
step
    .goto 1425/0,-4585.70,-616.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Primal Torntusk|r
    .turnin 7862 >>Turn in Job Opening: Guard Captain of Revantusk Village
    .turnin 7850 >>Turn in Dark Vessels
    .target Primal Torntusk
step
    .goto 1425/0,-4622.66,-574.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Huntsman Markhor|r
    .turnin 7849 >>Turn in Separation Anxiety
    .target Huntsman Markhor
step
    .goto 1425/0,-3512.71,-832.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Horde Warbringer|r
    .turnin 98887 >>Turn in Conflict at Darkspear Islands
    .target Horde Warbringer
    .isQuestComplete 98887
step
    .goto 1425/0,-3512.71,-832.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Horde Warbringer|r
    .turnin 98888 >>Turn in Conflict at Darkspear Islands
    .target Horde Warbringer
    .isQuestComplete 98888
step
    .goto 1425/0,-2874.38,-463.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Atal'ai Exile|r
    .turnin 1446 >>Turn in Jammal'an the Prophet
    .target Atal'ai Exile
    .isQuestComplete 1446
step
    .goto 1425/0,-2127.09,232.87
    >>Message to the Wildhammer Delivered
    .complete 7843,1 --Message to the Wildhammer Delivered
    .isOnQuest 7843
step
    #completewith next
    .hs >>Hearth to Lard's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1425/0,-4631.13,-563.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Otho Moji'ko|r
    .turnin 7843 >>Turn in The Final Message to the Wildhammer
    .target Otho Moji'ko
    .isOnQuest 7843
step
    .xp 51 >>|cRXP_WARN_The rest of The Hinterlands is planned from level 51.|r Come back to this guide then
step
    #label RBSection5_1
    #completewith next
    +|cRXP_WARN_The Hinterlands: part 5|r (planned from level 51)
step
    .goto 1425/0,-4619.58,-560.74
    >>Click the |cRXP_PICK_Call to Arms!|r
    .accept 7861 >>Accept Wanted: Vile Priestess Hexx and Her Minions
step
    #completewith Along3
    >>As you go: Kill |cRXP_ENEMY_Vilebranch Aman'zasi Guards|r. |cRXP_WARN_Anything left is finished later|r
    .complete 7861,2 --Vilebranch Aman'zasi Guard slain (20)
    .mob Vilebranch Aman'zasi Guard
step
    #completewith Along1
    >>As you go: Kill |cRXP_ENEMY_Vile Priestess Hexx|r. |cRXP_WARN_Anything left is finished later|r
    .complete 7861,1 --Vile Priestess Hexx slain (1)
    .mob Vile Priestess Hexx
step
    #label Along1
    .goto 1425/0,-3873.07,-531.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elder Torntusk|r
    .accept 7846 >>Accept Recover the Key!
    .target Elder Torntusk
    .isQuestTurnedIn 7845 --any of: Kidnapped Elder Torntusk!
step
    .goto 1425/0,-3864.60,-542.01
    >>Kill |cRXP_ENEMY_Vile Priestess Hexx|r
    .complete 7861,1 --Vile Priestess Hexx slain (1)
    .mob Vile Priestess Hexx
step
    #label Along3
    .goto 1425/0,-3781.82,-757.09
    >>Kill |cRXP_ENEMY_Hitah'ya the Keeper|r and loot |cRXP_LOOT_Shackle Key|r
    .complete 7846,1 --Shackle Key (1)
    .mob Hitah'ya the Keeper
    .isOnQuest 7846
step
    #loop
    .goto 1425/0,-3782.98,-754.78,0
    .goto 1425/0,-3782.98,-754.78,40,0
    .goto 1425/0,-3780.67,-692.67,40,0
    .goto 1425/0,-3952.38,-625.94,40,0
    .goto 1425/0,-3871.53,-560.23,40,0
    .goto 1425/0,-3806.08,-500.43,40,0
    .goto 1425/0,-3794.91,-625.42,40,0
    .goto 1425/0,-3730.62,-638.77,40,0
    .goto 1425/0,-3672.48,-688.82,40,0
    .goto 1425/0,-3720.22,-708.84,40,0
    >>Kill |cRXP_ENEMY_Vilebranch Aman'zasi Guards|r
    .complete 7861,2 --Vilebranch Aman'zasi Guard slain (20)
    .mob Vilebranch Aman'zasi Guard
step
    .goto 1425/0,-3873.07,-531.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elder Torntusk|r
    .turnin 7846 >>Turn in Recover the Key!
    .target Elder Torntusk
    .isOnQuest 7846
step
    .goto 1425/0,-3873.07,-531.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elder Torntusk|r
    .accept 7847 >>Accept Return to Primal Torntusk
    .target Elder Torntusk
    .isQuestTurnedIn 7846 --any of: Recover the Key!
step
    .goto 1425/0,-4585.70,-616.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Primal Torntusk|r
    .turnin 7861 >>Turn in Wanted: Vile Priestess Hexx and Her Minions
    .target Primal Torntusk
step
    .goto 1425/0,-4585.70,-616.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Primal Torntusk|r
    .turnin 7847 >>Turn in Return to Primal Torntusk
    .target Primal Torntusk
    .isOnQuest 7847
step
    .goto 1425/0,-3512.71,-832.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Horde Warbringer|r
    .turnin 98888 >>Turn in Conflict at Darkspear Islands
    .target Horde Warbringer
    .isQuestComplete 98888
step
    .goto 1425/0,-3512.71,-832.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Horde Warbringer|r
    .turnin 98887 >>Turn in Conflict at Darkspear Islands
    .target Horde Warbringer
    .isQuestComplete 98887
step
    .goto 1425/0,-2874.38,-463.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Atal'ai Exile|r
    .turnin 1446 >>Turn in Jammal'an the Prophet
    .target Atal'ai Exile
    .isQuestComplete 1446
step
    +|cRXP_WARN_End of the The Hinterlands route.|r
]])
