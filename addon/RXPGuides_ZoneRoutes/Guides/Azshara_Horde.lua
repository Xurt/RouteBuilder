-- 47-57 Azshara: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 3 parts with a level check between them (from level 47, 50, 56).
-- Edit zones/Azshara.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#name 47-57 Azshara

step
    .goto 1447/1,-3853.64,2698.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loh'atu|r
    .accept 5535 >>Accept Spiritual Unrest
    .accept 5536 >>Accept A Land Filled with Hatred
    .target Loh'atu
step
    #loop
    .goto 1447/1,-4275.53,3183.08,0
    .goto 1447/1,-4275.53,3183.08,40,0
    .goto 1447/1,-4311.53,3188.15,40,0
    .goto 1447/1,-4341.45,3252.39,40,0
    .goto 1447/1,-4357.17,3298.04,40,0
    .goto 1447/1,-4321.17,3287.56,40,0
    .goto 1447/1,-4285.67,3282.15,40,0
    .goto 1447/1,-4304.94,3237.51,40,0
    .goto 1447/1,-4279.08,3239.88,40,0
    .goto 1447/1,-4251.70,3222.64,40,0
    >>Kill |cRXP_ENEMY_Haldarr Satyrs|r
    >>Kill |cRXP_ENEMY_Haldarr Tricksters|r
    >>Kill |cRXP_ENEMY_Haldarr Felsworns|r
    .complete 5536,1 --Haldarr Satyr slain (6)
    .complete 5536,2 --Haldarr Trickster slain (2)
    .complete 5536,3 --Haldarr Felsworn slain (2)
    .mob Haldarr Satyr
    .mob Haldarr Trickster
    .mob Haldarr Felsworn
step
    #loop
    .goto 1447/1,-4145.21,3114.78,0
    .goto 1447/1,-4145.21,3114.78,40,0
    .goto 1447/1,-4176.65,3082.32,40,0
    .goto 1447/1,-4153.32,3023.82,40,0
    .goto 1447/1,-4184.26,3013.68,40,0
    .goto 1447/1,-4182.23,2976.14,40,0
    .goto 1447/1,-4152.82,2950.78,40,0
    .goto 1447/1,-4120.87,2918.66,40,0
    .goto 1447/1,-4117.32,2995.08,40,0
    .goto 1447/1,-4113.77,3051.55,40,0
    >>Kill |cRXP_ENEMY_Highborne Apparitions|r
    >>Kill |cRXP_ENEMY_Highborne Lichlings|r
    .complete 5535,1 --Highborne Apparition slain (6)
    .complete 5535,2 --Highborne Lichling slain (6)
    .mob Highborne Apparition
    .mob Highborne Lichling
step
    .goto 1447/1,-3853.64,2698.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loh'atu|r
    .turnin 5535 >>Turn in Spiritual Unrest
    .turnin 5536 >>Turn in A Land Filled with Hatred
    .target Loh'atu
step
    .goto 1447/1,-4392.67,3661.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kroum|r
    .fp Azshara >>Get the Azshara Flight Path
    .target Kroum
step
    .goto 1447/1,-4405.85,3601.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ag'tor Bloodfist|r
    .turnin 3504 >>Turn in Betrayed
    .target Ag'tor Bloodfist
    .isOnQuest 3504
step
    .goto 1447/1,-4421.06,3603.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jediga|r
    .turnin 3564 >>Turn in Andron's Payment to Jediga
    .target Jediga
    .isOnQuest 3564
step
    .goto 1447/1,-4421.06,3603.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jediga|r
    .turnin 3563 >>Turn in Jes'rimon's Payment to Jediga
    .target Jediga
    .isOnQuest 3563
step
    .goto 1447/1,-4421.06,3603.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jediga|r
    .turnin 3562 >>Turn in Magatha's Payment to Jediga
    .target Jediga
    .isOnQuest 3562
