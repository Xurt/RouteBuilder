-- 25-40 Thousand Needles: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 4 parts with a level check between them (from level 25, 28, 31, 34).
-- Edit zones/Thousand Needles.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#name 25-40 Thousand Needles

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
    .goto 1441/1,-2438.85,-5251.47,0
    .goto 1441/1,-2438.85,-5251.47,40,0
    .goto 1441/1,-2569.53,-5245.89,40,0
    .goto 1441/1,-2534.77,-5158.77,40,0
    .goto 1441/1,-2392.65,-5128.27,40,0
    .goto 1441/1,-2382.97,-5016.80,40,0
    .goto 1441/1,-2315.21,-5018.27,40,0
    .goto 1441/1,-2314.33,-5087.20,40,0
    .goto 1441/1,-2221.05,-5046.72,40,0
    .goto 1441/1,-2240.41,-5181.95,40,0
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
    .goto 1441/1,-1368.77,-4899.76
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
    .goto 1441/1,-1901.61,-4930.56,0
    .goto 1441/1,-1901.61,-4930.56,40,0
    .goto 1441/1,-1912.17,-4963.12,40,0
    .goto 1441/1,-2000.61,-5028.53,40,0
    .goto 1441/1,-2019.53,-5064.03,40,0
    .goto 1441/1,-2043.29,-5103.92,40,0
    .goto 1441/1,-2095.21,-5086.32,40,0
    .goto 1441/1,-2045.05,-5029.41,40,0
    .goto 1441/1,-2026.13,-4976.91,40,0
    .goto 1441/1,-1971.13,-4940.83,40,0
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
    .xp 28 >>|cRXP_WARN_The rest of Thousand Needles is planned from level 28.|r Come back to this guide then
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
    #loop
    .goto 1441/1,-1683.37,-5394.91,0
    .goto 1441/1,-1683.37,-5394.91,40,0
    .goto 1441/1,-1673.69,-5363.81,40,0
    .goto 1441/1,-1647.29,-5401.65,40,0
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
    .goto 1441/1,-953.85,-4939.95,0
    .goto 1441/1,-953.85,-4939.95,40,0
    .goto 1441/1,-922.17,-4979.84,40,0
    .goto 1441/1,-899.29,-5046.72,40,0
    .goto 1441/1,-941.97,-5055.23,40,0
    .goto 1441/1,-985.97,-5062.85,40,0
    .goto 1441/1,-969.69,-5026.48,40,0
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
    .goto 1441/1,-1606.81,-5359.71,40,0
    .goto 1441/1,-1636.73,-5462.67,40,0
    .goto 1441/1,-1628.81,-5499.04,40,0
    .goto 1441/1,-1590.97,-5540.99,40,0
    .goto 1441/1,-1584.37,-5615.49,40,0
    .goto 1441/1,-1634.53,-5560.64,40,0
    .goto 1441/1,-1685.57,-5440.37,40,0
    .goto 1441/1,-1659.17,-5379.65,40,0
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
    .goto 1441/1,-3618.93,-6154.93,0
    .goto 1441/1,-3618.93,-6154.93,40,0
    .goto 1441/1,-3624.21,-6088.64,40,0
    .goto 1441/1,-3654.13,-5981.87,40,0
    .goto 1441/1,-3587.25,-5978.64,40,0
    .goto 1441/1,-3561.73,-6078.67,40,0
    .goto 1441/1,-3557.33,-6154.93,40,0
    .goto 1441/1,-3513.33,-6269.33,40,0
    .goto 1441/1,-3625.09,-6335.92,40,0
    .goto 1441/1,-3585.05,-6257.89,40,0
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
    .xp 31 >>|cRXP_WARN_The rest of Thousand Needles is planned from level 31.|r Come back to this guide then
