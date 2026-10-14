-- 35-52 Swamp of Sorrows: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 5 parts with a level check between them (from level 35, 38, 41, 44, 51).
-- Edit zones/Swamp of Sorrows.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#name 35-52 Swamp of Sorrows

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
step << Warrior
    .goto 1435/0,-3009.44,-10632.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fallen Hero of the Horde|r
    .turnin 8417 >>Turn in A Troubled Spirit
    .target Fallen Hero of the Horde
    .isOnQuest 8417
step
    .goto 1435/0,-3238.82,-10422.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Infiltrator Marksen|r
    .turnin 1391 >>Turn in Nothing But The Truth
    .target Infiltrator Marksen
    .isOnQuest 1391
step
    .goto 1435/0,-3248.22,-10495.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dar|r
    .accept 93663 >>Accept Lost in Transit
    .target Dar
step
    .goto 1435/0,-3317.95,-10464.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Helgrum the Swift|r
    .accept 1418 >>Accept Neeka Bloodscar
    .target Helgrum the Swift
step
    .goto 1435/0,-3263.82,-10490.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rartar|r inside the inn
    .vendor >> |cRXP_BUY_Buy|r |T134833:0|t[Superior Healing Potions] |cRXP_BUY_from him if they're up|r
    .target Rartar
    .subzoneskip 75,1
step
    .goto 1435/0,-3273.00,-10429.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thultazor|r
    .vendor >> |cRXP_BUY_Buy|r |T134833:0|t[Superior Healing Potions] |cRXP_BUY_from him if they're up|r
    .target Thultazor
    .subzoneskip 75,1
step
    .goto 1435/0,-3280.34,-10457.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Breyk|r
    .fp Stonard >> Get the Stonard Flight Path
    .target Breyk
step
    .goto 1435/0,-3317.95,-10464.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Helgrum the Swift|r
    .turnin 1420 >>Turn in Report to Helgrum
    .target Helgrum the Swift
    .isOnQuest 1420
step << Hunter
    .goto 1435/0,-3307.17,-10437.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ogrom|r
    .train 13553 >>Train your class spells
    .target Ogrom
    .xp <42,1
    .xp >44,1
step << Hunter
    .goto 1435/0,-3307.17,-10437.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ogrom|r
    .train 14285 >>Train your class spells
    .target Ogrom
    .xp <44,1
step << Hunter
    .goto 1435/0,-3309.01,-10429.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grokor|r
    .train 24561 >>Train your pet spells
    .target Grokor
    .xp <42,1
step << Warlock
    .goto 1435/0,-3338.60,-10471.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kartosh|r
    .train 6789 >> Train your class spells
    .target Kartosh
    .xp <42,1
    .xp >44,1
step << Warlock
    .goto 1435/0,-3338.60,-10471.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kartosh|r
    .train 11671 >> Train your class spells
    .target Kartosh
    .xp <44,1
step << Warlock
    .goto 1435/0,-3337.45,-10466.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Greshka|r
    .vendor >>Buy any pet upgrades you can afford
    .target Greshka
    .subzoneskip 75,1
step << Shaman
    .goto 1435/0,-3328.27,-10506.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Greshka|r
    .train 11314 >>Train your class spells
    .target Haromm
    .xp <42,1
    .xp >44,1
step << Shaman
    .goto 1435/0,-3328.27,-10506.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Greshka|r
    .train 16315 >>Train your class spells
    .target Haromm
    .xp <44,1
step << Warrior
    .goto 1435/0,-3252.58,-10501.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Malosh|r
    .train 11550 >> Train your class spells
    .target Malosh
    .xp <42,1
    .xp >44,1
