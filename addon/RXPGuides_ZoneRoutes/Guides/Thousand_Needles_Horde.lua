-- 25-40 Thousand Needles: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 4 parts (from level 25, 28, 31, 34).
-- Split into 4 guides, listed under "25 - 35 Thousand Needles" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Thousand Needles.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 25 - 35 Thousand Needles
#subweight -25
#name 25-26 Thousand Needles: around Cliffwatcher Longhorn

step
    .goto 1441/1,-1835.17,-4602.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grish Longrunner|r
    .turnin 5881 >>Turn in Calling in the Reserves
    .target Grish Longrunner
    .isOnQuest 5881
step
    .goto 1441/1,-1851.89,-4616.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brave Moonhorn|r
    .accept 4542 >>Accept Message to Freewind Post
    .target Brave Moonhorn
step
    .goto 1441/1,-2168.25,-4937.60
    >>Kill |cRXP_ENEMY_Galak Messenger|r and loot |cRXP_LOOT_Assassination Note|r. Use it to start the quest
    .collect 12564,1,4881 --Assassination Note (1)
    .accept 4881 >>Accept Assassination Plot
    .use 12564
    .mob Galak Messenger
step
    .goto 1441/1,-2442.81,-5455.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cliffwatcher Longhorn|r
    .turnin 4542 >>Turn in Message to Freewind Post
    .accept 4841 >>Accept Pacify the Centaur
    .target Cliffwatcher Longhorn
step << Shaman
    .goto 1441/1,-2463.49,-5483.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rau Cliffrunner|r
    .turnin 79358 >>Turn in Storm, Earth, and Fire
    .target Rau Cliffrunner
    .isQuestComplete 79358
step
    .goto 1441/1,-2463.49,-5483.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rau Cliffrunner|r
    .turnin 1196 >>Turn in The Sacred Flame
    .target Rau Cliffrunner
    .isOnQuest 1196
step
    .goto 1441/1,-2419.93,-5456.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Montarr|r
    .vendor >> |cRXP_BUY_Buy|r |T134831:0|t[Healing Potions] |cRXP_BUY_and|r |T134937:0|t[Scrolls] |cRXP_BUY_from him if they're up|r << !Warrior
    .vendor >> |cRXP_BUY_Buy|r |T134831:0|t[Healing Potions]|cRXP_BUY_, |r|T134937:0|t[Scrolls] |cRXP_BUY_and|r |T134413:0|t[Liferoot] |cRXP_BUY_from him if they're up|r << Warrior
    .target Montarr
    .subzoneskip 484,1
step << Hunter
    .goto 1441/1,-2408.49,-5453.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Starn|r
    .vendor >>|cRXP_BUY_Buy a|r |T135495:0|t[|cRXP_FRIENDLY_Dense Shortbow|r] |cRXP_BUY_from him if it's up|r
    .target Starn
    .money <2.7172
    .subzoneskip 484,1
step
    .goto 1441/1,-2397.49,-5441.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hagar Lightninghoof|r
    .accept 4821 >>Accept Alien Egg
    .target Hagar Lightninghoof
step
    .goto 1441/1,-2419.49,-5407.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nyse|r
    .fp Freewind Post >> Get the Freewind Post flight path
    .target Nyse
    .subzoneskip 484,1
step
    #loop
    .goto 1441/1,-2454.25,-5178.72,0
    .goto 1441/1,-2454.25,-5178.72,40,0
    .goto 1441/1,-2392.65,-5128.27,40,0
    .goto 1441/1,-2283.97,-5078.11,40,0
    .goto 1441/1,-2253.17,-5155.55,40,0
    >>Kill |cRXP_ENEMY_Galak Scouts|r
    >>Kill |cRXP_ENEMY_Galak Wranglers|r
    >>Kill |cRXP_ENEMY_Galak Windchasers|r
    .complete 4841,1 --Galak Scout slain (12)
    .complete 4841,2 --Galak Wrangler slain (10)
    .complete 4841,3 --Galak Windchaser slain (6)
    .mob Galak Scout
    .mob Galak Wrangler
    .mob Galak Windchaser
step << Orc Shaman/Tauren Shaman/Troll Shaman
    .goto 1441/1,-2789.09,-5217.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prate Cloudseer|r
    .turnin 79361 >>Turn in Storm, Earth, and Fire
    .target Prate Cloudseer
    .isQuestComplete 79361
step << Shaman
    .goto 1441/1,-2789.09,-5217.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prate Cloudseer|r
    .turnin 1532 >>Turn in Call of Air
    .target Prate Cloudseer
    .isOnQuest 1532
step
    .goto 1441/1,-2807.13,-5183.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dorn Plainstalker|r
    .turnin 1394 >>Turn in Final Passage
    .target Dorn Plainstalker
    .isOnQuest 1394
step
    .goto 1441/1,-2807.13,-5183.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dorn Plainstalker|r
    .accept 1149 >>Accept Test of Faith
    .target Dorn Plainstalker
step
    .goto 1441/1,-1596.25,-4932.61
    >>If you have faith, leap from the planks overlooking Thousand Needles.
    .complete 1149,1 --If you have faith, leap from the planks overlooking Thousand Needles.
