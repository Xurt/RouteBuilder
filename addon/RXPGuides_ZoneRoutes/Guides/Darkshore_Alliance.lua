-- 10-21 Darkshore: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 3 parts with a level check between them (from level 10, 14, 18).
-- Edit zones/Darkshore.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#name 10-21 Darkshore

step << Warrior
    .goto 1439/1,383.89,6431.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Elissa Starbreeze|r
    .accept 1684 >>Accept Elanaria
    .target Sentinel Elissa Starbreeze
step
    .goto 1439/1,543.06,6342.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gwennyth Bly'Leggonde|r
    .accept 3524 >>Accept Washed Ashore
    .target Gwennyth Bly'Leggonde
step
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
step
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
    .goto 1439/1,491.97,6580.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thundris Windweaver|r
    .turnin 97926 >>Turn in Making Do
    .target Thundris Windweaver
    .isOnQuest 97926
step
    .goto 1439/1,445.46,6535.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gorbold Steelhand|r
    .turnin 97894 >>Turn in Business in Auberdine
    .target Gorbold Steelhand
    .isOnQuest 97894
step
    .goto 1439/1,397.65,6437.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tharnariun Treetender|r
    .accept 2118 >>Accept Plagued Lands
    .target Tharnariun Treetender
step
    .goto 1439/1,533.23,6399.77
    >>Talk to |cRXP_FRIENDLY_Laird|r
    >>|cRXP_BUY_Buy up to 20|r |T133918:0|t[Longjaw Mud Snappers] |cRXP_BUY_from him|r
    .vendor >> Vendor Trash
    .collect 4592,20,983,1
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
    .goto 1439/1,911.82,4448.75,0
    .goto 1439/1,911.82,4448.75,40,0
    .goto 1439/1,883.66,4422.98,40,0
    .goto 1439/1,938.02,4381.94,40,0
    .goto 1439/1,991.73,4353.99,40,0
    .goto 1439/1,1067.06,4367.96,40,0
    .goto 1439/1,1005.49,4388.05,40,0
    .goto 1439/1,999.59,4419.93,40,0
    .goto 1439/1,938.02,4418.18,40,0
    >>Kill |cRXP_ENEMY_Pygmy Tide Crawlers|r, |cRXP_ENEMY_Tide Crawlers|r, |cRXP_ENEMY_Encrusted Tide Crawlers|r and |cRXP_ENEMY_Young Reef Crawlers|r. Loot them for |cRXP_LOOT_Crawler Leg|r
    .complete 983,1 --Crawler Leg (6)
    .mob Pygmy Tide Crawler
    .mob Tide Crawler
    .mob Encrusted Tide Crawler
    .mob Young Reef Crawler
step
    .goto 1439/1,559.43,6109.83
    >>Open the |cRXP_PICK_Beached Sea Creature|r. Loot it for |cRXP_LOOT_Sea Creature Bones|r
    .complete 3524,1 --Sea Creature Bones (1)
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
    .goto 1439/1,857.46,6311.13
    >>Open the |cRXP_PICK_Skeletal Sea Turtle|r. Loot it for |cRXP_LOOT_Sea Turtle Remains|r
    .complete 4681,1 --Sea Turtle Remains (1)
step
    .goto 1439/1,543.06,6342.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gwennyth Bly'Leggonde|r
    .turnin 4681 >>Turn in Washed Ashore
    .target Gwennyth Bly'Leggonde
step
    .goto 1439/1,397.65,6437.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tharnariun Treetender|r
    .turnin 2118 >>Turn in Plagued Lands
    .accept 2138 >>Accept Cleansing of the Infected
    .target Tharnariun Treetender
step
    .goto 1439/1,362.93,6434.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Terenthis|r
    .accept 985 >>Accept How Big a Threat?
    .target Terenthis
    .isQuestTurnedIn 984 --any of: How Big a Threat?
    .xp <10,1
step
    .goto 1439/1,362.93,6434.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Terenthis|r
    .accept 4761 >>Accept Thundris Windweaver
    .target Terenthis
    .isQuestTurnedIn 984 --any of: How Big a Threat?
    .xp <11,1
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
    .target Thundris Windweaver
    .isOnQuest 4761
step
    .goto 1439/1,491.97,6580.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thundris Windweaver|r
    .accept 958 >>Accept Tools of the Highborne
    .target Thundris Windweaver
step
    #loop
    .goto 1439/1,580.39,6985.78,0
    .goto 1439/1,580.39,6985.78,40,0
    .goto 1439/1,554.85,7056.52,40,0
    .goto 1439/1,531.27,7125.95,40,0
    .goto 1439/1,588.91,7107.61,40,0
    .goto 1439/1,620.35,7046.48,40,0
    .goto 1439/1,689.12,7039.49,40,0
    .goto 1439/1,742.83,7080.54,40,0
    .goto 1439/1,724.49,6976.17,40,0
    .goto 1439/1,653.10,6977.05,40,0
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
step
    .goto 1439/1,48.53,6748.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Asterion|r
    .accept 955 >>Accept Bashal'Aran
    .target Asterion
    .isQuestTurnedIn 954 --any of: Bashal'Aran
    .xp <7,1
