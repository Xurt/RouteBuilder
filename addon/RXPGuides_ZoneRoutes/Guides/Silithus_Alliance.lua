-- 55-60 Silithus: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 2 parts with a level check between them (from level 55, 58).
-- Sections (the guide starts at the one for your level): around Windcaller Proudhorn from 55; around Commander Mar'alith from 58.
-- Edit zones/Silithus.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#name 55-60 Silithus

step
    .xp <58,1,RBSection1_1
    .xp 58 >>Finding the place in this guide for your level
step
    .xp <61,1,RBSection2_1
step
    #label RBSection1_1
    #completewith next
    +|cRXP_WARN_Silithus: around Windcaller Proudhorn|r (planned from level 55)
step
    .goto 1451/1,772.15,-6764.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rifleman Torrig|r
    .accept 9415 >>Accept Report to Marshal Bluewall
    .target Rifleman Torrig
step
    .goto 1451/1,-314.31,-6398.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Layo Starstrike|r
    .turnin 1124 >>Turn in Wasteland
    .target Layo Starstrike
    .isOnQuest 1124
step
    .goto 1451/1,-314.31,-6398.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Layo Starstrike|r
    .accept 1125 >>Accept The Spirits of Southwind
    .target Layo Starstrike
    .isQuestTurnedIn 1124 --any of: Wasteland
    .xp <54,1
step
    .goto 1451/1,739.75,-6855.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Beetix Ficklespragg|r
    .accept 8277 >>Accept Deadly Desert Venom
    .target Beetix Ficklespragg
step
    .goto 1451/1,755.77,-6847.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Windcaller Proudhorn|r
    .turnin 8275 >>Turn in Taking Back Silithus
    .target Windcaller Proudhorn
    .isOnQuest 8275
step
    .goto 1451/1,755.77,-6847.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Windcaller Proudhorn|r
    .accept 8280 >>Accept Securing the Supply Lines
    .target Windcaller Proudhorn
step
    .goto 1451/1,807.33,-6828.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Geologist Larksbane|r
    .accept 8284 >>Accept The Twilight Mystery
    .target Geologist Larksbane
step
    #loop
    .goto 1451/1,488.25,-7183.90,0
    .goto 1451/1,488.25,-7183.90,40,0
    .goto 1451/1,417.54,-7115.61,40,0
    .goto 1451/1,343.70,-7122.35,40,0
    .goto 1451/1,276.12,-7054.75,40,0
    .goto 1451/1,325.23,-7224.32,40,0
    .goto 1451/1,309.56,-7315.61,40,0
    .goto 1451/1,414.76,-7314.68,40,0
    .goto 1451/1,452.03,-7274.27,40,0
    .goto 1451/1,387.59,-7217.35,40,0
    >>Kill |cRXP_ENEMY_Tortured Druids|r
    .complete 1125,1 --Tortured Druid slain (8)
    .mob Tortured Druid
    .isOnQuest 1125
step
    #loop
    .goto 1451/1,352.40,-7216.19,0
    .goto 1451/1,352.40,-7216.19,40,0
    .goto 1451/1,410.58,-7260.33,40,0
    .goto 1451/1,490.00,-7249.18,40,0
    .goto 1451/1,440.18,-7184.37,40,0
    .goto 1451/1,351.36,-7078.68,40,0
    .goto 1451/1,347.53,-7138.61,40,0
    .goto 1451/1,290.05,-7177.63,40,0
    .goto 1451/1,284.83,-7309.81,40,0
    .goto 1451/1,386.54,-7316.31,40,0
    >>Kill |cRXP_ENEMY_Tortured Sentinels|r
    .complete 1125,2 --Tortured Sentinel slain (8)
    .mob Tortured Sentinel
    .isOnQuest 1125
step
    .goto 1451/1,-314.31,-6398.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Layo Starstrike|r
    .turnin 1125 >>Turn in The Spirits of Southwind
    .target Layo Starstrike
    .isOnQuest 1125
