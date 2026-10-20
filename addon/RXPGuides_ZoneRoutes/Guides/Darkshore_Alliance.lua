-- 10-22 Darkshore: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 3 parts (from level 10, 17, 21).
-- Split into 3 guides, listed under "10 - 22 Darkshore" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Darkshore.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 10 - 22 Darkshore
#subweight -10
#name 10-15 Darkshore: around Thundris Windweaver
--RouteBuilder:next
#next Zone Routes (Alliance)\9-12 Teldrassil: around Priestess A'moora;Zone Routes (Alliance)\11-15 Zephras Isle: around Elegael Thornpaw;Zone Routes (Alliance)\14-16 Loch Modan: around Marek Ironheart

step
    .goto 1439/1,543.06,6342.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gwennyth Bly'Leggonde|r
    .accept 3524 >>Accept Washed Ashore
    .target Gwennyth Bly'Leggonde
step << Mage
    .goto 1439/1,561.40,6343.01
    >>Talk to |cRXP_FRIENDLY_Caylais|r
    .fp Auberdine >> Get the Auberdine flight path
    .target Caylais Moonfeather
step << NightElf
    .goto 1439/1,533.23,6399.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Laird|r
    .turnin 6342 >>Turn in Flight to Auberdine
    .target Laird
    .isOnQuest 6342
step << NightElf
    .goto 1439/1,533.23,6399.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Laird|r
    .accept 6343 >>Accept Return to Nessa
    .target Laird
    .isQuestTurnedIn 6342 --any of: Flight to Auberdine
    .xp <10,1
step
    .goto 1439/1,520.13,6406.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wizbang Cranktoggle|r
    .accept 983 >>Accept Buzzbox 827
    .target Wizbang Cranktoggle
step << Mage
    .goto 1439/1,488.69,6564.830
    >>Talk to |cRXP_FRIENDLY_Dalmond|r
    .vendor 4182 >> |cRXP_BUY_Buy as many|r |T133634:0|t[Small Brown Pouches] |cRXP_BUY_as you need/can|r
    .target Dalmond
    .money <0.0500
step
    .goto 1439/1,515.55,6406.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Shaussiy|r
    .target Innkeeper Shaussiy
    .home >>Set your Hearthstone to Innkeeper Shaussiy's inn
step
    .goto 1439/1,397.65,6437.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tharnariun Treetender|r
    .accept 2118 >>Accept Plagued Lands
    .target Tharnariun Treetender
step << Mage
    .goto 1439/1,533.23,6399.77
    >>Talk to |cRXP_FRIENDLY_Laird|r
    >>|cRXP_BUY_Buy up to 20|r |T133918:0|t[Longjaw Mud Snappers] |cRXP_BUY_from him|r
    .vendor >> Vendor Trash
    .collect 4592,20,983,1
step
    .goto 1439/1,362.93,6434.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Terenthis|r
    .accept 984 >>Accept How Big a Threat?
    .target Terenthis
step << Warrior
    .goto 1439/1,383.89,6431.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Elissa Starbreeze|r
    .accept 1684 >>Accept Elanaria
    .target Sentinel Elissa Starbreeze
    .xp <10,1
step
    .goto 1439/1,445.46,6535.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gorbold Steelhand|r
    .turnin 97894 >>Turn in Business in Auberdine
    .target Gorbold Steelhand
    .isOnQuest 97894
step
    .goto 1439/1,491.97,6580.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thundris Windweaver|r
    .turnin 97926 >>Turn in Making Do
    .target Thundris Windweaver
    .isOnQuest 97926
step
    .goto 1439/1,503.76,6402.39
    >>Click the |cRXP_PICK_WANTED: Murkdeep!|r
    .accept 98025 >>Accept WANTED: Jai'vhanel
step
    .goto 1439/1,577.12,6371.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gubber Blump|r
    .accept 1141 >>Accept The Family and the Fishing Pole
    .target Gubber Blump
step
    #loop
    .goto 1439/1,938.02,4418.18,0
    .goto 1439/1,938.02,4418.18,40,0
    .goto 1439/1,1005.49,4388.05,40,0
    >>Kill |cRXP_ENEMY_Pygmy Tide Crawlers|r, |cRXP_ENEMY_Tide Crawlers|r, |cRXP_ENEMY_Encrusted Tide Crawlers|r and |cRXP_ENEMY_Young Reef Crawlers|r. Loot them for |cRXP_LOOT_Crawler Leg|r
    .complete 983,1 --Crawler Leg (6)
    .mob Pygmy Tide Crawler
    .mob Tide Crawler
    .mob Encrusted Tide Crawler
    .mob Young Reef Crawler
step << Warrior
    #completewith next
    .hs >>Hearth to Innkeeper Shaussiy's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step << Warrior
    .xp 10 >>Grind to level 10 (Elanaria needs it)
step << Warrior
    .goto 1439/1,383.89,6431.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Elissa Starbreeze|r
    .accept 1684 >>Accept Elanaria
    .target Sentinel Elissa Starbreeze
step
    .goto 1439/1,559.43,6109.83
    >>Open the |cRXP_PICK_Beached Sea Creature|r. Loot it for |cRXP_LOOT_Sea Creature Bones|r
    .complete 3524,1 --Sea Creature Bones (1)
step
    .goto 1439/1,330.84,5980.14
    >>Find a corrupt furbolg camp
    .complete 984,1 --Find a corrupt furbolg camp
step
    #loop
    .goto 1439/1,-281.59,6785.79,0
    .goto 1439/1,-281.59,6785.79,40,0
    .goto 1439/1,-241.63,6795.83,40,0
    .goto 1439/1,-292.72,6873.12,40,0
    .goto 1439/1,-195.78,6823.78,40,0
    .goto 1439/1,-230.50,6873.56,40,0
    .goto 1439/1,-120.46,6830.33,40,0
    .goto 1439/1,-175.48,6890.15,40,0
    .goto 1439/1,-146.00,6919.41,40,0
    .goto 1439/1,-146.00,6970.06,40,0
    >>Interact with |cRXP_FRIENDLY_Rabid Thistle Bear|r
    .complete 2118,1 --Rabid Thistle Bear
    .target Rabid Thistle Bear
step << NightElf
    .goto 1439,36.051,44.757,0
    .goto 1439,36.280,50.071,0
    .goto 1439,35.275,53.464,0
    .goto 1439,36.051,44.757,60,0
    .goto 1439,35.759,45.455,60,0
    .goto 1439,35.902,47.145,60,0
    .goto 1439,35.977,48.408,60,0
    .goto 1439,36.523,48.554,60,0
    .goto 1439,36.280,50.071,60,0
    .goto 1439,36.091,51.501,60,0
    .goto 1439,37.115,52.368,60,0
    .goto 1439,37.130,53.663,60,0
    .goto 1439,36.740,55.221,60,0
    .goto 1439,35.655,55.872,60,0
    .goto 1439,35.088,55.085,60,0
    .goto 1439,35.275,53.464,60,0
    .goto 1439,36.091,51.501,60,0
    .xp 11+7300 >> Grind to 7300+/8800xp