step
    .goto 1441/1,-2807.13,-5183.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dorn Plainstalker|r
    .turnin 1149 >>Turn in Test of Faith
    .target Dorn Plainstalker
step
    .goto 1441/1,-2913.17,-5444.77
    >>Pick up |cRXP_PICK_Alien Egg|r from the ground
    .complete 4821,1 --Alien Egg (1)
step
    .goto 1441/1,-2442.81,-5455.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cliffwatcher Longhorn|r
    .turnin 4841 >>Turn in Pacify the Centaur
    .accept 5064 >>Accept Grimtotem Spying
    .target Cliffwatcher Longhorn
step
    .goto 1441/1,-2397.49,-5441.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hagar Lightninghoof|r
    .turnin 4821 >>Turn in Alien Egg
    .accept 4865 >>Accept Serpent Wild
    .target Hagar Lightninghoof
step
    .goto 1441/1,-2460.41,-5477.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Abeqwa|r
    .target Innkeeper Abeqwa
    .home >>Set your Hearthstone to Innkeeper Abeqwa's inn
step << Mage
    .goto 1441/1,-2460.41,-5477.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Abeqwa|r
    .target Innkeeper Abeqwa
    .train 3566,3
step
    .goto 1441/1,-1359.97,-4901.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Laer|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Laer Stepperunner
    .isOnQuest 1131
step
    .goto 1441/1,-1381.09,-4915.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Motega Firemane|r
    .turnin 4865 >>Turn in Serpent Wild while you are here
    .isQuestComplete 4865
    .target Motega Firemane
step
    .goto 1441/1,-1368.33,-4907.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kanati Greycloud|r
    .turnin 4881 >>Turn in Assassination Plot
    .accept 4966 >>Accept Protect Kanati Greycloud
    .target Kanati Greycloud
step
    .goto 1441/1,-1367.01,-4891.84
    >>Kill |cRXP_ENEMY_Galak Assassins|r
    .complete 4966,1 --Galak Assassin slain (8)
    .mob Galak Assassin
step
    .goto 1441/1,-1368.33,-4907.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kanati Greycloud|r
    .turnin 4966 >>Turn in Protect Kanati Greycloud
    .target Kanati Greycloud
step
    .goto 1441/1,-1381.09,-4915.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Motega Firemane|r
    .turnin 4865 >>Turn in Serpent Wild
    .accept 5062 >>Accept Sacred Fire
    .target Motega Firemane
step
    .goto 1441/1,-1256.13,-4617.87
    .xp 28+29000 >> Grind to level 28 29000+/41400xp
step
    .goto 1441/1,-1256.13,-4617.87
    .xp 28+20000 >> Grind to level 28 20000+/41400xp
step
    #loop
    .goto 1441/1,-1912.17,-4963.12,0
    .goto 1441/1,-1912.17,-4963.12,40,0
    .goto 1441/1,-2038.01,-5005.95,40,0
    .goto 1441/1,-2066.17,-5100.11,40,0
    >>Pick up |cRXP_PICK_Incendia Agave|r from the ground
    .complete 5062,1 --Incendia Agave (1)
step
    .goto 1441/1,-1832.09,-4922.35
    >>Open the |cRXP_PICK_Document Chest|r. Loot it for |cRXP_LOOT_Secret Note #1|r
    .complete 5064,1 --Secret Note #1 (1)
step
    .goto 1441/1,-1918.77,-5139.71
    >>Open the |cRXP_PICK_Document Chest|r. Loot it for |cRXP_LOOT_Secret Note #2|r
    .complete 5064,2 --Secret Note #2 (1)
step
    .goto 1441/1,-2164.29,-5184.88
    >>Open the |cRXP_PICK_Document Chest|r. Loot it for |cRXP_LOOT_Secret Note #3|r
    .complete 5064,3 --Secret Note #3 (1)
step
    .goto 1441/1,-2109.29,-5004.48
    >>Kill |cRXP_ENEMY_Arikara|r and loot |cRXP_LOOT_Arikara Serpent Skin|r
    .complete 5088,2 --Arikara Serpent Skin (1)
    .mob Arikara
    .isOnQuest 5088
step
    .goto 1441/1,-2107.97,-5004.19
    >>Click the |cRXP_PICK_Sacred Fire of Life|r
    .complete 5088,1 --Sacred Fire of Life
    .isOnQuest 5088
step
    .goto 1441/1,-1381.09,-4915.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Motega Firemane|r
    .turnin 5088 >>Turn in Arikara
    .target Motega Firemane
    .isOnQuest 5088
step
    .goto 1441/1,-2442.81,-5455.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cliffwatcher Longhorn|r
    .turnin 5064 >>Turn in Grimtotem Spying
    .target Cliffwatcher Longhorn
step << Hunter
    .goto 1441/1,-2408.49,-5453.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Starn|r
    .vendor >>|cRXP_BUY_Buy a|r |T135495:0|t[|cRXP_FRIENDLY_Dense Shortbow|r] |cRXP_BUY_from him if it's up and fill your quiver with arrows|r
    .collect 3030,1800,1151,1
    .target Starn
    .money <2.7172
    .subzoneskip 484,1
