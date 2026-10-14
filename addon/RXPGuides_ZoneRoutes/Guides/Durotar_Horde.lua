-- 1-13 Durotar: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- Edit zones/Durotar.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#name 1-13 Durotar

step << Warrior/Shaman/Warlock/Mage/Priest
    #completewith next
    +|cRXP_WARN_Kill |cRXP_ENEMY_Mottled Boars|r. Loot them until you have 35 copper worth of vendor items (including your armor)|r << Warlock
    +|cRXP_WARN_Kill |cRXP_ENEMY_Mottled Boars|r. Loot them until you have 60 copper worth of vendor items (including your armor)|r << Mage
    +|cRXP_WARN_Kill |cRXP_ENEMY_Mottled Boars|r. Loot them until you have 50 copper worth of vendor items (including your armor)|r << Priest
    +|cRXP_WARN_Kill |cRXP_ENEMY_Mottled Boars|r. Loot them until you have 10 copper worth of vendor items (including your armor)|r << Warrior/Shaman
    .goto 1411/1,-4281.07,-720.15,30,0 << Warlock/Mage/Priest
    .goto 1411/1,-4299.05,-494.9,30,0 << Warrior/Shaman
    .mob Mottled Boar
    .money >0.01
step
    .goto 1411/1,-4251.46,-607.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kaltunk|r
    .accept 4641 >>Accept Your Place In The World
    .target Kaltunk
step << Warlock
    .goto 1411/1,-4214.45,-623.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ruzan|r
    .accept 1485 >>Accept Vile Familiars
    .target Ruzan
step << Warrior/Shaman
    .goto 1411/1,-4214.45,-565.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duokna|r
    .vendor >> Vendor Trash
    .target Duokna
    .money >0.01
step
    .goto 1411/1,-4186.42,-600.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gornek|r
    .turnin 4641 >>Turn in Your Place In The World
    .accept 97279 >>Accept Wayward Weapons
    .accept 788 >>Accept Cutting Teeth
    .target Gornek
step << Warrior/Shaman
    .goto 1411/1,-4198.05,-605.59,10,0
    .goto 1411/1,-4230.31,-639.43 << Warrior
    .goto 1411/1,-4203.87,-623.92 << Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Frang|r << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shikrik|r << Shaman
    .train 6673 >>Train |T132333:0|t[Battle Shout] << Warrior
    .train 8017 >>Train |T136086:0|t[Rockbiter Weapon] << Shaman
    .target Frang << Warrior
    .target Shikrik << Shaman
step << Warlock
    .goto 1411/1,-4107.11,-604.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hraug|r
    .vendor >>Vendor Trash
    .target Hraug
step << Warlock
    .goto 1411/1,-4111.87,-607.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nartok|r
    .train 348 >>Train |T135817:0|t[Immolate]
    .target Nartok
step << Warlock
    #loop
    .goto 1411/1,-4279.48,-246.39,0
    .goto 1411/1,-4279.48,-246.39,40,0
    .goto 1411/1,-4351.92,-211.49,40,0
    .goto 1411/1,-4381.53,-253.09,40,0
    .goto 1411/1,-4448.15,-210.79,40,0
    .goto 1411/1,-4403.21,-168.13,40,0
    .goto 1411/1,-4312.79,-47.93,40,0
    .goto 1411/1,-4226.08,-43.35,40,0
    .goto 1411/1,-4247.76,-106.45,40,0
    .goto 1411/1,-4320.20,-166.37,40,0
    >>Kill |cRXP_ENEMY_Vile Familiars|r. Loot them for |cRXP_LOOT_Vile Familiar Head|r
    .complete 1485,1 --Vile Familiar Head (6)
    .mob Vile Familiar
step
    #completewith Along6
    >>As you go: Pick up |cRXP_PICK_Abandoned Training Weapon|r from the ground. |cRXP_WARN_Anything left is finished later|r
    .complete 97279,1 --Abandoned Training Weapon (6)
step
    .goto 1411/1,-4109.22,-397.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hana'zua|r
    .accept 790 >>Accept Sarkoth
    .target Hana'zua
step
    .goto 1411/1,-4103.94,-547.42
    >>Kill |cRXP_ENEMY_Sarkoth|r and loot |cRXP_LOOT_Sarkoth's Mangled Claw|r
    .complete 790,1 --Sarkoth's Mangled Claw (1)
    .mob Sarkoth
step
    #label Along6
    .goto 1411/1,-4109.22,-397.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hana'zua|r
    .turnin 790 >>Turn in Sarkoth
    .accept 804 >>Accept Sarkoth
    .target Hana'zua
step
    #loop
    .goto 1411/1,-4109.22,-419.47,0
    .goto 1411/1,-4109.22,-419.47,40,0
    .goto 1411/1,-4188.54,-415.59,40,0
    .goto 1411/1,-4212.33,-348.61,40,0
    .goto 1411/1,-4277.37,-414.53,40,0
    .goto 1411/1,-4322.84,-280.93,40,0
    .goto 1411/1,-4375.19,-389.86,40,0
    .goto 1411/1,-4336.59,-497.02,40,0
    .goto 1411/1,-4289.00,-560.47,40,0
    .goto 1411/1,-4213.92,-487.15,40,0
    >>Kill |cRXP_ENEMY_Mottled Boars|r
    >>Pick up |cRXP_PICK_Abandoned Training Weapon|r from the ground
    .complete 788,1 --Mottled Boar slain (10)
    .complete 97279,1 --Abandoned Training Weapon (6)
    .mob Mottled Boar
step << Warlock
    .goto 1411/1,-4146.24,-483.97,0
    .goto 1411/1,-4146.24,-483.97,40,0
    .goto 1411/1,-4179.02,-473.75,40,0
    .goto 1411/1,-4218.15,-480.10,40,0
    .goto 1411/1,-4252.52,-483.62,40,0
    .goto 1411/1,-4283.71,-516.76,40,0
    .goto 1411/1,-4317.55,-516.76,40,0
    .goto 1411/1,-4350.33,-510.06,40,0
    .goto 1411/1,-4379.94,-515.70,40,0
    .goto 1411/1,-4379.94,-484.33,40,0
    .goto 1411/1,-4352.98,-445.90,40,0
    .goto 1411/1,-4385.76,-412.77,40,0
    .goto 1411/1,-4384.70,-383.16,40,0
    .goto 1411/1,-4383.12,-346.85,40,0
    .goto 1411/1,-4349.81,-313.720,40,0
    .goto 1411/1,-4315.44,-287.28,40,0
    .goto 1411/1,-4281.60,-321.82,40,0
    .goto 1411/1,-4239.83,-315.13,40,0
    .goto 1411/1,-4213.92,-309.84,40,0
    .goto 1411/1,-4184.31,-348.61,40,0
    .goto 1411/1,-4184.31,-382.45,40,0
    .goto 1411/1,-4183.25,-409.6,40,0
    .goto 1411/1,-4182.72,-448.72,40,0
    .xp 3+685 >> Grind to 685+/1400xp
step << Rogue
    .goto 1411/1,-4214.45,-565.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duokna|r
    .vendor >> Vendor Trash
    .target Duokna
step
    .goto 1411/1,-4186.42,-600.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gornek|r
    .turnin 788 >>Turn in Cutting Teeth while you are here
    .isQuestComplete 788
    .target Gornek
step
    .goto 1411/1,-4186.42,-600.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gornek|r
    .turnin 804 >>Turn in Sarkoth while you are here
    .isQuestComplete 804
    .target Gornek
step << Warlock
    .goto 1411/1,-4214.45,-623.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ruzan|r
    .turnin 1485 >>Turn in Vile Familiars
    .accept 1499 >>Accept Vile Familiars
    .target Ruzan
step
    .goto 1411/1,-4228.19,-629.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zureetha Fargaze|r
    .turnin 1499 >>Turn in Vile Familiars << Warlock
    .accept 792 >>Accept Vile Familiars << Warrior/Paladin/Hunter/Rogue/Priest/Shaman/Mage/Druid
    .target Zureetha Fargaze
step
    .goto 1411/1,-4186.42,-600.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gornek|r
    .turnin 788 >>Turn in Cutting Teeth
    .turnin 804 >>Turn in Sarkoth
    .accept 98576 >>Accept Glyphic Parchment << Orc Mage
    .accept 98575 >>Accept Tainted Tablet << Troll Warlock
    .accept 789 >>Accept Sting of the Scorpid
    .accept 2383 >>Accept Simple Parchment << Orc Warrior
    .accept 3087 >>Accept Etched Parchment << Orc Hunter
    .accept 3088 >>Accept Encrypted Parchment << Orc Rogue
    .accept 3089 >>Accept Rune-Inscribed Parchment << Orc Shaman
    .accept 3090 >>Accept Tainted Parchment << Orc Warlock
    .accept 3065 >>Accept Simple Tablet << Troll Warrior
    .accept 3082 >>Accept Etched Tablet << Troll Hunter
    .accept 3083 >>Accept Encrypted Tablet << Troll Rogue
    .accept 3085 >>Accept Hallowed Tablet << Troll Priest
    .accept 3084 >>Accept Rune-Inscribed Tablet << Troll Shaman
    .accept 3086 >>Accept Glyphic Tablet << Troll Mage
    .target Gornek
step << Rogue
    .goto 1411/1,-4144.65,-588.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rwag|r
    .train 53 >> Train |T132090:0|t[Backstab]
    .target Rwag
    .money <0.04
    .xp <4,1
step << Troll Priest
    .goto 1411/1,-4202.28,-617.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ken'jai|r
    .turnin 3085 >>Turn in Hallowed Tablet while you are here
    .isQuestComplete 3085
    .target Ken'jai
step
    #completewith Along13
    >>As you go: Kill |cRXP_ENEMY_Scorpid Workers|r and |cRXP_ENEMY_Sarkoths|r. Loot them for |cRXP_LOOT_Scorpid Worker Tail|r. |cRXP_WARN_Anything left is finished later|r
    .complete 789,1 --Scorpid Worker Tail (10)
    .mob Scorpid Worker
    .mob Sarkoth
step
    .goto 1411/1,-4145.18,-588.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rwag|r
    .turnin 3088 >>Turn in Encrypted Parchment << Orc Rogue
    .turnin 3083 >>Turn in Encrypted Tablet << Troll Rogue
    .target Rwag
step
    .goto 1411/1,-4111.87,-607.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nartok|r
    .turnin 98575 >>Turn in Tainted Tablet << Troll Warlock
    .turnin 3090 >>Turn in Tainted Parchment << Orc Warlock
    .target Nartok
step << Warlock
    .goto 1411/1,-4111.87,-607.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nartok|r
    .train 172 >> Train |T136118:0|t[Corruption]
    .target Nartok
step
    #label Along13
    .goto 1411/1,-4102.35,-588.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kzan Thornslash|r
    .turnin 97279 >>Turn in Wayward Weapons
    .target Kzan Thornslash
step << Shaman
    .goto 1411/1,-4102.600,-588.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kzan|r
    .vendor >> Vendor trash. Sell your weapon if it gives you enough money for a |T135139:0|t[Short Staff] (97c)
    .target Kzan Thornslash
step << Rogue/Warrior
    .goto 1411/1,-4106.000,-593.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Norzsh|r
    >>|cRXP_BUY_Buy a|r |T134708:0|t[Mining Pick] |cRXP_BUY_from|r |cRXP_BUY_him|r
    .train 2575 >> Train |T136248:0|t[Mining]
    .collect 2901,1,792,1
    >>|cRXP_WARN_This will allow you to find|r |T135232:0|t|cRXP_LOOT_[Rough Stones]|r |cRXP_WARN_from nodes in order to craft|r |T135248:0|t[Sharpening Stones] |cRXP_WARN_(+2 Weapon Damage for 30 minutes)|r
    .target Norzsh
step << Warlock
    .goto 1411/1,-4107.11,-604.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hraug|r
    .vendor >>Vendor Trash
    .target Hraug
    .money >0.01
step
    .goto 1411/1,-4221.85,-561.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Galgar|r
    .accept 4402 >>Accept Galgar's Cactus Apple Surprise
    .target Galgar
step << !Rogue !Shaman
    .goto 1411/1,-4214.45,-565.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duokna|r
    >>|cRXP_BUY_Buy|r |T132794:0|t[Refreshing Spring Water] |cRXP_BUY_from her|r << !Rogue !Warrior !Hunter !Shaman
    >>|cRXP_BUY_Buy|r |T132382:0|t[Rough Arrows] |cRXP_BUY_from her|r << Hunter
    .collect 159,15,6394,1 << !Rogue !Warrior !Hunter !Shaman
    .collect 2512,1000,6394,1 << Hunter
    .vendor >> Vendor Trash
    .target Duokna
    .money >0.1 << Rogue/Warrior
step
    .goto 1411/1,-4203.87,-623.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shikrik|r
    .turnin 3089 >>Turn in Rune-Inscribed Parchment << Orc Shaman
    .turnin 3084 >>Turn in Rune-Inscribed Tablet << Troll Shaman
    .target Shikrik
step
    .goto 1411/1,-4210.22,-625.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mai'ah|r
    .turnin 98576 >>Turn in Glyphic Parchment << Orc Mage
    .turnin 3086 >>Turn in Glyphic Tablet << Troll Mage
    .target Mai'ah
step << Mage
    .goto 1411/1,-4210.22,-625.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mai'ah|r
    .train 1459 >> Train |T135932:0|t[Arcane Intellect]
    .target Mai'ah
step
    .goto 1411/1,-4230.31,-639.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Frang|r
    .turnin 2383 >>Turn in Simple Parchment << Orc Warrior
    .turnin 3065 >>Turn in Simple Tablet << Troll Warrior
    .target Frang
step
    .goto 1411/1,-4227.66,-635.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jen'shan|r
    .turnin 3087 >>Turn in Etched Parchment << Orc Hunter
    .turnin 3082 >>Turn in Etched Tablet << Troll Hunter
    .target Jen'shan
step
    .goto 1411/1,-4322.31,-611.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Foreman Thazz'ril|r
    .accept 5441 >>Accept Lazy Peons
    .target Foreman Thazz'ril
