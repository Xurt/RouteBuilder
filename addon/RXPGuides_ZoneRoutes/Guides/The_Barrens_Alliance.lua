-- 11-31 The Barrens: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 7 parts (from level 11, 14, 17, 20, 23, 31, 34).
-- Split into 7 guides, listed under "11 - 35 The Barrens" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/The Barrens.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 11 - 35 The Barrens
#subweight -11
#name 11-12 The Barrens
--RouteBuilder:next
#next Zone Routes (Alliance)\10-15 Darkshore: around Thundris Windweaver;Zone Routes (Alliance)\9-12 Teldrassil: around Priestess A'moora;Zone Routes (Alliance)\11-15 Zephras Isle: around Elegael Thornpaw

step
    .goto 1413/1,-2456.92,-371.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dokimi|r
    .accept 91901 >>Accept A Sealed Crate
    .target Dokimi
step
    .goto 1413/1,-2456.92,-371.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dokimi|r
    >>|cRXP_WARN_The database has no objectives for A Sealed Crate. Skip this step if the quest is not finished|r
    .turnin 91901 >>Turn in A Sealed Crate
    .target Dokimi
    .isOnQuest 91901
step << Warlock
    .goto 1413/1,-3711.43,-782.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Menara Voidrender|r
    .turnin 4968 >>Turn in Knowledge of the Orb of Orahil
    .target Menara Voidrender
    .isOnQuest 4968
step << Warlock
    .goto 1413/1,-3711.43,-782.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Menara Voidrender|r
    .turnin 4782 >>Turn in Components for the Enchanted Gold Bloodrobe
    .target Menara Voidrender
    .isOnQuest 4782
step << Warlock
    .goto 1413/1,-3711.43,-782.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Menara Voidrender|r
    .turnin 4965 >>Turn in Knowledge of the Orb of Orahil
    .target Menara Voidrender
    .isOnQuest 4965
step << Warlock
    .goto 1413/1,-3723.59,-785.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Strahad Farsan|r
    .turnin 1804 >>Turn in Tome of the Cabal
    .target Strahad Farsan
    .isQuestComplete 1804
step
    .goto 1413/1,-3728.66,-835.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gazlowe|r
    .accept 887 >>Accept Southsea Freebooters
    .target Gazlowe
step
    .goto 1413/1,-3759.06,-902.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sputtervalve|r
    .accept 894 >>Accept Samophlange
    .target Sputtervalve
step
    #loop
    .goto 1413/1,-3819.86,-1316.33,0
    .goto 1413/1,-3819.86,-1316.33,40,0
    .goto 1413/1,-3884.71,-1323.09,40,0
    .goto 1413/1,-3909.03,-1354.17,40,0
    .goto 1413/1,-3878.63,-1379.17,40,0
    .goto 1413/1,-3878.63,-1551.45,40,0
    .goto 1413/1,-3881.67,-1614.96,40,0
    .goto 1413/1,-3819.86,-1541.99,40,0
    .goto 1413/1,-3845.19,-1485.24,40,0
    .goto 1413/1,-3820.87,-1387.28,40,0
    >>Kill |cRXP_ENEMY_Southsea Brigands|r
    >>Kill |cRXP_ENEMY_Southsea Cannoneers|r
    .complete 887,1 --Southsea Brigand slain (12)
    .complete 887,2 --Southsea Cannoneer slain (6)
    .mob Southsea Brigand
    .mob Southsea Cannoneer
step
    .goto 1413/1,-3728.66,-835.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gazlowe|r
    .turnin 887 >>Turn in Southsea Freebooters
    .accept 890 >>Accept The Missing Shipment
    .target Gazlowe
step
    .goto 1413/1,-3796.55,-985.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wharfmaster Dizzywig|r
    .turnin 890 >>Turn in The Missing Shipment
    .accept 892 >>Accept The Missing Shipment
    .target Wharfmaster Dizzywig
step
    .goto 1413/1,-3728.66,-835.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gazlowe|r
    .turnin 892 >>Turn in The Missing Shipment
    .target Gazlowe
step
    .goto 1413/1,-2686.95,825.40
    >>Click the |cRXP_PICK_Control Console|r
    .turnin 894 >>Turn in Samophlange
    .accept 900 >>Accept Samophlange
