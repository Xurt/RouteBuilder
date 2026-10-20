-- 49-56 Burning Steppes: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 3 parts (from level 49, 52, 55).
-- Split into 3 guides, listed under "49 - 56 Burning Steppes" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Burning Steppes.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 49 - 56 Burning Steppes
#subweight -49
#name 49-50 Burning Steppes

step
    .goto 1428/0,-1114.95,-7595.99
    >>Click the |cRXP_PICK_Book|r
    .accept 81953 >>Accept Stonewrought Design
step
    .goto 1428/0,-1114.95,-7595.99
    >>Open the |cRXP_PICK_Book|r. Loot it for |cRXP_LOOT_Stonewrought Design|r
    .complete 81953,1 --Stonewrought Design (1)
step
    .goto 1428/0,-2177.65,-7499.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tinkee Steamboil|r
    .turnin 4810 >>Turn in Return to Tinkee
    .target Tinkee Steamboil
    .isOnQuest 4810
step
    .goto 1428/0,-2768.47,-8398.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jalinda Sprig|r
    .accept 4262 >>Accept Overmaster Pyron
    .target Jalinda Sprig
step
    .goto 1428/0,-2768.47,-8398.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jalinda Sprig|r
    .turnin 4262 >>Turn in Overmaster Pyron
    .target Jalinda Sprig
    .isQuestComplete 4262
step
    .goto 1428/0,-2748.84,-8378.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Maxwell|r
    .turnin 4223 >>Turn in The True Masters
    .target Marshal Maxwell
    .isOnQuest 4223
step
    +|cRXP_WARN_That is all of Burning Steppes for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Undercity|r: Stonewrought Design
    >>|cRXP_FRIENDLY_Synthetic AreaID: Eastern Kingdoms continent map and back here|r: Overmaster Pyron
step
    +|cRXP_WARN_The rest of Burning Steppes is planned from level 52.|r Load its guide for level 52 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 49 - 56 Burning Steppes
#subweight -49
#name 52-53 Burning Steppes: around Oralius

step
    .goto 1428/0,-2768.47,-8398.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jalinda Sprig|r
    .turnin 4262 >>Turn in Overmaster Pyron
    .target Jalinda Sprig
    .isQuestComplete 4262
step
    .goto 1428/0,-2743.57,-8371.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Oralius|r
    .accept 3823 >>Accept Extinguish the Firegut
    .target Oralius
step
    #loop
    .goto 1428/0,-2670.05,-7938.38,0
    .goto 1428/0,-2670.05,-7938.38,40,0
    .goto 1428/0,-2671.51,-7803.30,40,0
    .goto 1428/0,-2626.40,-7867.13,40,0
    .goto 1428/0,-2475.84,-7974.89,40,0
    >>Kill |cRXP_ENEMY_Firegut Ogre Mages|r
    >>Kill |cRXP_ENEMY_Firegut Ogres|r
    >>Kill |cRXP_ENEMY_Firegut Brutes|r
    .complete 3823,1 --Firegut Ogre Mage slain (8)
    .complete 3823,2 --Firegut Ogre slain (15)
    .complete 3823,3 --Firegut Brute slain (7)
    .mob Firegut Ogre Mage
    .mob Firegut Ogre
    .mob Firegut Brute
step
    .goto 1428/0,-2743.57,-8371.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Oralius|r
    .turnin 3823 >>Turn in Extinguish the Firegut
    .accept 3824 >>Accept Gor'tesh the Brute Lord
    .target Oralius
step
    .goto 1428/0,-2780.48,-8377.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Helendis Riverhorn|r
    .accept 4182 >>Accept Dragonkin Menace
    .target Helendis Riverhorn
step
    .goto 1428/0,-2177.65,-7499.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tinkee Steamboil|r
    .accept 4726 >>Accept Broodling Essence
    .target Tinkee Steamboil