step
    .goto 1441/1,-2330.61,-5047.89
    .xp 30 >> Grind to level 30
step
    .goto 1441/1,-2460.41,-5477.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Abeqwa|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Abeqwa
step << Hunter
    .goto 1441/1,-2408.49,-5453.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Starn|r
    .vendor >>|cRXP_BUY_Buy a|r |T135495:0|t[|cRXP_FRIENDLY_Dense Shortbow|r] |cRXP_BUY_from him if it's up|r
    .target Starn
    .money <2.7172
step << Shaman
    .goto 1441/1,-2789.09,-5217.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prate Cloudseer|r
    .turnin 1531 >>Turn in Call of Air
    .target Prate Cloudseer
    .isOnQuest 1531
step
    .goto 1441/1,-3406.85,-5842.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Moktar Krin|r
    .turnin 1146 >>Turn in The Swarm Grows
    .target Moktar Krin
    .isOnQuest 1146
step
    .goto 1441/1,-3856.09,-6233.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kravel Koalbeard|r
    .turnin 1117 >>Turn in Rumors for Kravel
    .target Kravel Koalbeard
    .isOnQuest 1117
step
    .goto 1441/1,-3856.09,-6233.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kravel Koalbeard|r
    .turnin 1112 >>Turn in Parts for Kravel
    .target Kravel Koalbeard
    .isOnQuest 1112
step
    .goto 1441/1,-3867.97,-6229.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fizzle Brassbolts|r
    .turnin 1137 >>Turn in News for Fizzle
    .target Fizzle Brassbolts
    .isOnQuest 1137
step << Mage
    .goto 1441/1,-3878.09,-6187.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magus Tirth|r
    .turnin 1949 >>Turn in Hidden Secrets
    .target Magus Tirth
    .isOnQuest 1949
step
    .goto 1441/1,-3961.25,-6192.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pozzik|r
    .turnin 1183 >>Turn in Goblin Sponsorship
    .target Pozzik
    .isOnQuest 1183
step
    .goto 1441/1,-3967.85,-6198.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Razzeric|r
    .turnin 1189 >>Turn in Safety First
    .target Razzeric
    .isOnQuest 1189
step
    +|cRXP_WARN_That is all of Thousand Needles for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Thunder Bluff|r: Sacred Fire
step
    +|cRXP_WARN_The rest of Thousand Needles is planned from level 28.|r Load its guide for level 28 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 25 - 35 Thousand Needles
#subweight -25
#name 28-29 Thousand Needles: around Jandia

step
    .goto 1441/1,-2457.33,-5458.56
    >>Click the |cRXP_PICK_Wanted Poster - Arnak Grimtotem|r
    .accept 5147 >>Accept Wanted - Arnak Grimtotem
step
    .goto 1441/1,-2463.49,-5483.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rau Cliffrunner|r
    .accept 1197 >>Accept The Sacred Flame
    .target Rau Cliffrunner
    .isQuestTurnedIn 1196 --any of: The Sacred Flame
    .xp <20,1
step
    .goto 1441/1,-2410.25,-5401.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elu|r
    .accept 4767 >>Accept Wind Rider
    .target Elu
step
    .goto 1441/1,-2466.57,-5477.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jandia|r
    .accept 98069 >>Accept Stolen Freewind Supplies
    .accept 98070 >>Accept Stop the Screeching
    .target Jandia
step
    .goto 1441/1,-2281.77,-4889.79
    >>Open the |cRXP_PICK_Ancient Brazier|r. Loot it for |cRXP_LOOT_Cloven Hoof|r
    .complete 1197,1 --Cloven Hoof (1)
    .isOnQuest 1197
step
    .goto 1441/1,-2463.49,-5483.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rau Cliffrunner|r
    .turnin 1197 >>Turn in The Sacred Flame
    .target Rau Cliffrunner
    .isOnQuest 1197
step
    .goto 1441/1,-2460.41,-5477.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Abeqwa|r
    .target Innkeeper Abeqwa
    .home >>Set your Hearthstone to Innkeeper Abeqwa's inn
step
    #completewith Along7
    >>As you go: Kill |cRXP_ENEMY_Screeching Roguefeathers|r. |cRXP_WARN_Anything left is finished later|r
    .complete 98070,2 --Screeching Roguefeather slain (5)
    .mob Screeching Roguefeather
step
    #label Along7
    .goto 1441/1,-1683.37,-5394.91
    >>Kill |cRXP_ENEMY_Screeching Harpies|r
    .complete 98070,1 --Screeching Harpy slain (5)
    .mob Screeching Harpy
step
    .goto 1441/1,-1220.49,-5156.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pao'ka Swiftmountain|r
    .accept 4770 >>Accept Homeward Bound
    .target Pao'ka Swiftmountain
step
    .goto 1441/1,-1099.93,-4924.40
    >>Escort Pao'ka from Highperch
    .complete 4770,1 --Escort Pao'ka from Highperch