step
    #loop
    .goto 1439/1,5.96,6752.16,0
    .goto 1439/1,5.96,6752.16,40,0
    .goto 1439/1,-15.00,6678.37,40,0
    .goto 1439/1,-85.09,6678.37,40,0
    .goto 1439/1,-146.66,6691.90,40,0
    .goto 1439/1,-130.94,6753.91,40,0
    .goto 1439/1,-218.05,6734.26,40,0
    .goto 1439/1,-131.59,6621.16,40,0
    .goto 1439/1,-31.38,6580.99,40,0
    .goto 1439/1,57.05,6654.79,40,0
    >>Kill |cRXP_ENEMY_Vile Sprites|r and |cRXP_ENEMY_Wild Grells|r. Loot them for |cRXP_LOOT_Grell Earring|r
    .complete 955,1 --Grell Earring (8)
    .mob Vile Sprite
    .mob Wild Grell
    .isOnQuest 955
step
    .goto 1439/1,48.53,6748.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Asterion|r
    .turnin 955 >>Turn in Bashal'Aran
    .target Asterion
    .isOnQuest 955
step
    .goto 1439/1,48.53,6748.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Asterion|r
    .accept 956 >>Accept Bashal'Aran
    .target Asterion
    .isQuestTurnedIn 955 --any of: Bashal'Aran
    .xp <7,1
step
    #loop
    .goto 1439/1,-35.96,6739.50,0
    .goto 1439/1,-35.96,6739.50,40,0
    .goto 1439/1,-113.25,6622.04,40,0
    .goto 1439/1,-32.03,6598.46,40,0
    >>Kill |cRXP_ENEMY_Deth'ryll Satyr|r and loot |cRXP_LOOT_Ancient Moonstone Seal|r
    .complete 956,1 --Ancient Moonstone Seal (1)
    .mob Deth'ryll Satyr
    .isOnQuest 956
step
    .goto 1439/1,48.53,6748.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Asterion|r
    .turnin 956 >>Turn in Bashal'Aran
    .target Asterion
    .isOnQuest 956
step
    .goto 1439/1,48.53,6748.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Asterion|r
    .accept 957 >>Accept Bashal'Aran
    .target Asterion
    .isQuestTurnedIn 956 --any of: Bashal'Aran
    .xp <7,1
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
step
    .goto 1439/1,488.69,6564.830,0,0
    >>Talk to |cRXP_FRIENDLY_Dalmond|r
    .vendor >> Vendor Trash
    .target Dalmond
step
    #loop
    .goto 1439/1,332.15,5977.95,0
    .goto 1439/1,332.15,5977.95,40,0
    .goto 1439/1,365.55,5989.74,40,0
    .goto 1439/1,343.94,5960.05,40,0
    .goto 1439/1,376.69,5871.41,40,0
    .goto 1439/1,349.18,5874.90,40,0
    .goto 1439/1,306.60,5874.46,40,0
    >>Kill |cRXP_ENEMY_Blackwood Pathfinders|r
    .complete 985,1 --Blackwood Pathfinder slain (8)
    .mob Blackwood Pathfinder
    .isOnQuest 985
step
    #loop
    .goto 1439/1,338.04,5881.89,0
    .goto 1439/1,338.04,5881.89,40,0
    .goto 1439/1,325.60,5909.40,40,0
    .goto 1439/1,306.60,5959.18,40,0
    .goto 1439/1,313.81,6028.17,40,0
    .goto 1439/1,383.24,6035.16,40,0
    .goto 1439/1,362.93,6007.21,40,0
    .goto 1439/1,387.17,5985.38,40,0
    .goto 1439/1,346.56,5973.59,40,0
    .goto 1439/1,363.59,5858.31,40,0
    >>Kill |cRXP_ENEMY_Blackwood Windtalkers|r
    .complete 985,2 --Blackwood Windtalker slain (5)
    .mob Blackwood Windtalker
    .isOnQuest 985
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
    .goto 1439/1,211.63,5748.70,0
    .goto 1439/1,211.63,5748.70,40,0
    .goto 1439/1,196.56,5830.36,40,0
    .goto 1439/1,79.97,5790.62,40,0
    .goto 1439/1,137.61,5705.47,40,0
    .goto 1439/1,54.43,5690.19,40,0
    .goto 1439/1,57.70,5626.00,40,0
    .goto 1439/1,106.83,5566.18,40,0
    .goto 1439/1,179.53,5626.87,40,0
    .goto 1439/1,250.93,5589.76,40,0
    >>Kill |cRXP_ENEMY_Cursed Highbornes|r, |cRXP_ENEMY_Writhing Highbornes|r and |cRXP_ENEMY_Wailing Highbornes|r. Loot them for |cRXP_LOOT_Highborne Relic|r
    >>Click the |cRXP_PICK_The Fall of Ameth'Aran|r
    .complete 958,1 --Highborne Relic (7)
    .complete 953,2 --Read the Fall of Ameth'Aran
    .mob Cursed Highborne
    .mob Writhing Highborne
    .mob Wailing Highborne
step
    .goto 1439/1,166.43,5633.86
    >>Click the |cRXP_PICK_Ancient Flame|r
    .complete 957,1 --Destroy the seal at the ancient flame
    .isOnQuest 957