step << Warrior/Paladin/Hunter/Rogue/Priest/Shaman/Mage/Druid
    #loop
    .goto 1411/1,-4381.53,-253.09,0
    .goto 1411/1,-4381.53,-253.09,40,0
    .goto 1411/1,-4448.15,-210.79,40,0
    .goto 1411/1,-4403.21,-168.13,40,0
    .goto 1411/1,-4312.79,-47.93,40,0
    .goto 1411/1,-4226.08,-43.35,40,0
    .goto 1411/1,-4247.76,-106.45,40,0
    .goto 1411/1,-4320.20,-166.37,40,0
    .goto 1411/1,-4279.48,-246.39,40,0
    .goto 1411/1,-4351.92,-211.49,40,0
    >>Kill |cRXP_ENEMY_Vile Familiars|r
    .complete 792,1 --Vile Familiar slain (12)
    .mob Vile Familiar
step
    #completewith Along22
    >>As you go: Pick up |cRXP_PICK_Cactus Apple|r from the ground. |cRXP_WARN_Anything left is finished later|r
    .complete 4402,1 --Cactus Apple (10)
step
    #loop
    .goto 1411/1,-4243.53,-180.82,0
    .goto 1411/1,-4243.53,-180.82,40,0
    .goto 1411/1,-4252.52,-248.50,40,0
    .goto 1411/1,-4286.88,-287.98,40,0
    .goto 1411/1,-4214.45,-279.52,40,0
    .goto 1411/1,-4153.64,-320.41,40,0
    .goto 1411/1,-4125.62,-378.22,40,0
    .goto 1411/1,-4149.94,-425.46,40,0
    .goto 1411/1,-4051.59,-386.68,40,0
    .goto 1411/1,-4171.09,-212.55,40,0
    >>Kill |cRXP_ENEMY_Scorpid Workers|r and |cRXP_ENEMY_Sarkoths|r. Loot them for |cRXP_LOOT_Scorpid Worker Tail|r
    .complete 789,1 --Scorpid Worker Tail (10)
    .mob Scorpid Worker
    .mob Sarkoth
step
    #label Along22
    #loop
    .goto 1411/1,-4127.20,-321.12,0
    .goto 1411/1,-4127.20,-321.12,40,0
    .goto 1411/1,-4144.65,-269.30,40,0
    .goto 1411/1,-4227.14,-209.38,40,0
    .goto 1411/1,-4283.71,-228.41,40,0
    .goto 1411/1,-4201.23,-773.73,40,0
    .goto 1411/1,-4144.65,-753.99,40,0
    >>Interact with |cRXP_FRIENDLY_Lazy Peons|r
    .complete 5441,1 --Lazy Peon (5)
    .target Lazy Peon
step
    .goto 1411/1,-4146.24,-483.97,0
    .goto 1411/1,-4146.24,-483.97,40,0
    .goto 1411/1,-4179.02,-473.75,40,0
    .goto 1411/1,-4218.15,-480.10,40,0
    .goto 1411/1,-4252.52,-483.62,40,0
    .goto 1411/1,-4283.71,-516.76,40,0
    .goto 1411/1,-4317.55,-516.76,40,0
    .goto 1411/1,-4350.33,-510.06,40,0
    .goto 1411/1,-4379.94,-515.70,40,0
    .goto 1411/1,-4379.94,-484.33,40,0
    .goto 1411/1,-4352.98,-445.90,40,0
    .goto 1411/1,-4385.76,-412.77,40,0
    .goto 1411/1,-4384.70,-383.16,40,0
    .goto 1411/1,-4383.12,-346.85,40,0
    .goto 1411/1,-4349.81,-313.720,40,0
    .goto 1411/1,-4315.44,-287.28,40,0
    .goto 1411/1,-4281.60,-321.82,40,0
    .goto 1411/1,-4239.83,-315.13,40,0
    .goto 1411/1,-4213.92,-309.84,40,0
    .goto 1411/1,-4184.31,-348.61,40,0
    .goto 1411/1,-4184.31,-382.45,40,0
    .goto 1411/1,-4183.25,-409.6,40,0
    .goto 1411/1,-4182.72,-448.72,40,0
    .xp 4 >> Grind to level 4
step
    .goto 1411/1,-4186.42,-600.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gornek|r
    .turnin 789 >>Turn in Sting of the Scorpid
    .target Gornek
step << Shaman
    .goto 1411/1,-4204.40,-629.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Canaga Earthcaller|r
    .accept 1516 >>Accept Call of Earth
    .target Canaga Earthcaller
step << Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shikrik|r and |cRXP_FRIENDLY_Canaga|r
    .train 8042 >> Train |T136026:0|t[Earth Shock]
    .goto 1411/1,-4203.87,-623.92
    .goto 1411/1,-4204.4,-629.91
    .target Shikrik
    .target Canaga Earthcaller
step << Mage
    .goto 1411/1,-4210.22,-625.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mai'ah|r
    .train 116 >> Train |T135846:0|t[Frostbolt]
    .target Mai'ah
step << Priest
    .goto 1411/1,-4202.28,-617.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ken'jai|r
    .train 1243 >> Train |T135987:0|t[Power Word: Fortitude]
    .train 589 >> Train |T136207:0|t[Shadow Word: Pain]
    .money <0.011
    .target Ken'jai
step << Priest
    .goto 1411/1,-4202.28,-617.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ken'jai|r
    .train 589 >> Train |T136207:0|t[Shadow Word: Pain]
    .money <0.01
    .target Ken'jai
step << Troll Priest
    .goto 1411/1,-4202.28,-617.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ken'jai|r
    .turnin 3085 >>Turn in Hallowed Tablet
    .target Ken'jai
step << Priest
    .goto 1411/1,-4202.28,-617.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ken'jai|r
    .train 589 >> Train your class spells
    .money <0.021
    .target Ken'jai
step
    .goto 1411/1,-4228.19,-629.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zureetha Fargaze|r
    .turnin 792 >>Turn in Vile Familiars << Warrior/Paladin/Hunter/Rogue/Priest/Shaman/Mage/Druid
    .accept 794 >>Accept Burning Blade Medallion
    .target Zureetha Fargaze
step << Hunter
    .goto 1411/1,-4227.66,-635.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jen'shan|r
    .train 1978 >> Train |T132204:0|t[Serpent Sting]
    .target Jen'shan
    .xp <4,1
    .money <0.01
step << Warrior
    .goto 1411/1,-4230.31,-639.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Frang|r
    .train 100 >> Train |T132337:0|t[Charge]
    .train 772 >> Train |T132155:0|t[Rend]
    .target Frang
    .money <0.02
    .train 772,1
step << Warrior
    .goto 1411/1,-4230.31,-639.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Frang|r
    .train 772 >> Train |T132155:0|t[Rend]
    .target Frang
step << Warrior
    .goto 1411/1,-4230.31,-639.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Frang|r
    .train 100 >> Train |T132337:0|t[Charge]
    .target Frang
    .money <0.01
step
    .goto 1411/1,-4322.31,-611.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Foreman Thazz'ril|r
    .turnin 5441 >>Turn in Lazy Peons
    .accept 6394 >>Accept Thazz'ril's Pick
    .target Foreman Thazz'ril
step
    #loop
    .goto 1411/1,-4398.45,-413.12,0
    .goto 1411/1,-4398.45,-413.12,40,0
    .goto 1411/1,-4460.84,-406.42,40,0
    .goto 1411/1,-4443.92,-315.83,40,0
    .goto 1411/1,-4395.28,-326.05,40,0
    .goto 1411/1,-4368.31,-254.50,40,0
    .goto 1411/1,-4319.14,-244.98,40,0
    .goto 1411/1,-4337.12,-295.74,40,0
    .goto 1411/1,-4332.36,-298.56,40,0
    .goto 1411/1,-4338.17,-360.60,40,0
    >>Pick up |cRXP_PICK_Cactus Apple|r from the ground
    .complete 4402,1 --Cactus Apple (10)
step << !Warrior !Rogue !Shaman
    .goto 1411/1,-4282.13,-250.97,0
    .goto 1411/1,-4282.13,-250.97,40,0
    .goto 1411/1,-4317.02,-258.02,40,0
    .goto 1411/1,-4351.39,-250.97,40,0
    .goto 1411/1,-4385.76,-256.96,40,0
    .goto 1411/1,-4383.65,-216.07,40,0
    .goto 1411/1,-4419.07,-221.01,40,0
    .goto 1411/1,-4457.67,-205.15,40,0
    .goto 1411/1,-4405.85,-189.99,40,0
    .goto 1411/1,-4409.55,-169.54,40,0
    .goto 1411/1,-4376.24,-197.390,40,0
    .goto 1411/1,-4360.38,-176.95,40,0
    .goto 1411/1,-4329.71,-196.33,40,0
    .goto 1411/1,-4319.67,-169.190,40,0
    .goto 1411/1,-4303.28,-186.46,40,0
    .goto 1411/1,-4281.07,-148.75,40,0
    .xp 4+1720 >> Grind to 1720+/2100xp
step << !Warrior !Rogue !Shaman
    .goto 1411/1,-4282.13,-250.97,40,0
    .goto 1411/1,-4317.02,-258.02,40,0
    .goto 1411/1,-4351.39,-250.97,40,0
    .goto 1411/1,-4385.76,-256.96,40,0
    .goto 1411/1,-4383.65,-216.07,40,0
    .goto 1411/1,-4419.07,-221.01,40,0
    .goto 1411/1,-4457.67,-205.15,40,0
    .goto 1411/1,-4405.85,-189.99,40,0
    .goto 1411/1,-4409.55,-169.54,40,0
    .goto 1411/1,-4376.24,-197.390,40,0
    .goto 1411/1,-4360.38,-176.95,40,0
    .goto 1411/1,-4329.71,-196.33,40,0
    .goto 1411/1,-4319.67,-169.190,40,0
    .goto 1411/1,-4303.28,-186.46,40,0
    .goto 1411/1,-4281.07,-148.75,40,0
    .xp 5 >> Grind to level 5
step
    .goto 1411/1,-4221.85,-561.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Galgar|r
    .turnin 4402 >>Turn in Galgar's Cactus Apple Surprise
    .target Galgar
step
    .goto 1411/1,-4214.45,-565.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duokna|r
    >>|cRXP_BUY_Buy|r |T132794:0|t[Refreshing Spring Water] |cRXP_BUY_from her|r << !Rogue !Warrior !Hunter !Shaman
    >>|cRXP_BUY_Buy|r |T132382:0|t[Rough Arrows] |cRXP_BUY_from her|r << Hunter
    .collect 159,5,6394,1 << !Rogue !Warrior !Hunter !Shaman
    .collect 2512,1000,6394,1 << Hunter
    .vendor >> Vendor Trash
    .target Duokna
    .money >0.1 << Rogue/Warrior
step
    #loop
    .goto 1411/1,-4236.65,-142.40,0
    .goto 1411/1,-4236.65,-142.40,40,0
    .goto 1411/1,-4205.99,-101.51,40,0
    .goto 1411/1,-4234.54,-28.19,40,0
    .goto 1411/1,-4274.72,-87.76,40,0
    .goto 1411/1,-4295.34,-55.33,40,0
    .goto 1411/1,-4332.89,-44.05,40,0
    .goto 1411/1,-4370.43,-142.40,40,0
    .goto 1411/1,-4314.91,-127.95,40,0
    .goto 1411/1,-4280.01,-125.48,40,0
    >>Pick up |cRXP_PICK_Thazz'ril's Pick|r from the ground
    >>Kill |cRXP_ENEMY_Yarrog Baneshadow|r and loot |cRXP_LOOT_Burning Blade Medallion|r
    >>Kill |cRXP_ENEMY_Felstalkers|r. Loot them for |cRXP_LOOT_Felstalker Hoof|r << Shaman
    .complete 6394,1 --Thazz'ril's Pick (1)
    .complete 794,1 --Burning Blade Medallion (1)
    .complete 1516,1 << Shaman --Felstalker Hoof (2)
    .mob Yarrog Baneshadow
    .mob Felstalker << Shaman
step
    .goto 1411/1,-4220.26,-59.56,25,0
    .goto 1411/1,-4234.54,5.65,25,0
    .goto 1411/1,-4265.73,-26.43,25,0
    .goto 1411/1,-4275.25,-47.58,25,0
    .goto 1411/1,-4295.87,-54.63,25,0
    .goto 1411/1,-4332.36,-42.64,25,0
    .goto 1411/1,-4332.89,-74.020,25,0
    .goto 1411/1,-4330.24,-115.26,25,0
    .goto 1411/1,-4349.28,-131.12,25,0
    .goto 1411/1,-4368.84,-138.52,25,0
    .goto 1411/1,-4349.28,-131.12,25,0
    .goto 1411/1,-4315.97,-131.47,25,0
    .goto 1411/1,-4300.10,-99.40,25,0
    .goto 1411/1,-4284.77,-105.740,25,0
    .goto 1411/1,-4282.13,-138.17,25,0
    .goto 1411/1,-4260.45,-150.16,25,0
    .goto 1411/1,-4238.77,-138.88,25,0
    .goto 1411/1,-4203.34,-102.92,25,0
    .goto 1411/1,-4211.27,-76.84,25,0
    .goto 1411/1,-4250.40,-88.82,25,0
    .xp 5+1680 >> Grind to 1680+/2800xp << !Shaman
    .xp 5+690 >> Grind to 690+/2800xp << Shaman
step
    .goto 1411/1,-4220.26,-59.56,25,0
    .goto 1411/1,-4234.54,5.65,25,0
    .goto 1411/1,-4265.73,-26.43,25,0
    .goto 1411/1,-4275.25,-47.58,25,0
    .goto 1411/1,-4295.87,-54.63,25,0
    .goto 1411/1,-4332.36,-42.64,25,0
    .goto 1411/1,-4332.89,-74.020,25,0
    .goto 1411/1,-4330.24,-115.26,25,0
    .goto 1411/1,-4349.28,-131.12,25,0
    .goto 1411/1,-4368.84,-138.52,25,0
    .goto 1411/1,-4349.28,-131.12,25,0
    .goto 1411/1,-4315.97,-131.47,25,0
    .goto 1411/1,-4300.10,-99.40,25,0
    .goto 1411/1,-4284.77,-105.740,25,0
    .goto 1411/1,-4282.13,-138.17,25,0
    .goto 1411/1,-4260.45,-150.16,25,0
    .goto 1411/1,-4238.77,-138.88,25,0
    .goto 1411/1,-4203.34,-102.92,25,0
    .goto 1411/1,-4211.27,-76.84,25,0
    .goto 1411/1,-4250.40,-88.82,25,0
    .xp 5+1300 >> Grind to 1300+/2800xp << !Shaman
    .xp 5+310 >> Grind to 310+/2800xp << Shaman