step << Warrior
    .goto 1435/0,-3252.58,-10501.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Malosh|r
    .train 11584 >> Train your class spells
    .target Malosh
    .xp <44,1
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
    .goto 1435/0,-3501.22,-10063.37,0
    .goto 1435/0,-3501.22,-10063.37,40,0
    .goto 1435/0,-3539.76,-10002.21,40,0
    .goto 1435/0,-3603.07,-9960.00,40,0
    .goto 1435/0,-3722.34,-9932.02,40,0
    .goto 1435/0,-3712.25,-9970.25,40,0
    .goto 1435/0,-3652.15,-9981.26,40,0
    >>Loot the |cRXP_PICK_Draenethyst Crystals|r for |cRXP_LOOT_Draenethyst Crystal|r
    .complete 1389,1 --Draenethyst Crystal (6)
step
    .goto 1435/0,-2818.83,-10100.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magtoor|r
    .turnin 1389 >>Turn in Draenethyst Crystals
    .target Magtoor
step
    .goto 1435/0,-2818.83,-10100.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magtoor|r
    .turnin 93663 >>Turn in Lost in Transit
    .target Magtoor
    .isQuestComplete 93663
step << Hunter
    .goto 1435/0,-3307.17,-10437.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ogrom|r
    .train 14304 >> Train your class spells
    .target Ogrom
    .xp <46,1
    .xp >48,1
step << Hunter
    .goto 1435/0,-3307.17,-10437.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ogrom|r
    .train 14321 >> Train your class spells
    .target Ogrom
    .xp <48,1
step << Hunter
    .goto 1435/0,-3309.01,-10429.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grokor|r
    .train 24562 >> Train your pet spells
    .target Grokor
    .xp <48,1
step << Warlock
    .goto 1435/0,-3338.60,-10471.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kartosh|r
    .train 11699 >> Train your class spells
    .target Kartosh
    .xp <46,1
    .xp >48,1
step << Warlock
    .goto 1435/0,-3338.60,-10471.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kartosh|r
    .train 11712 >> Train your class spells
    .target Kartosh
    .xp <48,1
step << Shaman
    .goto 1435/0,-3328.27,-10506.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Greshka|r
    .train 10586 >> Train your class spells
    .target Haromm
    .xp <46,1
    .xp >48,1
step << Shaman
    .goto 1435/0,-3328.27,-10506.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Greshka|r
    .train 10431 >> Train your class spells
    .target Haromm
    .xp <48,1
step << Warrior
    .goto 1435/0,-3252.58,-10501.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Malosh|r
    .train 11578 >> Train your class spells
    .target Malosh
    .xp <46,1
    .xp >48,1
step << Warrior
    .goto 1435/0,-3252.58,-10501.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Malosh|r
    .train 20661 >> Train your class spells
    .target Malosh
    .xp <48,1
step
    .hs >>Hearth to Camp Mojache
    .zoneskip Feralas
step
    .hs >> Hearth to Feralas
    .subzoneskip 1099
    .cooldown item,6948,>0,1
step
    .goto 1435/0,-3322.31,-10458.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fel'zerul|r
    .turnin 1444 >>Turn in Return to Fel'Zerul
    .target Fel'zerul
    .isOnQuest 1444
step << Hunter
    .goto 1435/0,-3307.17,-10437.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ogrom|r
    .train 13554 >> Train your class spells
    .target Ogrom
    .xp <50,1
    .xp >52,1
step << Hunter
    .goto 1435/0,-3307.17,-10437.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ogrom|r
    .train 13543 >> Train your class spells
    .target Ogrom
    .xp <52,1
step << Warlock
    .goto 1435/0,-3338.60,-10471.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kartosh|r
    .train 17925 >> Train your class spells
    .target Kartosh
    .xp <50,1
    .xp >52,1
step << Warlock
    .goto 1435/0,-3338.60,-10471.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kartosh|r
    .train 11675 >> Train your class spells
    .target Kartosh
    .xp <52,1
step << Warlock
    .goto 1435/0,-3337.45,-10466.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Greshka|r
    .vendor >>Buy any pet upgrades you can afford
    .target Greshka