step
    #loop
    .goto 1439/1,105.52,5770.97,0
    .goto 1439/1,105.52,5770.97,40,0
    .goto 1439/1,106.83,5806.78,40,0
    .goto 1439/1,73.42,5793.24,40,0
    .goto 1439/1,20.37,5782.76,40,0
    .goto 1439/1,-22.21,5870.10,40,0
    .goto 1439/1,-35.96,5805.03,40,0
    .goto 1439/1,-12.38,5745.65,40,0
    .goto 1439/1,27.57,5698.49,40,0
    .goto 1439/1,57.70,5737.79,40,0
    >>Click the |cRXP_PICK_The Lay of Ameth'Aran|r
    >>Kill |cRXP_ENEMY_Jai'vhanel|r and loot |cRXP_LOOT_Feather of Jai'vhanel|r
    .complete 953,1 --Read the Lay of Ameth'Aran
    .complete 98025,1 --Feather of Jai'vhanel (1)
    .mob Jai'vhanel
step
    .goto 1439/1,302.02,5725.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Tysha Moonblade|r
    .turnin 953 >>Turn in The Fall of Ameth'Aran
    .target Sentinel Tysha Moonblade
step
    .goto 1439/1,543.06,6342.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gwennyth Bly'Leggonde|r
    .turnin 4722 >>Turn in Beached Sea Turtle
    .turnin 4723 >>Turn in Beached Sea Creature
    .target Gwennyth Bly'Leggonde
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
    .goto 1439/1,472.32,6437.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Glynda Nal'Shea|r
    .turnin 98025 >>Turn in WANTED: Jai'vhanel
    .target Sentinel Glynda Nal'Shea
step
    .goto 1439/1,362.93,6434.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Terenthis|r
    .turnin 985 >>Turn in How Big a Threat?
    .target Terenthis
    .isOnQuest 985
step << NightElf
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gorbold Steelhand|r
    .vendor >>|cRXP_BUY_Buy a|r [Shiny Bauble] |cRXP_BUY_and three|r |T134324:0|t[Nightcrawlers] |cRXP_BUY_from him. You will need them for a quest in Stormwind soon|r
    .collect 6529,1
    .collect 6530,3
    .target Gorbold Steelhand
step
    .goto 1439/1,491.97,6580.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thundris Windweaver|r
    .turnin 958 >>Turn in Tools of the Highborne
    .target Thundris Windweaver
step
    .goto 1439/1,48.53,6748.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Asterion|r
    .turnin 957 >>Turn in Bashal'Aran
    .target Asterion
    .isOnQuest 957
step << NightElf Druid/Skyborne Druid
    .goto 1439/1,-655.59,6878.80
    >>Open the |cRXP_PICK_Cliffspring Falls Cave Mouth|r. Loot it for |cRXP_LOOT_Filled Cliffspring Falls Sampler|r
    .complete 6122,1 --Filled Cliffspring Falls Sampler (1)
    .isOnQuest 6122
step << NightElf Druid/Skyborne Druid
    #completewith next
    .hs >>Hearth to Innkeeper Shaussiy's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step << NightElf Druid/Skyborne Druid
    .goto 1439/1,472.97,6557.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alanndarian Nightsong|r
    .turnin 6122 >>Turn in The Principal Source
    .target Alanndarian Nightsong
    .isOnQuest 6122
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
step
    .goto 1439/1,489.35,6506.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archaeologist Hollee|r
    .turnin 730 >>Turn in Trouble In Darkshore?
    .target Archaeologist Hollee
    .isOnQuest 730
step
    #loop
    .goto 1439/1,-119.15,6870.06,0
    .goto 1439/1,-119.15,6870.06,40,0
    .goto 1439/1,-169.58,6844.74,40,0
    .goto 1439/1,-241.63,6795.83,40,0
    .goto 1439/1,-281.59,6785.79,40,0
    .goto 1439/1,-292.72,6873.12,40,0
    .goto 1439/1,-230.50,6873.56,40,0
    .goto 1439/1,-175.48,6890.15,40,0
    .goto 1439/1,-146.00,6970.06,40,0
    .goto 1439/1,-146.00,6919.41,40,0
    >>Kill |cRXP_ENEMY_Rabid Thistle Bears|r
    .complete 2138,1 --Rabid Thistle Bear slain (20)
    .mob Rabid Thistle Bear
step
    .goto 1439/1,397.65,6437.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tharnariun Treetender|r
    .turnin 2138 >>Turn in Cleansing of the Infected
    .target Tharnariun Treetender
step
    .goto 1439/1,445.46,6535.58
    .target Gorbold Steelhand
    >>Talk to |cRXP_FRIENDLY_Gorbold Steelhand|r
    .vendor >> Buy some Mild Spices from Gorbold until you have enough to cook all your eggs
step
    .goto 1439/1,89.14,5002.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Onu|r
    .turnin 952 >>Turn in Grove of the Ancients
    .target Onu
    .isOnQuest 952
step
    +|cRXP_WARN_That is all of Darkshore for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Darnassus|r: Elanaria << Warrior
    >>|cRXP_FRIENDLY_Teldrassil|r: Return to Nessa << NightElf
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: The Family and the Fishing Pole
step
    .xp 14 >>|cRXP_WARN_The rest of Darkshore is planned from level 14.|r Come back to this guide then
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
    .goto 1439/1,472.32,6437.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Glynda Nal'Shea|r
    .accept 4812 >>Accept As Water Cascades
    .target Sentinel Glynda Nal'Shea
    .isQuestTurnedIn 4811 --any of: The Red Crystal
    .xp <12,1