step
    #completewith next
    .hs >>Hearth to Innkeeper Shaussiy's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1439/1,541.75,6313.31
    >>Click the |cRXP_PICK_Buzzbox 827|r
    .turnin 983 >>Turn in Buzzbox 827
    .accept 1001 >>Accept Buzzbox 411
step
    .goto 1439/1,543.06,6342.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gwennyth Bly'Leggonde|r
    .turnin 3524 >>Turn in Washed Ashore
    .accept 4681 >>Accept Washed Ashore
    .target Gwennyth Bly'Leggonde
step
    .goto 1439/1,600.70,6424.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cerellean Whiteclaw|r
    .accept 963 >>Accept For Love Eternal
    .target Cerellean Whiteclaw
step
    .goto 1439/1,857.46,6311.13
    >>Open the |cRXP_PICK_Skeletal Sea Turtle|r. Loot it for |cRXP_LOOT_Sea Turtle Remains|r
    .complete 4681,1 --Sea Turtle Remains (1)
step
    .goto 1439/1,543.06,6342.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gwennyth Bly'Leggonde|r
    .turnin 4681 >>Turn in Washed Ashore
    .target Gwennyth Bly'Leggonde
step
    .goto 1439/1,497.21,6427.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barithras Moonshade|r
    .accept 947 >>Accept Cave Mushrooms
    .target Barithras Moonshade
step
    .goto 1439/1,472.32,6437.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Glynda Nal'Shea|r
    .accept 4811 >>Accept The Red Crystal
    .target Sentinel Glynda Nal'Shea
step
    .goto 1439/1,397.65,6437.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tharnariun Treetender|r
    .turnin 2118 >>Turn in Plagued Lands while you are here
    .isQuestComplete 2118
    .target Tharnariun Treetender
step
    .goto 1439/1,-152.55,6207.64
    >>Locate the large, red crystal on Darkshore's eastern mountain range
    .complete 4811,2 --Locate the large, red crystal on Darkshore's eastern mountain range
step
    .goto 1439/1,-157.79,6207.64
    >>Click the |cRXP_PICK_Mysterious Red Crystal|r
    .complete 4811,1 --Mysterious Red Crystal
step
    .goto 1439/1,472.32,6437.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Glynda Nal'Shea|r
    .turnin 4811 >>Turn in The Red Crystal
    .accept 4812 >>Accept As Water Cascades
    .target Sentinel Glynda Nal'Shea
step
    .goto 1439/1,467.08,6410.69
    >>Open the |cRXP_PICK_Auberdine Moonwell|r. Loot it for |cRXP_LOOT_Moonwell Water Tube|r
    .complete 4812,1 --Moonwell Water Tube (1)
step
    .goto 1439/1,397.65,6437.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tharnariun Treetender|r
    .turnin 2118 >>Turn in Plagued Lands
    .accept 2138 >>Accept Cleansing of the Infected
    .target Tharnariun Treetender
step
    .goto 1439/1,362.93,6434.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Terenthis|r
    .turnin 984 >>Turn in How Big a Threat?
    .accept 985 >>Accept How Big a Threat?
    .accept 4761 >>Accept Thundris Windweaver
    .target Terenthis
step << NightElf Warrior/NightElf Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kurdram Stonehammer|r and |cRXP_FRIENDLY_Delfrum Flintbeard|r
    .train 2575 >> Train |T134708:0|t[Mining]
    .target +Kurdram Stonehammer
    .goto 1439/1,436.36,6542.65
    .train 2018 >> Train |T136241:0|t[Blacksmithing]
    .target +Delfrum Flintbeard
    .goto 1439/1,440.16,6545.84
    >>|cRXP_WARN_This will allow you to make|r |T135248:0|t[Rough Sharpening Stones] |cRXP_WARN_which increase your melee damage by 2|r << Warrior/Rogue
    >>|cRXP_WARN_If you don't want to do this, skip this step|r
step << NightElf Warrior/NightElf Rogue
    .goto 1439/1,443.37,6538.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elisa Steelhand|r
    >>|cRXP_BUY_Buy a|r |T134708:0|t[Mining Pick] |cRXP_BUY_from her|r
    .target Elisa Steelhand
    .collect 2901,1
    .train 2575,3
step << NightElf Rogue
    .goto 1439,37.575,40.348
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Naram Longclaw|r
    .vendor 4183 >>|cRXP_BUY_Buy a|r |T135640:0|t[Jambiya] |cRXP_BUY_from him if you can afford it|r
    .collect 2207,1
    .target Naram Longclaw
step
    .goto 1439/1,491.97,6580.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thundris Windweaver|r
    .turnin 4761 >>Turn in Thundris Windweaver
    .accept 4762 >>Accept The Cliffspring River
    .accept 954 >>Accept Bashal'Aran
    .accept 958 >>Accept Tools of the Highborne
    .target Thundris Windweaver
step
    #loop
    .goto 1439/1,580.39,6985.78,0
    .goto 1439/1,580.39,6985.78,40,0
    .goto 1439/1,689.12,7039.49,40,0
    .goto 1439/1,588.91,7107.61,40,0
    >>Kill |cRXP_ENEMY_Darkshore Threshers|r and |cRXP_ENEMY_Elder Darkshore Threshers|r. Loot them for |cRXP_LOOT_Thresher Eye|r
    .complete 1001,1 --Thresher Eye (3)
    .mob Darkshore Thresher
    .mob Elder Darkshore Thresher
step
    .goto 1439/1,195.25,6956.52
    >>Click the |cRXP_PICK_Beached Sea Creature|r
    .accept 4723 >>Accept Beached Sea Creature
step
    .goto 1439/1,193.29,7083.59
    >>Click the |cRXP_PICK_Buzzbox 411|r
    .turnin 1001 >>Turn in Buzzbox 411
    .accept 1002 >>Accept Buzzbox 323
step
    .goto 1439/1,41.33,6745.18
    >>Find the source of the strange blue aura in the ruins of Bashal'Aran.
    .complete 954,1 --Find the source of the strange blue aura in the ruins of Bashal'Aran.
step
    .goto 1439/1,48.53,6748.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Asterion|r
    .turnin 954 >>Turn in Bashal'Aran
    .accept 955 >>Accept Bashal'Aran
    .target Asterion
step
    #loop
    .goto 1439/1,14.47,6647.36,0
    .goto 1439/1,14.47,6647.36,40,0
    .goto 1439/1,-101.46,6643.43,40,0
    .goto 1439/1,-166.31,6714.17,40,0
    >>Kill |cRXP_ENEMY_Vile Sprites|r and |cRXP_ENEMY_Wild Grells|r. Loot them for |cRXP_LOOT_Grell Earring|r
    .complete 955,1 --Grell Earring (8)
    .mob Vile Sprite
    .mob Wild Grell