step << Rogue
    #loop
    .goto 1447/1,-5377.42,4605.91,0
    .goto 1447/1,-5377.42,4605.91,40,0
    .goto 1447/1,-5371.84,4660.01,40,0
    .goto 1447/1,-5344.46,4679.96,40,0
    .goto 1447/1,-5394.16,4701.93,40,0
    .goto 1447/1,-5447.91,4717.83,40,0
    >>Kill |cRXP_ENEMY_Timbermaw Shaman|r and loot |cRXP_LOOT_Sealed Azure Bag|r
    .complete 8234,1 --Sealed Azure Bag (1)
    .mob Timbermaw Shaman
    .isOnQuest 8234
step << Rogue
    .goto 1447/1,-4760.30,3982.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Xylem|r
    .turnin 8234 >>Turn in Sealed Azure Bag
    .target Archmage Xylem
    .isOnQuest 8234
step
    .goto 1447/1,-6361.16,3098.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loramus Thalipedes|r
    .complete 2744,1 --Loramus Thalipedes
    .target Loramus Thalipedes
    .isOnQuest 2744
step
    .goto 1447/1,-6361.16,3098.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loramus Thalipedes|r
    .turnin 2744 >>Turn in The Demon Hunter
    .target Loramus Thalipedes
    .isOnQuest 2744
step << Hunter
    .goto 1447/1,-5427.12,3900.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ogtinc|r
    .turnin 8151 >>Turn in The Hunter's Charm
    .target Ogtinc
    .isOnQuest 8151
step << Mage
    .goto 1447/1,-4702.49,3648.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sanath Lim-yo|r
    .turnin 8250 >>Turn in Magecraft
    .target Sanath Lim-yo
    .isOnQuest 8250
step << Priest
    .goto 1447/1,-5427.12,3900.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ogtinc|r
    .turnin 8254 >>Turn in Cenarion Aid
    .target Ogtinc
    .isOnQuest 8254
step
    .xp 50 >>|cRXP_WARN_The rest of Azshara is planned from level 50.|r Come back to this guide then
step
    .goto 1447/1,-4405.85,3601.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ag'tor Bloodfist|r
    .accept 3505 >>Accept Betrayed
    .target Ag'tor Bloodfist
    .isQuestTurnedIn 3504 --any of: Betrayed
    .xp <44,1
step
    .goto 1447/1,-4421.06,3603.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jediga|r
    .accept 3517 >>Accept Stealing Knowledge
    .target Jediga
step << Mage
    .goto 1447/1,-4760.30,3982.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Xylem|r
    .accept 8251 >>Accept Magic Dust
    .target Archmage Xylem
step
    .goto 1447/1,-5987.44,4603.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kim'jael|r
    .accept 3601 >>Accept Kim'jael Indeed!
    .target Kim'jael
step << Mage
    #loop
    .goto 1447/1,-6083.79,4447.33,0
    .goto 1447/1,-6083.79,4447.33,40,0
    .goto 1447/1,-6148.70,4480.46,40,0
    .goto 1447/1,-6215.63,4447.33,40,0
    .goto 1447/1,-6219.18,4388.83,40,0
    .goto 1447/1,-6279.02,4375.64,40,0
    .goto 1447/1,-6230.34,4288.07,40,0
    .goto 1447/1,-6107.62,4300.92,40,0
    .goto 1447/1,-6136.53,4366.18,40,0
    .goto 1447/1,-6154.78,4419.26,40,0
    >>Kill |cRXP_ENEMY_Blood Elf Surveyors|r and |cRXP_ENEMY_Blood Elf Reclaimers|r. Loot them for |cRXP_LOOT_Glittering Dust|r
    .complete 8251,1 --Glittering Dust (10)
    .mob Blood Elf Surveyor
    .mob Blood Elf Reclaimer
step
    #loop
    .goto 1447/1,-6154.78,4419.26,0
    .goto 1447/1,-6154.78,4419.26,40,0
    .goto 1447/1,-6148.70,4480.46,40,0
    .goto 1447/1,-6080.75,4408.78,40,0
    .goto 1447/1,-6136.53,4366.18,40,0
    .goto 1447/1,-6096.47,4322.90,40,0
    .goto 1447/1,-6162.39,4312.75,40,0
    .goto 1447/1,-6214.11,4312.41,40,0
    .goto 1447/1,-6279.02,4375.64,40,0
    .goto 1447/1,-6220.19,4411.48,40,0
    >>Kill |cRXP_ENEMY_Blood Elf Reclaimers|r
    .complete 3505,1 --Blood Elf Reclaimer slain (10)
    .mob Blood Elf Reclaimer
    .isOnQuest 3505