step
    .goto 1451/1,-314.31,-6398.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Layo Starstrike|r
    .accept 1126 >>Accept Hive in the Tower
    .target Layo Starstrike
    .isQuestTurnedIn 1125 --any of: The Spirits of Southwind
    .xp <54,1
step
    .goto 1451/1,434.96,-7179.26
    >>Open the |cRXP_PICK_Hive'Ashi Pod|r. Loot it for |cRXP_LOOT_Silithid Goo|r
    .collect 17345,1,1126,1 --Silithid Goo (1)
    .isOnQuest 1126
step
    .goto 1451/1,440.53,-7180.19
    >>Kill |cRXP_ENEMY_Hive'Ashi Ambusher|r and loot |cRXP_LOOT_Encrusted Silithid Object|r
    .complete 1126,1 --Encrusted Silithid Object (1)
    .mob Hive'Ashi Ambusher
    .isOnQuest 1126
step
    .goto 1451/1,-314.31,-6398.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Layo Starstrike|r
    .turnin 1126 >>Turn in Hive in the Tower
    .target Layo Starstrike
    .isOnQuest 1126
step
    .goto 1451/1,-314.31,-6398.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Layo Starstrike|r
    .accept 6844 >>Accept Umber, Archivist
    .target Layo Starstrike
    .isQuestTurnedIn 1126 --any of: Hive in the Tower
    .xp <54,1
step
    #loop
    .goto 1451/1,1687.57,-6231.51,0
    .goto 1451/1,1687.57,-6231.51,40,0
    .goto 1451/1,1702.20,-6276.34,40,0
    .goto 1451/1,1700.45,-6318.62,40,0
    .goto 1451/1,1770.47,-6295.16,40,0
    .goto 1451/1,1847.80,-6183.19,40,0
    .goto 1451/1,1819.93,-6140.68,40,0
    .goto 1451/1,1778.83,-6198.29,40,0
    .goto 1451/1,1747.83,-6151.14,40,0
    .goto 1451/1,1698.02,-6183.66,40,0
    >>Pick up |cRXP_PICK_Twilight Tablet Fragment|r from the ground
    .complete 8284,1 --Twilight Tablet Fragment (8)
step
    #completewith Along16
    >>As you go: Kill |cRXP_ENEMY_Sand Skitterers|r. Loot them for |cRXP_LOOT_Sand Skitterer Fang|r. |cRXP_WARN_Anything left is finished later|r
    .complete 8277,2 --Sand Skitterer Fang (8)
    .mob Sand Skitterer
step
    #label Along16
    #loop
    .goto 1451/1,767.62,-6400.62,0
    .goto 1451/1,767.62,-6400.62,40,0
    .goto 1451/1,702.48,-6446.38,40,0
    .goto 1451/1,657.54,-6445.45,40,0
    .goto 1451/1,591.01,-6369.03,40,0
    .goto 1451/1,631.77,-6214.78,40,0
    .goto 1451/1,670.08,-6252.18,40,0
    .goto 1451/1,720.24,-6300.96,40,0
    .goto 1451/1,693.77,-6351.14,40,0
    .goto 1451/1,659.98,-6366.93,40,0
    >>Kill |cRXP_ENEMY_Dredge Strikers|r
    .complete 8280,1 --Dredge Striker slain (15)
    .mob Dredge Striker
