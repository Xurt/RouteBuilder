-- 1-30 Mulgore: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 5 parts with a level check between them (from level 1, 13, 16, 19, 22).
-- Sections (the guide starts at the one for your level): around Grull Hawkwind from 1; around Mull Thunderhorn from 5; around Boarton Shadetotem from 9; part 2 from 13; part 3 from 16; part 4 from 19; part 5 from 22.
-- Edit zones/Mulgore.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#name 1-30 Mulgore
#next Zone Routes (Horde)\19-30 Ashenvale

step
    .xp <5,1,RBSection1_1
    .xp 5 >>Finding the place in this guide for your level
step
    .xp <9,1,RBSection1_2
    .xp 9 >>Finding the place in this guide for your level
step
    .xp <13,1,RBSection1_3
    .xp 13 >>Finding the place in this guide for your level
step
    .xp <16,1,RBSection2_1
    .xp 16 >>Finding the place in this guide for your level
step
    .xp <19,1,RBSection3_1
    .xp 19 >>Finding the place in this guide for your level
step
    .xp <22,1,RBSection4_1
    .xp 22 >>Finding the place in this guide for your level
step
    .xp <61,1,RBSection5_1
step
    #label RBSection1_1
    #completewith next
    +|cRXP_WARN_Mulgore: around Grull Hawkwind|r (planned from level 1)
step
    .goto 1412/1,-257.59,-2912.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grull Hawkwind|r
    .accept 747 >>Accept The Hunt Begins
    .target Grull Hawkwind
step << Warrior/Shaman
    .goto 1412/1,-317.90,-2852.63,30,0--c:Mulgore,46.05,75.32
    +|cRXP_WARN_Kill |cRXP_ENEMY_Plainstriders|r. Loot them until you have 10 copper worth of vendor items (including your armor)|r
    .mob Plainstrider
    .money >0.01
step
    #completewith Along3
    >>As you go: Kill |cRXP_ENEMY_Plainstriders|r. Loot them for |cRXP_LOOT_Plainstrider Meat|r. Kill |cRXP_ENEMY_Plainstriders|r. Loot them for |cRXP_LOOT_Plainstrider Feather|r. |cRXP_WARN_Anything left is finished later|r
    .complete 747,1 --Plainstrider Meat (7)
    .complete 747,2 --Plainstrider Feather (7)
    .mob Plainstrider
step
    .goto 1412/1,-221.90,-2877.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Hawkwind|r
    .accept 752 >>Accept A Humble Task
    .target Chief Hawkwind
step << Warrior/Shaman
    .goto 1412/1,-279.37,-2893.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kawnie Softbreeze|r
    .vendor >> Vendor Trash
    .target Kawnie Softbreeze
    .money >0.01
step << Warrior
    .goto 1412/1,-213.61,-2880.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Harutt Thunderhorn|r
    .train 6673 >>Train |T132333:0|t[Battle Shout]
    .target Harutt Thunderhorn
step << Shaman
    .goto 1412/1,-264.47,-2874.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Meela Dawnstrider|r
    .train 8017 >>Train |T136086:0|t[Rockbiter Weapon]
    .target Meela Dawnstrider
step
    .goto 1412/1,-522.22,-3052.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Greatmother Hawkwind|r
    .turnin 752 >>Turn in A Humble Task
    .accept 753 >>Accept A Humble Task
    .target Greatmother Hawkwind
step
    #label Along3
    .goto 1412/1,-538.84,-3067.10
    >>Pick up |cRXP_PICK_Water Pitcher|r from the ground
    .complete 753,1 --Water Pitcher (1)
step
    #loop
    .goto 1412/1,-506.83,-2964.54,0
    .goto 1412/1,-506.83,-2964.54,40,0
    .goto 1412/1,-594.84,-2979.31,40,0
    .goto 1412/1,-635.46,-2836.15,40,0
    .goto 1412/1,-525.91,-2813.59,40,0
    .goto 1412/1,-445.29,-2884.96,40,0
    .goto 1412/1,-306.82,-2782.00,40,0
    .goto 1412/1,-154.82,-2893.99,40,0
    .goto 1412/1,-350.52,-2951.83,40,0
    .goto 1412/1,-433.60,-3026.49,40,0
    >>Kill |cRXP_ENEMY_Plainstriders|r. Loot them for |cRXP_LOOT_Plainstrider Meat|r
    >>Kill |cRXP_ENEMY_Plainstriders|r. Loot them for |cRXP_LOOT_Plainstrider Feather|r
    .complete 747,1 --Plainstrider Meat (7)
    .complete 747,2 --Plainstrider Feather (7)
    .mob Plainstrider
step
    .goto 1412/1,-257.59,-2912.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grull Hawkwind|r
    .turnin 747 >>Turn in The Hunt Begins
    .accept 3091 >>Accept Simple Note << Tauren Warrior
    .accept 3092 >>Accept Etched Note << Tauren Hunter
    .accept 3093 >>Accept Rune-Inscribed Note << Tauren Shaman
    .accept 3094 >>Accept Verdant Note << Tauren Druid
    .accept 750 >>Accept The Hunt Continues
    .target Grull Hawkwind
step
    .goto 1412/1,-279.37,-2893.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kawnie Softbreeze|r
    >>|cRXP_BUY_Buy|r |T132384:0|t[Light Shots] |cRXP_BUY_from her|r << Hunter
    .collect 2516,1000,750,1 << Hunter
    .vendor >> Vendor Trash
    .target Kawnie Softbreeze
step << Tauren Shaman
    .goto 1412/1,-264.36,-2873.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Meela Dawnstrider|r
    .turnin 3093 >>Turn in Rune-Inscribed Note while you are here
    .isQuestComplete 3093
    .target Meela Dawnstrider
step << Tauren Druid
    .goto 1412/1,-268.67,-2873.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gart Mistrunner|r
    .turnin 3094 >>Turn in Verdant Note while you are here
    .isQuestComplete 3094
    .target Gart Mistrunner
step << Tauren Warrior
    .goto 1412/1,-213.28,-2880.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Harutt Thunderhorn|r
    .turnin 3091 >>Turn in Simple Note while you are here
    .isQuestComplete 3091
    .target Harutt Thunderhorn
step << Tauren Hunter
    .goto 1412/1,-226.20,-2865.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lanka Farshot|r
    .turnin 3092 >>Turn in Etched Note while you are here
    .isQuestComplete 3092
    .target Lanka Farshot
step
    .goto 1412/1,-221.90,-2877.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Hawkwind|r
    .turnin 753 >>Turn in A Humble Task
    .accept 755 >>Accept Rites of the Earthmother
    .target Chief Hawkwind
step
    .goto 1412/1,-239.74,-2893.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brave Windfeather|r
    .accept 3376 >>Accept Break Sharptusk!
    .target Brave Windfeather
    .xp <3,1
step
    #loop
    .goto 1412/1,-252.67,-3295.99,0
    .goto 1412/1,-252.67,-3295.99,40,0
    .goto 1412/1,-181.89,-3351.37,40,0
    .goto 1412/1,-197.90,-3428.08,40,0
    .goto 1412/1,-223.13,-3507.66,40,0
    .goto 1412/1,-263.75,-3497.40,40,0
    .goto 1412/1,-255.13,-3452.28,40,0
    .goto 1412/1,-253.90,-3407.16,40,0
    .goto 1412/1,-356.06,-3426.03,40,0
    .goto 1412/1,-316.67,-3350.14,40,0
    >>Kill |cRXP_ENEMY_Mountain Cougars|r. Loot them for |cRXP_LOOT_Mountain Cougar Pelt|r
    .complete 750,1 --Mountain Cougar Pelt (10)
    .mob Mountain Cougar
step
    .goto 1412/1,-138.82,-3430.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Seer Graytongue|r
    .turnin 755 >>Turn in Rites of the Earthmother
    .accept 757 >>Accept Rite of Strength
    .accept 95805 >>Accept Grace of An'she and Mu'sha
    .target Seer Graytongue
step
    .goto 1412/1,-1004.09,-3376.39
    >>Click the |cRXP_PICK_Ritual Fire|r
    .turnin 95805 >>Turn in Grace of An'she and Mu'sha
step
    .goto 1412/1,-292.73,-3285.20,40,0
    .goto 1412/1,-362.60,-3281.44,40,0
    .goto 1412/1,-452.50,-3246.84,40,0
    .goto 1412/1,-554.23,-3213.96,40,0
    .goto 1412/1,-572.72,-3139.98,40,0
    .goto 1412/1,-626.67,-3065.32,40,0
    .goto 1412/1,-616.90,-2998.53,40,0
    .goto 1412/1,-606.63,-2923.52,40,0
    .goto 1412/1,-621.01,-2847.15,40,0
    .goto 1412/1,-537.27,-2887.22,40,0
    .goto 1412/1,-461.75,-2869.75,40,0
    .goto 1412/1,-387.77,-2851.94,40,0
    .goto 1412/1,-356.43,-2951.61,40,0
    .goto 1412/1,-307.11,-3026.96,40,0
    .goto 1412/1,-265.50,-3086.55,40,0
    .goto 1412/1,-217.21,-3146.15,40,0
    .goto 1412/1,-207.45,-3221.16,40,0
    .xp 3+1150 >> Grind to 1150+/1400xp
step
    .goto 1412/1,-257.59,-2912.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grull Hawkwind|r
    .turnin 750 >>Turn in The Hunt Continues
    .accept 780 >>Accept The Battleboars
    .target Grull Hawkwind
step
    .goto 1412/1,-279.37,-2893.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kawnie Softbreeze|r
    .vendor >> Vendor Trash
    .target Kawnie Softbreeze
step
    .goto 1412/1,-239.74,-2893.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brave Windfeather|r
    .accept 3376 >>Accept Break Sharptusk!
    .target Brave Windfeather
step << Shaman
    .goto 1412/1,-250.21,-2882.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Seer Ravenfeather|r
    .accept 1519 >>Accept Call of Earth
    .target Seer Ravenfeather
step << Tauren Warrior
    .goto 1412/1,-213.28,-2880.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Harutt Thunderhorn|r
    .turnin 3091 >>Turn in Simple Note
    .target Harutt Thunderhorn
step << Warrior
    .goto 1412/1,-213.61,-2880.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Harutt Thunderhorn|r
    .train 100 >> Train |T132337:0|t[Charge]
    .train 772 >> Train |T132155:0|t[Rend]
    .target Harutt Thunderhorn
    .money <0.02
step << Warrior
    .goto 1412/1,-213.61,-2880.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Harutt Thunderhorn|r
    .train 772 >> Train |T132155:0|t[Rend]
    .target Harutt Thunderhorn
step << Tauren Hunter
    .goto 1412/1,-226.20,-2865.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lanka Farshot|r
    .turnin 3092 >>Turn in Etched Note
    .target Lanka Farshot
step << Hunter
    .goto 1412/1,-225.94,-2865.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lanka Farshot|r
    .train 1978 >> Train |T132204:0|t[Serpent Sting]
    .target Lanka Farshot
step << Tauren Shaman
    .goto 1412/1,-264.36,-2873.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Meela Dawnstrider|r
    .turnin 3093 >>Turn in Rune-Inscribed Note
    .target Meela Dawnstrider
step << Shaman
    .goto 1412/1,-264.47,-2874.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Meela Dawnstrider|r
    .train 8042 >>Train |T136026:0|t[Earth Shock]
    .target Meela Dawnstrider
step << Tauren Druid
    .goto 1412/1,-268.67,-2873.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gart Mistrunner|r
    .turnin 3094 >>Turn in Verdant Note
    .target Gart Mistrunner
step << Druid
    .goto 1412/1,-268.58,-2873.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gart Mistrunner|r
    .train 8921 >> Train |T136096:0|t[Moonfire]
    .target Gart Mistrunner
step
    #loop
    .goto 1412/1,-717.31,-3080.63,0
    .goto 1412/1,-717.31,-3080.63,40,0
    .goto 1412/1,-777.00,-3076.12,40,0
    .goto 1412/1,-813.31,-3018.69,40,0
    .goto 1412/1,-857.01,-3080.22,40,0
    .goto 1412/1,-852.08,-3152.01,40,0
    .goto 1412/1,-879.16,-3181.13,40,0
    .goto 1412/1,-852.70,-3214.77,40,0
    .goto 1412/1,-780.08,-3244.31,40,0
    .goto 1412/1,-754.85,-3150.78,40,0
    >>Kill |cRXP_ENEMY_Bristleback Battleboars|r and |cRXP_ENEMY_Battleboars|r. Loot them for |cRXP_LOOT_Battleboar Flank|r
    >>Kill |cRXP_ENEMY_Bristleback Battleboars|r and |cRXP_ENEMY_Battleboars|r. Loot them for |cRXP_LOOT_Battleboar Snout|r
    .complete 780,2 --Battleboar Flank (8)
    .complete 780,1 --Battleboar Snout (8)
    .mob Bristleback Battleboar
    .mob Battleboar
step
    #loop
    .goto 1412/1,-1154.25,-3001.46,0
    .goto 1412/1,-1154.25,-3001.46,40,0
    .goto 1412/1,-1202.87,-3110.58,40,0
    .goto 1412/1,-1233.64,-3049.87,40,0
    .goto 1412/1,-1277.95,-2994.49,40,0
    .goto 1412/1,-1340.11,-2913.27,40,0
    .goto 1412/1,-1296.41,-2942.80,40,0
    .goto 1412/1,-1239.80,-2955.11,40,0
    .goto 1412/1,-1221.95,-2884.55,40,0
    .goto 1412/1,-1124.10,-2869.79,40,0
    >>Kill |cRXP_ENEMY_Chief Sharptusk Thornmantle|r and loot |cRXP_LOOT_Chief Sharptusk Thornmantle's Head|r
    >>Kill |cRXP_ENEMY_Bristleback Quilboars|r and |cRXP_ENEMY_Bristleback Shamans|r. Loot them for |cRXP_LOOT_Bristleback Belt|r
    >>Kill |cRXP_ENEMY_Bristleback Shamans|r. Loot them for |cRXP_LOOT_Ritual Salve|r << Shaman
    .complete 3376,1 --Chief Sharptusk Thornmantle's Head (1)
    .complete 757,1 --Bristleback Belt (12)
    .complete 1519,1 << Shaman --Ritual Salve (2)
    .mob Chief Sharptusk Thornmantle
    .mob Bristleback Quilboar
    .mob Bristleback Shaman