step
    #loop
    .goto 1447/1,-6152.75,4393.23,0
    .goto 1447/1,-6152.75,4393.23,40,0
    .goto 1447/1,-6215.63,4447.33,40,0
    .goto 1447/1,-6257.72,4414.87,40,0
    .goto 1447/1,-6256.70,4378.35,40,0
    .goto 1447/1,-6219.18,4388.83,40,0
    .goto 1447/1,-6124.86,4330.33,40,0
    .goto 1447/1,-6107.62,4300.92,40,0
    .goto 1447/1,-6089.37,4344.20,40,0
    >>Kill |cRXP_ENEMY_Blood Elf Surveyors|r
    .complete 3505,2 --Blood Elf Surveyor slain (10)
    .mob Blood Elf Surveyor
    .isOnQuest 3505
step
    .goto 1447/1,-6295.75,4277.59
    >>Find Magus Rimtori's camp
    .complete 3505,3 --Find Magus Rimtori's camp
    .isOnQuest 3505
step
    .goto 1447/1,-6294.74,4283.34
    >>Click the |cRXP_PICK_Kaldorei Tome of Summoning|r
    .turnin 3505 >>Turn in Betrayed
    .isOnQuest 3505
step
    #loop
    .goto 1447/1,-6263.80,4381.39,0
    .goto 1447/1,-6263.80,4381.39,40,0
    .goto 1447/1,-6213.10,4357.72,40,0
    .goto 1447/1,-6167.46,4330.67,40,0
    .goto 1447/1,-6121.82,4323.91,40,0
    .goto 1447/1,-6142.10,4367.87,40,0
    .goto 1447/1,-6167.46,4381.39,40,0
    .goto 1447/1,-6228.31,4405.06,40,0
    .goto 1447/1,-6243.52,4496.35,40,0
    .goto 1447/1,-6248.59,4462.54,40,0
    >>Open the |cRXP_PICK_Kim'jael's Equipment|r. Loot it for |cRXP_LOOT_Kim'Jael's Compass|r
    >>Open the |cRXP_PICK_Kim'jael's Equipment|r. Loot it for |cRXP_LOOT_Kim'Jael's Scope|r
    >>Open the |cRXP_PICK_Kim'jael's Equipment|r. Loot it for |cRXP_LOOT_Kim'Jael's Stuffed Chicken|r
    >>Open the |cRXP_PICK_Kim'jael's Equipment|r. Loot it for |cRXP_LOOT_Kim'Jael's Wizzlegoober|r
    .complete 3601,1 --Kim'Jael's Compass (1)
    .complete 3601,2 --Kim'Jael's Scope (1)
    .complete 3601,3 --Kim'Jael's Stuffed Chicken (1)
    .complete 3601,4 --Kim'Jael's Wizzlegoober (1)
step
    .goto 1447/1,-6106.61,4465.92,50,0
    .goto 1447/1,-6208.02,4449.02,50,0
    .goto 1447/1,-6218.17,4388.15,50,0
    .goto 1447/1,-6279.02,4340.82,50,0
    .goto 1447/1,-6213.10,4279.95,50,0
    .goto 1447/1,-6167.46,4317.15,50,0
    .goto 1447/1,-6162.39,4411.82,50,0
    .goto 1447/1,-6116.75,4337.44,50,0
    .goto 1447/1,-6086.32,4337.44,50,0
    .xp 53+95000 >> Grind to level 53 95000+/167100
    >>|cRXP_WARN_This is your last grinding spot needed before level 60. If you don't want to grind this much you can do a dungeon or two instead|r
step
    .goto 1447/1,-5987.44,4603.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kim'jael|r
    .turnin 3601 >>Turn in Kim'jael Indeed!
    .accept 5534 >>Accept Kim'jael's "Missing" Equipment
    .target Kim'jael
step << Mage
    .goto 1447/1,-4760.30,3982.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Xylem|r
    .turnin 8251 >>Turn in Magic Dust
    .accept 8252 >>Accept The Siren's Coral
    .target Archmage Xylem