step
    .goto 1439/1,48.53,6748.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Asterion|r
    .turnin 955 >>Turn in Bashal'Aran
    .accept 956 >>Accept Bashal'Aran
    .target Asterion
step
    #loop
    .goto 1439/1,-35.96,6739.50,0
    .goto 1439/1,-35.96,6739.50,40,0
    .goto 1439/1,-32.03,6598.46,40,0
    >>Kill |cRXP_ENEMY_Deth'ryll Satyr|r and loot |cRXP_LOOT_Ancient Moonstone Seal|r
    .complete 956,1 --Ancient Moonstone Seal (1)
    .mob Deth'ryll Satyr
step
    .goto 1439/1,48.53,6748.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Asterion|r
    .turnin 956 >>Turn in Bashal'Aran
    .accept 957 >>Accept Bashal'Aran
    .target Asterion
step << NightElf/Dwarf/Human Hunter
    .goto 1439,44.528,36.587,0
    .goto 1439,45.334,39.393,0
    .goto 1439,46.096,36.541,0
    .goto 1439,44.528,36.587,50,0
    .goto 1439,44.435,37.404,50,0
    .goto 1439,44.443,38.202,50,0
    .goto 1439,44.493,39.008,50,0
    .goto 1439,44.821,39.711,50,0
    .goto 1439,45.334,39.393,50,0
    .goto 1439,45.167,38.652,50,0
    .goto 1439,45.091,37.865,50,0
    .goto 1439,45.495,37.019,50,0
    .goto 1439,45.831,36.790,50,0
    .goto 1439,46.096,36.541,50,0
    .goto 1439,46.906,36.171,50,0
    .goto 1439,47.431,36.151,50,0
    .goto 1439,47.022,37.083,50,0
    .goto 1439,47.166,37.580,50,0
    .goto 1439,45.827,36.812,50,0
    .xp 13 >> Grind to level 13
step << Mage
    .goto 1439/1,488.69,6564.830,0,0
    >>Talk to |cRXP_FRIENDLY_Dalmond|r
    .vendor >> Vendor Trash
    .target Dalmond
step
    .goto 1439/1,-157.79,6207.64
    >>Click the |cRXP_PICK_Mysterious Red Crystal|r
    .turnin 4812 >>Turn in As Water Cascades
    .accept 4813 >>Accept The Fragments Within
step
    .goto 1439/1,472.32,6437.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Glynda Nal'Shea|r
    .turnin 4813 >>Turn in The Fragments Within
    .target Sentinel Glynda Nal'Shea
step
    #loop
    .goto 1439/1,346.56,5973.59,0
    .goto 1439/1,346.56,5973.59,40,0
    .goto 1439/1,338.04,5881.89,40,0
    >>Kill |cRXP_ENEMY_Blackwood Pathfinders|r
    >>Kill |cRXP_ENEMY_Blackwood Windtalkers|r
    .complete 985,1 --Blackwood Pathfinder slain (8)
    .complete 985,2 --Blackwood Windtalker slain (5)
    .mob Blackwood Pathfinder
    .mob Blackwood Windtalker
step
    .goto 1439/1,512.27,5618.14
    >>Click the |cRXP_PICK_Beached Sea Turtle|r
    .accept 4722 >>Accept Beached Sea Turtle
step
    .goto 1439/1,302.02,5725.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Tysha Moonblade|r
    .accept 953 >>Accept The Fall of Ameth'Aran
    .target Sentinel Tysha Moonblade
step
    #loop
    .goto 1439/1,176.26,5660.93,0
    .goto 1439/1,176.26,5660.93,40,0
    .goto 1439/1,153.99,5782.33,40,0
    .goto 1439/1,-10.42,5789.31,40,0
    .goto 1439/1,78.01,5756.13,40,0
    >>Kill |cRXP_ENEMY_Anaya Dawnrunner|r and loot |cRXP_LOOT_Anaya's Pendant|r
    >>Kill |cRXP_ENEMY_Cursed Highbornes|r, |cRXP_ENEMY_Writhing Highbornes|r and |cRXP_ENEMY_Wailing Highbornes|r. Loot them for |cRXP_LOOT_Highborne Relic|r
    >>Click the |cRXP_PICK_The Fall of Ameth'Aran|r
    >>Click the |cRXP_PICK_Ancient Flame|r
    >>Click the |cRXP_PICK_The Lay of Ameth'Aran|r
    >>Kill |cRXP_ENEMY_Jai'vhanel|r and loot |cRXP_LOOT_Feather of Jai'vhanel|r
    .complete 963,1 --Anaya's Pendant (1)
    .complete 958,1 --Highborne Relic (7)
    .complete 953,2 --Read the Fall of Ameth'Aran
    .complete 957,1 --Destroy the seal at the ancient flame
    .complete 953,1 --Read the Lay of Ameth'Aran
    .complete 98025,1 --Feather of Jai'vhanel (1)
    .mob Anaya Dawnrunner
    .mob Cursed Highborne
    .mob Writhing Highborne
    .mob Wailing Highborne
    .mob Jai'vhanel
step
    .goto 1439/1,302.02,5725.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Tysha Moonblade|r
    .turnin 953 >>Turn in The Fall of Ameth'Aran
    .target Sentinel Tysha Moonblade
step
    #completewith next
    .hs >>Hearth to Innkeeper Shaussiy's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1439/1,543.06,6342.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gwennyth Bly'Leggonde|r
    .turnin 4722 >>Turn in Beached Sea Turtle
    .turnin 4723 >>Turn in Beached Sea Creature
    .target Gwennyth Bly'Leggonde
step
    .goto 1439/1,600.70,6424.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cerellean Whiteclaw|r
    .turnin 963 >>Turn in For Love Eternal
    .target Cerellean Whiteclaw
step
    .goto 1439/1,472.32,6437.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Glynda Nal'Shea|r
    .turnin 98025 >>Turn in WANTED: Jai'vhanel
    .target Sentinel Glynda Nal'Shea
step
    .goto 1439/1,362.93,6434.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Terenthis|r
    .turnin 985 >>Turn in How Big a Threat?
    .target Terenthis
step
    .goto 1439/1,383.89,6431.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Elissa Starbreeze|r
    .accept 965 >>Accept The Tower of Althalaxx
    .target Sentinel Elissa Starbreeze
step << NightElf
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gorbold Steelhand|r
    .vendor >>|cRXP_BUY_Buy a|r [Shiny Bauble] |cRXP_BUY_and three|r |T134324:0|t[Nightcrawlers] |cRXP_BUY_from him. You will need them for a quest in Stormwind soon|r
    .collect 6529,1
    .collect 6530,3
    .target Gorbold Steelhand
