-- 1-12 Elwynn Forest: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 2 parts with a level check between them (from level 1, 14).
-- Sections (the guide starts at the one for your level): around Marshal McBride from 1; around Marshal Dughan from 4; around Marshal Dughan from 6; around Marshal Dughan from 9; part 2 from 14.
-- Edit zones/Elwynn Forest.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#name 1-12 Elwynn Forest
#next Zone Routes (Alliance)\10-22 Darkshore;Zone Routes (Alliance)\1-13 Zephras Isle;Zone Routes (Alliance)\10-32 Loch Modan

step
    .xp <4,1,RBSection1_1
    .xp 4 >>Finding the place in this guide for your level
step
    .xp <6,1,RBSection1_2
    .xp 6 >>Finding the place in this guide for your level
step
    .xp <9,1,RBSection1_3
    .xp 9 >>Finding the place in this guide for your level
step
    .xp <14,1,RBSection1_4
    .xp 14 >>Finding the place in this guide for your level
step
    .xp <61,1,RBSection2_1
step
    #label RBSection1_1
    #completewith next
    +|cRXP_WARN_Elwynn Forest: around Marshal McBride|r (planned from level 1)
step
    .goto 1429/0,-136.48,-8933.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deputy Willem|r
    .accept 783 >>Accept A Threat Within
    .target Deputy Willem
step << Warrior
    .goto 1429/0,-75.05,-8872.36,35,0
    >>Kill |cRXP_ENEMY_Young Wolves|r until you have 10c+ worth of vendor trash
    >>|cRXP_WARN_You will train|r |T132333:0|t[Battle Shout] |cRXP_WARN_which increases early leveling speeds|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Danil|r
    .vendor >> |cRXP_WARN_Vendor trash|r
    .target +Brother Danil
    .goto 1429/0,-112.74,-8901.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Llane Beshere|r inside downstairs
    .train 6673 >>Train |T132333:0|t[Battle Shout]
    .target +Llane Beshere
    .goto 1429/0,-208.40,-8918.35
step
    .goto 1429/0,-112.54,-8899.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Danil|r
    .vendor >> Vendor Trash until you have 10+ copper
    .target Brother Danil
step
    .goto 1429/0,-162.52,-8902.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal McBride|r
    .turnin 783 >>Turn in A Threat Within
    .accept 7 >>Accept Kobold Camp Cleanup
    .target Marshal McBride
step
    .goto 1429/0,-188.20,-8851.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Khelden|r
    .train 1459 >> Train |T135932:0|t[Arcane Intellect]
    .target Khelden Bremen
step
    .goto 1429/0,-136.48,-8933.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deputy Willem|r
    .accept 5261 >>Accept Eagan Peltskinner
    .target Deputy Willem
step
    .goto 1429/0,-112.54,-8899.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Danil|r
    >>|cRXP_BUY_Buy 10|r |T132794:0|t[Refreshing Spring Water] |cRXP_BUY_from him|r
    .vendor >> Vendor Trash
    .collect 159,10,7,1
    .target Brother Danil
step
    .goto 1429/0,-163.21,-8869.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eagan Peltskinner|r
    .turnin 5261 >>Turn in Eagan Peltskinner
    .accept 33 >>Accept Wolves Across the Border
    .target Eagan Peltskinner
step
    #completewith Drop91741x1
    >>|cRXP_LOOT_Nibbled-On Book|r can drop from |cRXP_ENEMY_Kobold Vermin|r, |cRXP_ENEMY_Kobold Laborer|r, |cRXP_ENEMY_Kobold Worker|r. Use it to start the quest if you get one
    .collect 247834,1,91741 --Nibbled-On Book (1)
    .accept 91741 >>Accept Nibbled-On Book
    .use 247834
step
    #label Drop91741x1
    #loop
    .goto 1429/0,-114.96,-8876.06,0
    .goto 1429/0,-114.96,-8876.06,40,0
    .goto 1429/0,-143.08,-8806.16,40,0
    .goto 1429/0,-262.82,-8794.59,40,0
    .goto 1429/0,-201.39,-8760.33,40,0
    .goto 1429/0,-148.28,-8718.90,40,0
    .goto 1429/0,-50.41,-8748.76,40,0
    .goto 1429/0,-88.24,-8815.42,40,0
    .goto 1429/0,-44.85,-8844.35,40,0
    .goto 1429/0,-48.67,-8953.60,40,0
    >>Kill |cRXP_ENEMY_Timber Wolfs|r and |cRXP_ENEMY_Young Wolfs|r. Loot them for |cRXP_LOOT_Tough Wolf Meat|r
    >>Kill |cRXP_ENEMY_Kobold Vermins|r
    .complete 33,1 --Tough Wolf Meat (8)
    .complete 7,1 --Kobold Vermin slain (10)
    .mob Timber Wolf
    .mob Young Wolf
    .mob Kobold Vermin
step
    .goto 1429/0,-163.21,-8869.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eagan Peltskinner|r
    .turnin 33 >>Turn in Wolves Across the Border
    .target Eagan Peltskinner
step << !Priest !Mage !Warlock !Rogue
    .goto 1429/0,-119.86,-8898.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Godric Rothgar|r
    .vendor >>Vendor Trash
    .target Godric Rothgar
step << Rogue
    .goto 1429/0,-104.21,-8909.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Janos Hammerknuckle|r
    .vendor 78 >>|cRXP_BUY_Buy a|r |T135650:0|t[Dirk] |cRXP_BUY_or|r |T132410:0|t[Hand Axe] |cRXP_BUY_from him if you can afford it|r
    .target Janos Hammerknuckle
step
    .goto 1429/0,-112.54,-8899.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Danil|r
    .vendor >>Vendor Trash
    .collect 159,10,15,1
    .target Brother Danil
step
    .goto 1429/0,-162.52,-8902.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal McBride|r
    .turnin 7 >>Turn in Kobold Camp Cleanup
    .accept 15 >>Accept Investigate Echo Ridge
    .accept 3100 >>Accept Simple Letter << Human Warrior
    .accept 3101 >>Accept Consecrated Letter << Human Paladin
    .accept 92479 >>Accept A Scribbled Letter << Human Hunter
    .accept 3102 >>Accept Encrypted Letter << Human Rogue
    .accept 3103 >>Accept Hallowed Letter << Human Priest
    .accept 3104 >>Accept Glyphic Letter << Human Mage
    .accept 3105 >>Accept Tainted Letter << Human Warlock
    .target Marshal McBride
step << Human Warrior
    .goto 1429/0,-208.33,-8918.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Llane Beshere|r
    .turnin 3100 >>Turn in Simple Letter while you are here
    .isQuestComplete 3100
    .target Llane Beshere
step << Human Paladin
    .goto 1429/0,-214.92,-8914.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Sammuel|r
    .turnin 3101 >>Turn in Consecrated Letter while you are here
    .isQuestComplete 3101
    .target Brother Sammuel
step << Human Mage
    .goto 1429/0,-188.20,-8851.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Khelden Bremen|r
    .turnin 3104 >>Turn in Glyphic Letter while you are here
    .isQuestComplete 3104
    .target Khelden Bremen
step << Human Priest
    .goto 1429/0,-193.41,-8853.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Anetta|r
    .turnin 3103 >>Turn in Hallowed Letter while you are here
    .isQuestComplete 3103
    .target Priestess Anetta
step << Human Rogue
    .goto 1429/0,-210.76,-8863.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jorik Kerridan|r
    .turnin 3102 >>Turn in Encrypted Letter while you are here
    .isQuestComplete 3102
    .target Jorik Kerridan
step << Human Hunter
    .goto 1429/0,-242.00,-8883.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tordrin Sternblade|r
    .turnin 92479 >>Turn in A Scribbled Letter while you are here
    .isQuestComplete 92479
    .target Tordrin Sternblade
step
    .goto 1429/0,-136.48,-8933.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deputy Willem|r
    .accept 18 >>Accept Brotherhood of Thieves
    .target Deputy Willem
step
    .goto 1429/0,-195.49,-8926.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drusilla La Salle|r
    .turnin 3105 >>Turn in Tainted Letter << Human Warlock
    .accept 1598 >>Accept The Stolen Tome << Warlock
    .target Drusilla La Salle
step << Warlock
    .goto 1429/0,-195.59,-8926.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drusilla La Salle|r
    .train 348 >> Train |T135817:0|t[Immolate]
    .target Drusilla La Salle
step << Warlock
    .goto 1429/0,-432.89,-8957.07
    >>Open the |cRXP_PICK_Stolen Books|r. Loot it for |cRXP_LOOT_Powers of the Void|r
    .complete 1598,1 --Powers of the Void (1)
step << Warlock
    .goto 1429/0,-195.49,-8926.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drusilla La Salle|r
    .turnin 1598 >>Turn in The Stolen Tome
    .target Drusilla La Salle
step
    #completewith Drop91741x2
    >>|cRXP_LOOT_Nibbled-On Book|r can drop from |cRXP_ENEMY_Kobold Vermin|r, |cRXP_ENEMY_Kobold Laborer|r, |cRXP_ENEMY_Kobold Worker|r. Use it to start the quest if you get one
    .collect 247834,1,91741 --Nibbled-On Book (1)
    .accept 91741 >>Accept Nibbled-On Book
    .use 247834
step
    #label Drop91741x2
    #loop
    .goto 1429/0,-257.62,-8811.25,0
    .goto 1429/0,-257.62,-8811.25,40,0
    .goto 1429/0,-274.62,-8781.40,40,0
    .goto 1429/0,-235.40,-8762.42,40,0
    .goto 1429/0,-204.16,-8749.46,40,0
    .goto 1429/0,-155.92,-8721.68,40,0
    .goto 1429/0,-127.46,-8671.69,40,0
    .goto 1429/0,-70.54,-8698.53,40,0
    .goto 1429/0,-101.78,-8752.46,40,0
    .goto 1429/0,-138.22,-8769.82,40,0
    >>Kill |cRXP_ENEMY_Kobold Workers|r
    .complete 15,1 --Kobold Worker slain (10)
    .mob Kobold Worker
step << Hunter
    .goto 1429/0,-112.800,-8901.601
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Danil|r
    .vendor >> |cRXP_BUY_Buy 2 stacks of|r |T132382:0|t[Rough Arrows]
    .target Brother Danil
step
    .goto 1429/0,-162.52,-8902.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal McBride|r
    .turnin 15 >>Turn in Investigate Echo Ridge
    .accept 21 >>Accept Skirmish at Echo Ridge
    .target Marshal McBride
step << Human Warrior
    .goto 1429/0,-208.33,-8918.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Llane Beshere|r
    .turnin 3100 >>Turn in Simple Letter
    .target Llane Beshere
step << Warrior
    .goto 1429/0,-208.40,-8918.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Llane Beshere|r inside downstairs
    .trainer >> Train your class spells
    .target Llane Beshere
step << Human Paladin
    .goto 1429/0,-214.92,-8914.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Sammuel|r
    .turnin 3101 >>Turn in Consecrated Letter
    .target Brother Sammuel
step << Paladin
    .goto 1429/0,-215.03,-8914.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Sammuel|r
    .trainer >> Train your class spells
    .target Brother Sammuel
step << Human Hunter
    .goto 1429/0,-242.00,-8883.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tordrin Sternblade|r
    .turnin 92479 >>Turn in A Scribbled Letter
    .target Tordrin Sternblade
step << Hunter
    .goto 1429/0,-242.100,-8884.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tordrin Sternblade::248415|r
    .target Tordrin Sternblade::248415
    .trainer >> Train your class spells
step << Warlock
    .goto 1429/0,-195.59,-8926.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drusilla La Salle|r
    .train 172 >>Train |T136118:0|t[Corruption]
    .target Drusilla La Salle
step << Human Priest
    .goto 1429/0,-193.41,-8853.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Anetta|r
    .turnin 3103 >>Turn in Hallowed Letter
    .target Priestess Anetta
step << Priest
    .goto 1429/0,-193.34,-8853.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Anetta|r inside downstairs
    .trainer >> Train your class spells
    .target Priestess Anetta
step << Human Mage
    .goto 1429/0,-188.20,-8851.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Khelden Bremen|r
    .turnin 3104 >>Turn in Glyphic Letter
    .target Khelden Bremen
step << Mage
    .goto 1429/0,-188.23,-8851.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Khelden Bremen|r inside upstairs
    .trainer >> Train your class spells
    .target Khelden Bremen
step
    .goto 1429/0,-188.20,-8851.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Khelden|r
    .train 116 >> Train |T135846:0|t[Frostbolt]
    .target Khelden Bremen
step
    #loop
    .goto 1429/0,-312.45,-8994.57,0
    .goto 1429/0,-312.45,-8994.57,40,0
    .goto 1429/0,-247.55,-9116.78,40,0
    .goto 1429/0,-323.56,-9131.13,40,0
    .goto 1429/0,-389.16,-9124.88,40,0
    .goto 1429/0,-421.44,-9091.09,40,0
    .goto 1429/0,-458.23,-9052.20,40,0
    .goto 1429/0,-397.84,-9034.15,40,0
    .goto 1429/0,-377.36,-9077.43,40,0
    .goto 1429/0,-332.24,-9075.35,40,0
    >>Kill |cRXP_ENEMY_Defias Thugs|r. Loot them for |cRXP_LOOT_Red Burlap Bandana|r
    .complete 18,1 --Red Burlap Bandana (12)
    .mob Defias Thug
step << Rogue
    .goto 1429/0,-288.51,-9068.87,0
    .goto 1429/0,-388.47,-9001.28,0
    .goto 1429/0,-288.51,-9068.87,30,0
    .goto 1429/0,-335.02,-9108.91,30,0
    .goto 1429/0,-376.67,-9073.73,30,0
    .goto 1429/0,-388.47,-9001.28,30,0
    .goto 1429/0,-333.97,-9028.59,30,0
    .xp 4 >> Grind to level 4
step
    .goto 1429/0,-136.48,-8933.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deputy Willem|r
    .turnin 18 >>Turn in Brotherhood of Thieves
    .accept 3903 >>Accept Milly Osworth
    .accept 6 >>Accept Bounty on Garrick Padfoot
    .target Deputy Willem
step
    .goto 1429/0,-112.54,-8899.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Danil|r
    >>|cRXP_BUY_Buy 10|r |T132794:0|t[Refreshing Spring Water] |cRXP_BUY_from him|r
    .vendor >> Vendor Trash
    .collect 159,10,21,1
    .target Brother Danil