step
    #completewith Along12
    >>As you go: Kill |cRXP_ENEMY_Spitelash Sirens|r, |cRXP_ENEMY_Spitelash Myrmidons|r, |cRXP_ENEMY_Spitelash Battlemasters|r and |cRXP_ENEMY_Spitelash Enchantress|r. Loot them for |cRXP_LOOT_Some Rune|r. |cRXP_WARN_Anything left is finished later|r
    .complete 5534,1 --Some Rune (1)
    .mob Spitelash Siren
    .mob Spitelash Myrmidon
    .mob Spitelash Battlemaster
    .mob Spitelash Enchantress
step << Mage
    #completewith Along12
    >>As you go: Kill |cRXP_ENEMY_Spitelash Sirens|r. Loot them for |cRXP_LOOT_Enchanted Coral|r. |cRXP_WARN_Anything left is finished later|r
    .complete 8252,1 --Enchanted Coral (6)
    .mob Spitelash Siren
step
    #label Along12
    #loop
    .goto 1447/1,-5156.84,3588.15,0
    .goto 1447/1,-5156.84,3588.15,40,0
    .goto 1447/1,-5153.29,3498.89,40,0
    .goto 1447/1,-5097.51,3346.73,40,0
    .goto 1447/1,-5198.93,3434.64,40,0
    .goto 1447/1,-5269.92,3394.07,40,0
    .goto 1447/1,-5274.99,3431.26,40,0
    .goto 1447/1,-5233.41,3494.83,40,0
    .goto 1447/1,-5250.14,3534.05,40,0
    >>Pick up |cRXP_PICK_Tablet of Beth'Amara|r from the ground
    >>Pick up |cRXP_PICK_Tablet of Jin'yael|r from the ground
    >>Pick up |cRXP_PICK_Tablet of Markri|r from the ground
    >>Pick up |cRXP_PICK_Tablet of Sael'hai|r from the ground
    .complete 3517,1 --Tablet of Beth'Amara (1)
    .complete 3517,2 --Tablet of Jin'yael (1)
    .complete 3517,3 --Tablet of Markri (1)
    .complete 3517,4 --Tablet of Sael'hai (1)
step
    #loop
    .goto 1447/1,-5492.53,3619.60,0
    .goto 1447/1,-5492.53,3619.60,40,0
    .goto 1447/1,-5553.89,3482.66,40,0
    .goto 1447/1,-5677.62,3408.61,40,0
    .goto 1447/1,-5781.57,3395.42,40,0
    .goto 1447/1,-5790.70,3521.54,40,0
    .goto 1447/1,-5747.59,3679.11,40,0
    .goto 1447/1,-5685.22,3551.97,40,0
    .goto 1447/1,-5616.26,3548.59,40,0
    .goto 1447/1,-5613.72,3624.67,40,0
    >>Kill |cRXP_ENEMY_Spitelash Sirens|r, |cRXP_ENEMY_Spitelash Myrmidons|r, |cRXP_ENEMY_Spitelash Battlemasters|r and |cRXP_ENEMY_Spitelash Enchantress|r. Loot them for |cRXP_LOOT_Some Rune|r
    >>Kill |cRXP_ENEMY_Spitelash Sirens|r. Loot them for |cRXP_LOOT_Enchanted Coral|r << Mage
    .complete 5534,1 --Some Rune (1)
    .complete 8252,1 << Mage --Enchanted Coral (6)
    .mob Spitelash Siren
    .mob Spitelash Myrmidon
    .mob Spitelash Battlemaster
    .mob Spitelash Enchantress
step
    .goto 1447/1,-5987.44,4603.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kim'jael|r
    .turnin 5534 >>Turn in Kim'jael's "Missing" Equipment
    .target Kim'jael
step
    .goto 1447/1,-4421.06,3603.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jediga|r
    .turnin 3517 >>Turn in Stealing Knowledge
    .accept 3561 >>Accept Delivery to Archmage Xylem
    .accept 3542 >>Accept Delivery to Andron Gant
    .accept 3518 >>Accept Delivery to Magatha
    .accept 3541 >>Accept Delivery to Jes'rimon
    .target Jediga