step
    .goto 1441/1,-2807.13,-5183.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dorn Plainstalker|r
    .accept 1150 >>Accept Test of Endurance
    .target Dorn Plainstalker
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
    .goto 1441/1,-1612.53,-5591.73
    >>Kill |cRXP_ENEMY_Grenka Bloodscreech|r and loot |cRXP_LOOT_Grenka's Claw|r
    .complete 1150,1 --Grenka's Claw (1)
    .mob Grenka Bloodscreech
step << Shaman
    .goto 1441/1,-2789.09,-5217.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prate Cloudseer|r
    .turnin 79364 >>Turn in Eyes on the Sky
    .target Prate Cloudseer
step
    .goto 1441/1,-2807.13,-5183.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dorn Plainstalker|r
    .turnin 1150 >>Turn in Test of Endurance
    .accept 1151 >>Accept Test of Strength
    .target Dorn Plainstalker
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
    .accept 1152 >>Accept Test of Lore
    .target Dorn Plainstalker
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
    #loop
    .goto 1441/1,-4278.93,-5870.99,0
    .goto 1441/1,-4278.93,-5870.99,40,0
    .goto 1441/1,-4303.13,-5882.72,40,0
    .goto 1441/1,-4315.45,-5905.01,40,0
    >>Kill |cRXP_ENEMY_Salt Flats Scavengers|r and |cRXP_ENEMY_Salt Flats Vultures|r. Loot them for |cRXP_LOOT_Hollow Vulture Bone|r
    .complete 1176,1 --Hollow Vulture Bone (10)
    .mob Salt Flats Scavenger
    .mob Salt Flats Vulture
step
    #loop
    .goto 1441/1,-4119.21,-5748.37,0
    .goto 1441/1,-4119.21,-5748.37,40,0
    .goto 1441/1,-4113.93,-5682.96,40,0
    .goto 1441/1,-4121.85,-5617.25,40,0
    .goto 1441/1,-4113.49,-5549.79,40,0
    .goto 1441/1,-4072.57,-5581.76,40,0
    .goto 1441/1,-4023.73,-5535.41,40,0
    .goto 1441/1,-4011.85,-5511.95,40,0
    .goto 1441/1,-4018.01,-5576.48,40,0
    .goto 1441/1,-4015.81,-5624.29,40,0
    >>Kill |cRXP_ENEMY_Sparkleshell Tortoises|r, |cRXP_ENEMY_Sparkleshell Snappers|r and |cRXP_ENEMY_Sparkleshell Borers|r. Loot them for |cRXP_LOOT_Hardened Tortoise Shell|r
    .complete 1105,1 --Hardened Tortoise Shell (9)
    .mob Sparkleshell Tortoise
    .mob Sparkleshell Snapper
    .mob Sparkleshell Borer
step
    #loop
    .goto 1441/1,-3754.01,-5954.59,0
    .goto 1441/1,-3754.01,-5954.59,40,0
    .goto 1441/1,-3604.85,-6115.04,40,0
    .goto 1441/1,-3578.45,-6156.99,40,0
    .goto 1441/1,-3548.97,-6218.00,40,0
    .goto 1441/1,-3552.05,-6117.97,40,0
    .goto 1441/1,-3537.53,-6105.65,40,0
    .goto 1441/1,-3570.53,-6103.60,40,0
    .goto 1441/1,-3593.85,-6106.53,40,0
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
    .xp 34 >>|cRXP_WARN_The rest of Thousand Needles is planned from level 34.|r Come back to this guide then
step
    .goto 1441/1,-4025.05,-6253.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trackmaster Zherin|r
    .accept 1175 >>Accept A Bump in the Road
    .target Trackmaster Zherin
step
    .goto 1441/1,-3871.49,-6228.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wizzle Brassbolts|r
    .turnin 1107 >>Turn in Encrusted Tail Fins
    .target Wizzle Brassbolts
    .isQuestComplete 1107
step
    .goto 1441/1,-3406.85,-5842.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Moktar Krin|r
    .accept 1147 >>Accept The Swarm Grows
    .target Moktar Krin
    .isQuestTurnedIn 1146 --any of: The Swarm Grows
    .xp <29,1