step
    #completewith Drop91741x3
    >>|cRXP_LOOT_Nibbled-On Book|r can drop from |cRXP_ENEMY_Kobold Vermin|r, |cRXP_ENEMY_Kobold Laborer|r, |cRXP_ENEMY_Kobold Worker|r. Use it to start the quest if you get one
    .collect 247834,1,91741 --Nibbled-On Book (1)
    .accept 91741 >>Accept Nibbled-On Book
    .use 247834
step
    #label Drop91741x3
    #loop
    .goto 1429/0,-123.29,-8671.92,0
    .goto 1429/0,-123.29,-8671.92,40,0
    .goto 1429/0,-113.23,-8640.67,40,0
    .goto 1429/0,-151.06,-8572.39,40,0
    .goto 1429/0,-147.94,-8555.73,40,0
    .goto 1429/0,-182.65,-8537.67,40,0
    .goto 1429/0,-216.66,-8561.51,40,0
    .goto 1429/0,-174.32,-8595.54,40,0
    .goto 1429/0,-152.80,-8613.82,40,0
    .goto 1429/0,-143.43,-8640.21,40,0
    >>Kill |cRXP_ENEMY_Kobold Laborers|r
    .complete 21,1 --Kobold Laborer slain (12)
    .mob Kobold Laborer
step
    .goto 1429/0,-186.46,-8874.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Paxton|r
    .turnin 91741 >>Turn in Nibbled-On Book
    .target Brother Paxton
    .isOnQuest 91741
step
    .goto 1429/0,-162.52,-8902.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal McBride|r
    .turnin 21 >>Turn in Skirmish at Echo Ridge while you are here
    .isQuestComplete 21
    .target Marshal McBride
step
    .goto 1429/0,-223.95,-8850.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Milly Osworth|r
    .turnin 3903 >>Turn in Milly Osworth while you are here
    .isQuestComplete 3903
    .target Milly Osworth
step
    .goto 1429/0,-186.46,-8874.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Paxton|r
    .accept 92124 >>Accept Book Inventory
    .target Brother Paxton
    .isQuestTurnedIn 91741 --any of: Nibbled-On Book
step
    .goto 1429/0,-181.95,-8880.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Daniel|r
    .turnin 92124 >>Turn in Book Inventory
    .target Daniel
    .isOnQuest 92124
step
    .goto 1429/0,-186.46,-8874.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Paxton|r
    .accept 91743 >>Accept Rascally Rodents
    .target Brother Paxton
    .isQuestTurnedIn 92124 --any of: Book Inventory
step
    #completewith Drop91741x4
    >>|cRXP_LOOT_Nibbled-On Book|r can drop from |cRXP_ENEMY_Kobold Vermin|r, |cRXP_ENEMY_Kobold Laborer|r, |cRXP_ENEMY_Kobold Worker|r. Use it to start the quest if you get one
    .collect 247834,1,91741 --Nibbled-On Book (1)
    .accept 91741 >>Accept Nibbled-On Book
    .use 247834
step
    #label Drop91741x4
    #loop
    .goto 1429/0,-257.62,-8811.25,0
    .goto 1429/0,-257.62,-8811.25,40,0
    .goto 1429/0,-190.63,-8768.20,40,0
    .goto 1429/0,-118.44,-8793.90,40,0
    .goto 1429/0,-70.54,-8698.53,40,0
    .goto 1429/0,-113.23,-8640.67,40,0
    .goto 1429/0,-182.65,-8537.67,40,0
    .goto 1429/0,-152.80,-8613.82,40,0
    .goto 1429/0,-161.82,-8698.77,40,0
    .goto 1429/0,-207.98,-8722.61,40,0
    >>Kill |cRXP_ENEMY_Kobold Vermins|r, |cRXP_ENEMY_Kobold Laborers|r and |cRXP_ENEMY_Kobold Workers|r. Loot them for |cRXP_LOOT_Stolen Book|r
    .complete 91743,1 --Stolen Book (8)
    .mob Kobold Vermin
    .mob Kobold Laborer
    .mob Kobold Worker
    .isOnQuest 91743
step
    .goto 1429/0,-186.46,-8874.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Paxton|r
    .turnin 91743 >>Turn in Rascally Rodents
    .target Brother Paxton
    .isOnQuest 91743
step
    .goto 1429/0,-186.46,-8874.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Paxton|r
    .accept 91745 >>Accept Mining Consultant
    .target Brother Paxton
    .isQuestTurnedIn 91743 --any of: Rascally Rodents
step
    .goto 1429/0,-102.12,-8683.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kelsey Fargo|r
    .turnin 91745 >>Turn in Mining Consultant
    .target Kelsey Fargo
    .isOnQuest 91745
step
    .goto 1429/0,-102.12,-8683.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kelsey Fargo|r
    .accept 91752 >>Accept The Big Picture
    .target Kelsey Fargo
    .isQuestTurnedIn 91745 --any of: Mining Consultant
step
    .goto 1429/0,-172.93,-8587.90
    >>Kill |cRXP_ENEMY_Shinyfinder Narf|r and loot |cRXP_LOOT_Sack of "Picture" Books|r
    .complete 91752,1 --Sack of "Picture" Books (1)
    .mob Shinyfinder Narf
    .isOnQuest 91752
step
    .goto 1429/0,-223.95,-8850.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Milly Osworth|r
    .turnin 3903 >>Turn in Milly Osworth
    .accept 3904 >>Accept Milly's Harvest
    .target Milly Osworth
step << Human Rogue
    .goto 1429/0,-210.76,-8863.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jorik Kerridan|r
    .turnin 3102 >>Turn in Encrypted Letter
    .target Jorik Kerridan
step << Rogue
    .goto 1429/0,-210.90,-8863.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jorik Kerridan|r
    .train 1784 >>Train |T132320:0|t[Stealth]
    .train 921 >>Train |T133644:0|t[Pick Pocket]
    .target Jorik Kerridan
step
    #loop
    .goto 1429/0,-331.89,-9026.74,0
    .goto 1429/0,-331.89,-9026.74,40,0
    .goto 1429/0,-297.18,-9061.00,40,0
    .goto 1429/0,-331.54,-9114.70,40,0
    .goto 1429/0,-361.05,-9085.30,40,0
    .goto 1429/0,-379.79,-9074.89,40,0
    .goto 1429/0,-461.01,-9056.37,40,0
    .goto 1429/0,-361.74,-9072.11,40,0
    .goto 1429/0,-330.85,-9061.23,40,0
    .goto 1429/0,-350.98,-9045.26,40,0
    >>Pick up |cRXP_PICK_Milly's Harvest|r from the ground
    >>Kill |cRXP_ENEMY_Garrick Padfoot|r and loot |cRXP_LOOT_Garrick's Head|r
    .complete 3904,1 --Milly's Harvest (8)
    .complete 6,1 --Garrick's Head (1)
    .mob Garrick Padfoot
step
    .goto 1429/0,-288.51,-9068.87,0
    .goto 1429/0,-388.47,-9001.28,0
    .goto 1429/0,-288.51,-9068.87,30,0
    .goto 1429/0,-335.02,-9108.91,30,0
    .goto 1429/0,-376.67,-9073.73,30,0
    .goto 1429/0,-388.47,-9001.28,30,0
    .goto 1429/0,-333.97,-9028.59,30,0
    .xp 5 >> Grind to level 5
step
    .goto 1429/0,-223.95,-8850.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Milly Osworth|r
    .turnin 3904 >>Turn in Milly's Harvest
    .accept 3905 >>Accept Grape Manifest
    .target Milly Osworth
step
    .goto 1429/0,-136.48,-8933.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deputy Willem|r
    .turnin 6 >>Turn in Bounty on Garrick Padfoot
    .target Deputy Willem
step
    .goto 1429/0,-162.52,-8902.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal McBride|r
    .turnin 91752 >>Turn in The Big Picture
    .target Marshal McBride
    .isOnQuest 91752
step
    .goto 1429/0,-162.52,-8902.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal McBride|r
    .accept 91758 >>Accept Follow That Kobold!
    .target Marshal McBride
    .isQuestTurnedIn 91752 --any of: The Big Picture
step
    .goto 1429/0,-162.52,-8902.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal McBride|r
    .turnin 21 >>Turn in Skirmish at Echo Ridge
    .accept 54 >>Accept Report to Goldshire
    .accept 96627 >>Accept The Adventurer
    .target Marshal McBride
step
    .goto 1429/0,-181.60,-8902.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Neals|r
    .turnin 3905 >>Turn in Grape Manifest
    .target Brother Neals
step << Human Priest
    .goto 1429/0,-193.41,-8853.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Anetta|r
    .accept 5623 >>Accept In Favor of the Light
    .target Priestess Anetta
step
    .goto 1429/0,-242.00,-8883.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tordrin Sternblade|r
    .turnin 91758 >>Turn in Follow That Kobold!
    .target Tordrin Sternblade
    .isOnQuest 91758
step
    .goto 1429/0,-242.00,-8883.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tordrin Sternblade|r
    .accept 91772 >>Accept Shhh! We're Hunting Kobolds
    .target Tordrin Sternblade
    .isQuestTurnedIn 91758 --any of: Follow That Kobold!
step
    .goto 1429/0,-45.90,-9044.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Falkhaan Isenstrider|r
    .accept 2158 >>Accept Rest and Relaxation
    .target Falkhaan Isenstrider
step
    .goto 1429/0,-68.11,-8874.67
    .vendor >>Kill wolves until you have 50c worth of vendor trash. Vendor, then buy x10 water from Brother Danil.
    .collect 159,10
step
    .xp 2 >> Grind to 2
step
    .goto 1429/0,-116.70,-8900.14
    .vendor >>vendor trash, then buy x10 more water from Brother Danil
step
    .xp 3 >> Grind to 3
step
    .goto 1429/0,-120.17,-8897.82
    .xp 3+1110 >>Grind to 1110+/1400xp on your way back to town
step
    .goto 1429/0,-120.17,-8897.82
    .vendor >>vendor trash
step
    >>Go upstairs
    .goto 1429/0,-175.70,-8881.62,15,0
    .goto 1429/0,-182.65,-8865.42,15,0
    .goto 1429/0,-188.23,-8851.58
    .target Khelden Bremen
    >>Talk to |cRXP_FRIENDLY_Khelden Bremen|r
    .trainer >> Train your class spells
step
    .goto 1429/0,-120.17,-8897.82
    .vendor >>vendor trash, repair
step
    .xp 5 >> Grind to 5
step
    .xp 5+1175 >> Grind on your way back to 1175+/2800xp
    .goto 1429/0,-224.30,-8846.90
step
    .goto 1429/0,88.08,-9464.89
    .vendor >> vendor trash, repair
step
    .goto 1429/0,18.66,-9476.47,12,0
    .goto 1429/0,36.02,-9471.84
    .trainer >> Go Upstairs. Train your class spells
step
    .goto 1429/0,63.78,-10008.82
    .vendor >>Vendor, buy as much milk as you can
step
    .goto 1429/0,16.23,-9462.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Farley|r
    .turnin 2158 >>Turn in Rest and Relaxation while you are here
    .isQuestComplete 2158
    .target Innkeeper Farley
step << Human Priest
    .goto 1429/0,33.24,-9460.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Josetta|r
    .turnin 5623 >>Turn in In Favor of the Light while you are here
    .isQuestComplete 5623
    .target Priestess Josetta
step
    .goto 1429/0,73.85,-9465.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Dughan|r
    .turnin 54 >>Turn in Report to Goldshire while you are here
    .isQuestComplete 54
    .target Marshal Dughan
step
    #label RBSection1_2
    #completewith next
    +|cRXP_WARN_Elwynn Forest: around Marshal Dughan|r (planned from level 4)
step
    .goto 1429/0,-22.99,-9406.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sam Sarsaparilla|r
    .turnin 96627 >>Turn in The Adventurer
    .target Sam Sarsaparilla
    .isOnQuest 96627
step
    .goto 1429/0,-22.99,-9406.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sam Sarsaparilla|r
    .accept 95998 >>Accept The Great Outdoors
    .target Sam Sarsaparilla
step
    .goto 1429/0,-24.38,-9402.40
    >>Click the |cRXP_PICK_Basic Campfire|r
    .complete 95998,1 --Basic Campfire
    .complete 95998,2 --Basic Campfire
step
    .goto 1429/0,-22.99,-9406.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sam Sarsaparilla|r
    .turnin 95998 >>Turn in The Great Outdoors
    .accept 96626 >>Accept Camping 101: Cooking
    .target Sam Sarsaparilla
step
    #loop
    .goto 1429/0,4.43,-9342.45,0
    .goto 1429/0,4.43,-9342.45,40,0
    .goto 1429/0,51.98,-9370.46,40,0
    .goto 1429/0,79.05,-9382.03,40,0
    .goto 1429/0,28.03,-9351.71,40,0
    .goto 1429/0,-31.66,-9283.43,40,0
    .goto 1429/0,-19.86,-9319.31,40,0
    >>Click the |cRXP_PICK_Kobold Tracks|r
    .complete 91772,1 --Kobold Tracks
    .isOnQuest 91772
step << Warrior/Rogue/Paladin
    .goto 1429/0,87.87,-9456.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Smith Argus|r
    >>|cRXP_WARN_This will allow you to make|r |T135248:0|t[Rough Sharpening Stones] |cRXP_WARN_which increase your melee damage by 2|r << Warrior/Rogue
    >>|cRXP_WARN_This will allow you to make|r |T135255:0|t[Rough Weightstones] |cRXP_WARN_which increase your melee damage by 2|r << Paladin
    >>|cRXP_WARN_If you don't want to do this, skip this step|r
    .train 2018 >> Train |T136241:0|t[Blacksmithing]
    .target Smith Argus
step << Warrior
    .goto 1429/0,94.01,-9464.8900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corina Steele|r
    .vendor 54 >>|cRXP_BUY_Buy a|r |T135321:0|t[Gladius] |cRXP_BUY_from her if you can afford it|r
    .collect 2488,1
    .target Corina Steele
    .money <0.0536
step << Rogue
    .goto 1429/0,94.01,-9464.8900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corina Steele|r
    .vendor 54 >>|cRXP_BUY_Buy a|r |T135421:0|t[Tomahawk] |cRXP_BUY_or|r |T135641:0|t[Stiletto] |cRXP_BUY_from her if you can afford it|r
    .target Corina Steele
step << Paladin
    .goto 1429/0,94.01,-9464.8900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corina Steele|r
    .vendor 54 >>|cRXP_WARN_Buy a|r |T133053:0|t[Wooden Mallet] |cRXP_BUY_from her if you can afford it|r
    .collect 2493,1
    .target Corina Steele