step
    .goto 1439/1,467.08,6410.69
    >>Open the |cRXP_PICK_Auberdine Moonwell|r. Loot it for |cRXP_LOOT_Moonwell Water Tube|r
    .complete 4812,1 --Moonwell Water Tube (1)
    .isOnQuest 4812
step
    .goto 1439/1,600.70,6424.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cerellean Whiteclaw|r
    .accept 963 >>Accept For Love Eternal
    .target Cerellean Whiteclaw
step
    .goto 1439/1,497.21,6427.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barithras Moonshade|r
    .accept 947 >>Accept Cave Mushrooms
    .target Barithras Moonshade
step
    .goto 1439/1,561.40,6343.01
    .fp Auberdine >> Get the Auberdine flight path
step
    .goto 1439/1,491.97,6580.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thundris Windweaver|r
    .accept 4762 >>Accept The Cliffspring River
    .target Thundris Windweaver
    .isQuestTurnedIn 4761 --any of: Thundris Windweaver
    .xp <11,1
step
    .goto 1439/1,193.29,7083.59
    >>Click the |cRXP_PICK_Buzzbox 411|r
    .accept 1002 >>Accept Buzzbox 323
step
    .goto 1439/1,-157.79,6207.64
    >>Click the |cRXP_PICK_Mysterious Red Crystal|r
    .turnin 4812 >>Turn in As Water Cascades
    .isOnQuest 4812
step
    .goto 1439/1,-157.79,6207.64
    >>Click the |cRXP_PICK_Mysterious Red Crystal|r
    .accept 4813 >>Accept The Fragments Within
    .isQuestTurnedIn 4812 --any of: As Water Cascades
    .xp <12,1
step
    #completewith next
    .hs >>Hearth to Innkeeper Shaussiy's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1439/1,472.32,6437.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Glynda Nal'Shea|r
    .turnin 4813 >>Turn in The Fragments Within
    .target Sentinel Glynda Nal'Shea
    .isOnQuest 4813
step
    .goto 1439/1,203.11,5681.46
    >>Kill |cRXP_ENEMY_Anaya Dawnrunner|r and loot |cRXP_LOOT_Anaya's Pendant|r
    .complete 963,1 --Anaya's Pendant (1)
    .mob Anaya Dawnrunner
step
    #completewith next
    .hs >>Hearth to Innkeeper Shaussiy's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1439/1,600.70,6424.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cerellean Whiteclaw|r
    .turnin 963 >>Turn in For Love Eternal
    .target Cerellean Whiteclaw
step
    .goto 1439/1,362.93,6434.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Terenthis|r
    .accept 986 >>Accept A Lost Master
    .target Terenthis
    .isQuestTurnedIn 985 --any of: How Big a Threat?
    .xp <10,1
step
    .goto 1439/1,383.89,6431.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Elissa Starbreeze|r
    .accept 965 >>Accept The Tower of Althalaxx
    .target Sentinel Elissa Starbreeze
step
    .goto 1439/1,445.46,6535.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gorbold Steelhand|r
    .accept 982 >>Accept Deep Ocean, Vast Sea
    .target Gorbold Steelhand
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
step
    .goto 1439/1,491.97,6580.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thundris Windweaver|r
    .accept 97914 >>Accept Expanding Horizons
    .target Thundris Windweaver
step
    .goto 1439/1,577.12,6371.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gubber Blump|r
    .accept 1138 >>Accept Fruit of the Sea
    .target Gubber Blump
step
    .goto 1439/1,47.22,7433.80
    >>Click the |cRXP_PICK_Beached Sea Turtle|r
    .accept 4725 >>Accept Beached Sea Turtle
step
    .goto 1439/1,-388.35,7214.16
    >>Open the |cRXP_PICK_Cliffspring River Waterfall|r. Loot it for |cRXP_LOOT_Cliffspring River Sample|r
    .complete 4762,1 --Cliffspring River Sample (1)
    .isOnQuest 4762
step
    .goto 1439/1,-658.87,7246.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Balthule Shadowstrike|r
    .turnin 965 >>Turn in The Tower of Althalaxx
    .accept 966 >>Accept The Tower of Althalaxx
    .target Balthule Shadowstrike
step
    #loop
    .goto 1439/1,-709.96,7201.93,0
    .goto 1439/1,-709.96,7201.93,40,0
    .goto 1439/1,-735.50,7223.76,40,0
    .goto 1439/1,-759.08,7208.48,40,0
    .goto 1439/1,-848.82,7215.03,40,0
    .goto 1439/1,-811.48,7183.59,40,0
    .goto 1439/1,-796.42,7141.23,40,0
    .goto 1439/1,-728.95,7173.55,40,0
    .goto 1439/1,-667.38,7113.29,40,0
    .goto 1439/1,-673.93,7173.98,40,0
    >>Kill |cRXP_ENEMY_Dark Strand Fanatics|r. Loot them for |cRXP_LOOT_Worn Parchment|r
    .complete 966,1 --Worn Parchment (4)
    .mob Dark Strand Fanatic
step
    .goto 1439/1,-658.87,7246.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Balthule Shadowstrike|r
    .turnin 966 >>Turn in The Tower of Althalaxx
    .accept 967 >>Accept The Tower of Althalaxx
    .target Balthule Shadowstrike