step
    .goto 1447/1,-4760.30,3982.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Xylem|r
    .turnin 3561 >>Turn in Delivery to Archmage Xylem
    .turnin 8252 >>Turn in The Siren's Coral << Mage
    .accept 3565 >>Accept Xylem's Payment to Jediga
    .accept 8253 >>Accept Destroy Morphaz << Mage
    .target Archmage Xylem
step << Mage
    .goto 1447/1,-4760.30,3982.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Xylem|r
    .turnin 8253 >>Turn in Destroy Morphaz
    .target Archmage Xylem
    .isQuestComplete 8253
step
    .goto 1447/1,-4421.06,3603.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jediga|r
    .turnin 3565 >>Turn in Xylem's Payment to Jediga
    .target Jediga
step
    .goto 1447/1,-3916.01,2727.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Berdun Cliffbrew|r
    .target Berdun Cliffbrew
    .home >>Set your Hearthstone to Berdun Cliffbrew's inn
step
    +|cRXP_WARN_That is all of Azshara for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Orgrimmar|r: Delivery to Jes'rimon
    >>|cRXP_FRIENDLY_Thunder Bluff|r: Delivery to Magatha
    >>|cRXP_FRIENDLY_Undercity|r: Delivery to Andron Gant
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Destroy Morphaz << Mage
step
    .xp 56 >>|cRXP_WARN_The rest of Azshara is planned from level 56.|r Come back to this guide then
step
    .goto 1447/1,-7297.24,2849.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duke Hydraxis|r
    .accept 6805 >>Accept Stormers and Rumblers
    .accept 6804 >>Accept Poisoned Water
    .target Duke Hydraxis
step
    .goto 1447/1,-7297.24,2849.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duke Hydraxis|r
    .turnin 6804 >>Turn in Poisoned Water
    .target Duke Hydraxis
    .isQuestComplete 6804
step
    .goto 1447/1,-7297.24,2849.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duke Hydraxis|r
    .turnin 6805 >>Turn in Stormers and Rumblers
    .target Duke Hydraxis
    .isQuestComplete 6805
step
    .goto 1447/1,-6361.16,3098.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loramus Thalipedes|r
    .accept 3141 >>Accept Loramus
    .target Loramus Thalipedes
    .isQuestTurnedIn 2744 --any of: The Demon Hunter
    .xp <45,1
step
    .goto 1447/1,-6361.16,3098.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loramus Thalipedes|r
    .complete 3141,1 --Loramus Thalipedes (10)
    .target Loramus Thalipedes
    .isOnQuest 3141
step
    .goto 1447/1,-6361.16,3098.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loramus Thalipedes|r
    .turnin 3141 >>Turn in Loramus
    .target Loramus Thalipedes
    .isOnQuest 3141
step
    .goto 1447/1,-6361.16,3098.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loramus Thalipedes|r
    .accept 3508 >>Accept Breaking the Ward
    .target Loramus Thalipedes
    .isQuestTurnedIn 3141 --any of: Loramus
    .xp <45,1
step
    .goto 1447/1,-6361.16,3098.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loramus Thalipedes|r
    .turnin 3508 >>Turn in Breaking the Ward
    .target Loramus Thalipedes
    .isOnQuest 3508
step
    .goto 1447/1,-6361.16,3098.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loramus Thalipedes|r
    .accept 3509 >>Accept The Name of the Beast
    .target Loramus Thalipedes
    .isQuestTurnedIn 3508 --any of: Breaking the Ward
    .xp <45,1
step
    .goto 1447/1,-7188.22,3894.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lord Arkkoroc|r
    .turnin 3509 >>Turn in The Name of the Beast
    .target Lord Arkkoroc
    .isOnQuest 3509
step
    .goto 1447/1,-7188.22,3894.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lord Arkkoroc|r
    .accept 3510 >>Accept The Name of the Beast
    .target Lord Arkkoroc
    .isQuestTurnedIn 3509 --any of: The Name of the Beast
    .xp <45,1
step
    .goto 1447/1,-6153.77,3827.20
    >>Kill |cRXP_ENEMY_Hetaeras|r. Loot them for |cRXP_LOOT_Hetaera's Beaten Head|r
    .complete 3510,1 --Hetaera's Beaten Head (10)
    .mob Hetaera
    .isOnQuest 3510
