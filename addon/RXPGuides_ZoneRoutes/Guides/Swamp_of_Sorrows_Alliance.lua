-- 34-52 Swamp of Sorrows: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 3 parts with a level check between them (from level 34, 39, 51).
-- Edit zones/Swamp of Sorrows.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#name 34-52 Swamp of Sorrows

step
    .goto 1435/0,-2800.25,-10449.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Amaryllis Webb|r
    .accept 93176 >>Accept My Little Friends
    .target Amaryllis Webb
step
    .goto 1435/0,-2800.25,-10449.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Amaryllis Webb|r
    >>|cRXP_WARN_The database has no objectives for My Little Friends. Skip this step if the quest is not finished|r
    .turnin 93176 >>Turn in My Little Friends
    .target Amaryllis Webb
    .isOnQuest 93176
step
    .goto 1435/0,-2836.27,-10535.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Watcher Biggs|r
    .accept 1396 >>Accept Encroaching Wildlife
    .target Watcher Biggs
step << Warrior
    .goto 1435/0,-3009.44,-10632.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fallen Hero of the Horde|r
    .turnin 8417 >>Turn in A Troubled Spirit
    .target Fallen Hero of the Horde
    .isOnQuest 8417
step
    .goto 1435/0,-3009.44,-10632.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fallen Hero of the Horde|r
    .turnin 2783 >>Turn in Petty Squabbles
    .target Fallen Hero of the Horde
    .isOnQuest 2783
step
    .goto 1435/0,-3482.19,-10142.28
    >>Kill |cRXP_ENEMY_Noboru the Cudgel|r and loot |cRXP_LOOT_Noboru's Cudgel|r. Use it to start the quest
    .collect 6196,1,1392 --Noboru's Cudgel (1)
    .accept 1392 >>Accept Noboru the Cudgel
    .use 6196
    .mob Noboru the Cudgel
step
    .goto 1435/0,-2818.83,-10100.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magtoor|r
    .turnin 1392 >>Turn in Noboru the Cudgel
    .accept 1389 >>Accept Draenethyst Crystals
    .target Magtoor
step
    #loop
    .goto 1435/0,-2808.51,-10170.57,0
    .goto 1435/0,-2808.51,-10170.57,40,0
    .goto 1435/0,-2895.44,-10177.45,40,0
    .goto 1435/0,-2921.13,-10216.29,40,0
    .goto 1435/0,-2973.43,-10215.68,40,0
    .goto 1435/0,-3042.24,-10184.48,40,0
    .goto 1435/0,-3108.53,-10160.17,40,0
    .goto 1435/0,-3004.86,-10125.61,40,0
    .goto 1435/0,-2936.04,-10137.54,40,0
    >>Kill |cRXP_ENEMY_Young Sawtooth Crocolisks|r
    .complete 1396,1 --Young Sawtooth Crocolisk slain (8)
    .mob Young Sawtooth Crocolisk
step
    #loop
    .goto 1435/0,-3082.38,-10111.39,0
    .goto 1435/0,-3082.38,-10111.39,40,0
    .goto 1435/0,-3061.28,-10092.73,40,0
    .goto 1435/0,-3074.82,-10058.33,40,0
    .goto 1435/0,-3214.73,-10064.90,40,0
    .goto 1435/0,-3159.68,-10076.22,40,0
    .goto 1435/0,-3128.95,-10091.97,40,0
    >>Kill |cRXP_ENEMY_Sorrow Spinners|r
    .complete 1396,2 --Sorrow Spinner slain (10)
    .mob Sorrow Spinner
step
    #loop
    .goto 1435/0,-3150.51,-10191.52,0
    .goto 1435/0,-3150.51,-10191.52,40,0
    .goto 1435/0,-3221.62,-10251.46,40,0
    .goto 1435/0,-3248.91,-10284.49,40,0
    .goto 1435/0,-3184.00,-10284.19,40,0
    .goto 1435/0,-3148.44,-10312.93,40,0
    .goto 1435/0,-3060.36,-10361.71,40,0
    .goto 1435/0,-3077.11,-10311.25,40,0
    .goto 1435/0,-3055.55,-10226.08,40,0
    .goto 1435/0,-3137.21,-10247.79,40,0
    >>Kill |cRXP_ENEMY_Swamp Jaguars|r
    .complete 1396,3 --Swamp Jaguar slain (10)
    .mob Swamp Jaguar