step
    .goto 1429/0,73.85,-9465.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Dughan|r
    .turnin 54 >>Turn in Report to Goldshire
    .target Marshal Dughan
    .isOnQuest 54
step
    .goto 1429/0,73.85,-9465.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Dughan|r
    .turnin 91772 >>Turn in Shhh! We're Hunting Kobolds
    .target Marshal Dughan
    .isOnQuest 91772
step
    .goto 1429/0,73.85,-9465.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Dughan|r
    .accept 62 >>Accept The Fargodeep Mine
    .target Marshal Dughan
step
    .goto 1429/0,73.85,-9465.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Dughan|r
    .accept 91775 >>Accept Book Return
    .target Marshal Dughan
    .isQuestTurnedIn 91772 --any of: Shhh! We're Hunting Kobolds
step
    .goto 1429/0,31.85,-9460.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_William Pestle|r
    .accept 60 >>Accept Kobold Candles
    .target William Pestle
step
    .goto 1429/0,16.23,-9462.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Farley|r
    .turnin 2158 >>Turn in Rest and Relaxation
    .target Innkeeper Farley
    .isOnQuest 2158
step
    .goto 1429/0,16.20,-9462.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Farley|r
    .vendor 295 >> Vendor Trash. |cRXP_BUY_Buy|r |T132815:0|t[Ice Cold Milk] |cRXP_BUY_down to 2 silver|r
    .target Innkeeper Farley
step
    .goto 1429/0,34.28,-9472.99
    >>Jump onto the Chandelier downstairs
    >>Talk to |cRXP_FRIENDLY_Zaldimar|r through the wall
    .trainer >> Train your class spells (Fireball R2, Fire Blast)
    .target Zaldimar Wefhellt
step
    .goto 1429/0,16.23,-9462.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Farley|r
    .target Innkeeper Farley
    .home >>Set your Hearthstone to Innkeeper Farley's inn
step << Human Mage/Gnome Mage
    .xp 10 >>Grind to level 10 (Speak with Jennea needs it)
step << Human Mage/Gnome Mage
    .goto 1429/0,34.28,-9471.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zaldimar Wefhellt|r
    .accept 1860 >>Accept Speak with Jennea
    .target Zaldimar Wefhellt
step
    #completewith next
    .zone 1453 >>Travel to Stormwind City
    .zoneskip 1453
step
    .goto 1453/0,615.09,-8848.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Renato Gallina|r
    .accept 332 >>Accept Wine Shop Advert
    .target Renato Gallina
step
    .goto 1453/0,640.11,-8782.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Harlan Bagley|r
    .accept 333 >>Accept Harlan Needs a Resupply
    .target Harlan Bagley
step
    .goto 1453/0,713.60,-8777.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rema Schneider|r
    .turnin 333 >>Turn in Harlan Needs a Resupply
    .accept 334 >>Accept Package for Thurman
    .target Rema Schneider
step
    .goto 1453/0,675.55,-8884.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Suzetta Gallina|r
    .turnin 332 >>Turn in Wine Shop Advert
    .target Suzetta Gallina
step
    .goto 1453/0,809.17,-8961.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thurman Schneider|r
    .turnin 334 >>Turn in Package for Thurman
    .target Thurman Schneider
step
    .goto 1453/0,861.81,-8989.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jennea Cannon|r
    .turnin 1860 >>Turn in Speak with Jennea << Human Mage/Gnome Mage
    .accept 84397 >>Accept Northern Kalimdor - A Comprehensive Guide
    .accept 84398 >>Accept A Study of the Light
    .accept 84399 >>Accept Ka-Boom!
    .accept 84402 >>Accept Necromancy 101
    .target Jennea Cannon
step
    .goto 1453/0,861.81,-8989.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jennea Cannon|r
    >>|cRXP_WARN_The database has no objectives for Northern Kalimdor - A Comprehensive Guide. Skip this step if the quest is not finished|r
    .turnin 84397 >>Turn in Northern Kalimdor - A Comprehensive Guide
    .target Jennea Cannon
    .isOnQuest 84397
step
    .goto 1453/0,861.81,-8989.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jennea Cannon|r
    >>|cRXP_WARN_The database has no objectives for A Study of the Light. Skip this step if the quest is not finished|r
    .turnin 84398 >>Turn in A Study of the Light
    .target Jennea Cannon
    .isOnQuest 84398
step
    .goto 1453/0,861.81,-8989.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jennea Cannon|r
    >>|cRXP_WARN_The database has no objectives for Ka-Boom!. Skip this step if the quest is not finished|r
    .turnin 84399 >>Turn in Ka-Boom!
    .target Jennea Cannon
    .isOnQuest 84399
step
    .goto 1453/0,861.81,-8989.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jennea Cannon|r
    >>|cRXP_WARN_The database has no objectives for Necromancy 101. Skip this step if the quest is not finished|r
    .turnin 84402 >>Turn in Necromancy 101
    .target Jennea Cannon
    .isOnQuest 84402
step << Dwarf Priest
    .goto 1453/0,862.33,-8512.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess Laurena|r
    .turnin 5636 >>Turn in Desperate Prayer
    .target High Priestess Laurena
    .isOnQuest 5636
step << Human Priest/Dwarf Priest
    .goto 1453/0,862.33,-8512.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess Laurena|r
    .turnin 5640 >>Turn in Desperate Prayer
    .target High Priestess Laurena
    .isOnQuest 5640
step << Human Priest/Dwarf Priest
    .goto 1453/0,862.33,-8512.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess Laurena|r
    .turnin 5637 >>Turn in Desperate Prayer
    .target High Priestess Laurena
    .isOnQuest 5637
step << Human Priest/Dwarf Priest
    .goto 1453/0,862.33,-8512.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess Laurena|r
    .turnin 5639 >>Turn in Desperate Prayer
    .target High Priestess Laurena
    .isOnQuest 5639
step
    #completewith next
    .zone 1429 >>Leave Stormwind City for Elwynn Forest
    .zoneskip 1429
step
    #completewith next
    .hs >>Hearth to Innkeeper Farley's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1429/0,-4.59,-9466.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tomas|r
    .complete 96626,1 --Tomas
    .target Tomas
step
    .goto 1429/0,-4.59,-9466.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tomas|r
    .turnin 96626 >>Turn in Camping 101: Cooking
    .target Tomas
step
    .goto 1429/0,-5.63,-9467.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tomas|r
    >>|cRXP_WARN_Skip this step if you don't have 1 silver, or if you wish to do it later|r
    .train 2550 >> Train |T133971:0|t[Cooking]
    .target Tomas
    .money <0.0100
step
    .xp 6 >> Grind to 6
step << Rogue
    .goto 1429/0,9.64,-9465.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brog Hamfist|r
    .vendor 151 >>|cRXP_BUY_Buy the|r |T135641:0|t[Balanced Throwing Daggers] |cRXP_BUY_from him if you can afford it|r
    .collect 2946,1
    .target Brog Hamfist
step << Warlock
    .goto 1429/0,-5.36,-9472.760
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maximillian Crowe|r downstairs
    .trainer >> Train your class spells
    .target Maximillian Crowe
step << Warlock
    .goto 1429/0,-5.53,-9466.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cylina Darkheart|r
    .vendor 6374 >> |cRXP_BUY_Buy the|r |T133738:0|t[Grimoire of Blood Pact (Rank 1)] |cRXP_BUY_from her if you can afford it. If not you can buy it later|r
    .target Cylina Darkheart
    .money <0.0100
    .train 20397,1
step << Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zaldimar Wefhellt|r
    .target Zaldimar Wefhellt
    .goto 1429/0,34.28,-9471.61
    .trainer >> Train your class spells
step << Human Priest
    .goto 1429/0,33.24,-9460.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Josetta|r
    .turnin 5623 >>Turn in In Favor of the Light
    .target Priestess Josetta
    .isOnQuest 5623
step << Human Priest
    .goto 1429/0,33.24,-9460.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Josetta|r
    .accept 5624 >>Accept Garments of the Light
    .target Priestess Josetta
step << Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Josetta|r
    .target Priestess Josetta
    .goto 1429/0,33.14,-9460.75
    .trainer >> Train your class spells
step << Rogue
    .money <0.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Keryn Sylvius|r
    .target Keryn Sylvius
    .goto 1429/0,12.69,-9465.75
    .trainer >> Train your class spells
step << Warrior/Rogue
    .goto 1429/0,16.20,-9462.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Farley|r
    .vendor 295 >> |cRXP_BUY_Buy|r |T133995:0|t[Dalaran Sharp] |cRXP_BUY_from him until you're down to 1 Silver|r << Warrior
    .vendor 295 >> |cRXP_BUY_Buy up to 20|r |T133995:0|t[Dalaran Sharp] |cRXP_BUY_from him if you can afford it|r << Rogue
    .collect 414,20
    .target Innkeeper Farley
step << Warrior
    .goto 1429/0,109.36,-9461.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lyria Du Lac|r
    .trainer >> Train your class spells
    .target Lyria Du Lac
step << Paladin
    .goto 1429/0,109.04,-9468.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Wilhelm|r
    .trainer >> Train your class spells
    .target Brother Wilhelm
step
    .goto 1429/0,72.81,-9496.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Remy "Two Times"|r
    .accept 47 >>Accept Gold Dust Exchange
    .target Remy "Two Times"
step << Hunter
    .goto 1429/0,107.200,-9472.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Josephine Carson|r
    .trainer >> Train your class spells
    .target Josephine Carson
step << Human Priest
    .goto 1429/0,-135.79,-9514.66
    >>Interact with |cRXP_FRIENDLY_Guard Roberts|r
    .complete 5624,1 --Guard Roberts
    .target Guard Roberts
step
    .goto 1429/0,338.33,-9889.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Auntie" Bernice Stonefield|r
    .accept 85 >>Accept Lost Necklace
    .target "Auntie" Bernice Stonefield
step
    .goto 1429/0,332.43,-9894.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ma Stonefield|r
    .accept 88 >>Accept Princess Must Die!
    .target Ma Stonefield
step
    .goto 1429/0,38.45,-9923.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Billy Maclure|r
    .turnin 85 >>Turn in Lost Necklace
    .accept 86 >>Accept Pie for Billy
    .target Billy Maclure
step
    #loop
    .goto 1429/0,308.82,-9971.32,0
    .goto 1429/0,308.82,-9971.32,40,0
    .goto 1429/0,313.68,-10018.31,40,0
    .goto 1429/0,379.28,-10016.00,40,0
    .goto 1429/0,423.71,-9945.17,40,0
    .goto 1429/0,377.20,-9910.22,40,0
    .goto 1429/0,418.16,-9881.75,40,0
    .goto 1429/0,461.54,-9886.61,40,0
    .goto 1429/0,435.86,-9792.87,40,0
    .goto 1429/0,356.03,-9821.57,40,0
    >>Kill |cRXP_ENEMY_Stonetusk Boars|r, |cRXP_ENEMY_Longsnouts|r, |cRXP_ENEMY_Princess|r and |cRXP_ENEMY_Porcine Entourages|r. Loot them for |cRXP_LOOT_Chunk of Boar Meat|r
    .complete 86,1 --Chunk of Boar Meat (4)
    .mob Stonetusk Boar
    .mob Longsnout
    .mob Princess
    .mob Porcine Entourage
step
    .xp 7+1600 >>Grind until 1600+/4500xp
step
    >>Grind some mobs back to Goldshire
    .xp 7+2690 >>Grind until 2690+/4500xp
    .goto 1429/0,74.20,-9497.30
step
    .money <0.1250
    .goto 1429/0,8.25,-9464.89
    .vendor >>Buy a 6 slot bag from Brog
step
    .goto 1429/0,16.20,-9462.65
    .vendor >>Buy level 5 Water up to 40
step
    .xp 9 >> Grind to 9
step
    .goto 1453/0,613.39,-8796.05
    .trainer >> Train 1h Swords
step
    .goto 1429/0,338.33,-9889.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Auntie" Bernice Stonefield|r
    .turnin 86 >>Turn in Pie for Billy while you are here
    .isQuestComplete 86
    .target "Auntie" Bernice Stonefield
step << Human Priest
    .goto 1429/0,33.24,-9460.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Josetta|r
    .turnin 5624 >>Turn in Garments of the Light while you are here
    .isQuestComplete 5624
    .target Priestess Josetta
step
    .goto 1429/0,37.75,-10013.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maybell Maclure|r
    .accept 106 >>Accept Young Lovers
    .target Maybell Maclure
step
    .goto 1429/0,65.17,-10008.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Joshua|r
    >>|cRXP_BUY_Buy as much|r |T132815:0|t[Ice Cold Milk] |cRXP_BUY_as you can afford from him|r
    .vendor 258 >>Vendor Trash
    .target Joshua Maclure
step
    .goto 1429/0,499.72,-9930.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tommy Joe Stonefield|r
    .turnin 106 >>Turn in Young Lovers
    .accept 111 >>Accept Speak with Gramma
    .target Tommy Joe Stonefield
step
    .goto 1429/0,338.33,-9889.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Auntie" Bernice Stonefield|r
    .turnin 86 >>Turn in Pie for Billy
    .accept 84 >>Accept Back to Billy
    .target "Auntie" Bernice Stonefield
step
    #completewith Along84
    >>As you go: Kill |cRXP_ENEMY_Kobold Miners|r, |cRXP_ENEMY_Goldtooths|r, |cRXP_ENEMY_Kobold Tunnelers|r and |cRXP_ENEMY_Kobold Geomancers|r. Loot them for |cRXP_LOOT_Large Candle|r. Kill |cRXP_ENEMY_Kobold Miners|r, |cRXP_ENEMY_Goldtooths|r, |cRXP_ENEMY_Kobold Tunnelers|r and |cRXP_ENEMY_Kobold Geomancers|r. Loot them for |cRXP_LOOT_Gold Dust|r. |cRXP_WARN_Anything left is finished later|r
    .complete 60,1 --Large Candle (8)
    .complete 47,1 --Gold Dust (10)
    .mob Kobold Miner
    .mob Goldtooth
    .mob Kobold Tunneler
    .mob Kobold Geomancer
step
    #label Along84
    .goto 1429/0,322.71,-9880.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gramma Stonefield|r
    .turnin 111 >>Turn in Speak with Gramma
    .accept 107 >>Accept Note to William
    .target Gramma Stonefield