step
    #loop
    .goto 1439/1,-679.17,6848.67,0
    .goto 1439/1,-679.17,6848.67,40,0
    .goto 1439/1,-669.35,6822.90,40,0
    .goto 1439/1,-661.49,6725.96,40,0
    .goto 1439/1,-709.96,6752.60,40,0
    .goto 1439/1,-694.24,6792.77,40,0
    .goto 1439/1,-709.96,6826.40,40,0
    .goto 1439/1,-769.56,6796.70,40,0
    .goto 1439/1,-766.29,6829.89,40,0
    .goto 1439/1,-795.11,6857.84,40,0
    >>Pick up |cRXP_PICK_Scaber Stalk|r from the ground
    >>Pick up |cRXP_PICK_Death Cap|r from the ground
    .complete 947,1 --Scaber Stalk (5)
    .complete 947,2 --Death Cap (1)
step
    .goto 1439/1,491.97,6580.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thundris Windweaver|r
    .turnin 4762 >>Turn in The Cliffspring River
    .target Thundris Windweaver
    .isOnQuest 4762
step
    .goto 1439/1,491.97,6580.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thundris Windweaver|r
    .accept 4763 >>Accept The Blackwood Corrupted
    .target Thundris Windweaver
    .isQuestTurnedIn 4762 --any of: The Cliffspring River
    .xp <15,1
step << NightElf Druid
    .goto 1439/1,472.97,6557.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alanndarian Nightsong|r
    .accept 6123 >>Accept Gathering the Cure
    .target Alanndarian Nightsong
    .isQuestTurnedIn 6122 --any of: The Principal Source
    .xp <14,1
step
    .goto 1439/1,489.35,6506.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archaeologist Hollee|r
    .accept 729 >>Accept The Absent Minded Prospector
    .target Archaeologist Hollee
step
    .goto 1439/1,488.69,6564.830
    >>Talk to |cRXP_FRIENDLY_Dalmond|r
    .vendor 4182 >> |cRXP_BUY_Buy as many|r |T133634:0|t[Small Brown Pouches] |cRXP_BUY_as you need/can|r
    .target Dalmond
    .money <0.0500
    .money >0.2500
step
    .goto 1439/1,488.69,6564.830
    >>Talk to |cRXP_FRIENDLY_Dalmond|r
    .vendor 4182 >> |cRXP_BUY_Buy a|r |T133634:0|t[Brown Leather Satchel] |cRXP_BUY_from him|r
    .target Dalmond
    .money <0.2500
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
step
    .goto 1439/1,533.23,6399.77
    >>Talk to |cRXP_FRIENDLY_Laird|r
    >>|cRXP_BUY_Buy up to 20|r |T133918:0|t[Longjaw Mud Snappers] |cRXP_BUY_from him|r
    .vendor >> Vendor Trash
    .collect 4592,20,4763,1
    .target Laird
    .isOnQuest 982
step << NightElf Druid
    .goto 1439/1,343.28,5189.77
    >>Pick up |cRXP_PICK_Earthroot|r from the ground
    .complete 6123,1 --Earthroot (5)
    .isOnQuest 6123
step << NightElf Druid
    #loop
    .goto 1439/1,88.49,6133.41,0
    .goto 1439/1,88.49,6133.41,40,0
    .goto 1439/1,60.98,6128.17,40,0
    .goto 1439/1,91.76,6189.30,40,0
    >>Loot the |cRXP_PICK_Lunar Fungal Blooms|r for |cRXP_LOOT_Lunar Fungus|r
    .complete 6123,2 --Lunar Fungus (12)
    .isOnQuest 6123
step
    .goto 1439/1,89.14,5002.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Onu|r
    .turnin 948 >>Turn in Onu
    .target Onu
step
    .goto 1439/1,413.37,4569.27
    >>Click the |cRXP_PICK_Scrying Bowl|r
    .accept 949 >>Accept The Twilight Camp
    .isQuestTurnedIn 944 --any of: The Master's Glaive
    .xp <12,1
step
    .goto 1439/1,417.30,4575.82
    >>Click the |cRXP_PICK_Twilight Tome|r
    .turnin 949 >>Turn in The Twilight Camp
    .isOnQuest 949
step
    .goto 1439/1,417.30,4575.82
    >>Click the |cRXP_PICK_Twilight Tome|r
    .accept 950 >>Accept Return to Onu
    .isQuestTurnedIn 949 --any of: The Twilight Camp
    .xp <12,1
step
    .goto 1439/1,417.30,4575.82
    >>Click the |cRXP_PICK_Twilight Tome|r
    .accept 98042 >>Accept It's All Fun and Games Until...
step
    #completewith Drop968x1
    >>|cRXP_LOOT_Book: The Powers Below|r can drop from |cRXP_ENEMY_Twilight Disciple|r, |cRXP_ENEMY_Twilight Thug|r. Use it to start the quest if you get one
    .collect 5352,1,968 --Book: The Powers Below (1)
    .accept 968 >>Accept The Powers Below
    .use 5352