step
    #loop
    .goto 1441/1,-932.73,-4941.71,0
    .goto 1441/1,-932.73,-4941.71,40,0
    .goto 1441/1,-941.97,-5055.23,40,0
    >>Pick up |cRXP_PICK_Highperch Wyvern Egg|r from the ground
    .complete 4767,1 --Highperch Wyvern Egg (10)
step
    .goto 1441/1,-1381.09,-4915.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Motega Firemane|r
    .turnin 4770 >>Turn in Homeward Bound
    .target Motega Firemane
step
    .goto 1441/1,-1376.25,-4921.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wizlo Bearingshiner|r
    .accept 5151 >>Accept Hypercapacitor Gizmo
    .target Wizlo Bearingshiner
step
    .goto 1441/1,-1434.77,-4688.85
    >>Kill |cRXP_ENEMY_Enraged Panther|r and loot |cRXP_LOOT_Hypercapacitor Gizmo|r
    .complete 5151,1 --Hypercapacitor Gizmo (1)
    .mob Enraged Panther
step
    .goto 1441/1,-1376.25,-4921.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wizlo Bearingshiner|r
    .turnin 5151 >>Turn in Hypercapacitor Gizmo
    .target Wizlo Bearingshiner
step
    #completewith next
    .hs >>Hearth to Innkeeper Abeqwa's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1441/1,-2410.25,-5401.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elu|r
    .turnin 4767 >>Turn in Wind Rider
    .target Elu
step
    .goto 1441/1,-2110.17,-4754.85
    >>Kill |cRXP_ENEMY_Arnak Grimtotem|r and loot |cRXP_LOOT_Arnak's Hoof|r
    .complete 5147,1 --Arnak's Hoof (1)
    .mob Arnak Grimtotem
step
    .goto 1441/1,-2103.13,-4742.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lakota Windsong|r
    .accept 4904 >>Accept Free at Last
    .target Lakota Windsong
step
    .goto 1441/1,-1794.25,-5055.52
    >>Escort Lakota Windsong from the Darkcloud Pinnacle.
    .complete 4904,1 --Escort Lakota Windsong from the Darkcloud Pinnacle.
step
    #loop
    .goto 1441/1,-1638.93,-5356.48,0
    .goto 1441/1,-1638.93,-5356.48,40,0
    .goto 1441/1,-1609.01,-5494.93,40,0
    .goto 1441/1,-1598.89,-5603.17,40,0
    >>Kill |cRXP_ENEMY_Screeching Roguefeathers|r
    >>Kill |cRXP_ENEMY_Screeching Windcallers|r
    .complete 98070,2 --Screeching Roguefeather slain (5)
    .complete 98070,3 --Screeching Windcaller slain (5)
    .mob Screeching Roguefeather
    .mob Screeching Windcaller
step
    .goto 1441/1,-2442.81,-5455.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cliffwatcher Longhorn|r
    .turnin 5147 >>Turn in Wanted - Arnak Grimtotem
    .target Cliffwatcher Longhorn
step
    .goto 1441/1,-2456.01,-5480.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thalia Amberhide|r
    .turnin 4904 >>Turn in Free at Last
    .target Thalia Amberhide
step
    .goto 1441/1,-2466.57,-5477.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jandia|r
    .turnin 98070 >>Turn in Stop the Screeching
    .target Jandia
step
    .goto 1441/1,-2466.57,-5477.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jandia|r
    .turnin 98069 >>Turn in Stolen Freewind Supplies
    .target Jandia
    .isQuestComplete 98069
step
    .goto 1441/1,-3856.09,-6233.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kravel Koalbeard|r
    .accept 1110 >>Accept Rocket Car Parts
    .target Kravel Koalbeard
step
    #loop
    .goto 1441/1,-3623.33,-6093.33,0
    .goto 1441/1,-3623.33,-6093.33,40,0
    .goto 1441/1,-3588.13,-5981.87,40,0
    .goto 1441/1,-3552.93,-6286.93,40,0
    >>Loot the |cRXP_PICK_Rocket Car Rubbles|r for |cRXP_LOOT_Rocket Car Parts|r
    .complete 1110,1 --Rocket Car Parts (30)
step
    .goto 1441/1,-3856.09,-6233.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kravel Koalbeard|r
    .turnin 1110 >>Turn in Rocket Car Parts
    .accept 5762 >>Accept Hemet Nesingwary
    .target Kravel Koalbeard
step
    +|cRXP_WARN_That is all of Thousand Needles for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Stranglethorn Vale|r: Hemet Nesingwary
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Stolen Freewind Supplies
step
    +|cRXP_WARN_The rest of Thousand Needles is planned from level 31.|r Load its guide for level 31 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 25 - 35 Thousand Needles
#subweight -25
#name 31-32 Thousand Needles: around Pozzik

step
    .goto 1441/1,-2807.13,-5183.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dorn Plainstalker|r
    .accept 1150 >>Accept Test of Endurance
    .target Dorn Plainstalker
    .isQuestTurnedIn 1149 --any of: Test of Faith