step
    #loop
    .goto 1429/0,284.88,-9853.74,0
    .goto 1429/0,284.88,-9853.74,40,0
    .goto 1429/0,279.32,-9770.88,40,0
    .goto 1429/0,191.86,-9758.15,40,0
    .goto 1429/0,87.73,-9745.65,40,0
    .goto 1429/0,82.18,-9822.50,40,0
    .goto 1429/0,131.46,-9797.27,40,0
    .goto 1429/0,160.97,-9840.55,40,0
    .goto 1429/0,179.01,-9907.67,40,0
    .goto 1429/0,222.75,-9954.43,40,0
    >>Kill |cRXP_ENEMY_Kobold Miners|r, |cRXP_ENEMY_Goldtooths|r, |cRXP_ENEMY_Kobold Tunnelers|r and |cRXP_ENEMY_Kobold Geomancers|r. Loot them for |cRXP_LOOT_Large Candle|r
    >>Kill |cRXP_ENEMY_Kobold Miners|r, |cRXP_ENEMY_Goldtooths|r, |cRXP_ENEMY_Kobold Tunnelers|r and |cRXP_ENEMY_Kobold Geomancers|r. Loot them for |cRXP_LOOT_Gold Dust|r
    .complete 60,1 --Large Candle (8)
    .complete 47,1 --Gold Dust (10)
    .mob Kobold Miner
    .mob Goldtooth
    .mob Kobold Tunneler
    .mob Kobold Geomancer
step
    #loop
    .goto 1429/0,160.97,-9840.55,0
    .goto 1429/0,160.97,-9840.55,40,0
    .goto 1429/0,131.46,-9797.27,40,0
    .goto 1429/0,82.18,-9822.50,40,0
    .goto 1429/0,95.71,-9743.34,40,0
    .goto 1429/0,191.86,-9758.15,40,0
    .goto 1429/0,279.32,-9770.88,40,0
    .goto 1429/0,284.88,-9853.74,40,0
    .goto 1429/0,222.75,-9954.43,40,0
    .goto 1429/0,179.01,-9907.67,40,0
    >>Kill |cRXP_ENEMY_Kobold Miners|r and |cRXP_ENEMY_Kobold Tunnelers|r. Loot them for |cRXP_LOOT_Lost Book|r
    .complete 91775,2 --Lost Book (6)
    .mob Kobold Miner
    .mob Kobold Tunneler
    .isOnQuest 91775
step
    .goto 1429/0,38.45,-9923.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Billy Maclure|r
    .turnin 84 >>Turn in Back to Billy
    .accept 87 >>Accept Goldtooth
    .target Billy Maclure
step
    .goto 1429/0,127.65,-9843.56
    >>Scout through the Fargodeep Mine
    .complete 62,1 --Scout through the Fargodeep Mine
step
    .goto 1429/0,87.73,-9745.65
    >>Kill |cRXP_ENEMY_Goldtooth|r and loot |cRXP_LOOT_Bernice's Necklace|r
    .complete 87,1 --Bernice's Necklace (1)
    .mob Goldtooth
step
    .goto 1429/0,90.86,-9788.93
    >>Kill |cRXP_ENEMY_Nimsy|r and loot |cRXP_LOOT_Picture Book: Fun with Elementals|r
    .complete 91775,1 --Picture Book: Fun with Elementals (1)
    .mob Nimsy
    .isOnQuest 91775
step
    .goto 1429/0,223.09,-9916.240,0
    .goto 1429/0,176.93,-9857.68,35,0
    .goto 1429/0,176.24,-9902.12,35,0
    .goto 1429/0,223.09,-9916.240,35,0
    .goto 1429/0,259.54,-9865.09,35,0
    .goto 1429/0,215.81,-9830.600,35,0
    .xp 7+1140 >>Grind to 1140+/4500xp
step
    .goto 1429/0,223.09,-9916.240,0
    .goto 1429/0,176.93,-9857.68,35,0
    .goto 1429/0,176.24,-9902.12,35,0
    .goto 1429/0,223.09,-9916.240,35,0
    .goto 1429/0,259.54,-9865.09,35,0
    .goto 1429/0,215.81,-9830.600,35,0
    .xp 7+1815 >>Grind to 1815+/4500xp
step
    .goto 1429/0,338.33,-9889.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Auntie" Bernice Stonefield|r
    .turnin 87 >>Turn in Goldtooth
    .target "Auntie" Bernice Stonefield
step
    #label RBSection1_3
    #completewith next
    +|cRXP_WARN_Elwynn Forest: around Marshal Dughan|r (planned from level 6)
step
    .goto 1429/0,72.81,-9496.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Remy "Two Times"|r
    .turnin 47 >>Turn in Gold Dust Exchange
    .target Remy "Two Times"
    .isOnQuest 47
step
    .goto 1429/0,72.81,-9496.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Remy "Two Times"|r
    .accept 40 >>Accept A Fishy Peril
    .target Remy "Two Times"
step
    .goto 1429/0,73.85,-9465.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Dughan|r
    .turnin 62 >>Turn in The Fargodeep Mine
    .target Marshal Dughan
    .isOnQuest 62
step
    .goto 1429/0,73.85,-9465.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Dughan|r
    .accept 76 >>Accept The Jasperlode Mine
    .target Marshal Dughan
    .isQuestTurnedIn 62 --any of: The Fargodeep Mine
step
    .goto 1429/0,73.85,-9465.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Dughan|r
    .turnin 40 >>Turn in A Fishy Peril
    .accept 35 >>Accept Further Concerns
    .target Marshal Dughan
step
    .goto 1429/0,73.85,-9465.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Dughan|r
    .turnin 91775 >>Turn in Book Return
    .target Marshal Dughan
    .isOnQuest 91775
step
    .goto 1429/0,73.85,-9465.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Dughan|r
    .accept 91777 >>Accept Rare Books
    .target Marshal Dughan
    .isQuestTurnedIn 91775 --any of: Book Return
step << Warrior
    .goto 1429/0,94.01,-9464.8900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corina Steele|r
    .vendor 54 >>|cRXP_BUY_Buy a|r |T135321:0|t[Gladius] |cRXP_BUY_from her if you can afford it|r
    .collect 2488,1
    .target Corina Steele
step << Rogue
    .goto 1429/0,94.01,-9464.8900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corina Steele|r
    .vendor 54 >>|cRXP_BUY_Buy a|r |T135421:0|t[Tomahawk] |cRXP_BUY_from her if you can afford it|r
    .collect 2490,1
    .target Corina Steele
step << Rogue
    .goto 1429/0,94.01,-9464.8900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corina Steele|r
    .vendor 54 >>|cRXP_BUY_Buy a|r |T135641:0|t[Stiletto] |cRXP_BUY_from her if you can afford it|r
    .collect 2494,1
    .target Corina Steele
step << Paladin
    .goto 1429/0,94.01,-9464.8900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corina Steele|r
    .vendor 54 >>|cRXP_BUY_Buy a|r |T133053:0|t[Wooden Mallet] |cRXP_BUY_from her if you can afford it|r
    .collect 2493,1
    .target Corina Steele
step
    .goto 1429/0,31.85,-9460.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_William Pestle|r
    .turnin 60 >>Turn in Kobold Candles
    .target William Pestle
    .isOnQuest 60
step
    .goto 1429/0,31.85,-9460.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_William Pestle|r
    .accept 61 >>Accept Shipment to Stormwind
    .target William Pestle
    .isQuestTurnedIn 60 --any of: Kobold Candles
step
    .goto 1429/0,31.85,-9460.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_William Pestle|r
    .turnin 107 >>Turn in Note to William
    .target William Pestle
    .isOnQuest 107
step
    .goto 1429/0,31.85,-9460.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_William Pestle|r
    .accept 112 >>Accept Collecting Kelp
    .target William Pestle
    .isQuestTurnedIn 107 --any of: Note to William
step
    .xp 8 >> Grind to 8
step << Warlock
    .goto 1429/0,-5.36,-9472.760
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maximillian Crowe|r
    .target Maximillian Crowe
    .trainer >> Train your class spells
step << Warlock
    .goto 1429/0,-5.53,-9466.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cylina Darkheart|r
    .vendor >> |cRXP_BUY_Buy the|r |T133738:0|t[Grimoire of Firebolt (Rank 2)] |cRXP_BUY_from her if you can afford it. If not you can buy it later|r
    .target Cylina Darkheart
    .money <0.100
    .train 20270,1
step
    .goto 1429/0,16.20,-9462.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Farley|r
    >>|cRXP_BUY_Buy 35|r |T132815:0|t[Ice Cold Milk] |cRXP_BUY_from him|r
    .vendor >>Vendor Trash
    .collect 1179,35,432,1
    .target Innkeeper Farley
step
    .goto 1429/0,9.64,-9465.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brog|r
    .vendor >>|cRXP_BUY_Buy a|r |T133634:0|t[Small Brown Pouch] |cRXP_BUY_from him|r
    .target Brog Hamfist
    .money <0.05
step << Human Priest
    .goto 1429/0,33.24,-9460.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Josetta|r
    .turnin 5624 >>Turn in Garments of the Light
    .target Priestess Josetta
    .isOnQuest 5624
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Keryn Sylvius|r
    .target Keryn Sylvius
    .goto 1429/0,12.69,-9465.75
    .trainer >> Train your class spells
step << Rogue/Warrior/Paladin
    .money <0.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Michelle Belle|r
    .target Michelle Belle
    .goto 1429/0,29.35,-9456.790
    .train 3273 >> Train |T135966:0|t[First Aid]
step
    .goto 1429/0,9.64,-9465.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brog Hamfist|r
    .vendor >> |cRXP_WARN_Buy a|r |T133634:0|t[Small Brown Pouch] |cRXP_WARN_if needed|r
    .target Brog Hamfist
    .money <0.1250
step
    .goto 1429/0,-111.84,-9378.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jason Mathers|r
    .accept 99127 >>Accept A Net Disaster
    .target Jason Mathers
step
    #loop
    .goto 1429/0,-141.00,-9349.16,0
    .goto 1429/0,-141.00,-9349.16,40,0
    .goto 1429/0,-151.41,-9314.45,40,0
    .goto 1429/0,-147.94,-9409.34,40,0
    .goto 1429/0,-182.65,-9455.63,40,0
    .goto 1429/0,-193.06,-9478.78,40,0
    .goto 1429/0,-182.65,-9511.18,40,0
    .goto 1429/0,-144.47,-9504.24,40,0
    .goto 1429/0,-92.40,-9464.89,40,0
    .goto 1429/0,-81.99,-9437.12,40,0
    >>Loot the |cRXP_PICK_Fishing Traps|r for |cRXP_LOOT_Half-Eaten Fish|r
    .complete 99127,1 --Half-Eaten Fish (7)
step
    .goto 1429/0,-111.84,-9378.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jason Mathers|r
    .turnin 99127 >>Turn in A Net Disaster
    .accept 99128 >>Accept Slimy Menace
    .target Jason Mathers
step
    .goto 1429/0,-117.05,-9382.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lee Brown|r
    .accept 99143 >>Accept Bottles and Baubles
    .target Lee Brown
step
    #loop
    .goto 1429/0,-210.07,-9504.94,0
    .goto 1429/0,-210.07,-9504.94,40,0
    .goto 1429/0,-269.42,-9530.40,40,0
    .goto 1429/0,-381.18,-9545.67,40,0
    .goto 1429/0,-395.75,-9484.10,40,0
    .goto 1429/0,-487.04,-9511.65,40,0
    .goto 1429/0,-488.77,-9449.85,40,0
    .goto 1429/0,-447.82,-9381.34,40,0
    .goto 1429/0,-390.90,-9403.56,40,0
    .goto 1429/0,-331.89,-9456.33,40,0
    >>Kill |cRXP_ENEMY_Murlocs|r
    >>Loot the |cRXP_PICK_Junk Piles|r for |cRXP_LOOT_Shiny Junk|r
    >>Kill |cRXP_ENEMY_Murloc Streamrunners|r
    .complete 99128,2 --Murloc slain (7)
    .complete 99143,1 --Shiny Junk (6)
    .complete 99128,1 --Murloc Streamrunner slain (4)
    .mob Murloc
    .mob Murloc Streamrunner
step
    #loop
    .goto 1429/0,-328.42,-9484.80,0
    .goto 1429/0,-328.42,-9484.80,40,0
    .goto 1429/0,-395.75,-9484.10,40,0
    .goto 1429/0,-381.18,-9545.67,40,0
    .goto 1429/0,-449.55,-9547.06,40,0
    .goto 1429/0,-487.04,-9511.65,40,0
    .goto 1429/0,-488.77,-9449.85,40,0
    .goto 1429/0,-447.82,-9381.34,40,0
    .goto 1429/0,-390.90,-9403.56,40,0
    .goto 1429/0,-313.15,-9410.04,40,0
    >>Kill |cRXP_ENEMY_Murlocs|r and |cRXP_ENEMY_Murloc Streamrunners|r. Loot them for |cRXP_LOOT_Crystal Kelp Frond|r
    .complete 112,1 --Crystal Kelp Frond (4)
    .mob Murloc
    .mob Murloc Streamrunner
    .isOnQuest 112
step
    .goto 1429/0,-117.05,-9382.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lee Brown|r
    .turnin 99143 >>Turn in Bottles and Baubles
    .target Lee Brown
step
    .goto 1429/0,-111.84,-9378.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jason Mathers|r
    .turnin 99128 >>Turn in Slimy Menace
    .accept 99129 >>Accept A Man About a Murloc
    .target Jason Mathers
step
    .goto 1429/0,-614.07,-9170.02
    >>Scout through the Jasperlode Mine
    .complete 76,1 --Scout through the Jasperlode Mine
    .isOnQuest 76
step
    .goto 1429/0,-594.98,-9072.11
    >>Kill |cRXP_ENEMY_Geosculptor Yip|r and loot |cRXP_LOOT_Geomancy for Curious Young Wizards|r
    .complete 91777,1 --Geomancy for Curious Young Wizards (1)
    .mob Geosculptor Yip
    .isOnQuest 91777
step
    .goto 1429/0,-621.36,-9051.74
    >>Kill |cRXP_ENEMY_Mother Fang|r and loot |cRXP_LOOT_Arcane Explainer: Magical Stuff in Simple Words|r
    .complete 91777,2 --Arcane Explainer: Magical Stuff in Simple Words (1)
    .mob Mother Fang
    .isOnQuest 91777
step
    .goto 1429/0,-186.46,-8874.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Paxton|r
    .turnin 91777 >>Turn in Rare Books
    .target Brother Paxton
    .isOnQuest 91777