step
    .goto 1411/1,-4664.94,311.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cook Torka|r
    .accept 96825 >>Accept This Fruit Could Bite Back
    .target Cook Torka
step << Orc Hunter/Troll Hunter
    .goto 1411/1,-4704.07,275.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thotar|r
    .turnin 6070 >>Turn in The Hunter's Path
    .target Thotar
    .isOnQuest 6070
step
    .goto 1411/1,-4815.11,307.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Turroc|r
    .accept 96822 >>Accept For Honor
    .target Turroc
step
    .hs >>Hearth to the Valley of Trials
step
    .goto 1411/1,-4322.31,-611.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Foreman Thazz'ril|r
    .turnin 6394 >>Turn in Thazz'ril's Pick
    .target Foreman Thazz'ril
step
    .goto 1411/1,-4214.45,-565.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duokna|r
    .vendor >> Vendor Trash
    .target Duokna
    .isOnQuest 794
step << Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shikrik|r and |cRXP_FRIENDLY_Canaga|r
    .train 332 >>Train |T136052:0|t[Healing Wave]
    .target +Shikrik
    .goto 1411/1,-4203.87,-623.92
    .target +Canaga Earthcaller
    .goto 1411/1,-4204.4,-629.91
    .xp <6,1
step << Shaman
    .goto 1411/1,-4204.40,-629.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Canaga Earthcaller|r
    .turnin 1516 >>Turn in Call of Earth
    .accept 1517 >>Accept Call of Earth
    .target Canaga Earthcaller
step
    .goto 1411/1,-4228.19,-629.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zureetha Fargaze|r
    .turnin 794 >>Turn in Burning Blade Medallion
    .accept 805 >>Accept Report to Sen'jin Village
    .target Zureetha Fargaze
step
    .goto 1411/1,-4225.02,-628.15
    >>Click the |cRXP_PICK_Lost Journal|r
    .accept 96652 >>Accept The Adventurer
step << Troll Priest
    .goto 1411/1,-4202.28,-617.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ken'jai|r
    .accept 5649 >>Accept In Favor of Spirituality
    .target Ken'jai
    .xp <5,1
step << Shaman
    .goto 1411/1,-4290.59,-877.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Minor Manifestation of Earth|r
    .turnin 1517 >>Turn in Call of Earth
    .accept 1518 >>Accept Call of Earth
    .target Minor Manifestation of Earth
step << Shaman
    .goto 1411/1,-4204.40,-629.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Canaga Earthcaller|r
    .turnin 1518 >>Turn in Call of Earth
    .target Canaga Earthcaller
step << Shaman
    .goto 1411/1,-4203.87,-623.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shikrik|r
    .train 332 >>Train |T136052:0|t[Healing Wave]
    .target Shikrik
step << Troll Priest
    .goto 1411/1,-4202.28,-617.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ken'jai|r
    .accept 5649 >>Accept In Favor of Spirituality
    .target Ken'jai
step << Priest
    .goto 1411/1,-4202.28,-617.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ken'jai|r
    .train 591 >>Train |T135924:0|t[Smite]
    .train 17 >>Train |T135940:0|t[Power Word: Shield]
    .target Ken'jai
step << Mage
    .goto 1411/1,-4210.22,-625.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mai'ah|r
    .train 143 >> Train |T135812:0|t[Fireball]
    .train 2136 >>Train |T135807:0|t[Fire Blast]
    .target Mai'ah