step
    #loop
    .goto 1451/1,1224.98,-6444.29,0
    .goto 1451/1,1224.98,-6444.29,40,0
    .goto 1451/1,1286.98,-6408.98,40,0
    .goto 1451/1,1331.92,-6454.28,40,0
    .goto 1451/1,1430.84,-6616.42,40,0
    .goto 1451/1,1358.04,-6689.12,40,0
    .goto 1451/1,1214.18,-6778.56,40,0
    .goto 1451/1,1253.19,-6693.07,40,0
    .goto 1451/1,1283.85,-6611.07,40,0
    .goto 1451/1,1262.25,-6506.31,40,0
    >>Kill |cRXP_ENEMY_Sand Skitterers|r. Loot them for |cRXP_LOOT_Sand Skitterer Fang|r
    >>Kill |cRXP_ENEMY_Stonelash Scorpids|r. Loot them for |cRXP_LOOT_Stonelash Scorpid Stinger|r
    .complete 8277,2 --Sand Skitterer Fang (8)
    .complete 8277,1 --Stonelash Scorpid Stinger (8)
    .mob Sand Skitterer
    .mob Stonelash Scorpid
step
    .goto 1451/1,807.33,-6828.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Geologist Larksbane|r
    .turnin 8284 >>Turn in The Twilight Mystery
    .accept 8285 >>Accept The Deserter
    .target Geologist Larksbane
step
    .goto 1451/1,755.77,-6847.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Windcaller Proudhorn|r
    .turnin 8280 >>Turn in Securing the Supply Lines
    .accept 8281 >>Accept Stepping Up Security
    .target Windcaller Proudhorn
step
    .goto 1451/1,739.75,-6855.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Beetix Ficklespragg|r
    .turnin 8277 >>Turn in Deadly Desert Venom
    .target Beetix Ficklespragg
step
    .goto 1451/1,811.51,-6825.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Colossus Researcher Eazel|r
    .accept 8858 >>Accept Secrets of the Colossus - Regal
    .target Colossus Researcher Eazel
step
    .goto 1451/1,814.29,-6824.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Colossus Researcher Sophia|r
    .accept 8859 >>Accept Secrets of the Colossus - Zora
    .target Colossus Researcher Sophia
step
    .goto 1451/1,814.99,-6823.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Colossus Researcher Nestor|r
    .accept 8857 >>Accept Secrets of the Colossus - Ashi
    .target Colossus Researcher Nestor
step
    #loop
    .goto 1451/1,1352.47,-6973.91,0
    .goto 1451/1,1352.47,-6973.91,40,0
    .goto 1451/1,1394.27,-6912.12,40,0
    .goto 1451/1,1471.25,-6877.74,40,0
    .goto 1451/1,1513.40,-6912.36,40,0
    .goto 1451/1,1552.41,-6869.15,40,0
    .goto 1451/1,1563.21,-6920.25,40,0
    .goto 1451/1,1550.32,-6983.44,40,0
    .goto 1451/1,1490.41,-6966.25,40,0
    .goto 1451/1,1469.16,-7035.70,40,0
    >>Kill |cRXP_ENEMY_Dredge Crushers|r
    .complete 8281,1 --Dredge Crusher slain (20)
    .mob Dredge Crusher
step
    .goto 1451/1,1377.90,-7144.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Bluewall|r
    .turnin 9415 >>Turn in Report to Marshal Bluewall
    .target Marshal Bluewall
step
    .goto 1451/1,197.05,-7578.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hermit Ortell|r
    .turnin 8285 >>Turn in The Deserter
    .target Hermit Ortell
step
    .goto 1451/1,755.77,-6847.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Windcaller Proudhorn|r
    .turnin 8281 >>Turn in Stepping Up Security
    .target Windcaller Proudhorn
step
    +|cRXP_WARN_That is all of Silithus for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Eastern Plaguelands|r: Secrets of the Colossus - Zora
    >>|cRXP_FRIENDLY_Moonglade|r: Umber, Archivist
    >>|cRXP_FRIENDLY_Searing Gorge|r: Secrets of the Colossus - Regal
    >>|cRXP_FRIENDLY_Stranglethorn Vale|r: Secrets of the Colossus - Ashi
step
    .xp 58 >>|cRXP_WARN_The rest of Silithus is planned from level 58.|r Come back to this guide then
step
    #label RBSection2_1
    #completewith next
    +|cRXP_WARN_Silithus: around Commander Mar'alith|r (planned from level 58)