step << Shaman
    .goto 1435/0,-3328.27,-10506.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Greshka|r
    .train 10437 >> Train your class spells
    .target Haromm
    .xp <50,1
    .xp >52,1
step << Shaman
    .goto 1435/0,-3328.27,-10506.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Greshka|r
    .train 10467 >> Train your class spells
    .target Haromm
    .xp <52,1
step << Warrior
    .goto 1435/0,-3252.58,-10501.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Malosh|r
    .train 1719 >> Train your class spells
    .target Malosh
    .xp <50,1
    .xp >52,1
step << Warrior
    .goto 1435/0,-3252.58,-10501.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Malosh|r
    .train 11551 >> Train your class spells
    .target Malosh
    .xp <52,1
step
    .goto 1435/0,-3263.82,-10490.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rartar|r inside the inn
    .vendor >> |cRXP_BUY_Buy|r |T134833:0|t[Superior Healing Potions] |cRXP_BUY_from him if they're up|r
    .target Rartar
step
    +|cRXP_WARN_That is all of Swamp of Sorrows for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Badlands|r: Neeka Bloodscar
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Lost in Transit
step
    .xp 38 >>|cRXP_WARN_The rest of Swamp of Sorrows is planned from level 38.|r Come back to this guide then
step
    .goto 1435/0,-3248.22,-10495.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dar|r
    .accept 698 >>Accept Lack of Surplus
    .target Dar
step
    #loop
    .goto 1435/0,-3448.01,-10343.98,0
    .goto 1435/0,-3448.01,-10343.98,40,0
    .goto 1435/0,-3420.02,-10255.44,40,0
    .goto 1435/0,-3472.32,-10177.30,40,0
    .goto 1435/0,-3527.83,-10217.36,40,0
    .goto 1435/0,-3519.80,-10149.31,40,0
    .goto 1435/0,-3589.53,-10156.96,40,0
    .goto 1435/0,-3675.78,-10109.40,40,0
    .goto 1435/0,-3546.18,-10325.63,40,0
    .goto 1435/0,-3519.57,-10420.28,40,0
    >>Kill |cRXP_ENEMY_Sawtooth Crocolisks|r and |cRXP_ENEMY_Sawtooth Snappers|r. Loot them for |cRXP_LOOT_Unprepared Sawtooth Flank|r
    .complete 698,1 --Unprepared Sawtooth Flank (8)
    .mob Sawtooth Crocolisk
    .mob Sawtooth Snapper
step
    .goto 1435/0,-4088.19,-10859.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tok'Kar|r
    .turnin 698 >>Turn in Lack of Surplus
    .target Tok'Kar
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
    .goto 1435/0,-2818.83,-10100.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magtoor|r
    .turnin 93663 >>Turn in Lost in Transit
    .target Magtoor
    .isQuestComplete 93663
step
    +|cRXP_WARN_That is all of Swamp of Sorrows for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Dustwallow Marsh|r: Cortello's Riddle
step
    .xp 41 >>|cRXP_WARN_The rest of Swamp of Sorrows is planned from level 41.|r Come back to this guide then
step
    .goto 1435/0,-3248.22,-10495.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dar|r
    .accept 1430 >>Accept Fresh Meat
    .target Dar
step
    .goto 1435/0,-3322.31,-10458.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fel'zerul|r
    .accept 1424 >>Accept Pool of Tears
    .target Fel'zerul
step
    .goto 1435/0,-4088.19,-10859.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tok'Kar|r
    .accept 699 >>Accept Lack of Surplus
    .target Tok'Kar