step
    .goto 1441/1,-2463.49,-5483.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rau Cliffrunner|r
    .accept 79442 >>Accept The Tempest's Weapons << Orc Shaman/Tauren Shaman/Troll Shaman
    .accept 79360 >>Accept Elemental Aid << Shaman
    .accept 79364 >>Accept Eyes on the Sky << Shaman
    .target Rau Cliffrunner
step
    .goto 1441/1,-2466.57,-5477.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jandia|r
    .turnin 98069 >>Turn in Stolen Freewind Supplies
    .target Jandia
    .isQuestComplete 98069
step
    .goto 1441/1,-2460.41,-5477.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Abeqwa|r
    .target Innkeeper Abeqwa
    .home >>Set your Hearthstone to Innkeeper Abeqwa's inn
step
    .goto 1441/1,-1603.73,-5603.47
    >>Kill |cRXP_ENEMY_Grenka Bloodscreech|r and loot |cRXP_LOOT_Grenka's Claw|r
    .complete 1150,1 --Grenka's Claw (1)
    .mob Grenka Bloodscreech
    .isOnQuest 1150
step << Shaman
    .goto 1441/1,-2789.09,-5217.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prate Cloudseer|r
    .turnin 79364 >>Turn in Eyes on the Sky
    .target Prate Cloudseer
step
    .goto 1441/1,-2807.13,-5183.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dorn Plainstalker|r
    .turnin 1150 >>Turn in Test of Endurance
    .target Dorn Plainstalker
    .isOnQuest 1150
step
    .goto 1441/1,-2807.13,-5183.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dorn Plainstalker|r
    .accept 1151 >>Accept Test of Strength
    .target Dorn Plainstalker
    .isQuestTurnedIn 1150 --any of: Test of Endurance
step
    .goto 1441/1,-1433.45,-5065.49
    >>Kill |cRXP_ENEMY_Achellios the Banished|r and loot |cRXP_LOOT_Pendant of Myzrael|r. Use it to start the quest
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
    .mob Achellios the Banished
step
    .goto 1441/1,-1185.73,-5084.27
    >>Kill |cRXP_ENEMY_Rok'Alim the Pounder|r and loot |cRXP_LOOT_Fragments of Rok'Alim|r
    .complete 1151,1 --Fragments of Rok'Alim (1)
    .mob Rok'Alim the Pounder
    .isOnQuest 1151
step << Shaman
    #completewith next
    .hs >>Hearth to Innkeeper Abeqwa's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step << Shaman
    .goto 1441/1,-2463.49,-5483.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rau Cliffrunner|r
    .accept 79366 >>Accept Heed My Call
    .target Rau Cliffrunner
step << Shaman
    .goto 1441/1,-2463.49,-5483.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rau Cliffrunner|r
    .turnin 79360 >>Turn in Elemental Aid
    .target Rau Cliffrunner
    .isQuestComplete 79360
step << Shaman
    .goto 1441/1,-2463.49,-5483.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rau Cliffrunner|r
    >>|cRXP_WARN_The database has no objectives for Heed My Call. Skip this step if the quest is not finished|r
    .turnin 79366 >>Turn in Heed My Call
    .target Rau Cliffrunner
    .isOnQuest 79366
step
    .goto 1441/1,-2807.13,-5183.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dorn Plainstalker|r
    .turnin 1151 >>Turn in Test of Strength
    .target Dorn Plainstalker
    .isOnQuest 1151
step
    .goto 1441/1,-2807.13,-5183.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dorn Plainstalker|r
    .accept 1152 >>Accept Test of Lore
    .target Dorn Plainstalker
    .isQuestTurnedIn 1151 --any of: Test of Strength
step
    .goto 1441/1,-3856.09,-6233.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kravel Koalbeard|r
    .accept 1111 >>Accept Wharfmaster Dizzywig
    .target Kravel Koalbeard
step
    .goto 1441/1,-3867.97,-6229.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fizzle Brassbolts|r
    .accept 1104 >>Accept Salt Flat Venom
    .target Fizzle Brassbolts
step
    .goto 1441/1,-3871.49,-6228.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wizzle Brassbolts|r
    .accept 1105 >>Accept Hardened Shells
    .target Wizzle Brassbolts
step << Mage
    .goto 1441/1,-3878.09,-6187.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magus Tirth|r
    .accept 1950 >>Accept Get the Scoop
    .target Magus Tirth
    .isQuestTurnedIn 1949 --any of: Hidden Secrets
    .xp <30,1
step << Mage
    .goto 1441/1,-3936.17,-6185.15
    >>Find the phrase to Tirth's strongbox, then return to Tirth.
    .complete 1950,1 --"Plucky" Johnson
    .target "Plucky" Johnson
    .isOnQuest 1950
step
    .goto 1441/1,-3961.25,-6192.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pozzik|r
    .accept 1176 >>Accept Load Lightening
    .target Pozzik
step
    .goto 1441/1,-3856.09,-6233.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kravel Koalbeard|r
    .accept 1114 >>Accept Delivery to the Gnomes
    .target Kravel Koalbeard
    .isQuestTurnedIn 1112 --any of: Parts for Kravel
    .xp <30,1
step
    .goto 1441/1,-3867.97,-6229.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fizzle Brassbolts|r
    .turnin 1114 >>Turn in Delivery to the Gnomes
    .target Fizzle Brassbolts
    .isOnQuest 1114