step
    .goto 1429/0,-1031.96,-9610.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Guard Thomas|r
    .turnin 35 >>Turn in Further Concerns
    .accept 37 >>Accept Find the Lost Guards
    .accept 52 >>Accept Protect the Frontier
    .target Guard Thomas
step
    .goto 1429/0,-986.49,-9336.20
    >>Click the |cRXP_PICK_A half-eaten body|r
    .turnin 37 >>Turn in Find the Lost Guards
    .accept 45 >>Accept Discover Rolf's Fate
step
    .goto 1429/0,-1289.15,-9469.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Supervisor Raelen|r
    .accept 5545 >>Accept A Bundle of Trouble
    .target Supervisor Raelen
step
    .goto 1429/0,-1355.20,-9469.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rallic Finn|r
    .vendor >> Vendor trash
    .target Rallic Finn
    .subzoneskip 88,1
step
    #completewith Along120
    >>As you go: Pick up |cRXP_PICK_Bundle of Wood|r from the ground. |cRXP_WARN_Anything left is finished later|r
    .complete 5545,1 --Bundle of Wood (8)
step
    .goto 1429/0,-1326.98,-9416.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hagar Lowe|r
    .accept 91732 >>Accept Good Steel
    .target Hagar Lowe
step
    #label Along120
    .goto 1429/0,-1234.31,-9224.18
    >>Click the |cRXP_PICK_Rolf's corpse|r
    .turnin 45 >>Turn in Discover Rolf's Fate
    .accept 71 >>Accept Report to Thomas
step
    #completewith Along121
    >>As you go: Kill |cRXP_ENEMY_Prowlers|r. |cRXP_WARN_Anything left is finished later|r
    .complete 52,1 --Prowler slain (8)
    .mob Prowler
step
    #completewith Along121
    >>As you go: Kill |cRXP_ENEMY_Young Forest Bears|r. |cRXP_WARN_Anything left is finished later|r
    .complete 52,2 --Young Forest Bear slain (5)
    .mob Young Forest Bear
step
    #label Along121
    #loop
    .goto 1429/0,-1207.93,-9318.15,0
    .goto 1429/0,-1207.93,-9318.15,40,0
    .goto 1429/0,-1338.09,-9331.11,40,0
    .goto 1429/0,-1421.39,-9350.78,40,0
    .goto 1429/0,-1295.74,-9389.44,40,0
    .goto 1429/0,-1249.58,-9362.36,40,0
    .goto 1429/0,-1185.02,-9382.73,40,0
    .goto 1429/0,-1127.06,-9425.31,40,0
    .goto 1429/0,-1101.38,-9383.19,40,0
    .goto 1429/0,-1146.84,-9316.99,40,0
    >>Pick up |cRXP_PICK_Bundle of Wood|r from the ground
    .complete 5545,1 --Bundle of Wood (8)
step
    .goto 1429/0,-1289.15,-9469.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Supervisor Raelen|r
    .turnin 5545 >>Turn in A Bundle of Trouble
    .target Supervisor Raelen
step
    .goto 1429/0,-1222.51,-9531.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sara Timberlain|r
    .accept 83 >>Accept Red Linen Goods
    .target Sara Timberlain
step
    .goto 1429/0,-1121.16,-9604.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ormin Pelford|r
    .accept 91733 >>Accept Downstream
    .target Ormin Pelford
step
    .goto 1429/0,-1031.96,-9610.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Guard Thomas|r
    .turnin 71 >>Turn in Report to Thomas while you are here
    .isQuestComplete 71
    .target Guard Thomas
step
    #completewith Along125
    >>As you go: Kill |cRXP_ENEMY_Prowlers|r. |cRXP_WARN_Anything left is finished later|r
    .complete 52,1 --Prowler slain (8)
    .mob Prowler
step
    #label Along125
    .goto 1429/0,-1050.35,-9707.92
    >>Pick up |cRXP_PICK_Waterlogged Saw|r from the ground
    .complete 91733,2 --Waterlogged Saw (1)
step
    .goto 1429/0,-1126.71,-9849.11
    >>Pick up |cRXP_PICK_Waterlogged Axe|r from the ground
    >>Pick up |cRXP_PICK_Waterlogged Toolbox|r from the ground
    .complete 91733,1 --Waterlogged Axe (1)
    .complete 91733,3 --Waterlogged Toolbox (1)
step
    .goto 1429/0,-724.10,-9556.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hamish Bergwort|r
    .accept 91723 >>Accept Delicate Instruments
    .target Hamish Bergwort
step
    .goto 1429/0,-711.95,-9256.35
    >>Kill |cRXP_ENEMY_Kobold Geomancers|r
    .complete 91723,1 --Kobold Geomancer slain (8)
    .mob Kobold Geomancer
step
    #loop
    .goto 1429/0,-912.56,-8908.47,0
    .goto 1429/0,-912.56,-8908.47,40,0
    .goto 1429/0,-890.70,-8885.09,40,0
    .goto 1429/0,-918.81,-8847.83,40,0
    .goto 1429/0,-943.80,-8806.39,40,0
    .goto 1429/0,-1035.08,-8809.63,40,0
    .goto 1429/0,-1081.94,-8803.62,40,0
    .goto 1429/0,-1075.34,-8874.91,40,0
    .goto 1429/0,-1019.46,-8865.18,40,0
    .goto 1429/0,-968.10,-8889.95,40,0
    >>Kill |cRXP_ENEMY_Prowlers|r
    .complete 52,1 --Prowler slain (8)
    .mob Prowler
step
    .goto 1429/0,-1310.67,-9319.07
    >>Kill |cRXP_ENEMY_Young Forest Bears|r
    .complete 52,2 --Young Forest Bear slain (5)
    .mob Young Forest Bear
step
    #loop
    .goto 1429/0,-606.09,-9177.88,0
    .goto 1429/0,-606.09,-9177.88,40,0
    .goto 1429/0,-574.85,-9159.37,40,0
    .goto 1429/0,-599.15,-9101.50,40,0
    .goto 1429/0,-599.15,-9131.59,40,0
    >>Pick up |cRXP_PICK_Mining Tools|r from the ground
    .complete 91732,1 --Mining Tools (4)
step
    .goto 1429/0,-724.10,-9556.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hamish Bergwort|r
    .turnin 91723 >>Turn in Delicate Instruments
    .accept 91724 >>Accept Delicate Instruments
    .target Hamish Bergwort
step
    #completewith Along133
    >>As you go: Kill |cRXP_ENEMY_Defias Bandits|r, |cRXP_ENEMY_Morgan the Collectors|r, |cRXP_ENEMY_Defias Rogue Wizards|r and |cRXP_ENEMY_Defias Ambushers|r. Loot them for |cRXP_LOOT_Red Linen Bandana|r. |cRXP_WARN_Anything left is finished later|r
    .complete 83,1 --Red Linen Bandana (6)
    .mob Defias Bandit
    .mob Morgan the Collector
    .mob Defias Rogue Wizard
    .mob Defias Ambusher
step
    #label Along133
    .goto 1429/0,-882.37,-9773.89
    >>Kill |cRXP_ENEMY_Princess|r and loot |cRXP_LOOT_Brass Collar|r
    .complete 88,1 --Brass Collar (1)
    .mob Princess
    .isOnQuest 88
step
    #completewith Drop184x1
    >>|cRXP_LOOT_Westfall Deed|r can drop from |cRXP_ENEMY_Defias Bandit|r, |cRXP_ENEMY_Defias Rogue Wizard|r, |cRXP_ENEMY_Defias Ambusher|r. Use it to start the quest if you get one
    .collect 1972,1,184 --Westfall Deed (1)
    .accept 184 >>Accept Furlbrow's Deed
    .use 1972
step
    #label Drop184x1
    #loop
    .goto 1429/0,-917.42,-9766.95,0
    .goto 1429/0,-917.42,-9766.95,40,0
    .goto 1429/0,-927.14,-9805.83,40,0
    .goto 1429/0,-918.81,-9826.66,40,0
    .goto 1429/0,-840.02,-9836.62,40,0
    .goto 1429/0,-828.91,-9802.59,40,0
    .goto 1429/0,-816.07,-9744.73,40,0
    .goto 1429/0,-846.62,-9714.17,40,0
    .goto 1429/0,-939.63,-9715.10,40,0
    >>Kill |cRXP_ENEMY_Defias Bandits|r, |cRXP_ENEMY_Morgan the Collectors|r, |cRXP_ENEMY_Defias Rogue Wizards|r and |cRXP_ENEMY_Defias Ambushers|r. Loot them for |cRXP_LOOT_Red Linen Bandana|r
    .complete 83,1 --Red Linen Bandana (6)
    .mob Defias Bandit
    .mob Morgan the Collector
    .mob Defias Rogue Wizard
    .mob Defias Ambusher
step
    .goto 1429/0,-1031.96,-9610.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Guard Thomas|r
    .turnin 52 >>Turn in Protect the Frontier
    .turnin 71 >>Turn in Report to Thomas
    .accept 39 >>Accept Deliver Thomas' Report
    .target Guard Thomas
step
    .goto 1429/0,-1121.16,-9604.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ormin Pelford|r
    .turnin 91733 >>Turn in Downstream
    .target Ormin Pelford
step << Warlock/Warrior/Rogue/Hunter
    .goto 1429/0,-877.85,-9778.98
    .xp 9+3510 >> Grind to 3510+/6500xp << Warlock/Hunter
    .xp 9+3420 >> Grind to 3420+/6500xp << Warrior/Rogue
step << Warlock/Warrior/Rogue/Hunter
    .goto 1429/0,-877.85,-9778.98
    .xp 9+2670 >> Grind to 2670+/6500xp << Warlock/Hunter
    .xp 9+2580 >> Grind to 2580+/6500xp << Warrior/Rogue
step
    .goto 1429/0,-1222.51,-9531.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sara Timberlain|r
    .turnin 83 >>Turn in Red Linen Goods
    .target Sara Timberlain
step
    .goto 1429/0,-1326.98,-9416.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hagar Lowe|r
    .turnin 91732 >>Turn in Good Steel
    .target Hagar Lowe
step
    .goto 1429/0,-1406.11,-9775.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Merell Ross|r
    .turnin 91740 >>Turn in Croaky's Head
    .target Merell Ross
    .isOnQuest 91740
step
    #label RBSection1_4
    #completewith next
    +|cRXP_WARN_Elwynn Forest: around Marshal Dughan|r (planned from level 9)
step
    #completewith next
    .hs >>Hearth to Innkeeper Farley's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1429/0,31.85,-9460.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_William Pestle|r
    .turnin 112 >>Turn in Collecting Kelp
    .target William Pestle
    .isOnQuest 112
step
    .goto 1429/0,72.81,-9496.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Remy "Two Times"|r
    .turnin 99129 >>Turn in A Man About a Murloc while you are here
    .isQuestComplete 99129
    .target Remy "Two Times"
step
    .goto 1429/0,31.85,-9460.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_William Pestle|r
    .accept 114 >>Accept The Escape
    .target William Pestle
    .isQuestTurnedIn 112 --any of: Collecting Kelp
step << Warrior/Rogue
    .goto 1429/0,29.35,-9456.790
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Michelle Belle|r
    .train 3273 >> Train |T135966:0|t[First Aid]
    .target Michelle Belle
step << Rogue
    .goto 1429/0,12.69,-9465.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Keryn Sylvius|r
    >>|cRXP_WARN_Only train|r |T132147:0|t[Dual Wield] |cRXP_WARN_and|r |T132307:0|t[Sprint]|cRXP_WARN_. Do not train other spells to save your money for later|r
    .train 674 >> Train |T132147:0|t[Dual Wield]
    .train 2983 >> Train |T132307:0|t[Sprint]
    .target Keryn Sylvius
    .xp <10,1
step
    .goto 1429/0,73.85,-9465.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Dughan|r
    .turnin 39 >>Turn in Deliver Thomas' Report
    .target Marshal Dughan
    .isOnQuest 39
step
    .goto 1429/0,73.85,-9465.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Dughan|r
    .turnin 76 >>Turn in The Jasperlode Mine
    .target Marshal Dughan
    .isOnQuest 76
step
    .goto 1429/0,73.85,-9465.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Dughan|r
    .accept 239 >>Accept Westbrook Garrison Needs Help!
    .target Marshal Dughan
    .isQuestTurnedIn 76 --any of: The Jasperlode Mine
step
    .goto 1429/0,73.85,-9465.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Dughan|r
    .accept 59 >>Accept Cloth and Leather Armor
    .target Marshal Dughan
    .isQuestTurnedIn 39 --any of: Deliver Thomas' Report
step
    .goto 1429/0,73.85,-9465.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Dughan|r
    .accept 109 >>Accept Report to Gryan Stoutmantle
    .target Marshal Dughan
step
    .goto 1429/0,94.01,-9464.8900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corina Steele|r
    .vendor >> Vendor Trash
    .target Corina Steele
    .money >0.75
step << Warlock/Warrior/Hunter
    .xp 10 >> Grind to 10
step << Rogue
    .goto 1429/0,12.76,-9465.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Keryn Sylvius|r
    .accept 2205 >>Accept Seek out SI: 7
    .target Keryn Sylvius
    .xp <10,1
step << Warlock
    .goto 1429/0,-8.76,-9473.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Remen Marcot|r
    .accept 1685 >>Accept Gakin's Summons
    .target Remen Marcot
    .xp <10,1
step << Warrior
    .goto 1429/0,109.25,-9461.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lyria Du Lac|r
    .accept 1638 >>Accept A Warrior's Training
    .target Lyria Du Lac
step << Warrior
    .goto 1429/0,109.36,-9461.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lyria Du Lac|r
    .trainer >> Train your class spells
    .target Lyria Du Lac
    .money <0.5
step << Paladin
    .goto 1429/0,109.04,-9468.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Wilhelm|r
    .trainer >> Train your class spells
    .target Brother Wilhelm
    .xp <10,1
    .xp >12,1
step << Paladin
    .goto 1429/0,109.04,-9468.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Wilhelm|r
    .trainer >> Train your class spells
    .target Brother Wilhelm
    .xp <12,1
step << Warrior
    .goto 1453/0,358.25,-8728.28,15,0
    .goto 1453/0,302.6,-8685.53,15,0
    .goto 1453/0,325.68,-8688.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ilsa Corbin|r
    .trainer >> Train your class spells
    .target Ilsa Corbin
step << Hunter
    .goto 1429/0,106.13,-9474.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Josephine Carson|r
    .accept 94792 >>Accept Taming the Beast
    .target Josephine Carson
step << Hunter
    .goto 1429/0,107.200,-9472.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Josephine Carson::251507|r
    .target Josephine Carson::251507
    .trainer >> Train your class spells