step
    .goto 1428/0,-2175.02,-7497.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maxwort Uberglint|r
    .accept 4296 >>Accept Tablet of the Seven
    .target Maxwort Uberglint
step
    #completewith Along7
    >>As you go: Kill |cRXP_ENEMY_Black Dragonspawns|r. |cRXP_WARN_Anything left is finished later|r
    .complete 4182,2 --Black Dragonspawn slain (10)
    .mob Black Dragonspawn
step
    #label Along7
    #loop
    .goto 1428/0,-2752.65,-7653.18,0
    .goto 1428/0,-2752.65,-7653.18,40,0
    .goto 1428/0,-2812.70,-7627.61,40,0
    .goto 1428/0,-2918.44,-7913.98,40,0
    .goto 1428/0,-2919.61,-7956.34,40,0
    >>Pick up |cRXP_PICK_Broodling Essence|r from the ground
    >>Kill |cRXP_ENEMY_Black Broodlings|r
    .complete 4726,1 --Broodling Essence (8)
    .complete 4182,1 --Black Broodling slain (15)
    .mob Black Broodling
step
    #completewith Along8
    >>As you go: Kill |cRXP_ENEMY_Black Wyrmkins|r. |cRXP_WARN_Anything left is finished later|r
    .complete 4182,4 --Black Wyrmkin slain (4)
    .mob Black Wyrmkin
step
    #label Along8
    #loop
    .goto 1428/0,-2917.56,-8091.04,0
    .goto 1428/0,-2917.56,-8091.04,40,0
    .goto 1428/0,-3015.98,-8112.12,40,0
    >>Kill |cRXP_ENEMY_Black Dragonspawns|r
    .complete 4182,2 --Black Dragonspawn slain (10)
    .mob Black Dragonspawn
step
    #loop
    .goto 1428/0,-2901.16,-7887.43,0
    .goto 1428/0,-2901.16,-7887.43,40,0
    .goto 1428/0,-2871.57,-7766.01,40,0
    >>Kill |cRXP_ENEMY_Black Wyrmkins|r
    >>Kill |cRXP_ENEMY_Black Drake|r
    .complete 4182,4 --Black Wyrmkin slain (4)
    .complete 4182,3 --Black Drake slain (1)
    .mob Black Wyrmkin
    .mob Black Drake
step
    .goto 1428/0,-1851.93,-7826.92
    >>Open the |cRXP_PICK_Tablet of the Seven|r. Loot it for |cRXP_LOOT_Tablet Transcript|r
    .complete 4296,1 --Tablet Transcript (1)
step
    .goto 1428/0,-1418.71,-8110.75
    >>Kill |cRXP_ENEMY_Gor'teshes|r and |cRXP_ENEMY_Grubbubs|r. Loot them for |cRXP_LOOT_Gor'tesh's Lopped Off Head|r
    .complete 3824,1 --Gor'tesh's Lopped Off Head (1)
    .mob Gor'tesh
    .mob Grubbub
step
    .goto 1428/0,-2743.57,-8371.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Oralius|r
    .turnin 3824 >>Turn in Gor'tesh the Brute Lord
    .accept 3825 >>Accept Ogre Head On A Stick = Party
    .target Oralius
step
    .goto 1428/0,-2780.48,-8377.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Helendis Riverhorn|r
    .turnin 4182 >>Turn in Dragonkin Menace
    .accept 4183 >>Accept The True Masters
    .target Helendis Riverhorn
step
    .goto 1428/0,-2748.84,-8378.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Maxwell|r
    .accept 4224 >>Accept The True Masters
    .target Marshal Maxwell
    .isQuestTurnedIn 4223 --any of: The True Masters
    .xp <48,1
step
    .goto 1428/0,-2170.92,-7495.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ragged John|r
    .complete 4224,1 --Ragged John
    .target Ragged John
    .isOnQuest 4224
step
    .goto 1428/0,-2175.02,-7497.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maxwort Uberglint|r
    .turnin 4296 >>Turn in Tablet of the Seven while you are here
    .isQuestComplete 4296
    .target Maxwort Uberglint