step
    .goto 1451/1,1377.90,-7144.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Bluewall|r
    .accept 9419 >>Accept Scouring the Desert
    .target Marshal Bluewall
step
    .goto 1451/1,1389.74,-7138.61
    >>Find and deliver Silithyst to the Silithyst Extractor, then speak with Marshal Bluewall at the Alliance encampment near Hive'Zora.
    .complete 9419,1 --Silithus Dust Turnin Quest Doodad
    .target Silithus Dust Turnin Quest Doodad
step
    .goto 1451/1,1377.90,-7144.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Bluewall|r
    .turnin 9419 >>Turn in Scouring the Desert
    .target Marshal Bluewall
step
    .xp 58 >>Grind to level 58 (Breaking the Code needs it)
step
    .goto 1451/1,1115.95,-8022.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Frankal Stonebridge|r
    .accept 8310 >>Accept Breaking the Code
    .target Frankal Stonebridge
step
    #completewith Drop8308x1
    >>|cRXP_LOOT_Brann Bronzebeard's Lost Letter|r can drop from |cRXP_ENEMY_Hive'Ashi Stinger|r, |cRXP_ENEMY_Hive'Ashi Worker|r, |cRXP_ENEMY_Hive'Ashi Defender|r. Use it to start the quest if you get one
    .collect 20461,1,8308 --Brann Bronzebeard's Lost Letter (1)
    .accept 8308 >>Accept Brann Bronzebeard's Lost Letter
    .use 20461
step
    #loop
    .goto 1451/1,1369.19,-7553.02,0
    .goto 1451/1,1369.19,-7553.02,40,0
    .goto 1451/1,1472.30,-7545.58,40,0
    .goto 1451/1,1428.75,-7498.43,40,0
    .goto 1451/1,1466.03,-7411.55,40,0
    .goto 1451/1,1417.96,-7289.60,40,0
    .goto 1451/1,1281.06,-7390.41,40,0
    .goto 1451/1,1213.83,-7397.38,40,0
    .goto 1451/1,1279.67,-7450.11,40,0
    .goto 1451/1,1348.64,-7429.44,40,0
    >>Kill |cRXP_ENEMY_Hive'Zora Waywatchers|r, |cRXP_ENEMY_Hive'Zora Tunnelers|r, |cRXP_ENEMY_Hive'Zora Wasps|r and |cRXP_ENEMY_Hive'Zora Reavers|r. Loot them for |cRXP_LOOT_Hive'Zora Silithid Brain|r
    .complete 8310,2 --Hive'Zora Silithid Brain (1)
    .mob Hive'Zora Waywatcher
    .mob Hive'Zora Tunneler
    .mob Hive'Zora Wasp
    .mob Hive'Zora Reaver
step
    #label Drop8308x1
    #loop
    .goto 1451/1,889.88,-7083.55,0
    .goto 1451/1,889.88,-7083.55,40,0
    .goto 1451/1,849.13,-7051.73,40,0
    .goto 1451/1,892.67,-7023.62,40,0
    .goto 1451/1,875.25,-6952.31,40,0
    .goto 1451/1,814.64,-6951.61,40,0
    .goto 1451/1,731.04,-6913.98,40,0
    .goto 1451/1,761.70,-6956.72,40,0
    .goto 1451/1,789.21,-7110.96,40,0
    .goto 1451/1,823.70,-7153.24,40,0
    >>Kill |cRXP_ENEMY_Hive'Ashi Stingers|r, |cRXP_ENEMY_Hive'Ashi Workers|r, |cRXP_ENEMY_Hive'Ashi Defenders|r and |cRXP_ENEMY_Hive'Ashi Sandstalkers|r. Loot them for |cRXP_LOOT_Hive'Ashi Silithid Brain|r
    .complete 8310,1 --Hive'Ashi Silithid Brain (1)
    .mob Hive'Ashi Stinger
    .mob Hive'Ashi Worker
    .mob Hive'Ashi Defender
    .mob Hive'Ashi Sandstalker