step
    #loop
    .goto 1435/0,-3971.90,-10591.85,0
    .goto 1435/0,-3971.90,-10591.85,40,0
    .goto 1435/0,-3912.49,-10611.43,40,0
    .goto 1435/0,-3842.53,-10630.24,40,0
    .goto 1435/0,-3748.03,-10518.76,40,0
    .goto 1435/0,-3863.87,-10526.25,40,0
    .goto 1435/0,-3886.57,-10432.97,40,0
    .goto 1435/0,-3942.54,-10400.71,40,0
    .goto 1435/0,-3937.27,-10492.76,40,0
    .goto 1435/0,-3922.13,-10549.34,40,0
    >>Pick up |cRXP_PICK_Atal'ai Artifact|r from the ground
    .complete 1424,1 --Atal'ai Artifact (10)
step
    .goto 1435/0,-3322.31,-10458.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fel'zerul|r
    .turnin 1424 >>Turn in Pool of Tears
    .accept 1429 >>Accept The Atal'ai Exile
    .target Fel'zerul
step
    #loop
    .goto 1435/0,-4011.58,-10055.27,0
    .goto 1435/0,-4011.58,-10055.27,40,0
    .goto 1435/0,-4051.95,-10088.15,40,0
    .goto 1435/0,-4086.82,-10121.18,40,0
    .goto 1435/0,-4134.99,-10175.61,40,0
    .goto 1435/0,-4225.82,-10210.94,40,0
    .goto 1435/0,-4208.16,-10142.13,40,0
    .goto 1435/0,-4151.27,-10130.05,40,0
    .goto 1435/0,-4118.93,-10093.04,40,0
    >>Kill |cRXP_ENEMY_Sawtooth Snappers|r. Loot them for |cRXP_LOOT_Sawtooth Snapper Claw|r
    .complete 699,1 --Sawtooth Snapper Claw (6)
    .mob Sawtooth Snapper
step
    .goto 1435/0,-4088.19,-10859.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tok'Kar|r
    .turnin 699 >>Turn in Lack of Surplus
    .accept 1422 >>Accept Threat From the Sea
    .target Tok'Kar
step
    .goto 1435/0,-4144.16,-10850.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Katar|r
    .turnin 1422 >>Turn in Threat From the Sea
    .accept 1426 >>Accept Threat From the Sea
    .target Katar
step
    #loop
    .goto 1435/0,-4180.17,-10888.82,0
    .goto 1435/0,-4180.17,-10888.82,40,0
    .goto 1435/0,-4142.56,-10974.76,40,0
    .goto 1435/0,-4259.77,-11000.14,40,0
    .goto 1435/0,-4190.95,-11107.18,40,0
    .goto 1435/0,-4310.23,-11094.95,40,0
    .goto 1435/0,-4452.44,-11110.24,40,0
    .goto 1435/0,-4397.39,-11003.20,40,0
    .goto 1435/0,-4333.17,-10917.57,40,0
    .goto 1435/0,-4290.04,-10775.66,40,0
    >>Kill |cRXP_ENEMY_Marsh Murlocs|r
    >>Kill |cRXP_ENEMY_Marsh Inkspewers|r
    >>Kill |cRXP_ENEMY_Monstrous Crawlers|r. Loot them for |cRXP_LOOT_Monstrous Crawler Leg|r
    .complete 1426,1 --Marsh Murloc slain (10)
    .complete 1426,2 --Marsh Inkspewer slain (10)
    .complete 1430,1 --Monstrous Crawler Leg (10)
    .mob Marsh Murloc
    .mob Marsh Inkspewer
    .mob Monstrous Crawler
step
    #loop
    .goto 1435/0,-3707.66,-10981.18,0
    .goto 1435/0,-3707.66,-10981.18,40,0
    .goto 1435/0,-3671.42,-11016.35,40,0
    .goto 1435/0,-3612.93,-10915.27,40,0
    .goto 1435/0,-3645.04,-10883.31,40,0
    .goto 1435/0,-3652.38,-10861.29,40,0
    .goto 1435/0,-3673.03,-10919.25,40,0
    .goto 1435/0,-3675.32,-10973.99,40,0
    >>Kill |cRXP_ENEMY_Marsh Flesheaters|r
    .complete 1426,3 --Marsh Flesheater slain (10)
    .mob Marsh Flesheater