step
    .goto 1447/1,-6153.77,3827.20
    >>Kill |cRXP_ENEMY_Hetaeras|r. Loot them for |cRXP_LOOT_Hetaera's Bloodied Head|r
    .complete 3510,2 --Hetaera's Bloodied Head (10)
    .mob Hetaera
    .isOnQuest 3510
step
    .goto 1447/1,-6153.77,3827.20
    >>Kill |cRXP_ENEMY_Hetaeras|r. Loot them for |cRXP_LOOT_Hetaera's Bruised Head|r
    .complete 3510,3 --Hetaera's Bruised Head (10)
    .mob Hetaera
    .isOnQuest 3510
step << Hunter
    .goto 1447/1,-5427.12,3900.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ogtinc|r
    .accept 8153 >>Accept Courser Antlers
    .target Ogtinc
    .isQuestTurnedIn 8151 --any of: The Hunter's Charm
    .xp <50,1
step << Hunter
    #loop
    .goto 1447/1,-5686.24,4448.34,0
    .goto 1447/1,-5686.24,4448.34,40,0
    .goto 1447/1,-5746.07,4454.09,40,0
    .goto 1447/1,-5781.06,4424.00,40,0
    .goto 1447/1,-5824.67,4447.33,40,0
    .goto 1447/1,-5865.74,4403.03,40,0
    .goto 1447/1,-5949.92,4454.43,40,0
    .goto 1447/1,-5954.48,4517.99,40,0
    .goto 1447/1,-5894.65,4495.34,40,0
    .goto 1447/1,-5762.30,4498.72,40,0
    >>Kill |cRXP_ENEMY_Mosshoof Courser|r and loot |cRXP_LOOT_Perfect Courser Antler|r
    .complete 8153,1 --Perfect Courser Antler (1)
    .mob Mosshoof Courser
    .isOnQuest 8153
step << Hunter
    .goto 1447/1,-5427.12,3900.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ogtinc|r
    .turnin 8153 >>Turn in Courser Antlers
    .target Ogtinc
    .isOnQuest 8153
step << Hunter
    .goto 1447/1,-5427.12,3900.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ogtinc|r
    .accept 8231 >>Accept Wavethrashing
    .target Ogtinc
    .isQuestTurnedIn 8153 --any of: Courser Antlers
    .xp <50,1
step << Rogue
    .goto 1447/1,-4760.30,3982.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Xylem|r
    .accept 8235 >>Accept Encoded Fragments
    .target Archmage Xylem
    .isQuestTurnedIn 8234 --any of: Sealed Azure Bag
    .xp <50,1
step << Priest
    .goto 1447/1,-5427.12,3900.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ogtinc|r
    .accept 8255 >>Accept Of Coursers We Know
    .target Ogtinc
    .isQuestTurnedIn 8254 --any of: Cenarion Aid
    .xp <50,1
step << Priest
    #loop
    .goto 1447/1,-5686.24,4448.34,0
    .goto 1447/1,-5686.24,4448.34,40,0
    .goto 1447/1,-5746.07,4454.09,40,0
    .goto 1447/1,-5781.06,4424.00,40,0
    .goto 1447/1,-5824.67,4447.33,40,0
    .goto 1447/1,-5865.74,4403.03,40,0
    .goto 1447/1,-5949.92,4454.43,40,0
    .goto 1447/1,-5954.48,4517.99,40,0
    .goto 1447/1,-5894.65,4495.34,40,0
    .goto 1447/1,-5762.30,4498.72,40,0
    >>Kill |cRXP_ENEMY_Mosshoof Coursers|r. Loot them for |cRXP_LOOT_Healthy Courser Gland|r
    .complete 8255,1 --Healthy Courser Gland (4)
    .mob Mosshoof Courser
    .isOnQuest 8255
step
    .goto 1447/1,-6294.74,4283.34
    >>Click the |cRXP_PICK_Kaldorei Tome of Summoning|r
    .accept 3506 >>Accept Betrayed
    .isQuestTurnedIn 3505 --any of: Betrayed
    .xp <44,1