step
    .goto 1412/1,-1239.06,-3015.66,40,0
    .goto 1412/1,-1256.01,-2954.35,40,0
    .goto 1412/1,-1223.13,-2882.08,40,0
    .goto 1412/1,-1171.75,-2879.34,40,0
    .goto 1412/1,-1103.43,-2914.62,40,0
    .goto 1412/1,-1122.95,-2977.98,40,0
    .goto 1412/1,-1152.23,-3065.32,40,0
    .goto 1412/1,-1076.71,-3040.66,40,0
    .goto 1412/1,-1038.69,-3079.02,40,0
    .goto 1412/1,-1087.50,-3092.38,40,0
    .goto 1412/1,-1151.20,-3082.44,40,0
    .xp 5+880 >> Grind to 880+/2800xp << !Shaman
    .xp 5 >> Grind to level 5 << Shaman
step
    .hs >> Hearth to Camp Narache
step
    .goto 1412/1,-257.59,-2912.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grull Hawkwind|r
    .turnin 780 >>Turn in The Battleboars
    .target Grull Hawkwind
step
    .goto 1412/1,-239.74,-2893.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brave Windfeather|r
    .turnin 3376 >>Turn in Break Sharptusk!
    .target Brave Windfeather
step << Shaman
    .goto 1412/1,-250.21,-2882.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Seer Ravenfeather|r
    .turnin 1519 >>Turn in Call of Earth
    .accept 1520 >>Accept Call of Earth
    .target Seer Ravenfeather
step
    .goto 1412/1,-221.90,-2877.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Hawkwind|r
    .turnin 757 >>Turn in Rite of Strength
    .accept 763 >>Accept Rites of the Earthmother
    .accept 96659 >>Accept The Adventurer
    .target Chief Hawkwind
step << Shaman
    .goto 1412/1,-720.38,-3031.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Minor Manifestation of Earth|r
    .turnin 1517 >>Turn in Call of Earth
    .target Minor Manifestation of Earth
    .isOnQuest 1517
step << Shaman
    .goto 1412/1,-720.38,-3031.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Minor Manifestation of Earth|r
    .accept 1518 >>Accept Call of Earth
    .target Minor Manifestation of Earth
    .isQuestTurnedIn 1517 --any of: Call of Earth
    .xp <4,1
step << Shaman
    .goto 1412/1,-720.38,-3031.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Minor Manifestation of Earth|r
    .turnin 1520 >>Turn in Call of Earth
    .accept 1521 >>Accept Call of Earth
    .target Minor Manifestation of Earth
step << Shaman
    .goto 1412/1,-250.21,-2882.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Seer Ravenfeather|r
    .turnin 1521 >>Turn in Call of Earth
    .target Seer Ravenfeather
step << Shaman
    .goto 1412/1,-264.47,-2874.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Meela Dawnstrider|r
    .train 332 >>Train |T136052:0|t[Healing Wave]
    .target Meela Dawnstrider