step
    .goto 1451/1,748.81,-6847.31
    >>Click the |cRXP_PICK_Wanted Poster: Deathclasp|r
    .accept 8283 >>Accept Wanted - Deathclasp, Terror of the Sands
step
    .goto 1451/1,845.64,-6835.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bor Wildmane|r
    .accept 8318 >>Accept Secret Communication
    .target Bor Wildmane
step
    .goto 1451/1,823.70,-6752.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Mar'alith|r
    .accept 8304 >>Accept Dearest Natalia
    .target Commander Mar'alith
step
    .goto 1451/1,739.75,-6855.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Beetix Ficklespragg|r
    .accept 8278 >>Accept Noggle's Last Hope
    .target Beetix Ficklespragg
    .isQuestTurnedIn 8277 --any of: Deadly Desert Venom
step
    .goto 1451/1,730.00,-6867.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Calandrath|r
    .target Calandrath
    .home >>Set your Hearthstone to Calandrath's inn
step
    #completewith Drop8308x2
    >>|cRXP_LOOT_Brann Bronzebeard's Lost Letter|r can drop from |cRXP_ENEMY_Hive'Ashi Stinger|r, |cRXP_ENEMY_Hive'Ashi Worker|r, |cRXP_ENEMY_Hive'Ashi Defender|r. Use it to start the quest if you get one
    .collect 20461,1,8308 --Brann Bronzebeard's Lost Letter (1)
    .accept 8308 >>Accept Brann Bronzebeard's Lost Letter
    .use 20461
step
    #label Drop8308x2
    #loop
    .goto 1451/1,628.98,-7606.68,0
    .goto 1451/1,628.98,-7606.68,40,0
    .goto 1451/1,604.25,-7703.77,40,0
    .goto 1451/1,620.97,-7813.41,40,0
    .goto 1451/1,723.03,-7843.15,40,0
    .goto 1451/1,759.95,-7749.77,40,0
    .goto 1451/1,819.87,-7880.31,40,0
    .goto 1451/1,583.35,-7976.72,40,0
    .goto 1451/1,522.74,-7859.18,40,0
    .goto 1451/1,497.66,-7755.11,40,0
    >>Kill |cRXP_ENEMY_Hive'Regal Ambushers|r, |cRXP_ENEMY_Hive'Regal Burrowers|r, |cRXP_ENEMY_Hive'Regal Spitfires|r and |cRXP_ENEMY_Hive'Regal Slavemakers|r. Loot them for |cRXP_LOOT_Hive'Regal Silithid Brain|r
    .complete 8310,3 --Hive'Regal Silithid Brain (1)
    .mob Hive'Regal Ambusher
    .mob Hive'Regal Burrower
    .mob Hive'Regal Spitfire
    .mob Hive'Regal Slavemaker
step
    .goto 1451/1,1099.58,-8012.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rutgar Glyphshaper|r
    .turnin 8308 >>Turn in Brann Bronzebeard's Lost Letter
    .target Rutgar Glyphshaper
    .isOnQuest 8308
step
    .goto 1451/1,1115.95,-8022.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Frankal Stonebridge|r
    .turnin 8310 >>Turn in Breaking the Code while you are here
    .isQuestComplete 8310
    .target Frankal Stonebridge
step
    .goto 1451/1,1099.58,-8012.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rutgar Glyphshaper|r
    .complete 8304,2 --Rutgar Glyphshaper
    .target Rutgar Glyphshaper
step
    .goto 1451/1,1115.95,-8022.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Frankal Stonebridge|r
    .turnin 8310 >>Turn in Breaking the Code
    .target Frankal Stonebridge
step
    .goto 1451/1,1115.95,-8022.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Frankal Stonebridge|r
    .complete 8304,1 --Frankal Stonebridge
    .target Frankal Stonebridge
