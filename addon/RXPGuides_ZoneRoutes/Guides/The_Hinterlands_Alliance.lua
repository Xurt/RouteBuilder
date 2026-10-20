-- 45-48 The Hinterlands: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- Edit zones/The Hinterlands.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#name 45-48 The Hinterlands

step
    .goto 1425/0,-2961.00,-401.87
    >>Click the |cRXP_PICK_Book|r
    .accept 81954 >>Accept Venomous Journeys
step
    .goto 1425/0,-2961.00,-401.87
    >>Open the |cRXP_PICK_Book|r. Loot it for |cRXP_LOOT_Venomous Journeys|r
    .complete 81954,1 --Venomous Journeys (1)
step
    .goto 1425/0,-2029.69,266.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Falstad Wildhammer|r
    .turnin 1449 >>Turn in To The Hinterlands
    .target Falstad Wildhammer
    .isOnQuest 1449
step
    .goto 1425/0,-2029.69,266.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Falstad Wildhammer|r
    .accept 1450 >>Accept Gryphon Master Talonaxe
    .target Falstad Wildhammer
    .isQuestTurnedIn 1449 --any of: To The Hinterlands
    .xp <38,1
step
    .goto 1425/0,-2001.23,282.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Guthrum Thunderfist|r
    .fp Hinterlands >> Get The Hinterlands Flight Path
    .target Guthrum Thunderfist
step
    .goto 1425/0,-1950.38,325.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryphon Master Talonaxe|r
    .turnin 2993 >>Turn in Return to the Hinterlands
    .target Gryphon Master Talonaxe
    .isOnQuest 2993
step
    .goto 1425/0,-1950.38,325.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryphon Master Talonaxe|r
    .turnin 1450 >>Turn in Gryphon Master Talonaxe
    .target Gryphon Master Talonaxe
    .isOnQuest 1450
step
    .goto 1425/0,-1950.38,325.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryphon Master Talonaxe|r
    .accept 1451 >>Accept Rhapsody Shindigger
    .target Gryphon Master Talonaxe
    .isQuestTurnedIn 1450 --any of: Gryphon Master Talonaxe
    .xp <38,1
step
    .goto 1425/0,-2612.19,219.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rhapsody Shindigger|r
    .turnin 1451 >>Turn in Rhapsody Shindigger
    .target Rhapsody Shindigger
    .isOnQuest 1451
step
    .goto 1425/0,-2612.19,219.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rhapsody Shindigger|r
    .accept 1452 >>Accept Rhapsody's Kalimdor Kocktail
    .target Rhapsody Shindigger
    .isQuestTurnedIn 1451 --any of: Rhapsody Shindigger
    .xp <38,1
step
    .goto 1425/0,-1950.38,325.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryphon Master Talonaxe|r
    .accept 2988 >>Accept Witherbark Cages
    .target Gryphon Master Talonaxe
step
    .goto 1425/0,-2120.16,347.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Agnar Beastamer|r
    .turnin 3843 >>Turn in The Newest Member of the Family
    .target Agnar Beastamer
    .isOnQuest 3843
step
    .goto 1425/0,-2120.16,347.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Agnar Beastamer|r
    .accept 4297 >>Accept Food for Baby
    .target Agnar Beastamer
    .isQuestTurnedIn 3843 --any of: The Newest Member of the Family
    .xp <38,1
step
    .goto 1425/0,-2145.96,322.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fraggar Thundermantle|r
    .accept 2880 >>Accept Troll Necklace Bounty
    .target Fraggar Thundermantle
step
    .goto 1425/0,-2612.19,219.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rhapsody Shindigger|r
    .accept 1469 >>Accept Rhapsody's Tale
    .target Rhapsody Shindigger
    .isQuestTurnedIn 1452 --any of: Rhapsody's Kalimdor Kocktail
    .xp <38,1
step
    .goto 1425/0,-2612.19,219.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rhapsody Shindigger|r
    .turnin 1452 >>Turn in Rhapsody's Kalimdor Kocktail
    .target Rhapsody Shindigger
    .isQuestComplete 1452
step
    #completewith Drop485x1
    >>|cRXP_LOOT_OOX-09/HL Distress Beacon|r can drop from |cRXP_ENEMY_Saltwater Snapjaw|r, |cRXP_ENEMY_Vilebranch Axe Thrower|r, |cRXP_ENEMY_Vilebranch Witch Doctor|r. Use it to start the quest if you get one
    .collect 8704,1,485 --OOX-09/HL Distress Beacon (1)
    .accept 485 >>Accept Find OOX-09/HL!
    .use 8704
step
    #label Drop485x1
    #loop
    .goto 1425/0,-2806.62,-32.78,0
    .goto 1425/0,-2806.62,-32.78,40,0
    .goto 1425/0,-2718.45,-81.55,40,0
    >>Click the |cRXP_PICK_Third Witherbark Cage|r
    >>Kill |cRXP_ENEMY_Vilebranch Axe Throwers|r, |cRXP_ENEMY_Vilebranch Witch Doctors|r, |cRXP_ENEMY_Vilebranch Headhunters|r and |cRXP_ENEMY_Vilebranch Shadowcasters|r. Loot them for |cRXP_LOOT_Troll Tribal Necklace|r
    .complete 2988,3 --Check Third Cage
    .complete 2880,1 --Troll Tribal Necklace (5)
    .mob Vilebranch Axe Thrower
    .mob Vilebranch Witch Doctor
    .mob Vilebranch Headhunter
    .mob Vilebranch Shadowcaster