step << Hunter
    .goto 1411/1,-4227.66,-635.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jen'shan|r
    .train 1130 >>Train |T132212:0|t[Hunter's Mark]
    .train 3044 >>Train |T132218:0|t[Arcane Shot]
    .target Jen'shan
    .money <0.02
step << Hunter
    .goto 1411/1,-4227.66,-635.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jen'shan|r
    .train 3044 >>Train |T132218:0|t[Arcane Shot]
    .target Jen'shan
step << Warrior
    .goto 1411/1,-4230.31,-639.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Frang|r
    .train 3127 >>Train |T132269:0|t[Parry]
    .train 6343 >>Train |T136105:0|t[Thunder Clap]
    .target Frang
    .money <0.02
step << Warrior
    .goto 1411/1,-4230.31,-639.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Frang|r
    .train 3127 >>Train |T132269:0|t[Parry]
    .target Frang
step << Rogue
    .goto 1411/1,-4144.65,-588.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rwag|r
    .train 1757 >> Train |T136189:0|t[Sinister Strike]
    .train 1776 >> Train |T132155:0|t[Gouge]
    .target Rwag
    .money <0.02
    .xp <6,1
step << Rogue
    .goto 1411/1,-4144.65,-588.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rwag|r
    .train 1757 >> Train |T136189:0|t[Sinister Strike]
    .target Rwag
    .xp <6,1
step << Warlock
    .goto 1411/1,-4107.11,-604.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hraug|r
    >>|cRXP_BUY_Buy the|r |T133738:0|t[Grimoire of Blood Pact] |cRXP_BUY_from him|r
    .collect 16321,1,817,1
    .vendor >>Vendor Trash
    .target Hraug
    .money <0.03
    .train 6307,1
step << Warlock
    .goto 1411/1,-4111.87,-607.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nartok|r
    .train 695 >> Train |T136197:0|t[Shadow Bolt]
    .train 1454 >> Train |T136126:0|t[Life Tap]
    .target Nartok
    .money <0.02
step << Warlock
    .goto 1411/1,-4111.87,-607.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nartok|r
    .train 695 >> Train |T136197:0|t[Shadow Bolt]
    .target Nartok
step
    .goto 1411/1,-4715.17,-599.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ukor|r
    .accept 2161 >>Accept A Peon's Burden
    .target Ukor
step
    .goto 1411/1,-4841.01,-812.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lar Prowltusk|r
    .accept 786 >>Accept Thwarting Kolkar Aggression
    .target Lar Prowltusk
step
    .goto 1411/1,-4885.43,-852.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Xar'Ti|r
    .accept 97223 >>Accept Bloodtalon Matriarch
    .target Xar'Ti
step
    .goto 1411/1,-4921.38,-797.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vel'rin Fang|r
    .accept 817 >>Accept Practical Prey
    .accept 96821 >>Accept Legging It
    .target Vel'rin Fang
step
    .goto 1411/1,-4920.33,-813.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Vornal|r
    .accept 818 >>Accept A Solvent Spirit
    .accept 97225 >>Accept Forgotten Loa Idols
    .target Master Vornal
step
    .goto 1411/1,-4920.86,-825.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Gadrin|r
    .turnin 805 >>Turn in Report to Sen'jin Village
    .accept 808 >>Accept Minshina's Skull
    .accept 826 >>Accept Zalazane
    .accept 823 >>Accept Report to Orgnil
    .target Master Gadrin
step << !Rogue !Warrior
    .goto 1411/1,-4960.000,-791.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pa'zula|r
    >>|cRXP_WARN_This will unlock a quest. Skip this step if you already have 2 professions|r
    .train 7411 >> Train |T136244:0|t[Enchanting]
    .target Pa'zula
step << Shaman
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trayexir|r
    .vendor >> Vendor trash. Sell your weapon if it gives you enough money for a |T135145:0|t[Walking Stick] (4s 79c). You'll come back later if you don't have enough yet
    .target Trayexir
step << Rogue
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trayexir|r
    .vendor >> Vendor trash. Sell your weapon if it gives you enough money for a |T135641:0|t[Stiletto] (3s 81c). You'll come back later if you don't have enough yet
    .target Trayexir
step << Orc Warrior
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trayexir|r
    .vendor >> Vendor trash. Sell your weapon if it gives you enough money for a |T132401:0|t[Large Axe] (4s 60c). You'll come back later if you don't have enough yet
    .target Trayexir
step << Troll Warrior
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trayexir|r
    .vendor >> Vendor trash. Sell your weapon if it gives you enough money for a |T135421:0|t[Tomahawk] (5s 13c). You'll come back later if you don't have enough yet
    .target Trayexir
step << Hunter
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trayexir|r
    .vendor >> Vendor trash. Sell your weapon if it gives you enough money for a |T135499:0|t[Hornwood Recurve Bow] (2s 71c). You'll come back later if you don't have enough yet
    .target Trayexir
step << Mage
    .goto 1411/1,-4939.36,-838.941
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Un'Thuwa|r
    .train 143 >> Train |T135812:0|t[Fireball]
    .train 2136 >>Train |T135807:0|t[Fire Blast]
    .target Un'Thuwa
step
    .goto 1411/1,-4596.20,-1057.14
    >>Click the |cRXP_PICK_Attack Plan: Valley of Trials|r
    .complete 786,1 --Attack Plan: Valley of Trials destroyed
step
    .goto 1411/1,-4482.52,-917.90
    >>Click the |cRXP_PICK_Attack Plan: Sen'jin Village|r
    >>Click the |cRXP_PICK_Attack Plan: Orgrimmar|r
    .complete 786,2 --Attack Plan: Sen'jin Village destroyed
    .complete 786,3 --Attack Plan: Orgrimmar destroyed
step
    .goto 1411/1,-4410.61,-963.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pal'juh|r
    .accept 99123 >>Accept Lost in the Shadows
    .target Pal'juh
step
    .goto 1411/1,-4841.01,-812.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lar Prowltusk|r
    .turnin 786 >>Turn in Thwarting Kolkar Aggression
    .target Lar Prowltusk
step
    .goto 1411/1,-4680.80,-986.64
    >>Escort Pal'juh out of Kolkar Crag.
    .complete 99123,1 --Escort Pal'juh out of Kolkar Crag.
step
    .goto 1411/1,-4920.33,-813.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Vornal|r
    .turnin 99123 >>Turn in Lost in the Shadows
    .target Master Vornal
step << Orc Warrior
    .goto 1411/1,-4948.35,-769.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trayexir|r
    .vendor >> Vendor trash. Sell your weapon if it gives you enough money for a |T132401:0|t[Large Axe] (4s 60). You'll come back later if you don't have enough yet
    .target Trayexir
step
    #loop
    .goto 1411/1,-4737.91,-318.30,0
    .goto 1411/1,-4737.91,-318.30,40,0
    .goto 1411/1,-4695.08,-287.63,40,0
    .goto 1411/1,-4707.24,-231.58,40,0
    .goto 1411/1,-4671.81,-199.51,40,0
    .goto 1411/1,-4634.27,-186.11,40,0
    .goto 1411/1,-4585.63,-194.22,40,0
    .goto 1411/1,-4665.47,-145.93,40,0
    .goto 1411/1,-4728.92,-169.54,40,0
    .goto 1411/1,-4762.76,-260.84,40,0
    >>Kill |cRXP_ENEMY_Ridgeshade Creepers|r
    >>Kill |cRXP_ENEMY_Ridgeshade Lurkers|r
    .complete 96821,2 --Ridgeshade Creeper slain (6)
    .complete 96821,1 --Ridgeshade Lurker slain (6)
    .mob Ridgeshade Creeper
    .mob Ridgeshade Lurker
step
    .goto 1411/1,-4714.64,140.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brakk|r
    .turnin 96652 >>Turn in The Adventurer
    .accept 96604 >>Accept The Great Outdoors
    .target Brakk
step
    .goto 1411/1,-4716.76,137.84
    >>Click the |cRXP_PICK_Basic Campfire|r
    .complete 96604,1 --Basic Campfire
    .complete 96604,2 --Basic Campfire
step
    .goto 1411/1,-4714.64,140.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brakk|r
    .turnin 96604 >>Turn in The Great Outdoors
    .accept 96655 >>Accept Camping 101: Cooking
    .target Brakk
step
    .goto 1411/1,-4724.69,287.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Orgnil Soulscar|r
    .turnin 823 >>Turn in Report to Orgnil
    .accept 806 >>Accept Dark Storms
    .target Orgnil Soulscar
step
    .goto 1411/1,-4686.09,340.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Grosk|r
    .turnin 2161 >>Turn in A Peon's Burden while you are here
    .isQuestComplete 2161
    .target Innkeeper Grosk
step
    .goto 1411/1,-4709.36,274.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gar'Thok|r
    .turnin 96821 >>Turn in Legging It
    .accept 784 >>Accept Vanquish the Betrayers
    .accept 837 >>Accept Encroachment
    .target Gar'Thok
step
    .goto 1411/1,-4664.94,311.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cook Torka|r
    .accept 815 >>Accept Break a Few Eggs
    .target Cook Torka
    .xp <6,1
step
    .goto 1411/1,-4664.94,311.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cook Torka|r
    .complete 96655,1 --Cook Torka
    .target Cook Torka
step
    .goto 1411/1,-4664.94,311.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cook Torka|r
    .turnin 96655 >>Turn in Camping 101: Cooking
    .accept 815 >>Accept Break a Few Eggs
    .target Cook Torka
step
    .goto 1411/1,-4663.88,310.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to|r |cRXP_FRIENDLY_Torka|r
    .train 2550 >>Train Cooking
    .target Cook Torka
step
    .goto 1411/1,-4599.90,384.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Furl Scornbrow|r
    .accept 791 >>Accept Carry Your Weight
    .target Furl Scornbrow
step << Warrior/Rogue
    .goto 1411/1,-4701.95,366.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krunn|r
    .train 2575 >> Train |T136248:0|t[Mining]
    >>|cRXP_WARN_This will allow you to find|r |T135232:0|t|cRXP_LOOT_[Rough Stones]|r |cRXP_WARN_from nodes in order to craft|r |T135248:0|t[Sharpening Stones] |cRXP_WARN_(+2 Weapon Damage for 30 minutes)|r
    .target Krunn
step << Warrior/Rogue
    .goto 1411/1,-4714.64,372.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dwukk|r
    .train 2018 >> Train |T136241:0|t[Blacksmithing]
    .target Dwukk
step
    #completewith Along63
    >>As you go: Kill |cRXP_ENEMY_Kul Tiras Sailors|r. Kill |cRXP_ENEMY_Kolkar Drudges|r, |cRXP_ENEMY_Kolkar Outrunners|r, |cRXP_ENEMY_Kul Tiras Sailors|r and |cRXP_ENEMY_Kul Tiras Marines|r. Loot them for |cRXP_LOOT_Canvas Scraps|r. |cRXP_WARN_Anything left is finished later|r
    .complete 784,1 --Kul Tiras Sailor slain (10)
    .complete 791,1 --Canvas Scraps (8)
    .mob Kul Tiras Sailor
    .mob Kolkar Drudge
    .mob Kolkar Outrunner
    .mob Kul Tiras Marine
step
    #completewith Along62
    >>As you go: Kill |cRXP_ENEMY_Kul Tiras Marines|r. |cRXP_WARN_Anything left is finished later|r
    .complete 784,2 --Kul Tiras Marine slain (8)
    .mob Kul Tiras Marine
step
    #label Along62
    #loop
    .goto 1411/1,-4995.94,-180.82,0
    .goto 1411/1,-4995.94,-180.82,40,0
    .goto 1411/1,-5102.75,-180.12,40,0
    .goto 1411/1,-5120.19,-245.68,40,0
    >>Pick up |cRXP_PICK_Raider's Bow|r from the ground
    >>Pick up |cRXP_PICK_Raider's Battleaxe|r from the ground
    >>Kill |cRXP_ENEMY_Lieutenant Benedict|r
    .complete 96822,1 --Raider's Bow (1)
    .complete 96822,2 --Raider's Battleaxe (1)
    .complete 784,3 --Lieutenant Benedict slain (1)
    .mob Lieutenant Benedict
step
    #label Along63
    .goto 1411/1,-4952.05,-59.92
    >>Pick up |cRXP_PICK_Raider's Shield|r from the ground
    .complete 96822,3 --Raider's Shield (1)
step
    #loop
    .goto 1411/1,-5003.34,-141.34,0
    .goto 1411/1,-5003.34,-141.34,40,0
    .goto 1411/1,-4982.19,-209.38,40,0
    .goto 1411/1,-4908.69,-219.95,40,0
    .goto 1411/1,-5069.96,-312.31,40,0
    .goto 1411/1,-5188.40,-262.60,40,0
    .goto 1411/1,-5122.84,-238.28,40,0
    .goto 1411/1,-5056.22,-218.54,40,0
    .goto 1411/1,-5086.88,-151.21,40,0
    .goto 1411/1,-5110.68,-77.89,40,0
    >>Kill |cRXP_ENEMY_Kul Tiras Sailors|r
    >>Kill |cRXP_ENEMY_Kul Tiras Marines|r
    >>Kill |cRXP_ENEMY_Kolkar Drudges|r, |cRXP_ENEMY_Kolkar Outrunners|r, |cRXP_ENEMY_Kul Tiras Sailors|r and |cRXP_ENEMY_Kul Tiras Marines|r. Loot them for |cRXP_LOOT_Canvas Scraps|r
    .complete 784,1 --Kul Tiras Sailor slain (10)
    .complete 784,2 --Kul Tiras Marine slain (8)
    .complete 791,1 --Canvas Scraps (8)
    .mob Kul Tiras Sailor
    .mob Kul Tiras Marine
    .mob Kolkar Drudge
    .mob Kolkar Outrunner
step << !Priest !Mage
    .goto 1411/1,-5083.18,37.37,50,0
    .goto 1411/1,-5025.55,126.56,50,0
    .goto 1411/1,-5092.7,246.76,50,0
    .goto 1411/1,-5027.13,311.62,50,0
    .goto 1411/1,-4948.35,276.72,50,0
    .goto 1411/1,-4897.06,82.14,50,0
    .xp 7+2520 >> Grind to 2520+/4500xp
step << !Priest !Mage
    .goto 1411/1,-5083.18,37.37,50,0
    .goto 1411/1,-5025.55,126.56,50,0
    .goto 1411/1,-5092.7,246.76,50,0
    .goto 1411/1,-5027.13,311.62,50,0
    .goto 1411/1,-4948.35,276.72,50,0
    .goto 1411/1,-4897.06,82.14,50,0
    .xp 7+2200 >> Grind to 2200+/4500xp
step << Priest
    .goto 1411/1,-5083.18,37.37,50,0
    .goto 1411/1,-5025.55,126.56,50,0
    .goto 1411/1,-5092.7,246.76,50,0
    .goto 1411/1,-5027.13,311.62,50,0
    .goto 1411/1,-4948.35,276.72,50,0
    .goto 1411/1,-4897.06,82.14,50,0
    .xp 7+2070 >> Grind to 2070+/4500xp
step << Priest
    .goto 1411/1,-5083.18,37.37,50,0
    .goto 1411/1,-5025.55,126.56,50,0
    .goto 1411/1,-5092.7,246.76,50,0
    .goto 1411/1,-5027.13,311.62,50,0
    .goto 1411/1,-4948.35,276.72,50,0
    .goto 1411/1,-4897.06,82.14,50,0
    .xp 7+1750 >> Grind to 1750+/4500xp
step
    .goto 1411/1,-4709.36,274.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gar'Thok|r
    .turnin 784 >>Turn in Vanquish the Betrayers
    .accept 825 >>Accept From The Wreckage....
    .target Gar'Thok
step
    .goto 1411/1,-4709.36,274.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gar'Thok|r
    .accept 831 >>Accept The Admiral's Orders
    .target Gar'Thok
    .isQuestTurnedIn 830 --any of: The Admiral's Orders
step
    .goto 1411/1,-4599.90,384.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Furl Scornbrow|r
    .turnin 791 >>Turn in Carry Your Weight
    .target Furl Scornbrow
step << Shaman
    .goto 1411/1,-4713.06,382.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Uhgar|r
    .vendor >> Vendor trash. Sell your weapon if it gives you enough money for a |T135145:0|t[Walking Stick] (4s 79c). You'll come back later if you don't have enough yet
    .target Uhgar
step << Rogue
    .goto 1411/1,-4713.06,382.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Uhgar|r
    .vendor >> Vendor trash. Sell your weapon if it gives you enough money for a |T135641:0|t[Stiletto] (3s 81c). You'll come back later if you don't have enough yet
    .target Uhgar
step << Orc Warrior
    .goto 1411/1,-4713.06,382.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Uhgar|r
    .vendor >> Vendor trash. Sell your weapon if it gives you enough money for a |T132401:0|t[Large Axe] (4s 60c). You'll come back later if you don't have enough yet
    .target Uhgar
step << Troll Warrior
    .goto 1411/1,-4713.06,382.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Uhgar|r
    .vendor >> Vendor trash. Sell your weapon if it gives you enough money for a |T135421:0|t[Tomahawk] (5s 13c). You'll come back later if you don't have enough yet
    .target Uhgar
step << Hunter
    .goto 1411/1,-4763.29,361.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ghrawt|r
    .vendor >> Vendor trash. Sell your weapon if it gives you enough money for a |T135499:0|t[Hornwood Recurve Bow] (2s 83c). You'll come back later if you don't have enough yet
    .target Ghrawt
step
    .goto 1411/1,-4686.09,340.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Grosk|r
    .turnin 2161 >>Turn in A Peon's Burden
    .target Innkeeper Grosk
    .home >>Set your Hearthstone to Innkeeper Grosk's inn
step
    .goto 1411/1,-4686.09,340.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Grosk|r
    >>|cRXP_BUY_Buy|r |T132815:0|t[Ice Cold Milk] |cRXP_BUY_from him|r << Mage/Warlock/Priest/Shaman/Druid
    >>|cRXP_BUY_Buy|r |T133974:0|t[Haunch of Meat] |cRXP_BUY_from him|r << Rogue/Warrior
    >>|cRXP_WARN_Save 4 silver for your class spells!|r << Rogue/Warrior/Shaman/Warlock
    >>|cRXP_WARN_Save 2 silver for your class spells!|r << Priest
    .vendor >> Vendor Trash
    .target Innkeeper Grosk
    .train 6760,1 << Rogue
    .train 139,1 << Priest
    .train 980,1 << Warlock
    .train 8044,1 << Shaman
    .train 284,1 << Warrior
step << !Mage !Hunter !Druid
    .goto 1411/1,-4686.09,340.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Grosk|r
    >>|cRXP_BUY_Buy|r |T132815:0|t[Ice Cold Milk] |cRXP_BUY_from him|r << Mage/Warlock/Priest/Shaman/Druid
    >>|cRXP_BUY_Buy|r |T133974:0|t[Haunch of Meat] |cRXP_BUY_from him|r << Rogue/Warrior
    .vendor >> Vendor Trash
    .target Innkeeper Grosk
    .train 6760,3 << Rogue
    .train 139,3 << Priest
    .train 980,3 << Warlock
    .train 8044,3 << Shaman
    .train 284,3 << Warrior
step
    .goto 1411/1,-4815.11,307.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Turroc|r
    .turnin 96822 >>Turn in For Honor
    .target Turroc
step << Warrior
    .goto 1411/1,-4827.27,311.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tarshaw|r
    .train 284 >> Train your class spells
    .target Tarshaw Jaggedscar
step << Shaman
    .goto 1411/1,-4839.96,307.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Swart|r
    .train 8044 >> Train your class spells
    .target Swart
step << Warlock
    .goto 1411/1,-4837.31,356.030
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dhugru|r
    .train 1120 >> Train your class spells
    .target Dhugru Gorelust
step << Warlock
    .goto 1411/1,-4854.76,345.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kitha|r and buy |T133738:0|t[Firebolt Rank 2]
    .collect 16302,1,825,1
    .target Kitha
    .money <0.01
    .train 7799,1
step << Hunter
    .goto 1411/1,-4704.07,275.31
    >>Go inside the bunker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thotar|r inside
    .train 5116 >> Train your class spells
    .target Thotar
step << Rogue
    .goto 1411/1,-4710.94,268.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kaplak|r
    .train 6760 >> Train your class spells
    .target Kaplak
step << Troll Priest
    .goto 1411/1,-4831.50,295.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tai'jin|r
    .turnin 5649 >>Turn in In Favor of Spirituality
    .accept 5648 >>Accept Garments of Spirituality
    .target Tai'jin
step << Priest
    .goto 1411/1,-4831.5,295.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tai'jin|r
    .train 2052 >> Train |T135929:0|t[Lesser Heal Rank 2]
    .target Tai'jin
step << Troll Priest
    .goto 1411/1,-4770.16,170.62
    >>Interact with |cRXP_FRIENDLY_Grunt Kor'ja|r
    .complete 5648,1 --Grunt Kor'ja
    .target Grunt Kor'ja
step << Troll Priest
    .goto 1411/1,-4831.50,295.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tai'jin|r
    .turnin 5648 >>Turn in Garments of Spirituality
    .target Tai'jin
step << Priest
    .goto 1411/1,-4831.5,295.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tai'jin|r
    .trainer >> Train your class spells
    .target Tai'jin
step << Rogue/Warrior
    .goto 1411/1,-4826.74,330.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rawrk|r
    .train 3273 >>Train |T135966:0|t[First Aid]
    .money <0.01
    .target Rawrk
step
    #completewith Along73
    >>As you go: Kill |cRXP_ENEMY_Makrura Clackers|r, |cRXP_ENEMY_Makrura Shellhides|r, |cRXP_ENEMY_Makrura Snapclaws|r and |cRXP_ENEMY_Makrura Elders|r. Loot them for |cRXP_LOOT_Intact Makrura Eye|r. |cRXP_WARN_Anything left is finished later|r
    .complete 818,1 --Intact Makrura Eye (4)
    .mob Makrura Clacker
    .mob Makrura Shellhide
    .mob Makrura Snapclaw
    .mob Makrura Elder
step
    #label Along73
    #loop
    .goto 1411/1,-5308.96,-211.84,0
    .goto 1411/1,-5308.96,-211.84,40,0
    .goto 1411/1,-5306.84,-239.34,40,0
    .goto 1411/1,-5268.24,-326.76,40,0
    .goto 1411/1,-5263.49,-301.73,40,0
    >>Loot the |cRXP_PICK_Gnomish Toolboxes|r for |cRXP_LOOT_Gnomish Tools|r
    .complete 825,1 --Gnomish Tools (3)
step
    #completewith Along74
    >>As you go: Kill |cRXP_ENEMY_Durotar Tigers|r and |cRXP_ENEMY_Shal'mas|r. Loot them for |cRXP_LOOT_Durotar Tiger Fur|r. Loot the |cRXP_PICK_Taillasher Eggs|r for |cRXP_LOOT_Taillasher Egg|r. |cRXP_WARN_Anything left is finished later|r
    .complete 817,1 --Durotar Tiger Fur (4)
    .complete 815,1 --Taillasher Egg (3)
    .mob Durotar Tiger
    .mob Shal'ma
step
    #label Along74
    .goto 1411/1,-5600.83,-721.91
    >>Kill |cRXP_ENEMY_Bloodtalon Matriarch|r and loot |cRXP_LOOT_Bloodtalon Martriarch Eggs|r
    .complete 97223,1 --Bloodtalon Martriarch Eggs (1)
    .mob Bloodtalon Matriarch
step
    #loop
    .goto 1411/1,-5547.42,-1061.02,0
    .goto 1411/1,-5547.42,-1061.02,40,0
    .goto 1411/1,-5485.56,-1118.83,40,0
    .goto 1411/1,-5404.66,-1089.22,40,0
    .goto 1411/1,-5394.09,-1198.49,40,0
    .goto 1411/1,-5409.95,-1290.14,40,0
    .goto 1411/1,-5520.46,-1317.64,40,0
    .goto 1411/1,-5582.32,-1251.01,40,0
    .goto 1411/1,-5616.16,-1180.87,40,0
    .goto 1411/1,-5512.53,-1187.56,40,0
    >>Open the |cRXP_PICK_Imprisoned Darkspear|r. Loot it for |cRXP_LOOT_Minshina's Skull|r
    >>Kill |cRXP_ENEMY_Zalazane|r and loot |cRXP_LOOT_Zalazane's Head|r
    >>Kill |cRXP_ENEMY_Hexed Trolls|r
    >>Kill |cRXP_ENEMY_Voodoo Trolls|r
    >>Pick up |cRXP_PICK_Forgotten Loa Idol|r from the ground
    .complete 808,1 --Minshina's Skull (1)
    .complete 826,3 --Zalazane's Head (1)
    .complete 826,1 --Hexed Troll slain (8)
    .complete 826,2 --Voodoo Troll slain (8)
    .complete 97225,1 --Forgotten Loa Idol (8)
    .mob Zalazane
    .mob Hexed Troll
    .mob Voodoo Troll
step
    #loop
    .goto 1411/1,-5336.45,-1141.39,0
    .goto 1411/1,-5336.45,-1141.39,40,0
    .goto 1411/1,-5383.51,-1046.92,40,0
    .goto 1411/1,-5182.06,-969.37,40,0
    .goto 1411/1,-5170.95,-1092.74,40,0
    .goto 1411/1,-5126.01,-1127.64,40,0
    .goto 1411/1,-5114.91,-1178.05,40,0
    .goto 1411/1,-5082.12,-1383.55,40,0
    .goto 1411/1,-5145.05,-1344.07,40,0
    .goto 1411/1,-5215.37,-1350.42,40,0
    >>Kill |cRXP_ENEMY_Durotar Tigers|r and |cRXP_ENEMY_Shal'mas|r. Loot them for |cRXP_LOOT_Durotar Tiger Fur|r
    >>Loot the |cRXP_PICK_Taillasher Eggs|r for |cRXP_LOOT_Taillasher Egg|r
    .complete 817,1 --Durotar Tiger Fur (4)
    .complete 815,1 --Taillasher Egg (3)
    .mob Durotar Tiger
    .mob Shal'ma
step
    #loop
    .goto 1411/1,-5039.30,-969.72,0
    .goto 1411/1,-5039.30,-969.72,40,0
    .goto 1411/1,-4985.89,-942.93,40,0
    .goto 1411/1,-4950.99,-980.65,40,0
    .goto 1411/1,-4915.04,-1021.18,40,0
    .goto 1411/1,-4881.73,-1073.35,40,0
    .goto 1411/1,-4819.86,-1088.51,40,0
    .goto 1411/1,-4787.61,-1115.65,40,0
    .goto 1411/1,-4749.01,-1118.83,40,0
    .goto 1411/1,-4853.18,-1150.90,40,0
    >>Kill |cRXP_ENEMY_Pygmy Surf Crawlers|r, |cRXP_ENEMY_Surf Crawlers|r, |cRXP_ENEMY_Encrusted Surf Crawlers|r and |cRXP_ENEMY_Corrupted Surf Crawlers|r. Loot them for |cRXP_LOOT_Crawler Mucus|r
    .complete 818,2 --Crawler Mucus (8)
    .mob Pygmy Surf Crawler
    .mob Surf Crawler
    .mob Encrusted Surf Crawler
    .mob Corrupted Surf Crawler
step
    #loop
    .goto 1411/1,-5149.80,-782.54,0
    .goto 1411/1,-5149.80,-782.54,40,0
    .goto 1411/1,-5118.61,-744.12,40,0
    .goto 1411/1,-5151.39,-714.86,40,0
    .goto 1411/1,-5250.80,-555.18,40,0
    .goto 1411/1,-5246.04,-619.33,40,0
    .goto 1411/1,-5211.67,-648.59,40,0
    .goto 1411/1,-5191.05,-747.64,40,0
    >>Kill |cRXP_ENEMY_Makrura Clackers|r, |cRXP_ENEMY_Makrura Shellhides|r, |cRXP_ENEMY_Makrura Snapclaws|r and |cRXP_ENEMY_Makrura Elders|r. Loot them for |cRXP_LOOT_Intact Makrura Eye|r
    .complete 818,1 --Intact Makrura Eye (4)
    .mob Makrura Clacker
    .mob Makrura Shellhide
    .mob Makrura Snapclaw
    .mob Makrura Elder
step
    .goto 1411/1,-4948.88,-768.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trayexir|r
    >>|cRXP_WARN_Jump into the hut|r
    .vendor >> Vendor trash and repair
    .target Trayexir
    .isOnQuest 808
step << Mage
    .goto 1411/1,-4939.36,-838.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Un'Thuwa|r
    .train 118 >> Train your class spells
    .target Un'Thuwa
step
    .goto 1411/1,-4921.38,-797.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vel'rin Fang|r
    .turnin 817 >>Turn in Practical Prey while you are here
    .isQuestComplete 817
    .target Vel'rin Fang
step
    .goto 1411/1,-4920.86,-825.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Gadrin|r
    .turnin 808 >>Turn in Minshina's Skull while you are here
    .isQuestComplete 808
    .target Master Gadrin
step
    .goto 1411/1,-4920.86,-825.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Gadrin|r
    .turnin 97225 >>Turn in Forgotten Loa Idols while you are here
    .isQuestComplete 97225
    .target Master Gadrin
step
    .goto 1411/1,-4920.86,-825.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Gadrin|r
    .turnin 826 >>Turn in Zalazane while you are here
    .isQuestComplete 826
    .target Master Gadrin
step
    .goto 1411/1,-4885.43,-852.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Xar'Ti|r
    .turnin 97223 >>Turn in Bloodtalon Matriarch while you are here
    .isQuestComplete 97223
    .target Xar'Ti
step
    .goto 1411/1,-4920.33,-813.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Vornal|r
    .turnin 818 >>Turn in A Solvent Spirit
    .target Master Vornal
step << Warlock/Mage/Priest
    .goto 1411/1,-4938.83,-779.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_Talk to|r |cRXP_FRIENDLY_K'waii|r
    >>|cRXP_BUY_Buy|r |T132794:0|t[Refreshing Spring Water] |cRXP_BUY_from her|r
    .vendor >> Vendor trash
    .collect 159,20,784,1
    .target K'waii
step << !Warlock !Mage !Priest
    .goto 1411/1,-4903.41,-786.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hai'zan|r
    >>|cRXP_BUY_Buy|r |T133974:0|t[Haunch of Meat] |cRXP_BUY_from him if you can afford it|r << Warrior/Rogue
    .vendor >> Vendor trash
    .target Hai'zan
step
    .goto 1411/1,-4920.86,-825.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Gadrin|r
    .turnin 808 >>Turn in Minshina's Skull
    .turnin 826 >>Turn in Zalazane
    .turnin 97225 >>Turn in Forgotten Loa Idols
    .target Master Gadrin
step
    .goto 1411/1,-4921.38,-797.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vel'rin Fang|r
    .turnin 817 >>Turn in Practical Prey
    .target Vel'rin Fang
step
    .goto 1411/1,-4885.43,-852.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Xar'Ti|r
    .turnin 97223 >>Turn in Bloodtalon Matriarch
    .target Xar'Ti
step
    #loop
    .goto 1411/1,-4616.82,24.68,0
    .goto 1411/1,-4616.82,24.68,40,0
    .goto 1411/1,-4659.12,109.28,40,0
    .goto 1411/1,-4585.10,130.43,40,0
    .goto 1411/1,-4489.92,88.13,40,0
    .goto 1411/1,-4331.30,66.98,40,0
    .goto 1411/1,-4278.42,35.26,40,0
    .goto 1411/1,-4336.59,28.21,40,0
    .goto 1411/1,-4452.91,49.36,40,0
    .goto 1411/1,-4553.37,74.03,40,0
    >>Kill |cRXP_ENEMY_Razormane Quilboars|r
    >>Kill |cRXP_ENEMY_Razormane Scouts|r
    >>Pick up |cRXP_PICK_Prickly Pear Fruit|r from the ground
    .complete 837,1 --Razormane Quilboar slain (4)
    .complete 837,2 --Razormane Scout slain (4)
    .complete 96825,1 --Prickly Pear Fruit (8)
    .mob Razormane Quilboar
    .mob Razormane Scout
step
    #loop
    .goto 1411/1,-4320.72,377.18,0
    .goto 1411/1,-4320.72,377.18,40,0
    .goto 1411/1,-4225.55,299.63,40,0
    .goto 1411/1,-4140.95,433.58,40,0
    .goto 1411/1,-4172.67,525.23,40,0
    .goto 1411/1,-4225.55,489.98,40,0
    .goto 1411/1,-4310.15,539.33,40,0
    .goto 1411/1,-4352.45,447.68,40,0
    .goto 1411/1,-4299.57,461.78,40,0
    .goto 1411/1,-4236.12,419.48,40,0
    >>Kill |cRXP_ENEMY_Razormane Dustrunners|r
    >>Kill |cRXP_ENEMY_Razormane Battleguards|r
    .complete 837,3 --Razormane Dustrunner slain (4)
    .complete 837,4 --Razormane Battleguard slain (4)
    .mob Razormane Dustrunner
    .mob Razormane Battleguard
step << Hunter
    .goto 1411/1,-4475.12,92.72,0
    .goto 1411/1,-4475.12,92.72,50,0
    .goto 1411/1,-4401.09,205.52,50,0
    .goto 1411/1,-4270.49,260.51,50,0
    .goto 1411/1,-4166.33,233.01,50,0
    .goto 1411/1,-4130.37,182.25,50,0
    .goto 1411/1,-4208.1,98.71,50,0
    .goto 1411/1,-4300.1,57.11,50,0
    .goto 1411/1,-4456.61,65.57,50,0
    .xp 9+4470 >> Grind to 4470+/6500xp
step
    .goto 1411/1,-4664.94,311.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cook Torka|r
    .turnin 815 >>Turn in Break a Few Eggs
    .turnin 96825 >>Turn in This Fruit Could Bite Back
    .target Cook Torka
step
    .goto 1411/1,-4724.69,287.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Orgnil Soulscar|r
    .accept 99048 >>Accept A Missing Hand
    .target Orgnil Soulscar
    .xp <9,1
step
    .goto 1411/1,-4709.36,274.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gar'Thok|r
    .turnin 825 >>Turn in From The Wreckage....
    .turnin 837 >>Turn in Encroachment
    .target Gar'Thok
step << Orc Hunter/Troll Hunter
    #completewith next
    .zone 1454 >>Travel to Orgrimmar
    .zoneskip 1454
step << Orc Hunter/Troll Hunter
    .xp 10 >>Grind to level 10 (The Hunter's Path needs it)
step << Orc Hunter/Troll Hunter
    .goto 1454/1,-4633.81,2107.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sian'dur|r
    .accept 6068 >>Accept The Hunter's Path
    .target Sian'dur
step << Orc Hunter/Troll Hunter
    #completewith next
    .zone 1411 >>Leave Orgrimmar for Durotar
    .zoneskip 1411
step << Orc Hunter/Troll Hunter
    #completewith next
    .hs >>Hearth to Innkeeper Grosk's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step << Orc Hunter/Troll Hunter
    .goto 1411/1,-4704.07,275.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thotar|r
    .turnin 6068 >>Turn in The Hunter's Path
    .accept 6062 >>Accept Taming the Beast
    .target Thotar
step << Hunter
    .goto 1411/1,-4704.07,275.31
    >>Go inside the bunker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thotar|r inside
    .trainer >> Train your class spells
    .target Thotar
step
    .goto 1411/1,-4724.69,287.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Orgnil Soulscar|r
    .accept 99048 >>Accept A Missing Hand
    .target Orgnil Soulscar
step << Orc Hunter/Troll Hunter
    #loop
    .goto 1411/1,-4286.36,282.01,0
    .goto 1411/1,-4286.36,282.01,40,0
    .goto 1411/1,-4229.78,283.77,40,0
    .goto 1411/1,-4241.94,258.74,40,0
    .goto 1411/1,-4188.01,248.52,40,0
    .goto 1411/1,-4135.66,224.90,40,0
    .goto 1411/1,-4221.32,186.13,40,0
    .goto 1411/1,-4274.19,172.03,40,0
    .goto 1411/1,-4226.08,127.61,40,0
    >>Interact with |cRXP_FRIENDLY_Dire Mottled Boar|r
    .complete 6062,1 --Dire Mottled Boar
    .target Dire Mottled Boar
step << Orc Hunter/Troll Hunter
    .goto 1411/1,-4704.07,275.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thotar|r
    .turnin 6062 >>Turn in Taming the Beast
    .accept 6083 >>Accept Taming the Beast
    .target Thotar
step << Orc Hunter/Troll Hunter
    #loop
    .goto 1411/1,-5352.32,-735.31,0
    .goto 1411/1,-5352.32,-735.31,40,0
    .goto 1411/1,-5462.30,-686.66,40,0
    .goto 1411/1,-5406.25,-750.46,40,0
    .goto 1411/1,-5470.76,-761.04,40,0
    .goto 1411/1,-5425.28,-822.73,40,0
    .goto 1411/1,-5448.55,-857.62,40,0
    .goto 1411/1,-5518.87,-852.69,40,0
    .goto 1411/1,-5507.24,-885.12,40,0
    >>Interact with |cRXP_FRIENDLY_Surf Crawler|r
    .complete 6083,1 --Surf Crawler
    .target Surf Crawler
step
    .goto 1411/1,-5060.97,200.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Heglan Shadeeye|r
    .turnin 99048 >>Turn in A Missing Hand
    .accept 99049 >>Accept Threat from Below
    .target Heglan Shadeeye
step
    #loop
    .goto 1411/1,-5074.19,245.00,0
    .goto 1411/1,-5074.19,245.00,40,0
    .goto 1411/1,-5140.82,229.13,40,0
    .goto 1411/1,-5139.23,311.97,40,0
    >>Open the |cRXP_PICK_Abandoned Dagger|r. Loot it for |cRXP_LOOT_Orcish Dagger|r
    >>Open the |cRXP_PICK_Weapon Piece|r. Loot it for |cRXP_LOOT_Broken Bone Trident|r
    >>Open the |cRXP_PICK_Strange Debris|r. Loot it for |cRXP_LOOT_Banner Scrap|r
    .complete 99049,1 --Orcish Dagger (1)
    .complete 99049,3 --Broken Bone Trident (1)
    .complete 99049,2 --Banner Scrap (1)
step
    .goto 1411/1,-4724.69,287.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Orgnil Soulscar|r
    .turnin 99049 >>Turn in Threat from Below
    .accept 99051 >>Accept Threat from Below
    .target Orgnil Soulscar
step << Orc Hunter/Troll Hunter
    .goto 1411/1,-4704.07,275.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thotar|r
    .turnin 6083 >>Turn in Taming the Beast
    .accept 6082 >>Accept Taming the Beast
    .target Thotar
step << Orc Rogue
    .goto 1411/1,-4710.94,268.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kaplak|r
    .accept 1859 >>Accept Therzok
    .target Kaplak
    .xp <10,1
step
    .goto 1411/1,-4650.66,271.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Takrin Pathseeker|r
    .accept 840 >>Accept Conscript of the Horde
    .target Takrin Pathseeker
    .xp <10,1
step << Orc Hunter/Troll Hunter
    #loop
    .goto 1411/1,-4518.48,446.98,0
    .goto 1411/1,-4518.48,446.98,40,0
    .goto 1411/1,-4569.24,516.42,40,0
    .goto 1411/1,-4476.71,508.67,40,0
    .goto 1411/1,-4477.76,552.73,40,0
    .goto 1411/1,-4439.16,555.90,40,0
    >>Interact with |cRXP_FRIENDLY_Armored Scorpid|r
    .complete 6082,1 --Armored Scorpid
    .target Armored Scorpid
step << Orc Hunter/Troll Hunter
    .goto 1411/1,-4704.07,275.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thotar|r
    .turnin 6082 >>Turn in Taming the Beast
    .accept 6081 >>Accept Training the Beast
    .target Thotar
step << Hunter
    .goto 1411/1,-4666.0,305.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grimtak|r
    >>|cRXP_BUY_Buy|r |T133972:0|t[Tough Jerky] |cRXP_BUY_from him|r. |cRXP_BUY_You will use this to feed your pet later|r
    .vendor >> Vendor Trash
    .collect 117,5,828,1
    .target Grimtak
    .isQuestTurnedIn 6062
step << Orc Rogue
    .xp 10 >>Grind to level 10 (Therzok needs it)
step << Orc Rogue
    .goto 1411/1,-4710.94,268.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kaplak|r
    .accept 1859 >>Accept Therzok
    .target Kaplak
step
    .goto 1411/1,-4650.66,271.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Takrin Pathseeker|r
    .accept 840 >>Accept Conscript of the Horde
    .target Takrin Pathseeker
    .xp <10,1
step
    .goto 1411/1,-4241.41,742.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Misha Tor'kren|r
    .accept 816 >>Accept Lost But Not Forgotten
    .target Misha Tor'kren
step
    .goto 1411/1,-4414.31,999.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rezlak|r
    .accept 834 >>Accept Winds in the Desert
    .target Rezlak
step
    #loop
    .goto 1411/1,-4558.66,1012.04,0
    .goto 1411/1,-4558.66,1012.04,40,0
    .goto 1411/1,-4590.92,1036.71,40,0
    .goto 1411/1,-4651.19,894.65,40,0
    .goto 1411/1,-4695.61,829.44,40,0
    .goto 1411/1,-4634.27,845.30,40,0
    .goto 1411/1,-4598.85,860.81,40,0
    .goto 1411/1,-4611.01,900.65,40,0
    .goto 1411/1,-4611.54,944.36,40,0
    .goto 1411/1,-4590.39,950.00,40,0
    >>Loot the |cRXP_PICK_Stolen Supply Sacks|r for |cRXP_LOOT_Sack of Supplies|r
    .complete 834,1 --Sack of Supplies (5)
step
    .goto 1411/1,-4414.31,999.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rezlak|r
    .turnin 834 >>Turn in Winds in the Desert
    .accept 835 >>Accept Securing the Lines
    .target Rezlak
step
    .goto 1411/1,-4189.59,868.57
    >>Kill |cRXP_ENEMY_Fizzle Darkstorm|r and loot |cRXP_LOOT_Fizzle's Claw|r
    .complete 806,1 --Fizzle's Claw (1)
    .mob Fizzle Darkstorm
step
    .goto 1411/1,-4158.93,1152.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rhinag|r
    .accept 812 >>Accept Need for a Cure
    .target Rhinag
step << Shaman
    .goto 1411/1,-4265.73,1276.76,0
    .goto 1411/1,-4297.46,1131.89,60,0
    .goto 1411/1,-4295.87,1208.38,60,0
    .goto 1411/1,-4265.73,1276.76,60,0
    .xp 9+2520 >>Grind to 2520+/6500 into level 9
step
    #completewith next
    .zone 1454 >>Travel to Orgrimmar
    .zoneskip 1454
step << Troll Priest
    .goto 1454/1,-4179.79,1452.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ur'kyo|r
    .turnin 5655 >>Turn in Hex of Weakness
    .target Ur'kyo
    .isOnQuest 5655
step << Troll Priest
    .goto 1454/1,-4179.79,1452.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ur'kyo|r
    .turnin 5657 >>Turn in Hex of Weakness
    .target Ur'kyo
    .isOnQuest 5657
step << Troll Priest
    .goto 1454/1,-4179.79,1452.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ur'kyo|r
    .turnin 5656 >>Turn in Hex of Weakness
    .target Ur'kyo
    .isOnQuest 5656
step << Troll Priest
    .goto 1454/1,-4179.79,1452.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ur'kyo|r
    .accept 5652 >>Accept Hex of Weakness
    .target Ur'kyo
    .xp <10,1
step << Mage
    .goto 1454/1,-4229.86,1466.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Uthel'nay|r
    .accept 1883 >>Accept Speak with Un'thuwa
    .target Uthel'nay
    .xp <10,1
step
    .goto 1454/1,-4343.19,1772.68
    >>Kill |cRXP_ENEMY_Kor'ghan|r and loot |cRXP_LOOT_Venomtail Antidote|r
    .complete 812,1 --Venomtail Antidote (1)
    .mob Kor'ghan
step << Orc Rogue
    .goto 1454/1,-4279.93,1772.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Therzok|r
    .turnin 1859 >>Turn in Therzok
    .target Therzok
step
    .goto 1454/1,-4161.41,1905.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eitrigg|r
    .accept 787 >>Accept The New Horde
    .target Eitrigg
step << Shaman
    .goto 1454/1,-4213.03,1920.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Searn Firewarder|r
    .accept 1522 >>Accept Call of Fire
    .target Searn Firewarder
    .xp <10,1
step << Orc Hunter/Troll Hunter
    .goto 1454/1,-4607.02,2100.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ormak Grimshot|r
    .turnin 6081 >>Turn in Training the Beast
    .target Ormak Grimshot
step << Hunter
    .goto 1454/1,-4611.09,2135.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Xao'tsu|r
    .train 24547 >>Train your pet spells
    .target Xao'tsu
step << Tauren Hunter
    .goto 1454/1,-4633.81,2107.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sian'dur|r
    .accept 6066 >>Accept The Hunter's Path
    .target Sian'dur
    .xp <10,1
step
    .goto 1454/1,-4133.64,1939.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nazgrel|r
    .turnin 831 >>Turn in The Admiral's Orders
    .target Nazgrel
    .isOnQuest 831
step
    .goto 1454/1,-4125.65,1920.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thrall|r
    .accept 5726 >>Accept Hidden Enemies
    .target Thrall
step << Priest
    .goto 1411/1,-4162.63,943.30,40,0
    .goto 1411/1,-4073.80,953.87,40,0
    .goto 1411/1,-4026.21,866.10,40,0
    .goto 1411/1,-4035.20,687.38
    .xp 9+3150 >>Grind to 3150+/6500 into level 9
step
    .goto 1411/1,-4686.09,340.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Grosk|r
    .vendor >> Vendor Trash
    >>|cRXP_BUY_Buy|r |T132815:0|t[Ice Cold Milk] |cRXP_BUY_from him|r << Mage/Warlock/Priest/Shaman
    >>|cRXP_BUY_Buy|r |T133974:0|t[Haunch of Meat] |cRXP_BUY_from him|r << Rogue/Warrior
    .collect 1179,15,828,1 << Mage/Warlock/Priest/Shaman
    .collect 2287,15,828,1 << Rogue/Warrior
    .target Innkeeper Grosk
    .money <0.0375
step << Shaman
    .goto 1454/1,-4213.03,1920.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Searn Firewarder|r
    .accept 1522 >>Accept Call of Fire
    .target Searn Firewarder
    .xp <10,1
step
    #completewith next
    .zone 1411 >>Leave Orgrimmar for Durotar
    .zoneskip 1411
step
    #completewith next
    .hs >>Hearth to Innkeeper Grosk's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1411/1,-4724.69,287.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Orgnil Soulscar|r
    .turnin 806 >>Turn in Dark Storms
    .accept 828 >>Accept Margoz
    .target Orgnil Soulscar
step << Warrior
    .goto 1411/1,-4827.27,311.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tarshaw|r
    .train 6546 >> Train your class spells
    .target Tarshaw Jaggedscar
step << Shaman
    .goto 1411/1,-4839.96,307.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Swart|r
    .train 8050 >> Train your class spells
    .target Swart
step << Warlock
    .goto 1411/1,-4854.76,345.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kitha|r and buy |T133738:0|t[Firebolt Rank 2]
    .collect 16302,1,837,1
    .target Kitha
    .money <0.01
    .train 7799,1
step << Undead Priest
    .goto 1411/1,-4831.50,295.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tai'jin|r
    .accept 5660 >>Accept Touch of Weakness
    .target Tai'jin
step << Hunter
    .goto 1411/1,-4704.07,275.31
    >>Go inside the bunker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thotar|r inside
    .train 13549 >> Train your class spells
    .target Thotar
step << Rogue
    .goto 1411/1,-4710.94,268.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kaplak|r
    .train 674 >> Train your class spells
    .target Kaplak
step << Warrior
    .goto 1411/1,-4827.80,311.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tarshaw Jaggedscar|r
    .accept 1505 >>Accept Veteran Uzzek
    .target Tarshaw Jaggedscar
    .xp <10,1
step << Warlock
    .goto 1411/1,-4837.31,352.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ophek|r
    .accept 1506 >>Accept Gan'rul's Summons
    .target Ophek
    .xp <10,1
step
    .goto 1411/1,-4650.66,271.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Takrin Pathseeker|r
    .accept 840 >>Accept Conscript of the Horde
    .target Takrin Pathseeker
step
    #loop
    .goto 1411/1,-4977.96,745.90,0
    .goto 1411/1,-4977.96,745.90,40,0
    .goto 1411/1,-4984.83,830.85,40,0
    .goto 1411/1,-5029.78,893.24,40,0
    .goto 1411/1,-5117.55,861.52,40,0
    .goto 1411/1,-5109.09,821.69,40,0
    .goto 1411/1,-5056.74,823.10,40,0
    .goto 1411/1,-5099.04,752.60,40,0
    .goto 1411/1,-5056.74,776.21,40,0
    .goto 1411/1,-5018.67,775.86,40,0
    >>Kill |cRXP_ENEMY_Spitelash Scouts|r and |cRXP_ENEMY_Spitelash Attendants|r. Loot them for |cRXP_LOOT_Naga Spinefin|r
    .complete 99051,1 --Naga Spinefin (9)
    .mob Spitelash Scout
    .mob Spitelash Attendant
step << Shaman
    .goto 1411/1,-4000.83,-270.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Telf Joolam|r
    .turnin 1524 >>Turn in Call of Fire
    .target Telf Joolam
    .isOnQuest 1524
step << Shaman
    .goto 1411/1,-4000.83,-270.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Telf Joolam|r
    .accept 1525 >>Accept Call of Fire
    .target Telf Joolam
    .isQuestTurnedIn 1524 --any of: Call of Fire
    .xp <10,1
step << Shaman
    #loop
    .goto 1411/1,-4733.68,863.63,0
    .goto 1411/1,-4733.68,863.63,40,0
    .goto 1411/1,-4745.84,878.09,40,0
    .goto 1411/1,-4747.43,914.39,40,0
    .goto 1411/1,-4745.31,927.79,40,0
    .goto 1411/1,-4724.16,943.30,40,0
    .goto 1411/1,-4706.18,902.06,40,0
    >>Kill |cRXP_ENEMY_Burning Blade Cultist|r and loot |cRXP_LOOT_Reagent Pouch|r
    .complete 1525,2 --Reagent Pouch (1)
    .mob Burning Blade Cultist
    .isOnQuest 1525
step
    .goto 1411/1,-4945.18,1101.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Margoz|r
    .turnin 828 >>Turn in Margoz
    .accept 827 >>Accept Skull Rock
    .target Margoz
step
    #completewith Drop97281x1
    >>|cRXP_LOOT_Dull Storm Orb|r can drop from |cRXP_ENEMY_Dustwind Storm Witch|r, |cRXP_ENEMY_Dustwind Eggtender|r. Use it to start the quest if you get one
    .collect 277661,1,97281 --Dull Storm Orb (1)
    .accept 97281 >>Accept A Simmering Storm
    .use 277661
step
    #label Drop97281x1
    #loop
    .goto 1411/1,-4801.36,1036.71,0
    .goto 1411/1,-4801.36,1036.71,40,0
    .goto 1411/1,-4820.92,945.77,40,0
    .goto 1411/1,-4815.63,880.55,40,0
    .goto 1411/1,-4772.81,781.15,40,0
    .goto 1411/1,-4705.65,880.91,40,0
    .goto 1411/1,-4732.62,965.15,40,0
    .goto 1411/1,-4670.76,988.77,40,0
    .goto 1411/1,-4688.73,1045.17,40,0
    .goto 1411/1,-4689.26,1137.53,40,0
    >>Kill |cRXP_ENEMY_Burning Blade Thugs|r, |cRXP_ENEMY_Burning Blade Neophytes|r, |cRXP_ENEMY_Burning Blade Fanatics|r and |cRXP_ENEMY_Burning Blade Apprentices|r. Loot them for |cRXP_LOOT_Searing Collar|r
    >>Kill |cRXP_ENEMY_Dustwind Savages|r
    >>Kill |cRXP_ENEMY_Dustwind Storm Witches|r
    .complete 827,1 --Searing Collar (6)
    .complete 835,1 --Dustwind Savage slain (12)
    .complete 835,2 --Dustwind Storm Witch slain (8)
    .mob Burning Blade Thug
    .mob Burning Blade Neophyte
    .mob Burning Blade Fanatic
    .mob Burning Blade Apprentice
    .mob Dustwind Savage
    .mob Dustwind Storm Witch
step
    .goto 1411/1,-4414.31,999.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rezlak|r
    .turnin 835 >>Turn in Securing the Lines
    .target Rezlak
step
    .goto 1411/1,-4414.31,999.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rezlak|r
    .turnin 97281 >>Turn in A Simmering Storm
    .target Rezlak
    .isOnQuest 97281
step
    .goto 1411/1,-4414.31,999.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rezlak|r
    .accept 97282 >>Accept Stormy Potential
    .target Rezlak
    .isQuestTurnedIn 97281 --A Simmering Storm
    .xp <7,1
step
    #loop
    .goto 1411/1,-4269.44,957.40,0
    .goto 1411/1,-4269.44,957.40,40,0
    .goto 1411/1,-4249.87,947.88,40,0
    .goto 1411/1,-4206.51,947.18,40,0
    .goto 1411/1,-4112.93,945.77,40,0
    .goto 1411/1,-4043.66,930.61,40,0
    .goto 1411/1,-4052.12,978.55,40,0
    .goto 1411/1,-4086.49,955.64,40,0
    .goto 1411/1,-4151.00,950.35,40,0
    .goto 1411/1,-4229.25,971.85,40,0
    >>Kill |cRXP_ENEMY_Thunder Lizards|r and |cRXP_ENEMY_Lightning Hides|r. Loot them for |cRXP_LOOT_Charged Thunder Lizard Organ|r
    .complete 97282,1 --Charged Thunder Lizard Organ (5)
    .mob Thunder Lizard
    .mob Lightning Hide
    .isOnQuest 97282
step
    .goto 1411/1,-4414.31,999.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rezlak|r
    .turnin 97282 >>Turn in Stormy Potential
    .target Rezlak
    .isOnQuest 97282
step
    #completewith Along129
    >>As you go: Kill |cRXP_ENEMY_Burning Blade Fanatics|r and |cRXP_ENEMY_Burning Blade Apprentices|r. Loot them for |cRXP_LOOT_Lieutenant's Insignia|r. |cRXP_WARN_Anything left is finished later|r
    .complete 5726,1 --Lieutenant's Insignia (1)
    .mob Burning Blade Fanatic
    .mob Burning Blade Apprentice
step
    #label Along129
    .goto 1411/1,-4744.25,1497.43
    >>Kill |cRXP_ENEMY_Gazz'uz|r and loot |cRXP_LOOT_Eye of Burning Shadow|r. Use it to start the quest
    .collect 4903,1,832 --Eye of Burning Shadow (1)
    .accept 832 >>Accept Burning Shadows
    .use 4903
    .mob Gazz'uz
step
    #loop
    .goto 1411/1,-4735.79,1504.83,0
    .goto 1411/1,-4735.79,1504.83,40,0
    .goto 1411/1,-4759.59,1540.43,40,0
    .goto 1411/1,-4769.10,1476.98,40,0
    .goto 1411/1,-4834.67,1495.67,40,0
    .goto 1411/1,-4871.15,1463.24,40,0
    .goto 1411/1,-4771.22,1418.47,40,0
    .goto 1411/1,-4738.44,1449.84,40,0
    .goto 1411/1,-4705.13,1425.87,40,0
    .goto 1411/1,-4679.22,1502.72,40,0
    >>Kill |cRXP_ENEMY_Burning Blade Fanatics|r and |cRXP_ENEMY_Burning Blade Apprentices|r. Loot them for |cRXP_LOOT_Lieutenant's Insignia|r
    .complete 5726,1 --Lieutenant's Insignia (1)
    .mob Burning Blade Fanatic
    .mob Burning Blade Apprentice
step
    .goto 1411/1,-4945.18,1101.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Margoz|r
    .turnin 827 >>Turn in Skull Rock
    .accept 829 >>Accept Neeru Fireblade
    .target Margoz
step << !Rogue
    .goto 1454/1,-4355.53,1520.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trak'gen|r
    .vendor >> Vendor your trash
    .target Trak'gen
step << Rogue
    .goto 1454/1,-4355.53,1520.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_Talk to|r |cRXP_FRIENDLY_Trak'gen|r|cRXP_BUY_. Buy |r |T135419:0|t[Sharp Throwing Axe] |cRXP_BUY_from him|r
    .collect 3135,1,354,1
    .vendor >> Vendor your trash
    .target Trak'gen
step << Troll Priest
    .goto 1454/1,-4179.79,1452.580
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to|r |cRXP_FRIENDLY_Ur'kyo|r
    .trainer >> Train your class spells
    .target Ur'kyo
    .isOnQuest 5654
step
    #completewith next
    .zone 1454 >>Travel to Orgrimmar
    .zoneskip 1454
step << Tauren Hunter
    .xp 10 >>Grind to level 10 (The Hunter's Path needs it)
step << Tauren Hunter
    .goto 1454/1,-4633.81,2107.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sian'dur|r
    .accept 6066 >>Accept The Hunter's Path
    .target Sian'dur
step << Tauren Druid
    .xp 10 >>Grind to level 10 (Heeding the Call needs it)
step << Tauren Druid
    .goto 1454/1,-4439.41,1633.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Gryshka|r
    .accept 5927 >>Accept Heeding the Call
    .target Innkeeper Gryshka
step
    .goto 1454/1,-4125.65,1920.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thrall|r
    .turnin 5726 >>Turn in Hidden Enemies
    .target Thrall
step << Shaman
    .goto 1454/1,-4225.09,1933.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kardris|r
    .train 8050 >> Train your class spells
    .target Kardris Dreamseeker
step
    .goto 1454/1,-4320.700,1750.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kareth|r
    .vendor >>Repair your gear
    .target Kareth
    .isOnQuest 829
step << Shaman
    .goto 1454/1,-4213.03,1920.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Searn Firewarder|r
    .accept 1522 >>Accept Call of Fire
    .target Searn Firewarder
step << Orc Rogue/Troll Rogue
    .goto 1454/1,-4279.93,1772.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Therzok|r
    .accept 1963 >>Accept The Shattered Hand
    .target Therzok
step << Warlock
    .goto 1454/1,-4362.13,1834.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mirket|r
    .train 1120 >> Train your class spells
    .target Mirket
step << Orc Rogue/Troll Rogue
    .goto 1454/1,-4279.93,1772.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Therzok|r
    .turnin 1963 >>Turn in The Shattered Hand
    .target Therzok
    .isQuestComplete 1963
step
    .goto 1454/1,-4374.47,1800.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Neeru Fireblade|r
    .turnin 829 >>Turn in Neeru Fireblade
    .turnin 832 >>Turn in Burning Shadows
    .accept 809 >>Accept Ak'Zeloth
    .target Neeru Fireblade
step << Mage
    .goto 1454/1,-4229.86,1466.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Uthel'nay|r
    .accept 1883 >>Accept Speak with Un'thuwa
    .target Uthel'nay
step << Troll Priest
    .goto 1454/1,-4179.79,1452.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ur'kyo|r
    .accept 5652 >>Accept Hex of Weakness
    .target Ur'kyo
step << Troll Priest
    .goto 1454/1,-4179.79,1452.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ur'kyo|r
    >>|cRXP_WARN_The database has no objectives for Hex of Weakness. Skip this step if the quest is not finished|r
    .turnin 5652 >>Turn in Hex of Weakness
    .target Ur'kyo
    .isOnQuest 5652
step << Troll Priest
    .goto 1454/1,-4179.79,1452.580
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to|r |cRXP_FRIENDLY_Ur'kyo|r
    .trainer >> Train your class spells
    .target Ur'kyo
step << Hunter
    .goto 1454/1,-4607.02,2100.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ormak|r
    .train 14281 >> Train your class spells
    .target Ormak Grimshot
    .xp <12,1
step << Hunter
    .goto 1454/1,-4611.09,2135.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Xao'tsu|r
    .train 24556 >> Train your pet spells
    .target Xao'tsu
    .xp <12,1
step
    #completewith next
    .zone 1411 >>Leave Orgrimmar for Durotar
    .zoneskip 1411
step
    .goto 1411/1,-4158.93,1152.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rhinag|r
    .turnin 812 >>Turn in Need for a Cure
    .target Rhinag
step
    #loop
    .goto 1411/1,-3785.63,247.82,0
    .goto 1411/1,-3785.63,247.82,40,0
    .goto 1411/1,-3767.65,185.42,40,0
    .goto 1411/1,-3777.70,111.75,40,0
    >>Kill |cRXP_ENEMY_Dreadmaw Crocolisks|r and |cRXP_ENEMY_Corrupted Dreadmaw Crocolisks|r. Loot them for |cRXP_LOOT_Kron's Amulet|r
    .complete 816,1 --Kron's Amulet (1)
    .mob Dreadmaw Crocolisk
    .mob Corrupted Dreadmaw Crocolisk
step
    .goto 1411/1,-4186.42,-600.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gornek|r
    .turnin 787 >>Turn in The New Horde
    .target Gornek
step
    .goto 1411/1,-4939.89,-839.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Un'Thuwa|r
    .turnin 1883 >>Turn in Speak with Un'thuwa << Mage
    .accept 1884 >>Accept Ju-Ju Heaps << Orc Mage/Undead Mage/Troll Mage
    .target Un'Thuwa
step << Orc Mage/Undead Mage/Troll Mage
    .goto 1411/1,-5510.41,-1237.97
    >>Click the |cRXP_PICK_Ju-Ju Heap|r
    .complete 1884,1 --Ju-Ju Heaps Destroyed
step << Orc Mage/Undead Mage/Troll Mage
    .goto 1411/1,-4939.89,-839.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Un'Thuwa|r
    .turnin 1884 >>Turn in Ju-Ju Heaps
    .target Un'Thuwa
step
    .goto 1411/1,-4724.69,287.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Orgnil Soulscar|r
    .turnin 99051 >>Turn in Threat from Below
    .accept 99052 >>Accept Threat from Below
    .target Orgnil Soulscar
step << Warlock
    .goto 1411/1,-4837.31,352.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ophek|r
    .accept 1506 >>Accept Gan'rul's Summons
    .target Ophek
step
    .goto 1411/1,-5093.76,1187.93
    >>Kill |cRXP_ENEMY_Aggor the Young|r and loot |cRXP_LOOT_Aggor's Belt|r
    .complete 99052,1 --Aggor's Belt (1)
    .mob Aggor the Young
step
    #completewith next
    .zone 1454 >>Travel to Orgrimmar
    .zoneskip 1454
step
    .goto 1454/1,-4357.36,1850.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gan'rul Bloodeye|r
    .turnin 1506 >>Turn in Gan'rul's Summons << Warlock
    .accept 1501 >>Accept Creature of the Void << Orc Warlock
    .target Gan'rul Bloodeye
step
    #completewith next
    .zone 1411 >>Leave Orgrimmar for Durotar
    .zoneskip 1411
step << Orc Warlock
    .goto 1411/1,-4691.91,1464.29
    >>Open the |cRXP_PICK_Burning Blade Stash|r. Loot it for |cRXP_LOOT_Tablet of Verga|r
    .complete 1501,1 --Tablet of Verga (1)
step << Orc Warlock
    #completewith next
    .zone 1454 >>Travel to Orgrimmar
    .zoneskip 1454
step << Orc Warlock
    .goto 1454/1,-4357.36,1850.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gan'rul Bloodeye|r
    .turnin 1501 >>Turn in Creature of the Void
    .accept 1504 >>Accept The Binding
    .target Gan'rul Bloodeye
step << Orc Warlock
    .goto 1454/1,-4357.36,1850.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gan'rul Bloodeye|r
    .turnin 1504 >>Turn in The Binding
    .target Gan'rul Bloodeye
    .isQuestComplete 1504
step << Orc Warlock
    #completewith next
    .zone 1411 >>Leave Orgrimmar for Durotar
    .zoneskip 1411
step
    #completewith next
    .hs >>Hearth to Innkeeper Grosk's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1411/1,-4724.69,287.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Orgnil Soulscar|r
    .turnin 99052 >>Turn in Threat from Below
    .target Orgnil Soulscar
step
    .goto 1411/1,-4241.41,742.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Misha Tor'kren|r
    .turnin 816 >>Turn in Lost But Not Forgotten
    .target Misha Tor'kren
step << Undead
    .goto 1454/1,-4313.60,1676.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doras|r
    >>|cRXP_WARN_Don't fly anywhere!|r
    .fp Orgrimmar >> Get the Orgrimmar flight path
    .target Doras
step << Rogue
    .goto 1411/1,-4710.94,268.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kaplak|r
    .train 1758 >> Train your class spells
    .target Kaplak
    .xp <14,1
    .xp >16,1
step << Rogue
    .goto 1411/1,-4710.94,268.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kaplak|r
    .train 6761 >> Train your class spells
    .target Kaplak
    .xp <16,1
step << Priest
    .goto 1411/1,-4831.5,295.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tai'jin|r
    .train 8122 >>Train your class spells
    .target Tai'jin
    .xp <14,1
    .xp >16,1
step << Priest
    .goto 1411/1,-4831.5,295.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tai'jin|r
    .train 8102 >>Train your class spells
    .target Tai'jin
    .xp <16,1
step << Warrior
    .goto 1411/1,-4827.27,311.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tarshaw|r
    .train 285 >>Train your class spells
    .target Tarshaw Jaggedscar
    .xp <16,1
step << Warlock
    .goto 1411/1,-4837.31,356.030
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dhugru|r
    .train 6222 >> Train your class spells
    .target Dhugru Gorelust
    .xp <14,1
    .xp >16,1
step << Warlock
    .goto 1411/1,-4837.31,356.030
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dhugru|r
    .train 1455 >> Train your class spells
    .target Dhugru Gorelust
    .xp <16,1
step << Warrior
    .goto 1411/1,-4827.80,311.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tarshaw Jaggedscar|r
    .accept 1505 >>Accept Veteran Uzzek
    .target Tarshaw Jaggedscar
step
    #completewith next
    .zone 1454 >>Travel to Orgrimmar
    .zoneskip 1454
step
    .goto 1454/1,-4224.67,1472.41
    .trainer >> Train your class spells
step << Orc/Troll
    .goto 1454/1,-4439.41,1633.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Gryshka|r
    .turnin 6384 >>Turn in Ride to Orgrimmar
    .target Innkeeper Gryshka
    .isOnQuest 6384
step << Orc/Troll
    .goto 1454/1,-4439.41,1633.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Gryshka|r
    .accept 6385 >>Accept Doras the Wind Rider Master
    .target Innkeeper Gryshka
    .isQuestTurnedIn 6384 --any of: Ride to Orgrimmar
    .xp <10,1
step << Orc/Troll
    .goto 1454/1,-4313.46,1676.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doras|r
    .turnin 6385 >>Turn in Doras the Wind Rider Master
    .target Doras
    .isOnQuest 6385
step
    >>Run up to the Flight Master. Do NOT fly anywhere
    .goto 1454/1,-4313.46,1676.25
    .fp Orgrimmar >> Get the Orgrimmar flight path << Undead
    >>Talk to |cRXP_FRIENDLY_Doras|r
    .target Doras
step << Orc/Troll
    .goto 1454/1,-4313.46,1676.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doras|r
    .accept 6386 >>Accept Return to the Crossroads.
    .target Doras
    .isQuestTurnedIn 6385 --any of: Doras the Wind Rider Master
    .xp <10,1
step << Tauren/Undead
    .goto 1454/1,-4313.60,1676.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doras|r
    >>|cRXP_WARN_Don't fly anywhere!|r
    .fp Orgrimmar >> Get the Orgrimmar flight path
    .target Doras
step << Warrior
    .goto 1454/1,-4801.42,1980.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grezz|r
    .train 285 >> Train your class spells
    .target Grezz Ragefist
    .xp <16,1
    .xp >18,1
step << Warrior
    .goto 1454/1,-4801.42,1980.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grezz|r
    .train 8198 >> Train your class spells
    .target Grezz Ragefist
    .xp <18,1
step << Hunter
    .goto 1454/1,-4607.02,2100.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ormak|r
    .train 13795 >> Train your class spells
    .target Ormak Grimshot
    .xp <16,1
    .xp >18,1
step << Hunter
    .goto 1454/1,-4607.02,2100.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ormak|r
    .train 2643 >> Train your class spells
    .target Ormak Grimshot
    .xp <18,1
step << Hunter
    .goto 1454/1,-4611.09,2135.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Xao'tsu|r
    .train 24557 >> Train your pet spells
    .target Xao'tsu
    .xp <18,1
step << Troll Hunter/Orc Hunter/Priest
    .goto 1454/1,-4824.00,2090.540
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hanashi|r
    .train 227 >>Train Staves
    .target Hanashi
    .money <0.100
step << Tauren Hunter
    .goto 1454/1,-4824.00,2090.540
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hanashi|r
    .train 264 >>Train Bows
    .target Hanashi
step << Warrior !Skyborne
    .goto 1454/1,-4824.00,2090.540
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hanashi|r
    .train 197 >>Train Two-Handed Axes
    .train 227 >>Train Staves
    .target Hanashi
    .money <0.020
step << Warrior !Skyborne
    .goto 1454/1,-4824.00,2090.540
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hanashi|r
    .train 197 >>Train Two-Handed Axes
    .target Hanashi
    .money <0.010
step << Shaman !Skyborne
    .goto 1454/1,-4824.00,2090.540
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hanashi|r
    .train 197 >>Train Two-Handed Axes
    .target Hanashi
    .money <0.010
step << Hunter
    .goto 1454/1,-4819.1,2099.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_Talk to|r |cRXP_FRIENDLY_Zendo'jian|r|cRXP_BUY_. Buy a|r |T135490:0|t[Reinforced Bow] |cRXP_BUY_from him|r
    .collect 3026,1,3281,1
    .money <0.3588
    .target Zendo'jian
    .train 227,3
step << Warrior
    .goto 1454/1,-4819.1,2099.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_Talk to|r |cRXP_FRIENDLY_Zendo'jian|r|cRXP_BUY_. Buy a|r |T135423:0|t[Battle Axe] |cRXP_BUY_from him|r
    .collect 926,1,3281,1
    .money <1.021
    .target Zendo'jian
    .train 227,3
step << Shaman
    .goto 1454/1,-4225.09,1933.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kardris|r
    .train 8019 >> Train your class spells
    .target Kardris Dreamseeker
    .xp <16,1
    .xp >18,1
step << Shaman
    .goto 1454/1,-4225.09,1933.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kardris|r
    .train 913 >> Train your class spells
    .target Kardris Dreamseeker
    .xp <18,1
step << Rogue
    .goto 1454/1,-4284.42,1771.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shenthul|r
    .train 1804 >> Train |T136058:0|t[Pick Lock]
    .train 921 >> Train |T133644:0|t[Pick Pocket]
    .target Shenthul
step << Skyborne
    .goto 1454/1,-4125.65,1920.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thrall|r
    .turnin 95350 >>Turn in Welcome to Azeroth
    .target Thrall
    .isOnQuest 95350
step << Skyborne
    .goto 1454/1,-4125.65,1920.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thrall|r
    .accept 93739 >>Accept Exploring the Horde
    .accept 98024 >>Accept Journey to the Crossroads
    .target Thrall
    .isQuestTurnedIn 95350 --any of: Welcome to Azeroth
    .xp <7,1
step << Skyborne
    .goto 1454/1,-4133.64,1939.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nazgrel|r
    .complete 93739,1 --Nazgrel
    .target Nazgrel
    .isOnQuest 93739
step << Skyborne
    .goto 1454/1,-4162.26,1934.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vol'jin|r
    .complete 93739,2 --Vol'jin
    .target Vol'jin
    .isOnQuest 93739
step << Horde Shaman
    .goto 1454/1,-4225.09,1933.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kardris Dreamseeker::3344|r
    .train 408341 >> Train your class spells
    .target Kardris Dreamseeker::3344
    .xp <12,1
    .xp >14,1
step << Horde Shaman
    .goto 1454/1,-4225.09,1933.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kardris Dreamseeker::3344|r
    .train 8045 >> Train your class spells
    .target Kardris Dreamseeker::3344
    .xp <14,1
step << Horde Rogue
    .goto 1454/1,-4296.34,1762.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ormok::3328|r
    .train 1766 >> Train your class spells
    .target Ormok::3328
    .xp <12,1
    .xp >14,1
step << Horde Rogue
    .goto 1454/1,-4296.34,1762.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ormok::3328|r
    .train 1758 >> Train your class spells
    .target Ormok::3328
    .xp <14,1
step << Horde Mage
    .goto 1454/1,-4218.64,1473.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to|r |cRXP_FRIENDLY_Pephredo::5882|r
    .train 145 >> Train your class spells
    .target Pephredo::5882
    .xp <12,1
    .xp >14,1
step << Horde Mage
    .goto 1454/1,-4218.64,1473.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to|r |cRXP_FRIENDLY_Pephredo::5882|r
    .train 1449 >> Train your class spells
    .target Pephredo::5882
    .xp <14,1
step << Skyborne
    .goto 1454/1,-4125.65,1920.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thrall|r
    .turnin 93739 >>Turn in Exploring the Horde
    .target Thrall
    .isQuestComplete 93739
step
    #completewith next
    .zone 1411 >>Leave Orgrimmar for Durotar
    .zoneskip 1411
step << Shaman
    .goto 1411/1,-4290.59,-877.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Minor Manifestation of Earth|r
    .turnin 1520 >>Turn in Call of Earth
    .target Minor Manifestation of Earth
    .isOnQuest 1520
step << Shaman
    .goto 1411/1,-4290.59,-877.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Minor Manifestation of Earth|r
    .accept 1521 >>Accept Call of Earth
    .target Minor Manifestation of Earth
    .isQuestTurnedIn 1520 --any of: Call of Earth
    .xp <4,1
step << Shaman
    .goto 1411/1,-4000.83,-270.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Telf Joolam|r
    .accept 1526 >>Accept Call of Fire
    .target Telf Joolam
    .isQuestTurnedIn 1525 --any of: Call of Fire
    .xp <10,1
step << Shaman
    .goto 1411/1,-4009.82,-246.39
    >>Kill |cRXP_ENEMY_Minor Manifestation of Fire|r and loot |cRXP_LOOT_Glowing Ember|r
    .complete 1526,1 --Glowing Ember (1)
    .mob Minor Manifestation of Fire
    .isOnQuest 1526
step << Shaman
    .goto 1411/1,-4022.51,-243.92
    >>Click the |cRXP_PICK_Brazier of the Dormant Flame|r
    .turnin 1526 >>Turn in Call of Fire
    .isOnQuest 1526
step << Shaman
    .goto 1411/1,-4022.51,-243.92
    >>Click the |cRXP_PICK_Brazier of the Dormant Flame|r
    .accept 1527 >>Accept Call of Fire
    .isQuestTurnedIn 1526 --any of: Call of Fire
    .xp <10,1
step << Tauren
    .goto 1454/1,-4313.60,1676.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doras|r
    >>|cRXP_WARN_Don't fly anywhere!|r
    .fp Orgrimmar >> Get the Orgrimmar flight path
    .target Doras
step
    .goto 1454/1,-4160.01,1483.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to|r |cRXP_FRIENDLY_Arnok|r
    >>|cRXP_WARN_Skip this step if you did not have enough|r |T132889:0|t[Linen Cloth] |cRXP_WARN_to reach 40 skill|r
    .train 3276 >> Train |T133688:0|t[Heavy Linen Bandage]
    .target Arnok
step
    .goto 1454/1,-4160.01,1483.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to|r |cRXP_FRIENDLY_Arnok|r
    >>|cRXP_WARN_Skip this step if you did not have enough|r |T132889:0|t[Linen Cloth] |cRXP_WARN_to reach 50 skill|r
    .train 3274 >> Train Journeyman First Aid
    .target Arnok
step << Priest
    .goto 1454/1,-4179.79,1452.580
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to|r |cRXP_FRIENDLY_Ur'kyo|r
    .train 8102 >> Train your class spells
    .target Ur'kyo
    .xp <16,1
    .xp >18,1
step << Priest
    .goto 1454/1,-4179.79,1452.580
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to|r |cRXP_FRIENDLY_Ur'kyo|r
    .train 970 >> Train your class spells
    .target Ur'kyo
    .xp <18,1
step << Mage
    .goto 1454/1,-4218.64,1473.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to|r |cRXP_FRIENDLY_Pephredo|r
    .train 2120 >> Train your class spells
    .target Pephredo
    .xp <16,1
    .xp >18,1
step << Mage
    .goto 1454/1,-4218.64,1473.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to|r |cRXP_FRIENDLY_Pephredo|r
    .train 3140 >> Train your class spells
    .target Pephredo
    .xp <18,1
step << Shaman
    .goto 1411/1,-4000.83,-270.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Telf Joolam|r
    .turnin 1525 >>Turn in Call of Fire
    .target Telf Joolam
    .isQuestComplete 1525
step << Orc Rogue/Troll Rogue
    #completewith next
    .zone 1454 >>Travel to Orgrimmar
    .zoneskip 1454
step << Orc Rogue/Troll Rogue
    .goto 1454/1,-4279.93,1772.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Therzok|r
    .accept 1858 >>Accept The Shattered Hand
    .target Therzok
    .isQuestTurnedIn 1963 --any of: The Shattered Hand
    .xp <10,1
step << Orc Rogue/Troll Rogue
    .goto 1454/1,-4279.93,1772.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Therzok|r
    .turnin 1858 >>Turn in The Shattered Hand
    .target Therzok
    .isOnQuest 1858
step << Warlock
    .goto 1454/1,-4362.55,1834.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mirket|r
    .train 1455 >> Train your class spells
    .target Mirket
    .xp <16,1
    .xp >18,1
step << Warlock
    .goto 1454/1,-4362.55,1834.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mirket|r
    .train 1014 >> Train your class spells
    .target Mirket
    .xp <18,1
step << Horde Hunter
    .goto 1454/1,-4607.02,2100.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ormak Grimshot::3352|r
    .train 13795 >> Train your class spells
    .target Ormak Grimshot::3352
    .xp <12,1
step << Horde Hunter
    .goto 1454/1,-4611.09,2135.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Xao'tsu::10088|r
    .train 24556 >> Train your pet spells
    .target Xao'tsu::10088
step << Horde Warrior
    .goto 1454/1,-4801.42,1980.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grezz Ragefist::3353|r
    .train 7384 >> Train your class spells
    .target Grezz Ragefist::3353
    .xp <12,1
    .xp >14,1
step << Horde Warrior
    .goto 1454/1,-4801.42,1980.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grezz Ragefist::3353|r
    .train 1160 >> Train your class spells
    .target Grezz Ragefist::3353
    .xp <14,1
step
    +|cRXP_WARN_End of the Durotar route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Mulgore|r: Call of Earth << Shaman
    >>|cRXP_FRIENDLY_Mulgore|r: The Hunter's Path << Tauren Hunter
    >>|cRXP_FRIENDLY_The Barrens|r: Veteran Uzzek << Warrior
    >>|cRXP_FRIENDLY_The Barrens|r: Call of Fire, Call of Fire << Shaman
    >>|cRXP_FRIENDLY_The Barrens|r: Return to the Crossroads. << Orc/Troll
    >>|cRXP_FRIENDLY_The Barrens|r: Conscript of the Horde, Ak'Zeloth
    >>|cRXP_FRIENDLY_The Barrens|r: Journey to the Crossroads << Skyborne
    >>|cRXP_FRIENDLY_Thunder Bluff|r: Heeding the Call << Tauren Druid
    >>|cRXP_FRIENDLY_Undercity|r: Touch of Weakness << Undead Priest
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: The Binding << Orc Warlock
    >>|cRXP_FRIENDLY_The Barrens and back here|r: The Shattered Hand << Orc Rogue/Troll Rogue
]])