step
    .goto 1413/1,-2679.86,831.48
    >>Click the |cRXP_PICK_Main Control Valve|r
    >>Click the |cRXP_PICK_Regulator Valve|r
    >>Click the |cRXP_PICK_Fuel Control Valve|r
    .complete 900,1 --Shut off Main Control Valve
    .complete 900,3 --Shut off Regulator Valve
    .complete 900,2 --Shut off Fuel Control Valve
step
    .goto 1413/1,-2686.95,825.40
    >>Click the |cRXP_PICK_Control Console|r
    .turnin 900 >>Turn in Samophlange
step
    .goto 1413/1,-3769.60,-898.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bragok|r
    .fp Ratchet >> Get the Ratchet Flight Path
    .target Bragok
step << Warlock
    .goto 1413/1,-2373.83,-2245.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Takar the Seer|r
    .turnin 1716 >>Turn in Devourer of Souls
    .target Takar the Seer
    .isOnQuest 1716
step
    .goto 1413/1,-3759.06,-902.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sputtervalve|r
    .turnin 1094 >>Turn in Further Instructions
    .target Sputtervalve
    .isOnQuest 1094
step << Warlock
    .goto 1413/1,-3769.60,-898.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bragok|r
    .fp Ratchet>> Get the Ratchet Flight Path
    .target Bragok
step << Warrior
    .goto 1413/1,-4330.58,-1708.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Klannoc Macleod|r
    .turnin 1718 >>Turn in The Islander
    .target Klannoc Macleod
    .isOnQuest 1718
step << !Warlock
    .goto 1413/1,-3769.60,-898.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bragok|r
    .fp Ratchet>> Get the Ratchet Flight Path
    .target Bragok
step << Warlock
    .goto 1413/1,-3711.43,-782.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Menara Voidrender|r
    .turnin 4736 >>Turn in In Search of Menara Voidrender
    .target Menara Voidrender
    .isOnQuest 4736
step << Warlock
    .goto 1413/1,-3711.43,-782.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Menara Voidrender|r
    .turnin 4738 >>Turn in In Search of Menara Voidrender
    .target Menara Voidrender
    .isOnQuest 4738
step << Warlock
    .goto 1413/1,-3723.59,-785.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Strahad Farsan|r
    .turnin 1798 >>Turn in Seeking Strahad
    .target Strahad Farsan
    .isOnQuest 1798
step
    .goto 1413/1,-3796.55,-985.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wharfmaster Dizzywig|r
    .turnin 1111 >>Turn in Wharfmaster Dizzywig
    .target Wharfmaster Dizzywig
    .isOnQuest 1111
step
    .goto 1413/1,-3796.55,-985.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wharfmaster Dizzywig|r
    .turnin 1039 >>Turn in The Barrens Port
    .target Wharfmaster Dizzywig
    .isOnQuest 1039
step
    .goto 1413/1,-2073.88,-3379.02
    >>Click the |cRXP_PICK_Burned-Out Remains|r
    .turnin 79008 >>Turn in ... and that note you found
    .isOnQuest 79008
