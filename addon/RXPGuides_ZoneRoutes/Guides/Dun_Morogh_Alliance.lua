-- 1-30 Dun Morogh: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 8 parts (from level 1, 13, 16, 19, 22, 25, 28, 31).
-- Split into 12 guides, listed under "1 - 32 Dun Morogh" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Dun Morogh.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 1 - 32 Dun Morogh
#subweight -1
#name 1-3 Dun Morogh: around Sten Stoutarm
#next Zone Routes (Alliance)\3-5 Dun Morogh: around Grelin Whitebeard

step
    .goto 1426/0,328.03,-6214.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sten Stoutarm|r
    .accept 179 >>Accept Dwarven Outfitters
    .target Sten Stoutarm
step << Warrior/Warlock/Shaman
    #completewith next
    .goto 1426,28.533,72.587,50,0
    .goto 1426,28.239,71.707,50,0
    +|cRXP_WARN_Kill and loot |cRXP_ENEMY_Ragged Young Wolves|r until you have 10 copper or more of vendor trash, then sell it to train|r
    >>|cRXP_WARN_Unequip your|r |T132665:0|t[Acolyte's Robe]|cRXP_WARN_,|r |T135005:0|t[Acolyte's Shirt]|cRXP_WARN_,|r |T134581:0|t[Acolyte's Pants]|cRXP_WARN_, and|r |T132535:0|t[Acolyte's Shoes] |cRXP_WARN_so you can vendor them for 4 copper|r << Warlock
    >>|cRXP_WARN_Unequip your|r |T135009:0|t[Recruit's Shirt]|cRXP_WARN_,|r |T134582:0|t[Recruit's Pants]|cRXP_WARN_, and|r |T132540:0|t[Recruit's Boots] |cRXP_WARN_so you can vendor them for 3 copper|r << Warrior
    .mob Ragged Young Wolf
    .money >0.001
step << Warrior/Warlock/Shaman
    .goto 1426,28.792,67.837
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grundel Harkin|r inside
    .vendor >> Vendor Trash
    .target Grundel Harkin
    .train 6673,1 << Warrior
    .train 348,1 << Warlock
    .train 8017,1 << Shaman
step << Warrior
    .goto 1426,28.831,67.238
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thran Khorman|r inside
    .train 6673 >>Train |T132333:0|t[Battle Shout]
    .target Thran Khorman
step << Warlock
    .goto 1426/0,391.07,-6048.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alamar Grimm|r
    .accept 1599 >>Accept Beginnings
    .target Alamar Grimm
step << Warlock
    .goto 1426/0,391.07,-6048.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alamar Grimm|r inside
    .train 348 >> Train |T135817:0|t[Immolate]
    .target Alamar Grimm
step << Shaman
    .goto 1426/0,383.900,-6050.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Teo Hammerstorm|r inside
    .train 8017 >> Train |T136086:0|t[Rockbiter Weapon]
    .target Teo Hammerstorm
step
    #loop
    .goto 1426/0,395.50,-6246.01,0
    .goto 1426/0,395.50,-6246.01,40,0
    .goto 1426/0,455.10,-6211.53,40,0
    .goto 1426/0,519.12,-6148.82,40,0
    .goto 1426/0,523.06,-6204.97,40,0
    .goto 1426/0,402.89,-6318.24,40,0
    .goto 1426/0,478.24,-6379.64,40,0
    .goto 1426/0,362.51,-6437.43,40,0
    .goto 1426/0,335.91,-6369.46,40,0
    .goto 1426/0,257.11,-6302.48,40,0
    >>Kill |cRXP_ENEMY_Ragged Timber Wolfs|r and |cRXP_ENEMY_Ragged Young Wolfs|r. Loot them for |cRXP_LOOT_Tough Wolf Meat|r
    .complete 179,1 --Tough Wolf Meat (8)
    .mob Ragged Timber Wolf
    .mob Ragged Young Wolf
step
    .goto 1426,29.529,73.286,0
    .goto 1426,28.117,75.088,0
    .goto 1426,28.557,72.487,0
    .goto 1426,29.529,73.286,60,0
    .goto 1426,29.054,74.608,60,0
    .goto 1426,28.558,75.781,60,0
    .goto 1426,28.117,75.088,60,0
    .goto 1426,27.562,74.331,60,0
    .goto 1426,27.793,73.123,60,0
    .goto 1426,28.557,72.487,60,0
    .xp 2 >> Grind to level 2
step
    .goto 1426/0,328.03,-6214.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sten Stoutarm|r
    .turnin 179 >>Turn in Dwarven Outfitters
    .accept 233 >>Accept Coldridge Valley Mail Delivery
    .target Sten Stoutarm
step
    .goto 1426/0,338.87,-6216.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Balir Frosthammer|r
    .accept 170 >>Accept A New Threat
    .target Balir Frosthammer
step
    #loop
    .goto 1426/0,244.31,-6296.57,0
    .goto 1426/0,244.31,-6296.57,40,0
    .goto 1426/0,301.44,-6336.63,40,0
    .goto 1426/0,361.52,-6339.58,40,0
    .goto 1426/0,438.35,-6389.16,40,0
    .goto 1426/0,335.42,-6426.92,40,0
    .goto 1426/0,242.34,-6424.62,40,0
    .goto 1426/0,263.02,-6371.43,40,0
    .goto 1426/0,213.77,-6367.82,40,0
    .goto 1426/0,160.09,-6353.70,40,0
    >>Kill |cRXP_ENEMY_Rockjaw Troggs|r
    >>Kill |cRXP_ENEMY_Burly Rockjaw Troggs|r
    .complete 170,1 --Rockjaw Trogg slain (6)
    .complete 170,2 --Burly Rockjaw Trogg slain (6)
    .mob Rockjaw Trogg
    .mob Burly Rockjaw Trogg
step
    .goto 1426/0,338.87,-6216.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Balir Frosthammer|r
    .turnin 170 >>Turn in A New Threat
    .target Balir Frosthammer
step << Gnome Mage
    .goto 1426/0,324.58,-6224.67
    .vendor >>Vendor, buy 10 water
    .collect 159,10
step << Gnome Warlock
    .goto 1426/0,328.03,-6214.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sten Stoutarm|r
    .accept 3115 >>Accept Tainted Memorandum
    .target Sten Stoutarm
step << Warlock
    #loop
    .goto 1426/0,300.94,-6488.65,0
    .goto 1426/0,300.94,-6488.65,40,0
    .goto 1426/0,313.26,-6512.61,40,0
    .goto 1426/0,355.12,-6538.55,40,0
    .goto 1426/0,371.37,-6542.16,40,0
    .goto 1426/0,374.33,-6588.13,40,0
    .goto 1426/0,389.10,-6606.85,40,0
    .goto 1426/0,319.66,-6581.89,40,0
    .goto 1426/0,304.39,-6532.31,40,0
    >>Kill |cRXP_ENEMY_Frostmane Novices|r. Loot them for |cRXP_LOOT_Feather Charm|r
    .complete 1599,1 --Feather Charm (3)
    .mob Frostmane Novice
step << Warlock
    .hs >> Hearth to Coldridge Valley
    .subzoneskip 77,1
step << Warlock
    .goto 1426/0,391.07,-6048.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alamar Grimm|r
    .turnin 1599 >>Turn in Beginnings
    .target Alamar Grimm
step << Gnome Warlock
    .goto 1426/0,391.07,-6048.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alamar Grimm|r
    .turnin 3115 >>Turn in Tainted Memorandum while you are here
    .isQuestComplete 3115
    .target Alamar Grimm
step
    .goto 1426/0,396.00,-6097.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Felix Whindlebolt|r
    .accept 3361 >>Accept A Refugee's Quandary
    .target Felix Whindlebolt
    .xp <3,1
step
    .goto 1426/0,328.03,-6214.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sten Stoutarm|r
    .accept 3106 >>Accept Simple Rune << Dwarf Warrior
    .accept 3107 >>Accept Consecrated Rune << Dwarf Paladin
    .accept 3108 >>Accept Etched Rune << Dwarf Hunter
    .accept 3109 >>Accept Encrypted Rune << Dwarf Rogue
    .accept 3110 >>Accept Hallowed Rune << Dwarf Priest
    .accept 98581 >>Accept Archaic Rune << Dwarf Shaman
    .accept 3112 >>Accept Simple Memorandum << Gnome Warrior
    .accept 3113 >>Accept Encrypted Memorandum << Gnome Rogue
    .accept 98574 >>Accept Hallowed Memorandum << Gnome Priest
    .accept 3114 >>Accept Glyphic Memorandum << Gnome Mage
    .target Sten Stoutarm
step
    .goto 1426/0,689.03,-6222.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Talin Keeneye|r
    .turnin 233 >>Turn in Coldridge Valley Mail Delivery
    .accept 183 >>Accept The Boar Hunter
    .accept 234 >>Accept Coldridge Valley Mail Delivery
    .target Talin Keeneye
step
    #loop
    .goto 1426/0,618.61,-6257.50,0
    .goto 1426/0,618.61,-6257.50,40,0
    .goto 1426/0,550.64,-6182.97,40,0
    .goto 1426/0,512.72,-6214.49,40,0
    .goto 1426/0,412.74,-6275.23,40,0
    .goto 1426/0,451.16,-6228.61,40,0
    .goto 1426/0,492.53,-6128.46,40,0
    .goto 1426/0,546.21,-6121.90,40,0
    .goto 1426/0,589.55,-6147.84,40,0
    .goto 1426/0,640.77,-6127.81,40,0
    >>Kill |cRXP_ENEMY_Small Crag Boars|r
    .complete 183,1 --Small Crag Boar slain (12)
    .mob Small Crag Boar
step
    .goto 1426/0,689.03,-6222.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Talin Keeneye|r
    .turnin 183 >>Turn in The Boar Hunter
    .target Talin Keeneye
step << Paladin/Warlock/Shaman
    .goto 1426,23.595,72.462,0
    .goto 1426,26.117,74.469,0
    .goto 1426,26.832,74.649,0
    .goto 1426,26.884,72.733,0
    .goto 1426,23.595,72.462,50,0
    .goto 1426,24.290,73.406,50,0
    .goto 1426,24.642,74.138,50,0
    .goto 1426,26.117,74.469,50,0
    .goto 1426,26.832,74.649,50,0
    .goto 1426,26.884,72.733,50,0
    .xp 3+1130 >> Grind to 1130+/1400xp
step
    .goto 1426/0,566.89,-6362.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grelin Whitebeard|r
    .turnin 234 >>Turn in Coldridge Valley Mail Delivery
    .accept 182 >>Accept The Troll Cave
    .target Grelin Whitebeard
step << Hunter
    .goto 1426,25.861,78.197,0
    .goto 1426,23.716,80.257,0
    .goto 1426,20.671,75.838,0
    .xp 4 >> Grind to level 4
step
    .goto 1426/0,571.82,-6371.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nori Pridedrift|r
    .accept 3364 >>Accept Scalding Mornbrew Delivery
    .target Nori Pridedrift
step << Gnome Mage
    .goto 1426/0,390.58,-6101.21
    >>Talk to |cRXP_FRIENDLY_Rybrad Coldbank|r
    .vendor >> Vendor Trash
    .target Rybrad Coldbank
    .isOnQuest 218,3364
step << Dwarf Paladin
    .goto 1426/0,382.21,-6120.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bromos Grummner|r
    .turnin 3107 >>Turn in Consecrated Rune while you are here
    .isQuestComplete 3107
    .target Bromos Grummner
step << Dwarf Rogue
    .goto 1426/0,404.86,-6093.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Solm Hargrin|r
    .turnin 3109 >>Turn in Encrypted Rune while you are here
    .isQuestComplete 3109
    .target Solm Hargrin
step << Gnome Rogue
    .goto 1426/0,404.86,-6093.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Solm Hargrin|r
    .turnin 3113 >>Turn in Encrypted Memorandum while you are here
    .isQuestComplete 3113
    .target Solm Hargrin
step << Dwarf Warrior
    .goto 1426/0,382.21,-6084.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thran Khorman|r
    .turnin 3106 >>Turn in Simple Rune while you are here
    .isQuestComplete 3106
    .target Thran Khorman
step << Gnome Warrior
    .goto 1426/0,382.21,-6084.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thran Khorman|r
    .turnin 3112 >>Turn in Simple Memorandum while you are here
    .isQuestComplete 3112
    .target Thran Khorman
step << Dwarf Hunter
    .goto 1426/0,364.97,-6091.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thorgas Grimson|r
    .turnin 3108 >>Turn in Etched Rune while you are here
    .isQuestComplete 3108
    .target Thorgas Grimson
step << Dwarf Priest
    .goto 1426/0,393.53,-6056.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Branstock Khalder|r
    .turnin 3110 >>Turn in Hallowed Rune while you are here
    .isQuestComplete 3110
    .target Branstock Khalder
step << Gnome Priest
    .goto 1426/0,393.53,-6056.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Branstock Khalder|r
    .turnin 98574 >>Turn in Hallowed Memorandum while you are here
    .isQuestComplete 98574
    .target Branstock Khalder
step << Gnome Mage
    .goto 1426/0,388.12,-6056.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marryk Nurribit|r
    .turnin 3114 >>Turn in Glyphic Memorandum while you are here
    .isQuestComplete 3114
    .target Marryk Nurribit
step << Dwarf Shaman
    .goto 1426/0,384.18,-6049.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Teo Hammerstorm|r
    .turnin 98581 >>Turn in Archaic Rune while you are here
    .isQuestComplete 98581
    .target Teo Hammerstorm
step
    .goto 1426/0,385.16,-6056.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Durnan Furcutter|r
    .turnin 3364 >>Turn in Scalding Mornbrew Delivery
    .accept 3365 >>Accept Bring Back the Mug
    .target Durnan Furcutter
step << Gnome Mage
    >>Talk to |cRXP_FRIENDLY_Durnan Furcutter|r and |cRXP_FRIENDLY_Marryk Nurribit|r
    .goto 1426/0,385.16,-6056.23
    .target +Durnan Furcutter
    .trainer >> Train your class spells (Arcane Intellect, Frostbolt)
    .goto 1426/0,388.17,-6056.10
    .target +Marryk Nurribit
step << Gnome Mage
    .goto 1426/0,383.68,-6057.22
    >>Talk to |cRXP_FRIENDLY_Durnan Furcutter|r
    .target Durnan Furcutter
    .vendor >> vendor trash
step
    .goto 1426/0,384.18,-6049.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Teo Hammerstorm|r
    .turnin 98581 >>Turn in Archaic Rune << Dwarf Shaman
    .accept 94373 >>Accept Call of Earth << Shaman
    .target Teo Hammerstorm
step << Shaman
    .goto 1426/0,384.000,-6050.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Teo Hammerstorm::257446|r
    .target Teo Hammerstorm::257446
    .train 8042 >> Train |T136026:0|t[Earth Shock]
step << Dwarf Hunter
    .goto 1426/0,364.97,-6091.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thorgas Grimson|r
    .turnin 3108 >>Turn in Etched Rune
    .target Thorgas Grimson
step << Hunter
    .goto 1426/0,365.21,-6091.86
    .target Thorgas Grimson
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thorgas Grimson|r
    .train 1978 >>Train |T132204:0|t[Serpent Sting]
step << Gnome Warlock
    .goto 1426/0,391.07,-6048.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alamar Grimm|r
    .turnin 3115 >>Turn in Tainted Memorandum
    .target Alamar Grimm
step << Warlock
    .goto 1426/0,391.07,-6048.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alamar Grimm|r upstairs
    .train 172 >>Train |T136118:0|t[Corruption]
    .target Alamar Grimm
step
    .goto 1426/0,390.09,-6093.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grund Drokda|r
    .accept 97277 >>Accept Grund and Gozwin
    .target Grund Drokda
step
    .goto 1426/0,396.00,-6097.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Felix Whindlebolt|r
    .accept 3361 >>Accept A Refugee's Quandary
    .target Felix Whindlebolt
step << Dwarf Paladin
    .goto 1426/0,382.21,-6120.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bromos Grummner|r
    .turnin 3107 >>Turn in Consecrated Rune
    .target Bromos Grummner
step << Paladin
    .goto 1426/0,382.06,-6120.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bromos Grummner|r inside
    .train 19740 >> Train |T135906:0|t[Blessing of Might]
    .train 20271 >> Train |T135959:0|t[Judgement]
    .target Bromos Grummner
step
    .goto 1426/0,454.11,-5940.99
    >>Kill |cRXP_ENEMY_Snow Leopard Prowler|r
    >>Pick up |cRXP_PICK_Gozwin's Mechanic's Log|r from the ground
    .complete 97277,2 --Snow Leopard Prowler slain (1)
    .complete 97277,1 --Gozwin's Mechanic's Log (1)
    .mob Snow Leopard Prowler
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 1 - 32 Dun Morogh
#subweight -1
#name 3-5 Dun Morogh: around Grelin Whitebeard
#next Zone Routes (Alliance)\5-7 Dun Morogh: around Pilot Bellowfiz

step
    .goto 1426/0,571.82,-6371.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nori Pridedrift|r
    .turnin 3365 >>Turn in Bring Back the Mug
    .target Nori Pridedrift
    .isOnQuest 3365
step
    .goto 1426/0,680.17,-6503.75
    >>Pick up |cRXP_PICK_Felix's Chest|r from the ground
    .complete 3361,2 --Felix's Chest (1)
    .isOnQuest 3361
step
    #loop
    .goto 1426/0,685.59,-6509.99,0
    .goto 1426/0,685.59,-6509.99,40,0
    .goto 1426/0,631.41,-6514.58,40,0
    .goto 1426/0,669.83,-6482.41,40,0
    .goto 1426/0,703.32,-6442.02,40,0
    .goto 1426/0,747.15,-6404.26,40,0
    .goto 1426/0,767.83,-6350.42,40,0
    .goto 1426/0,806.74,-6368.80,40,0
    .goto 1426/0,797.88,-6410.83,40,0
    .goto 1426/0,748.63,-6436.77,40,0
    >>Kill |cRXP_ENEMY_Frostmane Troll Whelps|r
    .complete 182,1 --Frostmane Troll Whelp slain (14)
    .mob Frostmane Troll Whelp
    .isOnQuest 182
step
    .goto 1426/0,773.74,-6374.71
    >>Pick up |cRXP_PICK_Felix's Box|r from the ground
    .complete 3361,1 --Felix's Box (1)
    .isOnQuest 3361
step << Shaman
    #loop
    .goto 1426/0,767.83,-6350.42,0
    .goto 1426/0,767.83,-6350.42,40,0
    .goto 1426/0,806.74,-6368.80,40,0
    .goto 1426/0,797.88,-6410.83,40,0
    .goto 1426/0,748.63,-6436.77,40,0
    .goto 1426/0,685.59,-6509.99,40,0
    .goto 1426/0,631.41,-6514.58,40,0
    .goto 1426/0,669.83,-6482.41,40,0
    .goto 1426/0,703.32,-6442.02,40,0
    .goto 1426/0,747.15,-6404.26,40,0
    >>Kill |cRXP_ENEMY_Frostmane Troll Whelps|r and |cRXP_ENEMY_Frostmane Novices|r. Loot them for |cRXP_LOOT_Iceclaw Bear Pendant|r
    .complete 94373,1 --Iceclaw Bear Pendant (2)
    .mob Frostmane Troll Whelp
    .mob Frostmane Novice
    .isOnQuest 94373
step
    .goto 1426/0,566.89,-6362.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grelin Whitebeard|r
    .turnin 182 >>Turn in The Troll Cave
    .target Grelin Whitebeard
    .isOnQuest 182
step
    .goto 1426/0,566.89,-6362.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grelin Whitebeard|r
    .accept 218 >>Accept The Stolen Journal
    .target Grelin Whitebeard
    .isQuestTurnedIn 182 --any of: The Troll Cave
step
    .goto 1426/0,505.33,-6480.11
    >>Pick up |cRXP_PICK_Felix's Bucket of Bolts|r from the ground
    .complete 3361,3 --Felix's Bucket of Bolts (1)
    .isOnQuest 3361
step
    .goto 1426/0,300.94,-6508.67
    >>Kill |cRXP_ENEMY_Grik'nir the Cold|r and loot |cRXP_LOOT_Grelin Whitebeard's Journal|r
    .complete 218,1 --Grelin Whitebeard's Journal (1)
    .mob Grik'nir the Cold
    .isOnQuest 218
step
    .goto 1426/0,566.89,-6362.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grelin Whitebeard|r
    .turnin 218 >>Turn in The Stolen Journal
    .target Grelin Whitebeard
    .isOnQuest 218
step
    .goto 1426/0,566.89,-6362.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grelin Whitebeard|r
    .accept 282 >>Accept Senir's Observations
    .target Grelin Whitebeard
    .isQuestTurnedIn 218 --any of: The Stolen Journal
step
    .goto 1426/0,396.00,-6097.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Felix Whindlebolt|r
    .turnin 3361 >>Turn in A Refugee's Quandary
    .target Felix Whindlebolt
    .isOnQuest 3361
step << Shaman
    .goto 1426/0,384.18,-6049.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Teo Hammerstorm|r
    .turnin 94373 >>Turn in Call of Earth
    .target Teo Hammerstorm
    .isOnQuest 94373
step << Shaman
    .goto 1426/0,384.18,-6049.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Teo Hammerstorm|r
    .accept 94374 >>Accept Call of Earth
    .target Teo Hammerstorm
    .isQuestTurnedIn 94373 --any of: Call of Earth
step << Shaman
    .goto 1426/0,578.71,-5908.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Minor Manifestation of Earth|r
    .turnin 94374 >>Turn in Call of Earth
    .target Minor Manifestation of Earth
    .isOnQuest 94374
step << Shaman
    .goto 1426/0,578.71,-5908.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Minor Manifestation of Earth|r
    .accept 94375 >>Accept Call of Earth
    .target Minor Manifestation of Earth
    .isQuestTurnedIn 94374 --any of: Call of Earth
step << Shaman
    .goto 1426/0,384.18,-6049.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Teo Hammerstorm|r
    .turnin 94375 >>Turn in Call of Earth
    .target Teo Hammerstorm
    .isOnQuest 94375
step << Dwarf Priest/Gnome Priest
    .xp 4+1690 >> Grind to 1690+/2100xp
step << Dwarf Warrior
    .goto 1426/0,382.21,-6084.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thran Khorman|r
    .turnin 3106 >>Turn in Simple Rune
    .target Thran Khorman
    .isOnQuest 3106
step << Dwarf Rogue
    .goto 1426/0,404.86,-6093.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Solm Hargrin|r
    .turnin 3109 >>Turn in Encrypted Rune
    .target Solm Hargrin
    .isOnQuest 3109
step << Rogue
    .goto 1426/0,404.91,-6093.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Solm Hargrin|r
    .train 1784 >>Train |T132320:0|t[Stealth]
    .target Solm Hargrin
step << Dwarf Priest
    .goto 1426/0,393.53,-6056.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Branstock Khalder|r
    .turnin 3110 >>Turn in Hallowed Rune
    .target Branstock Khalder
    .isOnQuest 3110
step << Gnome Warrior
    .goto 1426/0,382.21,-6084.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thran Khorman|r
    .turnin 3112 >>Turn in Simple Memorandum
    .target Thran Khorman
    .isOnQuest 3112
step << Warrior
    .goto 1426/0,382.11,-6084.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thran Khorman|r
    .train 100 >> Train |T132337:0|t[Charge]
    .train 772 >> Train |T132155:0|t[Rend]
    .target Thran Khorman
step << Gnome Rogue
    .goto 1426/0,404.86,-6093.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Solm Hargrin|r
    .turnin 3113 >>Turn in Encrypted Memorandum
    .target Solm Hargrin
    .isOnQuest 3113
step << Gnome Priest
    .goto 1426/0,393.53,-6056.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Branstock Khalder|r
    .turnin 98574 >>Turn in Hallowed Memorandum
    .target Branstock Khalder
    .isOnQuest 98574
step << Priest
    .goto 1426/0,393.53,-6056.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Branstock Khalder|r
    .trainer >> Train your class spells
    .target Branstock Khalder
step << Gnome Mage
    .goto 1426/0,388.12,-6056.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marryk Nurribit|r
    .turnin 3114 >>Turn in Glyphic Memorandum
    .target Marryk Nurribit
    .isOnQuest 3114
step << Mage
    .goto 1426/0,388.17,-6056.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marryk Nurribit|r inside
    .train 1459 >> Train |T135932:0|t[Arcane Intellect]
    .train 116 >> Train |T135846:0|t[Frostbolt]
    .target Marryk Nurribit
step << Gnome Mage
    .goto 1426/0,388.17,-6056.10
    .target Marryk Nurribit
    >>Talk to |cRXP_FRIENDLY_Marryk Nurribit|r
    .trainer >> Train your class spells
step
    .goto 1426/0,390.09,-6093.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grund Drokda|r
    .turnin 97277 >>Turn in Grund and Gozwin
    .target Grund Drokda
    .isOnQuest 97277
step << Dwarf Priest/Gnome Priest
    .goto 1426/0,393.53,-6056.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Branstock Khalder|r
    .accept 5626 >>Accept In Favor of the Light
    .target Branstock Khalder
step
    .goto 1426/0,153.19,-6235.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Thalos|r
    .turnin 282 >>Turn in Senir's Observations
    .target Mountaineer Thalos
    .isOnQuest 282
step
    .goto 1426/0,153.19,-6235.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Thalos|r
    .accept 420 >>Accept Senir's Observations
    .accept 96628 >>Accept The Adventurer
    .target Mountaineer Thalos
    .isQuestTurnedIn 282 --any of: Senir's Observations
step
    .goto 1426/0,134.97,-6248.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hands Springsprocket|r
    .accept 2160 >>Accept Supplies to Tannok
    .target Hands Springsprocket
step
    .goto 1426,43.316,56.283,60,0
    .goto 1426,43.949,52.524,60,0
    .goto 1426,38.677,60.561,60,0
    .goto 1426/0,-499.17,-5644.37
    .xp 5+1325 >> Travel to Kharanos. Grind to 1325+/2800xp killing |cRXP_ENEMY_Crag Boars|r en-route << Priest
    .xp 5+1595 >> Travel to Kharanos. Grind to 1595+/2800xp killing |cRXP_ENEMY_Crag Boars|r en-route << !Priest
step << Dwarf Hunter
    .goto 1426/0,-454.06,-5618.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grif Wildheart|r
    .turnin 6076 >>Turn in The Hunter's Path
    .target Grif Wildheart
    .isOnQuest 6076
step
    .goto 1426/0,-499.37,-5644.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senir Whitebeard|r
    .turnin 420 >>Turn in Senir's Observations while you are here
    .isQuestComplete 420
    .target Senir Whitebeard
step
    .goto 1426/0,-523.50,-5590.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tannok Frosthammer|r
    .turnin 2160 >>Turn in Supplies to Tannok while you are here
    .isQuestComplete 2160
    .target Tannok Frosthammer
step << Dwarf Priest/Gnome Priest
    .goto 1426/0,-529.41,-5590.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maxan Anvol|r
    .turnin 5626 >>Turn in In Favor of the Light while you are here
    .isQuestComplete 5626
    .target Maxan Anvol
step
    .goto 1426/0,-529.41,-5590.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maxan Anvol|r
    .accept 99158 >>Accept Dawn in the Mountains
    .target Maxan Anvol
    .xp <5,1
step
    .goto 1426/0,-497.89,-5648.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eric Brighthammer|r
    .turnin 96628 >>Turn in The Adventurer
    .target Eric Brighthammer
    .isOnQuest 96628
step
    .goto 1426/0,-497.89,-5648.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eric Brighthammer|r
    .accept 96608 >>Accept The Great Outdoors
    .target Eric Brighthammer
step
    .goto 1426/0,-496.91,-5644.83
    >>Click the |cRXP_PICK_Basic Campfire|r
    .complete 96608,1 --Basic Campfire
    .complete 96608,2 --Basic Campfire
step
    .goto 1426/0,-497.89,-5648.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eric Brighthammer|r
    .turnin 96608 >>Turn in The Great Outdoors
    .accept 96629 >>Accept Camping 101: Cooking
    .target Eric Brighthammer
step
    .goto 1426/0,-499.37,-5644.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senir Whitebeard|r
    .turnin 420 >>Turn in Senir's Observations
    .target Senir Whitebeard
    .isOnQuest 420
step
    .goto 1426/0,-499.37,-5644.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senir Whitebeard|r
    .accept 98322 >>Accept Secure the Mountain
    .target Senir Whitebeard
step << Warlock
    .goto 1426/0,-528.87,-5640.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gimrizz Shadowcog|r
    .trainer >> Train your class spells
    .target Gimrizz Shadowcog
step << Warlock
    .goto 1426/0,-526.11,-5639.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dannie Fizzwizzle|r
    .vendor 6328 >> |cRXP_BUY_Buy the|r |T133738:0|t[Grimoire of Blood Pact (Rank 1)] |cRXP_BUY_if you can afford it. If not you can buy it later|r
    .target Dannie Fizzwizzle
    .money <0.0100
step
    .goto 1426/0,-523.50,-5590.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tannok Frosthammer|r
    .turnin 2160 >>Turn in Supplies to Tannok
    .target Tannok Frosthammer
step << Gnome Mage
    .goto 1426/0,-537.29,-5587.04
    >>Talk to |cRXP_FRIENDLY_Magis|r upstairs
    .trainer >> Train your class spells (Fireball R2, Fire Blast)
    .target Magis Sparkmantle
step << Gnome Mage
    >>Upstairs
    .goto 1426/0,-537.29,-5587.70
    .trainer >> Train your class spells
step << Gnome Mage
    .goto 1426/0,-532.37,-5600.83
    .vendor >> Buy as much level 5 drink as you can afford
step
    .goto 1426/0,-529.41,-5590.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maxan Anvol|r
    .turnin 5626 >>Turn in In Favor of the Light << Dwarf Priest/Gnome Priest
    .accept 5625 >>Accept Garments of the Light << Dwarf Priest/Gnome Priest
    .accept 99158 >>Accept Dawn in the Mountains
    .target Maxan Anvol
step
    .goto 1426/0,-545.66,-5594.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gremlock Pilsnor|r
    .complete 96629,1 --Gremlock Pilsnor
    .target Gremlock Pilsnor
step
    .goto 1426/0,-545.66,-5594.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gremlock Pilsnor|r
    .turnin 96629 >>Turn in Camping 101: Cooking while you are here
    .isQuestComplete 96629
    .target Gremlock Pilsnor
step << Dwarf Priest/Gnome Priest
    .goto 1426/0,-454.06,-5668.80
    >>Interact with |cRXP_FRIENDLY_Mountaineer Dolf|r
    .complete 5625,1 --Mountaineer Dolf
    .target Mountaineer Dolf
step << Dwarf Priest/Gnome Priest
    .goto 1426/0,-529.41,-5590.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maxan Anvol|r
    .turnin 5625 >>Turn in Garments of the Light
    .target Maxan Anvol
step << Priest
    .goto 1426/0,-529.51,-5590.660
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maxan Anvol|r inside
    .trainer >> Train your class spells
    .target Maxan Anvol
step << Mage
    .goto 1426/0,-537.200,-5587.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magis Sparkmantle|r inside upstairs
    .trainer >> Train your class spells
    .target Magis Sparkmantle
step << Paladin
    .goto 1426/0,-542.100,-5586.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Azar Stronghammer|r inside upstairs
    .trainer >> Train your class spells
    .target Azar Stronghammer
step << Shaman
    .goto 1426/0,-541.500,-5582.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ingrid Dunwald|r inside upstairs
    .trainer >> Train your class spells
    .target Ingrid Dunwald
step << Hunter
    .goto 1426/0,-454.06,-5618.53
    .target Grif Wildheart
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grif Wildheart|r
    .trainer >> Train your class spells
step
    .goto 1426/0,-545.66,-5594.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gremlock Pilsnor|r
    .turnin 96629 >>Turn in Camping 101: Cooking
    .target Gremlock Pilsnor
step
    .goto 1426/0,-545.800,-5594.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gremlock Pilsnor::1699|r
    >>|cRXP_WARN_Skip this step if you don't have 1 silver, or if you wish to do it later|r
    .target Gremlock Pilsnor::1699
    .train 2550 >> Train |T133971:0|t[Cooking]
    .money <0.0100
step << Rogue
    .goto 1426/0,-540.39,-5604.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hogral Bakkan|r inside in the backroom
    .trainer >> Train your class spells
    .target Hogral Bakkan
step << Warrior
    .goto 1426/0,-530.40,-5605.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Granis Swiftaxe|r inside
    .trainer >> Train your class spells
    .target Granis Swiftaxe
step
    .goto 1426/0,-531.23,-5601.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Belm|r inside
    .vendor >> |cRXP_BUY_Buy as much|r |T132815:0|t[Ice Cold Milk] |cRXP_BUY_as you can afford|r << Priest/Mage/Warlock
    .target Innkeeper Belm
step
    .goto 1426/0,-464.40,-5573.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tharek Blackstone|r
    .accept 400 >>Accept Tools for Steelgrill
    .target Tharek Blackstone
step << Warrior/Rogue/Paladin
    .goto 1426,45.344,51.936
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tognus Flintfire|r
    >>|cRXP_WARN_This will allow you to make|r |T135248:0|t[Rough Sharpening Stones] |cRXP_WARN_which increase your melee damage by 2|r << Warrior/Rogue
    >>|cRXP_WARN_This will allow you to make|r |T135255:0|t[Rough Weightstones] |cRXP_WARN_which increase your melee damage by 2|r << Paladin
    >>|cRXP_WARN_If you don't want to do this, skip this step|r
    .train 2018 >> Train |T136241:0|t[Blacksmithing]
    .target Tognus Flintfire
step
    .goto 1426/0,-430.91,-5582.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tognus Flintfire|r
    .accept 98321 >>Accept Flintfire's Shipment
    .target Tognus Flintfire
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 1 - 32 Dun Morogh
#subweight -1
#name 5-7 Dun Morogh: around Pilot Bellowfiz
#next Zone Routes (Alliance)\7-9 Dun Morogh: around Maxan Anvol

step
    .goto 1426/0,-632.34,-5466.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pilot Bellowfiz|r
    .accept 317 >>Accept Stocking Jetsteam
    .target Pilot Bellowfiz
step
    #completewith Along75
    >>As you go: Kill |cRXP_ENEMY_Crag Boars|r, |cRXP_ENEMY_Large Crag Boars|r, |cRXP_ENEMY_Elder Crag Boars|r and |cRXP_ENEMY_Scarred Crag Boars|r. Loot them for |cRXP_LOOT_Chunk of Boar Meat|r. |cRXP_WARN_Anything left is finished later|r
    .complete 317,1 --Chunk of Boar Meat (4)
    .mob Crag Boar
    .mob Large Crag Boar
    .mob Elder Crag Boar
    .mob Scarred Crag Boar
step
    .goto 1426/0,-641.70,-5473.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pilot Stonegear|r
    .accept 313 >>Accept The Grizzled Den
    .target Pilot Stonegear
step << Gnome Mage
    >>Talk to |cRXP_FRIENDLY_Stonegear|r, |cRXP_FRIENDLY_Beldin|r, and |cRXP_FRIENDLY_Loslor|r
    >>|cRXP_WARN_Kite |cRXP_ENEMY_Young Black Bears|r to the |cRXP_FRIENDLY_Ironforge Mountaineer|r if you pulled any (make sure to deal 51%+ damage to get credit)|r
    .target +Pilot Stonegear
    .goto 1426/0,-641.80,-5473.18
    .target +Beldin Steelgrill
    .goto 1426/0,-682.58,-5488.87
    .vendor >> Vendor Trash
    .goto 1426/0,-664.55,-5499.710
    .target +Loslor Rudge
step
    .goto 1426/0,-682.09,-5488.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Beldin Steelgrill|r
    .turnin 400 >>Turn in Tools for Steelgrill
    .target Beldin Steelgrill
    .isOnQuest 400
step
    .goto 1426/0,-664.36,-5499.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loslor Rudge|r
    .accept 5541 >>Accept Ammo for Rumbleshot
    .target Loslor Rudge
step << Warrior/Paladin/Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loslor Rudge|r
    >>|cRXP_BUY_Buy a|r |T134708:0|t[Mining Pick]>>|cRXP_BUY_. If you can't afford it, skip this step|r
    .collect 2901,1
    .goto 1426/0,-664.55,-5499.710
    .target Loslor Rudge
    .train 2018,3
step << Warrior/Paladin/Rogue
    .goto 1426/0,-660.91,-5528.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yarr Hammerstone|r inside downstairs
    >>|cRXP_WARN_If you can't afford it, skip this step|r
    .train 2575 >>Train |T134708:0|t[Mining]
    .target Yarr Hammerstone
    .train 2018,3
step
    #completewith Along73
    >>As you go: Open the |cRXP_PICK_Ammo Crate|r. Loot it for |cRXP_LOOT_Rumbleshot's Ammo|r. |cRXP_WARN_Anything left is finished later|r
    .complete 5541,1 --Rumbleshot's Ammo (1)
step
    .goto 1426/0,-369.84,-5750.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Gretchen|r
    .turnin 98322 >>Turn in Secure the Mountain
    .target Mountaineer Gretchen
    .isOnQuest 98322
step
    #label Along73
    .goto 1426/0,-369.84,-5750.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Gretchen|r
    .accept 98319 >>Accept Secure the Mountain
    .target Mountaineer Gretchen
    .isQuestTurnedIn 98322 --any of: Secure the Mountain
step
    .goto 1426/0,-371.32,-5746.94
    >>Open the |cRXP_PICK_Ammo Crate|r. Loot it for |cRXP_LOOT_Rumbleshot's Ammo|r
    .complete 5541,1 --Rumbleshot's Ammo (1)
step
    #label Along75
    .goto 1426/0,-369.84,-5750.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Gretchen|r
    .turnin 98319 >>Turn in Secure the Mountain
    .target Mountaineer Gretchen
    .isQuestComplete 98319
step
    .goto 1426/0,-317.14,-5506.27
    >>Click the |cRXP_PICK_Mountaineer Cornelius|r
    .complete 98319,1 --Mountaineer Cornelius
    .isOnQuest 98319
step
    #loop
    .goto 1426/0,-262.48,-5450.78,0
    .goto 1426/0,-262.48,-5450.78,40,0
    .goto 1426/0,-304.83,-5422.22,40,0
    .goto 1426/0,-262.48,-5356.22,40,0
    .goto 1426/0,-224.06,-5373.95,40,0
    .goto 1426/0,-148.71,-5391.68,40,0
    .goto 1426/0,-121.13,-5479.35,40,0
    .goto 1426/0,-165.45,-5479.35,40,0
    .goto 1426/0,-227.02,-5495.44,40,0
    .goto 1426/0,-223.08,-5425.83,40,0
    >>Kill |cRXP_ENEMY_Young Wendigos|r, |cRXP_ENEMY_Wendigos|r, |cRXP_ENEMY_Edan the Howlers|r and |cRXP_ENEMY_Old Icebeards|r. Loot them for |cRXP_LOOT_Wendigo Mane|r
    .complete 313,1 --Wendigo Mane (8)
    .mob Young Wendigo
    .mob Wendigo
    .mob Edan the Howler
    .mob Old Icebeard
step
    #loop
    .goto 1426/0,-222.09,-5426.82,0
    .goto 1426/0,-222.09,-5426.82,40,0
    .goto 1426/0,-271.34,-5469.50,40,0
    .goto 1426/0,-340.29,-5502.33,40,0
    .goto 1426/0,-310.74,-5574.57,40,0
    .goto 1426/0,-256.57,-5610.68,40,0
    .goto 1426/0,-217.17,-5545.02,40,0
    .goto 1426/0,-123.59,-5403.83,40,0
    .goto 1426/0,-202.39,-5364.43,40,0
    .goto 1426/0,-256.57,-5364.43,40,0
    >>Pick up |cRXP_PICK_Flintfire's Shipment|r from the ground
    .complete 98321,1 --Flintfire's Shipment (8)
    .isOnQuest 98321
step << Human Paladin/Dwarf Paladin
    .goto 1426/0,-783.05,-5089.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jordan Stilwell|r
    .turnin 1653 >>Turn in The Test of Righteousness
    .target Jordan Stilwell
    .isOnQuest 1653
step
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step << Dwarf Warrior/Gnome Warrior
    .goto 1455/0,-1250.58,-4812.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Klockmort Spannerspan|r
    .turnin 1704 >>Turn in Klockmort Spannerspan
    .target Klockmort Spannerspan
    .isOnQuest 1704
step
    .goto 1455/0,-1250.58,-4812.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Klockmort Spannerspan|r
    .turnin 2925 >>Turn in Klockmort's Essentials
    .target Klockmort Spannerspan
    .isOnQuest 2925
step
    .goto 1455/0,-1265.68,-4823.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Mechanic Castpipe|r
    .turnin 2931 >>Turn in Castpipe's Task
    .target Master Mechanic Castpipe
    .isOnQuest 2931
step
    .goto 1455/0,-1263.47,-4834.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tinkmaster Overspark|r
    .turnin 2923 >>Turn in Tinkmaster Overspark
    .target Tinkmaster Overspark
    .isOnQuest 2923
step
    .goto 1455/0,-1283.47,-4842.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lomac Gearstrip|r
    .turnin 1072 >>Turn in An Old Colleague
    .target Lomac Gearstrip
    .isOnQuest 1072
step
    .goto 1455/0,-1285.37,-4825.76
    >>Click the |cRXP_PICK_Misplaced Packages|r
    .accept 97263 >>Accept Your Package Has Arrived
step
    .goto 1455/0,-1303.71,-4631.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Stormpike|r
    .turnin 301 >>Turn in Report to Ironforge
    .target Prospector Stormpike
    .isOnQuest 301
step << Warlock
    .goto 1455/0,-1300.16,-4618.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krom Stoutarm|r
    .turnin 1758 >>Turn in Tome of the Cabal
    .target Krom Stoutarm
    .isOnQuest 1758
step
    .goto 1455/0,-1326.64,-4631.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Historian Karnik|r
    .turnin 98313 >>Turn in For Further Study
    .target Historian Karnik
    .isOnQuest 98313
step
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step
    .goto 1426/0,-1426.75,-4294.72
    >>Kill |cRXP_ENEMY_Young Black Bears|r, |cRXP_ENEMY_Ice Claw Bears|r and |cRXP_ENEMY_Black Bears|r. Loot them for |cRXP_LOOT_Thick Bear Fur|r
    .complete 317,2 --Thick Bear Fur (2)
    .mob Young Black Bear
    .mob Ice Claw Bear
    .mob Black Bear
step
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step
    .goto 1455/0,-1085.98,-4642.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eldrun Stormbreaker|r
    .turnin 97263 >>Turn in Your Package Has Arrived
    .target Eldrun Stormbreaker
step << Dwarf Paladin
    .goto 1455/0,-932.04,-4633.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tiza Battleforge|r
    .turnin 3000 >>Turn in Tome of Divinity
    .target Tiza Battleforge
    .isOnQuest 3000
step << Dwarf Priest
    .goto 1455/0,-909.11,-4612.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priest Rohan|r
    .turnin 5647 >>Turn in A Lack of Fear
    .target High Priest Rohan
    .isOnQuest 5647
step << Dwarf Priest
    .goto 1455/0,-909.11,-4612.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priest Rohan|r
    .turnin 5645 >>Turn in A Lack of Fear
    .target High Priest Rohan
    .isOnQuest 5645
step << Gnome Priest
    .goto 1455/0,-911.01,-4622.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess Mims|r
    .turnin 94819 >>Turn in Contingency Plan
    .target High Priestess Mims
    .isOnQuest 94819
step
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step
    #loop
    .goto 1426/0,-585.56,-5431.08,0
    .goto 1426/0,-585.56,-5431.08,40,0
    .goto 1426/0,-566.84,-5428.46,40,0
    .goto 1426/0,-566.84,-5488.21,40,0
    .goto 1426/0,-585.06,-5535.49,40,0
    .goto 1426/0,-665.83,-5580.48,40,0
    .goto 1426/0,-709.17,-5593.94,40,0
    .goto 1426/0,-731.83,-5628.08,40,0
    .goto 1426/0,-722.96,-5555.52,40,0
    .goto 1426/0,-632.84,-5534.51,40,0
    >>Kill |cRXP_ENEMY_Crag Boars|r, |cRXP_ENEMY_Large Crag Boars|r, |cRXP_ENEMY_Elder Crag Boars|r and |cRXP_ENEMY_Scarred Crag Boars|r. Loot them for |cRXP_LOOT_Chunk of Boar Meat|r
    .complete 317,1 --Chunk of Boar Meat (4)
    .mob Crag Boar
    .mob Large Crag Boar
    .mob Elder Crag Boar
    .mob Scarred Crag Boar
step
    .goto 1426/0,-632.34,-5466.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pilot Bellowfiz|r
    .turnin 317 >>Turn in Stocking Jetsteam while you are here
    .isQuestComplete 317
    .target Pilot Bellowfiz
step
    .goto 1426/0,-641.70,-5473.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pilot Stonegear|r
    .turnin 313 >>Turn in The Grizzled Den
    .target Pilot Stonegear
step
    .goto 1426/0,-632.34,-5466.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pilot Bellowfiz|r
    .turnin 317 >>Turn in Stocking Jetsteam
    .accept 318 >>Accept Evershine
    .target Pilot Bellowfiz
step
    .goto 1426/0,-430.91,-5582.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tognus Flintfire|r
    .turnin 98321 >>Turn in Flintfire's Shipment
    .target Tognus Flintfire
    .isOnQuest 98321
step
    .xp 7 >> Grind to 7
step
    .goto 1426/0,-369.84,-5750.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Gretchen|r
    .accept 98323 >>Accept Secure the Mountain
    .target Mountaineer Gretchen
    .isQuestTurnedIn 98319 --any of: Secure the Mountain
    .xp <4,1
step
    .goto 1426/0,-201.41,-6015.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hegnar Rumbleshot|r
    .turnin 5541 >>Turn in Ammo for Rumbleshot
    .target Hegnar Rumbleshot
step << Gnome Mage
    .goto 1426/0,-201.51,-6015.520
    >>Talk to |cRXP_FRIENDLY_Hegnar|r
    .vendor >> Vendor Trash
    .target Hegnar Rumbleshot
step << Gnome Mage
    .goto 1426/0,-197.47,-5932.45,30,0
    .goto 1426/0,-201.51,-6015.520
    .target Hegnar Rumbleshot
    >>Talk to |cRXP_FRIENDLY_Hegnar Rumbleshot|r
    .vendor >> Vendor and repair
step
    .goto 1426/0,99.51,-5572.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tundra MacGrann|r
    .accept 312 >>Accept Tundra MacGrann's Stolen Stash
    .target Tundra MacGrann
step << Gnome Mage
    .goto 1426/0,299.96,-5387.42
    .vendor >> Vendor. Buy up to 20 level 5 drink
step
    .goto 1426/0,315.23,-5378.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rejold Barleybrew|r
    .turnin 318 >>Turn in Evershine while you are here
    .isQuestComplete 318
    .target Rejold Barleybrew
step
    .goto 1426/0,249.23,-5343.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gretta Ganter|r
    .accept 98326 >>Accept Frosthowl
    .target Gretta Ganter
step
    .goto 1426/0,315.23,-5378.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rejold Barleybrew|r
    .turnin 318 >>Turn in Evershine
    .accept 319 >>Accept A Favor for Evershine
    .accept 315 >>Accept The Perfect Stout
    .target Rejold Barleybrew
step
    .goto 1426/0,315.23,-5371.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marleth Barleybrew|r
    .accept 310 >>Accept Bitter Rivals
    .target Marleth Barleybrew
step << Gnome Mage
    .goto 1426/0,302.42,-5387.74,0,0
    >>Talk to |cRXP_FRIENDLY_Keeg|r
    >>|cRXP_BUY_Buy up to 10 more|r |T132815:0|t[Ice Cold Milk] |cRXP_BUY_from him|r
    .vendor >> Vendor Trash
    .collect 1179,10,312,1
    .target Keeg Gibn
    .money <0.0350
    .isOnQuest 319
step << Gnome Mage
    .goto 1426/0,302.42,-5387.74,0,0
    >>Talk to |cRXP_FRIENDLY_Keeg|r
    >>|cRXP_BUY_Buy up to 5 more|r |T132815:0|t[Ice Cold Milk] |cRXP_BUY_from him|r
    .vendor >> Vendor Trash
    .collect 1179,5,312,1
    .target Keeg Gibn
    .money <0.0225
    .isOnQuest 319
step
    #loop
    .goto 1426/0,405.35,-5331.27,0
    .goto 1426/0,405.35,-5331.27,40,0
    .goto 1426/0,436.38,-5432.40,40,0
    .goto 1426/0,524.05,-5400.88,40,0
    .goto 1426/0,509.27,-5346.05,40,0
    .goto 1426/0,486.12,-5286.95,40,0
    .goto 1426/0,421.61,-5278.74,40,0
    .goto 1426/0,359.06,-5239.99,40,0
    .goto 1426/0,277.80,-5217.01,40,0
    .goto 1426/0,214.76,-5423.20,40,0
    >>Kill |cRXP_ENEMY_Elder Crag Boars|r
    >>Kill |cRXP_ENEMY_Ice Claw Bears|r
    .complete 319,2 --Elder Crag Boar slain (8)
    .complete 319,1 --Ice Claw Bear slain (6)
    .mob Elder Crag Boar
    .mob Ice Claw Bear
step
    #loop
    .goto 1426/0,265.48,-5170.06,0
    .goto 1426/0,265.48,-5170.06,40,0
    .goto 1426/0,123.64,-5035.11,40,0
    .goto 1426/0,68.48,-5026.58,40,0
    .goto 1426/0,60.60,-5071.23,40,0
    >>Kill |cRXP_ENEMY_Snow Leopards|r
    .complete 319,3 --Snow Leopard slain (8)
    .mob Snow Leopard
step
    .goto 1426/0,315.23,-5378.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rejold Barleybrew|r
    .turnin 319 >>Turn in A Favor for Evershine
    .accept 320 >>Accept Return to Bellowfiz
    .target Rejold Barleybrew
step
    .goto 1426/0,-499.37,-5644.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senir Whitebeard|r
    .turnin 98323 >>Turn in Secure the Mountain
    .target Senir Whitebeard
    .isOnQuest 98323
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 1 - 32 Dun Morogh
#subweight -1
#name 7-9 Dun Morogh: around Maxan Anvol
#next Zone Routes (Alliance)\9-11 Dun Morogh: around Pilot Bellowfiz

step
    .goto 1426/0,-548.13,-5607.40
    >>Click the |cRXP_PICK_Unguarded Thunder Ale Barrel|r
    .turnin 310 >>Turn in Bitter Rivals
    .isOnQuest 310
step
    .goto 1426/0,-548.13,-5607.40
    >>Click the |cRXP_PICK_Unguarded Thunder Ale Barrel|r
    .accept 311 >>Accept Return to Marleth
    .isQuestTurnedIn 310 --any of: Bitter Rivals
step << Gnome Mage
    .goto 1426/0,-532.37,-5600.83
    .vendor >> Buy up to 30 level 5 drink from the innkeeper
step
    .goto 1426/0,-1041.12,-5350.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Father Gavin|r
    .turnin 99158 >>Turn in Dawn in the Mountains
    .target Father Gavin
    .isOnQuest 99158
step
    .goto 1426/0,-1041.12,-5350.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Father Gavin|r
    .accept 99159 >>Accept Finding Warmth
    .target Father Gavin
step
    .goto 1426/0,-456.03,-5498.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Razzle Sprysprocket|r
    .accept 412 >>Accept Operation Recombobulation
    .target Razzle Sprysprocket
step
    #loop
    .goto 1426/0,-306.80,-5078.45,0
    .goto 1426/0,-306.80,-5078.45,40,0
    .goto 1426/0,-293.01,-5071.56,40,0
    .goto 1426/0,-259.03,-5053.83,40,0
    .goto 1426/0,-203.38,-5018.04,40,0
    .goto 1426/0,-241.79,-5012.79,40,0
    .goto 1426/0,-293.50,-4985.21,40,0
    .goto 1426/0,-284.15,-5018.70,40,0
    .goto 1426/0,-289.07,-5052.19,40,0
    .goto 1426/0,-318.62,-5054.49,40,0
    >>Kill |cRXP_ENEMY_Frostmane Seers|r. Loot them for |cRXP_LOOT_Shimmerweed|r. It can also be picked up from |cRXP_PICK_Shimmerweed Basket|r on the ground
    .complete 315,1 --Shimmerweed (6)
    .mob Frostmane Seer
    .isOnQuest 315
step
    .goto 1426/0,-94.53,-5647.78
    >>Open the |cRXP_PICK_MacGrann's Meat Locker|r. Loot it for |cRXP_LOOT_MacGrann's Dried Meats|r
    .complete 312,1 --MacGrann's Dried Meats (1)
    .isOnQuest 312
step
    .goto 1426/0,99.51,-5572.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tundra MacGrann|r
    .turnin 312 >>Turn in Tundra MacGrann's Stolen Stash
    .target Tundra MacGrann
    .isOnQuest 312
step << Gnome Mage
    .goto 1426/0,304.88,-5380.85
    .vendor >> Buy up to 20 more level 5 drink
step
    .goto 1426/0,315.23,-5371.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marleth Barleybrew|r
    .turnin 311 >>Turn in Return to Marleth while you are here
    .isQuestComplete 311
    .target Marleth Barleybrew
step
    .goto 1426/0,315.23,-5378.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rejold Barleybrew|r
    .turnin 315 >>Turn in The Perfect Stout
    .target Rejold Barleybrew
    .isOnQuest 315
step
    .goto 1426/0,-134.92,-5479.02
    >>Kill |cRXP_ENEMY_Frosthowl|r and loot |cRXP_LOOT_Sack of Fish|r
    .complete 98326,1 --Sack of Fish (1)
    .mob Frosthowl
    .isOnQuest 98326
step
    .goto 1426/0,-632.34,-5466.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pilot Bellowfiz|r
    .accept 415 >>Accept Rejold's New Brew
    .target Pilot Bellowfiz
    .isQuestTurnedIn 315 --any of: The Perfect Stout
step
    .goto 1426/0,-632.34,-5466.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pilot Bellowfiz|r
    .turnin 320 >>Turn in Return to Bellowfiz while you are here
    .isQuestComplete 320
    .target Pilot Bellowfiz
step
    .goto 1426/0,249.23,-5343.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gretta Ganter|r
    .turnin 98326 >>Turn in Frosthowl
    .target Gretta Ganter
    .isOnQuest 98326
step
    .goto 1426/0,315.23,-5378.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rejold Barleybrew|r
    .turnin 415 >>Turn in Rejold's New Brew
    .target Rejold Barleybrew
    .isOnQuest 415
step
    .goto 1426/0,315.23,-5378.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rejold Barleybrew|r
    .accept 413 >>Accept Shimmer Stout
    .target Rejold Barleybrew
    .isQuestTurnedIn 315 --any of: The Perfect Stout
step
    .goto 1426/0,315.23,-5371.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marleth Barleybrew|r
    .turnin 311 >>Turn in Return to Marleth
    .target Marleth Barleybrew
    .isOnQuest 311
step << Gnome Mage
    .goto 1426/0,-537.29,-5587.04
    >>Talk to |cRXP_FRIENDLY_Magis|r upstairs
    .trainer >> Train your class spells (Frostbolt r2, Polymorph)
    .target Magis Sparkmantle
step
    #loop
    .goto 1426/0,460.02,-5288.59,0
    .goto 1426/0,460.02,-5288.59,40,0
    .goto 1426/0,515.18,-5279.39,40,0
    .goto 1426/0,546.21,-5312.23,40,0
    .goto 1426/0,543.25,-5364.10,40,0
    .goto 1426/0,585.12,-5343.09,40,0
    .goto 1426/0,621.07,-5302.38,40,0
    .goto 1426/0,585.61,-5245.90,40,0
    .goto 1426/0,585.12,-5170.06,40,0
    .goto 1426/0,519.61,-5215.37,40,0
    >>Kill |cRXP_ENEMY_Leper Gnomes|r and |cRXP_ENEMY_Gibblewilts|r. Loot them for |cRXP_LOOT_Gyromechanic Gear|r
    >>Kill |cRXP_ENEMY_Leper Gnomes|r and |cRXP_ENEMY_Gibblewilts|r. Loot them for |cRXP_LOOT_Restabilization Cog|r
    .complete 412,2 --Gyromechanic Gear (8)
    .complete 412,1 --Restabilization Cog (8)
    .mob Leper Gnome
    .mob Gibblewilt
step << Hunter
    .xp 10-1720 >> Grind until you are 1720xp away from level 10
step << Hunter
    .xp 10-2040 >> Grind until you are 2040xp away from level 10
step << !Hunter
    .goto 1426,31.212,39.189,0
    .goto 1426,27.876,45.549,0
    .goto 1426,29.443,50.102,0
    .goto 1426,31.691,46.837,0
    .xp 8+4525 >> Grind to 4525+/5400xp
step << !Hunter
    .goto 1426,31.212,39.189,0
    .goto 1426,27.876,45.549,0
    .goto 1426,29.443,50.102,0
    .goto 1426,31.691,46.837,0
    .xp 9 >> Grind to level 9
step
    .goto 1426/0,-499.37,-5644.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senir Whitebeard|r
    .accept 291 >>Accept The Reports
    .target Senir Whitebeard
    .isQuestTurnedIn 287 --any of: Frostmane Hold
step
    .goto 1426/0,-632.34,-5466.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pilot Bellowfiz|r
    .turnin 320 >>Turn in Return to Bellowfiz
    .target Pilot Bellowfiz
    .isOnQuest 320
step
    .goto 1426/0,-456.03,-5498.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Razzle Sprysprocket|r
    .turnin 412 >>Turn in Operation Recombobulation
    .target Razzle Sprysprocket
step << Hunter
    .xp 10 >> Grind to level 10
step
    #loop
    .goto 1426/0,-955.92,-5633.67,0
    .goto 1426/0,-955.92,-5633.67,40,0
    .goto 1426/0,-985.47,-5548.30,40,0
    .goto 1426/0,-1064.27,-5584.42,40,0
    .goto 1426/0,-1069.19,-5666.50,40,0
    .goto 1426/0,-1143.07,-5801.12,40,0
    .goto 1426/0,-1079.04,-5801.12,40,0
    .goto 1426/0,-1083.97,-5751.87,40,0
    .goto 1426/0,-1015.02,-5679.63,40,0
    .goto 1426/0,-1005.17,-5633.67,40,0
    >>Loot the |cRXP_PICK_Fallen Logs|r for |cRXP_LOOT_Mostly Dry Firewood|r
    .complete 99159,1 --Mostly Dry Firewood (14)
step
    .goto 1426/0,-1304.61,-5513.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rudra Amberstill|r
    .accept 95212 >>Accept Never Saddle on Quality
    .target Rudra Amberstill
step
    #loop
    .goto 1426/0,-1644.43,-5613.31,0
    .goto 1426/0,-1644.43,-5613.31,40,0
    .goto 1426/0,-1735.54,-5617.25,40,0
    .goto 1426/0,-1831.58,-5579.16,40,0
    .goto 1426/0,-1894.13,-5597.55,40,0
    .goto 1426/0,-1919.74,-5683.57,40,0
    .goto 1426/0,-1897.58,-5762.37,40,0
    .goto 1426/0,-1802.03,-5685.54,40,0
    .goto 1426/0,-1760.17,-5761.39,40,0
    .goto 1426/0,-1719.29,-5696.05,40,0
    >>Kill |cRXP_ENEMY_Elder Snow Leopards|r. Loot them for |cRXP_LOOT_Pristine Leopard Pelt|r
    .complete 95212,1 --Pristine Leopard Pelt (6)
    .mob Elder Snow Leopard
step << Dwarf Hunter
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step << Dwarf Hunter
    .xp 10 >>Grind to level 10 (The Hunter's Path needs it)
step << Dwarf Hunter
    .goto 1455/0,-1274.07,-5010.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Olmin Burningbeard|r
    .accept 6074 >>Accept The Hunter's Path
    .target Olmin Burningbeard
step << Dwarf Hunter
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step << Dwarf Hunter
    .goto 1426/0,-454.06,-5618.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grif Wildheart|r
    .turnin 6074 >>Turn in The Hunter's Path
    .accept 6064 >>Accept Taming the Beast
    .target Grif Wildheart
step << Dwarf Hunter
    #loop
    .goto 1426/0,-76.31,-5550.93,0
    .goto 1426/0,-76.31,-5550.93,40,0
    .goto 1426/0,-19.18,-5553.22,40,0
    .goto 1426/0,9.88,-5657.31,40,0
    .goto 1426/0,46.81,-5673.39,40,0
    .goto 1426/0,111.33,-5703.60,40,0
    >>Interact with |cRXP_FRIENDLY_Large Crag Boar|r
    .complete 6064,1 --Large Crag Boar
    .target Large Crag Boar
step << Dwarf Hunter
    .goto 1426/0,-454.06,-5618.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grif Wildheart|r
    .turnin 6064 >>Turn in Taming the Beast
    .accept 6084 >>Accept Taming the Beast
    .target Grif Wildheart
step << Dwarf Hunter
    #loop
    .goto 1426/0,-1108.10,-5802.43,0
    .goto 1426/0,-1108.10,-5802.43,40,0
    .goto 1426/0,-1126.32,-5711.48,40,0
    .goto 1426/0,-1130.26,-5880.57,40,0
    .goto 1426/0,-1150.95,-5782.07,40,0
    .goto 1426/0,-1155.87,-5808.67,40,0
    .goto 1426/0,-1213.99,-5834.61,40,0
    .goto 1426/0,-1268.16,-5734.79,40,0
    .goto 1426/0,-1283.92,-5819.50,40,0
    .goto 1426/0,-1298.20,-5759.42,40,0
    .goto 1426/0,-1329.23,-5854.31,40,0
    >>Interact with |cRXP_FRIENDLY_Snow Leopard|r
    .complete 6084,1 --Snow Leopard
    .target Snow Leopard
step << Dwarf Hunter
    .goto 1426/0,-454.06,-5618.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grif Wildheart|r
    .turnin 6084 >>Turn in Taming the Beast
    .accept 6085 >>Accept Taming the Beast
    .target Grif Wildheart
step << Dwarf Hunter
    #loop
    .goto 1426/0,-27.06,-5319.45,0
    .goto 1426/0,-27.06,-5319.45,40,0
    .goto 1426/0,-95.03,-5303.69,40,0
    .goto 1426/0,-75.33,-5285.96,40,0
    .goto 1426/0,-56.12,-5242.62,40,0
    .goto 1426/0,-114.23,-5199.94,40,0
    >>Interact with |cRXP_FRIENDLY_Ice Claw Bear|r
    .complete 6085,1 --Ice Claw Bear
    .target Ice Claw Bear
step << Dwarf Hunter
    .goto 1426/0,-454.06,-5618.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grif Wildheart|r
    .turnin 6085 >>Turn in Taming the Beast
    .accept 6086 >>Accept Training the Beast
    .target Grif Wildheart
step << Warrior
    .goto 1455/0,-1205.65,-5042.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bixi Wobblebonk|r or |cRXP_FRIENDLY_Buliwyf Stonehand|r
    .trainer >> If you are in a party or have someone to help you kill |cRXP_ENEMY_Vagash|r now, train 2h Maces from |cRXP_FRIENDLY_Buliwyf Stonehand|r, otherwise train Thrown from |cRXP_FRIENDLY_Bixi Wobblebonk|r. If you aren't sure which to train, just train Thrown
    .target Bixi Wobblebonk
    .target Buliwyf Stonehand
step << Dwarf Hunter
    .goto 1455/0,-1273.83,-5022.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Belia Thundergranite|r
    .turnin 6086 >>Turn in Training the Beast while you are here
    .isQuestComplete 6086
    .target Belia Thundergranite
step
    .goto 1426/0,-2447.21,-5479.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Barleybrew|r
    .turnin 413 >>Turn in Shimmer Stout
    .target Mountaineer Barleybrew
    .isOnQuest 413
step
    .goto 1426/0,-2447.21,-5479.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Barleybrew|r
    .accept 414 >>Accept Stout to Kadrell
    .target Mountaineer Barleybrew
    .isQuestTurnedIn 413 --any of: Shimmer Stout
step << Shaman
    .goto 1426/0,-2528.96,-5348.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bruegs Kindleborn|r
    .turnin 94468 >>Turn in Call of Fire
    .target Bruegs Kindleborn
    .isOnQuest 94468
step
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step
    .goto 1455/0,-1248.53,-4802.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jemma Quikswitch|r
    .accept 95041 >>Accept Data Hoarders
    .target Jemma Quikswitch
step
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step
    .goto 1426/0,-1041.12,-5350.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Father Gavin|r
    .turnin 99159 >>Turn in Finding Warmth
    .accept 99160 >>Accept Rime's Wrath
    .target Father Gavin
step
    #loop
    .goto 1426/0,-996.79,-5370.34,0
    .goto 1426/0,-996.79,-5370.34,40,0
    .goto 1426/0,-1051.95,-5257.72,40,0
    .goto 1426/0,-948.53,-5266.59,40,0
    .goto 1426/0,-926.37,-5327.33,40,0
    .goto 1426/0,-913.56,-5387.42,40,0
    .goto 1426/0,-951.48,-5455.38,40,0
    .goto 1426/0,-1015.02,-5507.91,40,0
    .goto 1426/0,-1085.94,-5578.83,40,0
    .goto 1426/0,-1045.55,-5415.00,40,0
    >>Kill |cRXP_ENEMY_Minor Ice Elementals|r
    .complete 99160,1 --Minor Ice Elemental slain (10)
    .mob Minor Ice Elemental
step
    .goto 1426/0,-1041.12,-5350.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Father Gavin|r
    .turnin 99160 >>Turn in Rime's Wrath
    .accept 99162 >>Accept Treacherous Cold
    .accept 99161 >>Accept Rime's Wrath
    .target Father Gavin
step
    .goto 1426/0,-1071.16,-5258.05
    >>Kill |cRXP_ENEMY_Avala|r and loot |cRXP_LOOT_Avala's Core|r
    .complete 99161,1 --Avala's Core (1)
    .mob Avala
step
    .goto 1426/0,-1041.12,-5350.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Father Gavin|r
    .turnin 99161 >>Turn in Rime's Wrath
    .target Father Gavin
step
    .goto 1426/0,-763.84,-5323.06
    >>Pick up |cRXP_PICK_Coalbeard's Rifle|r from the ground
    .complete 99162,3 --Coalbeard's Rifle (1)
step
    #loop
    .goto 1426/0,442.78,-5282.35,0
    .goto 1426/0,442.78,-5282.35,40,0
    .goto 1426/0,467.41,-5226.53,40,0
    .goto 1426/0,442.78,-5193.70,40,0
    .goto 1426/0,506.81,-5206.83,40,0
    .goto 1426/0,570.83,-5177.28,40,0
    .goto 1426/0,556.06,-5279.07,40,0
    .goto 1426/0,595.46,-5328.32,40,0
    .goto 1426/0,511.73,-5315.18,40,0
    .goto 1426/0,516.66,-5256.08,40,0
    >>Loot the |cRXP_PICK_Snowdrifts|r for |cRXP_LOOT_Gnomeregan Archival Data|r
    .complete 95041,1 --Gnomeregan Archival Data (7)
step
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step << Shaman
    .goto 1455/0,-1085.98,-4642.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eldrun Stormbreaker|r
    .accept 94449 >>Accept Call of Fire
    .target Eldrun Stormbreaker
step << Shaman
    .goto 1455/0,-1086.500,-4642.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eldrun Stormbreaker::258098|r
    .target Eldrun Stormbreaker::258098
    .trainer >> Train your class spells
step << Dwarf Hunter
    .goto 1455/0,-1273.83,-5022.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Belia Thundergranite|r
    .turnin 6086 >>Turn in Training the Beast
    .target Belia Thundergranite
step << Hunter
    .goto 1455/0,-1273.83,-5022.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Belia Thundergranite|r
    .trainer >> Train your pet spells
    .target Belia Thundergranite
step << Hunter
    .goto 1455/0,-1266.100,-5006.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Belia Thundergranite|r
    .trainer >> Train your class spells
    .target Regnus Thundergranite
step << Dawrf Priest
    .goto 1455/0,-897.200,-4607.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priest Rohan|r
    .trainer >> Train your class spells
    .target High Priest Rohan
step << Warrior
    .goto 1455/0,-1234.65,-5035.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bilban Tosslespanner|r
    >>|cRXP_WARN_Ensure you save 20s 70c for later|r
    .train 2687 >> Train your class spells
    .target Bilban Tosslespanner
    .xp <10,1
    .xp >12,1
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bixi Wobblebonk|r and |cRXP_FRIENDLY_Buliwyf Stonehand|r
    .train 2567 >> Train Thrown
    .goto 1455/0,-1205.65,-5042.12
    .target +Bixi Wobblebonk
    .train 199 >> Train 2h Maces
    .goto 1455/0,-1197.27,-5041.49
    .target +Buliwyf Stonehand
step
    .goto 1455/0,-1152.40,-4821.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryth Thurden|r
    .fp Ironforge >> Get the Ironforge flight path
    .target Gryth Thurden
step << Mage
    .goto 1455/0,-928.40,-4614.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dink|r inside
    .train 122 >> Train your class spells
    .target Dink
step << Paladin
    .goto 1455/0,-896.47,-4601.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brandur Ironhammer|r inside
    .train 633 >> Train your class spells
    .target Brandur Ironhammer
step << Dwarf/Gnome
    .goto 1455/0,-1120.92,-4708.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Golnir Bouldertoe|r
    .turnin 6391 >>Turn in Ride to Ironforge
    .target Golnir Bouldertoe
    .isOnQuest 6391
step << Gnome Mage
    .goto 1455/0,-1121.08,-4708.000
    >>Talk to |cRXP_FRIENDLY_Golnir|r
    .vendor >> Vendor Trash
    .target Golnir Bouldertoe
    .isOnQuest 291
step << Dwarf/Gnome
    .goto 1455/0,-1120.92,-4708.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Golnir Bouldertoe|r
    .accept 6388 >>Accept Gryth Thurden
    .target Golnir Bouldertoe
    .isQuestTurnedIn 6391 --any of: Ride to Ironforge
    .xp <10,1
step
    .goto 1455/0,-1026.28,-4872.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senator Barin Redstone|r
    .turnin 291 >>Turn in The Reports
    .target Senator Barin Redstone
    .isOnQuest 291
step << Gnome Mage
    .goto 1455/0,-928.40,-4614.51
    >>Talk to |cRXP_FRIENDLY_Dink|r
    .trainer >> Train your class spells (Frost Armor r2, Frost Nova, Polymorph, Conjure Water r1 & r2)
    >>Total Cost: 15s
    >>Remember you may want money for Healing Potions (3s each), Bronze Tube (8s each), and level 5 food (20c per 5)
    .target Dink
step << Dwarf/Gnome
    .goto 1455/0,-1152.39,-4821.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryth Thurden|r
    .turnin 6388 >>Turn in Gryth Thurden
    .target Gryth Thurden
    .isOnQuest 6388
step << Mage
    .goto 1455/0,-928.40,-4614.51
    >>Talk to |cRXP_FRIENDLY_Dink|r
    .trainer >> Train your class spells (Fireball r3, Dampen Magic)
    >>Total Cost: 12s
    >>Remember you may want money for a |T133024:0|t[Bronze Tube] (8s each) and Thelsamar flying (1s 10c)
    .target Dink
step << Mage skip
    .goto 1455/0,-928.80,-4614.51,-1
    .goto 1455/0,-1249.87,-4793.31,-1
    .vendor 5175 >> Logout skip on the pillar above |cRXP_FRIENDLY_Dink|r to check |cRXP_FRIENDLY_Cogspinner|r for a |T133024:0|t[Bronze Tube] if you wish
step << Dwarf/Gnome
    .goto 1455/0,-1152.39,-4821.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryth Thurden|r
    .accept 6392 >>Accept Return to Brock
    .target Gryth Thurden
    .isQuestTurnedIn 6388 --any of: Gryth Thurden
    .xp <10,1
step << Shaman
    .goto 1455/0,-1197.200,-5041.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Buliwyf Stonehand|r and |cRXP_FRIENDLY_Bixi Wobblebonk|r
    .trainer >> Train any weapon skills you desire with left over money
    .target Buliwyf Stonehand
step << Mage Gnome
    .goto 1426/0,-537.29,-5587.04
    .trainer >> Train your class spells
step
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step
    .goto 1426/0,-531.38,-5601.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Belm|r
    .target Innkeeper Belm
    .home >>Set your Hearthstone to Innkeeper Belm's inn
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 1 - 32 Dun Morogh
#subweight -1
#name 9-11 Dun Morogh: around Pilot Bellowfiz
--RouteBuilder:next
#next Zone Routes (Alliance)\9-11 Zephras Isle: around Quel'ana Quickgale;Zone Routes (Alliance)\10-12 Westfall: around Farmer Saldean;Zone Routes (Alliance)\10-15 Darkshore: around Thundris Windweaver

step
    .goto 1426/0,-682.09,-5488.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Beldin Steelgrill|r
    .accept 96408 >>Accept A Visitor to Dun Morogh
    .target Beldin Steelgrill
step
    .goto 1426/0,-816.05,-5807.03
    >>Pick up |cRXP_PICK_Stoneanvil's Rifle|r from the ground
    .complete 99162,1 --Stoneanvil's Rifle (1)
    .isOnQuest 99162
step
    .goto 1426/0,-1392.76,-5796.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Earthseer Farsen|r
    .turnin 96408 >>Turn in A Visitor to Dun Morogh
    .target Earthseer Farsen
step
    .goto 1426/0,-1304.61,-5513.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rudra Amberstill|r
    .turnin 95212 >>Turn in Never Saddle on Quality
    .target Rudra Amberstill
    .isOnQuest 95212
step << Human Mage
    .goto 1455/0,-1152.40,-4821.13
    .fp Ironforge >> Get the Ironforge flight path
step << Human Mage
    .goto 1455/0,-928.40,-4614.46
    .trainer >> Train your class spells
step
    .goto 1426/0,-1304.61,-5513.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rudra Amberstill|r
    .accept 314 >>Accept Protecting the Herd
    .target Rudra Amberstill
step
    .goto 1426/0,-1147.99,-5522.03
    >>Pick up |cRXP_PICK_Sunhammer's Rifle|r from the ground
    .complete 99162,2 --Sunhammer's Rifle (1)
    .isOnQuest 99162
step
    .goto 1426/0,-1041.12,-5350.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Father Gavin|r
    .turnin 99162 >>Turn in Treacherous Cold
    .target Father Gavin
    .isOnQuest 99162
step
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
    .isOnQuest 95041
step
    .goto 1455/0,-1248.53,-4802.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jemma Quikswitch|r
    .turnin 95041 >>Turn in Data Hoarders
    .target Jemma Quikswitch
    .isOnQuest 95041
step
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step
    .goto 1426/0,-1281.95,-5389.06
    >>Kill |cRXP_ENEMY_Vagash|r and loot |cRXP_LOOT_Fang of Vagash|r
    .complete 314,1 --Fang of Vagash (1)
    .mob Vagash
step
    .goto 1426/0,-1304.61,-5513.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rudra Amberstill|r
    .turnin 314 >>Turn in Protecting the Herd
    .target Rudra Amberstill
step << Human Mage
    .goto 1426/0,-1566.62,-5664.86,0,0
    >>Talk to |cRXP_FRIENDLY_Ghilm|r
    .train 2550 >> Train |T133971:0|t[Cooking]
    .target Cook Ghilm
step << Gnome Mage
    .goto 1426/0,-1566.62,-5664.86,0,0
    >>Talk to |cRXP_FRIENDLY_Ghilm|r
    .train 2550 >> Train |T133971:0|t[Cooking]
    .target Cook Ghilm
step << Human Mage
    >>Grind a little en route
    .goto 1426/0,-1576.47,-5673.07
    .vendor >>Vendor, buy food+water
step << Gnome Mage
    >>Grind a little en route
    .goto 1426/0,-1576.47,-5673.07
    .vendor >>vendor trash. Buy some food/water if needed
step
    .goto 1426/0,-1392.76,-5796.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Earthseer Farsen|r
    .accept 96392 >>Accept Farsen's Watch
    .target Earthseer Farsen
step
    .goto 1426/0,-1392.76,-5796.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Earthseer Farsen|r
    .complete 96392,1 --Earthseer Farsen
    .target Earthseer Farsen
step
    .goto 1426/0,-1392.76,-5796.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Earthseer Farsen|r
    .turnin 96392 >>Turn in Farsen's Watch
    .accept 96390 >>Accept Nip 'Em in the Bud
    .target Earthseer Farsen
step
    .goto 1426/0,-1565.58,-5666.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cook Ghilm|r
    .train 2550 >> Train |T133971:0|t[Cooking]
    .target Cook Ghilm
step << !Human
    .goto 1426/0,-1577.16,-5671.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kazan Mogosh|r
    .vendor >> |cRXP_BUY_Buy|r |T133968:0|t[Freshly Baked Bread] |cRXP_BUY_if needed|r << Warrior/Rogue
    .vendor >> |cRXP_BUY_Buy|r |T133968:0|t[Freshly Baked Bread] |cRXP_BUY_and|r |T132815:0|t[Ice Cold Milk] |cRXP_BUY_if needed|r << !Warrior !Rogue
    .target Kazan Mogosh
    .xp >15,1
step
    .goto 1426/0,-1579.91,-5714.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senator Mehr Stonehallow|r
    .accept 433 >>Accept The Public Servant
    .target Senator Mehr Stonehallow
step
    .goto 1426/0,-1600.11,-5726.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Foreman Stonebrow|r
    .accept 432 >>Accept Those Blasted Troggs!
    .target Foreman Stonebrow
step << Warrior/Paladin/Rogue
    .goto 1426/0,-1612.12,-5697.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dank Drizzlecut|r
    .train 2575 >>Train |T134708:0|t[Mining]
    >>|cRXP_WARN_This is used in conjunction with|r |T136241:0|t[Blacksmithing] |cRXP_WARN_to make|r |T135248:0|t[Rough Sharpening Stones] |cRXP_WARN_and|r |T135255:0|t[Rough Weightstones] |cRXP_WARN_to increase your weapon damage|r
    >>|cRXP_WARN_If you don't want to do this, skip this step|r
    .target Dank Drizzlecut
    .train 2018,3
step
    #loop
    .goto 1426/0,-1577.94,-5784.04,0
    .goto 1426/0,-1577.94,-5784.04,40,0
    .goto 1426/0,-1506.53,-5800.46,40,0
    .goto 1426/0,-1514.90,-5836.25,40,0
    .goto 1426/0,-1546.92,-5825.74,40,0
    .goto 1426/0,-1543.96,-5871.38,40,0
    .goto 1426/0,-1590.26,-5840.52,40,0
    .goto 1426/0,-1615.87,-5791.92,40,0
    .goto 1426/0,-1670.53,-5810.31,40,0
    .goto 1426/0,-1669.55,-5752.52,40,0
    >>Kill |cRXP_ENEMY_Rockjaw Skullthumpers|r
    .complete 432,1 --Rockjaw Skullthumper slain (6)
    .mob Rockjaw Skullthumper
step << Human Mage
    .goto 1426/0,-1589.76,-5714.44,0,0
    >>Talk to |cRXP_FRIENDLY_Frast|r
    .vendor >> Vendor Trash
    .target Frast Dokner
step << Gnome Mage
    .goto 1426/0,-1589.76,-5714.44,0,0
    >>Talk to |cRXP_FRIENDLY_Frast|r
    .vendor >> Vendor Trash
    .target Frast Dokner
step
    .goto 1426/0,-1600.11,-5726.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Foreman Stonebrow|r
    .turnin 432 >>Turn in Those Blasted Troggs! while you are here
    .isQuestComplete 432
    .target Foreman Stonebrow
step
    #loop
    .goto 1426/0,-1678.41,-5736.76,0
    .goto 1426/0,-1678.41,-5736.76,40,0
    .goto 1426/0,-1703.53,-5703.27,40,0
    .goto 1426/0,-1790.21,-5654.68,40,0
    .goto 1426/0,-1788.24,-5589.67,40,0
    .goto 1426/0,-1730.62,-5589.67,40,0
    .goto 1426/0,-1723.72,-5529.58,40,0
    .goto 1426/0,-1656.25,-5607.07,40,0
    .goto 1426/0,-1692.20,-5627.10,40,0
    .goto 1426/0,-1693.19,-5670.11,40,0
    >>Kill |cRXP_ENEMY_Rockjaw Bonesnappers|r
    .complete 433,1 --Rockjaw Bonesnapper slain (10)
    .mob Rockjaw Bonesnapper
step
    .goto 1426/0,-1600.11,-5726.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Foreman Stonebrow|r
    .turnin 432 >>Turn in Those Blasted Troggs!
    .target Foreman Stonebrow
step
    .goto 1426/0,-1579.91,-5714.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senator Mehr Stonehallow|r
    .turnin 433 >>Turn in The Public Servant
    .target Senator Mehr Stonehallow
step << !Warrior !Rogue !Paladin !Hunter
    .goto 1426/0,-1577.16,-5671.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kazan Mogosh|r
    .vendor >> |cRXP_BUY_Buy up to 20|r |T132815:0|t[Ice Cold Milk] |cRXP_BUY_from him|r
    .target Kazan Mogosh
    .xp >15,1
step << Human Mage
    .goto 1426/0,-1612.42,-5698.02
    >>Talk to |cRXP_FRIENDLY_Dank|r
    .train 2575 >> Train |T136248:0|t[Mining]
    .target Dank Drizzlecut
step << Gnome Mage
    .goto 1426/0,-1612.42,-5698.02
    >>Talk to |cRXP_FRIENDLY_Dank|r
    .train 2575 >> Train |T136248:0|t[Mining]
    .target Dank Drizzlecut
step << Human Mage
    .goto 1426/0,-1576.47,-5673.07
    .vendor >>vendor trash, buy x30 level 5 drink from Kazan
    .trainer >> Train Cooking from Ghilm. You'll need this to pick up 2 extra quests later
step << Gnome Mage
    .goto 1426/0,-1576.47,-5673.07
    .vendor >>vendor trash, buy up to 30 level 5 drink from Kazan
    .trainer >> Train Cooking from Ghilm. You'll need this to pick up 2 extra quests later
step
    #completewith Drop96391x1
    >>|cRXP_LOOT_Dark Iron Map|r can drop from |cRXP_ENEMY_Dark Iron Spy|r, |cRXP_ENEMY_Captain Beld|r. Use it to start the quest if you get one
    .collect 274268,1,96391 --Dark Iron Map (1)
    .accept 96391 >>Accept Underground Map
    .use 274268
step
    #label Drop96391x1
    #loop
    .goto 1426/0,-1985.73,-5845.44,0
    .goto 1426/0,-1985.73,-5845.44,40,0
    .goto 1426/0,-2012.82,-5862.51,40,0
    .goto 1426/0,-2007.90,-5890.09,40,0
    .goto 1426/0,-2008.88,-5924.24,40,0
    .goto 1426/0,-2040.89,-5908.15,40,0
    .goto 1426/0,-2049.27,-5886.15,40,0
    .goto 1426/0,-2045.82,-5847.41,40,0
    .goto 1426/0,-2010.85,-5825.08,40,0
    >>Kill |cRXP_ENEMY_Dark Iron Spies|r
    .complete 96390,1 --Dark Iron Spy slain (10)
    .mob Dark Iron Spy
step
    .goto 1426/0,-1392.76,-5796.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Earthseer Farsen|r
    .turnin 96390 >>Turn in Nip 'Em in the Bud
    .target Earthseer Farsen
step
    .goto 1426/0,-1392.76,-5796.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Earthseer Farsen|r
    .turnin 96391 >>Turn in Underground Map
    .target Earthseer Farsen
    .isOnQuest 96391
step
    #loop
    .goto 1426/0,-1662.65,-5594.59,0
    .goto 1426/0,-1662.65,-5594.59,40,0
    .goto 1426/0,-1692.20,-5626.77,40,0
    .goto 1426/0,-1710.92,-5659.60,40,0
    .goto 1426/0,-1748.84,-5683.57,40,0
    .goto 1426/0,-1773.96,-5710.82,40,0
    .goto 1426/0,-1813.36,-5685.54,40,0
    .goto 1426/0,-1772.48,-5645.16,40,0
    .goto 1426/0,-1818.78,-5610.68,40,0
    .goto 1426/0,-1838.97,-5568.66,40,0
    >>Kill |cRXP_ENEMY_Rockjaw Ambushers|r and |cRXP_ENEMY_Rockjaw Backbreakers|r. Loot them for |cRXP_LOOT_Empty Powder Keg|r
    .complete 95213,1 --Empty Powder Keg (1)
    .mob Rockjaw Ambusher
    .mob Rockjaw Backbreaker
step
    .goto 1426/0,-1604.05,-5676.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quarrymaster Thesten|r
    .turnin 95213 >>Turn in Stolen Blasting Powder
    .target Quarrymaster Thesten
    .isOnQuest 95213
step << Shaman
    .goto 1426/0,-2528.96,-5348.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bruegs Kindleborn|r
    .accept 94465 >>Accept Call of Fire
    .target Bruegs Kindleborn
step << Shaman
    .goto 1426/0,-2528.96,-5348.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bruegs Kindleborn|r
    .turnin 94449 >>Turn in Call of Fire
    .target Bruegs Kindleborn
    .isOnQuest 94449
step
    .goto 1426/0,-1604.05,-5676.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quarrymaster Thesten|r
    .accept 95214 >>Accept Stolen Blasting Powder
    .target Quarrymaster Thesten
    .isQuestTurnedIn 95213 --any of: Stolen Blasting Powder
    .xp <7,1
step
    #completewith Drop95213x1
    >>|cRXP_LOOT_Empty Powder Keg|r can drop from |cRXP_ENEMY_Rockjaw Ambusher|r, |cRXP_ENEMY_Rockjaw Backbreaker|r. Use it to start the quest if you get one
    .collect 268548,1,95213 --Empty Powder Keg (1)
    .accept 95213 >>Accept Stolen Blasting Powder
    .use 268548
step
    #label Drop95213x1
    #loop
    .goto 1426/0,-1662.65,-5594.59,0
    .goto 1426/0,-1662.65,-5594.59,40,0
    .goto 1426/0,-1692.20,-5626.77,40,0
    .goto 1426/0,-1710.92,-5659.60,40,0
    .goto 1426/0,-1748.84,-5683.57,40,0
    .goto 1426/0,-1773.96,-5710.82,40,0
    .goto 1426/0,-1813.36,-5685.54,40,0
    .goto 1426/0,-1772.48,-5645.16,40,0
    .goto 1426/0,-1818.78,-5610.68,40,0
    .goto 1426/0,-1838.97,-5568.66,40,0
    >>Kill |cRXP_ENEMY_Rockjaw Ambushers|r and |cRXP_ENEMY_Rockjaw Backbreakers|r. Loot them for |cRXP_LOOT_Stolen Blasting Powder|r
    .complete 95214,1 --Stolen Blasting Powder (16)
    .mob Rockjaw Ambusher
    .mob Rockjaw Backbreaker
    .isOnQuest 95214
step
    .goto 1426/0,-1604.05,-5676.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quarrymaster Thesten|r
    .turnin 95214 >>Turn in Stolen Blasting Powder
    .target Quarrymaster Thesten
    .isOnQuest 95214
step
    .goto 1426/0,-2329.50,-5163.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pilot Hammerfoot|r
    .accept 419 >>Accept The Lost Pilot
    .target Pilot Hammerfoot
step
    .goto 1426/0,-2121.66,-5064.66
    >>Click the |cRXP_PICK_A Dwarven Corpse|r
    .turnin 419 >>Turn in The Lost Pilot
    .accept 417 >>Accept A Pilot's Revenge
step
    .goto 1426/0,-2054.68,-5116.87
    >>Kill |cRXP_ENEMY_Mangeclaw|r and loot |cRXP_LOOT_Mangy Claw|r
    .complete 417,1 --Mangy Claw (1)
    .mob Mangeclaw
step
    .goto 1426/0,-2329.50,-5163.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pilot Hammerfoot|r
    .turnin 417 >>Turn in A Pilot's Revenge
    .target Pilot Hammerfoot
step << Warrior
    #completewith next
    .hs >>Hearth to Innkeeper Belm's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step << Warrior
    .goto 1426/0,-530.40,-5605.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Granis Swiftaxe|r
    .accept 1679 >>Accept Muren Stormpike
    .target Granis Swiftaxe
step << Warrior
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step << Warrior
    .goto 1455/0,-1273.12,-5045.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Muren Stormpike|r
    .turnin 1679 >>Turn in Muren Stormpike
    .accept 1678 >>Accept Vejrek
    .target Muren Stormpike
step << Warrior
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step << Warrior
    .goto 1426/0,431.46,-5780.10
    >>Kill |cRXP_ENEMY_Vejrek|r and loot |cRXP_LOOT_Vejrek's Head|r
    .complete 1678,1 --Vejrek's Head (1)
    .mob Vejrek
step << Warrior
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step << Warrior
    .goto 1455/0,-1273.12,-5045.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Muren Stormpike|r
    .turnin 1678 >>Turn in Vejrek
    .accept 1680 >>Accept Tormus Deepforge
    .target Muren Stormpike
step << Warrior
    .goto 1455/0,-1098.15,-4793.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tormus Deepforge|r
    .turnin 1680 >>Turn in Tormus Deepforge
    .accept 1681 >>Accept Ironband's Compound
    .target Tormus Deepforge
step << Warrior
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step << Warrior
    .goto 1426/0,-2037.45,-5918.00
    >>Open the |cRXP_PICK_Ironband's Strongbox|r. Loot it for |cRXP_LOOT_Umbral Ore|r
    .complete 1681,1 --Umbral Ore (1)
step << Warrior
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step << Warrior
    .goto 1455/0,-1098.15,-4793.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tormus Deepforge|r
    .turnin 1681 >>Turn in Ironband's Compound
    .accept 1682 >>Accept Grey Iron Weapons
    .turnin 1682 >>Turn in Grey Iron Weapons
    .target Tormus Deepforge
step << Warrior
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step << Rogue
    #completewith next
    .hs >>Hearth to Innkeeper Belm's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step << Rogue
    .goto 1426/0,-540.25,-5604.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hogral Bakkan|r
    .accept 2218 >>Accept Road to Salvation
    .target Hogral Bakkan
step << Rogue
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step << Rogue
    .goto 1455/0,-1124.40,-4647.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hulfdan Blackbeard|r
    .turnin 2218 >>Turn in Road to Salvation
    .accept 2238 >>Accept Simple Subterfugin'
    .target Hulfdan Blackbeard
step << Rogue
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step << Rogue
    .goto 1426/0,562.95,-5336.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Onin MacHammar|r
    .turnin 2238 >>Turn in Simple Subterfugin'
    .accept 2239 >>Accept Onin's Report
    .target Onin MacHammar
step << Rogue
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step << Rogue
    .goto 1455/0,-1124.40,-4647.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hulfdan Blackbeard|r
    .turnin 2239 >>Turn in Onin's Report
    .target Hulfdan Blackbeard
step << Rogue
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step << Human Priest/Dwarf Priest
    #completewith next
    .hs >>Hearth to Innkeeper Belm's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step << Human Priest/Dwarf Priest
    .goto 1426/0,-529.41,-5590.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maxan Anvol|r
    .accept 5637 >>Accept Desperate Prayer
    .target Maxan Anvol
step << Human Mage/Gnome Mage
    #completewith next
    .hs >>Hearth to Innkeeper Belm's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step << Human Mage/Gnome Mage
    .goto 1426/0,-537.29,-5587.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magis Sparkmantle|r
    .accept 1879 >>Accept Speak with Bink
    .target Magis Sparkmantle
step << Human Mage/Gnome Mage
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step << Human Mage/Gnome Mage
    .goto 1455/0,-929.04,-4613.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bink|r
    .turnin 1879 >>Turn in Speak with Bink
    .accept 1880 >>Accept Mage-tastic Gizmonitor
    .target Bink
step << Human Mage/Gnome Mage
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step << Human Mage/Gnome Mage
    .goto 1426/0,436.87,-5072.87
    >>Open the |cRXP_PICK_Bink's Toolbox|r. Loot it for |cRXP_LOOT_Mage-tastic Gizmonitor|r
    .complete 1880,1 --Mage-tastic Gizmonitor (1)
step
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step << Human Mage/Gnome Mage
    .goto 1455/0,-929.04,-4613.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bink|r
    .turnin 1880 >>Turn in Mage-tastic Gizmonitor
    .target Bink
step << Warlock
    .goto 1455/0,-1090.17,-4618.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lago Blackwrench|r
    .accept 1715 >>Accept The Slaughtered Lamb
    .target Lago Blackwrench
step << Shaman
    .goto 1455/0,-1085.98,-4642.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eldrun Stormbreaker|r
    .accept 96243 >>Accept Call of Earth
    .target Eldrun Stormbreaker
step
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step << Shaman
    .goto 1426/0,384.18,-6049.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Teo Hammerstorm|r
    .turnin 96243 >>Turn in Call of Earth
    .target Teo Hammerstorm
step << NightElf Hunter
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step << NightElf Hunter
    .goto 1455/0,-1274.07,-5010.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Olmin Burningbeard|r
    .accept 6721 >>Accept The Hunter's Path
    .target Olmin Burningbeard
step << NightElf Hunter
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step << NightElf Priest
    #completewith next
    .hs >>Hearth to Innkeeper Belm's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1426/0,-529.41,-5590.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maxan Anvol|r
    .accept 5630 >>Accept Returning Home << NightElf Priest
    .accept 94824 >>Accept Confounding Flash << Gnome Priest
    .target Maxan Anvol
step
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step << Gnome Priest
    .goto 1455/0,-911.01,-4622.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess Mims|r
    .turnin 94824 >>Turn in Confounding Flash
    .accept 94817 >>Accept Confounding Flash
    .target High Priestess Mims
step << Gnome Priest
    .goto 1455/0,-911.01,-4622.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess Mims|r
    >>|cRXP_WARN_The database has no objectives for Confounding Flash. Skip this step if the quest is not finished|r
    .turnin 94817 >>Turn in Confounding Flash
    .target High Priestess Mims
    .isOnQuest 94817
step
    .goto 1455/0,-1303.71,-4631.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Stormpike|r
    .accept 302 >>Accept Powder to Ironband
    .target Prospector Stormpike
    .isQuestTurnedIn 301 --any of: Report to Ironforge
    .xp <10,1
step
    +|cRXP_WARN_That is all of Dun Morogh for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Darnassus|r: Returning Home << NightElf Priest
    >>|cRXP_FRIENDLY_Loch Modan|r: Stout to Kadrell, Powder to Ironband
    >>|cRXP_FRIENDLY_Loch Modan|r: Return to Brock << Dwarf/Gnome
    >>|cRXP_FRIENDLY_Loch Modan|r: Call of Fire << Shaman
    >>|cRXP_FRIENDLY_Stormwind City|r: The Slaughtered Lamb << Warlock
    >>|cRXP_FRIENDLY_Stormwind City|r: Desperate Prayer << Human Priest/Dwarf Priest
    >>|cRXP_FRIENDLY_Teldrassil|r: The Hunter's Path << NightElf Hunter
    >>|cRXP_FRIENDLY_another zone and back here|r: Secure the Mountain
step
    +|cRXP_WARN_Suggested next zones at level 10|r: |cRXP_FRIENDLY_Zephras Isle|r (about 3.1 levels of quests, starting around Quel'ana Quickgale), |cRXP_FRIENDLY_Westfall|r (about 2.2 levels of quests, starting around Farmer Saldean), |cRXP_FRIENDLY_Darkshore|r (about 1.8 levels of quests, starting around Thundris Windweaver). Completing this step loads the guide for Zephras Isle --RouteBuilder:next
step
    +|cRXP_WARN_The rest of Dun Morogh is planned from level 13.|r Load its guide for level 13 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 1 - 32 Dun Morogh
#subweight -1
#name 13-14 Dun Morogh
--RouteBuilder:next
#next Zone Routes (Alliance)\10-15 Darkshore: around Thundris Windweaver;Zone Routes (Alliance)\11-15 Zephras Isle: around Elegael Thornpaw;Zone Routes (Alliance)\9-12 Teldrassil: around Priestess A'moora

step << Dwarf Paladin
    .goto 1426/0,-542.22,-5586.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Azar Stronghammer|r
    .accept 2997 >>Accept Tome of Divinity
    .target Azar Stronghammer
step << Dwarf Paladin
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step << Dwarf Paladin
    .goto 1455/0,-932.04,-4633.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tiza Battleforge|r
    .turnin 2997 >>Turn in Tome of Divinity
    .target Tiza Battleforge
step << Dwarf Paladin
    .goto 1455/0,-932.04,-4633.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tiza Battleforge|r
    .accept 1647 >>Accept The Tome of Divinity
    .target Tiza Battleforge
    .isQuestTurnedIn 1646 --any of: The Tome of Divinity
    .xp <12,1
step << Dwarf Paladin
    #loop
    .goto 1455/0,-887.92,-4859.85,0
    .goto 1455/0,-887.92,-4859.85,40,0
    .goto 1455/0,-898.12,-4895.62,40,0
    .goto 1455/0,-934.97,-4951.86,40,0
    .goto 1455/0,-1008.65,-5002.56,40,0
    .goto 1455/0,-1052.93,-5012.96,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_John Turner|r. |cRXP_WARN_This NPC walks a patrol route|r
    .turnin 1647 >>Turn in The Tome of Divinity
    .unitscan John Turner
    .isOnQuest 1647
step << Dwarf Paladin
    #loop
    .goto 1455/0,-1052.93,-5012.96,0
    .goto 1455/0,-1052.93,-5012.96,40,0
    .goto 1455/0,-1008.65,-5002.56,40,0
    .goto 1455/0,-934.97,-4951.86,40,0
    .goto 1455/0,-898.12,-4895.62,40,0
    .goto 1455/0,-887.92,-4859.85,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_John Turner|r. |cRXP_WARN_This NPC walks a patrol route|r
    .accept 1648 >>Accept The Tome of Divinity
    .unitscan John Turner
    .isQuestTurnedIn 1647 --any of: The Tome of Divinity
    .xp <12,1
step << Dwarf Paladin
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step << Dwarf Paladin
    #loop
    .goto 1426/0,-1703.53,-5533.52,0
    .goto 1426/0,-1703.53,-5533.52,40,0
    .goto 1426/0,-1749.33,-5513.17,40,0
    .goto 1426/0,-1793.17,-5632.35,40,0
    .goto 1426/0,-1741.45,-5586.06,40,0
    >>Loot the |cRXP_PICK_Battered Chests|r for |cRXP_LOOT_Linen Cloth|r
    .complete 1648,1 --Linen Cloth (10)
    .isOnQuest 1648
step
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step << Dwarf Paladin
    #loop
    .goto 1455/0,-1052.93,-5012.96,0
    .goto 1455/0,-1052.93,-5012.96,40,0
    .goto 1455/0,-1008.65,-5002.56,40,0
    .goto 1455/0,-934.97,-4951.86,40,0
    .goto 1455/0,-898.12,-4895.62,40,0
    .goto 1455/0,-887.92,-4859.85,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_John Turner|r. |cRXP_WARN_This NPC walks a patrol route|r
    .turnin 1648 >>Turn in The Tome of Divinity
    .unitscan John Turner
    .isOnQuest 1648
step << Dwarf Paladin
    #loop
    .goto 1455/0,-1052.93,-5012.96,0
    .goto 1455/0,-1052.93,-5012.96,40,0
    .goto 1455/0,-1008.65,-5002.56,40,0
    .goto 1455/0,-934.97,-4951.86,40,0
    .goto 1455/0,-898.12,-4895.62,40,0
    .goto 1455/0,-887.92,-4859.85,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_John Turner|r. |cRXP_WARN_This NPC walks a patrol route|r
    .accept 1778 >>Accept The Tome of Divinity
    .unitscan John Turner
    .isQuestTurnedIn 1648 --any of: The Tome of Divinity
    .xp <12,1
step << Dwarf Paladin
    .goto 1455/0,-932.04,-4633.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tiza Battleforge|r
    .turnin 1778 >>Turn in The Tome of Divinity
    .target Tiza Battleforge
    .isOnQuest 1778
step << Dwarf Paladin
    .goto 1455/0,-932.04,-4633.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tiza Battleforge|r
    .accept 1779 >>Accept The Tome of Divinity
    .target Tiza Battleforge
    .isQuestTurnedIn 1778 --any of: The Tome of Divinity
    .xp <12,1
step << Dwarf Paladin
    .goto 1455/0,-899.70,-4613.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Muiredon Battleforge|r
    .turnin 1779 >>Turn in The Tome of Divinity
    .target Muiredon Battleforge
    .isOnQuest 1779
step << Dwarf Paladin
    .goto 1455/0,-899.70,-4613.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Muiredon Battleforge|r
    .accept 1783 >>Accept The Tome of Divinity
    .target Muiredon Battleforge
    .isQuestTurnedIn 1779 --any of: The Tome of Divinity
    .xp <12,1
step
    .goto 1455/0,-1260.55,-4835.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gnoarn|r
    .accept 2039 >>Accept Find Bingles
    .target Gnoarn
step << Human Paladin
    .goto 1455/0,-896.46,-4601.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brandur Ironhammer|r
    .accept 3681 >>Accept Tome of Divinity
    .target Brandur Ironhammer
step
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step << Dwarf Paladin
    .goto 1426/0,-2055.18,-5784.37
    >>Kill |cRXP_ENEMY_Narm Faulk|r
    .complete 1783,1 --Narm Faulk slain (1)
    .mob Narm Faulk
    .isOnQuest 1783
step << Dwarf Paladin
    .goto 1426/0,-2055.18,-5784.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Narm Faulk|r
    .turnin 1783 >>Turn in The Tome of Divinity
    .target Narm Faulk
    .isOnQuest 1783
step << Dwarf Paladin
    .goto 1426/0,-2055.18,-5784.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Narm Faulk|r
    .accept 1784 >>Accept The Tome of Divinity
    .target Narm Faulk
    .isQuestTurnedIn 1783 --any of: The Tome of Divinity
    .xp <12,1
step << Dwarf Paladin
    #loop
    .goto 1426/0,-2010.85,-5825.08,0
    .goto 1426/0,-2010.85,-5825.08,40,0
    .goto 1426/0,-1985.73,-5845.44,40,0
    .goto 1426/0,-2012.82,-5862.51,40,0
    .goto 1426/0,-2007.90,-5890.09,40,0
    .goto 1426/0,-2008.88,-5924.24,40,0
    .goto 1426/0,-2040.89,-5908.15,40,0
    .goto 1426/0,-2049.27,-5886.15,40,0
    .goto 1426/0,-2045.82,-5847.41,40,0
    >>Kill |cRXP_ENEMY_Dark Iron Spy|r and loot |cRXP_LOOT_Dark Iron Script|r
    .complete 1784,1 --Dark Iron Script (1)
    .mob Dark Iron Spy
    .isOnQuest 1784
step << Rogue
    .goto 1455/0,-1197.27,-5041.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Buliwyf Stonehand|r inside
    .train 196 >> Train 1h Axes
    .target Buliwyf Stonehand
step << Paladin
    .goto 1455/0,-907.69,-4592.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Beldruk Doombrow|r
    .trainer >> Train your class spells
    .target Beldruk Doombrow
step
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step << Dwarf Paladin
    .goto 1455/0,-899.70,-4613.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Muiredon Battleforge|r
    .turnin 1784 >>Turn in The Tome of Divinity
    .target Muiredon Battleforge
    .isOnQuest 1784
step << Dwarf Paladin
    .goto 1455/0,-899.70,-4613.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Muiredon Battleforge|r
    .accept 1785 >>Accept The Tome of Divinity
    .target Muiredon Battleforge
    .isQuestTurnedIn 1784 --any of: The Tome of Divinity
    .xp <12,1
step << Dwarf Paladin
    .goto 1455/0,-932.04,-4633.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tiza Battleforge|r
    .turnin 1785 >>Turn in The Tome of Divinity
    .target Tiza Battleforge
    .isOnQuest 1785
step << Mage
    .goto 1455/0,-928.48,-4614.620
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dink|r
    .trainer >> Train your class spells
    .target Dink
step << Priest
    .goto 1455/0,-912.88,-4625.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Toldren Deepiron|r
    .trainer >> Train your class spells
    .target Toldren Deepiron
step << Rogue
    .goto 1455/0,-1120.72,-4650.120
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fenthwick|r
    .trainer >> Train your class spells
    .target Fenthwick
step << Warlock
    .goto 1455/0,-1117.60,-4615.14,15,0
    .goto 1455/0,-1111.62,-4599.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Briarthorn|r
    .trainer >> Train your class spells
    .target Briarthorn
step << Warlock
    .goto 1455/0,-1130.26,-4601.270
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jubahl Corpseseeker|r
    .vendor 6382 >> |cRXP_BUY_Buy|r |T133738:0|t[Grimoire of Consume Shadows (Rank 1)] |cRXP_BUY_and|r |T133738:0|t[Grimoire of Sacrifice (Rank 1)] |cRXP_BUY_if you can afford it|r
    .target Jubahl Corpseseeker
step << Warrior
    .goto 1455/0,-1234.65,-5035.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bilban Tosslespanner|r
    .trainer >> Train your class spells
    .target Bilban Tosslespanner
step << Gnome Priest
    .goto 1455/0,-911.01,-4622.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess Mims|r
    .turnin 94817 >>Turn in Confounding Flash
    .target High Priestess Mims
    .isOnQuest 94817
step
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step
    .goto 1426/0,-317.14,-5506.27
    >>Click the |cRXP_PICK_Mountaineer Cornelius|r
    .complete 98319,1 --Mountaineer Cornelius
    .isOnQuest 98319
step
    .goto 1426/0,-369.84,-5750.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Gretchen|r
    .turnin 98319 >>Turn in Secure the Mountain
    .target Mountaineer Gretchen
    .isQuestComplete 98319
step
    +|cRXP_WARN_That is all of Dun Morogh for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Loch Modan|r: Find Bingles
    >>|cRXP_FRIENDLY_Stormwind City|r: Tome of Divinity << Human Paladin
step
    +|cRXP_WARN_Suggested next zones at level 13|r: |cRXP_FRIENDLY_Darkshore|r (about 2.1 levels of quests, starting around Thundris Windweaver), |cRXP_FRIENDLY_Zephras Isle|r (about 1.3 levels of quests, starting around Elegael Thornpaw), |cRXP_FRIENDLY_Teldrassil|r (about 1.1 levels of quests, starting around Priestess A'moora). Completing this step loads the guide for Darkshore --RouteBuilder:next
step
    +|cRXP_WARN_The rest of Dun Morogh is planned from level 16.|r Load its guide for level 16 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 1 - 32 Dun Morogh
#subweight -1
#name 16-17 Dun Morogh
--RouteBuilder:next
#next Zone Routes (Alliance)\10-15 Darkshore: around Thundris Windweaver;Zone Routes (Alliance)\11-15 Zephras Isle: around Elegael Thornpaw;Zone Routes (Alliance)\14-16 Loch Modan: around Marek Ironheart

step << Human Mage/Gnome Mage
    .goto 1426/0,-537.29,-5587.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magis Sparkmantle|r
    .accept 1919 >>Accept Report to Jennea
    .target Magis Sparkmantle
step
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step
    .goto 1455/0,-1260.55,-4835.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gnoarn|r
    .accept 2041 >>Accept Speak with Shoni
    .target Gnoarn
step << Gnome Priest
    .goto 1455/0,-911.01,-4622.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess Mims|r
    .turnin 94817 >>Turn in Confounding Flash
    .target High Priestess Mims
    .isOnQuest 94817
step
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step
    .goto 1426/0,-317.14,-5506.27
    >>Click the |cRXP_PICK_Mountaineer Cornelius|r
    .complete 98319,1 --Mountaineer Cornelius
    .isOnQuest 98319
step
    .goto 1426/0,-369.84,-5750.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Gretchen|r
    .turnin 98319 >>Turn in Secure the Mountain
    .target Mountaineer Gretchen
    .isQuestComplete 98319
step
    +|cRXP_WARN_That is all of Dun Morogh for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Stormwind City|r: Report to Jennea << Human Mage/Gnome Mage
    >>|cRXP_FRIENDLY_Stormwind City|r: Speak with Shoni
step
    +|cRXP_WARN_Suggested next zones at level 16|r: |cRXP_FRIENDLY_Darkshore|r (about 1.6 levels of quests, starting around Thundris Windweaver), |cRXP_FRIENDLY_Zephras Isle|r (about 0.9 levels of quests, starting around Elegael Thornpaw), |cRXP_FRIENDLY_Loch Modan|r (about 0.7 levels of quests, starting around Marek Ironheart). Completing this step loads the guide for Darkshore --RouteBuilder:next
step
    +|cRXP_WARN_The rest of Dun Morogh is planned from level 19.|r Load its guide for level 19 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 1 - 32 Dun Morogh
#subweight -1
#name 19-20 Dun Morogh
--RouteBuilder:next
#next Zone Routes (Alliance)\17-19 Darkshore: around Archaeologist Hollee;Zone Routes (Alliance)\20-21 Wetlands: around Karl Boran

step << Rogue
    .goto 1426/0,-540.25,-5604.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hogral Bakkan|r
    .accept 2299 >>Accept To Hulfdan!
    .target Hogral Bakkan
step
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step << Rogue
    .goto 1455/0,-1124.40,-4647.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hulfdan Blackbeard|r
    .turnin 2299 >>Turn in To Hulfdan!
    .accept 2298 >>Accept Kingly Shakedown
    .target Hulfdan Blackbeard
step
    .goto 1455/0,-1283.47,-4842.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lomac Gearstrip|r
    .accept 1074 >>Accept Ineptitude + Chemicals = Fun
    .target Lomac Gearstrip
    .isQuestTurnedIn 1073 --any of: Ineptitude + Chemicals = Fun
    .xp <17,1
step
    .goto 1455/0,-1283.47,-4842.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lomac Gearstrip|r
    .accept 1073 >>Accept Ineptitude + Chemicals = Fun
    .target Lomac Gearstrip
    .isQuestTurnedIn 1072 --any of: An Old Colleague
    .xp <17,1
step
    .goto 1455/0,-1283.47,-4842.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lomac Gearstrip|r
    .turnin 1073 >>Turn in Ineptitude + Chemicals = Fun
    .target Lomac Gearstrip
    .isQuestComplete 1073
step
    .goto 1455/0,-1314.47,-4624.11
    >>Click the |cRXP_PICK_Library Book|r
    .accept 79091 >>Accept Archmage Antonidas: The Unabridged Autobiography
step
    .goto 1455/0,-1314.47,-4624.11
    >>Open the |cRXP_PICK_Library Book|r. Loot it for |cRXP_LOOT_Archmage Antonidas: The Unabridged Autobiography|r
    .complete 79091,1 --Archmage Antonidas: The Unabridged Autobiography (1)
step << Gnome Priest
    .goto 1455/0,-911.01,-4622.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess Mims|r
    .turnin 94817 >>Turn in Confounding Flash
    .target High Priestess Mims
    .isOnQuest 94817
step
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step
    .goto 1426/0,-317.14,-5506.27
    >>Click the |cRXP_PICK_Mountaineer Cornelius|r
    .complete 98319,1 --Mountaineer Cornelius
    .isOnQuest 98319
step
    .goto 1426/0,-369.84,-5750.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Gretchen|r
    .turnin 98319 >>Turn in Secure the Mountain
    .target Mountaineer Gretchen
    .isQuestComplete 98319
step
    +|cRXP_WARN_That is all of Dun Morogh for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Stonetalon Mountains|r: Ineptitude + Chemicals = Fun
    >>|cRXP_FRIENDLY_Stormwind City|r: Kingly Shakedown << Rogue
    >>|cRXP_FRIENDLY_Undercity|r: Archmage Antonidas: The Unabridged Autobiography
step
    +|cRXP_WARN_Suggested next zones at level 19|r: |cRXP_FRIENDLY_Darkshore|r (about 0.8 levels of quests, starting around Archaeologist Hollee), |cRXP_FRIENDLY_Wetlands|r (about 0.7 levels of quests, starting around Karl Boran). Completing this step loads the guide for Darkshore --RouteBuilder:next
step
    +|cRXP_WARN_The rest of Dun Morogh is planned from level 22.|r Load its guide for level 22 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 1 - 32 Dun Morogh
#subweight -1
#name 22-23 Dun Morogh
--RouteBuilder:next
#next Zone Routes (Alliance)\20-21 Wetlands: around Karl Boran

step
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step << Warlock
    .goto 1455/0,-1090.17,-4618.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lago Blackwrench|r
    .accept 1717 >>Accept Gakin's Summons
    .target Lago Blackwrench
step << Shaman
    .goto 1455/0,-1085.98,-4642.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eldrun Stormbreaker|r
    .accept 94494 >>Accept Call of Water
    .target Eldrun Stormbreaker
step
    .goto 1455/0,-909.11,-4612.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priest Rohan|r
    .accept 5677 >>Accept Arcane Feedback << Human Priest
    .accept 5641 >>Accept A Lack of Fear << Dwarf Priest
    .accept 5675 >>Accept Elune's Grace << NightElf Priest
    .target High Priest Rohan
step << Dwarf Priest
    .goto 1455/0,-909.11,-4612.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priest Rohan|r
    >>|cRXP_WARN_The database has no objectives for A Lack of Fear. Skip this step if the quest is not finished|r
    .turnin 5641 >>Turn in A Lack of Fear
    .target High Priest Rohan
    .isOnQuest 5641
step << Warrior
    .goto 1455/0,-1250.58,-4812.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Klockmort Spannerspan|r
    .accept 1709 >>Accept Klockmort's Creation
    .target Klockmort Spannerspan
    .isQuestTurnedIn 1708 --any of: Iron Coral
    .xp <20,1
step << Warrior
    .goto 1455/0,-1250.58,-4812.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Klockmort Spannerspan|r
    .turnin 1709 >>Turn in Klockmort's Creation
    .target Klockmort Spannerspan
    .isOnQuest 1709
step << Warrior
    .goto 1455/0,-1250.58,-4812.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Klockmort Spannerspan|r
    .accept 1708 >>Accept Iron Coral
    .target Klockmort Spannerspan
    .isQuestTurnedIn 1782 --any of: Furen's Armor
    .xp <20,1
step
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step << Human Paladin/Dwarf Paladin
    .goto 1426/0,-783.05,-5089.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jordan Stilwell|r
    .accept 1806 >>Accept The Test of Righteousness
    .target Jordan Stilwell
    .isQuestTurnedIn 1654 --any of: The Test of Righteousness
    .xp <20,1
step << Human Paladin/Dwarf Paladin
    .goto 1426/0,-783.05,-5089.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jordan Stilwell|r
    .turnin 1806 >>Turn in The Test of Righteousness
    .target Jordan Stilwell
    .isOnQuest 1806
step << Human Paladin/Dwarf Paladin
    .goto 1426/0,-783.05,-5089.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jordan Stilwell|r
    .accept 1654 >>Accept The Test of Righteousness
    .target Jordan Stilwell
    .isQuestTurnedIn 1653 --any of: The Test of Righteousness
    .xp <20,1
step << Human Paladin/Dwarf Paladin
    .goto 1426/0,-783.05,-5089.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jordan Stilwell|r
    .turnin 1654 >>Turn in The Test of Righteousness
    .target Jordan Stilwell
    .isQuestComplete 1654
step
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step << Gnome Priest
    .goto 1455/0,-911.01,-4622.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess Mims|r
    .turnin 94817 >>Turn in Confounding Flash
    .target High Priestess Mims
    .isOnQuest 94817
step
    .goto 1455/0,-1260.55,-4835.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gnoarn|r
    .accept 2927 >>Accept The Day After
    .target Gnoarn
step << Warrior
    .goto 1455/0,-1250.58,-4812.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Klockmort Spannerspan|r
    .turnin 1708 >>Turn in Iron Coral
    .target Klockmort Spannerspan
    .isQuestComplete 1708
step << Warrior
    .goto 1455/0,-1269.72,-5047.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kelv Sternhammer|r
    .accept 1698 >>Accept Yorus Barleybrew
    .target Kelv Sternhammer
step
    .goto 1455/0,-1288.61,-5065.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pilot Longbeard|r
    .accept 467 >>Accept Stonegear's Search
    .target Pilot Longbeard
step
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step
    .goto 1426/0,-641.70,-5473.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pilot Stonegear|r
    .turnin 467 >>Turn in Stonegear's Search
    .accept 466 >>Accept Search for Incendicite
    .target Pilot Stonegear
step
    .goto 1426/0,-641.70,-5473.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pilot Stonegear|r
    .turnin 466 >>Turn in Search for Incendicite
    .target Pilot Stonegear
    .isQuestComplete 466
step
    .goto 1426/0,-458.00,-5498.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ozzie Togglevolt|r
    .turnin 2927 >>Turn in The Day After
    .target Ozzie Togglevolt
step
    .goto 1426/0,-317.14,-5506.27
    >>Click the |cRXP_PICK_Mountaineer Cornelius|r
    .complete 98319,1 --Mountaineer Cornelius
    .isOnQuest 98319
step
    .goto 1426/0,-369.84,-5750.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Gretchen|r
    .turnin 98319 >>Turn in Secure the Mountain
    .target Mountaineer Gretchen
    .isQuestComplete 98319
step
    +|cRXP_WARN_That is all of Dun Morogh for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Darnassus|r: Elune's Grace << NightElf Priest
    >>|cRXP_FRIENDLY_Loch Modan|r: Call of Water << Shaman
    >>|cRXP_FRIENDLY_Redridge Mountains|r: Yorus Barleybrew << Warrior
    >>|cRXP_FRIENDLY_Stormwind City|r: Gakin's Summons << Warlock
    >>|cRXP_FRIENDLY_Stormwind City|r: Arcane Feedback << Human Priest
    >>|cRXP_FRIENDLY_Wetlands and back here|r: Search for Incendicite
step
    +|cRXP_WARN_Suggested next zones at level 22|r: |cRXP_FRIENDLY_Wetlands|r (about 0.5 levels of quests, starting around Karl Boran). Completing this step loads the guide for Wetlands --RouteBuilder:next
step
    +|cRXP_WARN_The rest of Dun Morogh is planned from level 25.|r Load its guide for level 25 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 1 - 32 Dun Morogh
#subweight -1
#name 25-26 Dun Morogh
--RouteBuilder:next
#next Zone Routes (Alliance)\23-24 Wetlands: around Captain Stoutfist

step
    .goto 1426/0,-458.00,-5498.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ozzie Togglevolt|r
    .accept 2926 >>Accept Gnogaine
    .target Ozzie Togglevolt
step
    .goto 1426/0,-641.70,-5473.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pilot Stonegear|r
    .turnin 466 >>Turn in Search for Incendicite
    .target Pilot Stonegear
    .isQuestComplete 466
step
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step
    .goto 1455/0,-1263.47,-4834.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tinkmaster Overspark|r
    .accept 2922 >>Accept Save Techbot's Brain!
    .target Tinkmaster Overspark
step
    .goto 1455/0,-1250.58,-4812.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Klockmort Spannerspan|r
    .accept 2924 >>Accept Essential Artificials
    .target Klockmort Spannerspan
step << Rogue
    .goto 1455/0,-1131.75,-4648.43
    >>Kill |cRXP_ENEMY_Hulfdan Blackbeard|r and loot |cRXP_LOOT_Elegant Letter|r. Use it to start the quest
    .collect 17126,1,6681 --Elegant Letter (1)
    .accept 6681 >>Accept The Manor, Ravenholdt
    .use 17126
    .mob Hulfdan Blackbeard
step << Dwarf Priest
    .goto 1455/0,-909.11,-4612.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priest Rohan|r
    .turnin 5641 >>Turn in A Lack of Fear
    .target High Priest Rohan
    .isOnQuest 5641
step << Gnome Priest
    .goto 1455/0,-911.01,-4622.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess Mims|r
    .turnin 94817 >>Turn in Confounding Flash
    .target High Priestess Mims
    .isOnQuest 94817
step
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step
    #loop
    .goto 1426/0,714.15,-4998.01,0
    .goto 1426/0,714.15,-4998.01,40,0
    .goto 1426/0,727.94,-4934.32,40,0
    .goto 1426/0,827.92,-4925.45,40,0
    >>Kill |cRXP_ENEMY_Irradiated Invader|r and loot |cRXP_LOOT_Full Leaden Collection Phial|r
    >>Kill |cRXP_ENEMY_Techbot|r and loot |cRXP_LOOT_Techbot's Memory Core|r
    .complete 2926,1 --Full Leaden Collection Phial (1)
    .complete 2922,1 --Techbot's Memory Core (1)
    .mob Irradiated Invader
    .mob Techbot
step
    .goto 1426/0,-458.00,-5498.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ozzie Togglevolt|r
    .turnin 2926 >>Turn in Gnogaine
    .accept 2962 >>Accept The Only Cure is More Green Glow
    .target Ozzie Togglevolt
step
    .goto 1426/0,-458.00,-5498.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ozzie Togglevolt|r
    .turnin 2962 >>Turn in The Only Cure is More Green Glow
    .target Ozzie Togglevolt
    .isQuestComplete 2962
step
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step
    .goto 1455/0,-1263.47,-4834.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tinkmaster Overspark|r
    .turnin 2922 >>Turn in Save Techbot's Brain!
    .target Tinkmaster Overspark
step
    .goto 1455/0,-1250.58,-4812.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Klockmort Spannerspan|r
    .turnin 2924 >>Turn in Essential Artificials
    .target Klockmort Spannerspan
    .isQuestComplete 2924
step
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step
    .goto 1426/0,-317.14,-5506.27
    >>Click the |cRXP_PICK_Mountaineer Cornelius|r
    .complete 98319,1 --Mountaineer Cornelius
    .isOnQuest 98319
step
    .goto 1426/0,-369.84,-5750.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Gretchen|r
    .turnin 98319 >>Turn in Secure the Mountain
    .target Mountaineer Gretchen
    .isQuestComplete 98319
step
    +|cRXP_WARN_That is all of Dun Morogh for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Alterac Mountains|r: The Manor, Ravenholdt << Rogue
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Essential Artificials, The Only Cure is More Green Glow
step
    +|cRXP_WARN_Suggested next zones at level 25|r: |cRXP_FRIENDLY_Wetlands|r (about 0.6 levels of quests, starting around Captain Stoutfist). Completing this step loads the guide for Wetlands --RouteBuilder:next
step
    +|cRXP_WARN_The rest of Dun Morogh is planned from level 28.|r Load its guide for level 28 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 1 - 32 Dun Morogh
#subweight -1
#name 28-29 Dun Morogh

step
    .goto 1426/0,-458.00,-5498.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ozzie Togglevolt|r
    .turnin 2962 >>Turn in The Only Cure is More Green Glow
    .target Ozzie Togglevolt
    .isQuestComplete 2962
step
    .goto 1426/0,-641.70,-5473.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pilot Stonegear|r
    .turnin 466 >>Turn in Search for Incendicite
    .target Pilot Stonegear
    .isQuestComplete 466
step
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step
    .goto 1455/0,-1022.25,-5033.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grand Mason Marblesten|r
    .accept 700 >>Accept A King's Tribute
    .target Grand Mason Marblesten
    .isQuestTurnedIn 689 --any of: A King's Tribute
    .xp <25,1
step
    .goto 1455/0,-1022.65,-4865.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_King Magni Bronzebeard|r
    .turnin 700 >>Turn in A King's Tribute
    .target King Magni Bronzebeard
    .isOnQuest 700
step
    .goto 1455/0,-1250.58,-4812.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Klockmort Spannerspan|r
    .turnin 2924 >>Turn in Essential Artificials
    .target Klockmort Spannerspan
    .isQuestComplete 2924
step
    .goto 1455/0,-1265.68,-4823.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Mechanic Castpipe|r
    .accept 2930 >>Accept Data Rescue
    .target Master Mechanic Castpipe
step
    .goto 1455/0,-1265.68,-4823.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Mechanic Castpipe|r
    .turnin 2930 >>Turn in Data Rescue
    .target Master Mechanic Castpipe
    .isQuestComplete 2930
step << Human Mage/Gnome Mage
    .goto 1455/0,-929.04,-4613.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bink|r
    .accept 1939 >>Accept High Sorcerer Andromath
    .target Bink
step << Mage
    .goto 1455/0,-961.29,-4715.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ginny Longberry|r
    .vendor >> |cRXP_BUY_Buy 3|r |T134419:0|t[Rune of Teleportation] |cRXP_BUY_from her|r
    .collect 17031,3
    .target Ginny Longberry
step << !Druid !Warrior !Hunter !Mage !Priest !Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Briarthorn|r << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brandur Ironhammer|r << Paladin
    .goto 1455/0,-1117.60,-4615.14,15,0 << Warlock
    .goto 1455/0,-1111.62,-4599.09 << Warlock
    .goto 1455/0,-896.55,-4601.68 << Paladin
    .trainer >> Train your class spells
    .target Briarthorn << Warlock
    .target Brandur Ironhammer << Paladin
step << Warlock
    .goto 1455/0,-1134.20,-4610.39,15,0
    .goto 1455/0,-1130.26,-4601.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jubahl Corpseseeker|r
    .vendor >> |cRXP_BUY_Buy|r |T133738:0|t[Grimoires] |cRXP_BUY_for your|r |T136220:0|t[Succubus] |cRXP_BUY_or your|r |T136221:0|t[Voidwalker]
    .target Jubahl Corpseseeker
step
    .goto 1455/0,-1215.64,-4924.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sara Balloo|r
    .accept 683 >>Accept Sara Balloo's Plea
    .target Sara Balloo
    .isQuestTurnedIn 637 --any of: Sully Balloo's Letter
    .xp <25,1
step
    .goto 1455/0,-1022.65,-4865.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_King Magni Bronzebeard|r
    .turnin 683 >>Turn in Sara Balloo's Plea
    .target King Magni Bronzebeard
    .isOnQuest 683
step
    .goto 1455/0,-1022.65,-4865.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_King Magni Bronzebeard|r
    .accept 686 >>Accept A King's Tribute
    .target King Magni Bronzebeard
    .isQuestTurnedIn 683 --any of: Sara Balloo's Plea
    .xp <25,1
step
    .goto 1455/0,-1022.25,-5033.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grand Mason Marblesten|r
    .turnin 686 >>Turn in A King's Tribute
    .target Grand Mason Marblesten
    .isOnQuest 686
step
    .goto 1455/0,-1022.25,-5033.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grand Mason Marblesten|r
    .accept 689 >>Accept A King's Tribute
    .target Grand Mason Marblesten
    .isQuestTurnedIn 686 --any of: A King's Tribute
    .xp <25,1
step
    .goto 1455/0,-1022.25,-5033.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grand Mason Marblesten|r
    .turnin 689 >>Turn in A King's Tribute
    .target Grand Mason Marblesten
    .isQuestComplete 689
step << Dwarf Priest
    .goto 1455/0,-909.11,-4612.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priest Rohan|r
    .turnin 5641 >>Turn in A Lack of Fear
    .target High Priest Rohan
    .isOnQuest 5641
step << Gnome Priest
    .goto 1455/0,-911.01,-4622.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess Mims|r
    .turnin 94817 >>Turn in Confounding Flash
    .target High Priestess Mims
    .isOnQuest 94817
step
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step
    #loop
    .goto 1426/0,642.25,-5154.30,0
    .goto 1426/0,642.25,-5154.30,40,0
    .goto 1426/0,661.95,-5174.33,40,0
    .goto 1426/0,730.90,-5164.48,40,0
    .goto 1426/0,724.99,-5143.46,40,0
    .goto 1426/0,692.48,-5161.52,40,0
    .goto 1426/0,686.57,-5163.16,40,0
    .goto 1426/0,678.20,-5159.88,40,0
    >>Kill |cRXP_ENEMY_Caverndeep Invaders|r, |cRXP_ENEMY_Caverndeep Looters|r, |cRXP_ENEMY_Caverndeep Pillagers|r and |cRXP_ENEMY_Irradiated Invaders|r. Loot them for |cRXP_LOOT_White Punch Card|r
    .collect 9279,1,2930,1 --White Punch Card (1)
    .mob Caverndeep Invader
    .mob Caverndeep Looter
    .mob Caverndeep Pillager
    .mob Irradiated Invader
step
    .goto 1426/0,-317.14,-5506.27
    >>Click the |cRXP_PICK_Mountaineer Cornelius|r
    .complete 98319,1 --Mountaineer Cornelius
    .isOnQuest 98319
step
    .goto 1426/0,-369.84,-5750.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Gretchen|r
    .turnin 98319 >>Turn in Secure the Mountain
    .target Mountaineer Gretchen
    .isQuestComplete 98319
step
    +|cRXP_WARN_That is all of Dun Morogh for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Stormwind City|r: High Sorcerer Andromath << Human Mage/Gnome Mage
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Data Rescue
step
    +|cRXP_WARN_The rest of Dun Morogh is planned from level 31.|r Load its guide for level 31 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 1 - 32 Dun Morogh
#subweight -1
#name 31-32 Dun Morogh

step << Warrior
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step << Warrior
    .goto 1455/0,-1269.72,-5047.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kelv Sternhammer|r
    .accept 1718 >>Accept The Islander
    .target Kelv Sternhammer
step << Warrior
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step
    #loop
    .goto 1426/0,642.25,-5154.30,0
    .goto 1426/0,642.25,-5154.30,40,0
    .goto 1426/0,661.95,-5174.33,40,0
    .goto 1426/0,730.90,-5164.48,40,0
    .goto 1426/0,724.99,-5143.46,40,0
    .goto 1426/0,692.48,-5161.52,40,0
    .goto 1426/0,686.57,-5163.16,40,0
    .goto 1426/0,678.20,-5159.88,40,0
    >>Kill |cRXP_ENEMY_Caverndeep Invaders|r, |cRXP_ENEMY_Caverndeep Looters|r, |cRXP_ENEMY_Caverndeep Pillagers|r and |cRXP_ENEMY_Irradiated Invaders|r. Loot them for |cRXP_LOOT_White Punch Card|r
    .collect 9279,1,2930,1 --White Punch Card (1)
    .mob Caverndeep Invader
    .mob Caverndeep Looter
    .mob Caverndeep Pillager
    .mob Irradiated Invader
    .isOnQuest 2930
step
    #completewith next
    .zone 1455 >>Travel to Ironforge
    .zoneskip 1455
step << Dwarf Priest
    .goto 1455/0,-909.11,-4612.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priest Rohan|r
    .turnin 5641 >>Turn in A Lack of Fear
    .target High Priest Rohan
    .isOnQuest 5641
step << Gnome Priest
    .goto 1455/0,-911.01,-4622.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Priestess Mims|r
    .turnin 94817 >>Turn in Confounding Flash
    .target High Priestess Mims
    .isOnQuest 94817
step
    .goto 1455/0,-1250.58,-4812.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Klockmort Spannerspan|r
    .turnin 2924 >>Turn in Essential Artificials
    .target Klockmort Spannerspan
    .isQuestComplete 2924
step
    .goto 1455/0,-1265.68,-4823.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Mechanic Castpipe|r
    .turnin 2930 >>Turn in Data Rescue
    .target Master Mechanic Castpipe
    .isQuestComplete 2930
step
    .goto 1455/0,-1288.61,-5065.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pilot Longbeard|r
    .accept 1179 >>Accept The Brassbolts Brothers
    .target Pilot Longbeard
step << Warlock
    .goto 1455/0,-1300.16,-4618.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krom Stoutarm|r
    .accept 1802 >>Accept Tome of the Cabal
    .target Krom Stoutarm
    .isQuestTurnedIn 1758 --any of: Tome of the Cabal
    .xp <30,1
step << Warlock
    .goto 1455/0,-1300.16,-4618.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krom Stoutarm|r
    .accept 1804 >>Accept Tome of the Cabal
    .target Krom Stoutarm
    .isQuestTurnedIn 1802 --any of: Tome of the Cabal
    .xp <30,1
step << Warlock
    .goto 1455/0,-1300.16,-4618.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krom Stoutarm|r
    .turnin 1802 >>Turn in Tome of the Cabal
    .target Krom Stoutarm
    .isQuestComplete 1802
step << Warlock
    .goto 1455/0,-1090.17,-4618.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lago Blackwrench|r
    .accept 1798 >>Accept Seeking Strahad
    .target Lago Blackwrench
step << Shaman
    .goto 1455/0,-1085.98,-4642.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eldrun Stormbreaker|r
    .accept 94789 >>Accept Call of Air
    .target Eldrun Stormbreaker
step
    #completewith next
    .zone 1426 >>Leave Ironforge for Dun Morogh
    .zoneskip 1426
step
    .goto 1426/0,-641.70,-5473.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pilot Stonegear|r
    .turnin 466 >>Turn in Search for Incendicite
    .target Pilot Stonegear
    .isQuestComplete 466
step
    .goto 1426/0,-458.00,-5498.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ozzie Togglevolt|r
    .turnin 2962 >>Turn in The Only Cure is More Green Glow
    .target Ozzie Togglevolt
    .isQuestComplete 2962
step
    .goto 1426/0,-317.14,-5506.27
    >>Click the |cRXP_PICK_Mountaineer Cornelius|r
    .complete 98319,1 --Mountaineer Cornelius
    .isOnQuest 98319
step
    .goto 1426/0,-369.84,-5750.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Gretchen|r
    .turnin 98319 >>Turn in Secure the Mountain
    .target Mountaineer Gretchen
    .isQuestComplete 98319
step
    +|cRXP_WARN_End of the Dun Morogh route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Arathi Highlands|r: Call of Air << Shaman
    >>|cRXP_FRIENDLY_The Barrens|r: The Islander << Warrior
    >>|cRXP_FRIENDLY_The Barrens|r: Seeking Strahad, Tome of the Cabal << Warlock
    >>|cRXP_FRIENDLY_Thousand Needles|r: The Brassbolts Brothers
]])