step
    .goto 1451/1,967.56,-8102.62
    >>Kill |cRXP_ENEMY_Deathclasp|r and loot |cRXP_LOOT_Deathclasp's Pincer|r
    .complete 8283,1 --Deathclasp's Pincer (1)
    .mob Deathclasp
step
    .goto 1451/1,197.05,-7578.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hermit Ortell|r
    .accept 8279 >>Accept The Twilight Lexicon
    .target Hermit Ortell
    .isQuestTurnedIn 8285 --any of: The Deserter
step
    #loop
    .goto 1451/1,929.24,-7921.89,0
    .goto 1451/1,929.24,-7921.89,40,0
    .goto 1451/1,955.02,-7983.92,40,0
    .goto 1451/1,1077.63,-7947.21,40,0
    .goto 1451/1,1147.65,-7856.85,40,0
    .goto 1451/1,1114.56,-7819.45,40,0
    .goto 1451/1,1038.27,-7795.99,40,0
    .goto 1451/1,1054.30,-7844.77,40,0
    .goto 1451/1,1014.59,-7927.47,40,0
    .goto 1451/1,982.19,-7876.37,40,0
    >>Kill |cRXP_ENEMY_Stonelash Flayers|r. Loot them for |cRXP_LOOT_Stonelash Flayer Stinger|r
    .complete 8278,1 --Stonelash Flayer Stinger (3)
    .mob Stonelash Flayer
    .isOnQuest 8278
step
    #loop
    .goto 1451/1,1065.44,-7459.87,0
    .goto 1451/1,1065.44,-7459.87,40,0
    .goto 1451/1,1110.03,-7383.44,40,0
    .goto 1451/1,1249.01,-7312.59,40,0
    .goto 1451/1,1323.21,-7215.26,40,0
    .goto 1451/1,1319.03,-7320.49,40,0
    .goto 1451/1,1365.01,-7402.03,40,0
    .goto 1451/1,1248.67,-7381.58,40,0
    .goto 1451/1,1180.04,-7413.87,40,0
    .goto 1451/1,1215.57,-7482.63,40,0
    >>Kill |cRXP_ENEMY_Stonelash Pincers|r. Loot them for |cRXP_LOOT_Stonelash Pincer Stinger|r
    .complete 8278,2 --Stonelash Pincer Stinger (3)
    .mob Stonelash Pincer
    .isOnQuest 8278
step
    #loop
    .goto 1451/1,1094.01,-7895.65,0
    .goto 1451/1,1094.01,-7895.65,40,0
    .goto 1451/1,1124.31,-7907.49,40,0
    .goto 1451/1,1150.44,-7962.08,40,0
    .goto 1451/1,1068.23,-7983.22,40,0
    .goto 1451/1,990.55,-8005.06,40,0
    .goto 1451/1,914.27,-7983.92,40,0
    .goto 1451/1,976.62,-7931.42,40,0
    .goto 1451/1,1014.59,-7880.55,40,0
    .goto 1451/1,1058.82,-7924.91,40,0
    >>Kill |cRXP_ENEMY_Rock Stalkers|r. Loot them for |cRXP_LOOT_Rock Stalker Fang|r
    .complete 8278,3 --Rock Stalker Fang (3)
    .mob Rock Stalker
    .isOnQuest 8278
step
    #completewith next
    .hs >>Hearth to Calandrath's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1451/1,739.75,-6855.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Beetix Ficklespragg|r
    .turnin 8278 >>Turn in Noggle's Last Hope
    .target Beetix Ficklespragg
    .isOnQuest 8278
step
    .goto 1451/1,739.05,-6852.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Noggle Ficklespragg|r
    .accept 8282 >>Accept Noggle's Lost Satchel
    .target Noggle Ficklespragg
    .isQuestTurnedIn 8278 --any of: Noggle's Last Hope
step
    .goto 1451/1,823.70,-6752.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Mar'alith|r
    .turnin 8304 >>Turn in Dearest Natalia
    .accept 8306 >>Accept Into The Maw of Madness
    .target Commander Mar'alith