step
    .goto 1435/0,-2836.27,-10535.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Watcher Biggs|r
    .turnin 1396 >>Turn in Encroaching Wildlife
    .accept 1421 >>Accept The Lost Caravan
    .target Watcher Biggs
step
    #completewith Along11
    >>As you go: Loot the |cRXP_PICK_Draenethyst Crystals|r for |cRXP_LOOT_Draenethyst Crystal|r. |cRXP_WARN_Anything left is finished later|r
    .complete 1389,1 --Draenethyst Crystal (6)
step
    #label Along11
    .goto 1435/0,-3701.47,-9900.67
    >>Open the |cRXP_PICK_Caravan Chest|r. Loot it for |cRXP_LOOT_Wizards' Reagents|r
    .complete 1421,1 --Wizards' Reagents (1)
step
    #loop
    .goto 1435/0,-3722.34,-9932.02,0
    .goto 1435/0,-3722.34,-9932.02,40,0
    .goto 1435/0,-3708.35,-9967.95,40,0
    .goto 1435/0,-3501.22,-10063.37,40,0
    .goto 1435/0,-3539.76,-10002.21,40,0
    .goto 1435/0,-3603.07,-9960.00,40,0
    .goto 1435/0,-3646.88,-9964.13,40,0
    >>Loot the |cRXP_PICK_Draenethyst Crystals|r for |cRXP_LOOT_Draenethyst Crystal|r
    .complete 1389,1 --Draenethyst Crystal (6)
step
    .goto 1435/0,-2818.83,-10100.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magtoor|r
    .turnin 1389 >>Turn in Draenethyst Crystals
    .target Magtoor
step
    .goto 1435/0,-2731.21,-10388.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Father Tuttle|r
    .accept 93585 >>Accept This Light of Mine
    .target Father Tuttle
step
    .goto 1435/0,-2836.27,-10535.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Watcher Biggs|r
    .turnin 1421 >>Turn in The Lost Caravan
    .target Watcher Biggs
step
    .hs >> Hearth to Booty Bay
    >>|cRXP_BUY_Buy food/water if needed|r << !Warrior !Rogue
    >>|cRXP_BUY_Buy food if needed|r << Warrior/Rogue
    .zoneskip Swamp of Sorrows,1
step
    +|cRXP_WARN_That is all of Swamp of Sorrows for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_another zone|r: This Light of Mine
step
    .xp 39 >>|cRXP_WARN_The rest of Swamp of Sorrows is planned from level 39.|r Come back to this guide then
step
    .goto 1435/0,-2800.25,-10449.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Amaryllis Webb|r
    .turnin 93176 >>Turn in My Little Friends
    .target Amaryllis Webb
    .isOnQuest 93176
step
    .goto 1435/0,-2747.50,-10357.74
    >>Click the |cRXP_PICK_A Soggy Scroll|r
    .accept 625 >>Accept Cortello's Riddle
    .isQuestTurnedIn 624 --any of: Cortello's Riddle
    .xp <35,1
step
    .goto 1435/0,-2836.27,-10535.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Watcher Biggs|r
    .accept 1398 >>Accept Driftwood
    .target Watcher Biggs
step
    #loop
    .goto 1435/0,-4282.70,-10753.64,0
    .goto 1435/0,-4282.70,-10753.64,40,0
    .goto 1435/0,-4302.89,-10727.64,40,0
    .goto 1435/0,-4330.41,-10670.45,40,0
    .goto 1435/0,-4366.20,-10634.06,40,0
    .goto 1435/0,-4374.00,-10600.72,40,0
    .goto 1435/0,-4399.69,-10535.12,40,0
    .goto 1435/0,-4378.12,-10493.83,40,0
    >>Pick up |cRXP_PICK_Sundried Driftwood|r from the ground
    .complete 1398,1 --Sundried Driftwood (1)
step
    .goto 1435/0,-2836.27,-10535.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Watcher Biggs|r
    .turnin 1398 >>Turn in Driftwood
    .accept 1425 >>Accept Deliver the Shipment
    .target Watcher Biggs
step
    +|cRXP_WARN_That is all of Swamp of Sorrows for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Blasted Lands|r: Deliver the Shipment
    >>|cRXP_FRIENDLY_Dustwallow Marsh|r: Cortello's Riddle
step << Warrior
    .xp 51 >>|cRXP_WARN_The rest of Swamp of Sorrows is planned from level 51.|r Come back to this guide then