step << NightElf Priest
    .goto 1429/0,33.24,-9460.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Josetta|r
    .accept 5628 >>Accept Returning Home
    .target Priestess Josetta
    .xp <10,1
step << Human Priest
    .goto 1429/0,33.24,-9460.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Josetta|r
    .accept 94774 >>Accept Divine Grace
    .target Priestess Josetta
    .xp <10,1
step << Hunter
    #loop
    .goto 1429/0,-490.86,-9623.67,0
    .goto 1429/0,-490.86,-9623.67,40,0
    .goto 1429/0,-496.76,-9669.97,40,0
    .goto 1429/0,-515.85,-9710.93,40,0
    .goto 1429/0,-306.21,-9652.14,40,0
    .goto 1429/0,-318.36,-9709.08,40,0
    .goto 1429/0,-345.08,-9743.57,40,0
    .goto 1429/0,-448.51,-9847.49,40,0
    .goto 1429/0,-318.36,-9788.70,40,0
    .goto 1429/0,-311.41,-9846.11,40,0
    .goto 1429/0,-323.91,-9915.54,40,0
    >>Interact with |cRXP_FRIENDLY_Rockhide Boar|r
    .complete 94792,1 --Rockhide Boar
    .target Rockhide Boar
step << Hunter
    .goto 1429/0,106.13,-9474.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Josephine Carson|r
    .turnin 94792 >>Turn in Taming the Beast
    .accept 94863 >>Accept Taming the Beast
    .target Josephine Carson
step << NightElf Priest
    .goto 1429/0,33.24,-9460.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Josetta|r
    .accept 5628 >>Accept Returning Home
    .target Priestess Josetta
    .xp <10,1
step << Human Priest
    .goto 1429/0,33.24,-9460.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Josetta|r
    .accept 94774 >>Accept Divine Grace
    .target Priestess Josetta
    .xp <10,1
step << Hunter
    #loop
    .goto 1429/0,-561.31,-9321.39,0
    .goto 1429/0,-561.31,-9321.39,40,0
    .goto 1429/0,-610.60,-9354.49,40,0
    .goto 1429/0,-582.83,-9406.33,40,0
    .goto 1429/0,-554.02,-9484.10,40,0
    .goto 1429/0,-542.57,-9527.16,40,0
    .goto 1429/0,-584.57,-9563.03,40,0
    .goto 1429/0,-624.48,-9581.55,40,0
    >>Interact with |cRXP_FRIENDLY_Gray Forest Wolf|r
    .complete 94863,1 --Gray Forest Wolf
    .target Gray Forest Wolf
step << Hunter
    .goto 1429/0,106.13,-9474.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Josephine Carson|r
    .turnin 94863 >>Turn in Taming the Beast
    .accept 94864 >>Accept Taming the Beast
    .target Josephine Carson
step << NightElf Priest
    .goto 1429/0,33.24,-9460.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Josetta|r
    .accept 5628 >>Accept Returning Home
    .target Priestess Josetta
    .xp <10,1
step << Human Priest
    .goto 1429/0,33.24,-9460.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Josetta|r
    .accept 94774 >>Accept Divine Grace
    .target Priestess Josetta
    .xp <10,1
step << Hunter
    #loop
    .goto 1429/0,-1463.38,-9439.43,0
    .goto 1429/0,-1463.38,-9439.43,40,0
    .goto 1429/0,-1505.03,-9462.58,40,0
    .goto 1429/0,-1505.03,-9536.65,40,0
    >>Interact with |cRXP_FRIENDLY_Young Forest Bear|r
    .complete 94864,1 --Young Forest Bear
    .target Young Forest Bear
step << Hunter
    .goto 1429/0,106.13,-9474.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Josephine Carson|r
    .turnin 94864 >>Turn in Taming the Beast
    .accept 94793 >>Accept Training the Beast
    .target Josephine Carson
step << Hunter
    .goto 1429/0,87.38,-9476.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Isaac Chan|r
    .turnin 94793 >>Turn in Training the Beast
    .target Isaac Chan
step << Hunter
    .goto 1429/0,85.000,-9475.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Isaac Chan::258930|r
    .target Isaac Chan::258930
    .trainer >> Train your pet spells
step << Warlock
    .goto 1429/0,-8.76,-9473.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Remen Marcot|r
    .accept 1685 >>Accept Gakin's Summons
    .target Remen Marcot
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maximillian Crowe|r and |cRXP_FRIENDLY_Remen Marcot|r
    .trainer >> Train your class spells
    .goto 1429/0,-5.36,-9472.760
    .target +Maximillian Crowe
    .goto 1429/0,-8.58,-9473.41
    .target +Remen Marcot
step << Priest
    .goto 1429/0,33.14,-9460.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Josetta|r
    .trainer >> Train your class spells
    .target Priestess Josetta
    .xp <10,1
step << Mage
    .goto 1429/0,34.28,-9471.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zaldimar Wefhellt|r
    .trainer >> Train your class spells
    .target Zaldimar Wefhellt
    .xp <10,1
step << skip
    .goto 1429/0,12.69,-9465.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Keryn Sylvius|r
    >>|cRXP_WARN_Only train|r |T132147:0|t[Dual Wield] |cRXP_WARN_and|r |T132307:0|t[Sprint]|cRXP_WARN_. Do not train other spells to save your money for later|r
    .train 674 >> Train |T132147:0|t[Dual Wield]
    .train 2983 >> Train |T132307:0|t[Sprint]
    .target Keryn Sylvius
step
    .goto 1429/0,72.81,-9496.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Remy "Two Times"|r
    .turnin 99129 >>Turn in A Man About a Murloc
    .target Remy "Two Times"
    .isOnQuest 99129
step
    .goto 1429/0,72.81,-9496.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Remy "Two Times"|r
    .accept 99130 >>Accept An Enticing Offer
    .target Remy "Two Times"
    .isQuestTurnedIn 99129 --any of: A Man About a Murloc
step << NightElf Priest
    .goto 1429/0,33.24,-9460.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Josetta|r
    .accept 5628 >>Accept Returning Home
    .target Priestess Josetta
    .xp <10,1
step << Human Priest
    .goto 1429/0,33.24,-9460.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Josetta|r
    .accept 94774 >>Accept Divine Grace
    .target Priestess Josetta
    .xp <10,1
step << Rogue
    .goto 1429/0,12.76,-9465.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Keryn Sylvius|r
    .accept 2205 >>Accept Seek out SI: 7
    .target Keryn Sylvius
    .xp <10,1
step
    #loop
    .goto 1429/0,88.08,-9918.55,0
    .goto 1429/0,88.08,-9918.55,40,0
    .goto 1429/0,105.43,-9932.44,40,0
    .goto 1429/0,122.79,-9953.27,40,0
    .goto 1429/0,108.90,-9969.47,40,0
    .goto 1429/0,67.25,-10008.82,40,0
    .goto 1429/0,60.31,-9969.47,40,0
    .goto 1429/0,32.55,-9953.27,40,0
    >>Open the |cRXP_PICK_Overgrown Duskweed|r. Loot it for |cRXP_LOOT_Duskweed Petal|r
    .complete 99130,1 --Duskweed Petal (1)
    .isOnQuest 99130
step
    #loop
    .goto 1429/0,114.11,-9907.67,0
    .goto 1429/0,114.11,-9907.67,40,0
    .goto 1429/0,46.43,-9943.09,40,0
    .goto 1429/0,86.00,-9979.19,40,0
    .goto 1429/0,114.11,-10067.15,40,0
    .goto 1429/0,223.09,-10038.68,40,0
    .goto 1429/0,313.68,-10018.31,40,0
    .goto 1429/0,252.25,-9989.84,40,0
    .goto 1429/0,197.06,-9933.83,40,0
    .goto 1429/0,156.11,-9987.06,40,0
    >>Kill |cRXP_ENEMY_Stonetusk Boars|r and |cRXP_ENEMY_Young Forest Bears|r. Loot them for |cRXP_LOOT_Vial of Animal Blood|r
    .complete 99130,2 --Vial of Animal Blood (1)
    .mob Stonetusk Boar
    .mob Young Forest Bear
    .isOnQuest 99130
step
    .goto 1429/0,72.81,-9496.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Remy "Two Times"|r
    .turnin 99130 >>Turn in An Enticing Offer
    .target Remy "Two Times"
    .isOnQuest 99130
step
    .goto 1429/0,72.81,-9496.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Remy "Two Times"|r
    .accept 99131 >>Accept Baited for Success
    .target Remy "Two Times"
    .isQuestTurnedIn 99130 --any of: An Enticing Offer
step << NightElf Priest
    .goto 1429/0,33.24,-9460.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Josetta|r
    .accept 5628 >>Accept Returning Home
    .target Priestess Josetta
    .xp <10,1
step << Human Priest
    .goto 1429/0,33.24,-9460.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Josetta|r
    .accept 94774 >>Accept Divine Grace
    .target Priestess Josetta
    .xp <10,1
step << Rogue
    .goto 1429/0,12.76,-9465.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Keryn Sylvius|r
    .accept 2205 >>Accept Seek out SI: 7
    .target Keryn Sylvius
    .xp <10,1
step
    .goto 1429/0,-111.84,-9378.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jason Mathers|r
    .turnin 99131 >>Turn in Baited for Success
    .target Jason Mathers
    .isOnQuest 99131
step
    .goto 1429/0,37.75,-10013.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maybell Maclure|r
    .turnin 114 >>Turn in The Escape
    .target Maybell Maclure
    .isOnQuest 114
step
    .goto 1429/0,332.43,-9894.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ma Stonefield|r
    .turnin 88 >>Turn in Princess Must Die!
    .target Ma Stonefield
    .isOnQuest 88
step
    #completewith Drop184x2
    >>|cRXP_LOOT_Westfall Deed|r can drop from |cRXP_ENEMY_Defias Bandit|r, |cRXP_ENEMY_Defias Rogue Wizard|r, |cRXP_ENEMY_Defias Ambusher|r. Use it to start the quest if you get one
    .collect 1972,1,184 --Westfall Deed (1)
    .accept 184 >>Accept Furlbrow's Deed
    .use 1972
step
    #label Drop184x2
    #loop
    .goto 1429/0,529.22,-9389.67,0
    .goto 1429/0,529.22,-9389.67,40,0
    .goto 1429/0,503.88,-9352.17,40,0
    .goto 1429/0,524.36,-9348.70,40,0
    .goto 1429/0,552.13,-9321.16,40,0
    >>Kill |cRXP_ENEMY_Defias Rogue Wizards|r
    .complete 91724,1 --Defias Rogue Wizard slain (6)
    .mob Defias Rogue Wizard
    .isOnQuest 91724
step
    .goto 1429/0,699.64,-9633.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sergeant De Vries|r
    .accept 91738 >>Accept An Apple Treat
    .target Sergeant De Vries
step
    .goto 1429/0,694.43,-9662.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deputy Rainer|r
    .turnin 239 >>Turn in Westbrook Garrison Needs Help!
    .target Deputy Rainer
    .isOnQuest 239
step
    .goto 1429/0,694.43,-9662.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deputy Rainer|r
    .accept 11 >>Accept Riverpaw Gnoll Bounty
    .target Deputy Rainer
    .isQuestTurnedIn 76 --any of: The Jasperlode Mine
step
    .goto 1429/0,683.33,-9668.35
    >>Click the |cRXP_PICK_Wanted Poster|r
    .accept 176 >>Accept Wanted:  "Hogger"
step
    #completewith Drop123x1
    >>|cRXP_LOOT_Gold Pickup Schedule|r can drop from |cRXP_ENEMY_Riverpaw Runt|r, |cRXP_ENEMY_Gruff Swiftbite|r, |cRXP_ENEMY_Hogger|r. Use it to start the quest if you get one
    .collect 1307,1,123 --Gold Pickup Schedule (1)
    .accept 123 >>Accept The Collector
    .use 1307
step
    .goto 1429/0,667.01,-10089.83
    >>Kill |cRXP_ENEMY_Hogger|r and loot |cRXP_LOOT_Huge Gnoll Claw|r
    .complete 176,1 --Huge Gnoll Claw (1)
    .mob Hogger
step
    #label Drop123x1
    #loop
    .goto 1429/0,673.96,-10089.83,0
    .goto 1429/0,673.96,-10089.83,40,0
    .goto 1429/0,686.45,-10117.84,40,0
    .goto 1429/0,653.48,-10120.15,40,0
    .goto 1429/0,616.34,-10147.00,40,0
    .goto 1429/0,573.65,-10127.10,40,0
    .goto 1429/0,542.76,-10091.91,40,0
    .goto 1429/0,629.18,-10071.31,40,0
    .goto 1429/0,581.28,-10010.67,40,0
    .goto 1429/0,653.82,-9990.77,40,0
    >>Kill |cRXP_ENEMY_Riverpaw Runts|r and |cRXP_ENEMY_Riverpaw Outrunners|r. Loot them for |cRXP_LOOT_Painted Gnoll Armband|r
    .complete 11,1 --Painted Gnoll Armband (8)
    .mob Riverpaw Runt
    .mob Riverpaw Outrunner
    .isOnQuest 11
step
    .goto 1429/0,694.43,-9662.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deputy Rainer|r
    .turnin 11 >>Turn in Riverpaw Gnoll Bounty
    .target Deputy Rainer
    .isOnQuest 11
step
    .goto 1429/0,699.64,-9633.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sergeant De Vries|r
    .turnin 91738 >>Turn in An Apple Treat
    .target Sergeant De Vries
    .isQuestComplete 91738
step << Rogue
    .xp 10 >>Grind to level 10 (Seek out SI: 7 needs it)
step << Rogue
    .goto 1429/0,12.76,-9465.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Keryn Sylvius|r
    .accept 2205 >>Accept Seek out SI: 7
    .target Keryn Sylvius
step
    .goto 1429/0,73.85,-9465.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Dughan|r
    .turnin 176 >>Turn in Wanted:  "Hogger" while you are here
    .isQuestComplete 176
    .target Marshal Dughan
step
    #completewith next
    .zone 1453 >>Travel to Stormwind City
    .zoneskip 1453
step << NightElf Druid
    .xp 10 >>Grind to level 10 (Heeding the Call needs it)
step << NightElf Druid
    .goto 1453/0,1095.51,-8741.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Theridran|r
    .accept 5924 >>Accept Heeding the Call
    .target Theridran
step << Skyborne Druid
    .goto 1453/0,1100.20,-8776.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sheldras Moontree|r
    .turnin 94912 >>Turn in Child of Nature
    .target Sheldras Moontree
    .isOnQuest 94912