step
    +|cRXP_WARN_Suggested next zones at level 11|r: |cRXP_FRIENDLY_Darkshore|r (about 2.7 levels of quests, starting around Thundris Windweaver), |cRXP_FRIENDLY_Teldrassil|r (about 1.7 levels of quests, starting around Priestess A'moora), |cRXP_FRIENDLY_Zephras Isle|r (about 1.6 levels of quests, starting around Elegael Thornpaw). Completing this step loads the guide for Darkshore --RouteBuilder:next
step
    +|cRXP_WARN_The rest of The Barrens is planned from level 14.|r Load its guide for level 14 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 11 - 35 The Barrens
#subweight -11
#name 14-15 The Barrens
--RouteBuilder:next
#next Zone Routes (Alliance)\10-15 Darkshore: around Thundris Windweaver;Zone Routes (Alliance)\9-12 Teldrassil: around Priestess A'moora;Zone Routes (Alliance)\11-15 Zephras Isle: around Elegael Thornpaw

step
    .goto 1413/1,-3728.66,-835.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gazlowe|r
    .accept 888 >>Accept Stolen Booty
    .target Gazlowe
    .isQuestTurnedIn 892 --any of: The Missing Shipment
step
    .goto 1413/1,-3719.54,-919.07
    >>Click the |cRXP_PICK_WANTED|r
    .accept 895 >>Accept WANTED: Baron Longshore
step
    .goto 1413/1,-3791.48,-1698.06
    >>Kill |cRXP_ENEMY_Baron Longshore|r and loot |cRXP_LOOT_Baron Longshore's Head|r
    .complete 895,1 --Baron Longshore's Head (1)
    .mob Baron Longshore
step
    .goto 1413/1,-3819.86,-1714.95
    >>Open the |cRXP_PICK_Fragile - Do Not Drop|r. Loot it for |cRXP_LOOT_Telescopic Lens|r
    .complete 888,2 --Telescopic Lens (1)
    .isOnQuest 888
step
    .goto 1413/1,-3723.59,-1740.63
    >>Open the |cRXP_PICK_Drizzlik's Emporium|r. Loot it for |cRXP_LOOT_Shipment of Boots|r
    .complete 888,1 --Shipment of Boots (1)
    .isOnQuest 888
step
    .goto 1413/1,-3796.55,-985.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wharfmaster Dizzywig|r
    .accept 896 >>Accept Miner's Fortune
    .target Wharfmaster Dizzywig
step
    .goto 1413/1,-3728.66,-835.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gazlowe|r
    .turnin 888 >>Turn in Stolen Booty
    .target Gazlowe
    .isOnQuest 888
step
    .goto 1413/1,-3728.66,-835.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gazlowe|r
    .turnin 895 >>Turn in WANTED: Baron Longshore
    .target Gazlowe
step
    #loop
    .goto 1413/1,-3683.06,1236.85,0
    .goto 1413/1,-3683.06,1236.85,40,0
    .goto 1413/1,-3645.56,1246.99,40,0
    .goto 1413/1,-3577.67,1240.91,40,0
    .goto 1413/1,-3564.50,1345.63,40,0
    .goto 1413/1,-3633.40,1387.52,40,0
    .goto 1413/1,-3690.15,1355.09,40,0
    .goto 1413/1,-3650.63,1325.36,40,0
    .goto 1413/1,-3621.24,1278.07,40,0
    .goto 1413/1,-3680.02,1280.77,40,0
    >>Kill |cRXP_ENEMY_Venture Co. Enforcers|r, |cRXP_ENEMY_Venture Co. Overseers|r and |cRXP_ENEMY_Boss Copperplugs|r. Loot them for |cRXP_LOOT_Cats Eye Emerald|r
    .complete 896,1 --Cats Eye Emerald (1)
    .mob Venture Co. Enforcer
    .mob Venture Co. Overseer
    .mob Boss Copperplug
step
    .goto 1413/1,-2686.95,825.40
    >>Click the |cRXP_PICK_Control Console|r
    .accept 901 >>Accept Samophlange
    .isQuestTurnedIn 900 --any of: Samophlange
step
    .goto 1413/1,-2731.54,910.53
    >>Kill |cRXP_ENEMY_Tinkerer Sniggles|r and loot |cRXP_LOOT_Console Key|r
    .complete 901,1 --Console Key (1)
    .mob Tinkerer Sniggles
    .isOnQuest 901
step
    .goto 1413/1,-2686.95,825.40
    >>Click the |cRXP_PICK_Control Console|r
    .turnin 901 >>Turn in Samophlange
    .isOnQuest 901
step
    .goto 1413/1,-2686.95,825.40
    >>Click the |cRXP_PICK_Control Console|r
    .accept 902 >>Accept Samophlange
    .isQuestTurnedIn 901 --any of: Samophlange
step
    .goto 1413/1,-2456.92,-371.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dokimi|r
    .turnin 91901 >>Turn in A Sealed Crate
    .target Dokimi
    .isOnQuest 91901
step
    .goto 1413/1,-3759.06,-902.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sputtervalve|r
    .turnin 902 >>Turn in Samophlange
    .target Sputtervalve
    .isOnQuest 902
step
    .goto 1413/1,-3796.55,-985.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wharfmaster Dizzywig|r
    .turnin 896 >>Turn in Miner's Fortune
    .target Wharfmaster Dizzywig
step
    .xp 14 >>Grind to level 14 (Stepping Stones needs it)
step
    .goto 1413/1,-2073.88,-3379.02
    >>Click the |cRXP_PICK_Burned-Out Remains|r
    .accept 79192 >>Accept Stepping Stones
step
    +|cRXP_WARN_That is all of The Barrens for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Stonetalon Mountains|r: Stepping Stones
step
    +|cRXP_WARN_Suggested next zones at level 14|r: |cRXP_FRIENDLY_Darkshore|r (about 2.3 levels of quests, starting around Thundris Windweaver), |cRXP_FRIENDLY_Teldrassil|r (about 1.2 levels of quests, starting around Priestess A'moora), |cRXP_FRIENDLY_Zephras Isle|r (about 1.1 levels of quests, starting around Elegael Thornpaw). Completing this step loads the guide for Darkshore --RouteBuilder:next
step
    +|cRXP_WARN_The rest of The Barrens is planned from level 17.|r Load its guide for level 17 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 11 - 35 The Barrens
#subweight -11
#name 17-18 The Barrens: around Mebok Mizzyrix
--RouteBuilder:next
#next Zone Routes (Alliance)\17-19 Darkshore: around Archaeologist Hollee;Zone Routes (Alliance)\11-15 Zephras Isle: around Elegael Thornpaw;Zone Routes (Alliance)\14-16 Loch Modan: around Daryl the Youngling

step
    .goto 1413/1,-2372.82,-608.96
    >>Click the |cRXP_PICK_Scrolls|r
    .accept 78143 >>Accept Secrets of the Dreamers
step
    .goto 1413/1,-2456.92,-371.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dokimi|r
    .turnin 91901 >>Turn in A Sealed Crate
    .target Dokimi
    .isOnQuest 91901
step
    .goto 1413/1,-3082.15,1017.95
    >>Click the |cRXP_PICK_Manual|r
    .accept 78145 >>Accept Arcanic Systems Manual
step
    .goto 1413/1,-3104.44,1109.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wizzlecrank's Shredder|r
    .accept 858 >>Accept Ignition
    .target Wizzlecrank's Shredder
step
    .goto 1413/1,-3079.11,1032.81
    >>Kill |cRXP_ENEMY_Supervisor Lugwizzle|r and loot |cRXP_LOOT_Ignition Key|r
    .complete 858,1 --Ignition Key (1)
    .mob Supervisor Lugwizzle
step
    .goto 1413/1,-3104.44,1109.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wizzlecrank's Shredder|r
    .turnin 858 >>Turn in Ignition
    .accept 863 >>Accept The Escape
    .target Wizzlecrank's Shredder
step
    .goto 1413/1,-2986.90,1093.62
    >>Escort Wizzlecrank out of the Venture Co. drill site
    .complete 863,1 --Escort Wizzlecrank out of the Venture Co. drill site
step
    .goto 1413/1,-3082.15,1017.95
    >>Open the |cRXP_PICK_Manual|r. Loot it for |cRXP_LOOT_Arcanic Systems Manual|r
    .complete 78145,1 --Arcanic Systems Manual (1)
step
    .goto 1413/1,-3730.68,-840.02
    >>Click the |cRXP_PICK_Goblin Tome|r
    .accept 79097 >>Accept Baxtan: On Destructive Magics
step
    .goto 1413/1,-3759.06,-902.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sputtervalve|r
    .turnin 863 >>Turn in The Escape
    .target Sputtervalve
step
    .goto 1413/1,-3697.24,-929.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mebok Mizzyrix|r
    .accept 865 >>Accept Raptor Horns
    .accept 1069 >>Accept Deepmoss Spider Eggs
    .target Mebok Mizzyrix
step
    .goto 1413/1,-3555.38,-552.88
    >>Kill |cRXP_ENEMY_Sunscale Scytheclaws|r, |cRXP_ENEMY_Ishamuhales|r and |cRXP_ENEMY_Takk the Leapers|r. Loot them for |cRXP_LOOT_Intact Raptor Horn|r
    .complete 865,1 --Intact Raptor Horn (5)
    .mob Sunscale Scytheclaw
    .mob Ishamuhale
    .mob Takk the Leaper
step
    .goto 1413/1,-3697.24,-929.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mebok Mizzyrix|r
    .turnin 865 >>Turn in Raptor Horns
    .target Mebok Mizzyrix
step
    .goto 1413/1,-3759.06,-902.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sputtervalve|r
    .accept 1095 >>Accept Further Instructions
    .target Sputtervalve
    .isQuestTurnedIn 1094 --any of: Further Instructions
    .xp <16,1
step
    .goto 1413/1,-3759.06,-902.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sputtervalve|r
    .accept 1483 >>Accept Ziz Fizziks
    .target Sputtervalve
step
    .goto 1413/1,-3697.24,-929.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mebok Mizzyrix|r
    .turnin 1069 >>Turn in Deepmoss Spider Eggs
    .target Mebok Mizzyrix
    .isQuestComplete 1069
step
    .goto 1413/1,-3730.68,-840.02
    >>Open the |cRXP_PICK_Goblin Tome|r. Loot it for |cRXP_LOOT_Baxtan: On Destructive Magics|r
    .complete 79097,1 --Baxtan: On Destructive Magics (1)
step
    .goto 1413/1,-2372.82,-608.96
    >>Open the |cRXP_PICK_Scrolls|r. Loot it for |cRXP_LOOT_Secrets of the Dreamers|r
    .complete 78143,1 --Secrets of the Dreamers (1)
step
    .goto 1413/1,-2259.32,-602.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Falla Sagewind|r
    .accept 3370 >>Accept In Nightmares
    .target Falla Sagewind
    .isQuestTurnedIn 6981 --any of: The Glowing Shard
    .xp <15,1
step
    +|cRXP_WARN_That is all of The Barrens for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Darnassus|r: In Nightmares
    >>|cRXP_FRIENDLY_Stonetalon Mountains|r: Ziz Fizziks, Further Instructions
    >>|cRXP_FRIENDLY_Undercity|r: Secrets of the Dreamers, Arcanic Systems Manual, Baxtan: On Destructive Magics
    >>|cRXP_FRIENDLY_Stonetalon Mountains and back here|r: Deepmoss Spider Eggs
step
    +|cRXP_WARN_Suggested next zones at level 17|r: |cRXP_FRIENDLY_Darkshore|r (about 1.1 levels of quests, starting around Archaeologist Hollee), |cRXP_FRIENDLY_Zephras Isle|r (about 0.7 levels of quests, starting around Elegael Thornpaw), |cRXP_FRIENDLY_Loch Modan|r (about 0.5 levels of quests, starting around Daryl the Youngling). Completing this step loads the guide for Darkshore --RouteBuilder:next
step
    +|cRXP_WARN_The rest of The Barrens is planned from level 20.|r Load its guide for level 20 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 11 - 35 The Barrens
#subweight -11
#name 20-21 The Barrens
--RouteBuilder:next
#next Zone Routes (Alliance)\17-19 Darkshore: around Archaeologist Hollee;Zone Routes (Alliance)\20-21 Wetlands: around Karl Boran;Zone Routes (Alliance)\20-21 Stonetalon Mountains: around Gaxim Rustfizzle

step
    .goto 1413/1,-3650.63,-1050.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bainham|r
    .accept 97005 >>Accept Chol'aruk the Ravener
    .target Bainham
step
    .goto 1413/1,-3697.24,-929.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mebok Mizzyrix|r
    .turnin 1069 >>Turn in Deepmoss Spider Eggs
    .target Mebok Mizzyrix
    .isQuestComplete 1069
step
    #loop
    .goto 1413/1,-3234.15,-250.20,0
    .goto 1413/1,-3234.15,-250.20,40,0
    .goto 1413/1,-3244.28,-231.28,40,0
    .goto 1413/1,-3260.50,-192.77,40,0
    .goto 1413/1,-3244.28,-146.83,40,0
    .goto 1413/1,-3199.70,-205.61,40,0
    .goto 1413/1,-3208.82,-214.39,40,0
    >>Kill |cRXP_ENEMY_Chol'aruk|r and loot |cRXP_LOOT_Chol'aruk's Head|r
    .complete 97005,1 --Chol'aruk's Head (1)
    .mob Chol'aruk
step
    .goto 1413/1,-2456.92,-371.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dokimi|r
    .turnin 91901 >>Turn in A Sealed Crate
    .target Dokimi
    .isOnQuest 91901
step
    .goto 1413/1,-3650.63,-1050.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bainham|r
    .turnin 97005 >>Turn in Chol'aruk the Ravener
    .target Bainham
step
    +|cRXP_WARN_Suggested next zones at level 20|r: |cRXP_FRIENDLY_Darkshore|r (about 0.9 levels of quests, starting around Archaeologist Hollee), |cRXP_FRIENDLY_Wetlands|r (about 0.5 levels of quests, starting around Karl Boran), |cRXP_FRIENDLY_Stonetalon Mountains|r (about 0.5 levels of quests, starting around Gaxim Rustfizzle; 3 quests from here hand in there). Completing this step loads the guide for Darkshore --RouteBuilder:next
step
    +|cRXP_WARN_The rest of The Barrens is planned from level 23.|r Load its guide for level 23 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 11 - 35 The Barrens
#subweight -11
#name 23-24 The Barrens
--RouteBuilder:next
#next Zone Routes (Alliance)\23-24 Wetlands: around Captain Stoutfist

step << Warlock
    .goto 1413/1,-2373.83,-2252.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doan Karhan|r
    .accept 1740 >>Accept The Orb of Soran'ruk
    .target Doan Karhan
step << Warlock
    .goto 1413/1,-2373.83,-2252.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doan Karhan|r
    .turnin 1740 >>Turn in The Orb of Soran'ruk
    .target Doan Karhan
    .isQuestComplete 1740
step
    .goto 1413/1,-3697.24,-929.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mebok Mizzyrix|r
    .turnin 1069 >>Turn in Deepmoss Spider Eggs
    .target Mebok Mizzyrix
    .isQuestComplete 1069
step
    .goto 1413/1,-3697.24,-929.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mebok Mizzyrix|r
    .accept 1221 >>Accept Blueleaf Tubers
    .target Mebok Mizzyrix
step
    .goto 1413/1,-3694.20,-927.85
    >>Open the |cRXP_PICK_Snufflenose Command Sticks|r. Loot it for |cRXP_LOOT_Snufflenose Command Stick|r
    >>Pick up |cRXP_PICK_Snufflenose Owner's Manual|r from the ground
    >>Open the |cRXP_PICK_Crate with Holes|r. Loot it for |cRXP_LOOT_Crate With Holes|r
    .complete 1221,4 --Snufflenose Command Stick (1)
    .complete 1221,3 --Snufflenose Owner's Manual (1)
    .complete 1221,2 --Crate With Holes (1)
step
    .goto 1413/1,-3697.24,-929.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mebok Mizzyrix|r
    .turnin 1221 >>Turn in Blueleaf Tubers
    .target Mebok Mizzyrix
    .isQuestComplete 1221
step
    .goto 1413/1,-2456.92,-371.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dokimi|r
    .turnin 91901 >>Turn in A Sealed Crate
    .target Dokimi
    .isOnQuest 91901
step << Warlock
    .goto 1413/1,-2373.83,-2245.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Takar the Seer|r
    .accept 1738 >>Accept Heartswood
    .accept 65602 >>Accept What Is Love?
    .target Takar the Seer
    .isQuestTurnedIn 1716 --any of: Devourer of Souls
    .xp <20,1
step
    +|cRXP_WARN_That is all of The Barrens for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Stormwind City|r: Heartswood, What Is Love? << Warlock
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: The Orb of Soran'ruk << Warlock
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Blueleaf Tubers
step
    +|cRXP_WARN_Suggested next zones at level 23|r: |cRXP_FRIENDLY_Wetlands|r (about 0.6 levels of quests, starting around Captain Stoutfist). Completing this step loads the guide for Wetlands --RouteBuilder:next
step << Warlock
    +|cRXP_WARN_The rest of The Barrens is planned from level 31.|r Load its guide for level 31 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock
#version 1
#group Zone Routes (Alliance)
#subgroup 11 - 35 The Barrens
#subweight -11
#name 31-32 The Barrens

step << Warlock
    .goto 1413/1,-3723.59,-785.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Strahad Farsan|r
    .accept 1795 >>Accept The Binding
    .target Strahad Farsan
    .isQuestTurnedIn 1804,1805 --any of: Tome of the Cabal, Tome of the Cabal
    .xp <30,1
step << Warlock
    .goto 1413/1,-3723.59,-785.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Strahad Farsan|r
    .accept 1758 >>Accept Tome of the Cabal
    .target Strahad Farsan
step << Warrior
    .goto 1413/1,-4330.58,-1708.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Klannoc Macleod|r
    .accept 1719 >>Accept The Affray
    .target Klannoc Macleod
    .isQuestTurnedIn 1718 --any of: The Islander
    .xp <30,1
step << Warrior
    .goto 1413/1,-4328.55,-1679.15
    >>Step on the grate to begin the Affray
    .complete 1719,2 --Step on the grate to begin the Affray
    .isOnQuest 1719
step << Warrior
    .goto 1413/1,-4329.56,-1679.15
    >>Kill |cRXP_ENEMY_Big Will|r
    .complete 1719,1 --Big Will slain (1)
    .mob Big Will
    .isOnQuest 1719
step << Warrior
    .goto 1413/1,-4330.58,-1708.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Klannoc Macleod|r
    .turnin 1719 >>Turn in The Affray
    .target Klannoc Macleod
    .isOnQuest 1719
step << Warrior
    .goto 1413/1,-4330.58,-1708.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Klannoc Macleod|r
    .accept 1791 >>Accept The Windwatcher
    .target Klannoc Macleod
    .isQuestTurnedIn 1719 --any of: The Affray
    .xp <30,1
step << Warlock
    .goto 1413/1,-3720.55,-773.13
    >>Kill |cRXP_ENEMY_Summoned Felhunter|r
    .complete 1795,1 --Summoned Felhunter slain (1)
    .mob Summoned Felhunter
    .isOnQuest 1795
step << Warlock
    .goto 1413/1,-3723.59,-785.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Strahad Farsan|r
    .turnin 1795 >>Turn in The Binding
    .target Strahad Farsan
    .isOnQuest 1795
step
    .goto 1413/1,-3796.55,-985.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wharfmaster Dizzywig|r
    .accept 1112 >>Accept Parts for Kravel
    .target Wharfmaster Dizzywig
    .isQuestTurnedIn 1111 --any of: Wharfmaster Dizzywig
    .xp <30,1
step
    .goto 1413/1,-3796.55,-985.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wharfmaster Dizzywig|r
    .accept 1040 >>Accept Passage to Booty Bay
    .target Wharfmaster Dizzywig
    .isQuestTurnedIn 1039 --any of: The Barrens Port
    .xp <25,1
step
    .goto 1413/1,-3693.19,-929.20
    >>Pick up |cRXP_PICK_Snufflenose Owner's Manual|r from the ground
    .complete 1221,3 --Snufflenose Owner's Manual (1)
    .isOnQuest 1221
step
    .goto 1413/1,-3693.19,-930.55
    >>Open the |cRXP_PICK_Crate with Holes|r. Loot it for |cRXP_LOOT_Crate With Holes|r
    .complete 1221,2 --Crate With Holes (1)
    .isOnQuest 1221
step
    .goto 1413/1,-3694.20,-927.85
    >>Open the |cRXP_PICK_Snufflenose Command Sticks|r. Loot it for |cRXP_LOOT_Snufflenose Command Stick|r
    .complete 1221,4 --Snufflenose Command Stick (1)
    .isOnQuest 1221
step
    .goto 1413/1,-3697.24,-929.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mebok Mizzyrix|r
    .turnin 1069 >>Turn in Deepmoss Spider Eggs
    .target Mebok Mizzyrix
    .isQuestComplete 1069
step
    .goto 1413/1,-3697.24,-929.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mebok Mizzyrix|r
    .turnin 1221 >>Turn in Blueleaf Tubers
    .target Mebok Mizzyrix
    .isQuestComplete 1221
step
    .goto 1413/1,-2456.92,-371.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dokimi|r
    .turnin 91901 >>Turn in A Sealed Crate
    .target Dokimi
    .isOnQuest 91901
step << Warlock
    .goto 1413/1,-2373.83,-2252.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doan Karhan|r
    .turnin 1740 >>Turn in The Orb of Soran'ruk
    .target Doan Karhan
    .isQuestComplete 1740
step
    +|cRXP_WARN_That is all of The Barrens for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Alterac Mountains|r: The Windwatcher << Warrior
    >>|cRXP_FRIENDLY_Ironforge|r: Tome of the Cabal << Warlock
    >>|cRXP_FRIENDLY_Stranglethorn Vale|r: Passage to Booty Bay
    >>|cRXP_FRIENDLY_Thousand Needles|r: Parts for Kravel
step << Warlock
    +|cRXP_WARN_The rest of The Barrens is planned from level 34.|r Load its guide for level 34 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock
#version 1
#group Zone Routes (Alliance)
#subgroup 11 - 35 The Barrens
#subweight -11
#name 34-35 The Barrens

step << Warlock
    .goto 1413/1,-3711.43,-782.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Menara Voidrender|r
    .accept 1796 >>Accept Components for the Enchanted Gold Bloodrobe
    .target Menara Voidrender
step << Warlock
    .goto 1413/1,-3711.43,-782.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Menara Voidrender|r
    .turnin 1796 >>Turn in Components for the Enchanted Gold Bloodrobe
    .target Menara Voidrender
    .isQuestComplete 1796
step << Warlock
    .goto 1413/1,-3711.43,-782.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Menara Voidrender|r
    .accept 4781 >>Accept Components for the Enchanted Gold Bloodrobe
    .target Menara Voidrender
    .isQuestTurnedIn 1796 --any of: Components for the Enchanted Gold Bloodrobe
    .xp <31,1
step
    .goto 1413/1,-3694.20,-927.85
    >>Open the |cRXP_PICK_Snufflenose Command Sticks|r. Loot it for |cRXP_LOOT_Snufflenose Command Stick|r
    .complete 1221,4 --Snufflenose Command Stick (1)
    .isOnQuest 1221
step
    .goto 1413/1,-3693.19,-930.55
    >>Open the |cRXP_PICK_Crate with Holes|r. Loot it for |cRXP_LOOT_Crate With Holes|r
    .complete 1221,2 --Crate With Holes (1)
    .isOnQuest 1221
step
    .goto 1413/1,-3693.19,-929.20
    >>Pick up |cRXP_PICK_Snufflenose Owner's Manual|r from the ground
    .complete 1221,3 --Snufflenose Owner's Manual (1)
    .isOnQuest 1221
step
    .goto 1413/1,-3697.24,-929.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mebok Mizzyrix|r
    .turnin 1221 >>Turn in Blueleaf Tubers
    .target Mebok Mizzyrix
    .isQuestComplete 1221
step
    .goto 1413/1,-3697.24,-929.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mebok Mizzyrix|r
    .turnin 1069 >>Turn in Deepmoss Spider Eggs
    .target Mebok Mizzyrix
    .isQuestComplete 1069
step
    .goto 1413/1,-2456.92,-371.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dokimi|r
    .turnin 91901 >>Turn in A Sealed Crate
    .target Dokimi
    .isOnQuest 91901
step << Warlock
    .goto 1413/1,-1965.46,-2058.85
    >>Open the |cRXP_PICK_Battered Chest|r. Loot it for |cRXP_LOOT_Gold Bar|r
    .complete 4781,1 --Gold Bar (1)
    .isOnQuest 4781
step << Warlock
    .goto 1413/1,-2373.83,-2252.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doan Karhan|r
    .turnin 1740 >>Turn in The Orb of Soran'ruk
    .target Doan Karhan
    .isQuestComplete 1740
step
    +|cRXP_WARN_End of the The Barrens route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Stranglethorn Vale|r: Components for the Enchanted Gold Bloodrobe << Warlock
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Components for the Enchanted Gold Bloodrobe << Warlock
]])
