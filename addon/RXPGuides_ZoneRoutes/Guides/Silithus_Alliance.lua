-- 55-60 Silithus: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 2 parts (from level 55, 58).
-- Split into 2 guides, listed under "55 - 59 Silithus" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Silithus.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 55 - 59 Silithus
#subweight -55
#name 55-56 Silithus: around Windcaller Proudhorn

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
    .goto 1451/1,319.66,-7055.21,0
    .goto 1451/1,319.66,-7055.21,40,0
    .goto 1451/1,351.01,-7141.86,40,0
    .goto 1451/1,352.40,-7314.22,40,0
    >>Kill |cRXP_ENEMY_Tortured Druids|r
    .complete 1125,1 --Tortured Druid slain (8)
    .mob Tortured Druid
    .isOnQuest 1125
step
    #loop
    .goto 1451/1,352.40,-7216.19,0
    .goto 1451/1,352.40,-7216.19,40,0
    .goto 1451/1,444.02,-7252.90,40,0
    .goto 1451/1,351.71,-7116.54,40,0
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
    .goto 1451/1,1702.20,-6276.34,0
    .goto 1451/1,1702.20,-6276.34,40,0
    .goto 1451/1,1815.75,-6196.43,40,0
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
    .goto 1451/1,738.01,-6385.05,0
    .goto 1451/1,738.01,-6385.05,40,0
    .goto 1451/1,591.01,-6369.03,40,0
    .goto 1451/1,670.08,-6252.18,40,0
    >>Kill |cRXP_ENEMY_Dredge Strikers|r
    .complete 8280,1 --Dredge Striker slain (15)
    .mob Dredge Striker
step
    #loop
    .goto 1451/1,1277.58,-6483.78,0
    .goto 1451/1,1277.58,-6483.78,40,0
    .goto 1451/1,1283.85,-6611.07,40,0
    .goto 1451/1,1273.40,-6747.89,40,0
    .goto 1451/1,1383.12,-6638.72,40,0
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
    .goto 1451/1,1386.95,-6979.49,0
    .goto 1451/1,1386.95,-6979.49,40,0
    .goto 1451/1,1508.17,-6991.57,40,0
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
    +|cRXP_WARN_The rest of Silithus is planned from level 58.|r Load its guide for level 58 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 55 - 59 Silithus
#subweight -55
#name 58-59 Silithus: around Commander Mar'alith

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
    .goto 1451/1,1255.28,-7416.66,0
    .goto 1451/1,1255.28,-7416.66,40,0
    .goto 1451/1,1404.37,-7448.48,40,0
    .goto 1451/1,1445.82,-7383.21,40,0
    >>Kill |cRXP_ENEMY_Hive'Zora Waywatchers|r, |cRXP_ENEMY_Hive'Zora Tunnelers|r, |cRXP_ENEMY_Hive'Zora Wasps|r and |cRXP_ENEMY_Hive'Zora Reavers|r. Loot them for |cRXP_LOOT_Hive'Zora Silithid Brain|r
    .complete 8310,2 --Hive'Zora Silithid Brain (1)
    .mob Hive'Zora Waywatcher
    .mob Hive'Zora Tunneler
    .mob Hive'Zora Wasp
    .mob Hive'Zora Reaver
step
    #label Drop8308x1
    #loop
    .goto 1451/1,848.78,-7117.93,0
    .goto 1451/1,848.78,-7117.93,40,0
    .goto 1451/1,848.08,-6976.93,40,0
    .goto 1451/1,761.70,-6956.72,40,0
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
    .goto 1451/1,624.45,-7697.27,0
    .goto 1451/1,624.45,-7697.27,40,0
    .goto 1451/1,543.29,-7825.96,40,0
    .goto 1451/1,657.20,-7947.91,40,0
    .goto 1451/1,741.14,-7812.02,40,0
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
    .complete 8304,1 --Frankal Stonebridge
    .target Frankal Stonebridge
step
    .goto 1451/1,1115.95,-8022.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Frankal Stonebridge|r
    .turnin 8310 >>Turn in Breaking the Code
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
    .goto 1451/1,949.80,-7909.35,0
    .goto 1451/1,949.80,-7909.35,40,0
    .goto 1451/1,1108.64,-7827.82,40,0
    >>Kill |cRXP_ENEMY_Stonelash Flayers|r. Loot them for |cRXP_LOOT_Stonelash Flayer Stinger|r
    .complete 8278,1 --Stonelash Flayer Stinger (3)
    .mob Stonelash Flayer
    .isOnQuest 8278
step
    #loop
    .goto 1451/1,1198.51,-7443.37,0
    .goto 1451/1,1198.51,-7443.37,40,0
    .goto 1451/1,1110.03,-7416.89,40,0
    .goto 1451/1,1323.21,-7215.26,40,0
    .goto 1451/1,1283.85,-7383.21,40,0
    >>Kill |cRXP_ENEMY_Stonelash Pincers|r. Loot them for |cRXP_LOOT_Stonelash Pincer Stinger|r
    .complete 8278,2 --Stonelash Pincer Stinger (3)
    .mob Stonelash Pincer
    .isOnQuest 8278
step
    #loop
    .goto 1451/1,1094.01,-7895.65,0
    .goto 1451/1,1094.01,-7895.65,40,0
    .goto 1451/1,986.72,-7990.19,40,0
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
    .goto 1451/1,1120.13,-6988.55,0
    .goto 1451/1,1120.13,-6988.55,40,0
    .goto 1451/1,1188.40,-6992.96,40,0
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
    .goto 1451/1,227.00,-6458.69,0
    .goto 1451/1,227.00,-6458.69,40,0
    .goto 1451/1,186.60,-6354.16,40,0
    .goto 1451/1,95.33,-6293.07,40,0
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