step
    .goto 1439/1,445.46,6535.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gorbold Steelhand|r
    .accept 982 >>Accept Deep Ocean, Vast Sea
    .target Gorbold Steelhand
step
    .goto 1439/1,491.97,6580.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thundris Windweaver|r
    .turnin 958 >>Turn in Tools of the Highborne while you are here
    .isQuestComplete 958
    .target Thundris Windweaver
step
    .goto 1439/1,436.95,7075.73
    >>Pick up |cRXP_PICK_Silver Dawning's Lockbox|r from the ground
    >>Pick up |cRXP_PICK_Mist Veil's Lockbox|r from the ground
    .complete 982,1 --Silver Dawning's Lockbox (1)
    .complete 982,2 --Mist Veil's Lockbox (1)
step
    .goto 1439/1,445.46,6535.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gorbold Steelhand|r
    .turnin 982 >>Turn in Deep Ocean, Vast Sea
    .target Gorbold Steelhand
step << Mage
    .goto 1439/1,445.46,6535.58
    .target Gorbold Steelhand
    >>Talk to |cRXP_FRIENDLY_Gorbold Steelhand|r
    .vendor >> Buy some Mild Spices from Gorbold until you have enough to cook all your eggs
step
    .goto 1439/1,491.97,6580.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thundris Windweaver|r
    .turnin 958 >>Turn in Tools of the Highborne
    .accept 97914 >>Accept Expanding Horizons
    .target Thundris Windweaver
step
    .goto 1439/1,48.53,6748.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Asterion|r
    .turnin 957 >>Turn in Bashal'Aran
    .target Asterion
step
    .goto 1439/1,47.22,7433.80
    >>Click the |cRXP_PICK_Beached Sea Turtle|r
    .accept 4725 >>Accept Beached Sea Turtle
step
    .goto 1439/1,-388.35,7214.16
    >>Open the |cRXP_PICK_Cliffspring River Waterfall|r. Loot it for |cRXP_LOOT_Cliffspring River Sample|r
    .complete 4762,1 --Cliffspring River Sample (1)
step
    .goto 1439/1,-658.87,7246.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Balthule Shadowstrike|r
    .turnin 965 >>Turn in The Tower of Althalaxx
    .accept 966 >>Accept The Tower of Althalaxx
    .target Balthule Shadowstrike
step
    #loop
    .goto 1439/1,-710.61,7169.18,0
    .goto 1439/1,-710.61,7169.18,40,0
    .goto 1439/1,-787.90,7177.91,40,0
    >>Kill |cRXP_ENEMY_Dark Strand Fanatics|r. Loot them for |cRXP_LOOT_Worn Parchment|r
    .complete 966,1 --Worn Parchment (4)
    .mob Dark Strand Fanatic
step
    .goto 1439/1,-658.87,7246.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Balthule Shadowstrike|r
    .turnin 966 >>Turn in The Tower of Althalaxx
    .accept 967 >>Accept The Tower of Althalaxx
    .target Balthule Shadowstrike
step << NightElf Druid/Skyborne Druid
    .goto 1439/1,-655.59,6878.80
    >>Open the |cRXP_PICK_Cliffspring Falls Cave Mouth|r. Loot it for |cRXP_LOOT_Filled Cliffspring Falls Sampler|r
    .complete 6122,1 --Filled Cliffspring Falls Sampler (1)
    .isOnQuest 6122
step
    #loop
    .goto 1439/1,-766.29,6829.89,0
    .goto 1439/1,-766.29,6829.89,40,0
    .goto 1439/1,-694.24,6792.77,40,0
    >>Pick up |cRXP_PICK_Scaber Stalk|r from the ground
    >>Pick up |cRXP_PICK_Death Cap|r from the ground
    .complete 947,1 --Scaber Stalk (5)
    .complete 947,2 --Death Cap (1)
step
    .goto 1439/1,491.97,6580.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thundris Windweaver|r
    .turnin 4762 >>Turn in The Cliffspring River
    .target Thundris Windweaver
step << NightElf Druid/Skyborne Druid
    .goto 1439/1,472.97,6557.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alanndarian Nightsong|r
    .turnin 6122 >>Turn in The Principal Source
    .target Alanndarian Nightsong
    .isOnQuest 6122
step << NightElf Druid
    .goto 1439/1,472.97,6557.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alanndarian Nightsong|r
    .accept 6123 >>Accept Gathering the Cure
    .target Alanndarian Nightsong
    .isQuestTurnedIn 6122 --any of: The Principal Source
    .xp <14,1
step
    .goto 1439/1,497.21,6427.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barithras Moonshade|r
    .turnin 947 >>Turn in Cave Mushrooms
    .accept 948 >>Accept Onu
    .target Barithras Moonshade
step
    .goto 1439/1,543.06,6342.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gwennyth Bly'Leggonde|r
    .turnin 4725 >>Turn in Beached Sea Turtle
    .target Gwennyth Bly'Leggonde
step << Druid
    .goto 1439,39.899,54.745,0
    .goto 1439,40.181,56.229,0
    .goto 1439,39.267,53.092,50,0
    .goto 1439,39.754,53.444,50,0
    .goto 1439,40.234,54.325,50,0
    .goto 1439,39.899,54.745,50,0
    .goto 1439,40.181,56.229,50,0
    .goto 1439,39.388,56.671,50,0
    .goto 1439,39.191,56.382,50,0
    .goto 1439,39.957,55.300,50,0
    .goto 1439,39.332,54.079,50,0
    .xp 16 >> Grind to level 16
step << Mage
    .goto 1439/1,533.23,6399.77
    >>Talk to |cRXP_FRIENDLY_Laird|r
    >>|cRXP_BUY_Buy up to 20|r |T133918:0|t[Longjaw Mud Snappers] |cRXP_BUY_from him|r
    .vendor >> Vendor Trash
    .collect 4592,20,4763,1
    .target Laird
    .isOnQuest 982
step
    .goto 1439/1,489.35,6506.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archaeologist Hollee|r
    .turnin 730 >>Turn in Trouble In Darkshore?
    .target Archaeologist Hollee
    .isOnQuest 730
step
    #loop
    .goto 1439/1,-175.48,6890.15,0
    .goto 1439/1,-175.48,6890.15,40,0
    .goto 1439/1,-241.63,6795.83,40,0
    >>Kill |cRXP_ENEMY_Rabid Thistle Bears|r
    .complete 2138,1 --Rabid Thistle Bear slain (20)
    .mob Rabid Thistle Bear
step
    .goto 1439/1,397.65,6437.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tharnariun Treetender|r
    .turnin 2138 >>Turn in Cleansing of the Infected
    .target Tharnariun Treetender
step << NightElf Druid
    .goto 1439/1,343.28,5189.77
    >>Pick up |cRXP_PICK_Earthroot|r from the ground
    .complete 6123,1 --Earthroot (5)
    .isOnQuest 6123