step
    .goto 1447/1,-6294.74,4280.97
    >>Kill |cRXP_ENEMY_Magus Rimtori|r and loot |cRXP_LOOT_Head of Magus Rimtori|r
    .complete 3506,1 --Head of Magus Rimtori (1)
    .mob Magus Rimtori
    .isOnQuest 3506
step << Rogue
    #loop
    .goto 1447/1,-6784.07,4421.29,0
    .goto 1447/1,-6784.07,4421.29,40,0
    .goto 1447/1,-6855.06,4287.39,40,0
    .goto 1447/1,-7058.40,4344.54,40,0
    .goto 1447/1,-6914.39,4345.21,40,0
    >>Kill |cRXP_ENEMY_Forest Oozes|r. Loot them for |cRXP_LOOT_Encoded Fragment|r
    .complete 8235,1 --Encoded Fragment (10)
    .mob Forest Ooze
    .isOnQuest 8235
step
    .goto 1447/1,-7188.22,3894.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lord Arkkoroc|r
    .turnin 3510 >>Turn in The Name of the Beast
    .target Lord Arkkoroc
    .isOnQuest 3510
step
    .goto 1447/1,-7188.22,3894.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lord Arkkoroc|r
    .accept 3511 >>Accept The Name of the Beast
    .target Lord Arkkoroc
    .isQuestTurnedIn 3510 --any of: The Name of the Beast
    .xp <45,1
step
    .goto 1447/1,-6361.16,3098.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loramus Thalipedes|r
    .turnin 3511 >>Turn in The Name of the Beast
    .target Loramus Thalipedes
    .isOnQuest 3511
step
    .goto 1447/1,-6361.16,3098.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loramus Thalipedes|r
    .accept 3602 >>Accept Azsharite
    .target Loramus Thalipedes
    .isQuestTurnedIn 3511 --any of: The Name of the Beast
    .xp <45,1
step
    #loop
    .goto 1447/1,-6335.81,2678.59,0
    .goto 1447/1,-6335.81,2678.59,40,0
    .goto 1447/1,-6317.05,2638.36,40,0
    .goto 1447/1,-5963.61,2477.75,40,0
    .goto 1447/1,-5903.77,2452.73,40,0
    .goto 1447/1,-6258.73,2294.48,40,0
    .goto 1447/1,-6452.95,2365.15,40,0
    .goto 1447/1,-6502.13,2368.53,40,0
    .goto 1447/1,-6459.54,2438.53,40,0
    .goto 1447/1,-6366.74,2644.78,40,0
    >>Loot the |cRXP_PICK_Azsharite Formations|r for |cRXP_LOOT_Crystallized Azsharite|r
    .complete 3602,1 --Crystallized Azsharite (20)
    .isOnQuest 3602
step
    .goto 1447/1,-6361.16,3098.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loramus Thalipedes|r
    .turnin 3602 >>Turn in Azsharite
    .target Loramus Thalipedes
    .isOnQuest 3602
step
    .goto 1447/1,-6361.16,3098.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loramus Thalipedes|r
    .accept 3621 >>Accept The Formation of Felbane
    .target Loramus Thalipedes
    .isQuestTurnedIn 3602 --any of: Azsharite
    .xp <45,1
step << Hunter
    #loop
    .goto 1447/1,-7513.26,4912.25,0
    .goto 1447/1,-7513.26,4912.25,40,0
    .goto 1447/1,-7487.90,4949.44,40,0
    .goto 1447/1,-7545.20,4941.66,40,0
    .goto 1447/1,-7614.67,4946.40,40,0
    .goto 1447/1,-7653.72,4915.29,40,0
    .goto 1447/1,-7754.63,4884.86,40,0
    .goto 1447/1,-7749.05,4811.49,40,0
    .goto 1447/1,-7747.53,4752.31,40,0
    >>Kill |cRXP_ENEMY_Young Wavethrashers|r, |cRXP_ENEMY_Wavethrashers|r and |cRXP_ENEMY_Great Wavethrashers|r. Loot them for |cRXP_LOOT_Wavethrasher Scales|r
    .complete 8231,1 --Wavethrasher Scales (6)
    .mob Young Wavethrasher
    .mob Wavethrasher
    .mob Great Wavethrasher
    .isOnQuest 8231
