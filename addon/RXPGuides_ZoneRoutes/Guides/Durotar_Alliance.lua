-- 9-52 Durotar: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 8 parts (from level 9, 12, 17, 25, 31, 36, 41, 51).
-- Split into 8 guides, listed under "9 - 52 Durotar" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Durotar.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 9 - 52 Durotar
#subweight -9
#name 9-10 Durotar
--RouteBuilder:next
#next Zone Routes (Alliance)\9-11 Zephras Isle: around Quel'ana Quickgale;Zone Routes (Alliance)\9-12 Teldrassil: around Priestess A'moora;Zone Routes (Alliance)\10-12 Westfall: around Farmer Saldean

step
    .goto 1411/1,-4414.31,999.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rezlak|r
    .accept 834 >>Accept Winds in the Desert
    .target Rezlak
step
    #loop
    .goto 1411/1,-4558.66,1012.04,0
    .goto 1411/1,-4558.66,1012.04,40,0
    .goto 1411/1,-4590.92,1036.71,40,0
    .goto 1411/1,-4651.19,894.65,40,0
    .goto 1411/1,-4695.61,829.44,40,0
    .goto 1411/1,-4634.27,845.30,40,0
    .goto 1411/1,-4598.85,860.81,40,0
    .goto 1411/1,-4611.01,900.65,40,0
    .goto 1411/1,-4611.54,944.36,40,0
    .goto 1411/1,-4590.39,950.00,40,0
    >>Loot the |cRXP_PICK_Stolen Supply Sacks|r for |cRXP_LOOT_Sack of Supplies|r
    .complete 834,1 --Sack of Supplies (5)
step
    .goto 1411/1,-4414.31,999.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rezlak|r
    .turnin 834 >>Turn in Winds in the Desert
    .accept 835 >>Accept Securing the Lines
    .target Rezlak
step
    #loop
    .goto 1411/1,-4670.76,988.77,0
    .goto 1411/1,-4670.76,988.77,40,0
    .goto 1411/1,-4688.73,1045.17,40,0
    .goto 1411/1,-4689.26,1137.53,40,0
    .goto 1411/1,-4713.06,1100.87,40,0
    .goto 1411/1,-4751.66,1055.75,40,0
    .goto 1411/1,-4823.57,1020.50,40,0
    .goto 1411/1,-4810.88,925.67,40,0
    .goto 1411/1,-4821.45,844.95,40,0
    .goto 1411/1,-4765.40,967.27,40,0
    >>Kill |cRXP_ENEMY_Dustwind Storm Witches|r
    >>Kill |cRXP_ENEMY_Dustwind Savages|r
    .complete 835,2 --Dustwind Storm Witch slain (8)
    .complete 835,1 --Dustwind Savage slain (12)
    .mob Dustwind Storm Witch
    .mob Dustwind Savage
step
    .goto 1411/1,-4414.31,999.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rezlak|r
    .turnin 835 >>Turn in Securing the Lines
    .target Rezlak
step << Shaman
    .goto 1411/1,-4290.59,-877.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Minor Manifestation of Earth|r
    .turnin 94374 >>Turn in Call of Earth
    .target Minor Manifestation of Earth
    .isOnQuest 94374
step << Shaman
    .goto 1411/1,-4290.59,-877.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Minor Manifestation of Earth|r
    .accept 94375 >>Accept Call of Earth
    .target Minor Manifestation of Earth
    .isQuestTurnedIn 94374 --any of: Call of Earth
    .xp <4,1
step << Shaman
    .goto 1411/1,-4009.82,-246.39
    >>Kill |cRXP_ENEMY_Minor Manifestation of Fire|r and loot |cRXP_LOOT_Glowing Ember|r
    .complete 94467,1 --Glowing Ember (1)
    .mob Minor Manifestation of Fire
    .isOnQuest 94467
step << Shaman
    .goto 1411/1,-4022.51,-243.92
    >>Click the |cRXP_PICK_Brazier of the Dormant Flame|r
    .turnin 94467 >>Turn in Call of Fire
    .isOnQuest 94467
step << !Mage
    .zoneskip Searing Gorge
    .hs >> Hearthstone to Stormwind
    .cooldown item,6948,>0,1
step
    +|cRXP_WARN_That is all of Durotar for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Dun Morogh|r: Call of Earth << Shaman