step
    .goto 1425/0,-2471.28,-42.79
    >>Click the |cRXP_PICK_First Witherbark Cage|r
    >>Click the |cRXP_PICK_Second Witherbark Cage|r
    .complete 2988,1 --Check First Cage
    .complete 2988,2 --Check Second Cage
step
    .goto 1425/0,-2145.96,322.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fraggar Thundermantle|r
    .turnin 2880 >>Turn in Troll Necklace Bounty
    .accept 2877 >>Accept Skulk Rock Clean-up
    .target Fraggar Thundermantle
step
    .goto 1425/0,-1950.38,325.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryphon Master Talonaxe|r
    .turnin 2988 >>Turn in Witherbark Cages
    .accept 2989 >>Accept The Altar of Zul
    .target Gryphon Master Talonaxe
step
    .goto 1425/0,-3460.73,-295.61
    >>Search the Altar of Zul
    .complete 2989,1 --Search the Altar of Zul
step
    #completewith Drop485x2
    >>|cRXP_LOOT_OOX-09/HL Distress Beacon|r can drop from |cRXP_ENEMY_Saltwater Snapjaw|r, |cRXP_ENEMY_Vilebranch Axe Thrower|r, |cRXP_ENEMY_Vilebranch Witch Doctor|r. Use it to start the quest if you get one
    .collect 8704,1,485 --OOX-09/HL Distress Beacon (1)
    .accept 485 >>Accept Find OOX-09/HL!
    .use 8704
step
    #loop
    .goto 1425/0,-3893.09,48.07,0
    .goto 1425/0,-3893.09,48.07,40,0
    .goto 1425/0,-4039.00,53.20,40,0
    .goto 1425/0,-3863.83,209.26,40,0
    >>Kill |cRXP_ENEMY_Silvermane Stalkers|r. Loot them for |cRXP_LOOT_Silvermane Stalker Flank|r
    .complete 4297,1 --Silvermane Stalker Flank (5)
    .mob Silvermane Stalker
    .isOnQuest 4297
step
    #label Drop485x2
    #loop
    .goto 1425/0,-3751.02,352.22,0
    .goto 1425/0,-3751.02,352.22,40,0
    .goto 1425/0,-3821.48,399.70,40,0
    >>Kill |cRXP_ENEMY_Green Sludges|r
    >>Kill |cRXP_ENEMY_Jade Oozes|r
    .complete 2877,1 --Green Sludge slain (10)
    .complete 2877,2 --Jade Ooze slain (10)
    .mob Green Sludge
    .mob Jade Ooze
step
    .goto 1425/0,-3474.98,500.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Homing Robot OOX-09/HL|r
    .turnin 485 >>Turn in Find OOX-09/HL!
    .target Homing Robot OOX-09/HL
    .isOnQuest 485
step
    .goto 1425/0,-2145.96,322.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fraggar Thundermantle|r
    .turnin 2877 >>Turn in Skulk Rock Clean-up
    .target Fraggar Thundermantle
step
    .goto 1425/0,-2120.16,347.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Agnar Beastamer|r
    .turnin 4297 >>Turn in Food for Baby
    .target Agnar Beastamer
    .isOnQuest 4297
step
    .goto 1425/0,-2120.16,347.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Agnar Beastamer|r
    .accept 4298 >>Accept Becoming a Parent
    .target Agnar Beastamer
    .isQuestTurnedIn 4297 --any of: Food for Baby
    .xp <37,1
step
    .goto 1425/0,-2120.16,347.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Agnar Beastamer|r
    .turnin 4298 >>Turn in Becoming a Parent
    .target Agnar Beastamer
    .isOnQuest 4298
step
    .goto 1425/0,-1950.38,325.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryphon Master Talonaxe|r
    .turnin 2989 >>Turn in The Altar of Zul
    .accept 2990 >>Accept Thadius Grimshade
    .target Gryphon Master Talonaxe
step
    .goto 1425/0,-3474.98,500.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Homing Robot OOX-09/HL|r
    .accept 836 >>Accept Rescue OOX-09/HL!
    .target Homing Robot OOX-09/HL
    .isQuestTurnedIn 485 --any of: Find OOX-09/HL!
    .xp <43,1
step
    .goto 1425/0,-4621.89,-108.24
    >>Escort OOX-09/HL to the shoreline beyond Overlook Cliff
    .complete 836,1 --Escort OOX-09/HL to the shoreline beyond Overlook Cliff
    .isOnQuest 836
step
    .goto 1425/0,-4685.42,264.95
    >>Click the |cRXP_PICK_Cortello's Treasure|r
    .turnin 626 >>Turn in Cortello's Riddle
    .isOnQuest 626
step
    +|cRXP_WARN_End of the The Hinterlands route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Blasted Lands|r: Thadius Grimshade
    >>|cRXP_FRIENDLY_Stormwind City|r: Rhapsody's Tale
    >>|cRXP_FRIENDLY_Stranglethorn Vale|r: Rescue OOX-09/HL!
    >>|cRXP_FRIENDLY_Undercity|r: Venomous Journeys
]])