step << Hunter
    .goto 1447/1,-5427.12,3900.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ogtinc|r
    .turnin 8231 >>Turn in Wavethrashing
    .target Ogtinc
    .isOnQuest 8231
step << Hunter
    .goto 1447/1,-5427.12,3900.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ogtinc|r
    .accept 8232 >>Accept The Green Drake
    .target Ogtinc
    .isQuestTurnedIn 8231 --any of: Wavethrashing
    .xp <50,1
step << Hunter
    .goto 1447/1,-5427.12,3900.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ogtinc|r
    .turnin 8232 >>Turn in The Green Drake
    .target Ogtinc
    .isQuestComplete 8232
step << Mage
    .goto 1447/1,-4760.30,3982.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Xylem|r
    .turnin 8253 >>Turn in Destroy Morphaz
    .target Archmage Xylem
    .isQuestComplete 8253
step << Rogue
    .goto 1447/1,-4760.30,3982.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Xylem|r
    .turnin 8235 >>Turn in Encoded Fragments
    .target Archmage Xylem
    .isOnQuest 8235
step << Rogue
    .goto 1447/1,-4760.30,3982.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Xylem|r
    .accept 8236 >>Accept The Azure Key
    .target Archmage Xylem
    .isQuestTurnedIn 8235 --any of: Encoded Fragments
    .xp <50,1
step << Priest
    .goto 1447/1,-5427.12,3900.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ogtinc|r
    .turnin 8255 >>Turn in Of Coursers We Know
    .target Ogtinc
    .isOnQuest 8255
step << Priest
    .goto 1447/1,-5427.12,3900.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ogtinc|r
    .accept 8256 >>Accept The Ichor of Undeath
    .target Ogtinc
    .isQuestTurnedIn 8255 --any of: Of Coursers We Know
    .xp <50,1
step << Priest
    #loop
    .goto 1447/1,-5319.61,3781.90,0
    .goto 1447/1,-5319.61,3781.90,40,0
    .goto 1447/1,-5273.98,3639.88,40,0
    .goto 1447/1,-5118.30,3719.68,40,0
    >>Kill |cRXP_ENEMY_Highborne Apparitions|r, |cRXP_ENEMY_Highborne Lichlings|r and |cRXP_ENEMY_Lingering Highbornes|r. Loot them for |cRXP_LOOT_Ichor of Undeath|r
    .complete 8256,1 --Ichor of Undeath (1)
    .mob Highborne Apparition
    .mob Highborne Lichling
    .mob Lingering Highborne
    .isOnQuest 8256
step << Priest
    .goto 1447/1,-5427.12,3900.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ogtinc|r
    .turnin 8256 >>Turn in The Ichor of Undeath
    .target Ogtinc
    .isOnQuest 8256
step << Priest
    .goto 1447/1,-5427.12,3900.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ogtinc|r
    .accept 8257 >>Accept Blood of Morphaz
    .target Ogtinc
    .isQuestTurnedIn 8256 --any of: The Ichor of Undeath
    .xp <50,1
step
    .goto 1447/1,-4405.85,3601.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ag'tor Bloodfist|r
    .turnin 3506 >>Turn in Betrayed
    .target Ag'tor Bloodfist
    .isOnQuest 3506
step
    .goto 1447/1,-4405.85,3601.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ag'tor Bloodfist|r
    .accept 3507 >>Accept Betrayed
    .target Ag'tor Bloodfist
    .isQuestTurnedIn 3506 --any of: Betrayed
    .xp <44,1
step
    +|cRXP_WARN_That is all of Azshara for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Alterac Mountains|r: The Azure Key << Rogue
    >>|cRXP_FRIENDLY_Felwood|r: Blood of Morphaz << Priest
    >>|cRXP_FRIENDLY_Orgrimmar|r: Betrayed
    >>|cRXP_FRIENDLY_Stranglethorn Vale|r: The Formation of Felbane
    >>|cRXP_FRIENDLY_Eastern Plaguelands and back here|r: Poisoned Water
    >>|cRXP_FRIENDLY_Silithus and back here|r: Stormers and Rumblers
step
    +|cRXP_WARN_End of the Azshara route.|r
]])