step
    .goto 1435/0,-4144.16,-10850.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Katar|r
    .turnin 1426 >>Turn in Threat From the Sea
    .accept 1427 >>Accept Threat From the Sea
    .target Katar
step
    .goto 1435/0,-4088.19,-10859.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tok'Kar|r
    .turnin 1427 >>Turn in Threat From the Sea
    .target Tok'Kar
step
    .goto 1435/0,-3248.22,-10495.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dar|r
    .turnin 1430 >>Turn in Fresh Meat
    .target Dar
step
    .goto 1435/0,-2800.25,-10449.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Amaryllis Webb|r
    .turnin 93176 >>Turn in My Little Friends
    .target Amaryllis Webb
    .isOnQuest 93176
step
    .goto 1435/0,-2818.83,-10100.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magtoor|r
    .turnin 93663 >>Turn in Lost in Transit
    .target Magtoor
    .isQuestComplete 93663
step
    +|cRXP_WARN_That is all of Swamp of Sorrows for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_The Hinterlands|r: The Atal'ai Exile
step
    .xp 44 >>|cRXP_WARN_The rest of Swamp of Sorrows is planned from level 44.|r Come back to this guide then
step
    .goto 1435/0,-4144.16,-10850.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Katar|r
    .accept 1428 >>Accept Continued Threat
    .target Katar
step
    #loop
    .goto 1435/0,-3737.02,-10858.69,0
    .goto 1435/0,-3737.02,-10858.69,40,0
    .goto 1435/0,-3701.93,-10868.63,40,0
    .goto 1435/0,-3671.42,-10850.59,40,0
    .goto 1435/0,-3619.81,-10898.91,40,0
    .goto 1435/0,-3610.18,-10944.48,40,0
    .goto 1435/0,-3653.53,-10968.49,40,0
    .goto 1435/0,-3671.42,-11016.35,40,0
    .goto 1435/0,-3707.66,-10981.18,40,0
    .goto 1435/0,-3673.03,-10919.25,40,0
    >>Kill |cRXP_ENEMY_Marsh Inkspewers|r
    >>Kill |cRXP_ENEMY_Marsh Flesheaters|r
    >>Kill |cRXP_ENEMY_Marsh Oracles|r
    .complete 1428,1 --Marsh Inkspewer slain (10)
    .complete 1428,2 --Marsh Flesheater slain (10)
    .complete 1428,3 --Marsh Oracle slain (10)
    .mob Marsh Inkspewer
    .mob Marsh Flesheater
    .mob Marsh Oracle
step
    .goto 1435/0,-4144.16,-10850.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Katar|r
    .turnin 1428 >>Turn in Continued Threat
    .target Katar
step
    .goto 1435/0,-3273.00,-10429.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thultazor|r
    .vendor >> |cRXP_BUY_Buy|r |T134833:0|t[Superior Healing Potions] |cRXP_BUY_from him if they're up|r
    .target Thultazor
step
    .goto 1435/0,-3322.31,-10458.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fel'zerul|r
    .accept 1445 >>Accept The Temple of Atal'Hakkar
    .target Fel'zerul
    .isQuestTurnedIn 1444 --any of: Return to Fel'Zerul
    .xp <38,1
step
    .goto 1435/0,-4071.22,-10347.03
    >>Kill |cRXP_ENEMY_Enthralled Atal'ais|r. Loot them for |cRXP_LOOT_Fetish of Hakkar|r
    .complete 1445,1 --Fetish of Hakkar (20)
    .mob Enthralled Atal'ai
    .isOnQuest 1445
step
    .goto 1435/0,-3322.31,-10458.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fel'zerul|r
    .turnin 1445 >>Turn in The Temple of Atal'Hakkar
    .target Fel'zerul
    .isOnQuest 1445
