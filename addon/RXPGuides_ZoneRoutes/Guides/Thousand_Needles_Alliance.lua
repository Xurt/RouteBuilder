-- 30-37 Thousand Needles: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 2 parts (from level 30, 33).
-- Split into 2 guides, listed under "30 - 34 Thousand Needles" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Thousand Needles.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 30 - 34 Thousand Needles
#subweight -30
#name 30-31 Thousand Needles: around Kravel Koalbeard

step
    .goto 1441/1,-3856.09,-6233.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kravel Koalbeard|r
    .accept 1110 >>Accept Rocket Car Parts
    .target Kravel Koalbeard
step
    .goto 1441/1,-3867.97,-6229.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fizzle Brassbolts|r
    .accept 1104 >>Accept Salt Flat Venom
    .target Fizzle Brassbolts
step
    .goto 1441/1,-3871.49,-6228.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wizzle Brassbolts|r
    .turnin 2769 >>Turn in The Brassbolts Brothers
    .target Wizzle Brassbolts
    .isOnQuest 2769
step
    .goto 1441/1,-3871.49,-6228.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wizzle Brassbolts|r
    .turnin 1179 >>Turn in The Brassbolts Brothers
    .target Wizzle Brassbolts
    .isOnQuest 1179
step
    .goto 1441/1,-3871.49,-6228.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wizzle Brassbolts|r
    .accept 1105 >>Accept Hardened Shells
    .target Wizzle Brassbolts
step << Mage
    .goto 1441/1,-3878.09,-6187.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magus Tirth|r
    .turnin 1949 >>Turn in Hidden Secrets
    .target Magus Tirth
    .isOnQuest 1949
step
    .goto 1441/1,-3961.25,-6192.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pozzik|r
    .accept 1176 >>Accept Load Lightening
    .target Pozzik
step
    #completewith Along9
    >>As you go: Loot the |cRXP_PICK_Rocket Car Rubbles|r for |cRXP_LOOT_Rocket Car Parts|r. |cRXP_WARN_Anything left is finished later|r
    .complete 1110,1 --Rocket Car Parts (30)
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
    #label Along9
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
    #loop
    .goto 1441/1,-3618.93,-6333.87,0
    .goto 1441/1,-3618.93,-6333.87,40,0
    .goto 1441/1,-3860.93,-6474.67,40,0
    .goto 1441/1,-3926.93,-6474.67,40,0
    .goto 1441/1,-3843.33,-6618.40,40,0
    >>Loot the |cRXP_PICK_Rocket Car Rubbles|r for |cRXP_LOOT_Rocket Car Parts|r
    .complete 1110,1 --Rocket Car Parts (30)
step
    .goto 1441/1,-3961.25,-6192.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pozzik|r
    .turnin 1176 >>Turn in Load Lightening
    .accept 1178 >>Accept Goblin Sponsorship
    .target Pozzik
step
    .goto 1441/1,-3867.97,-6229.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fizzle Brassbolts|r
    .turnin 1104 >>Turn in Salt Flat Venom
    .target Fizzle Brassbolts
step
    .goto 1441/1,-3871.49,-6228.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wizzle Brassbolts|r
    .turnin 1105 >>Turn in Hardened Shells
    .target Wizzle Brassbolts
step
    .goto 1441/1,-3856.09,-6233.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kravel Koalbeard|r
    .turnin 1110 >>Turn in Rocket Car Parts
    .accept 1111 >>Accept Wharfmaster Dizzywig
    .accept 5762 >>Accept Hemet Nesingwary
    .target Kravel Koalbeard
step
    .goto 1441/1,-3856.09,-6233.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kravel Koalbeard|r
    .turnin 1112 >>Turn in Parts for Kravel
    .target Kravel Koalbeard
    .isOnQuest 1112
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
    .turnin 1183 >>Turn in Goblin Sponsorship
    .target Pozzik
    .isOnQuest 1183
step
    .goto 1441/1,-3961.25,-6192.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pozzik|r
    .accept 1186 >>Accept The Eighteenth Pilot
    .target Pozzik
    .isQuestTurnedIn 1183 --any of: Goblin Sponsorship
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
step
    .goto 1441/1,-3867.97,-6229.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fizzle Brassbolts|r
    .accept 1106 >>Accept Martek the Exiled
    .target Fizzle Brassbolts
step
    .goto 1441/1,-3871.49,-6228.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wizzle Brassbolts|r
    .accept 1107 >>Accept Encrusted Tail Fins
    .target Wizzle Brassbolts
step
    .goto 1441/1,-3871.49,-6228.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wizzle Brassbolts|r
    .turnin 1107 >>Turn in Encrusted Tail Fins
    .target Wizzle Brassbolts
    .isQuestComplete 1107
step << Mage
    .goto 1441/1,-3878.09,-6187.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magus Tirth|r
    .turnin 1950 >>Turn in Get the Scoop
    .target Magus Tirth
    .isOnQuest 1950
step << Mage
    .goto 1441/1,-3878.09,-6187.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magus Tirth|r
    .accept 1951 >>Accept Rituals of Power
    .target Magus Tirth
    .isQuestTurnedIn 1950 --any of: Get the Scoop
    .xp <30,1