step << Skyborne Druid
    .xp 10 >>Grind to level 10 (Moonglade needs it)
step << Skyborne Druid
    .goto 1453/0,1100.20,-8776.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sheldras Moontree|r
    .accept 94914 >>Accept Moonglade
    .target Sheldras Moontree
step << Warlock
    .goto 1453/0,1041.47,-8983.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gakin the Darkbinder|r
    .turnin 1715 >>Turn in The Slaughtered Lamb
    .target Gakin the Darkbinder
    .isOnQuest 1715
step << Warlock
    .goto 1453/0,1041.47,-8983.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gakin the Darkbinder|r
    .turnin 1685 >>Turn in Gakin's Summons while you are here
    .isQuestComplete 1685
    .target Gakin the Darkbinder
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Woo Ping|r
    .target Woo Ping
    .goto 1453/0,613.0,-8796.03
    .trainer >>Train Staves
step
    .goto 1453/0,1266.48,-8541.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gilbert Gray|r
    .accept 95065 >>Accept Fishin' Time
    .target Gilbert Gray
step
    .goto 1453/0,625.51,-8857.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Morgan Pestle|r
    .turnin 61 >>Turn in Shipment to Stormwind while you are here
    .isQuestComplete 61
    .target Morgan Pestle
step << Human Priest
    .xp 10 >>Grind to level 10 (Divine Grace needs it)
step << Dwarf Priest
    .xp 10 >>Grind to level 10 (Desperate Prayer needs it)
step
    .goto 1453/0,862.33,-8512.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess Laurena|r
    .accept 94773 >>Accept Divine Grace << Human Priest
    .accept 5634 >>Accept Desperate Prayer << Dwarf Priest
    .target High Priestess Laurena
step << Dwarf Priest
    .goto 1453/0,862.33,-8512.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess Laurena|r
    >>|cRXP_WARN_The database has no objectives for Desperate Prayer. Skip this step if the quest is not finished|r
    .turnin 5634 >>Turn in Desperate Prayer
    .target High Priestess Laurena
    .isOnQuest 5634
step << Priest
    .goto 1453/0,862.89,-8519.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess Laurena|r
    .train 8092 >> Train your class spells
    .target High Priestess Laurena
    .train 13908,1
step << Priest
    .goto 1453/0,862.89,-8519.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess Laurena|r
    .trainer >> Train your class spells
    .target High Priestess Laurena
    .train 13908,3
step << Warrior/Paladin/Rogue
    .goto 1453/0,624.15,-8431.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kaita Deepforge|r
    .collect 2901,1,432,1 >>|cRXP_BUY_Buy a|r |T134708:0|t[Mining Pick] |cRXP_BUY_from her|r
    >>|cRXP_WARN_You'll train|r |T134708:0|t[Mining] |cRXP_WARN_later|r
    .target Kaita Deepforge
    .train 2018,3
step
    .goto 1453/0,490.03,-8835.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dungar Longdrink|r
    .fp Stormwind >> Get the Stormwind City flight path
    .target Dungar Longdrink
step << Human Paladin
    .goto 1453/0,845.83,-8545.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duthorian Rall|r
    .turnin 3681 >>Turn in Tome of Divinity
    .target Duthorian Rall
    .isOnQuest 3681
step
    .goto 1453/0,598.23,-8821.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy |cRXP_LOOT_Nightcrawlers|r from |cRXP_FRIENDLY_Edna Mullby|r
    .complete 95065,1 --Nightcrawlers (3)
    .target Edna Mullby
step
    .goto 1453/0,625.51,-8857.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Morgan Pestle|r
    .turnin 61 >>Turn in Shipment to Stormwind
    .target Morgan Pestle
    .isOnQuest 61
step
    .goto 1453/0,613.0,-8796.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Woo Ping|r
    .trainer >>Train 1h Swords and Staves << Warlock/Mage
    .trainer >>Train 1h Swords << Rogue
    .trainer >>Train Staves << Priest
    .trainer >>Train 2h Swords << Warrior/Paladin
    .target Woo Ping
    .money <0.2 << Warlock/Mage
    .money <0.3 << Warrior
    .money <0.55 << Rogue
step << Warlock/Mage
    .goto 1453/0,613.0,-8796.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Woo Ping|r
    .trainer >>Train Staves
    .target Woo Ping
step << Hunter
    .goto 1453/0,702.700,-8791.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lina Stover|r
    .vendor >>|cRXP_BUY_Buy 6 stacks of|r |T132382:0|t[Sharp Arrows] |cRXP_BUY_and destroy any remaining|r |T132382:0|t[Rough Arrows]
    .target Lina Stover
step << Warlock
    .goto 1453/0,1029.98,-8971.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ursula Deline|r
    .train 705 >> Train your class spells
    .target Ursula Deline
    .xp <12,1
    .xp >14,1
step << Warlock
    .goto 1453/0,1029.98,-8971.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ursula Deline|r
    .train 689 >> Train your class spells
    .target Ursula Deline
    .xp <14,1