step << Hunter
    .goto 1412/1,-225.94,-2865.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lanka Farshot|r
    .train 1130 >>Train |T132212:0|t[Hunter's Mark]
    .train 3044 >>Train |T132218:0|t[Arcane Shot]
    .target Lanka Farshot
    .money <0.02
step << Hunter
    .goto 1412/1,-225.94,-2865.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lanka Farshot|r
    .train 3044 >>Train |T132218:0|t[Arcane Shot]
    .target Lanka Farshot
step << Druid
    .goto 1412/1,-268.58,-2873.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gart Mistrunner|r
    .train 467 >>Train |T136104:0|t[Thorns]
    .train 5177 >>Train |T136006:0|t[Wrath]
    .target Gart Mistrunner
    .money <0.02
step << Druid
    .goto 1412/1,-268.58,-2873.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gart Mistrunner|r
    .train 5177 >>Train |T136006:0|t[Wrath]
    .target Gart Mistrunner
step << Warrior
    .goto 1412/1,-213.61,-2880.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Harutt Thunderhorn|r
    .train 3127 >>Train |T132269:0|t[Parry]
    .train 6343 >>Train |T136105:0|t[Thunder Clap]
    .target Harutt Thunderhorn
    .money <0.02
step << Warrior
    .goto 1412/1,-213.61,-2880.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Harutt Thunderhorn|r
    .train 3127 >>Train |T132269:0|t[Parry]
    .target Harutt Thunderhorn
step
    .goto 1412/1,69.20,-3065.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Antur Fallow|r
    .accept 1656 >>Accept A Task Unfinished
    .target Antur Fallow
step
    .goto 1412/1,-364.06,-2491.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kaga Wildhoof|r
    .turnin 96659 >>Turn in The Adventurer
    .accept 96605 >>Accept The Great Outdoors
    .target Kaga Wildhoof
step
    .goto 1412/1,-364.67,-2494.45
    >>Click the |cRXP_PICK_Basic Campfire|r
    .complete 96605,1 --Basic Campfire
    .complete 96605,2 --Basic Campfire
step
    .goto 1412/1,-364.06,-2491.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kaga Wildhoof|r
    .turnin 96605 >>Turn in The Great Outdoors
    .accept 96661 >>Accept Camping 101: Cooking
    .target Kaga Wildhoof
step
    #label RBSection1_2
    #completewith next
    +|cRXP_WARN_Mulgore: around Mull Thunderhorn|r (planned from level 5)
step
    .goto 1412/1,-384.98,-2397.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ruul Eagletalon|r
    .accept 743 >>Accept Dangers of the Windfury
    .target Ruul Eagletalon
step << Shaman/Druid
    .goto 1412/1,-297.87,-2279.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mahnott|r
    .vendor >> Vendor trash. Sell your weapon if it gives you enough money for a |T135145:0|t[Walking Stick] (5s 04c). You'll come back later if you don't have enough yet
    .target Mahnott Roughwound
step << Warrior
    .goto 1412/1,-297.87,-2279.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mahnott|r
    .vendor >> Vendor trash. Sell your weapon if it gives you enough money for a |T133053:0|t[Wooden Mallet] (7s 1c). You'll come back later if you don't have enough yet
    .target Mahnott Roughwound
step << Hunter
    .goto 1412/1,-289.65,-2275.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kennah|r
    .vendor >> Vendor trash. Sell your weapon if it gives you enough money for a |T135611:0|t[Ornate Blunderbuss] (4s 14c). You'll come back later if you don't have enough yet
    .target Kennah Hawkseye
step
    .goto 1412/1,-347.44,-2365.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Kauth|r
    .turnin 1656 >>Turn in A Task Unfinished
    .target Innkeeper Kauth
    .isOnQuest 1656
step
    .goto 1412/1,-347.44,-2365.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Kauth|r
    .target Innkeeper Kauth
    .home >>Set your Hearthstone to Innkeeper Kauth's inn
step
    .goto 1412/1,-392.98,-2333.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baine Bloodhoof|r
    .turnin 763 >>Turn in Rites of the Earthmother
    .target Baine Bloodhoof
    .isOnQuest 763
step << Tauren Hunter
    .goto 1412/1,-408.98,-2180.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yaw Sharpmane|r
    .turnin 6067 >>Turn in The Hunter's Path
    .target Yaw Sharpmane
    .isOnQuest 6067
step << Tauren Hunter
    .goto 1412/1,-408.98,-2180.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yaw Sharpmane|r
    .turnin 6066 >>Turn in The Hunter's Path
    .target Yaw Sharpmane
    .isOnQuest 6066
step << Tauren Hunter
    #completewith next
    .zone 1456 >>Travel to Thunder Bluff
    .zoneskip 1456
step << Tauren Hunter
    .xp 10 >>Grind to level 10 (The Hunter's Path needs it)
step << Tauren Hunter
    .goto 1456/1,-93.82,-1464.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kary Thunderhorn|r
    .accept 6065 >>Accept The Hunter's Path
    .target Kary Thunderhorn
step << Tauren Hunter
    #completewith next
    .zone 1412 >>Leave Thunder Bluff for Mulgore
    .zoneskip 1412
step
    .goto 1412/1,-392.98,-2333.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baine Bloodhoof|r
    .accept 745 >>Accept Sharing the Land
    .accept 767 >>Accept Rite of Vision
    .accept 746 >>Accept Dwarven Digging
    .target Baine Bloodhoof
step
    .goto 1412/1,-405.91,-2243.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zarlman Two-Moons|r
    .turnin 767 >>Turn in Rite of Vision
    .accept 771 >>Accept Rite of Vision
    .target Zarlman Two-Moons
step
    .goto 1412/1,-365.90,-2227.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maur Raincaller|r
    .accept 766 >>Accept Mazzranache
    .target Maur Raincaller
step
    .goto 1412/1,-408.98,-2180.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yaw Sharpmane|r
    .turnin 6065 >>Turn in The Hunter's Path << Tauren Hunter
    .accept 96130 >>Accept Chakuyak
    .target Yaw Sharpmane
step
    .goto 1412/1,-430.52,-2097.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ahab Wheathoof|r
    .accept 99411 >>Accept Kyle's Gone Missing!
    .target Ahab Wheathoof
step
    .goto 1412/1,-454.52,-2304.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Harken Windtotem|r
    .accept 761 >>Accept Swoop Hunting
    .target Harken Windtotem
step
    .goto 1412/1,-496.37,-2348.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krang Stonehoof|r
    .accept 99108 >>Accept Sparring Match
    .target Krang Stonehoof
step << Tauren
    .goto 1412/1,-445.29,-2341.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mull Thunderhorn|r
    .accept 748 >>Accept Poison Water
    .target Mull Thunderhorn
step
    #loop
    .goto 1412/1,-434.83,-2382.87,0
    .goto 1412/1,-434.83,-2382.87,40,0
    .goto 1412/1,-388.06,-2375.49,40,0
    .goto 1412/1,-390.52,-2362.36,40,0
    .goto 1412/1,-328.36,-2331.59,40,0
    .goto 1412/1,-377.60,-2304.93,40,0
    .goto 1412/1,-455.14,-2259.81,40,0
    .goto 1412/1,-446.52,-2250.37,40,0
    .goto 1412/1,-385.60,-2237.24,40,0
    .goto 1412/1,-391.14,-2196.22,40,0
    .goto 1412/1,-391.75,-2179.00,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brave Wildrunner|r. |cRXP_WARN_This NPC walks a patrol route|r
    .accept 99079 >>Accept Longwalker Malah
    .unitscan Brave Wildrunner
step
    .goto 1412/1,-836.08,-2075.21
    >>Pick up |cRXP_PICK_Ambercorn|r from the ground
    .complete 771,2 --Ambercorn (2)
step << Tauren
    #loop
    .goto 1412/1,-978.86,-2485.42,0
    .goto 1412/1,-978.86,-2485.42,40,0
    .goto 1412/1,-1052.09,-2386.56,40,0
    .goto 1412/1,-1079.79,-2285.65,40,0
    .goto 1412/1,-1180.10,-2386.97,40,0
    .goto 1412/1,-1273.03,-2361.95,40,0
    .goto 1412/1,-1154.25,-2520.29,40,0
    .goto 1412/1,-1215.18,-2643.35,40,0
    .goto 1412/1,-1121.02,-2613.00,40,0
    .goto 1412/1,-989.32,-2708.16,40,0
    >>Kill |cRXP_ENEMY_Prairie Wolfs|r, |cRXP_ENEMY_Prairie Stalkers|r, |cRXP_ENEMY_Prairie Wolf Alphas|r and |cRXP_ENEMY_Chakuyaks|r. Loot them for |cRXP_LOOT_Prairie Wolf Paw|r
    .complete 748,1 --Prairie Wolf Paw (6)
    .mob Prairie Wolf
    .mob Prairie Stalker
    .mob Prairie Wolf Alpha
    .mob Chakuyak
step << Tauren
    #loop
    .goto 1412/1,-635.46,-2836.15,0
    .goto 1412/1,-635.46,-2836.15,40,0
    .goto 1412/1,-624.38,-2918.19,40,0
    .goto 1412/1,-618.23,-3006.80,40,0
    .goto 1412/1,-552.99,-2983.41,40,0
    .goto 1412/1,-500.68,-3072.43,40,0
    .goto 1412/1,-392.98,-2983.41,40,0
    .goto 1412/1,-500.07,-2939.11,40,0
    .goto 1412/1,-445.29,-2884.96,40,0
    .goto 1412/1,-525.91,-2813.59,40,0
    >>Kill |cRXP_ENEMY_Plainstriders|r, |cRXP_ENEMY_Adult Plainstriders|r, |cRXP_ENEMY_Elder Plainstriders|r and |cRXP_ENEMY_Mazzranaches|r. Loot them for |cRXP_LOOT_Plainstrider Talon|r
    .complete 748,2 --Plainstrider Talon (4)
    .mob Plainstrider
    .mob Adult Plainstrider
    .mob Elder Plainstrider
    .mob Mazzranache
step << Tauren
    #completewith next
    .hs >>Hearth to Innkeeper Kauth's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step << Tauren
    .goto 1412/1,-445.29,-2341.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mull Thunderhorn|r
    .turnin 748 >>Turn in Poison Water
    .accept 754 >>Accept Winterhoof Cleansing
    .target Mull Thunderhorn
step << Tauren
    .goto 1412/1,-706.23,-2540.39
    >>Cleanse the Winterhoof Water Well
    .complete 754,1 --Cleanse the Winterhoof Water Well
step
    #loop
    .goto 1412/1,-711.15,-2519.88,0
    .goto 1412/1,-711.15,-2519.88,40,0
    .goto 1412/1,-725.92,-2531.36,40,0
    .goto 1412/1,-729.62,-2548.18,40,0
    .goto 1412/1,-711.15,-2572.38,40,0
    >>Pick up |cRXP_PICK_Well Stone|r from the ground
    .complete 771,1 --Well Stone (2)
step
    .goto 1412/1,-399.07,-2378.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jhawna|r
    >>|cRXP_BUY_Buy|r |T132815:0|t[Ice Cold Milk] |cRXP_BUY_from her|r << Shaman/Druid
    >>|cRXP_BUY_Buy|r |T133968:0|t[Freshly Baked Bread] |cRXP_BUY_from her|r << Warrior
    .vendor >> Vendor trash
    .collect 1179,10,746,1 << Shaman/Druid
    .collect 4541,10,746,1 << Warrior
    .target Jhawna Oatwind
    .money <0.025
step << Tauren
    .goto 1412/1,-445.29,-2341.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mull Thunderhorn|r
    .turnin 754 >>Turn in Winterhoof Cleansing while you are here
    .isQuestComplete 754
    .target Mull Thunderhorn
step
    .goto 1412/1,-285.28,-2263.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pyall Silentstride|r
    .complete 96661,1 --Pyall Silentstride
    .target Pyall Silentstride
    .isOnQuest 96661
step
    .goto 1412/1,-285.28,-2263.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pyall Silentstride|r
    .turnin 96661 >>Turn in Camping 101: Cooking while you are here
    .isQuestComplete 96661
    .target Pyall Silentstride
step << Tauren
    .goto 1412/1,-445.29,-2341.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mull Thunderhorn|r
    .turnin 754 >>Turn in Winterhoof Cleansing
    .accept 756 >>Accept Thunderhorn Totem
    .target Mull Thunderhorn
step << Warrior
    .goto 1412/1,-356.43,-2357.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vira|r
    .train 3273 >>Train |T135966:0|t[First Aid]
    .money <0.01
    .target Vira Younghoof
step
    .goto 1412/1,-285.28,-2263.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pyall Silentstride|r
    .turnin 96661 >>Turn in Camping 101: Cooking
    .target Pyall Silentstride
    .isOnQuest 96661
step
    .goto 1412/1,-285.000,-2263.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pyall|r
    .train 2550 >>Train Cooking
    .target Pyall Silentstride
step
    .goto 1412/1,-405.91,-2243.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zarlman Two-Moons|r
    .turnin 771 >>Turn in Rite of Vision
    .accept 772 >>Accept Rite of Vision
    .target Zarlman Two-Moons
step
    #loop
    .goto 1412/1,-598.53,-2302.06,0
    .goto 1412/1,-598.53,-2302.06,40,0
    .goto 1412/1,-624.99,-2318.47,40,0
    .goto 1412/1,-679.77,-2337.34,40,0
    .goto 1412/1,-724.69,-2343.49,40,0
    .goto 1412/1,-796.70,-2351.69,40,0
    .goto 1412/1,-890.85,-2369.74,40,0
    .goto 1412/1,-908.70,-2373.02,40,0
    .goto 1412/1,-931.47,-2380.82,40,0
    .goto 1412/1,-997.32,-2404.61,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Morin Cloudstalker|r. |cRXP_WARN_This NPC walks a patrol route|r
    .accept 749 >>Accept The Ravaged Caravan
    .unitscan Morin Cloudstalker
step
    .goto 1412/1,-1065.63,-2325.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Malah Longwind|r
    .turnin 99079 >>Turn in Longwalker Malah
    .accept 99081 >>Accept Grim Tidings
    .target Malah Longwind
step
    .goto 1412/1,-713.00,-1922.62
    >>Click the |cRXP_PICK_Sealed Supply Crate|r
    .turnin 749 >>Turn in The Ravaged Caravan
    .accept 751 >>Accept The Ravaged Caravan
step << Tauren
    #completewith Along60
    >>As you go: Kill |cRXP_ENEMY_Flatland Cougars|r. Loot them for |cRXP_LOOT_Cougar Claws|r. |cRXP_WARN_Anything left is finished later|r
    .complete 756,2 --Cougar Claws (6)
    .mob Flatland Cougar
step << Tauren
    #label Along60
    #loop
    .goto 1412/1,-716.69,-1816.78,0
    .goto 1412/1,-716.69,-1816.78,40,0
    .goto 1412/1,-646.53,-1814.32,40,0
    .goto 1412/1,-618.23,-1858.62,40,0
    .goto 1412/1,-580.68,-1786.02,40,0
    .goto 1412/1,-655.15,-1753.20,40,0
    .goto 1412/1,-716.08,-1660.90,40,0
    .goto 1412/1,-745.62,-1731.46,40,0
    .goto 1412/1,-819.47,-1780.68,40,0
    .goto 1412/1,-750.54,-1787.25,40,0
    >>Kill |cRXP_ENEMY_Prairie Stalkers|r. Loot them for |cRXP_LOOT_Stalker Claws|r
    .complete 756,1 --Stalker Claws (6)
    .mob Prairie Stalker
step << Tauren
    #loop
    .goto 1412/1,-857.01,-1923.44,0
    .goto 1412/1,-857.01,-1923.44,40,0
    .goto 1412/1,-911.78,-1966.51,40,0
    .goto 1412/1,-1005.94,-2104.75,40,0
    .goto 1412/1,-1016.40,-2142.49,40,0
    .goto 1412/1,-965.94,-2076.03,40,0
    >>Kill |cRXP_ENEMY_Flatland Cougars|r. Loot them for |cRXP_LOOT_Cougar Claws|r
    .complete 756,2 --Cougar Claws (6)
    .mob Flatland Cougar
step
    #loop
    .goto 1412/1,-19.42,-2341.03,0
    .goto 1412/1,-19.42,-2341.03,40,0
    .goto 1412/1,67.35,-2288.11,40,0
    .goto 1412/1,101.81,-2333.64,40,0
    .goto 1412/1,55.04,-2345.54,40,0
    .goto 1412/1,23.04,-2380.41,40,0
    .goto 1412/1,54.43,-2425.94,40,0
    .goto 1412/1,95.04,-2448.09,40,0
    .goto 1412/1,1.50,-2461.22,40,0
    .goto 1412/1,-25.58,-2421.02,40,0
    >>Kill |cRXP_ENEMY_Chakuyak|r and loot |cRXP_LOOT_Chakuyak's Pelt|r
    .complete 96130,1 --Chakuyak's Pelt (1)
    .mob Chakuyak
step
    #completewith Along63
    >>As you go: Kill |cRXP_ENEMY_Palemane Poachers|r. |cRXP_WARN_Anything left is finished later|r
    .complete 745,3 --Palemane Poacher slain (5)
    .mob Palemane Poacher
step
    #label Along63
    .goto 1412/1,440.29,-2437.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Perith Stormhoof|r
    .accept 98430 >>Accept The Longwalkers
    .target Perith Stormhoof
step
    #completewith Along64
    >>As you go: Kill |cRXP_ENEMY_Palemane Tanners|r. |cRXP_WARN_Anything left is finished later|r
    .complete 745,1 --Palemane Tanner slain (10)
    .mob Palemane Tanner
step
    #label Along64
    .goto 1412/1,190.43,-2384.10
    >>Escort Perith Stormhoof out of Palemane Rock
    .complete 98430,1 --Escort Perith Stormhoof out of Palemane Rock
step
    #loop
    .goto 1412/1,225.51,-2397.64,0
    .goto 1412/1,225.51,-2397.64,40,0
    .goto 1412/1,330.75,-2368.51,40,0
    .goto 1412/1,402.14,-2320.52,40,0
    .goto 1412/1,477.83,-2345.54,40,0
    .goto 1412/1,527.68,-2337.75,40,0
    .goto 1412/1,485.83,-2390.25,40,0
    .goto 1412/1,442.75,-2401.74,40,0
    .goto 1412/1,383.06,-2366.46,40,0
    .goto 1412/1,347.36,-2402.15,40,0
    >>Kill |cRXP_ENEMY_Palemane Tanners|r
    >>Kill |cRXP_ENEMY_Palemane Skinners|r
    >>Kill |cRXP_ENEMY_Palemane Poachers|r
    .complete 745,1 --Palemane Tanner slain (10)
    .complete 745,2 --Palemane Skinner slain (8)
    .complete 745,3 --Palemane Poacher slain (5)
    .mob Palemane Tanner
    .mob Palemane Skinner
    .mob Palemane Poacher
step
    #loop
    .goto 1412/1,204.59,-2214.68,0
    .goto 1412/1,204.59,-2214.68,40,0
    .goto 1412/1,216.90,-2165.46,40,0
    .goto 1412/1,209.51,-2064.96,40,0
    .goto 1412/1,175.66,-2118.69,40,0
    .goto 1412/1,157.20,-2258.99,40,0
    >>Kill |cRXP_ENEMY_Adult Plainstriders|r, |cRXP_ENEMY_Elder Plainstriders|r and |cRXP_ENEMY_Mazzranaches|r. Loot them for |cRXP_LOOT_Tender Strider Meat|r
    .collect 287505,1,99411,1 --Tender Strider Meat (1)
    .mob Adult Plainstrider
    .mob Elder Plainstrider
    .mob Mazzranache
step
    .goto 1412/1,-408.98,-2180.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yaw Sharpmane|r
    .turnin 96130 >>Turn in Chakuyak
    .target Yaw Sharpmane
step
    #loop
    .goto 1412/1,-391.75,-2179.00,0
    .goto 1412/1,-391.75,-2179.00,40,0
    .goto 1412/1,-391.14,-2196.22,40,0
    .goto 1412/1,-385.60,-2237.24,40,0
    .goto 1412/1,-446.52,-2250.37,40,0
    .goto 1412/1,-455.14,-2259.81,40,0
    .goto 1412/1,-377.60,-2304.93,40,0
    .goto 1412/1,-328.36,-2331.59,40,0
    .goto 1412/1,-390.52,-2362.36,40,0
    .goto 1412/1,-388.06,-2375.49,40,0
    .goto 1412/1,-434.83,-2382.87,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brave Wildrunner|r. |cRXP_WARN_This NPC walks a patrol route|r
    .turnin 99081 >>Turn in Grim Tidings
    .accept 99101 >>Accept Our Ancient Enemy
    .unitscan Brave Wildrunner
step
    .goto 1412/1,-392.98,-2333.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baine Bloodhoof|r
    .turnin 745 >>Turn in Sharing the Land
    .turnin 99101 >>Turn in Our Ancient Enemy
    .accept 99080 >>Accept Drive Them Out
    .target Baine Bloodhoof
step << Tauren
    .goto 1412/1,-445.29,-2341.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mull Thunderhorn|r
    .turnin 756 >>Turn in Thunderhorn Totem
    .accept 758 >>Accept Thunderhorn Cleansing
    .target Mull Thunderhorn
step
    .goto 1412/1,-347.70,-2364.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Kauth|r
    >>|cRXP_BUY_Buy|r |T132815:0|t[Ice Cold Milk] |cRXP_BUY_from him|r << Shaman/Druid
    >>|cRXP_BUY_Buy|r |T133968:0|t[Freshly Baked Bread] |cRXP_BUY_from him|r << Warrior
    .vendor >> Vendor Trash << !Hunter
    .collect 1179,10,746,1 << Shaman/Druid
    .collect 4541,10,746,1 << Warrior
    .target Innkeeper Kauth
    .money <0.025
step
    .goto 1412/1,-402.21,-2352.10
    >>Interact with |cRXP_FRIENDLY_Kyle the Frenzied|r
    .complete 99411,1 --Kyle the Frenzied
    .target Kyle the Frenzied
step
    .goto 1412/1,-430.52,-2097.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ahab Wheathoof|r
    .turnin 99411 >>Turn in Kyle's Gone Missing!
    .target Ahab Wheathoof
step << Hunter
    .goto 1412/1,-408.32,-2180.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yaw|r
    .train 5116 >> Train your class spells
    .target Yaw Sharpmane
    .xp <8,1
step << Druid
    .goto 1412/1,-442.74,-2315.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gennia|r
    .train 5186 >>Train your class spells
    .target Gennia Runetotem
    .xp <8,1
step << Warrior
    .goto 1412/1,-496.17,-2347.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krang|r
    .train 284 >> Train your class spells
    .target Krang Stonehoof
    .xp <8,1
step << Shaman
    .goto 1412/1,-437.61,-2298.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Narm|r
    .train 8044 >> Train your class spells
    .target Narm Skychaser
    .xp <8,1
step
    #loop
    .goto 1412/1,281.51,-1887.34,0
    .goto 1412/1,281.51,-1887.34,40,0
    .goto 1412/1,313.52,-1918.51,40,0
    .goto 1412/1,311.05,-1975.12,40,0
    .goto 1412/1,400.90,-1984.97,40,0
    .goto 1412/1,451.98,-1991.12,40,0
    .goto 1412/1,442.75,-1943.13,40,0
    .goto 1412/1,405.21,-1894.72,40,0
    .goto 1412/1,367.06,-1955.84,40,0
    .goto 1412/1,341.21,-1899.64,40,0
    >>Kill |cRXP_ENEMY_Bael'dun Diggers|r and |cRXP_ENEMY_Bael'dun Appraisers|r. Loot them for |cRXP_LOOT_Prospector's Pick|r
    .collect 4702,1,746,1 --Prospector's Pick (1)
    .mob Bael'dun Digger
    .mob Bael'dun Appraiser
step << Tauren
    .goto 1412/1,-239.13,-1829.91
    >>Cleanse the Thunderhorn Water Well
    .complete 758,1 --Cleanse the Thunderhorn Water Well
step
    .goto 1412/1,442.14,-1981.27
    >>Loot the |cRXP_PICK_Forges|r for |cRXP_LOOT_Broken Tools|r
    .complete 746,1 --Broken Tools (5)
step
    #completewith Along76
    >>As you go: Kill |cRXP_ENEMY_Flatland Cougar|r and loot |cRXP_LOOT_Flatland Cougar Femur|r. |cRXP_WARN_Anything left is finished later|r
    .complete 766,2 --Flatland Cougar Femur (1)
    .mob Flatland Cougar
step
    #label Along76
    #loop
    .goto 1412/1,411.37,-1745.82,0
    .goto 1412/1,411.37,-1745.82,40,0
    .goto 1412/1,348.59,-1717.92,40,0
    .goto 1412/1,316.59,-1751.15,40,0
    .goto 1412/1,280.90,-1781.50,40,0
    .goto 1412/1,287.05,-1716.28,40,0
    .goto 1412/1,312.28,-1653.11,40,0
    .goto 1412/1,381.83,-1680.59,40,0
    .goto 1412/1,417.52,-1653.93,40,0
    .goto 1412/1,451.98,-1680.18,40,0
    >>Kill |cRXP_ENEMY_Windfury Harpies|r and |cRXP_ENEMY_Windfury Wind Witches|r. Loot them for |cRXP_LOOT_Windfury Talon|r
    .complete 743,1 --Windfury Talon (8)
    .mob Windfury Harpy
    .mob Windfury Wind Witch
step
    .goto 1412/1,367.67,-1509.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Seer Wiserunner|r
    .turnin 772 >>Turn in Rite of Vision
    .accept 773 >>Accept Rite of Wisdom
    .target Seer Wiserunner
step << Orc Warrior/Orc Shaman/Orc Druid/Tauren Warrior/Tauren Shaman/Tauren Druid/Troll Warrior/Troll Shaman/Troll Druid
    #completewith next
    .zone 1456 >>Travel to Thunder Bluff
    .zoneskip 1456
step << Orc Warrior/Orc Shaman/Orc Druid/Tauren Warrior/Tauren Shaman/Tauren Druid/Troll Warrior/Troll Shaman/Troll Druid
    .goto 1456/1,103.03,-1307.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Boarton Shadetotem|r
    .accept 76156 >>Accept Stalk With The Earthmother
    .target Boarton Shadetotem
step << Orc Warrior/Orc Shaman/Orc Druid/Tauren Warrior/Tauren Shaman/Tauren Druid/Troll Warrior/Troll Shaman/Troll Druid
    #completewith next
    .zone 1412 >>Leave Thunder Bluff for Mulgore
    .zoneskip 1412
step
    #completewith Along79
    >>As you go: Kill |cRXP_ENEMY_Flatland Cougar|r and loot |cRXP_LOOT_Flatland Cougar Femur|r. |cRXP_WARN_Anything left is finished later|r
    .complete 766,2 --Flatland Cougar Femur (1)
    .mob Flatland Cougar
step
    #label Along79
    .goto 1412/1,-420.06,-1692.08
    >>Kill |cRXP_ENEMY_Ghost Howl|r and loot |cRXP_LOOT_Demon Scarred Cloak|r. Use it to start the quest
    .collect 4854,1,770 --Demon Scarred Cloak (1)
    .accept 770 >>Accept The Demon Scarred Cloak
    .use 4854
    .mob Ghost Howl
step
    #completewith Along80
    >>As you go: Kill |cRXP_ENEMY_Adult Plainstriders|r, |cRXP_ENEMY_Elder Plainstriders|r and |cRXP_ENEMY_Mazzranaches|r. Loot them for |cRXP_LOOT_Plainstrider Scale|r. |cRXP_WARN_Anything left is finished later|r
    .complete 766,3 --Plainstrider Scale (1)
    .mob Adult Plainstrider
    .mob Elder Plainstrider
    .mob Mazzranache
step
    #label Along80
    .goto 1412/1,-1027.48,-1150.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lorekeeper Raintotem|r
    .accept 833 >>Accept A Sacred Burial
    .target Lorekeeper Raintotem
step
    .goto 1412/1,-1109.33,-992.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ancestral Spirit|r
    .turnin 773 >>Turn in Rite of Wisdom
    .accept 775 >>Accept Journey into Thunder Bluff
    .target Ancestral Spirit
step
    #loop
    .goto 1412/1,-1087.79,-1001.70,0
    .goto 1412/1,-1087.79,-1001.70,40,0
    .goto 1412/1,-1055.79,-1025.08,40,0
    .goto 1412/1,-1093.94,-1054.61,40,0
    .goto 1412/1,-1148.71,-1030.82,40,0
    .goto 1412/1,-1155.48,-990.62,40,0
    .goto 1412/1,-1129.64,-963.55,40,0
    .goto 1412/1,-1121.02,-938.94,40,0
    .goto 1412/1,-1057.02,-940.99,40,0
    .goto 1412/1,-1055.79,-970.93,40,0
    >>Kill |cRXP_ENEMY_Bristleback Interlopers|r
    .complete 833,1 --Bristleback Interloper slain (8)
    .mob Bristleback Interloper
step
    #completewith Along83
    >>As you go: Kill |cRXP_ENEMY_Adult Plainstriders|r, |cRXP_ENEMY_Elder Plainstriders|r and |cRXP_ENEMY_Mazzranaches|r. Loot them for |cRXP_LOOT_Plainstrider Scale|r. |cRXP_WARN_Anything left is finished later|r
    .complete 766,3 --Plainstrider Scale (1)
    .mob Adult Plainstrider
    .mob Elder Plainstrider
    .mob Mazzranache
step
    #label Along83
    .goto 1412/1,-1027.48,-1150.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lorekeeper Raintotem|r
    .turnin 833 >>Turn in A Sacred Burial
    .target Lorekeeper Raintotem
step
    #completewith Along84
    >>As you go: Kill |cRXP_ENEMY_Flatland Cougar|r and loot |cRXP_LOOT_Flatland Cougar Femur|r. |cRXP_WARN_Anything left is finished later|r
    .complete 766,2 --Flatland Cougar Femur (1)
    .mob Flatland Cougar
step
    #completewith Along84
    >>As you go: Kill |cRXP_ENEMY_Wiry Swoops|r, |cRXP_ENEMY_Swoops|r and |cRXP_ENEMY_Taloned Swoops|r. Loot them for |cRXP_LOOT_Swoop Gizzard|r. |cRXP_WARN_Anything left is finished later|r
    .complete 766,4 --Swoop Gizzard (1)
    .mob Wiry Swoop
    .mob Swoop
    .mob Taloned Swoop
step
    #label Along84
    .goto 1412/1,-354.21,-1466.05
    >>Kill |cRXP_ENEMY_Wiry Swoops|r, |cRXP_ENEMY_Swoops|r and |cRXP_ENEMY_Taloned Swoops|r. Loot them for |cRXP_LOOT_Trophy Swoop Quill|r
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob Wiry Swoop
    .mob Swoop
    .mob Taloned Swoop
step
    #completewith next
    .hs >>Hearth to Innkeeper Kauth's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1412/1,-445.29,-2341.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mull Thunderhorn|r
    .accept 98435 >>Accept Thunderhorn's Report
    .target Mull Thunderhorn
step << Tauren
    .goto 1412/1,-445.29,-2341.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mull Thunderhorn|r
    .turnin 758 >>Turn in Thunderhorn Cleansing while you are here
    .isQuestComplete 758
    .target Mull Thunderhorn
step
    .goto 1412/1,-392.98,-2333.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baine Bloodhoof|r
    .turnin 746 >>Turn in Dwarven Digging while you are here
    .isQuestComplete 746
    .target Baine Bloodhoof
step
    .goto 1412/1,-384.98,-2397.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ruul Eagletalon|r
    .turnin 743 >>Turn in Dangers of the Windfury while you are here
    .isQuestComplete 743
    .target Ruul Eagletalon
step
    .goto 1412/1,-454.52,-2304.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Harken Windtotem|r
    .turnin 761 >>Turn in Swoop Hunting
    .target Harken Windtotem
step
    .goto 1412/1,-496.37,-2348.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krang Stonehoof|r
    >>|cRXP_WARN_The database has no objectives for Sparring Match. Skip this step if the quest is not finished|r
    .turnin 99108 >>Turn in Sparring Match
    .target Krang Stonehoof
    .isOnQuest 99108
step
    #loop
    .goto 1412/1,-1058.25,-2441.94,0
    .goto 1412/1,-1058.25,-2441.94,40,0
    .goto 1412/1,-1113.64,-2382.05,40,0
    .goto 1412/1,-1180.10,-2386.97,40,0
    .goto 1412/1,-1199.18,-2283.19,40,0
    .goto 1412/1,-1150.56,-2249.55,40,0
    .goto 1412/1,-1140.71,-2199.10,40,0
    .goto 1412/1,-1047.79,-2171.61,40,0
    .goto 1412/1,-1079.79,-2285.65,40,0
    .goto 1412/1,-1067.48,-2352.10,40,0
    >>Kill |cRXP_ENEMY_Prairie Wolfs|r, |cRXP_ENEMY_Prairie Stalkers|r, |cRXP_ENEMY_Prairie Wolf Alphas|r and |cRXP_ENEMY_Chakuyaks|r. Loot them for |cRXP_LOOT_Prairie Wolf Heart|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .mob Prairie Wolf
    .mob Prairie Stalker
    .mob Prairie Wolf Alpha
    .mob Chakuyak
step
    #loop
    .goto 1412/1,-965.94,-2076.03,0
    .goto 1412/1,-965.94,-2076.03,40,0
    .goto 1412/1,-911.78,-1966.51,40,0
    .goto 1412/1,-857.01,-1923.44,40,0
    >>Kill |cRXP_ENEMY_Flatland Cougar|r and loot |cRXP_LOOT_Flatland Cougar Femur|r
    .complete 766,2 --Flatland Cougar Femur (1)
    .mob Flatland Cougar
step
    #loop
    .goto 1412/1,-649.00,-1480.00,0
    .goto 1412/1,-649.00,-1480.00,40,0
    .goto 1412/1,-649.00,-1450.06,40,0
    .goto 1412/1,-652.69,-1385.24,40,0
    .goto 1412/1,-706.23,-1441.03,40,0
    >>Kill |cRXP_ENEMY_Adult Plainstriders|r, |cRXP_ENEMY_Elder Plainstriders|r and |cRXP_ENEMY_Mazzranaches|r. Loot them for |cRXP_LOOT_Plainstrider Scale|r
    .complete 766,3 --Plainstrider Scale (1)
    .mob Adult Plainstrider
    .mob Elder Plainstrider
    .mob Mazzranache
step
    .goto 1412/1,-511.76,-1792.17
    >>Kill |cRXP_ENEMY_Wiry Swoops|r, |cRXP_ENEMY_Swoops|r and |cRXP_ENEMY_Taloned Swoops|r. Loot them for |cRXP_LOOT_Swoop Gizzard|r
    .complete 766,4 --Swoop Gizzard (1)
    .mob Wiry Swoop
    .mob Swoop
    .mob Taloned Swoop
step
    .goto 1412/1,-1009.92,-1073.00,60,0
    .goto 1412/1,-906.66,-926.41,60,0
    .goto 1412/1,-788.50,-912.36,60,0
    .goto 1412/1,-674.44,-866.81,60,0
    .goto 1412/1,-572.21,-903.12,60,0
    .goto 1412/1,-512.61,-983.26,60,0
    .goto 1412/1,-511.59,-1084.30,60,0
    .goto 1412/1,-496.17,-1166.84,60,0
    .goto 1412/1,-506.45,-1236.71,60,0
    .goto 1412/1,-561.42,-1278.84,60,0
    .goto 1412/1,-635.91,-1302.81,60,0
    .goto 1412/1,-737.12,-1315.14,60,0
    .goto 1412/1,-836.79,-1312.40,60,0
    .goto 1412/1,-920.02,-1316.86,60,0
    .goto 1412/1,-972.42,-1249.73,60,0
    .goto 1412/1,-1063.35,-1159.31,60,0
    .goto 1412/1,-1009.92,-1073.00,60,0
    .xp 9+3020 >> Grind to 3020+/6500xp
step
    .goto 1412/1,-1009.92,-1073.00,60,0
    .goto 1412/1,-906.66,-926.41,60,0
    .goto 1412/1,-788.50,-912.36,60,0
    .goto 1412/1,-674.44,-866.81,60,0
    .goto 1412/1,-572.21,-903.12,60,0
    .goto 1412/1,-512.61,-983.26,60,0
    .goto 1412/1,-511.59,-1084.30,60,0
    .goto 1412/1,-496.17,-1166.84,60,0
    .goto 1412/1,-506.45,-1236.71,60,0
    .goto 1412/1,-561.42,-1278.84,60,0
    .goto 1412/1,-635.91,-1302.81,60,0
    .goto 1412/1,-737.12,-1315.14,60,0
    .goto 1412/1,-836.79,-1312.40,60,0
    .goto 1412/1,-920.02,-1316.86,60,0
    .goto 1412/1,-972.42,-1249.73,60,0
    .goto 1412/1,-1063.35,-1159.31,60,0
    .goto 1412/1,-1009.92,-1073.00,60,0
    .xp 9+3720 >> Grind to 3720+/6500xp
step
    .goto 1412/1,-1009.92,-1073.00,60,0
    .goto 1412/1,-906.66,-926.41,60,0
    .goto 1412/1,-788.50,-912.36,60,0
    .goto 1412/1,-674.44,-866.81,60,0
    .goto 1412/1,-572.21,-903.12,60,0
    .goto 1412/1,-512.61,-983.26,60,0
    .goto 1412/1,-511.59,-1084.30,60,0
    .goto 1412/1,-496.17,-1166.84,60,0
    .goto 1412/1,-506.45,-1236.71,60,0
    .goto 1412/1,-561.42,-1278.84,60,0
    .goto 1412/1,-635.91,-1302.81,60,0
    .goto 1412/1,-737.12,-1315.14,60,0
    .goto 1412/1,-836.79,-1312.40,60,0
    .goto 1412/1,-920.02,-1316.86,60,0
    .goto 1412/1,-972.42,-1249.73,60,0
    .goto 1412/1,-1063.35,-1159.31,60,0
    .goto 1412/1,-1009.92,-1073.00,60,0
    .xp 9+3700 >> Grind to 3700+/6500xp
step
    .goto 1412/1,-1009.92,-1073.00,60,0
    .goto 1412/1,-906.66,-926.41,60,0
    .goto 1412/1,-788.50,-912.36,60,0
    .goto 1412/1,-674.44,-866.81,60,0
    .goto 1412/1,-572.21,-903.12,60,0
    .goto 1412/1,-512.61,-983.26,60,0
    .goto 1412/1,-511.59,-1084.30,60,0
    .goto 1412/1,-496.17,-1166.84,60,0
    .goto 1412/1,-506.45,-1236.71,60,0
    .goto 1412/1,-561.42,-1278.84,60,0
    .goto 1412/1,-635.91,-1302.81,60,0
    .goto 1412/1,-737.12,-1315.14,60,0
    .goto 1412/1,-836.79,-1312.40,60,0
    .goto 1412/1,-920.02,-1316.86,60,0
    .goto 1412/1,-972.42,-1249.73,60,0
    .goto 1412/1,-1063.35,-1159.31,60,0
    .goto 1412/1,-1009.92,-1073.00,60,0
    .xp 9+4400 >> Grind to 4400+/6500xp
step
    .goto 1412/1,-347.19,-2364.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Kauth|r
    .vendor >> Vendor trash
    .target Innkeeper Kauth
step
    .goto 1412/1,-353.60,-2335.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Skorn Whitecloud|r
    .turnin 770 >>Turn in The Demon Scarred Cloak while you are here
    .isQuestComplete 770
    .target Skorn Whitecloud
step
    .goto 1412/1,-365.90,-2227.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maur Raincaller|r
    .turnin 766 >>Turn in Mazzranache
    .target Maur Raincaller
step
    .goto 1412/1,-353.60,-2335.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Skorn Whitecloud|r
    .turnin 770 >>Turn in The Demon Scarred Cloak
    .target Skorn Whitecloud
step
    .goto 1412/1,-392.98,-2333.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baine Bloodhoof|r
    .turnin 746 >>Turn in Dwarven Digging
    .target Baine Bloodhoof
step
    .goto 1412/1,-384.98,-2397.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ruul Eagletalon|r
    .turnin 743 >>Turn in Dangers of the Windfury
    .target Ruul Eagletalon
step << Warrior
    #completewith next
    .zone 1456 >>Travel to Thunder Bluff
    .zoneskip 1456
step << Warrior
    .goto 1456/1,-80.78,-1457.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torm Ragetotem|r
    .accept 1505 >>Accept Veteran Uzzek
    .target Torm Ragetotem
step << Warrior
    .goto 1412/1,-496.17,-2347.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krang|r
    .trainer >> Train your class spells
    .target Krang Stonehoof
step << Shaman
    .goto 1412/1,-437.61,-2298.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Narm|r
    .trainer >> Train your class spells
    .target Narm Skychaser
step << Warrior
    #completewith next
    .zone 1412 >>Leave Thunder Bluff for Mulgore
    .zoneskip 1412
step << Tauren
    .goto 1412/1,-445.29,-2341.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mull Thunderhorn|r
    .turnin 758 >>Turn in Thunderhorn Cleansing
    .accept 759 >>Accept Wildmane Totem
    .target Mull Thunderhorn
step << Tauren Hunter
    .goto 1412/1,-408.98,-2180.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yaw Sharpmane|r
    .accept 6061 >>Accept Taming the Beast
    .target Yaw Sharpmane
step << Hunter
    .goto 1412/1,-408.32,-2180.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yaw|r
    .trainer >> Train your class spells
    .target Yaw Sharpmane
step << Druid
    .goto 1412/1,-442.74,-2315.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gennia|r
    .trainer >> Train your class spells
    .target Gennia Runetotem
step << Druid
    .goto 1412/1,-442.74,-2315.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gennia|r
    .train 8924 >> Train your class spells
    .target Gennia Runetotem
step << Tauren Hunter
    #loop
    .goto 1412/1,-5.27,-2221.25,0
    .goto 1412/1,-5.27,-2221.25,40,0
    .goto 1412/1,53.19,-2132.64,40,0
    .goto 1412/1,34.73,-2086.70,40,0
    .goto 1412/1,20.58,-2059.21,40,0
    .goto 1412/1,-31.12,-2032.14,40,0
    >>Interact with |cRXP_FRIENDLY_Adult Plainstrider|r
    .complete 6061,1 --Adult Plainstrider
    .target Adult Plainstrider
step << Tauren Hunter
    .goto 1412/1,-408.98,-2180.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yaw Sharpmane|r
    .turnin 6061 >>Turn in Taming the Beast
    .accept 6087 >>Accept Taming the Beast
    .target Yaw Sharpmane
step << Tauren Hunter
    #loop
    .goto 1412/1,-282.21,-1642.03,0
    .goto 1412/1,-282.21,-1642.03,40,0
    .goto 1412/1,-253.90,-1646.55,40,0
    .goto 1412/1,-183.74,-1715.46,40,0
    .goto 1412/1,-79.12,-1571.48,40,0
    .goto 1412/1,-119.74,-1752.38,40,0
    .goto 1412/1,-62.50,-1779.04,40,0
    .goto 1412/1,17.50,-1723.66,40,0
    >>Interact with |cRXP_FRIENDLY_Prairie Stalker|r
    .complete 6087,1 --Prairie Stalker
    .target Prairie Stalker
step << Tauren Hunter
    .goto 1412/1,-408.98,-2180.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yaw Sharpmane|r
    .turnin 6087 >>Turn in Taming the Beast
    .accept 6088 >>Accept Taming the Beast
    .target Yaw Sharpmane
step << Tauren Hunter
    .goto 1412/1,-511.76,-1792.17
    >>Interact with |cRXP_FRIENDLY_Swoop|r
    .complete 6088,1 --Swoop
    .target Swoop
step << Tauren Hunter
    .goto 1412/1,-408.98,-2180.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yaw Sharpmane|r
    .turnin 6088 >>Turn in Taming the Beast
    .accept 6089 >>Accept Training the Beast
    .target Yaw Sharpmane
step
    .goto 1412/1,-353.60,-2335.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Skorn Whitecloud|r
    .accept 861 >>Accept The Hunter's Way
    .target Skorn Whitecloud
step
    #loop
    .goto 1412/1,-598.53,-2302.06,0
    .goto 1412/1,-598.53,-2302.06,40,0
    .goto 1412/1,-624.99,-2318.47,40,0
    .goto 1412/1,-679.77,-2337.34,40,0
    .goto 1412/1,-724.69,-2343.49,40,0
    .goto 1412/1,-796.70,-2351.69,40,0
    .goto 1412/1,-890.85,-2369.74,40,0
    .goto 1412/1,-908.70,-2373.02,40,0
    .goto 1412/1,-931.47,-2380.82,40,0
    .goto 1412/1,-997.32,-2404.61,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Morin Cloudstalker|r. |cRXP_WARN_This NPC walks a patrol route|r
    .turnin 751 >>Turn in The Ravaged Caravan
    .accept 764 >>Accept The Venture Co.
    .accept 765 >>Accept Supervisor Fizsprocket
    .unitscan Morin Cloudstalker
step << Tauren
    #completewith Along108
    >>As you go: Kill |cRXP_ENEMY_Prairie Wolf Alphas|r. Loot them for |cRXP_LOOT_Prairie Alpha Tooth|r. |cRXP_WARN_Anything left is finished later|r
    .complete 759,1 --Prairie Alpha Tooth (8)
    .mob Prairie Wolf Alpha
step
    #loop
    .goto 1412/1,-1236.72,-2265.14,0
    .goto 1412/1,-1236.72,-2265.14,40,0
    .goto 1412/1,-1240.41,-2239.30,40,0
    .goto 1412/1,-1241.03,-2197.86,40,0
    .goto 1412/1,-1252.72,-2169.56,40,0
    .goto 1412/1,-1249.03,-2214.27,40,0
    .goto 1412/1,-1250.26,-2231.09,40,0
    >>Kill |cRXP_ENEMY_Herak the Pillager|r and loot |cRXP_LOOT_Herak's Head|r
    .complete 99080,3 --Herak's Head (1)
    .mob Herak the Pillager
step
    #label Along108
    .goto 1412/1,-1393.03,-2227.40
    >>Kill |cRXP_ENEMY_Galak Outrunners|r
    >>Kill |cRXP_ENEMY_Galak Centaurs|r
    .complete 99080,2 --Galak Outrunner slain (4)
    .complete 99080,1 --Galak Centaur slain (6)
    .mob Galak Outrunner
    .mob Galak Centaur
step << Tauren
    #loop
    .goto 1412/1,-1386.88,-2340.62,0
    .goto 1412/1,-1386.88,-2340.62,40,0
    .goto 1412/1,-1307.49,-2437.02,40,0
    .goto 1412/1,-1381.34,-2551.05,40,0
    .goto 1412/1,-1298.88,-2592.49,40,0
    .goto 1412/1,-1215.18,-2643.35,40,0
    .goto 1412/1,-1250.87,-2513.73,40,0
    .goto 1412/1,-1154.25,-2520.29,40,0
    .goto 1412/1,-1180.10,-2386.97,40,0
    .goto 1412/1,-1267.49,-2295.08,40,0
    >>Kill |cRXP_ENEMY_Prairie Wolf Alphas|r. Loot them for |cRXP_LOOT_Prairie Alpha Tooth|r
    .complete 759,1 --Prairie Alpha Tooth (8)
    .mob Prairie Wolf Alpha
step
    #completewith Along111
    >>As you go: Kill |cRXP_ENEMY_Venture Co. Workers|r. Kill |cRXP_ENEMY_Venture Co. Supervisors|r. |cRXP_WARN_Anything left is finished later|r
    .complete 764,1 --Venture Co. Worker slain (14)
    .complete 764,2 --Venture Co. Supervisor slain (6)
    .mob Venture Co. Worker
    .mob Venture Co. Supervisor
step
    .goto 1412/1,-1286.57,-1756.48
    >>Kill |cRXP_ENEMY_Supervisor Fizsprocket|r and loot |cRXP_LOOT_Fizsprocket's Clipboard|r
    .complete 765,1 --Fizsprocket's Clipboard (1)
    .mob Supervisor Fizsprocket
step
    #label Along111
    .goto 1412/1,-1286.57,-1756.48
    >>Kill |cRXP_ENEMY_Supervisor Fizsprocket|r and loot |cRXP_LOOT_Mulgore Expansion Plans|r. Use it to start the quest
    .collect 281031,1,98424 --Mulgore Expansion Plans (1)
    .accept 98424 >>Accept Fizsprocket's Notes
    .use 281031
    .mob Supervisor Fizsprocket
step
    #loop
    .goto 1412/1,-1281.64,-1770.84,0
    .goto 1412/1,-1281.64,-1770.84,40,0
    .goto 1412/1,-1186.25,-1764.69,40,0
    .goto 1412/1,-1091.48,-1733.51,40,0
    .goto 1412/1,-1042.25,-1751.56,40,0
    .goto 1412/1,-1090.87,-1902.51,40,0
    .goto 1412/1,-1056.40,-1957.48,40,0
    .goto 1412/1,-1143.18,-1922.62,40,0
    .goto 1412/1,-1140.71,-1833.60,40,0
    .goto 1412/1,-1194.87,-1829.91,40,0
    >>Kill |cRXP_ENEMY_Venture Co. Workers|r
    >>Kill |cRXP_ENEMY_Venture Co. Supervisors|r
    .complete 764,1 --Venture Co. Worker slain (14)
    .complete 764,2 --Venture Co. Supervisor slain (6)
    .mob Venture Co. Worker
    .mob Venture Co. Supervisor
step
    #loop
    .goto 1412/1,-997.32,-2404.61,0
    .goto 1412/1,-997.32,-2404.61,40,0
    .goto 1412/1,-931.47,-2380.82,40,0
    .goto 1412/1,-908.70,-2373.02,40,0
    .goto 1412/1,-890.85,-2369.74,40,0
    .goto 1412/1,-796.70,-2351.69,40,0
    .goto 1412/1,-724.69,-2343.49,40,0
    .goto 1412/1,-679.77,-2337.34,40,0
    .goto 1412/1,-624.99,-2318.47,40,0
    .goto 1412/1,-598.53,-2302.06,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Morin Cloudstalker|r. |cRXP_WARN_This NPC walks a patrol route|r
    .turnin 764 >>Turn in The Venture Co.
    .turnin 765 >>Turn in Supervisor Fizsprocket
    .accept 98427 >>Accept Ceasing Operations
    .unitscan Morin Cloudstalker
step
    .goto 1412/1,-392.98,-2333.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baine Bloodhoof|r
    .turnin 99080 >>Turn in Drive Them Out
    .accept 99082 >>Accept The High Chieftain
    .target Baine Bloodhoof
step << Tauren
    .goto 1412/1,-445.29,-2341.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mull Thunderhorn|r
    .turnin 759 >>Turn in Wildmane Totem
    .accept 760 >>Accept Wildmane Cleansing
    .target Mull Thunderhorn
step
    #completewith next
    .zone 1456 >>Travel to Thunder Bluff
    .zoneskip 1456
step << Tauren Druid
    .xp 10 >>Grind to level 10 (Heeding the Call needs it)
step << Tauren Druid
    .goto 1456/1,38.52,-1300.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Pala|r
    .accept 5926 >>Accept Heeding the Call
    .target Innkeeper Pala
step << Orc/Tauren/Troll
    .goto 1456/1,103.03,-1307.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Boarton Shadetotem|r
    .accept 76160 >>Accept Stalk With The Earthmother
    .target Boarton Shadetotem
step << Tauren Hunter
    .goto 1456/1,-81.40,-1474.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Holt Thunderhorn|r
    .turnin 6089 >>Turn in Training the Beast
    .target Holt Thunderhorn
step << Hunter
    .goto 1456/1,-47.79,-1435.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hesuwa|r
    .train 24547 >>Train your pet spells
    .target Hesuwa Thunderhorn
step << Shaman/Druid
    .goto 1456/1,89.46,-1286.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ansekhwa|r
    .train 199 >>Train Two-Handed Maces
    .target Ansekhwa
    .money <0.100
step << Hunter
    .goto 1456/1,89.46,-1286.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ansekhwa|r
    .train 227 >>Train Staves
    .target Ansekhwa
    .money <0.100
step
    #label RBSection1_3
    #completewith next
    +|cRXP_WARN_Mulgore: around Boarton Shadetotem|r (planned from level 9)
step
    .goto 1456/1,122.65,-1264.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eyahn Eagletalon|r
    .accept 744 >>Accept Preparation for Ceremony
    .target Eyahn Eagletalon
step
    .goto 1456/1,120.04,-1238.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eylah Sunhorn|r
    .accept 97485 >>Accept Traditions of the Bluff
    .target Eylah Sunhorn
step << Warrior
    .goto 1456/1,109.71,-1239.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Orm Stonehoof|r
    .turnin 1840 >>Turn in Orm Stonehoof and the Brutal Helm
    .target Orm Stonehoof
    .isOnQuest 1840
step << Tauren
    .goto 1456/1,38.94,-1238.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ahanu|r
    .turnin 6362 >>Turn in Ride to Thunder Bluff
    .target Ahanu
    .isOnQuest 6362
step << Tauren
    .goto 1456/1,38.94,-1238.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ahanu|r
    .accept 6363 >>Accept Tal the Wind Rider Master
    .target Ahanu
    .isQuestTurnedIn 6362 --any of: Ride to Thunder Bluff
    .xp <10,1
step << Tauren
    .goto 1456/1,26.10,-1196.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tal|r
    .turnin 6363 >>Turn in Tal the Wind Rider Master
    .target Tal
    .isOnQuest 6363
step << Tauren
    .goto 1456/1,26.10,-1196.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tal|r
    .accept 6364 >>Accept Return to Jahan
    .target Tal
    .isQuestTurnedIn 6363 --any of: Tal the Wind Rider Master
    .xp <10,1
step
    .goto 1456/1,-112.71,-1209.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cairne Bloodhoof|r
    .turnin 775 >>Turn in Journey into Thunder Bluff
    .target Cairne Bloodhoof
    .isOnQuest 775
step
    .goto 1456/1,-112.71,-1209.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cairne Bloodhoof|r
    .accept 776 >>Accept Rites of the Earthmother
    .target Cairne Bloodhoof
    .isQuestTurnedIn 775 --any of: Journey into Thunder Bluff
step
    .goto 1456/1,-112.71,-1209.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cairne Bloodhoof|r
    .turnin 99082 >>Turn in The High Chieftain
    .target Cairne Bloodhoof
    .isOnQuest 99082
step
    .goto 1456/1,-112.71,-1209.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cairne Bloodhoof|r
    .turnin 98430 >>Turn in The Longwalkers
    .target Cairne Bloodhoof
    .isOnQuest 98430
step
    .goto 1456/1,-303.93,-1048.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Arch Druid Hamuul Runetotem|r
    .turnin 98435 >>Turn in Thunderhorn's Report
    .target Arch Druid Hamuul Runetotem
    .isOnQuest 98435
step
    .goto 1456/1,-303.93,-1048.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Arch Druid Hamuul Runetotem|r
    .accept 886 >>Accept The Barrens Oases
    .target Arch Druid Hamuul Runetotem
step << Tauren Druid
    .goto 1456/1,-281.59,-1039.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Turak Runetotem|r
    .turnin 5927 >>Turn in Heeding the Call
    .target Turak Runetotem
    .isOnQuest 5927
step << Tauren Druid
    .goto 1456/1,-281.59,-1039.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Turak Runetotem|r
    .turnin 6130 >>Turn in Power over Poison
    .target Turak Runetotem
    .isOnQuest 6130
step << Tauren Druid
    .goto 1456/1,-281.59,-1039.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Turak Runetotem|r
    .turnin 31 >>Turn in Aquatic Form
    .target Turak Runetotem
    .isOnQuest 31
step << Tauren Druid
    .goto 1456/1,-281.59,-1039.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Turak Runetotem|r
    .turnin 5926 >>Turn in Heeding the Call
    .target Turak Runetotem
    .isOnQuest 5926
step << Tauren Druid
    .goto 1456/1,-281.59,-1039.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Turak Runetotem|r
    .accept 5922 >>Accept Moonglade
    .target Turak Runetotem
step
    .goto 1456/1,-303.93,-1048.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Arch Druid Hamuul Runetotem|r
    .turnin 3369 >>Turn in In Nightmares
    .target Arch Druid Hamuul Runetotem
    .isOnQuest 3369
step << Tauren Druid/Skyborne Druid
    .goto 1456/1,-281.59,-1039.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Turak Runetotem|r
    .turnin 98362 >>Turn in To Thunder Bluff
    .target Turak Runetotem
    .isOnQuest 98362
step
    .goto 1456/1,-212.39,-1065.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magatha Grimtotem|r
    .turnin 1063 >>Turn in The Elder Crone
    .target Magatha Grimtotem
    .isOnQuest 1063
step
    .goto 1456/1,-212.39,-1065.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magatha Grimtotem|r
    .turnin 5062 >>Turn in Sacred Fire
    .target Magatha Grimtotem
    .isQuestComplete 5062
step << Skyborne Druid
    .goto 1456/1,-281.59,-1039.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Turak Runetotem|r
    .accept 94913 >>Accept Moonglade
    .target Turak Runetotem
    .xp <10,1
step
    .goto 1456/1,278.59,-995.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Zamah|r
    .turnin 853 >>Turn in Apothecary Zamah
    .target Apothecary Zamah
    .isOnQuest 853
step
    .goto 1456/1,278.59,-995.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Zamah|r
    .turnin 1067 >>Turn in Return to Thunder Bluff
    .target Apothecary Zamah
    .isOnQuest 1067
step << Shaman
    .goto 1456/1,254.06,-992.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Xanis Flameweaver|r
    .accept 1523 >>Accept Call of Fire
    .target Xanis Flameweaver
    .xp <10,1
step << Mage
    .goto 1456/1,253.85,-995.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thurston Xane|r
    .accept 1883 >>Accept Speak with Un'thuwa
    .target Thurston Xane
    .xp <10,1
step << Tauren Druid
    .goto 1456/1,-281.59,-1039.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Turak Runetotem|r
    .turnin 5932 >>Turn in Back to Thunder Bluff
    .target Turak Runetotem
    .isOnQuest 5932
step << Tauren Druid
    .goto 1456/1,-281.59,-1039.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Turak Runetotem|r
    .accept 6002 >>Accept Body and Heart
    .target Turak Runetotem
    .isQuestTurnedIn 5932 --any of: Back to Thunder Bluff
    .xp <10,1
step
    .goto 1456/1,52.93,-1150.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mooranta|r
    >>|cRXP_WARN_This will unlock an easy quest. If you already have 2 professions, skip this step|r
    .train 8613 >>Train |T134366:0|t[Skinning]
    .target Mooranta
step << Tauren Druid
    .goto 1456/1,-281.59,-1039.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Turak Runetotem|r
    .turnin 6002 >>Turn in Body and Heart
    .target Turak Runetotem
    .isQuestComplete 6002
step << Skyborne Druid
    .goto 1456/1,-281.59,-1039.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Turak Runetotem|r
    .accept 94913 >>Accept Moonglade
    .target Turak Runetotem
    .xp <10,1
step
    #completewith next
    .zone 1412 >>Leave Thunder Bluff for Mulgore
    .zoneskip 1412
step
    #loop
    .goto 1412/1,379.98,-1118.61,0
    .goto 1412/1,379.98,-1118.61,40,0
    .goto 1412/1,487.06,-1055.02,40,0
    .goto 1412/1,415.06,-986.52,40,0
    .goto 1412/1,520.91,-944.68,40,0
    .goto 1412/1,588.61,-1002.93,40,0
    .goto 1412/1,547.99,-1154.30,40,0
    .goto 1412/1,520.30,-1214.19,40,0
    .goto 1412/1,451.98,-1243.72,40,0
    .goto 1412/1,451.98,-1146.09,40,0
    >>Kill |cRXP_ENEMY_Windfury Sorceress|r. Loot them for |cRXP_LOOT_Azure Feather|r
    >>Kill |cRXP_ENEMY_Windfury Matriarches|r. Loot them for |cRXP_LOOT_Bronze Feather|r
    .complete 744,1 --Azure Feather (6)
    .complete 744,2 --Bronze Feather (6)
    .mob Windfury Sorceress
    .mob Windfury Matriarch
step << Skyborne
    .goto 1412/1,423.68,-656.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alaana Stormwalker|r
    .accept 95350 >>Accept Welcome to Azeroth
    .target Alaana Stormwalker
step << Skyborne Druid
    .goto 1412/1,422.44,-657.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Muln Earthfury|r
    .accept 94911 >>Accept Child of Nature
    .target Muln Earthfury
    .xp <10,1
step << Tauren
    .goto 1412/1,-148.66,-758.03
    >>Cleanse the Wildmane Well
    .complete 760,1 --Cleanse the Wildmane Well
    .isOnQuest 760
step
    .goto 1412/1,423.68,-656.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alaana Stormwalker|r
    .turnin 95349 >>Turn in The Earthen Ring
    .target Alaana Stormwalker
    .isOnQuest 95349
step << Skyborne Druid
    .goto 1412/1,422.44,-657.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Muln Earthfury|r
    .accept 94911 >>Accept Child of Nature
    .target Muln Earthfury
    .xp <10,1
step
    .goto 1412/1,-674.84,-751.47
    >>Kill |cRXP_ENEMY_Arra'chea|r and loot |cRXP_LOOT_Horn of Arra'chea|r
    .complete 776,1 --Horn of Arra'chea (1)
    .mob Arra'chea
    .isOnQuest 776
step
    #loop
    .goto 1412/1,-441.60,-966.83,0
    .goto 1412/1,-441.60,-966.83,40,0
    .goto 1412/1,-328.98,-872.07,40,0
    .goto 1412/1,-265.59,-847.05,40,0
    .goto 1412/1,-215.74,-810.13,40,0
    .goto 1412/1,-110.51,-865.10,40,0
    .goto 1412/1,-119.12,-949.60,40,0
    .goto 1412/1,-176.36,-909.81,40,0
    .goto 1412/1,-183.13,-869.61,40,0
    .goto 1412/1,-225.59,-922.12,40,0
    >>Kill |cRXP_ENEMY_Flatland Prowlers|r. Loot them for |cRXP_LOOT_Flatland Prowler Claw|r
    .complete 861,1 --Flatland Prowler Claw (4)
    .mob Flatland Prowler
    .isOnQuest 861
step
    #completewith next
    .zone 1456 >>Travel to Thunder Bluff
    .zoneskip 1456
step
    .goto 1456/1,-125.66,-1413.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Melor Stonehoof|r
    .turnin 1130 >>Turn in Melor Sends Word
    .target Melor Stonehoof
    .isOnQuest 1130
step
    .goto 1456/1,-125.66,-1413.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Melor Stonehoof|r
    .turnin 861 >>Turn in The Hunter's Way
    .target Melor Stonehoof
    .isOnQuest 861
step
    .goto 1456/1,-125.66,-1413.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Melor Stonehoof|r
    .accept 860 >>Accept Sergra Darkthorn
    .target Melor Stonehoof
    .isQuestTurnedIn 861 --any of: The Hunter's Way
step << Orc Hunter/Troll Hunter
    .goto 1456/1,-93.82,-1464.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kary Thunderhorn|r
    .accept 6070 >>Accept The Hunter's Path
    .target Kary Thunderhorn
    .xp <10,1
step
    .goto 1456/1,-112.71,-1209.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cairne Bloodhoof|r
    .turnin 776 >>Turn in Rites of the Earthmother
    .target Cairne Bloodhoof
    .isOnQuest 776
step
    .goto 1456/1,122.65,-1264.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eyahn Eagletalon|r
    .turnin 744 >>Turn in Preparation for Ceremony
    .target Eyahn Eagletalon
step
    .goto 1456/1,120.04,-1238.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eylah Sunhorn|r
    .turnin 97485 >>Turn in Traditions of the Bluff
    .target Eylah Sunhorn
    .isQuestComplete 97485
step << Orc/Tauren/Troll
    .goto 1456/1,103.03,-1307.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Boarton Shadetotem|r
    >>|cRXP_WARN_The database has no objectives for Stalk With The Earthmother. Skip this step if the quest is not finished|r
    .turnin 76160 >>Turn in Stalk With The Earthmother
    .target Boarton Shadetotem
    .isOnQuest 76160
step << Orc Warrior/Orc Shaman/Orc Druid/Tauren Warrior/Tauren Shaman/Tauren Druid/Troll Warrior/Troll Shaman/Troll Druid
    .goto 1456/1,103.03,-1307.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Boarton Shadetotem|r
    >>|cRXP_WARN_The database has no objectives for Stalk With The Earthmother. Skip this step if the quest is not finished|r
    .turnin 76156 >>Turn in Stalk With The Earthmother
    .target Boarton Shadetotem
    .isOnQuest 76156
step << Mage
    .xp 10 >>Grind to level 10 (Speak with Un'thuwa needs it)
step << Mage
    .goto 1456/1,253.85,-995.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thurston Xane|r
    .accept 1883 >>Accept Speak with Un'thuwa
    .target Thurston Xane
step
    .goto 1456/1,-36.73,-1461.22
    >>Click the |cRXP_PICK_Incense Burner|r
    .complete 97485,1 --Incense Burner
step << Orc Hunter/Troll Hunter
    .xp 10 >>Grind to level 10 (The Hunter's Path needs it)
step << Orc Hunter/Troll Hunter
    .goto 1456/1,-93.82,-1464.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kary Thunderhorn|r
    .accept 6070 >>Accept The Hunter's Path
    .target Kary Thunderhorn
step
    #completewith next
    .zone 1412 >>Leave Thunder Bluff for Mulgore
    .zoneskip 1412
step << Skyborne Druid
    .xp 10 >>Grind to level 10 (Child of Nature needs it)
step << Skyborne Druid
    .goto 1412/1,422.44,-657.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Muln Earthfury|r
    .accept 94911 >>Accept Child of Nature
    .target Muln Earthfury
step << Skyborne Druid
    #completewith next
    .zone 1456 >>Travel to Thunder Bluff
    .zoneskip 1456
step << Skyborne Druid
    .goto 1456/1,-281.59,-1039.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Turak Runetotem|r
    .turnin 94911 >>Turn in Child of Nature
    .accept 94913 >>Accept Moonglade
    .target Turak Runetotem
step << Horde Druid Skyborne
    .goto 1456/1,-281.500,-1039.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Turak Runetotem::3033|r.
    .train 8936 >>Train your class spells
    .target Turak Runetotem::3033
    .xp <12,1
    .xp >14,1
step << Horde Druid Skyborne
    .goto 1456/1,-281.500,-1039.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Turak Runetotem::3033|r.
    .train 5178 >>Train your class spells
    .target Turak Runetotem::3033
    .xp <14,1
step << Skyborne Druid
    #completewith next
    .zone 1412 >>Leave Thunder Bluff for Mulgore
    .zoneskip 1412
step
    #loop
    .goto 1412/1,-1001.01,-1418.88,0
    .goto 1412/1,-1001.01,-1418.88,40,0
    .goto 1412/1,-1042.86,-1474.67,40,0
    .goto 1412/1,-1032.40,-1484.92,40,0
    .goto 1412/1,-1026.86,-1497.23,40,0
    .goto 1412/1,-1045.32,-1509.95,40,0
    .goto 1412/1,-1066.86,-1522.66,40,0
    .goto 1412/1,-998.55,-1532.51,40,0
    .goto 1412/1,-993.63,-1498.05,40,0
    >>Kill |cRXP_ENEMY_Venture Co. Clearclutter|r and loot |cRXP_LOOT_Clearcutter Key|r
    .complete 98427,1 --Clearcutter Key (1)
    .mob Venture Co. Clearclutter
    .isOnQuest 98427
step << Undead Priest
    #completewith next
    .hs >>Hearth to Innkeeper Kauth's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step << Undead Priest
    .xp 10 >>Grind to level 10 (Touch of Weakness needs it)
step << Troll Priest
    .xp 10 >>Grind to level 10 (Hex of Weakness needs it)
step
    .goto 1412/1,-364.06,-2287.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Var'jun|r
    .accept 5661 >>Accept Touch of Weakness << Undead Priest
    .accept 5655 >>Accept Hex of Weakness << Troll Priest
    .target Var'jun
step
    #loop
    .goto 1412/1,-598.53,-2302.06,0
    .goto 1412/1,-598.53,-2302.06,40,0
    .goto 1412/1,-624.99,-2318.47,40,0
    .goto 1412/1,-679.77,-2337.34,40,0
    .goto 1412/1,-724.69,-2343.49,40,0
    .goto 1412/1,-796.70,-2351.69,40,0
    .goto 1412/1,-890.85,-2369.74,40,0
    .goto 1412/1,-908.70,-2373.02,40,0
    .goto 1412/1,-931.47,-2380.82,40,0
    .goto 1412/1,-997.32,-2404.61,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Morin Cloudstalker|r. |cRXP_WARN_This NPC walks a patrol route|r
    .turnin 98427 >>Turn in Ceasing Operations
    .unitscan Morin Cloudstalker
    .isOnQuest 98427
step
    #loop
    .goto 1412/1,-997.32,-2404.61,0
    .goto 1412/1,-997.32,-2404.61,40,0
    .goto 1412/1,-931.47,-2380.82,40,0
    .goto 1412/1,-908.70,-2373.02,40,0
    .goto 1412/1,-890.85,-2369.74,40,0
    .goto 1412/1,-796.70,-2351.69,40,0
    .goto 1412/1,-724.69,-2343.49,40,0
    .goto 1412/1,-679.77,-2337.34,40,0
    .goto 1412/1,-624.99,-2318.47,40,0
    .goto 1412/1,-598.53,-2302.06,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Morin Cloudstalker|r. |cRXP_WARN_This NPC walks a patrol route|r
    .turnin 98424 >>Turn in Fizsprocket's Notes
    .unitscan Morin Cloudstalker
    .isQuestComplete 98424
step << Tauren
    .goto 1412/1,-445.29,-2341.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mull Thunderhorn|r
    .turnin 760 >>Turn in Wildmane Cleansing
    .target Mull Thunderhorn
    .isOnQuest 760
step << Shaman
    .goto 1412/1,-437.61,-2298.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Narm|r
    .train 547 >> Train your class spells
    .target Narm Skychaser
    .xp <12,1
step << Druid
    .goto 1412/1,-442.74,-2315.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gennia|r
    .train 8936 >>Train your class spells
    .target Gennia Runetotem
    .xp <12,1
step << Warrior
    .goto 1412/1,-496.17,-2347.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krang|r
    .train 7384 >> Train your class spells
    .target Krang Stonehoof
    .xp <12,1
step << Hunter
    .goto 1412/1,-408.32,-2180.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yaw|r
    .train 14281 >> Train your class spells
    .target Yaw Sharpmane
    .xp <12,1
step << Shaman
    #completewith next
    .zone 1456 >>Travel to Thunder Bluff
    .zoneskip 1456
step << Shaman
    .goto 1456/1,103.03,-1307.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Boarton Shadetotem|r
    .accept 76240 >>Accept Stalk With The Earthmother
    .target Boarton Shadetotem
step
    .goto 1456/1,-69.19,-1172.80,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kah Mistrunner|r
    .train 7734 >>Train |T136245:0|t[Fishing]
    .target Kah Mistrunner
step << Shaman
    .goto 1456/1,103.03,-1307.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Boarton Shadetotem|r
    >>|cRXP_WARN_The database has no objectives for Stalk With The Earthmother. Skip this step if the quest is not finished|r
    .turnin 76240 >>Turn in Stalk With The Earthmother
    .target Boarton Shadetotem
    .isOnQuest 76240
step << Shaman
    .xp 10 >>Grind to level 10 (Call of Fire needs it)
step << Shaman
    .goto 1456/1,254.06,-992.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Xanis Flameweaver|r
    .accept 1523 >>Accept Call of Fire
    .target Xanis Flameweaver
step
    +|cRXP_WARN_That is all of Mulgore for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Durotar|r: Call of Earth << Shaman
    >>|cRXP_FRIENDLY_Durotar|r: Speak with Un'thuwa << Mage
    >>|cRXP_FRIENDLY_Durotar|r: The Hunter's Path << Orc Hunter/Troll Hunter
    >>|cRXP_FRIENDLY_Moonglade|r: Moonglade << Tauren Druid
    >>|cRXP_FRIENDLY_Moonglade|r: Moonglade << Skyborne Druid
    >>|cRXP_FRIENDLY_Orgrimmar|r: Hex of Weakness << Troll Priest
    >>|cRXP_FRIENDLY_Orgrimmar|r: Welcome to Azeroth << Skyborne
    >>|cRXP_FRIENDLY_The Barrens|r: Sergra Darkthorn, The Barrens Oases
    >>|cRXP_FRIENDLY_The Barrens|r: Veteran Uzzek << Warrior
    >>|cRXP_FRIENDLY_The Barrens|r: Call of Fire << Shaman
    >>|cRXP_FRIENDLY_The Barrens|r: Return to Jahan << Tauren
    >>|cRXP_FRIENDLY_Undercity|r: Touch of Weakness << Undead Priest
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Traditions of the Bluff, Fizsprocket's Notes
step
    +|cRXP_WARN_Until level 13, suggested zones|r: |cRXP_FRIENDLY_The Barrens|r (about 3.2 levels of quests, starting around Sergra Darkthorn; 2 quests from here hand in there), |cRXP_FRIENDLY_Zephras Isle|r (about 2.9 levels of quests, starting around Valennia Stormfist), |cRXP_FRIENDLY_Durotar|r (about 1.7 levels of quests, starting around Orgnil Soulscar). Then come back to this Mulgore guide --RouteBuilder:next
step
    .xp 13 >>|cRXP_WARN_The rest of Mulgore is planned from level 13.|r Come back to this guide then
step
    #label RBSection2_1
    #completewith next
    +|cRXP_WARN_Mulgore: part 2|r (planned from level 13)
step
    #completewith next
    .zone 1456 >>Travel to Thunder Bluff
    .zoneskip 1456
step
    .goto 1456/1,232.77,-1019.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Clarice Foster|r
    .accept 264 >>Accept Until Death Do Us Part
    .target Clarice Foster
step
    #completewith next
    .zone 1412 >>Leave Thunder Bluff for Mulgore
    .zoneskip 1412
step
    .goto 1412/1,-496.37,-2348.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krang Stonehoof|r
    .turnin 99108 >>Turn in Sparring Match
    .target Krang Stonehoof
    .isOnQuest 99108
step
    #loop
    .goto 1412/1,-598.53,-2302.06,0
    .goto 1412/1,-598.53,-2302.06,40,0
    .goto 1412/1,-624.99,-2318.47,40,0
    .goto 1412/1,-679.77,-2337.34,40,0
    .goto 1412/1,-724.69,-2343.49,40,0
    .goto 1412/1,-796.70,-2351.69,40,0
    .goto 1412/1,-890.85,-2369.74,40,0
    .goto 1412/1,-908.70,-2373.02,40,0
    .goto 1412/1,-931.47,-2380.82,40,0
    .goto 1412/1,-997.32,-2404.61,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Morin Cloudstalker|r. |cRXP_WARN_This NPC walks a patrol route|r
    .turnin 98424 >>Turn in Fizsprocket's Notes
    .unitscan Morin Cloudstalker
    .isQuestComplete 98424
step
    #completewith next
    .zone 1456 >>Travel to Thunder Bluff
    .zoneskip 1456
step
    .goto 1456/1,-36.73,-1461.22
    >>Click the |cRXP_PICK_Incense Burner|r
    .complete 97485,1 --Incense Burner
    .isOnQuest 97485
step << Orc Warrior/Orc Shaman/Orc Druid/Tauren Warrior/Tauren Shaman/Tauren Druid/Troll Warrior/Troll Shaman/Troll Druid
    .goto 1456/1,103.03,-1307.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Boarton Shadetotem|r
    .turnin 76156 >>Turn in Stalk With The Earthmother
    .target Boarton Shadetotem
    .isOnQuest 76156
step << Orc/Tauren/Troll
    .goto 1456/1,103.03,-1307.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Boarton Shadetotem|r
    .turnin 76160 >>Turn in Stalk With The Earthmother
    .target Boarton Shadetotem
    .isOnQuest 76160
step
    .goto 1456/1,120.04,-1238.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eylah Sunhorn|r
    .turnin 97485 >>Turn in Traditions of the Bluff
    .target Eylah Sunhorn
    .isQuestComplete 97485
step << Shaman
    .goto 1456/1,103.03,-1307.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Boarton Shadetotem|r
    .turnin 76240 >>Turn in Stalk With The Earthmother
    .target Boarton Shadetotem
    .isOnQuest 76240
step
    +|cRXP_WARN_That is all of Mulgore for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Silverpine Forest|r: Until Death Do Us Part
step << Undead Mage/Troll Mage/Tauren Druid
    +|cRXP_WARN_Until level 16, suggested zones|r: |cRXP_FRIENDLY_The Barrens|r (about 1.8 levels of quests, starting around Gazlowe), |cRXP_FRIENDLY_Silverpine Forest|r (about 1.0 levels of quests, starting around High Executor Hadrec; 1 quest from here hands in there). Then come back to this Mulgore guide --RouteBuilder:next
step << Undead Mage/Troll Mage/Tauren Druid
    .xp 16 >>|cRXP_WARN_The rest of Mulgore is planned from level 16.|r Come back to this guide then
step
    #label RBSection3_1
    #completewith next
    +|cRXP_WARN_Mulgore: part 3|r (planned from level 16)
step
    #completewith next
    .zone 1456 >>Travel to Thunder Bluff
    .zoneskip 1456
step << Undead Mage/Troll Mage
    .goto 1456/1,253.85,-995.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thurston Xane|r
    .accept 1959 >>Accept Report to Anastasia
    .target Thurston Xane
step << Tauren Druid
    .goto 1456/1,-281.59,-1039.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Turak Runetotem|r
    .accept 6126 >>Accept Lessons Anew
    .target Turak Runetotem
step
    #completewith next
    .zone 1412 >>Leave Thunder Bluff for Mulgore
    .zoneskip 1412
step
    .goto 1412/1,-496.37,-2348.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krang Stonehoof|r
    .turnin 99108 >>Turn in Sparring Match
    .target Krang Stonehoof
    .isOnQuest 99108
step
    #loop
    .goto 1412/1,-598.53,-2302.06,0
    .goto 1412/1,-598.53,-2302.06,40,0
    .goto 1412/1,-624.99,-2318.47,40,0
    .goto 1412/1,-679.77,-2337.34,40,0
    .goto 1412/1,-724.69,-2343.49,40,0
    .goto 1412/1,-796.70,-2351.69,40,0
    .goto 1412/1,-890.85,-2369.74,40,0
    .goto 1412/1,-908.70,-2373.02,40,0
    .goto 1412/1,-931.47,-2380.82,40,0
    .goto 1412/1,-997.32,-2404.61,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Morin Cloudstalker|r. |cRXP_WARN_This NPC walks a patrol route|r
    .turnin 98424 >>Turn in Fizsprocket's Notes
    .unitscan Morin Cloudstalker
    .isQuestComplete 98424
step
    #completewith next
    .zone 1456 >>Travel to Thunder Bluff
    .zoneskip 1456
step
    .goto 1456/1,-36.73,-1461.22
    >>Click the |cRXP_PICK_Incense Burner|r
    .complete 97485,1 --Incense Burner
    .isOnQuest 97485
step << Orc Warrior/Orc Shaman/Orc Druid/Tauren Warrior/Tauren Shaman/Tauren Druid/Troll Warrior/Troll Shaman/Troll Druid
    .goto 1456/1,103.03,-1307.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Boarton Shadetotem|r
    .turnin 76156 >>Turn in Stalk With The Earthmother
    .target Boarton Shadetotem
    .isOnQuest 76156
step << Orc/Tauren/Troll
    .goto 1456/1,103.03,-1307.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Boarton Shadetotem|r
    .turnin 76160 >>Turn in Stalk With The Earthmother
    .target Boarton Shadetotem
    .isOnQuest 76160
step
    .goto 1456/1,120.04,-1238.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eylah Sunhorn|r
    .turnin 97485 >>Turn in Traditions of the Bluff
    .target Eylah Sunhorn
    .isQuestComplete 97485
step
    .goto 1456/1,-212.39,-1065.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magatha Grimtotem|r
    .accept 1064 >>Accept Forsaken Aid
    .target Magatha Grimtotem
    .isQuestTurnedIn 1063 --any of: The Elder Crone
    .xp <13,1
step
    .goto 1456/1,278.59,-995.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Zamah|r
    .accept 1086 >>Accept The Flying Machine Airport
    .target Apothecary Zamah
    .isQuestTurnedIn 1067 --any of: Return to Thunder Bluff
    .xp <13,1
step
    .goto 1456/1,278.59,-995.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Zamah|r
    .turnin 1064 >>Turn in Forsaken Aid
    .target Apothecary Zamah
    .isOnQuest 1064
step
    .goto 1456/1,278.59,-995.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Zamah|r
    .accept 1065 >>Accept Journey to Tarren Mill
    .target Apothecary Zamah
    .isQuestTurnedIn 1064 --any of: Forsaken Aid
    .xp <13,1
step << Paladin
    .goto 1456/1,253.900,-950.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alodan|r
    .train 1866 >>Train your class spells
    .target Alodan the Hopeful
    .xp <20,1
    .xp >22,1
step << Paladin
    .goto 1456/1,253.900,-950.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alodan|r
    .train 1026 >>Train your class spells
    .target Alodan the Hopeful
    .xp <22,1
step
    .goto 1456/1,254.06,-995.78
    .trainer >> Train your class spells if needed
    >>Respec to Frost AoE if you haven't already
step
    .goto 1456/1,278.59,-995.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Zamah|r
    .turnin 1086 >>Turn in The Flying Machine Airport
    .target Apothecary Zamah
    .isQuestComplete 1086
step << Shaman
    .goto 1456/1,103.03,-1307.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Boarton Shadetotem|r
    .turnin 76240 >>Turn in Stalk With The Earthmother
    .target Boarton Shadetotem
    .isOnQuest 76240
step
    +|cRXP_WARN_That is all of Mulgore for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Hillsbrad Foothills|r: Journey to Tarren Mill
    >>|cRXP_FRIENDLY_Moonglade|r: Lessons Anew << Tauren Druid
    >>|cRXP_FRIENDLY_Undercity|r: Report to Anastasia << Undead Mage/Troll Mage
step << Tauren Druid
    +|cRXP_WARN_Until level 19, suggested zones|r: |cRXP_FRIENDLY_The Barrens|r (about 0.6 levels of quests, starting around Sergra Darkthorn). Then come back to this Mulgore guide --RouteBuilder:next
step << Tauren Druid
    .xp 19 >>|cRXP_WARN_The rest of Mulgore is planned from level 19.|r Come back to this guide then
step
    #label RBSection4_1
    #completewith next
    +|cRXP_WARN_Mulgore: part 4|r (planned from level 19)
step << Tauren Druid
    #completewith next
    .zone 1456 >>Travel to Thunder Bluff
    .zoneskip 1456
step << Priest
    .goto 1456/1,252.49,-956.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Miles|r
    .trainer >> Train your class spells
    .target Miles Welsh
step << Mage
    .goto 1456/1,279.32,-950.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shymm|r
    .train 12051 >> Train your class spells
    .target Archmage Shymm
    .xp <20,1
    .xp >22,1
step << Mage
    .goto 1456/1,279.32,-950.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shymm|r
    .train 2138 >> Train your class spells
    .target Archmage Shymm
    .xp <22,1
step << Shaman
    .goto 1456/1,269.92,-980.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tigor|r
    .train 2645 >> Train your class spells
    .target Tigor Skychaser
    .xp <20,1
    .xp >22,1
step << Shaman
    .goto 1456/1,269.92,-980.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tigor|r
    .train 8498 >> Train your class spells
    .target Tigor Skychaser
    .xp <22,1
step
    .goto 1456/1,206.88,-997.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to|r |cRXP_FRIENDLY_Pand|r
    >>|cRXP_WARN_Skip this step if you did not have enough|r |T132889:0|t[Linen Cloth] |cRXP_WARN_to reach 80 skill|r
    .train 3277 >> Train |T133684:0|t[Wool Bandage]
    .train 7934 >> Train |T134437:0|t[Anti-Venom] << Rogue
    .target Pand Stonebinder
step << Tauren Druid
    .goto 1456/1,-281.59,-1039.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Turak Runetotem|r
    .accept 27 >>Accept A Lesson to Learn
    .target Turak Runetotem
step << Druid
    .goto 1456/1,-281.59,-1039.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Turak|r
    .trainer >> Train your class spells
    .target Turak Runetotem
step << Hunter
    .goto 1456/1,-100.50,-1454.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Urek|r
    .train 5118 >> Train your class spells
    .target Urek Thunderhorn
    .xp <20,1
    .xp >22,1
step << Hunter
    .goto 1456/1,-100.50,-1454.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Urek|r
    .train 5118 >> Train your class spells
    .target Urek Thunderhorn
    .xp <22,1
step << Hunter
    .goto 1456/1,-47.69,-1434.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hesuwa|r
    .train 24494 >> Train your pet spells
    .target Hesuwa Thunderhorn
step << Warrior
    .goto 1456/1,-81.09,-1457.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torm|r
    .train 845 >>Train your class spells
    .target Torm Ragetotem
step << Tauren Druid
    #completewith next
    .zone 1412 >>Leave Thunder Bluff for Mulgore
    .zoneskip 1412
step
    .goto 1412/1,-496.37,-2348.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krang Stonehoof|r
    .turnin 99108 >>Turn in Sparring Match
    .target Krang Stonehoof
    .isOnQuest 99108
step
    #loop
    .goto 1412/1,-598.53,-2302.06,0
    .goto 1412/1,-598.53,-2302.06,40,0
    .goto 1412/1,-624.99,-2318.47,40,0
    .goto 1412/1,-679.77,-2337.34,40,0
    .goto 1412/1,-724.69,-2343.49,40,0
    .goto 1412/1,-796.70,-2351.69,40,0
    .goto 1412/1,-890.85,-2369.74,40,0
    .goto 1412/1,-908.70,-2373.02,40,0
    .goto 1412/1,-931.47,-2380.82,40,0
    .goto 1412/1,-997.32,-2404.61,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Morin Cloudstalker|r. |cRXP_WARN_This NPC walks a patrol route|r
    .turnin 98424 >>Turn in Fizsprocket's Notes
    .unitscan Morin Cloudstalker
    .isQuestComplete 98424
step
    #completewith next
    .zone 1456 >>Travel to Thunder Bluff
    .zoneskip 1456
step
    .goto 1456/1,-36.73,-1461.22
    >>Click the |cRXP_PICK_Incense Burner|r
    .complete 97485,1 --Incense Burner
    .isOnQuest 97485
step << Orc Warrior/Orc Shaman/Orc Druid/Tauren Warrior/Tauren Shaman/Tauren Druid/Troll Warrior/Troll Shaman/Troll Druid
    .goto 1456/1,103.03,-1307.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Boarton Shadetotem|r
    .turnin 76156 >>Turn in Stalk With The Earthmother
    .target Boarton Shadetotem
    .isOnQuest 76156
step << Orc/Tauren/Troll
    .goto 1456/1,103.03,-1307.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Boarton Shadetotem|r
    .turnin 76160 >>Turn in Stalk With The Earthmother
    .target Boarton Shadetotem
    .isOnQuest 76160
step
    .goto 1456/1,120.04,-1238.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eylah Sunhorn|r
    .turnin 97485 >>Turn in Traditions of the Bluff
    .target Eylah Sunhorn
    .isQuestComplete 97485
step << Shaman
    .goto 1456/1,103.03,-1307.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Boarton Shadetotem|r
    .turnin 76240 >>Turn in Stalk With The Earthmother
    .target Boarton Shadetotem
    .isOnQuest 76240
step
    +|cRXP_WARN_That is all of Mulgore for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Moonglade|r: A Lesson to Learn << Tauren Druid
step
    +|cRXP_WARN_Until level 22, suggested zones|r: |cRXP_FRIENDLY_The Barrens|r (about 1.3 levels of quests, starting around Tonga Runetotem). Then come back to this Mulgore guide --RouteBuilder:next
step
    .xp 22 >>|cRXP_WARN_The rest of Mulgore is planned from level 22.|r Come back to this guide then
step
    #label RBSection5_1
    #completewith next
    +|cRXP_WARN_Mulgore: part 5|r (planned from level 22)
step
    #completewith next
    .zone 1456 >>Travel to Thunder Bluff
    .zoneskip 1456
step << Warrior
    .goto 1456/1,-80.78,-1457.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torm Ragetotem|r
    .accept 1823 >>Accept Speak with Ruga
    .target Torm Ragetotem
step
    .goto 1456/1,-125.66,-1413.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Melor Stonehoof|r
    .accept 1131 >>Accept Steelsnap
    .target Melor Stonehoof
step
    .goto 1456/1,254.06,-995.78
    .trainer >> Train your class spells
    >>Don't respec to AoE yet (if you've gone fire spec)
step
    .goto 1456/1,26.07,-1196.75
    .fp Thunder Bluff >> Get the Thunder Bluff flight path
    .fly Crossroads >>Fly to Crossroads
step
    .goto 1456/1,-125.66,-1413.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Melor Stonehoof|r
    .turnin 1131 >>Turn in Steelsnap
    .target Melor Stonehoof
    .isQuestComplete 1131
step
    #loop
    .goto 1456/1,-99.15,-1215.31,0
    .goto 1456/1,-99.15,-1215.31,40,0
    .goto 1456/1,-86.62,-1227.84,40,0
    .goto 1456/1,-74.10,-1278.63,40,0
    .goto 1456/1,-2.08,-1284.20,40,0
    .goto 1456/1,8.36,-1317.60,40,0
    .goto 1456/1,62.64,-1299.51,40,0
    .goto 1456/1,82.88,-1229.44,40,0
    .goto 1456/1,85.39,-1276.75,40,0
    .goto 1456/1,95.30,-1217.05,40,0
    .goto 1456/1,137.37,-1231.18,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bluff Runner Windstrider|r. |cRXP_WARN_This NPC walks a patrol route|r
    .accept 742 >>Accept The Ashenvale Hunt
    .unitscan Bluff Runner Windstrider
step
    .goto 1456/1,-57.08,-1207.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zangen Stonehoof|r
    .accept 1195 >>Accept The Sacred Flame
    .target Zangen Stonehoof
step
    .goto 1456/1,-48.42,-1177.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tah Winterhoof|r
    .accept 97538 >>Accept Pigments for Paints
    .target Tah Winterhoof
step
    .goto 1456/1,-57.08,-1207.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zangen Stonehoof|r
    .turnin 1195 >>Turn in The Sacred Flame
    .target Zangen Stonehoof
    .isQuestComplete 1195
step
    .goto 1456/1,-57.08,-1207.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zangen Stonehoof|r
    .accept 1196 >>Accept The Sacred Flame
    .target Zangen Stonehoof
    .isQuestTurnedIn 1195 --any of: The Sacred Flame
    .xp <20,1
step
    .goto 1456/1,-48.42,-1177.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tah Winterhoof|r
    .turnin 97538 >>Turn in Pigments for Paints
    .target Tah Winterhoof
    .isQuestComplete 97538
step << Shaman
    .goto 1456/1,254.06,-992.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Xanis Flameweaver|r
    .accept 1529 >>Accept Call of Water
    .target Xanis Flameweaver
step << Tauren Druid/Skyborne Druid
    .goto 1456/1,-281.59,-1039.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Turak Runetotem|r
    .accept 98340 >>Accept The Great Cat Spirit
    .target Turak Runetotem
step << Undead Warrior/Orc Warrior/Troll Warrior/Troll Shaman/Orc Shaman
    .goto 1456/1,89.46,-1286.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ansekhwa|r
    .train 199 >>Train Two-Handed Maces
    .train 227 >>Train Staves
    .target Ansekhwa
step << Troll Hunter/Orc Hunter/Undead Warrior/Warlock/Priest
    .goto 1456/1,89.46,-1286.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ansekhwa|r
    .train 227 >>Train Staves
    .target Ansekhwa
step << Rogue !Skyborne
    .goto 1456/1,89.46,-1286.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ansekhwa|r
    .train 198 >>Train Maces
    .target Ansekhwa
step
    .goto 1456/1,252.39,-956.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Miles Welsh|r
    .accept 5644 >>Accept Devouring Plague << Undead Priest
    .accept 5642 >>Accept Shadowguard << Troll Priest
    .target Miles Welsh
step
    #completewith next
    .zone 1412 >>Leave Thunder Bluff for Mulgore
    .zoneskip 1412
step
    .goto 1412/1,-496.37,-2348.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krang Stonehoof|r
    .turnin 99108 >>Turn in Sparring Match
    .target Krang Stonehoof
    .isOnQuest 99108
step
    #loop
    .goto 1412/1,-598.53,-2302.06,0
    .goto 1412/1,-598.53,-2302.06,40,0
    .goto 1412/1,-624.99,-2318.47,40,0
    .goto 1412/1,-679.77,-2337.34,40,0
    .goto 1412/1,-724.69,-2343.49,40,0
    .goto 1412/1,-796.70,-2351.69,40,0
    .goto 1412/1,-890.85,-2369.74,40,0
    .goto 1412/1,-908.70,-2373.02,40,0
    .goto 1412/1,-931.47,-2380.82,40,0
    .goto 1412/1,-997.32,-2404.61,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Morin Cloudstalker|r. |cRXP_WARN_This NPC walks a patrol route|r
    .turnin 98424 >>Turn in Fizsprocket's Notes
    .unitscan Morin Cloudstalker
    .isQuestComplete 98424
step
    #completewith next
    .zone 1456 >>Travel to Thunder Bluff
    .zoneskip 1456
step
    .goto 1456/1,-36.73,-1461.22
    >>Click the |cRXP_PICK_Incense Burner|r
    .complete 97485,1 --Incense Burner
    .isOnQuest 97485
step << Orc Warrior/Orc Shaman/Orc Druid/Tauren Warrior/Tauren Shaman/Tauren Druid/Troll Warrior/Troll Shaman/Troll Druid
    .goto 1456/1,103.03,-1307.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Boarton Shadetotem|r
    .turnin 76156 >>Turn in Stalk With The Earthmother
    .target Boarton Shadetotem
    .isOnQuest 76156
step << Orc/Tauren/Troll
    .goto 1456/1,103.03,-1307.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Boarton Shadetotem|r
    .turnin 76160 >>Turn in Stalk With The Earthmother
    .target Boarton Shadetotem
    .isOnQuest 76160
step << Warrior
    .goto 1456/1,109.71,-1239.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Orm Stonehoof|r
    .accept 1845 >>Accept Brutal Helm
    .target Orm Stonehoof
    .isQuestTurnedIn 1844 --any of: Chimaeric Horn
    .xp <20,1
step << Warrior
    .goto 1456/1,109.71,-1239.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Orm Stonehoof|r
    .turnin 1845 >>Turn in Brutal Helm
    .target Orm Stonehoof
    .isOnQuest 1845
step << Warrior
    .goto 1456/1,109.71,-1239.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Orm Stonehoof|r
    .accept 1844 >>Accept Chimaeric Horn
    .target Orm Stonehoof
    .isQuestTurnedIn 1848 --any of: Brutal Hauberk
    .xp <20,1
step
    .goto 1456/1,120.04,-1238.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eylah Sunhorn|r
    .turnin 97485 >>Turn in Traditions of the Bluff
    .target Eylah Sunhorn
    .isQuestComplete 97485
step << Warrior
    .goto 1456/1,109.71,-1239.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Orm Stonehoof|r
    .turnin 1844 >>Turn in Chimaeric Horn
    .target Orm Stonehoof
    .isQuestComplete 1844
step << Shaman
    .goto 1456/1,103.03,-1307.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Boarton Shadetotem|r
    .turnin 76240 >>Turn in Stalk With The Earthmother
    .target Boarton Shadetotem
    .isOnQuest 76240
step
    +|cRXP_WARN_That is all of Mulgore for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Ashenvale|r: The Ashenvale Hunt
    >>|cRXP_FRIENDLY_Moonglade|r: The Great Cat Spirit << Tauren Druid/Skyborne Druid
    >>|cRXP_FRIENDLY_Orgrimmar|r: Shadowguard << Troll Priest
    >>|cRXP_FRIENDLY_The Barrens|r: Call of Water << Shaman
    >>|cRXP_FRIENDLY_The Barrens|r: Speak with Ruga << Warrior
    >>|cRXP_FRIENDLY_Thousand Needles|r: The Sacred Flame
    >>|cRXP_FRIENDLY_Undercity|r: Devouring Plague << Undead Priest
    >>|cRXP_FRIENDLY_Ashenvale and back here|r: The Sacred Flame
    >>|cRXP_FRIENDLY_Stonetalon Mountains and back here|r: Pigments for Paints
    >>|cRXP_FRIENDLY_Thousand Needles and back here|r: Steelsnap
step
    +|cRXP_WARN_End of the Mulgore route.|r
step
    +|cRXP_WARN_Suggested next zones at level 22|r: |cRXP_FRIENDLY_Ashenvale|r (about 0.5 levels of quests, starting around Karang Amakkar). Completing this step loads the guide for Ashenvale --RouteBuilder:next
]])
