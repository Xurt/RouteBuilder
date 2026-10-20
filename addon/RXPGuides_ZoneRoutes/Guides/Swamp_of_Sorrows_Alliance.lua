-- 34-52 Swamp of Sorrows: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 5 parts (from level 34, 37, 40, 43, 51).
-- Split into 5 guides, listed under "34 - 52 Swamp of Sorrows" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Swamp of Sorrows.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 34 - 52 Swamp of Sorrows
#subweight -34
#name 34-35 Swamp of Sorrows

step
    .goto 1435/0,-3633.57,-9964.90
    >>Click the |cRXP_PICK_Book|r
    .accept 79953 >>Accept A Ludite's Guide to Caring for Your Demonic Pet
step
    .goto 1435/0,-3633.57,-9964.90
    >>Open the |cRXP_PICK_Book|r. Loot it for |cRXP_LOOT_A Luddite's Guide to Caring for Your Demonic Pet|r
    .complete 79953,1 --A Luddite's Guide to Caring for Your Demonic Pet (1)
step
    .goto 1435/0,-2733.96,-10388.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Father Tuttle|r
    .accept 93585 >>Accept This Light of Mine
    .target Father Tuttle
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
    .goto 1435/0,-2936.04,-10137.54,40,0
    .goto 1435/0,-3108.53,-10160.17,40,0
    >>Kill |cRXP_ENEMY_Young Sawtooth Crocolisks|r
    .complete 1396,1 --Young Sawtooth Crocolisk slain (8)
    .mob Young Sawtooth Crocolisk
step
    #loop
    .goto 1435/0,-3061.28,-10092.73,0
    .goto 1435/0,-3061.28,-10092.73,40,0
    .goto 1435/0,-3214.73,-10064.90,40,0
    >>Kill |cRXP_ENEMY_Sorrow Spinners|r
    .complete 1396,2 --Sorrow Spinner slain (10)
    .mob Sorrow Spinner
step
    #loop
    .goto 1435/0,-3164.04,-10214.46,0
    .goto 1435/0,-3164.04,-10214.46,40,0
    .goto 1435/0,-3077.11,-10311.25,40,0
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
    #completewith Along12
    >>As you go: Loot the |cRXP_PICK_Draenethyst Crystals|r for |cRXP_LOOT_Draenethyst Crystal|r. |cRXP_WARN_Anything left is finished later|r
    .complete 1389,1 --Draenethyst Crystal (6)
step
    #label Along12
    .goto 1435/0,-3701.47,-9900.67
    >>Open the |cRXP_PICK_Caravan Chest|r. Loot it for |cRXP_LOOT_Wizards' Reagents|r
    .complete 1421,1 --Wizards' Reagents (1)
step
    #loop
    .goto 1435/0,-3646.88,-9964.13,0
    .goto 1435/0,-3646.88,-9964.13,40,0
    .goto 1435/0,-3539.76,-10002.21,40,0
    .goto 1435/0,-3501.22,-10063.37,40,0
    >>Loot the |cRXP_PICK_Draenethyst Crystals|r for |cRXP_LOOT_Draenethyst Crystal|r
    .complete 1389,1 --Draenethyst Crystal (6)
step
    .goto 1435/0,-2818.83,-10100.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magtoor|r
    .turnin 1389 >>Turn in Draenethyst Crystals
    .target Magtoor
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
    +|cRXP_WARN_That is all of Swamp of Sorrows for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Undercity|r: A Ludite's Guide to Caring for Your Demonic Pet
    >>|cRXP_FRIENDLY_another zone|r: This Light of Mine
step
    +|cRXP_WARN_The rest of Swamp of Sorrows is planned from level 37.|r Load its guide for level 37 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 34 - 52 Swamp of Sorrows
#subweight -34
#name 37-38 Swamp of Sorrows

step
    .goto 1435/0,-3724.63,-9898.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Galen Goodward|r
    .accept 1393 >>Accept Galen's Escape
    .target Galen Goodward
step
    .goto 1435/0,-3440.44,-10072.70
    >>Escort Galen out of the Fallow Sanctuary.
    .complete 1393,1 --Escort Galen out of the Fallow Sanctuary.
step
    .goto 1435/0,-3319.56,-10228.83
    >>Click the |cRXP_PICK_Galen's Strongbox|r
    .turnin 1393 >>Turn in Galen's Escape
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
    +|cRXP_WARN_That is all of Swamp of Sorrows for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Dustwallow Marsh|r: Cortello's Riddle
step
    +|cRXP_WARN_The rest of Swamp of Sorrows is planned from level 40.|r Load its guide for level 40 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 34 - 52 Swamp of Sorrows
#subweight -34
#name 40-41 Swamp of Sorrows

step
    .goto 1435/0,-2836.27,-10535.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Watcher Biggs|r
    .accept 1398 >>Accept Driftwood
    .target Watcher Biggs
    .isQuestTurnedIn 1421 --any of: The Lost Caravan
step
    .goto 1435/0,-2800.25,-10449.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Amaryllis Webb|r
    .turnin 93176 >>Turn in My Little Friends
    .target Amaryllis Webb
    .isOnQuest 93176
step
    #loop
    .goto 1435/0,-4302.89,-10727.64,0
    .goto 1435/0,-4302.89,-10727.64,40,0
    .goto 1435/0,-4366.20,-10634.06,40,0
    .goto 1435/0,-4399.69,-10535.12,40,0
    >>Pick up |cRXP_PICK_Sundried Driftwood|r from the ground
    .complete 1398,1 --Sundried Driftwood (1)
    .isOnQuest 1398
step
    .goto 1435/0,-2836.27,-10535.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Watcher Biggs|r
    .turnin 1398 >>Turn in Driftwood
    .target Watcher Biggs
    .isOnQuest 1398
step
    .goto 1435/0,-2836.27,-10535.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Watcher Biggs|r
    .accept 1425 >>Accept Deliver the Shipment
    .target Watcher Biggs
    .isQuestTurnedIn 1398 --any of: Driftwood
step
    +|cRXP_WARN_That is all of Swamp of Sorrows for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Blasted Lands|r: Deliver the Shipment
step
    +|cRXP_WARN_The rest of Swamp of Sorrows is planned from level 43.|r Load its guide for level 43 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 34 - 52 Swamp of Sorrows
#subweight -34
#name 43-44 Swamp of Sorrows

step
    .goto 1435/0,-3828.54,-10400.71
    >>Click the |cRXP_PICK_Book|r
    .accept 81947 >>Accept Sanguine Sorcery
step
    .goto 1435/0,-3828.54,-10400.71
    >>Open the |cRXP_PICK_Book|r. Loot it for |cRXP_LOOT_Sanguine Sorcery|r
    .complete 81947,1 --Sanguine Sorcery (1)
step
    .goto 1435/0,-2800.25,-10449.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Amaryllis Webb|r
    .turnin 93176 >>Turn in My Little Friends
    .target Amaryllis Webb
    .isOnQuest 93176
step
    +|cRXP_WARN_That is all of Swamp of Sorrows for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Undercity|r: Sanguine Sorcery
step << Warrior
    +|cRXP_WARN_The rest of Swamp of Sorrows is planned from level 51.|r Load its guide for level 51 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Warrior
#version 1
#group Zone Routes (Alliance)
#subgroup 34 - 52 Swamp of Sorrows
#subweight -34
#name 51-52 Swamp of Sorrows

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