step << NightElf Druid
    .goto 1439/1,72.77,6139.96
    >>Loot the |cRXP_PICK_Lunar Fungal Blooms|r for |cRXP_LOOT_Lunar Fungus|r
    .complete 6123,2 --Lunar Fungus (12)
    .isOnQuest 6123
step
    .goto 1439/1,89.14,5002.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Onu|r
    .turnin 952 >>Turn in Grove of the Ancients
    .target Onu
    .isOnQuest 952
step
    .goto 1439/1,89.14,5002.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Onu|r
    .turnin 948 >>Turn in Onu
    .accept 944 >>Accept The Master's Glaive
    .target Onu
step
    .goto 1439/1,421.23,4558.35
    >>Enter the Master's Glaive
    .complete 944,1 --Enter the Master's Glaive
step
    .goto 1439/1,413.37,4569.27
    >>Click the |cRXP_PICK_Scrying Bowl|r
    .turnin 944 >>Turn in The Master's Glaive
    .accept 949 >>Accept The Twilight Camp
step
    .goto 1439/1,417.30,4575.82
    >>Click the |cRXP_PICK_Twilight Tome|r
    .turnin 949 >>Turn in The Twilight Camp
    .accept 950 >>Accept Return to Onu
step
    .goto 1439/1,89.14,5002.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Onu|r
    .turnin 950 >>Turn in Return to Onu
    .target Onu
step << Hunter
    .goto 1439/1,417.30,4575.82
    .xp 17 >> Grind to level 17
step
    .goto 1439/1,894.14,4515.12
    >>Click the |cRXP_PICK_Beached Sea Creature|r
    .accept 4733 >>Accept Beached Sea Creature
step
    .goto 1439/1,896.10,4595.47
    >>Click the |cRXP_PICK_Beached Sea Turtle|r
    .accept 4732 >>Accept Beached Sea Turtle
step
    .goto 1439/1,867.28,4679.31
    >>Click the |cRXP_PICK_Beached Sea Turtle|r
    .accept 4731 >>Accept Beached Sea Turtle
step
    .goto 1439/1,800.47,4805.50
    >>Click the |cRXP_PICK_Beached Sea Creature|r
    .accept 4730 >>Accept Beached Sea Creature
step
    .goto 1439/1,583.01,5238.24
    >>Click the |cRXP_PICK_Beached Sea Creature|r
    .accept 4728 >>Accept Beached Sea Creature
step
    .goto 1439/1,543.06,6342.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gwennyth Bly'Leggonde|r
    .turnin 4728 >>Turn in Beached Sea Creature
    .turnin 4730 >>Turn in Beached Sea Creature
    .turnin 4731 >>Turn in Beached Sea Turtle
    .turnin 4732 >>Turn in Beached Sea Turtle
    .turnin 4733 >>Turn in Beached Sea Creature
    .target Gwennyth Bly'Leggonde
step
    .goto 1439/1,531.27,6403.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Laird|r and |cRXP_FRIENDLY_Allyndia|r
    .vendor >> |cRXP_BUY_Vendor and restock on Food and Water|r
    .target Laird
    .target Allyndia
step << Hunter
    .goto 1439/1,491.97,6560.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dalmond|r
    .vendor >>|cRXP_BUY_Restock on Ammo|r
    .target Dalmond
step << NightElf Druid
    .goto 1439/1,472.97,6557.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alanndarian Nightsong|r
    .turnin 6123 >>Turn in Gathering the Cure
    .target Alanndarian Nightsong
    .isOnQuest 6123
step << !Hunter
    .goto 1439/1,-503.63,6866.13
    .xp 18 >> Grind to level 18
step << Hunter
    .goto 1439/1,-503.63,6866.13
    .xp 18.75 >> Grind to 18 + 75%
    >>Make sure your HS cooldown is <10 min
    >>Skip this step if the area is too crowded
step
    #loop
    .goto 1439/1,552.88,4383.68,0
    .goto 1439/1,552.88,4383.68,40,0
    .goto 1439/1,487.38,4272.77,40,0
    .goto 1439/1,331.49,4388.49,40,0
    >>Kill |cRXP_ENEMY_Moonstalkers|r, |cRXP_ENEMY_Moonstalker Runts|r, |cRXP_ENEMY_Moonstalker Matriarches|r and |cRXP_ENEMY_Moonstalker Sires|r. Loot them for |cRXP_LOOT_Moonstalker Fang|r
    .complete 1002,1 --Moonstalker Fang (6)
    .mob Moonstalker
    .mob Moonstalker Runt
    .mob Moonstalker Matriarch
    .mob Moonstalker Sire
step
    .goto 1439/1,-67.40,4390.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Aynasha|r
    .accept 5713 >>Accept One Shot. One Kill.
    .target Sentinel Aynasha
step
    .goto 1439/1,-62.82,4384.99
    >>Protect Aynasha
    .complete 5713,1 --Protect Aynasha
step
    .goto 1439/1,-417.83,7260.44
    >>Click the |cRXP_PICK_Buzzbox 323|r
    .turnin 1002 >>Turn in Buzzbox 323
    .accept 1003 >>Accept Buzzbox 525
step
    #loop
    .goto 1439/1,293.50,4790.66,0
    .goto 1439/1,293.50,4790.66,40,0
    .goto 1439/1,450.05,4750.48,40,0
    .goto 1439/1,474.28,4847.86,40,0
    >>Kill |cRXP_ENEMY_Grizzled Thistle Bears|r and |cRXP_ENEMY_Den Mothers|r. Loot them for |cRXP_LOOT_Grizzled Scalp|r
    .complete 1003,1 --Grizzled Scalp (4)
    .mob Grizzled Thistle Bear
    .mob Den Mother
step
    .goto 1439/1,230.62,4815.55
    >>Click the |cRXP_PICK_Buzzbox 525|r
    .turnin 1003 >>Turn in Buzzbox 525
step << NightElf Druid
    .goto 1439/1,472.97,6557.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alanndarian Nightsong|r
    .accept 6124 >>Accept Curing the Sick
    .target Alanndarian Nightsong
    .isQuestTurnedIn 6123 --any of: Gathering the Cure
    .xp <14,1
step
    .goto 1439/1,-537.04,7543.84
    >>Click the |cRXP_PICK_Beached Sea Turtle|r
    .accept 4727 >>Accept Beached Sea Turtle
step << NightElf Druid
    #loop
    .goto 1439/1,-405.38,6869.19,0
    .goto 1439/1,-405.38,6869.19,40,0
    .goto 1439/1,-275.04,6757.84,40,0
    .goto 1439/1,-71.33,6526.41,40,0
    .goto 1439/1,74.73,6526.41,40,0
    .goto 1439/1,299.40,6049.57,40,0
    .goto 1439/1,200.49,6667.89,40,0
    >>Interact with |cRXP_FRIENDLY_Sickly Deers|r
    .complete 6124,1 --Sickly Deer (10)
    .target Sickly Deer
    .isOnQuest 6124