step
    .goto 1451/1,769.71,-6740.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vish Kozus|r
    .turnin 8283 >>Turn in Wanted - Deathclasp, Terror of the Sands
    .target Vish Kozus
step
    #completewith Along25
    >>As you go: Kill |cRXP_ENEMY_Twilight Keeper Havunths|r, |cRXP_ENEMY_Twilight Avengers|r, |cRXP_ENEMY_Twilight Geolords|r and |cRXP_ENEMY_Twilight Stonecallers|r. Loot them for |cRXP_LOOT_Encrypted Twilight Text|r. |cRXP_WARN_Anything left is finished later|r
    .complete 8318,1 --Encrypted Twilight Text (10)
    .mob Twilight Keeper Havunth
    .mob Twilight Avenger
    .mob Twilight Geolord
    .mob Twilight Stonecaller
step
    #label Along25
    .goto 1451/1,1114.21,-6939.07
    >>Kill |cRXP_ENEMY_Twilight Keeper Havunth|r and loot |cRXP_LOOT_Twilight Lexicon - Chapter 3|r
    .complete 8279,3 --Twilight Lexicon - Chapter 3 (1)
    .mob Twilight Keeper Havunth
    .isOnQuest 8279
step
    #loop
    .goto 1451/1,1114.21,-6939.07,0
    .goto 1451/1,1114.21,-6939.07,40,0
    .goto 1451/1,1073.45,-6972.05,40,0
    .goto 1451/1,1111.77,-7049.87,40,0
    .goto 1451/1,1170.29,-7054.98,40,0
    .goto 1451/1,1235.43,-7052.89,40,0
    .goto 1451/1,1258.42,-7008.29,40,0
    .goto 1451/1,1246.58,-6953.94,40,0
    .goto 1451/1,1178.65,-6999.93,40,0
    .goto 1451/1,1153.92,-6906.32,40,0
    >>Kill |cRXP_ENEMY_Twilight Keeper Havunths|r, |cRXP_ENEMY_Twilight Avengers|r, |cRXP_ENEMY_Twilight Geolords|r and |cRXP_ENEMY_Twilight Stonecallers|r. Loot them for |cRXP_LOOT_Encrypted Twilight Text|r
    .complete 8318,1 --Encrypted Twilight Text (10)
    .mob Twilight Keeper Havunth
    .mob Twilight Avenger
    .mob Twilight Geolord
    .mob Twilight Stonecaller
step
    .goto 1451/1,1619.64,-6808.99
    >>Kill |cRXP_ENEMY_Twilight Keeper Mayna|r and loot |cRXP_LOOT_Twilight Lexicon - Chapter 1|r
    .complete 8279,1 --Twilight Lexicon - Chapter 1 (1)
    .mob Twilight Keeper Mayna
    .isOnQuest 8279
step
    .goto 1451/1,1977.03,-7964.64
    >>Kill |cRXP_ENEMY_Twilight Keeper Exeter|r and loot |cRXP_LOOT_Twilight Lexicon - Chapter 2|r
    .complete 8279,2 --Twilight Lexicon - Chapter 2 (1)
    .mob Twilight Keeper Exeter
    .isOnQuest 8279
step
    .goto 1451/1,1099.58,-8012.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rutgar Glyphshaper|r
    .accept 8309 >>Accept Glyph Chasing
    .target Rutgar Glyphshaper
step
    .goto 1451/1,1099.58,-8012.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rutgar Glyphshaper|r
    .turnin 8309 >>Turn in Glyph Chasing
    .target Rutgar Glyphshaper
    .isQuestComplete 8309
step
    .goto 1451/1,1099.58,-8012.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rutgar Glyphshaper|r
    .accept 8314 >>Accept Unraveling the Mystery
    .target Rutgar Glyphshaper
    .isQuestTurnedIn 8309 --Glyph Chasing
    .xp <58,1