step
    #loop
    .goto 1441/1,-3673.49,-5710.24,0
    .goto 1441/1,-3673.49,-5710.24,40,0
    .goto 1441/1,-3680.09,-5650.99,40,0
    .goto 1441/1,-3754.89,-5649.52,40,0
    .goto 1441/1,-3779.97,-5621.07,40,0
    .goto 1441/1,-3817.81,-5655.68,40,0
    .goto 1441/1,-3886.89,-5697.33,40,0
    .goto 1441/1,-3837.61,-5714.35,40,0
    .goto 1441/1,-3816.49,-5754.24,40,0
    .goto 1441/1,-3748.73,-5769.79,40,0
    >>Kill |cRXP_ENEMY_Saltstone Basilisks|r
    .complete 1175,1 --Saltstone Basilisk slain (10)
    .mob Saltstone Basilisk
step
    #completewith Along4
    >>As you go: Kill |cRXP_ENEMY_Saltstone Gazers|r. |cRXP_WARN_Anything left is finished later|r
    .complete 1175,3 --Saltstone Gazer slain (6)
    .mob Saltstone Gazer
step
    #label Along4
    #loop
    .goto 1441/1,-3818.69,-6450.61,0
    .goto 1441/1,-3818.69,-6450.61,40,0
    .goto 1441/1,-3850.81,-6487.87,40,0
    .goto 1441/1,-3902.73,-6516.03,40,0
    .goto 1441/1,-3924.73,-6479.95,40,0
    .goto 1441/1,-3947.61,-6523.07,40,0
    .goto 1441/1,-3930.89,-6573.52,40,0
    .goto 1441/1,-3859.61,-6613.41,40,0
    .goto 1441/1,-3844.65,-6547.41,40,0
    .goto 1441/1,-3797.13,-6544.19,40,0
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
    .goto 1441/1,-3378.69,-6494.32,0
    .goto 1441/1,-3378.69,-6494.32,40,0
    .goto 1441/1,-3325.45,-6496.08,40,0
    .goto 1441/1,-3306.97,-6510.75,40,0
    .goto 1441/1,-3240.97,-6496.67,40,0
    .goto 1441/1,-3227.77,-6483.47,40,0
    .goto 1441/1,-3254.17,-6485.81,40,0
    .goto 1441/1,-3299.49,-6463.52,40,0
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
    .goto 1441/1,-3453.49,-6354.11,0
    .goto 1441/1,-3453.49,-6354.11,40,0
    .goto 1441/1,-3470.65,-6405.44,40,0
    .goto 1441/1,-3428.41,-6488.75,40,0
    .goto 1441/1,-3419.17,-6557.09,40,0
    .goto 1441/1,-3492.21,-6591.12,40,0
    .goto 1441/1,-3464.93,-6527.17,40,0
    .goto 1441/1,-3510.25,-6488.75,40,0
    .goto 1441/1,-3556.45,-6451.79,40,0
    .goto 1441/1,-3548.09,-6386.37,40,0
    >>Kill |cRXP_ENEMY_Silithid Hive Drones|r
    .complete 1147,2 --Silithid Hive Drone slain (5)
    .mob Silithid Hive Drone
    .isOnQuest 1147
step
    #loop
    .goto 1441/1,-3510.25,-6488.75,0
    .goto 1441/1,-3510.25,-6488.75,40,0
    .goto 1441/1,-3590.33,-6489.63,40,0
    .goto 1441/1,-3589.89,-6410.72,40,0
    .goto 1441/1,-3470.65,-6405.44,40,0
    .goto 1441/1,-3383.97,-6385.79,40,0
    .goto 1441/1,-3392.77,-6492.27,40,0
    .goto 1441/1,-3419.17,-6557.09,40,0
    .goto 1441/1,-3492.21,-6591.12,40,0
    .goto 1441/1,-3464.93,-6527.17,40,0
    >>Kill |cRXP_ENEMY_Silithid Searchers|r, |cRXP_ENEMY_Silithid Invaders|r, |cRXP_ENEMY_Silithid Ravagers|r and |cRXP_ENEMY_Silithid Hive Drones|r. Loot them for |cRXP_LOOT_Silithid Heart|r
    .complete 1148,1 --Silithid Heart (1)
    .mob Silithid Searcher
    .mob Silithid Invader
    .mob Silithid Ravager
    .mob Silithid Hive Drone
    .isOnQuest 1148