step << Warrior
    .goto 1435/0,-3009.44,-10632.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fallen Hero of the Horde|r
    .accept 8423 >>Accept Warrior Kinship
    .target Fallen Hero of the Horde
step << Warrior
    .goto 1435/0,-3009.44,-10632.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fallen Hero of the Horde|r
    .turnin 8423 >>Turn in Warrior Kinship
    .target Fallen Hero of the Horde
    .isQuestComplete 8423
step
    .goto 1435/0,-3009.44,-10632.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fallen Hero of the Horde|r
    .accept 2702 >>Accept Heroes of Old
    .target Fallen Hero of the Horde
    .isQuestTurnedIn 2681 --any of: The Stones That Bind Us
    .xp <45,1
step
    .goto 1435/0,-3009.44,-10632.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fallen Hero of the Horde|r
    .accept 2681 >>Accept The Stones That Bind Us
    .target Fallen Hero of the Horde
    .isQuestTurnedIn 2801 --any of: A Tale of Sorrow
    .xp <45,1
step
    .goto 1435/0,-2991.09,-10629.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corporal Thund Splithoof|r
    .turnin 2702 >>Turn in Heroes of Old
    .target Corporal Thund Splithoof
    .isOnQuest 2702
step
    .goto 1435/0,-2991.09,-10629.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corporal Thund Splithoof|r
    .accept 2701 >>Accept Heroes of Old
    .target Corporal Thund Splithoof
    .isQuestTurnedIn 2702 --any of: Heroes of Old
    .xp <45,1
step
    .goto 1435/0,-2985.82,-10633.45
    >>Click the |cRXP_PICK_Spectral Lockbox|r
    .turnin 2701 >>Turn in Heroes of Old
    .isOnQuest 2701
step
    .goto 1435/0,-3009.44,-10632.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fallen Hero of the Horde|r
    .turnin 2681 >>Turn in The Stones That Bind Us
    .target Fallen Hero of the Horde
    .isQuestComplete 2681
step
    .goto 1435/0,-2800.25,-10449.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Amaryllis Webb|r
    .turnin 93176 >>Turn in My Little Friends
    .target Amaryllis Webb
    .isOnQuest 93176
step
    .goto 1435/0,-2536.47,-10717.55
    >>Kill |cRXP_ENEMY_Itharius|r and loot |cRXP_LOOT_Oathstone of Ysera's Dragonflight|r. Use it to start the quest
    .collect 10589,1,3374 --Oathstone of Ysera's Dragonflight (1)
    .accept 3374 >>Accept The Essence of Eranikus
    .use 10589
    .mob Itharius
    .isQuestTurnedIn 3373 --any of: The Essence of Eranikus
    .xp <48,1
step
    .goto 1435/0,-2536.47,-10717.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Itharius|r
    .turnin 3374 >>Turn in The Essence of Eranikus
    .target Itharius
    .isOnQuest 3374
step
    .goto 1435/0,-2536.47,-10717.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Itharius|r
    .accept 3512 >>Accept In Eranikus' Own Words
    .target Itharius
    .isQuestTurnedIn 3374 --any of: The Essence of Eranikus
    .xp <48,1
step << Warrior
    .goto 1435/0,-3009.44,-10632.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fallen Hero of the Horde|r
    .accept 8424 >>Accept War on the Shadowsworn
    .target Fallen Hero of the Horde
    .isQuestTurnedIn 8423 --any of: Warrior Kinship
    .xp <50,1
step << Warrior
    .goto 1435/0,-3009.44,-10632.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fallen Hero of the Horde|r
    .accept 8425 >>Accept Voodoo Feathers
    .target Fallen Hero of the Horde
    .isQuestTurnedIn 8424 --any of: War on the Shadowsworn
    .xp <50,1
step << Warrior
    .goto 1435/0,-3009.44,-10632.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fallen Hero of the Horde|r
    .turnin 8424 >>Turn in War on the Shadowsworn
    .target Fallen Hero of the Horde
    .isQuestComplete 8424
step << Warrior
    .goto 1435/0,-3009.44,-10632.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fallen Hero of the Horde|r
    .turnin 8425 >>Turn in Voodoo Feathers
    .target Fallen Hero of the Horde
    .isQuestComplete 8425
step
    +|cRXP_WARN_End of the Swamp of Sorrows route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Winterspring|r: In Eranikus' Own Words
    >>|cRXP_FRIENDLY_Blasted Lands and back here|r: Warrior Kinship << Warrior
]])