step
    .goto 1451/1,985.33,-8081.01
    >>Pick up |cRXP_PICK_Noggle's Satchel|r from the ground
    .complete 8282,1 --Noggle's Satchel (1)
    .isOnQuest 8282
step
    .goto 1451/1,197.05,-7578.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hermit Ortell|r
    .turnin 8279 >>Turn in The Twilight Lexicon
    .target Hermit Ortell
    .isOnQuest 8279
step
    .goto 1451/1,197.05,-7578.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hermit Ortell|r
    .accept 8287 >>Accept A Terrible Purpose
    .accept 8323 >>Accept True Believers
    .target Hermit Ortell
    .isQuestTurnedIn 8279 --any of: The Twilight Lexicon
step
    #loop
    .goto 1451/1,230.84,-6477.74,0
    .goto 1451/1,230.84,-6477.74,40,0
    .goto 1451/1,218.30,-6416.18,40,0
    .goto 1451/1,181.02,-6386.68,40,0
    .goto 1451/1,147.24,-6355.78,40,0
    .goto 1451/1,66.42,-6262.87,40,0
    .goto 1451/1,106.13,-6290.98,40,0
    .goto 1451/1,178.59,-6316.06,40,0
    .goto 1451/1,275.42,-6319.55,40,0
    .goto 1451/1,271.59,-6418.04,40,0
    >>Kill |cRXP_ENEMY_Twilight Keeper Havunths|r, |cRXP_ENEMY_Twilight Avengers|r, |cRXP_ENEMY_Twilight Geolords|r and |cRXP_ENEMY_Twilight Stonecallers|r. Loot them for |cRXP_LOOT_Encrypted Twilight Text|r
    .complete 8323,1 --Encrypted Twilight Text (10)
    .mob Twilight Keeper Havunth
    .mob Twilight Avenger
    .mob Twilight Geolord
    .mob Twilight Stonecaller
    .isOnQuest 8323
step
    .goto 1451/1,197.05,-7578.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hermit Ortell|r
    .turnin 8323 >>Turn in True Believers
    .target Hermit Ortell
    .isOnQuest 8323
step
    .goto 1451/1,1239.26,-7410.16
    >>Open the |cRXP_PICK_Hive'Zora Glyphed Crystal|r. Loot it for |cRXP_LOOT_Hive'Zora Rubbing|r
    .complete 8309,2 --Hive'Zora Rubbing (1)
step
    .goto 1451/1,845.64,-6835.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bor Wildmane|r
    .turnin 8318 >>Turn in Secret Communication
    .target Bor Wildmane
step
    .goto 1451/1,823.70,-6752.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Mar'alith|r
    .turnin 8287 >>Turn in A Terrible Purpose
    .target Commander Mar'alith
    .isOnQuest 8287
step
    .goto 1451/1,823.70,-6752.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Mar'alith|r
    .turnin 8306 >>Turn in Into The Maw of Madness
    .target Commander Mar'alith
    .isQuestComplete 8306
step
    .goto 1451/1,807.33,-6828.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Geologist Larksbane|r
    .turnin 8314 >>Turn in Unraveling the Mystery
    .target Geologist Larksbane
    .isOnQuest 8314
step
    .goto 1451/1,739.05,-6852.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Noggle Ficklespragg|r
    .turnin 8282 >>Turn in Noggle's Lost Satchel
    .target Noggle Ficklespragg
    .isOnQuest 8282
step
    .goto 1451/1,765.53,-6579.95
    >>Open the |cRXP_PICK_Hive'Ashi Glyphed Crystal|r. Loot it for |cRXP_LOOT_Hive'Ashi Rubbing|r
    .complete 8309,1 --Hive'Ashi Rubbing (1)
step
    +|cRXP_WARN_That is all of Silithus for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Synthetic AreaID: Kalimdor continent map and back here|r: Into The Maw of Madness, Glyph Chasing
step
    +|cRXP_WARN_End of the Silithus route.|r
]])