step
    #loop
    .goto 1441/1,-3510.25,-6488.75,0
    .goto 1441/1,-3510.25,-6488.75,40,0
    .goto 1441/1,-3590.33,-6489.63,40,0
    .goto 1441/1,-3589.89,-6410.72,40,0
    .goto 1441/1,-3470.65,-6405.44,40,0
    .goto 1441/1,-3383.97,-6385.79,40,0
    .goto 1441/1,-3392.77,-6492.27,40,0
    .goto 1441/1,-3419.17,-6557.09,40,0
    .goto 1441/1,-3492.21,-6591.12,40,0
    .goto 1441/1,-3464.93,-6527.17,40,0
    >>Kill |cRXP_ENEMY_Silithid Searchers|r, |cRXP_ENEMY_Silithid Invaders|r, |cRXP_ENEMY_Silithid Ravagers|r and |cRXP_ENEMY_Silithid Hive Drones|r. Loot them for |cRXP_LOOT_Silithid Talon|r
    .complete 1148,2 --Silithid Talon (5)
    .mob Silithid Searcher
    .mob Silithid Invader
    .mob Silithid Ravager
    .mob Silithid Hive Drone
    .isOnQuest 1148
step
    #loop
    .goto 1441/1,-3510.25,-6488.75,0
    .goto 1441/1,-3510.25,-6488.75,40,0
    .goto 1441/1,-3590.33,-6489.63,40,0
    .goto 1441/1,-3589.89,-6410.72,40,0
    .goto 1441/1,-3470.65,-6405.44,40,0
    .goto 1441/1,-3383.97,-6385.79,40,0
    .goto 1441/1,-3392.77,-6492.27,40,0
    .goto 1441/1,-3419.17,-6557.09,40,0
    .goto 1441/1,-3492.21,-6591.12,40,0
    .goto 1441/1,-3464.93,-6527.17,40,0
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
    .goto 1441/1,-3783.05,-6486.11,0
    .goto 1441/1,-3783.05,-6486.11,40,0
    .goto 1441/1,-3856.97,-6541.25,40,0
    .goto 1441/1,-3926.93,-6523.65,40,0
    .goto 1441/1,-3909.33,-6565.89,40,0
    .goto 1441/1,-3949.37,-6587.89,40,0
    .goto 1441/1,-3889.53,-6614.88,40,0
    .goto 1441/1,-3863.13,-6582.61,40,0
    .goto 1441/1,-3824.85,-6628.08,40,0
    .goto 1441/1,-3775.57,-6619.28,40,0
    >>Kill |cRXP_ENEMY_Saltstone Gazers|r
    .complete 1175,3 --Saltstone Gazer slain (6)
    .mob Saltstone Gazer
step
    .goto 1441/1,-4025.05,-6253.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trackmaster Zherin|r
    .turnin 1175 >>Turn in A Bump in the Road
    .target Trackmaster Zherin
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
    .goto 1441/1,-2466.57,-5477.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jandia|r
    .turnin 98069 >>Turn in Stolen Freewind Supplies
    .target Jandia
    .isQuestComplete 98069
step
    .goto 1441/1,-2442.81,-5455.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cliffwatcher Longhorn|r
    .accept 5361 >>Accept Family Tree
    .target Cliffwatcher Longhorn
step
    +|cRXP_WARN_End of the Thousand Needles route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Desolace|r: Family Tree
    >>|cRXP_FRIENDLY_The Barrens|r: Parts of the Swarm
]])