step
    .goto 1441/1,-3856.09,-6233.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kravel Koalbeard|r
    .accept 1115 >>Accept The Rumormonger
    .target Kravel Koalbeard
    .isQuestTurnedIn 1114 --any of: Delivery to the Gnomes
    .xp <30,1
step << Mage
    .goto 1441/1,-3878.09,-6187.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magus Tirth|r
    .turnin 1950 >>Turn in Get the Scoop
    .target Magus Tirth
    .isOnQuest 1950
step
    .goto 1441/1,-4303.13,-5882.72
    >>Kill |cRXP_ENEMY_Salt Flats Scavengers|r and |cRXP_ENEMY_Salt Flats Vultures|r. Loot them for |cRXP_LOOT_Hollow Vulture Bone|r
    .complete 1176,1 --Hollow Vulture Bone (10)
    .mob Salt Flats Scavenger
    .mob Salt Flats Vulture
step
    #loop
    .goto 1441/1,-4119.21,-5748.37,0
    .goto 1441/1,-4119.21,-5748.37,40,0
    .goto 1441/1,-4052.77,-5585.87,40,0
    .goto 1441/1,-4023.73,-5535.41,40,0
    >>Kill |cRXP_ENEMY_Sparkleshell Tortoises|r, |cRXP_ENEMY_Sparkleshell Snappers|r and |cRXP_ENEMY_Sparkleshell Borers|r. Loot them for |cRXP_LOOT_Hardened Tortoise Shell|r
    .complete 1105,1 --Hardened Tortoise Shell (9)
    .mob Sparkleshell Tortoise
    .mob Sparkleshell Snapper
    .mob Sparkleshell Borer
step
    #loop
    .goto 1441/1,-3754.01,-5954.59,0
    .goto 1441/1,-3754.01,-5954.59,40,0
    .goto 1441/1,-3570.53,-6103.60,40,0
    .goto 1441/1,-3548.97,-6218.00,40,0
    >>Kill |cRXP_ENEMY_Scorpid Terrors|r, |cRXP_ENEMY_Scorpid Reavers|r and |cRXP_ENEMY_Vile Stings|r. Loot them for |cRXP_LOOT_Salty Scorpid Venom|r
    .complete 1104,1 --Salty Scorpid Venom (6)
    .mob Scorpid Terror
    .mob Scorpid Reaver
    .mob Vile Sting
step
    .goto 1441/1,-3867.97,-6229.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fizzle Brassbolts|r
    .turnin 1104 >>Turn in Salt Flat Venom
    .target Fizzle Brassbolts
step
    .goto 1441/1,-3871.49,-6228.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wizzle Brassbolts|r
    .turnin 1105 >>Turn in Hardened Shells
    .accept 1107 >>Accept Encrusted Tail Fins
    .target Wizzle Brassbolts
step
    .goto 1441/1,-3867.97,-6229.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fizzle Brassbolts|r
    .accept 1106 >>Accept Martek the Exiled
    .target Fizzle Brassbolts
step
    .goto 1441/1,-3871.49,-6228.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wizzle Brassbolts|r
    .turnin 1107 >>Turn in Encrusted Tail Fins
    .target Wizzle Brassbolts
    .isQuestComplete 1107
step
    .goto 1441/1,-3961.25,-6192.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pozzik|r
    .accept 1190 >>Accept Keeping Pace
    .target Pozzik
    .isQuestTurnedIn 1137 --any of: News for Fizzle
    .xp <29,1
step
    .goto 1441/1,-3961.25,-6192.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pozzik|r
    .accept 1186 >>Accept The Eighteenth Pilot
    .target Pozzik
    .isQuestTurnedIn 1183 --any of: Goblin Sponsorship
    .xp <29,1
step
    .goto 1441/1,-3961.25,-6192.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pozzik|r
    .turnin 1176 >>Turn in Load Lightening
    .accept 1178 >>Accept Goblin Sponsorship
    .target Pozzik
step
    .goto 1441/1,-3967.85,-6198.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Razzeric|r
    .accept 1188 >>Accept Safety First
    .target Razzeric
    .isQuestTurnedIn 1187 --any of: Razzeric's Tweaking
    .xp <29,1
step
    .goto 1441/1,-3967.85,-6198.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Razzeric|r
    .turnin 1186 >>Turn in The Eighteenth Pilot
    .target Razzeric
    .isOnQuest 1186
step
    .goto 1441/1,-3967.85,-6198.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Razzeric|r
    .accept 1187 >>Accept Razzeric's Tweaking
    .target Razzeric
    .isQuestTurnedIn 1186 --any of: The Eighteenth Pilot
    .xp <29,1
step
    .goto 1441/1,-3830.57,-6236.77
    >>Click the |cRXP_PICK_Rizzle's Unguarded Plans|r
    .turnin 1190 >>Turn in Keeping Pace
    .isOnQuest 1190
step
    .goto 1441/1,-3830.57,-6236.77
    >>Click the |cRXP_PICK_Rizzle's Unguarded Plans|r
    .accept 1194 >>Accept Rizzle's Schematics
    .isQuestTurnedIn 1190 --any of: Keeping Pace
    .xp <29,1