step
    .goto 1453/0,635.44,-8863.81
    >>Talk to |cRXP_FRIENDLY_Keldric|r
    .vendor 1257 >> |cRXP_BUY_Buy|r |T134830:0|t[Lesser Healing Potions] |cRXP_BUY_from him (if they're up)|r
    .target Keldric Boucher
step << skip
    .goto 1453/0,861.95,-8990.47
    >>Talk to |cRXP_FRIENDLY_Jennea|r
    .trainer >> Train your class spells (Frost Armor r2, Frost Nova, Polymorph, Conjure Water r1 & r2)
    >>Total Cost: 15s
    >>Remember you may want money for Healing Potions (3s each), Bronze Tube (8s each), and level 5 food (20c per 5)
    .target Jennea Cannon
step
    .goto 1453/0,1266.48,-8541.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gilbert Gray|r
    .turnin 95065 >>Turn in Fishin' Time
    .target Gilbert Gray
step << Rogue
    .goto 1453/0,362.28,-8815.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Mathias Shaw|r
    .turnin 2205 >>Turn in Seek out SI: 7
    .accept 2206 >>Accept Snatch and Grab
    .target Master Mathias Shaw
step << Human Mage/Gnome Mage/Skyborne Mage
    .xp 10 >>Grind to level 10 (Mirror Lake needs it)
step << Human Mage/Gnome Mage/Skyborne Mage
    .goto 1453/0,861.81,-8989.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jennea Cannon|r
    .accept 1861 >>Accept Mirror Lake
    .target Jennea Cannon
step
    #completewith next
    .zone 1429 >>Leave Stormwind City for Elwynn Forest
    .zoneskip 1429
step << Human Mage/Gnome Mage/Skyborne Mage
    .goto 1429/0,543.80,-9360.51
    >>Open the |cRXP_PICK_Mirror Lake Waterwall|r. Loot it for |cRXP_LOOT_Mirror Lake Water Sample|r
    .complete 1861,1 --Mirror Lake Water Sample (1)
step
    #completewith next
    .zone 1453 >>Travel to Stormwind City
    .zoneskip 1453
step << Human Mage/Gnome Mage/Skyborne Mage
    .goto 1453/0,861.81,-8989.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jennea Cannon|r
    .turnin 1861 >>Turn in Mirror Lake
    .target Jennea Cannon
step << Warlock
    .goto 1453/0,1041.47,-8983.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gakin the Darkbinder|r
    .turnin 1685 >>Turn in Gakin's Summons
    .accept 1688 >>Accept Surena Caledon
    .target Gakin the Darkbinder
step << !Hunter
    .goto 1453/0,613.0,-8796.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Woo Ping|r
    .trainer >>Train 1h Swords << Rogue/Mage
    .trainer >>Train Staves << Priest/Hunter
    .trainer >>Train 1h Swords and Staves << Warlock
    .trainer >>Train 2h Swords << Warrior/Paladin
    .target Woo Ping
step
    .goto 1453/0,552.71,-8415.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Einris Brightspear|r
    .accept 6076 >>Accept The Hunter's Path << Dwarf Hunter
    .accept 6073 >>Accept The Hunter's Path << NightElf Hunter
    .target Einris Brightspear
step
    #completewith next
    .zone 1429 >>Leave Stormwind City for Elwynn Forest
    .zoneskip 1429
step
    .goto 1429/0,73.85,-9465.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Dughan|r
    .turnin 176 >>Turn in Wanted:  "Hogger"
    .target Marshal Dughan
step
    .goto 1429/0,73.85,-9465.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Dughan|r
    .turnin 123 >>Turn in The Collector
    .target Marshal Dughan
    .isOnQuest 123
step << Rogue
    .goto 1429/0,-132.67,-9952.34
    >>Kill |cRXP_ENEMY_Defias Dockmaster|r and loot |cRXP_LOOT_Defias Shipping Schedule|r
    .complete 2206,1 --Defias Shipping Schedule (1)
    .mob Defias Dockmaster
step
    .goto 1429/0,33.24,-9460.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Josetta|r
    .accept 94774 >>Accept Divine Grace << Human Priest
    .accept 5628 >>Accept Returning Home << NightElf Priest
    .target Priestess Josetta
step
    .goto 1429/0,-658.15,-9619.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Blixie Fitzwink|r
    .accept 91725 >>Accept Stolen Enchanting Supplies
    .target Blixie Fitzwink
step
    .goto 1429/0,-724.10,-9556.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hamish Bergwort|r
    .turnin 91724 >>Turn in Delicate Instruments
    .target Hamish Bergwort
    .isOnQuest 91724
step
    .goto 1429/0,-1031.96,-9610.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Guard Thomas|r
    .accept 46 >>Accept Bounty on Murlocs
    .target Guard Thomas
    .isQuestTurnedIn 39 --any of: Deliver Thomas' Report
step << Warlock
    .goto 1429/0,-929.22,-9809.07
    >>Kill |cRXP_ENEMY_Surena Caledon|r and loot |cRXP_LOOT_Surena's Choker|r
    .complete 1688,1 --Surena's Choker (1)
    .mob Surena Caledon
step
    .goto 1429/0,-1222.51,-9531.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sara Timberlain|r
    .turnin 59 >>Turn in Cloth and Leather Armor
    .target Sara Timberlain
    .isOnQuest 59
step << Warlock
    .goto 1453/0,1029.89,-8971.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ursula Deline|r
    .trainer >> Train your class spells
    .target Ursula Deline
    .xp <12,1
step << Warlock
    .goto 1453/0,1041.47,-8983.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gakin the Darkbinder|r
    .turnin 1688 >>Turn in Surena Caledon while you are here
    .isQuestComplete 1688
    .target Gakin the Darkbinder
step
    #completewith Drop91740x1
    >>|cRXP_LOOT_Croaky's Head|r can drop from |cRXP_ENEMY_Croaky|r. Use it to start the quest if you get one
    .collect 247826,1,91740 --Croaky's Head (1)
    .accept 91740 >>Accept Croaky's Head
    .use 247826
step
    #label Drop91740x1
    #loop
    .goto 1429/0,-1189.88,-9332.96,0
    .goto 1429/0,-1189.88,-9332.96,40,0
    .goto 1429/0,-1121.85,-9304.03,40,0
    .goto 1429/0,-1165.24,-9282.97,40,0
    .goto 1429/0,-1161.42,-9255.89,40,0
    .goto 1429/0,-1199.60,-9229.50,40,0
    .goto 1429/0,-1229.45,-9212.14,40,0
    .goto 1429/0,-1255.83,-9173.49,40,0
    .goto 1429/0,-1232.92,-9254.73,40,0
    .goto 1429/0,-1220.08,-9283.20,40,0
    >>Kill |cRXP_ENEMY_Murloc Foragers|r, |cRXP_ENEMY_Murloc Lurkers|r, |cRXP_ENEMY_Croakies|r and |cRXP_ENEMY_Elder Finseers|r. Loot them for |cRXP_LOOT_Torn Murloc Fin|r
    .complete 46,1 --Torn Murloc Fin (8)
    .mob Murloc Forager
    .mob Murloc Lurker
    .mob Croaky
    .mob Elder Finseer
    .isOnQuest 46
step
    #loop
    .goto 1429/0,-842.10,-8997.35,0
    .goto 1429/0,-842.10,-8997.35,40,0
    .goto 1429/0,-807.40,-8927.91,40,0
    .goto 1429/0,-769.22,-8909.39,40,0
    .goto 1429/0,-720.62,-8890.88,40,0
    .goto 1429/0,-706.74,-8874.67,40,0
    .goto 1429/0,-772.69,-8837.64,40,0
    .goto 1429/0,-817.81,-8846.90,40,0
    .goto 1429/0,-876.81,-8826.07,40,0
    .goto 1429/0,-828.22,-8897.82,40,0
    >>Pick up |cRXP_PICK_Stolen Enchanting Supplies|r from the ground
    .complete 91725,1 --Stolen Enchanting Supplies (5)
step
    .goto 1429/0,-658.15,-9619.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Blixie Fitzwink|r
    .turnin 91725 >>Turn in Stolen Enchanting Supplies
    .target Blixie Fitzwink
step
    .goto 1429/0,-1031.96,-9610.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Guard Thomas|r
    .turnin 46 >>Turn in Bounty on Murlocs
    .target Guard Thomas
    .isOnQuest 46
step
    #completewith next
    .zone 1453 >>Travel to Stormwind City
    .zoneskip 1453
step << Warrior
    .goto 1453/0,382.78,-8612.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Harry Burlguard|r
    .turnin 1638 >>Turn in A Warrior's Training
    .target Harry Burlguard
step << Rogue
    .goto 1453/0,362.28,-8815.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Mathias Shaw|r
    .turnin 2206 >>Turn in Snatch and Grab
    .target Master Mathias Shaw
step << Warlock
    .goto 1453/0,1041.47,-8983.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gakin the Darkbinder|r
    .turnin 1688 >>Turn in Surena Caledon
    .accept 1689 >>Accept The Binding
    .target Gakin the Darkbinder
step << Warlock
    .goto 1453/0,1041.47,-8983.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gakin the Darkbinder|r
    .turnin 1689 >>Turn in The Binding
    .target Gakin the Darkbinder
    .isQuestComplete 1689
step << Rogue
    .goto 1453/0,377.47,-8752.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Osborne the Night Man|r
    >>|cRXP_WARN_Only train|r |T132147:0|t[Dual Wield] |cRXP_WARN_and|r |T132307:0|t[Sprint]
    .train 674 >> Train |T132147:0|t[Dual Wield]
    .train 2983 >> Train |T132307:0|t[Sprint]
    .target Osborne the Night Man
step << Rogue
    .goto 1453/0,377.47,-8752.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Osborne the Night Man|r
    .train 674 >> Train |T132147:0|t[Dual Wield]
    .train 2983 >> Train |T132307:0|t[Sprint]
    .target Osborne the Night Man
    .xp <10,1
    .xp >12,1
step << Rogue
    .goto 1453/0,377.47,-8752.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Osborne the Night Man|r
    .train 1766 >> Train your class spells
    .target Osborne the Night Man
    .xp <12,1
    .xp >14,1
step << Rogue
    .goto 1453/0,377.47,-8752.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Osborne the Night Man|r
    .trainer >> Train your class spells
    .target Osborne the Night Man
    .xp <14,1
step << Human Priest
    .goto 1453/0,862.33,-8512.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess Laurena|r
    .turnin 94774 >>Turn in Divine Grace
    .target High Priestess Laurena
step << Human Priest
    .goto 1453/0,862.33,-8512.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess Laurena|r
    >>|cRXP_WARN_The database has no objectives for Divine Grace. Skip this step if the quest is not finished|r
    .turnin 94773 >>Turn in Divine Grace
    .target High Priestess Laurena
    .isOnQuest 94773
step << Human
    .goto 1453/0,382.09,-8702.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Osric Strang|r
    .turnin 6281 >>Turn in Continue to Stormwind
    .target Osric Strang
    .isOnQuest 6281
step << Human
    .goto 1453/0,382.09,-8702.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Osric Strang|r
    .accept 6261 >>Accept Dungar Longdrink
    .target Osric Strang
    .isQuestTurnedIn 6281 --any of: Continue to Stormwind
    .xp <10,1
step << Warlock/Mage/Rogue/Priest/Warrior/Paladin
    .goto 1453/0,613.0,-8796.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Woo Ping|r
    .trainer >>Train 1h Swords and Staves << Warlock/Mage
    .trainer >>Train 1h Swords << Rogue
    .trainer >>Train Staves << Priest
    .trainer >>Train 2h Swords << Warrior/Paladin
    .target Woo Ping
step << Human
    .goto 1453/0,490.16,-8835.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dungar Longdrink|r
    .turnin 6261 >>Turn in Dungar Longdrink
    .target Dungar Longdrink
    .isOnQuest 6261
step << Warlock
    .goto 1453/0,1035.96,-8974.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spackle Thornberry|r
    .vendor >> |cRXP_BUY_Buy|r |T133738:0|t[Grimoire of Consume Shadows (Rank 1)] |cRXP_BUY_and|r |T133738:0|t[Grimoire of Sacrifice (Rank 1)] |cRXP_BUY_if you can afford them. If not you can buy them later|r
    .target Spackle Thornberry
step << Mage
    .goto 1453/0,885.34,-9006.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elsharin|r
    .trainer >> Train your class spells
    .target Elsharin
step << Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Arthur the Faithful|r
    .goto 1453/0,859.13,-8559.14,10,0
    .goto 1453/0,861.14,-8573.03
    .trainer >> Train your class spells
    .target Arthur the Faithful
step << Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Joshua|r
    .goto 1453/0,862.89,-8519.61
    .trainer >> Train your class spells
    .target Brother Joshua
step << Hunter
    .goto 1453/0,552.78,-8415.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Einris Brightspear|r
    .trainer >> Train your class spells
    .target Einris Brightspear
step << Hunter
    .goto 1453/0,553.22,-8422.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Karrina Mekenda|r
    .trainer >> Train your pet spells
    .target Karrina Mekenda
step << Rogue
    .goto 1453/0,377.47,-8752.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Osborne|r
    .trainer >> Train your class spells
    .target Osborne the Night Man
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wu|r or |cRXP_FRIENDLY_Ilsa|r
    .goto 1453/0,358.25,-8728.28,15,0
    .goto 1453/0,302.6,-8685.53,15,0
    .goto 1453/0,323.3,-8689.29
    .trainer >> Train your class spells
    .target Wu Shen
    .target Ilsa Corbin
step << Human
    .goto 1453/0,490.16,-8835.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dungar Longdrink|r
    .accept 6285 >>Accept Return to Lewis
    .target Dungar Longdrink
    .isQuestTurnedIn 6261 --any of: Dungar Longdrink
    .xp <10,1
step << Warrior
    .goto 1453/0,389.21,-8604.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bartleby|r
    .accept 1640 >>Accept Beat Bartleby
    .target Bartleby
    .isQuestTurnedIn 1639,1678,1683 --any of: Bartleby the Drunk, Vejrek, Vorlus Vilehoof
    .xp <10,1
step << Warrior
    .goto 1453/0,389.21,-8604.54
    >>Kill |cRXP_ENEMY_Bartleby|r
    .complete 1640,1 --Bartleby slain (1)
    .mob Bartleby
    .isOnQuest 1640
step << Warrior
    .goto 1453/0,389.21,-8604.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bartleby|r
    .turnin 1640 >>Turn in Beat Bartleby
    .target Bartleby
    .isOnQuest 1640
step << Warrior
    .goto 1453/0,389.21,-8604.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bartleby|r
    .accept 1665 >>Accept Bartleby's Mug
    .target Bartleby
    .isQuestTurnedIn 1640 --any of: Beat Bartleby
    .xp <10,1
step << Warrior
    .goto 1453/0,382.78,-8612.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Harry Burlguard|r
    .turnin 1665 >>Turn in Bartleby's Mug
    .target Harry Burlguard
    .isOnQuest 1665
step << Priest
    .goto 1453/0,862.89,-8519.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess Laurena|r
    .train 8092 >> Train your class spells
    .target High Priestess Laurena
    .isOnQuest 5635
step << Warrior
    .goto 1453/0,382.78,-8612.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Harry Burlguard|r
    .accept 1666 >>Accept Marshal Haggard
    .target Harry Burlguard
    .isQuestTurnedIn 1665 --any of: Bartleby's Mug
    .xp <10,1
step
    #completewith next
    .zone 1429 >>Leave Stormwind City for Elwynn Forest
    .zoneskip 1429
step
    #completewith next
    .hs >>Hearth to Innkeeper Farley's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1429/0,73.85,-9465.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Dughan|r
    .accept 147 >>Accept Manhunt
    .target Marshal Dughan
    .isQuestTurnedIn 123 --any of: The Collector
    .xp <7,1
step
    .goto 1429/0,-932.00,-9806.29
    >>Kill |cRXP_ENEMY_Morgan the Collector|r and loot |cRXP_LOOT_The Collector's Ring|r
    .complete 147,1 --The Collector's Ring (1)
    .mob Morgan the Collector
    .isOnQuest 147
step << Warlock
    .goto 1453/0,1029.89,-8971.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ursula Deline|r
    .trainer >> Train your class spells
    .target Ursula Deline
step << Warrior
    .goto 1429/0,-1401.26,-9545.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Haggard|r
    .turnin 1666 >>Turn in Marshal Haggard
    .target Marshal Haggard
    .isOnQuest 1666
step << Warrior
    .goto 1429/0,-1401.26,-9545.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Haggard|r
    .accept 1667 >>Accept Dead-tooth Jack
    .target Marshal Haggard
    .isQuestTurnedIn 1666 --any of: Marshal Haggard
    .xp <10,1
step << Warrior
    .goto 1429/0,-1566.12,-9768.80
    >>Kill |cRXP_ENEMY_Dead-Tooth Jack|r and loot |cRXP_LOOT_Dead-tooth's Key|r
    .collect 6783,1,1667,1 --Dead-tooth's Key (1)
    .mob Dead-Tooth Jack
    .isOnQuest 1667
step << Warrior
    .goto 1429/0,-1565.08,-9765.33
    >>Open the |cRXP_PICK_Dead-tooth's Strongbox|r. Loot it for |cRXP_LOOT_Marshal Haggard's Badge|r
    .complete 1667,1 --Marshal Haggard's Badge (1)
    .isOnQuest 1667
step << Warrior
    .goto 1429/0,-1401.26,-9545.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Haggard|r
    .turnin 1667 >>Turn in Dead-tooth Jack
    .target Marshal Haggard
    .isOnQuest 1667
step
    .goto 1429/0,73.85,-9465.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Dughan|r
    .turnin 147 >>Turn in Manhunt
    .target Marshal Dughan
    .isOnQuest 147
step << Hunter
    .goto 1429/0,107.200,-9472.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Josephine Carson|r
    .trainer >> Train your class spells
    .target Josephine Carson
    .xp <12,1
step << Warrior
    .goto 1429/0,109.36,-9461.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lyria Du Lac|r
    .trainer >> Train your class spells
    .target Lyria Du Lac
    .xp <12,1
step << Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zaldimar Wefhellt|r
    .target Zaldimar Wefhellt
    .goto 1429/0,34.28,-9471.61
    .trainer >> Train your class spells
    .xp <12,1
step << Priest
    .goto 1429/0,33.14,-9460.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Josetta|r
    .target Priestess Josetta
    .trainer >> Train your class spells
    .xp <12,1
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Keryn Sylvius|r
    .target Keryn Sylvius
    .goto 1429/0,12.69,-9465.75
    .trainer >> Train your class spells
    .xp <12,1
step
    +|cRXP_WARN_That is all of Elwynn Forest for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Darnassus|r: Returning Home << NightElf Priest
    >>|cRXP_FRIENDLY_Darnassus|r: Heeding the Call << NightElf Druid
    >>|cRXP_FRIENDLY_Dun Morogh|r: The Hunter's Path << Dwarf Hunter
    >>|cRXP_FRIENDLY_Moonglade|r: Moonglade << Skyborne Druid
    >>|cRXP_FRIENDLY_Teldrassil|r: The Hunter's Path << NightElf Hunter
    >>|cRXP_FRIENDLY_Westfall|r: Furlbrow's Deed, Report to Gryan Stoutmantle
    >>|cRXP_FRIENDLY_Westfall|r: Return to Lewis << Human
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: The Binding << Warlock
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: An Apple Treat
step << Human Paladin/Dwarf Paladin
    +|cRXP_WARN_Until level 14, suggested zones|r: |cRXP_FRIENDLY_Darkshore|r (about 2.2 levels of quests, starting around Thundris Windweaver), |cRXP_FRIENDLY_Westfall|r (about 1.8 levels of quests, starting around Farmer Saldean; 1 quest from here hands in there), |cRXP_FRIENDLY_Zephras Isle|r (about 1.6 levels of quests, starting around Elegael Thornpaw). Then come back to this Elwynn Forest guide --RouteBuilder:next
step << Human Paladin/Dwarf Paladin
    .xp 14 >>|cRXP_WARN_The rest of Elwynn Forest is planned from level 14.|r Come back to this guide then
step
    #label RBSection2_1
    #completewith next
    +|cRXP_WARN_Elwynn Forest: part 2|r (planned from level 14)
step << Human Paladin
    .goto 1429/0,108.90,-9468.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Wilhelm|r
    .accept 2998 >>Accept Tome of Divinity
    .target Brother Wilhelm
step
    #completewith next
    .zone 1453 >>Travel to Stormwind City
    .zoneskip 1453
step << Human Paladin
    .goto 1453/0,845.83,-8545.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duthorian Rall|r
    .accept 1643 >>Accept The Tome of Divinity
    .target Duthorian Rall
    .isQuestTurnedIn 1642 --any of: The Tome of Divinity
    .xp <12,1
step << Human Paladin
    .goto 1453/0,845.83,-8545.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duthorian Rall|r
    .turnin 2998 >>Turn in Tome of Divinity
    .target Duthorian Rall
step << Dwarf Paladin
    .goto 1453/0,881.45,-8577.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lord Grayson Shadowbreaker|r
    .accept 3000 >>Accept Tome of Divinity
    .target Lord Grayson Shadowbreaker
step << Human Paladin
    .goto 1453/0,613.70,-8832.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Stephanie Turner|r
    .turnin 1643 >>Turn in The Tome of Divinity
    .target Stephanie Turner
    .isOnQuest 1643
step
    #completewith next
    .zone 1429 >>Leave Stormwind City for Elwynn Forest
    .zoneskip 1429
step
    .goto 1429/0,699.64,-9633.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sergeant De Vries|r
    .turnin 91738 >>Turn in An Apple Treat
    .target Sergeant De Vries
    .isQuestComplete 91738
step
    #completewith next
    .zone 1453 >>Travel to Stormwind City
    .zoneskip 1453
step
    .goto 1453/0,861.81,-8989.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jennea Cannon|r
    .turnin 84402 >>Turn in Necromancy 101
    .target Jennea Cannon
    .isOnQuest 84402
step
    .goto 1453/0,861.81,-8989.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jennea Cannon|r
    .turnin 84399 >>Turn in Ka-Boom!
    .target Jennea Cannon
    .isOnQuest 84399
step
    .goto 1453/0,861.81,-8989.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jennea Cannon|r
    .turnin 84398 >>Turn in A Study of the Light
    .target Jennea Cannon
    .isOnQuest 84398
step
    .goto 1453/0,861.81,-8989.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jennea Cannon|r
    .turnin 84397 >>Turn in Northern Kalimdor - A Comprehensive Guide
    .target Jennea Cannon
    .isOnQuest 84397
step << Warlock
    .goto 1453/0,1041.47,-8983.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gakin the Darkbinder|r
    .turnin 1689 >>Turn in The Binding
    .target Gakin the Darkbinder
    .isQuestComplete 1689
step << Human Priest
    .goto 1453/0,862.33,-8512.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess Laurena|r
    .turnin 94773 >>Turn in Divine Grace
    .target High Priestess Laurena
    .isOnQuest 94773
step << Dwarf Priest
    .goto 1453/0,862.33,-8512.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess Laurena|r
    .turnin 5634 >>Turn in Desperate Prayer
    .target High Priestess Laurena
    .isOnQuest 5634
step
    +|cRXP_WARN_End of the Elwynn Forest route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Ironforge|r: Tome of Divinity << Dwarf Paladin
step
    +|cRXP_WARN_Suggested next zones at level 14|r: |cRXP_FRIENDLY_Darkshore|r (about 2.0 levels of quests, starting around Thundris Windweaver; 2 quests from here hand in there), |cRXP_FRIENDLY_Zephras Isle|r (about 1.1 levels of quests, starting around Elegael Thornpaw), |cRXP_FRIENDLY_Loch Modan|r (about 0.9 levels of quests, starting around Daryl the Youngling). Completing this step loads the guide for Darkshore --RouteBuilder:next
]])