step
    +|cRXP_WARN_Suggested next zones at level 9|r: |cRXP_FRIENDLY_Zephras Isle|r (about 3.5 levels of quests, starting around Quel'ana Quickgale), |cRXP_FRIENDLY_Teldrassil|r (about 2.2 levels of quests, starting around Priestess A'moora), |cRXP_FRIENDLY_Westfall|r (about 2.0 levels of quests, starting around Farmer Saldean). Completing this step loads the guide for Zephras Isle --RouteBuilder:next
step << Mage
    +|cRXP_WARN_The rest of Durotar is planned from level 12.|r Load its guide for level 12 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Mage
#version 1
#group Zone Routes (Alliance)
#subgroup 9 - 52 Durotar
#subweight -9
#name 12-13 Durotar
--RouteBuilder:next
#next Zone Routes (Alliance)\10-15 Darkshore: around Thundris Windweaver;Zone Routes (Alliance)\9-12 Teldrassil: around Priestess A'moora;Zone Routes (Alliance)\11-15 Zephras Isle: around Elegael Thornpaw

step << Mage
    .goto 1454/1,-4229.86,1466.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Uthel'nay|r
    .accept 1883 >>Accept Speak with Un'thuwa
    .target Uthel'nay
step << Mage
    #completewith next
    .zone 1411 >>Leave Orgrimmar for Durotar
    .zoneskip 1411
step << Mage
    .goto 1411/1,-4939.89,-839.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Un'Thuwa|r
    .turnin 1883 >>Turn in Speak with Un'thuwa
    .target Un'Thuwa
step << Shaman
    .goto 1411/1,-4022.51,-243.92
    >>Click the |cRXP_PICK_Brazier of the Dormant Flame|r
    .accept 94468 >>Accept Call of Fire
    .isQuestTurnedIn 94467 --any of: Call of Fire
    .xp <10,1
step
    +|cRXP_WARN_That is all of Durotar for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Dun Morogh|r: Call of Fire << Shaman