step << Mage
    .goto 1441/1,-3878.09,-6187.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magus Tirth|r
    .accept 1951 >>Accept Rituals of Power
    .target Magus Tirth
    .isQuestTurnedIn 1950 --any of: Get the Scoop
    .xp <30,1
step
    .goto 1441/1,-3961.25,-6192.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pozzik|r
    .turnin 1194 >>Turn in Rizzle's Schematics
    .target Pozzik
    .isOnQuest 1194
step
    .goto 1441/1,-3967.85,-6198.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Razzeric|r
    .turnin 1187 >>Turn in Razzeric's Tweaking
    .target Razzeric
    .isQuestComplete 1187
step
    +|cRXP_WARN_That is all of Thousand Needles for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Alterac Mountains|r: The Tempest's Weapons << Orc Shaman/Tauren Shaman/Troll Shaman
    >>|cRXP_FRIENDLY_Arathi Highlands|r: Crystal in the Mountains
    >>|cRXP_FRIENDLY_Badlands|r: Martek the Exiled
    >>|cRXP_FRIENDLY_Dustwallow Marsh|r: Rituals of Power << Mage
    >>|cRXP_FRIENDLY_Stonetalon Mountains|r: Test of Lore
    >>|cRXP_FRIENDLY_Stranglethorn Vale|r: The Rumormonger
    >>|cRXP_FRIENDLY_Tanaris|r: Safety First
    >>|cRXP_FRIENDLY_The Barrens|r: Wharfmaster Dizzywig, Goblin Sponsorship
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Elemental Aid << Shaman
    >>|cRXP_FRIENDLY_Stranglethorn Vale and back here|r: Encrusted Tail Fins
step
    +|cRXP_WARN_The rest of Thousand Needles is planned from level 34.|r Load its guide for level 34 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 25 - 35 Thousand Needles
#subweight -25
#name 34-35 Thousand Needles

step
    .goto 1441/1,-1946.93,-5142.93
    >>Click the |cRXP_PICK_Scrolls|r
    .accept 79947 >>Accept Geomancy: The Stone-Cold Truth
step
    .goto 1441/1,-1951.33,-5142.93
    >>Open the |cRXP_PICK_Scrolls|r. Loot it for |cRXP_LOOT_Geomancy: The Stone-Cold Truth|r
    .complete 79947,1 --Geomancy: The Stone-Cold Truth (1)
step
    .goto 1441/1,-2466.57,-5477.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jandia|r
    .turnin 98069 >>Turn in Stolen Freewind Supplies
    .target Jandia
    .isQuestComplete 98069
step << Shaman
    .goto 1441/1,-2463.49,-5483.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rau Cliffrunner|r
    .turnin 79366 >>Turn in Heed My Call
    .target Rau Cliffrunner
    .isOnQuest 79366
step << Shaman
    .goto 1441/1,-2463.49,-5483.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rau Cliffrunner|r
    .turnin 79360 >>Turn in Elemental Aid
    .target Rau Cliffrunner
    .isQuestComplete 79360
step
    .goto 1441/1,-3871.49,-6228.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wizzle Brassbolts|r
    .turnin 1107 >>Turn in Encrusted Tail Fins
    .target Wizzle Brassbolts
    .isQuestComplete 1107
step
    .goto 1441/1,-4025.05,-6253.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trackmaster Zherin|r
    .accept 1175 >>Accept A Bump in the Road
    .target Trackmaster Zherin
step
    .goto 1441/1,-3406.85,-5842.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Moktar Krin|r
    .accept 1147 >>Accept The Swarm Grows
    .target Moktar Krin
    .isQuestTurnedIn 1146 --any of: The Swarm Grows
    .xp <29,1
step
    #loop
    .goto 1441/1,-3754.89,-5649.52,0
    .goto 1441/1,-3754.89,-5649.52,40,0
    .goto 1441/1,-3837.61,-5714.35,40,0
    >>Kill |cRXP_ENEMY_Saltstone Basilisks|r
    .complete 1175,1 --Saltstone Basilisk slain (10)
    .mob Saltstone Basilisk
step
    #completewith Along9
    >>As you go: Kill |cRXP_ENEMY_Saltstone Gazers|r. |cRXP_WARN_Anything left is finished later|r
    .complete 1175,3 --Saltstone Gazer slain (6)
    .mob Saltstone Gazer
step
    #label Along9
    #loop
    .goto 1441/1,-3850.81,-6487.87,0
    .goto 1441/1,-3850.81,-6487.87,40,0
    .goto 1441/1,-3927.81,-6595.23,40,0
    >>Kill |cRXP_ENEMY_Saltstone Crystalhides|r
    .complete 1175,2 --Saltstone Crystalhide slain (10)
    .mob Saltstone Crystalhide