step << !Mage
    .hs >>Hearth to Camp Taurajo
step
    .goto 1435/0,-2800.25,-10449.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Amaryllis Webb|r
    .turnin 93176 >>Turn in My Little Friends
    .target Amaryllis Webb
    .isOnQuest 93176
step
    .goto 1435/0,-2818.83,-10100.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magtoor|r
    .turnin 93663 >>Turn in Lost in Transit
    .target Magtoor
    .isQuestComplete 93663
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
    .accept 2621 >>Accept The Disgraced One
    .target Fallen Hero of the Horde
    .isQuestTurnedIn 2784 --any of: Fall From Grace
    .xp <45,1
step
    .goto 1435/0,-3009.44,-10632.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fallen Hero of the Horde|r
    .accept 2681 >>Accept The Stones That Bind Us
    .target Fallen Hero of the Horde
    .isQuestTurnedIn 2801 --any of: A Tale of Sorrow
    .xp <45,1
step
    .goto 1435/0,-3009.44,-10632.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fallen Hero of the Horde|r
    .accept 2702 >>Accept Heroes of Old
    .target Fallen Hero of the Horde
    .isQuestTurnedIn 2681 --any of: The Stones That Bind Us
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
    .goto 1435/0,-3319.10,-10460.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dispatch Commander Ruag|r
    .turnin 2621 >>Turn in The Disgraced One
    .target Dispatch Commander Ruag
    .isOnQuest 2621
step
    .goto 1435/0,-3319.10,-10460.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dispatch Commander Ruag|r
    .accept 2622 >>Accept The Missing Orders
    .target Dispatch Commander Ruag
    .isQuestTurnedIn 2621 --any of: The Disgraced One
    .xp <45,1
step
    .goto 1435/0,-3254.42,-10498.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bengor|r
    .turnin 2622 >>Turn in The Missing Orders
    .target Bengor
    .isOnQuest 2622
step
    .goto 1435/0,-3254.42,-10498.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bengor|r
    .accept 2623 >>Accept The Swamp Talker
    .target Bengor
    .isQuestTurnedIn 2622 --any of: The Missing Orders
    .xp <45,1
step
    #loop
    .goto 1435/0,-3654.22,-10859.46,0
    .goto 1435/0,-3654.22,-10859.46,40,0
    .goto 1435/0,-3608.34,-10911.45,40,0
    .goto 1435/0,-3649.63,-10963.44,40,0
    .goto 1435/0,-3690.92,-11015.43,40,0
    .goto 1435/0,-3700.09,-10954.27,40,0
    .goto 1435/0,-3828.54,-10792.17,40,0
    .goto 1435/0,-3736.79,-10804.41,40,0
    .goto 1435/0,-3695.50,-10834.99,40,0
    .goto 1435/0,-3700.09,-10880.87,40,0
    >>Kill |cRXP_ENEMY_Swamp Talker|r and loot |cRXP_LOOT_Warchief's Orders|r
    .complete 2623,1 --Warchief's Orders (1)
    .mob Swamp Talker
    .isOnQuest 2623
step
    .goto 1435/0,-3009.44,-10632.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fallen Hero of the Horde|r
    .turnin 2623 >>Turn in The Swamp Talker
    .target Fallen Hero of the Horde
    .isOnQuest 2623
step
    .goto 1435/0,-3009.44,-10632.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fallen Hero of the Horde|r
    .turnin 2681 >>Turn in The Stones That Bind Us
    .target Fallen Hero of the Horde
    .isQuestComplete 2681
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
step
    .goto 1435/0,-2800.25,-10449.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Amaryllis Webb|r
    .turnin 93176 >>Turn in My Little Friends
    .target Amaryllis Webb
    .isOnQuest 93176
step
    .goto 1435/0,-2818.83,-10100.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magtoor|r
    .turnin 93663 >>Turn in Lost in Transit
    .target Magtoor
    .isQuestComplete 93663
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