step
    #label Drop968x1
    #loop
    .goto 1439/1,416.64,4565.77,0
    .goto 1439/1,416.64,4565.77,40,0
    .goto 1439/1,441.53,4591.10,40,0
    .goto 1439/1,404.20,4606.38,40,0
    .goto 1439/1,368.83,4612.93,40,0
    .goto 1439/1,345.90,4578.87,40,0
    .goto 1439/1,378.00,4553.11,40,0
    .goto 1439/1,354.42,4488.48,40,0
    .goto 1439/1,396.99,4501.58,40,0
    .goto 1439/1,438.91,4525.16,40,0
    >>Kill |cRXP_ENEMY_Twilight Disciples|r and |cRXP_ENEMY_Twilight Thugs|r. Loot them for |cRXP_LOOT_Peerless Eye|r
    .complete 98042,1 --Peerless Eye (1)
    .mob Twilight Disciple
    .mob Twilight Thug
step
    .goto 1439/1,89.14,5002.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Onu|r
    .turnin 950 >>Turn in Return to Onu
    .target Onu
    .isOnQuest 950
step << Hunter
    .goto 1439/1,417.30,4575.82
    .xp 17 >> Grind to level 17
step
    .goto 1439/1,601.35,4678.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Remtravel|r
    .turnin 729 >>Turn in The Absent Minded Prospector
    .target Prospector Remtravel
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
step
    .goto 1439/1,491.97,6580.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thundris Windweaver|r
    .turnin 98042 >>Turn in It's All Fun and Games Until...
    .target Thundris Windweaver
step
    .goto 1439/1,489.35,6506.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archaeologist Hollee|r
    .accept 741 >>Accept The Absent Minded Prospector
    .target Archaeologist Hollee
    .isQuestTurnedIn 731 --any of: The Absent Minded Prospector
    .xp <15,1
step << Hunter
    .goto 1439/1,491.97,6560.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dalmond|r
    .vendor >>|cRXP_BUY_Restock on Ammo|r
    .target Dalmond
step
    .goto 1439/1,467.08,6410.69
    >>Open the |cRXP_PICK_Auberdine Moonwell|r. Loot it for |cRXP_LOOT_Filled Cleansing Bowl|r
    .collect 12347,1,4763,1 --Filled Cleansing Bowl (1)
    .isOnQuest 4763
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
step << NightElf Druid
    #completewith next
    .hs >>Hearth to Innkeeper Shaussiy's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step << NightElf Druid
    .goto 1439/1,472.97,6557.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alanndarian Nightsong|r
    .turnin 6123 >>Turn in Gathering the Cure
    .target Alanndarian Nightsong
    .isOnQuest 6123
step << NightElf Druid
    .goto 1439/1,472.97,6557.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alanndarian Nightsong|r
    .accept 6124 >>Accept Curing the Sick
    .target Alanndarian Nightsong
    .isQuestTurnedIn 6123 --any of: Gathering the Cure
    .xp <14,1
step
    .goto 1439/1,-495.77,6875.30
    >>Open the |cRXP_PICK_Xabraxxis' Demon Bag|r. Loot it for |cRXP_LOOT_Talisman of Corruption|r
    .complete 4763,1 --Talisman of Corruption (1)
    .isOnQuest 4763
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
    .goto 1439/1,296.12,4367.53,0
    .goto 1439/1,296.12,4367.53,40,0
    .goto 1439/1,351.14,4379.75,40,0
    .goto 1439/1,417.95,4381.50,40,0
    .goto 1439/1,525.37,4417.31,40,0
    .goto 1439/1,552.88,4383.68,40,0
    .goto 1439/1,545.02,4337.83,40,0
    .goto 1439/1,483.45,4319.06,40,0
    .goto 1439/1,487.38,4272.77,40,0
    .goto 1439/1,360.31,4324.73,40,0
    >>Kill |cRXP_ENEMY_Moonstalkers|r, |cRXP_ENEMY_Moonstalker Runts|r, |cRXP_ENEMY_Moonstalker Matriarches|r and |cRXP_ENEMY_Moonstalker Sires|r. Loot them for |cRXP_LOOT_Moonstalker Fang|r
    .complete 1002,1 --Moonstalker Fang (6)
    .mob Moonstalker
    .mob Moonstalker Runt
    .mob Moonstalker Matriarch
    .mob Moonstalker Sire
step
    .goto 1439/1,-417.83,7260.44
    >>Click the |cRXP_PICK_Buzzbox 323|r
    .turnin 1002 >>Turn in Buzzbox 323
    .accept 1003 >>Accept Buzzbox 525
step << NightElf Druid
    #loop
    .goto 1439/1,-459.09,6903.25,0
    .goto 1439/1,-459.09,6903.25,40,0
    .goto 1439/1,-405.38,6869.19,40,0
    .goto 1439/1,-299.27,6795.83,40,0
    .goto 1439/1,-275.04,6757.84,40,0
    .goto 1439/1,-147.97,6531.21,40,0
    .goto 1439/1,-71.33,6526.41,40,0
    .goto 1439/1,74.73,6526.41,40,0
    .goto 1439/1,171.02,6604.13,40,0
    .goto 1439/1,200.49,6667.89,40,0
    >>Interact with |cRXP_FRIENDLY_Sickly Deers|r
    .complete 6124,1 --Sickly Deer (10)
    .target Sickly Deer
    .isOnQuest 6124