step
    #completewith Drop1148x1
    >>|cRXP_LOOT_Cracked Silithid Carapace|r can drop from |cRXP_ENEMY_Silithid Searcher|r, |cRXP_ENEMY_Silithid Invader|r, |cRXP_ENEMY_Silithid Hive Drone|r. Use it to start the quest if you get one
    .collect 5877,1,1148 --Cracked Silithid Carapace (1)
    .accept 1148 >>Accept Parts of the Swarm
    .use 5877
step
    #loop
    .goto 1441/1,-3325.45,-6496.08,0
    .goto 1441/1,-3325.45,-6496.08,40,0
    .goto 1441/1,-3254.17,-6485.81,40,0
    >>Kill |cRXP_ENEMY_Silithid Invaders|r
    .complete 1147,3 --Silithid Invader slain (5)
    .mob Silithid Invader
    .isOnQuest 1147
step
    .goto 1441/1,-3413.89,-6353.81
    >>Kill |cRXP_ENEMY_Silithid Searchers|r
    .complete 1147,1 --Silithid Searcher slain (5)
    .mob Silithid Searcher
    .isOnQuest 1147
step
    #label Drop1148x1
    #loop
    .goto 1441/1,-3490.89,-6356.16,0
    .goto 1441/1,-3490.89,-6356.16,40,0
    .goto 1441/1,-3485.61,-6470.27,40,0
    .goto 1441/1,-3474.61,-6579.68,40,0
    >>Kill |cRXP_ENEMY_Silithid Hive Drones|r
    .complete 1147,2 --Silithid Hive Drone slain (5)
    .mob Silithid Hive Drone
    .isOnQuest 1147
step
    #loop
    .goto 1441/1,-3487.37,-6507.81,0
    .goto 1441/1,-3487.37,-6507.81,40,0
    .goto 1441/1,-3514.65,-6442.99,40,0
    .goto 1441/1,-3442.05,-6381.39,40,0
    >>Kill |cRXP_ENEMY_Silithid Searchers|r, |cRXP_ENEMY_Silithid Invaders|r, |cRXP_ENEMY_Silithid Ravagers|r and |cRXP_ENEMY_Silithid Hive Drones|r. Loot them for |cRXP_LOOT_Silithid Heart|r
    .complete 1148,1 --Silithid Heart (1)
    .mob Silithid Searcher
    .mob Silithid Invader
    .mob Silithid Ravager
    .mob Silithid Hive Drone
    .isOnQuest 1148
step
    #loop
    .goto 1441/1,-3487.37,-6507.81,0
    .goto 1441/1,-3487.37,-6507.81,40,0
    .goto 1441/1,-3514.65,-6442.99,40,0
    .goto 1441/1,-3442.05,-6381.39,40,0
    >>Kill |cRXP_ENEMY_Silithid Searchers|r, |cRXP_ENEMY_Silithid Invaders|r, |cRXP_ENEMY_Silithid Ravagers|r and |cRXP_ENEMY_Silithid Hive Drones|r. Loot them for |cRXP_LOOT_Silithid Talon|r
    .complete 1148,2 --Silithid Talon (5)
    .mob Silithid Searcher
    .mob Silithid Invader
    .mob Silithid Ravager
    .mob Silithid Hive Drone
    .isOnQuest 1148
step
    #loop
    .goto 1441/1,-3487.37,-6507.81,0
    .goto 1441/1,-3487.37,-6507.81,40,0
    .goto 1441/1,-3514.65,-6442.99,40,0
    .goto 1441/1,-3442.05,-6381.39,40,0
    >>Kill |cRXP_ENEMY_Silithid Searchers|r, |cRXP_ENEMY_Silithid Invaders|r, |cRXP_ENEMY_Silithid Ravagers|r and |cRXP_ENEMY_Silithid Hive Drones|r. Loot them for |cRXP_LOOT_Intact Silithid Carapace|r
    .complete 1148,3 --Intact Silithid Carapace (3)
    .mob Silithid Searcher
    .mob Silithid Invader
    .mob Silithid Ravager
    .mob Silithid Hive Drone
    .isOnQuest 1148
step
    .goto 1441/1,-3406.85,-5842.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Moktar Krin|r
    .turnin 1147 >>Turn in The Swarm Grows
    .target Moktar Krin
    .isOnQuest 1147
step
    #loop
    .goto 1441/1,-3812.53,-6511.04,0
    .goto 1441/1,-3812.53,-6511.04,40,0
    .goto 1441/1,-3863.13,-6582.61,40,0
    >>Kill |cRXP_ENEMY_Saltstone Gazers|r
    .complete 1175,3 --Saltstone Gazer slain (6)
    .mob Saltstone Gazer
step
    .goto 1441/1,-4025.05,-6253.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trackmaster Zherin|r
    .turnin 1175 >>Turn in A Bump in the Road
    .target Trackmaster Zherin
step
    .goto 1441/1,-2442.81,-5455.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cliffwatcher Longhorn|r
    .accept 5361 >>Accept Family Tree
    .target Cliffwatcher Longhorn
step
    +|cRXP_WARN_End of the Thousand Needles route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Desolace|r: Family Tree
    >>|cRXP_FRIENDLY_The Barrens|r: Parts of the Swarm
    >>|cRXP_FRIENDLY_Undercity|r: Geomancy: The Stone-Cold Truth
]])