step
    #completewith next
    .hs >>Hearth to Innkeeper Shaussiy's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1439/1,543.06,6342.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gwennyth Bly'Leggonde|r
    .turnin 4727 >>Turn in Beached Sea Turtle
    .target Gwennyth Bly'Leggonde
step << NightElf Hunter
    .goto 1439/1,488.69,6564.830
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dalmond|r
    .vendor >> Stock up on |T132382:0|t[Sharp Arrows]
    .target Dalmond
step
    .goto 1439/1,577.12,6371.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gubber Blump|r
    .turnin 1141 >>Turn in The Family and the Fishing Pole
    .target Gubber Blump
    .isQuestComplete 1141
step << !NightElf
    .goto 1439/1,561.66,6343.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Caylais Moonfeather|r
    .fp Auberdine >> Get the Auberdine flight path
    .target Caylais Moonfeather
step
    +|cRXP_WARN_That is all of Darkshore for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Ashenvale|r: One Shot. One Kill., The Tower of Althalaxx
    >>|cRXP_FRIENDLY_Darnassus|r: Elanaria << Warrior
    >>|cRXP_FRIENDLY_Moonglade|r: Curing the Sick << NightElf Druid
    >>|cRXP_FRIENDLY_Stormwind City|r: Expanding Horizons
    >>|cRXP_FRIENDLY_Teldrassil|r: Return to Nessa << NightElf
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: The Family and the Fishing Pole
step
    +|cRXP_WARN_Suggested next zones at level 14|r: |cRXP_FRIENDLY_Teldrassil|r (about 1.2 levels of quests, starting around Priestess A'moora), |cRXP_FRIENDLY_Zephras Isle|r (about 1.1 levels of quests, starting around Elegael Thornpaw), |cRXP_FRIENDLY_Loch Modan|r (about 0.7 levels of quests, starting around Marek Ironheart). Completing this step loads the guide for Teldrassil --RouteBuilder:next
step
    +|cRXP_WARN_The rest of Darkshore is planned from level 17.|r Load its guide for level 17 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 10 - 22 Darkshore
#subweight -10
#name 17-19 Darkshore: around Archaeologist Hollee
--RouteBuilder:next
#next Zone Routes (Alliance)\18-19 Ashenvale: around Shindrell Swiftfire;Zone Routes (Alliance)\11-15 Zephras Isle: around Elegael Thornpaw

step
    .goto 1439/1,-962.13,7363.93
    >>Click the |cRXP_PICK_Scrolls|r
    .accept 78124 >>Accept Nar'thalas Almanac
step
    .goto 1439/1,515.55,6406.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Shaussiy|r
    .target Innkeeper Shaussiy
    .home >>Set your Hearthstone to Innkeeper Shaussiy's inn
step
    .goto 1439/1,577.12,6371.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gubber Blump|r
    .turnin 1141 >>Turn in The Family and the Fishing Pole
    .target Gubber Blump
    .isQuestComplete 1141
step
    .goto 1439/1,397.65,6437.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tharnariun Treetender|r
    .accept 2139 >>Accept Tharnariun's Hope
    .target Tharnariun Treetender
    .isQuestTurnedIn 2138 --any of: Cleansing of the Infected
step
    .goto 1439/1,362.93,6434.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Terenthis|r
    .accept 986 >>Accept A Lost Master
    .target Terenthis
    .isQuestTurnedIn 985 --any of: How Big a Threat?
step
    .goto 1439/1,577.12,6371.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gubber Blump|r
    .accept 1138 >>Accept Fruit of the Sea
    .target Gubber Blump
step
    .goto 1439/1,491.97,6580.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thundris Windweaver|r
    .accept 4763 >>Accept The Blackwood Corrupted
    .target Thundris Windweaver
    .isQuestTurnedIn 4762 --any of: The Cliffspring River
step
    .goto 1439/1,489.35,6506.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archaeologist Hollee|r
    .accept 729 >>Accept The Absent Minded Prospector
    .target Archaeologist Hollee
step << Mage
    .goto 1439/1,488.69,6564.830
    >>Talk to |cRXP_FRIENDLY_Dalmond|r
    .vendor 4182 >> |cRXP_BUY_Buy as many|r |T133634:0|t[Small Brown Pouches] |cRXP_BUY_as you need/can|r
    .target Dalmond
    .money <0.0500
    .money >0.2500
step << Mage
    .goto 1439/1,488.69,6564.830
    >>Talk to |cRXP_FRIENDLY_Dalmond|r
    .vendor 4182 >> |cRXP_BUY_Buy a|r |T133634:0|t[Brown Leather Satchel] |cRXP_BUY_from him|r
    .target Dalmond
    .money <0.2500
step
    .goto 1439/1,503.76,6402.39
    >>Click the |cRXP_PICK_WANTED: Murkdeep!|r
    .accept 4740 >>Accept WANTED: Murkdeep!
step
    .goto 1439/1,543.06,6342.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gwennyth Bly'Leggonde|r
    .accept 87760 >>Accept Holy Diver
    .target Gwennyth Bly'Leggonde
step
    .goto 1439/1,417.30,4575.82
    >>Click the |cRXP_PICK_Twilight Tome|r
    .accept 98042 >>Accept It's All Fun and Games Until...
step
    #completewith Along11
    >>As you go: Kill |cRXP_ENEMY_Twilight Disciples|r and |cRXP_ENEMY_Twilight Thugs|r. Loot them for |cRXP_LOOT_Peerless Eye|r. |cRXP_WARN_Anything left is finished later|r
    .complete 98042,1 --Peerless Eye (1)
    .mob Twilight Disciple
    .mob Twilight Thug
step
    #label Along11
    .goto 1439/1,410.75,4519.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Therylune|r
    .accept 945 >>Accept Therylune's Escape
    .target Therylune
step
    .goto 1439/1,288.26,4530.84
    >>Escort Therylune away from the Master's Glaive
    .complete 945,1 --Escort Therylune away from the Master's Glaive
step
    #completewith Drop968x1
    >>|cRXP_LOOT_Book: The Powers Below|r can drop from |cRXP_ENEMY_Twilight Disciple|r, |cRXP_ENEMY_Twilight Thug|r. Use it to start the quest if you get one
    .collect 5352,1,968 --Book: The Powers Below (1)
    .accept 968 >>Accept The Powers Below
    .use 5352
step
    #label Drop968x1
    #loop
    .goto 1439/1,381.93,4491.10,0
    .goto 1439/1,381.93,4491.10,40,0
    .goto 1439/1,416.64,4565.77,40,0
    >>Kill |cRXP_ENEMY_Twilight Disciples|r and |cRXP_ENEMY_Twilight Thugs|r. Loot them for |cRXP_LOOT_Peerless Eye|r
    .complete 98042,1 --Peerless Eye (1)
    .mob Twilight Disciple
    .mob Twilight Thug
step
    .goto 1439/1,76.04,4992.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Arbal|r
    .accept 98013 >>Accept Swelling Forces
    .target Arbal
step
    .goto 1439/1,89.14,5002.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Onu|r
    .accept 951 >>Accept Mathystra Relics
    .target Onu
    .isQuestTurnedIn 950 --any of: Return to Onu
step
    .goto 1439/1,601.35,4678.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Remtravel|r
    .turnin 729 >>Turn in The Absent Minded Prospector
    .accept 731 >>Accept The Absent Minded Prospector
    .target Prospector Remtravel
step
    .goto 1439/1,605.28,4664.02
    >>Escort Prospector Remtravel
    .complete 731,1 --Escort Prospector Remtravel
step
    .goto 1439/1,554.85,4992.40
    >>Kill |cRXP_ENEMY_Murkdeep|r
    .complete 4740,1 --Murkdeep slain (1)
    .mob Murkdeep
step
    #completewith next
    .hs >>Hearth to Innkeeper Shaussiy's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1439/1,467.08,6410.69
    >>Open the |cRXP_PICK_Auberdine Moonwell|r. Loot it for |cRXP_LOOT_Filled Cleansing Bowl|r
    .collect 12347,1,4763,1 --Filled Cleansing Bowl (1)
    .isOnQuest 4763
step
    .goto 1439/1,472.32,6437.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Glynda Nal'Shea|r
    .turnin 4740 >>Turn in WANTED: Murkdeep!
    .target Sentinel Glynda Nal'Shea
step
    .goto 1439/1,491.97,6580.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thundris Windweaver|r
    .turnin 98042 >>Turn in It's All Fun and Games Until...
    .target Thundris Windweaver
step
    .goto 1439/1,489.35,6506.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archaeologist Hollee|r
    .turnin 731 >>Turn in The Absent Minded Prospector
    .accept 741 >>Accept The Absent Minded Prospector
    .target Archaeologist Hollee
step
    .goto 1439/1,-430.27,6662.65
    >>Kill |cRXP_ENEMY_Den Mother|r
    .complete 2139,1 --Den Mother slain (1)
    .mob Den Mother
    .isOnQuest 2139
step
    .goto 1439/1,-376.56,6807.62
    >>Open the |cRXP_PICK_Blackwood Grain Stores|r. Loot it for |cRXP_LOOT_Blackwood Grain Sample|r
    .collect 12342,1,4763,1 --Blackwood Grain Sample (1)
    .isOnQuest 4763
step
    .goto 1439/1,-453.20,6870.50
    >>Open the |cRXP_PICK_Blackwood Nut Stores|r. Loot it for |cRXP_LOOT_Blackwood Nut Sample|r
    .collect 12343,1,4763,1 --Blackwood Nut Sample (1)
    .isOnQuest 4763
step
    .goto 1439/1,-520.66,6873.99
    >>Open the |cRXP_PICK_Blackwood Fruit Stores|r. Loot it for |cRXP_LOOT_Blackwood Fruit Sample|r
    .collect 12341,1,4763,1 --Blackwood Fruit Sample (1)
    .isOnQuest 4763
step
    .goto 1439/1,-495.77,6875.30
    >>Open the |cRXP_PICK_Xabraxxis' Demon Bag|r. Loot it for |cRXP_LOOT_Talisman of Corruption|r
    .complete 4763,1 --Talisman of Corruption (1)
    .isOnQuest 4763
step
    #loop
    .goto 1439/1,-873.05,7293.19,0
    .goto 1439/1,-873.05,7293.19,40,0
    .goto 1439/1,-835.72,7401.92,40,0
    .goto 1439/1,-1010.60,7304.55,40,0
    >>Kill |cRXP_ENEMY_Stormscale Myrmidons|r
    .complete 98013,1 --Stormscale Myrmidon slain (12)
    .mob Stormscale Myrmidon
step
    #loop
    .goto 1439/1,-892.05,7274.42,0
    .goto 1439/1,-892.05,7274.42,40,0
    .goto 1439/1,-1041.39,7319.83,40,0
    .goto 1439/1,-1072.83,7471.79,40,0
    >>Pick up |cRXP_PICK_Mathystra Relic|r from the ground
    .complete 951,1 --Mathystra Relic (6)
    .isOnQuest 951
step
    .goto 1439/1,-769.56,7744.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gelkak Gyromast|r
    .accept 2098 >>Accept Gyromast's Retrieval
    .target Gelkak Gyromast
step
    #loop
    .goto 1439/1,-745.98,7699.73,0
    .goto 1439/1,-745.98,7699.73,40,0
    .goto 1439/1,-679.17,7784.01,40,0
    >>Kill |cRXP_ENEMY_Greymist Raiders|r, |cRXP_ENEMY_Greymist Coastrunners|r, |cRXP_ENEMY_Greymist Seers|r and |cRXP_ENEMY_Greymist Netters|r. Loot them for |cRXP_LOOT_Middle of Gelkak's Key|r
    >>Kill |cRXP_ENEMY_Encrusted Tide Crawlers|r and |cRXP_ENEMY_Raging Reef Crawlers|r. Loot them for |cRXP_LOOT_Bottom of Gelkak's Key|r
    .complete 2098,2 --Middle of Gelkak's Key (1)
    .complete 2098,3 --Bottom of Gelkak's Key (1)
    .mob Greymist Raider
    .mob Greymist Coastrunner
    .mob Greymist Seer
    .mob Greymist Netter
    .mob Encrusted Tide Crawler
    .mob Raging Reef Crawler
step
    .goto 1439/1,-916.28,7752.13
    >>Kill |cRXP_ENEMY_Giant Foreststrider|r and loot |cRXP_LOOT_Top of Gelkak's Key|r
    .complete 2098,1 --Top of Gelkak's Key (1)
    .mob Giant Foreststrider
step
    #loop
    .goto 1439/1,-1048.59,7747.76,0
    .goto 1439/1,-1048.59,7747.76,40,0
    .goto 1439/1,-1051.21,7815.01,40,0
    >>Kill |cRXP_ENEMY_Moonstalker Matriarches|r and |cRXP_ENEMY_Moonstalker Sires|r. Loot them for |cRXP_LOOT_Fine Moonstalker Pelt|r
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .mob Moonstalker Matriarch
    .mob Moonstalker Sire
    .isOnQuest 986
step
    .goto 1439/1,-769.56,7744.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gelkak Gyromast|r
    .turnin 2098 >>Turn in Gyromast's Retrieval
    .accept 2078 >>Accept Gyromast's Revenge
    .target Gelkak Gyromast
step
    .goto 1439/1,-713.89,7534.67
    >>Kill |cRXP_ENEMY_The Threshwackonator 4100|r
    .complete 2078,1 --Gelkak's First Mate (1)
    .mob The Threshwackonator 4100
step
    .goto 1439/1,-769.56,7744.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gelkak Gyromast|r
    .turnin 2078 >>Turn in Gyromast's Revenge
    .target Gelkak Gyromast
step
    .goto 1439/1,491.97,6580.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thundris Windweaver|r
    .turnin 4763 >>Turn in The Blackwood Corrupted
    .target Thundris Windweaver
    .isOnQuest 4763
step
    .goto 1439/1,397.65,6437.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tharnariun Treetender|r
    .turnin 2139 >>Turn in Tharnariun's Hope
    .target Tharnariun Treetender
    .isOnQuest 2139
step
    .goto 1439/1,362.93,6434.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Terenthis|r
    .turnin 986 >>Turn in A Lost Master
    .target Terenthis
    .isOnQuest 986
step
    .goto 1439/1,362.93,6434.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Terenthis|r
    .accept 993 >>Accept A Lost Master
    .target Terenthis
    .isQuestTurnedIn 986 --any of: A Lost Master
step
    #loop
    .goto 1439/1,843.05,4809.00,0
    .goto 1439/1,843.05,4809.00,40,0
    .goto 1439/1,783.44,4714.24,40,0
    >>Kill |cRXP_ENEMY_Encrusted Tide Crawlers|r and |cRXP_ENEMY_Reef Crawlers|r. Loot them for |cRXP_LOOT_Fine Crab Chunks|r
    .complete 1138,1 --Fine Crab Chunks (6)
    .mob Encrusted Tide Crawler
    .mob Reef Crawler
step
    #completewith next
    .hs >>Hearth to Innkeeper Shaussiy's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1439/1,577.12,6371.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gubber Blump|r
    .turnin 1138 >>Turn in Fruit of the Sea
    .target Gubber Blump
step
    .goto 1439/1,89.14,5002.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Onu|r
    .turnin 951 >>Turn in Mathystra Relics
    .target Onu
    .isOnQuest 951
step
    .goto 1439/1,33.47,4995.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kerlonian Evershade|r
    .accept 5321 >>Accept The Sleeper Has Awakened
    .target Kerlonian Evershade
step
    .goto 1439/1,34.12,5001.13
    >>Open the |cRXP_PICK_Kerlonian's Chest|r. Loot it for |cRXP_LOOT_Horn of Awakening|r
    .complete 5321,1 --Horn of Awakening (1)
step
    .goto 1439/1,-6.49,4608.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Volcor|r
    .turnin 993 >>Turn in A Lost Master
    .target Volcor
    .isOnQuest 993
step
    #loop
    .goto 1439/1,-981.13,7350.40,0
    .goto 1439/1,-981.13,7350.40,40,0
    .goto 1439/1,-1071.52,7370.05,40,0
    .goto 1439/1,-1080.69,7494.93,40,0
    >>Kill |cRXP_ENEMY_Stormscale Sorceress|r
    >>Kill |cRXP_ENEMY_Stormscale Warriors|r
    >>Open the |cRXP_PICK_Scrolls|r. Loot it for |cRXP_LOOT_Nar'thalas Almanac, Vol. 74|r
    .complete 98013,2 --Stormscale Sorceress slain (8)
    .complete 98013,3 --Stormscale Warrior slain (6)
    .complete 78124,1 --Nar'thalas Almanac, Vol. 74 (1)
    .mob Stormscale Sorceress
    .mob Stormscale Warrior
step
    #loop
    .goto 1439/1,-303.86,7696.24,0
    .goto 1439/1,-303.86,7696.24,40,0
    .goto 1439/1,-226.57,7763.92,40,0
    >>Kill |cRXP_ENEMY_Stormscale Beastmistress|r and loot |cRXP_LOOT_Rod of Deep Dominion|r
    .complete 87760,1 --Rod of Deep Dominion (1)
    .mob Stormscale Beastmistress
step
    .xp 18 >>Grind to level 18 (Unrequited Love needs it)
step
    .goto 1439/1,489.35,6506.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archaeologist Hollee|r
    .accept 98461 >>Accept Unrequited Love
    .target Archaeologist Hollee
step
    .goto 1439/1,543.06,6342.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gwennyth Bly'Leggonde|r
    .turnin 87760 >>Turn in Holy Diver
    .target Gwennyth Bly'Leggonde
step
    .goto 1439/1,76.04,4992.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Arbal|r
    .turnin 98013 >>Turn in Swelling Forces
    .target Arbal
step
    +|cRXP_WARN_That is all of Darkshore for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Ashenvale|r: Therylune's Escape, The Sleeper Has Awakened
    >>|cRXP_FRIENDLY_Darnassus|r: The Absent Minded Prospector
    >>|cRXP_FRIENDLY_Ironforge|r: The Powers Below
    >>|cRXP_FRIENDLY_Undercity|r: Nar'thalas Almanac
    >>|cRXP_FRIENDLY_Wetlands|r: Unrequited Love
step
    +|cRXP_WARN_Suggested next zones at level 18|r: |cRXP_FRIENDLY_Ashenvale|r (about 0.7 levels of quests, starting around Shindrell Swiftfire; 6 quests from here hand in there), |cRXP_FRIENDLY_Zephras Isle|r (about 0.6 levels of quests, starting around Elegael Thornpaw). Completing this step loads the guide for Ashenvale --RouteBuilder:next
step
    +|cRXP_WARN_The rest of Darkshore is planned from level 21.|r Load its guide for level 21 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 10 - 22 Darkshore
#subweight -10
#name 21-22 Darkshore

step
    .goto 1439/1,-6.49,4608.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Volcor|r
    .accept 994 >>Accept Escape Through Force
    .target Volcor
    .isQuestTurnedIn 993 --any of: A Lost Master
step
    .goto 1439/1,195.91,4763.15
    >>Help Volcor to the road
    .complete 994,1 --Help Volcor to the road
    .isOnQuest 994
step
    .goto 1439/1,362.93,6434.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Terenthis|r
    .turnin 994 >>Turn in Escape Through Force
    .target Terenthis
    .isOnQuest 994
step
    .goto 1439/1,368.83,6435.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Selarin|r
    .accept 990 >>Accept Trek to Ashenvale
    .target Sentinel Selarin
    .isQuestTurnedIn 994,995 --any of: Escape Through Force, Escape Through Stealth
step
    .goto 1439/1,577.12,6371.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gubber Blump|r
    .turnin 1141 >>Turn in The Family and the Fishing Pole
    .target Gubber Blump
    .isQuestComplete 1141
step
    +|cRXP_WARN_End of the Darkshore route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Ashenvale|r: Trek to Ashenvale
]])