step
    #loop
    .goto 1439/1,316.43,4849.61,0
    .goto 1439/1,316.43,4849.61,40,0
    .goto 1439/1,367.52,4780.61,40,0
    .goto 1439/1,413.37,4818.60,40,0
    .goto 1439/1,463.80,4900.70,40,0
    .goto 1439/1,474.28,4847.86,40,0
    .goto 1439/1,482.80,4751.36,40,0
    .goto 1439/1,412.71,4733.45,40,0
    .goto 1439/1,290.88,4762.71,40,0
    .goto 1439/1,252.24,4784.11,40,0
    >>Kill |cRXP_ENEMY_Grizzled Thistle Bears|r and |cRXP_ENEMY_Den Mothers|r. Loot them for |cRXP_LOOT_Grizzled Scalp|r
    .complete 1003,1 --Grizzled Scalp (4)
    .mob Grizzled Thistle Bear
    .mob Den Mother
step
    .goto 1439/1,230.62,4815.55
    >>Click the |cRXP_PICK_Buzzbox 525|r
    .turnin 1003 >>Turn in Buzzbox 525
step
    #loop
    .goto 1439/1,-992.92,7749.51,0
    .goto 1439/1,-992.92,7749.51,40,0
    .goto 1439/1,-1048.59,7747.76,40,0
    .goto 1439/1,-1051.21,7815.01,40,0
    .goto 1439/1,-1080.03,7846.01,40,0
    .goto 1439/1,-981.78,7818.94,40,0
    >>Kill |cRXP_ENEMY_Moonstalker Matriarches|r and |cRXP_ENEMY_Moonstalker Sires|r. Loot them for |cRXP_LOOT_Fine Moonstalker Pelt|r
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .mob Moonstalker Matriarch
    .mob Moonstalker Sire
    .isOnQuest 986
step
    .goto 1439/1,-537.04,7543.84
    >>Click the |cRXP_PICK_Beached Sea Turtle|r
    .accept 4727 >>Accept Beached Sea Turtle
step
    .goto 1439/1,491.97,6580.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thundris Windweaver|r
    .turnin 4763 >>Turn in The Blackwood Corrupted
    .target Thundris Windweaver
    .isOnQuest 4763
step
    .goto 1439/1,488.69,6564.830
    >>Talk to |cRXP_FRIENDLY_Dalmond|r
    .vendor 4182 >> |cRXP_BUY_Buy a|r |T133634:0|t[Brown Leather Satchel] |cRXP_BUY_from him|r
    >>|cRXP_WARN_Do NOT go below 30 Silver|r
    .target Dalmond
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
    .xp <10,1
step
    .goto 1439/1,368.83,6435.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Selarin|r
    .accept 990 >>Accept Trek to Ashenvale
    .target Sentinel Selarin
    .isQuestTurnedIn 994,995 --any of: Escape Through Force, Escape Through Stealth
    .xp <15,1
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
    .goto 1439/1,-6.49,4608.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Volcor|r
    .turnin 993 >>Turn in A Lost Master
    .target Volcor
    .isOnQuest 993
step
    #loop
    .goto 1439/1,783.44,4714.24,0
    .goto 1439/1,783.44,4714.24,40,0
    .goto 1439/1,824.05,4678.00,40,0
    .goto 1439/1,863.35,4756.60,40,0
    .goto 1439/1,843.05,4809.00,40,0
    .goto 1439/1,799.82,4778.43,40,0
    >>Kill |cRXP_ENEMY_Encrusted Tide Crawlers|r and |cRXP_ENEMY_Reef Crawlers|r. Loot them for |cRXP_LOOT_Fine Crab Chunks|r
    .complete 1138,1 --Fine Crab Chunks (6)
    .mob Encrusted Tide Crawler
    .mob Reef Crawler
step
    .goto 1439/1,577.12,6371.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gubber Blump|r
    .turnin 1138 >>Turn in Fruit of the Sea
    .target Gubber Blump
step
    +|cRXP_WARN_That is all of Darkshore for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Ashenvale|r: The Tower of Althalaxx, Trek to Ashenvale
    >>|cRXP_FRIENDLY_Darnassus|r: The Absent Minded Prospector
    >>|cRXP_FRIENDLY_Ironforge|r: The Powers Below
    >>|cRXP_FRIENDLY_Moonglade|r: Curing the Sick << NightElf Druid
    >>|cRXP_FRIENDLY_Stormwind City|r: Expanding Horizons
step
    .xp 18 >>|cRXP_WARN_The rest of Darkshore is planned from level 18.|r Come back to this guide then
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
    .goto 1439/1,89.14,5002.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Onu|r
    .accept 951 >>Accept Mathystra Relics
    .target Onu
    .isQuestTurnedIn 950 --any of: Return to Onu
    .xp <12,1
step
    .goto 1439/1,554.85,4992.40
    >>Kill |cRXP_ENEMY_Murkdeep|r
    .complete 4740,1 --Murkdeep slain (1)
    .mob Murkdeep
step
    .goto 1439/1,74.08,4993.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Arbal|r
    .accept 98013 >>Accept Swelling Forces
    .target Arbal
step
    .goto 1439/1,472.32,6437.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Glynda Nal'Shea|r
    .turnin 4740 >>Turn in WANTED: Murkdeep!
    .target Sentinel Glynda Nal'Shea