step
    +|cRXP_WARN_Suggested next zones at level 12|r: |cRXP_FRIENDLY_Darkshore|r (about 2.9 levels of quests, starting around Thundris Windweaver), |cRXP_FRIENDLY_Teldrassil|r (about 1.5 levels of quests, starting around Priestess A'moora), |cRXP_FRIENDLY_Zephras Isle|r (about 1.4 levels of quests, starting around Elegael Thornpaw). Completing this step loads the guide for Darkshore --RouteBuilder:next
step
    +|cRXP_WARN_The rest of Durotar is planned from level 17.|r Load its guide for level 17 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 9 - 52 Durotar
#subweight -9
#name 17-18 Durotar
--RouteBuilder:next
#next Zone Routes (Alliance)\17-19 Darkshore: around Archaeologist Hollee;Zone Routes (Alliance)\11-15 Zephras Isle: around Elegael Thornpaw;Zone Routes (Alliance)\14-16 Loch Modan: around Daryl the Youngling

step
    .goto 1454/1,-4223.41,1540.51
    >>Click the |cRXP_PICK_Mural of Ta'zo|r
    .accept 79094 >>Accept The Lessons of Ta'zo
step
    .goto 1454/1,-4223.41,1540.51
    >>Open the |cRXP_PICK_Mural of Ta'zo|r. Loot it for |cRXP_LOOT_The Lessons of Ta'zo|r
    .complete 79094,1 --The Lessons of Ta'zo (1)
step
    +|cRXP_WARN_That is all of Durotar for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Undercity|r: The Lessons of Ta'zo
step
    +|cRXP_WARN_Suggested next zones at level 17|r: |cRXP_FRIENDLY_Darkshore|r (about 1.1 levels of quests, starting around Archaeologist Hollee), |cRXP_FRIENDLY_Zephras Isle|r (about 0.7 levels of quests, starting around Elegael Thornpaw), |cRXP_FRIENDLY_Loch Modan|r (about 0.5 levels of quests, starting around Daryl the Youngling). Completing this step loads the guide for Darkshore --RouteBuilder:next
step << Rogue
    +|cRXP_WARN_The rest of Durotar is planned from level 25.|r Load its guide for level 25 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue
#version 1
#group Zone Routes (Alliance)
#subgroup 9 - 52 Durotar
#subweight -9
#name 25-26 Durotar

step << Rogue
    .goto 1454/1,-4284.42,1771.18
    >>Kill |cRXP_ENEMY_Gest|r and loot |cRXP_LOOT_Elegant Letter|r. Use it to start the quest
    .collect 17126,1,6681 --Elegant Letter (1)
    .accept 6681 >>Accept The Manor, Ravenholdt
    .use 17126
    .mob Gest
step
    +|cRXP_WARN_That is all of Durotar for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Alterac Mountains|r: The Manor, Ravenholdt << Rogue
step << Warrior/Mage
    +|cRXP_WARN_The rest of Durotar is planned from level 31.|r Load its guide for level 31 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Warrior/Mage
#version 1
#group Zone Routes (Alliance)
#subgroup 9 - 52 Durotar
#subweight -9
#name 31-32 Durotar

step << Warrior
    .goto 1454/1,-4808.15,1970.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sorek|r
    .accept 1718 >>Accept The Islander
    .target Sorek
step << Mage
    .goto 1454/1,-4219.90,1468.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deino|r
    .accept 1947 >>Accept Journey to the Marsh
    .target Deino
step
    +|cRXP_WARN_That is all of Durotar for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Dustwallow Marsh|r: Journey to the Marsh << Mage
    >>|cRXP_FRIENDLY_The Barrens|r: The Islander << Warrior
step << Mage
    +|cRXP_WARN_The rest of Durotar is planned from level 36.|r Load its guide for level 36 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Mage
#version 1
#group Zone Routes (Alliance)
#subgroup 9 - 52 Durotar
#subweight -9
#name 36-37 Durotar

step << Mage
    .goto 1454/1,-4219.90,1468.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deino|r
    .accept 1953 >>Accept Return to the Marsh
    .target Deino
step
    +|cRXP_WARN_That is all of Durotar for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Dustwallow Marsh|r: Return to the Marsh << Mage
step
    +|cRXP_WARN_The rest of Durotar is planned from level 41.|r Load its guide for level 41 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 9 - 52 Durotar
#subweight -9
#name 41-42 Durotar

step
    .goto 1454/1,-4219.90,1468.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deino|r
    .accept 2861 >>Accept Tabetha's Task
    .target Deino
step
    +|cRXP_WARN_That is all of Durotar for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Dustwallow Marsh|r: Tabetha's Task
step << Hunter/Rogue/Mage/Priest/Warrior/Warlock
    +|cRXP_WARN_The rest of Durotar is planned from level 51.|r Load its guide for level 51 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter/Rogue/Mage/Priest/Warrior/Warlock
#version 1
#group Zone Routes (Alliance)
#subgroup 9 - 52 Durotar
#subweight -9
#name 51-52 Durotar

step << Warrior
    .goto 1454/1,-4808.15,1970.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sorek|r
    .accept 8417 >>Accept A Troubled Spirit
    .target Sorek
step << Rogue
    .goto 1454/1,-4296.34,1762.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ormok|r
    .accept 8233 >>Accept A Simple Request
    .target Ormok
step << Priest
    .goto 1454/1,-4179.79,1452.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ur'kyo|r
    .accept 8254 >>Accept Cenarion Aid
    .target Ur'kyo
step << Hunter
    .goto 1454/1,-4607.02,2100.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ormak Grimshot|r
    .accept 8151 >>Accept The Hunter's Charm
    .target Ormak Grimshot
step << Mage
    .goto 1454/1,-4229.86,1466.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Uthel'nay|r
    .accept 8250 >>Accept Magecraft
    .target Uthel'nay
step << Warlock
    .goto 1454/1,-4360.44,1848.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zevrost|r
    .accept 8419 >>Accept An Imp's Request
    .target Zevrost
step
    +|cRXP_WARN_End of the Durotar route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Alterac Mountains|r: A Simple Request << Rogue
    >>|cRXP_FRIENDLY_Azshara|r: The Hunter's Charm << Hunter
    >>|cRXP_FRIENDLY_Azshara|r: Magecraft << Mage
    >>|cRXP_FRIENDLY_Azshara|r: Cenarion Aid << Priest
    >>|cRXP_FRIENDLY_Felwood|r: An Imp's Request << Warlock
    >>|cRXP_FRIENDLY_Swamp of Sorrows|r: A Troubled Spirit << Warrior
]])