step
    .goto 1428/0,-2177.65,-7499.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tinkee Steamboil|r
    .turnin 4726 >>Turn in Broodling Essence
    .accept 4808 >>Accept Felnok Steelspring
    .target Tinkee Steamboil
step
    .goto 1428/0,-2175.02,-7497.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maxwort Uberglint|r
    .turnin 4296 >>Turn in Tablet of the Seven
    .target Maxwort Uberglint
step
    .goto 1428/0,-2639.29,-7944.63
    >>Click the |cRXP_PICK_Soft Dirt Mound|r
    .complete 3825,1 --Gor'tesh Head Planted
step
    .goto 1428/0,-2743.57,-8371.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Oralius|r
    .turnin 3825 >>Turn in Ogre Head On A Stick = Party
    .target Oralius
step
    .goto 1428/0,-2748.84,-8378.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Maxwell|r
    .turnin 4224 >>Turn in The True Masters
    .target Marshal Maxwell
    .isOnQuest 4224
step
    +|cRXP_WARN_That is all of Burning Steppes for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Redridge Mountains|r: The True Masters
    >>|cRXP_FRIENDLY_Winterspring|r: Felnok Steelspring
step
    +|cRXP_WARN_The rest of Burning Steppes is planned from level 55.|r Load its guide for level 55 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 49 - 56 Burning Steppes
#subweight -49
#name 55-56 Burning Steppes

step
    .goto 1428/0,-2743.57,-8371.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Oralius|r
    .accept 4283 >>Accept FIFTY! YEP!
    .target Oralius
step
    .goto 1428/0,-2768.47,-8398.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jalinda Sprig|r
    .turnin 4262 >>Turn in Overmaster Pyron
    .target Jalinda Sprig
    .isQuestComplete 4262
step
    .goto 1428/0,-3052.01,-7647.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cyrus Therepentous|r
    .accept 4022 >>Accept A Taste of Flame
    .target Cyrus Therepentous
    .isQuestTurnedIn 3481 --any of: Trinkets...
    .xp <52,1
step
    .goto 1428/0,-3052.01,-7647.33
    >>Kill |cRXP_ENEMY_Cyrus Therepentous|r
    .complete 4022,2 --Cyrus Therepentous (1)
    .mob Cyrus Therepentous
    .isOnQuest 4022
step
    .goto 1428/0,-3031.80,-7652.01
    >>Kill |cRXP_ENEMY_Frenzied Black Drake|r and loot |cRXP_LOOT_Black Dragonflight Molt|r
    .complete 4022,1 --Black Dragonflight Molt (1)
    .mob Frenzied Black Drake
    .isOnQuest 4022
step
    .goto 1428/0,-3052.01,-7647.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cyrus Therepentous|r
    .turnin 4022 >>Turn in A Taste of Flame
    .target Cyrus Therepentous
    .isOnQuest 4022
step
    #loop
    .goto 1428/0,-1885.32,-8085.18,0
    .goto 1428/0,-1885.32,-8085.18,40,0
    .goto 1428/0,-1706.64,-8172.83,40,0
    >>Kill |cRXP_ENEMY_Blackrock Soldiers|r, |cRXP_ENEMY_Blackrock Sorcerers|r, |cRXP_ENEMY_Blackrock Slayers|r and |cRXP_ENEMY_Blackrock Warlocks|r. Loot them for |cRXP_LOOT_Blackrock Medallion|r
    .complete 4283,1 --Blackrock Medallion (50)
    .mob Blackrock Soldier
    .mob Blackrock Sorcerer
    .mob Blackrock Slayer
    .mob Blackrock Warlock
step
    .goto 1428/0,-2743.57,-8371.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Oralius|r
    .turnin 4283 >>Turn in FIFTY! YEP!
    .target Oralius
step
    +|cRXP_WARN_End of the Burning Steppes route.|r
]])