step
    .goto 1439/1,489.35,6506.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archaeologist Hollee|r
    .accept 98461 >>Accept Unrequited Love
    .target Archaeologist Hollee
    .xp <18,1
step
    .goto 1439/1,-430.27,6662.65
    >>Kill |cRXP_ENEMY_Den Mother|r
    .complete 2139,1 --Den Mother slain (1)
    .mob Den Mother
step
    #loop
    .goto 1439/1,-861.92,7259.57,0
    .goto 1439/1,-861.92,7259.57,40,0
    .goto 1439/1,-873.05,7344.28,40,0
    .goto 1439/1,-782.01,7352.58,40,0
    .goto 1439/1,-835.72,7401.92,40,0
    .goto 1439/1,-804.28,7475.72,40,0
    .goto 1439/1,-905.15,7442.97,40,0
    .goto 1439/1,-946.41,7387.08,40,0
    .goto 1439/1,-1028.29,7328.56,40,0
    .goto 1439/1,-954.93,7247.78,40,0
    >>Kill |cRXP_ENEMY_Stormscale Myrmidons|r
    >>Kill |cRXP_ENEMY_Stormscale Sorceress|r
    .complete 98013,1 --Stormscale Myrmidon slain (12)
    .complete 98013,2 --Stormscale Sorceress slain (8)
    .mob Stormscale Myrmidon
    .mob Stormscale Sorceress
step
    #loop
    .goto 1439/1,-345.12,7674.40,0
    .goto 1439/1,-345.12,7674.40,40,0
    .goto 1439/1,-280.28,7667.85,40,0
    .goto 1439/1,-189.23,7707.15,40,0
    .goto 1439/1,-226.57,7763.92,40,0
    .goto 1439/1,-224.60,7839.46,40,0
    .goto 1439/1,-286.83,7861.30,40,0
    .goto 1439/1,-351.02,7834.22,40,0
    .goto 1439/1,-281.59,7775.71,40,0
    .goto 1439/1,-309.10,7723.31,40,0
    >>Kill |cRXP_ENEMY_Stormscale Beastmistress|r and loot |cRXP_LOOT_Rod of Deep Dominion|r
    .complete 87760,1 --Rod of Deep Dominion (1)
    .mob Stormscale Beastmistress
step
    #loop
    .goto 1439/1,-975.89,7502.36,0
    .goto 1439/1,-975.89,7502.36,40,0
    .goto 1439/1,-1085.93,7439.04,40,0
    .goto 1439/1,-1123.26,7395.37,40,0
    .goto 1439/1,-1041.39,7319.83,40,0
    .goto 1439/1,-985.06,7284.46,40,0
    .goto 1439/1,-886.81,7240.36,40,0
    .goto 1439/1,-892.05,7274.42,40,0
    .goto 1439/1,-1008.64,7384.89,40,0
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
    .goto 1439/1,-785.28,7763.48,0
    .goto 1439/1,-785.28,7763.48,40,0
    .goto 1439/1,-751.88,7787.06,40,0
    .goto 1439/1,-763.67,7835.53,40,0
    .goto 1439/1,-671.31,7801.47,40,0
    .goto 1439/1,-679.17,7784.01,40,0
    .goto 1439/1,-690.96,7782.26,40,0
    .goto 1439/1,-745.98,7699.73,40,0
    .goto 1439/1,-750.57,7623.31,40,0
    .goto 1439/1,-823.27,7698.86,40,0
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
    #loop
    .goto 1439/1,-884.19,7712.83,0
    .goto 1439/1,-884.19,7712.83,40,0
    .goto 1439/1,-916.28,7752.13,40,0
    .goto 1439/1,-954.93,7782.70,40,0
    >>Kill |cRXP_ENEMY_Giant Foreststrider|r and loot |cRXP_LOOT_Top of Gelkak's Key|r
    .complete 2098,1 --Top of Gelkak's Key (1)
    .mob Giant Foreststrider
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
    #loop
    .goto 1439/1,-994.88,7513.27,0
    .goto 1439/1,-994.88,7513.27,40,0
    .goto 1439/1,-1006.67,7450.83,40,0
    .goto 1439/1,-1007.33,7357.82,40,0
    .goto 1439/1,-1059.73,7323.76,40,0
    .goto 1439/1,-1120.64,7370.92,40,0
    .goto 1439/1,-1131.12,7439.91,40,0
    .goto 1439/1,-1072.17,7424.63,40,0
    .goto 1439/1,-1080.69,7494.93,40,0
    .goto 1439/1,-1055.14,7559.12,40,0
    >>Kill |cRXP_ENEMY_Stormscale Warriors|r
    .complete 98013,3 --Stormscale Warrior slain (6)
    .mob Stormscale Warrior
step
    .goto 1439/1,397.65,6437.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tharnariun Treetender|r
    .turnin 2139 >>Turn in Tharnariun's Hope
    .target Tharnariun Treetender
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
    .goto 1439/1,74.08,4993.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Arbal|r
    .turnin 98013 >>Turn in Swelling Forces
    .target Arbal
step
    .goto 1439/1,89.14,5002.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Onu|r
    .turnin 951 >>Turn in Mathystra Relics
    .target Onu
    .isOnQuest 951
step
    +|cRXP_WARN_End of the Darkshore route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Wetlands|r: Unrequited Love
]])
