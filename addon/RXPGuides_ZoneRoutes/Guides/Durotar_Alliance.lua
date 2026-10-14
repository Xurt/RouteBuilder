-- 9-52 Durotar: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 7 parts with a level check between them (from level 9, 12, 25, 31, 36, 41, 51).
-- Edit zones/Durotar.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#name 9-52 Durotar

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
step << Mage
    .xp 12 >>|cRXP_WARN_The rest of Durotar is planned from level 12.|r Come back to this guide then
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
step << Rogue
    .xp 25 >>|cRXP_WARN_The rest of Durotar is planned from level 25.|r Come back to this guide then
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
    .xp 31 >>|cRXP_WARN_The rest of Durotar is planned from level 31.|r Come back to this guide then
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
    .xp 36 >>|cRXP_WARN_The rest of Durotar is planned from level 36.|r Come back to this guide then
step << Mage
    .goto 1454/1,-4219.90,1468.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deino|r
    .accept 1953 >>Accept Return to the Marsh
    .target Deino
step
    +|cRXP_WARN_That is all of Durotar for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Dustwallow Marsh|r: Return to the Marsh << Mage
step
    .xp 41 >>|cRXP_WARN_The rest of Durotar is planned from level 41.|r Come back to this guide then
step
    .goto 1454/1,-4219.90,1468.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deino|r
    .accept 2861 >>Accept Tabetha's Task
    .target Deino
step
    +|cRXP_WARN_That is all of Durotar for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Dustwallow Marsh|r: Tabetha's Task
step << Hunter/Rogue/Mage/Priest/Warrior/Warlock
    .xp 51 >>|cRXP_WARN_The rest of Durotar is planned from level 51.|r Come back to this guide then
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
    +|cRXP_WARN_That is all of Durotar for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Alterac Mountains|r: A Simple Request << Rogue
    >>|cRXP_FRIENDLY_Azshara|r: The Hunter's Charm << Hunter
    >>|cRXP_FRIENDLY_Azshara|r: Magecraft << Mage
    >>|cRXP_FRIENDLY_Azshara|r: Cenarion Aid << Priest
    >>|cRXP_FRIENDLY_Felwood|r: An Imp's Request << Warlock
    >>|cRXP_FRIENDLY_Swamp of Sorrows|r: A Troubled Spirit << Warrior
step
    +|cRXP_WARN_End of the Durotar route.|r
]])