step << Shaman
    .goto 1441/1,-2463.49,-5483.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rau Cliffrunner|r
    .turnin 79358 >>Turn in Storm, Earth, and Fire
    .target Rau Cliffrunner
    .isQuestComplete 79358
step
    .goto 1441/1,-2208.29,-4846.08
    >>Kill |cRXP_ENEMY_Achellios the Banished|r and loot |cRXP_LOOT_Pendant of Myzrael|r. Use it to start the quest
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
    .mob Achellios the Banished
step
    .goto 1441/1,-3856.09,-6233.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kravel Koalbeard|r
    .turnin 1117 >>Turn in Rumors for Kravel
    .target Kravel Koalbeard
    .isOnQuest 1117
step
    .goto 1441/1,-3967.85,-6198.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Razzeric|r
    .accept 1188 >>Accept Safety First
    .target Razzeric
    .isQuestTurnedIn 1187 --any of: Razzeric's Tweaking
    .xp <29,1
step
    .goto 1441/1,-3867.97,-6229.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fizzle Brassbolts|r
    .turnin 1137 >>Turn in News for Fizzle
    .target Fizzle Brassbolts
    .isOnQuest 1137
step
    .goto 1441/1,-3856.09,-6233.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kravel Koalbeard|r
    .turnin 1119 >>Turn in Zanzil's Mixture and a Fool's Stout
    .target Kravel Koalbeard
    .isOnQuest 1119
step
    .goto 1441/1,-3967.85,-6198.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Razzeric|r
    .turnin 1189 >>Turn in Safety First
    .target Razzeric
    .isOnQuest 1189
step
    .goto 1441/1,-3961.25,-6192.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pozzik|r
    .accept 1190 >>Accept Keeping Pace
    .target Pozzik
    .isQuestTurnedIn 1137 --any of: News for Fizzle
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
    >>|cRXP_FRIENDLY_Arathi Highlands|r: Crystal in the Mountains
    >>|cRXP_FRIENDLY_Badlands|r: Martek the Exiled
    >>|cRXP_FRIENDLY_Dustwallow Marsh|r: Rituals of Power << Mage
    >>|cRXP_FRIENDLY_Stranglethorn Vale|r: Hemet Nesingwary, The Rumormonger
    >>|cRXP_FRIENDLY_Tanaris|r: Safety First
    >>|cRXP_FRIENDLY_The Barrens|r: Wharfmaster Dizzywig, Goblin Sponsorship
    >>|cRXP_FRIENDLY_Stranglethorn Vale and back here|r: Encrusted Tail Fins
step
    +|cRXP_WARN_The rest of Thousand Needles is planned from level 33.|r Load its guide for level 33 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 30 - 34 Thousand Needles
#subweight -30
#name 33-34 Thousand Needles

step
    .goto 1441/1,-1946.93,-5142.93
    >>Click the |cRXP_PICK_Scrolls|r
    .accept 79947 >>Accept Geomancy: The Stone-Cold Truth
step
    .goto 1441/1,-1951.33,-5142.93
    >>Open the |cRXP_PICK_Scrolls|r. Loot it for |cRXP_LOOT_Geomancy: The Stone-Cold Truth|r
    .complete 79947,1 --Geomancy: The Stone-Cold Truth (1)
step
    .goto 1441/1,-4025.05,-6253.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trackmaster Zherin|r
    .accept 1175 >>Accept A Bump in the Road
    .target Trackmaster Zherin
step
    #loop
    .goto 1441/1,-3837.61,-5714.35,0
    .goto 1441/1,-3837.61,-5714.35,40,0
    .goto 1441/1,-3754.89,-5649.52,40,0
    >>Kill |cRXP_ENEMY_Saltstone Basilisks|r
    .complete 1175,1 --Saltstone Basilisk slain (10)
    .mob Saltstone Basilisk
step
    #loop
    .goto 1441/1,-3941.45,-6553.57,0
    .goto 1441/1,-3941.45,-6553.57,40,0
    .goto 1441/1,-3841.57,-6596.11,40,0
    >>Kill |cRXP_ENEMY_Saltstone Crystalhides|r
    >>Kill |cRXP_ENEMY_Saltstone Gazers|r
    .complete 1175,2 --Saltstone Crystalhide slain (10)
    .complete 1175,3 --Saltstone Gazer slain (6)
    .mob Saltstone Crystalhide
    .mob Saltstone Gazer
step
    .goto 1441/1,-4025.05,-6253.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trackmaster Zherin|r
    .turnin 1175 >>Turn in A Bump in the Road
    .target Trackmaster Zherin
step
    .goto 1441/1,-3871.49,-6228.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wizzle Brassbolts|r
    .turnin 1107 >>Turn in Encrusted Tail Fins
    .target Wizzle Brassbolts
    .isQuestComplete 1107
step
    +|cRXP_WARN_End of the Thousand Needles route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Undercity|r: Geomancy: The Stone-Cold Truth
]])
