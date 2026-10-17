-- 46-47 Azshara: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- Edit zones/Azshara.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#name 46-47 Azshara

step
    .goto 1447/1,-4326.75,3245.29
    >>Click the |cRXP_PICK_Book|r
    .accept 81952 >>Accept Everyday Etiquette
step
    .goto 1447/1,-4326.75,3245.29
    >>Open the |cRXP_PICK_Book|r. Loot it for |cRXP_LOOT_Everyday Etiquette|r
    .complete 81952,1 --Everyday Etiquette (1)
step
    .goto 1447/1,-3880.51,2718.83
    .fp Azshara>> Get the Azshara flight path
step
    .goto 1447/1,-3853.64,2698.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loh'atu|r
    .accept 5535 >>Accept Spiritual Unrest
    .accept 5536 >>Accept A Land Filled with Hatred
    .target Loh'atu
step
    #loop
    .goto 1447/1,-4251.70,3222.64,0
    .goto 1447/1,-4251.70,3222.64,40,0
    .goto 1447/1,-4311.53,3188.15,40,0
    .goto 1447/1,-4304.94,3237.51,40,0
    .goto 1447/1,-4341.45,3252.39,40,0
    .goto 1447/1,-4357.17,3298.04,40,0
    .goto 1447/1,-4336.89,3317.31,40,0
    .goto 1447/1,-4321.17,3287.56,40,0
    .goto 1447/1,-4285.67,3282.15,40,0
    .goto 1447/1,-4279.08,3239.88,40,0
    >>Kill |cRXP_ENEMY_Haldarr Satyrs|r
    >>Kill |cRXP_ENEMY_Haldarr Tricksters|r
    >>Kill |cRXP_ENEMY_Haldarr Felsworns|r
    .complete 5536,1 --Haldarr Satyr slain (6)
    .complete 5536,2 --Haldarr Trickster slain (2)
    .complete 5536,3 --Haldarr Felsworn slain (2)
    .mob Haldarr Satyr
    .mob Haldarr Trickster
    .mob Haldarr Felsworn
step
    #loop
    .goto 1447/1,-4145.21,3114.78,0
    .goto 1447/1,-4145.21,3114.78,40,0
    .goto 1447/1,-4176.65,3082.32,40,0
    .goto 1447/1,-4153.32,3023.82,40,0
    .goto 1447/1,-4184.26,3013.68,40,0
    .goto 1447/1,-4182.23,2976.14,40,0
    .goto 1447/1,-4152.82,2950.78,40,0
    .goto 1447/1,-4120.87,2918.66,40,0
    .goto 1447/1,-4117.32,2995.08,40,0
    .goto 1447/1,-4113.77,3051.55,40,0
    >>Kill |cRXP_ENEMY_Highborne Apparitions|r
    >>Kill |cRXP_ENEMY_Highborne Lichlings|r
    .complete 5535,1 --Highborne Apparition slain (6)
    .complete 5535,2 --Highborne Lichling slain (6)
    .mob Highborne Apparition
    .mob Highborne Lichling
step
    .goto 1447/1,-3853.64,2698.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loh'atu|r
    .turnin 5535 >>Turn in Spiritual Unrest
    .turnin 5536 >>Turn in A Land Filled with Hatred
    .target Loh'atu
step << Rogue
    #loop
    .goto 1447/1,-5486.45,4412.84,0
    .goto 1447/1,-5486.45,4412.84,40,0
    .goto 1447/1,-5573.66,4424.33,40,0
    .goto 1447/1,-5586.34,4483.17,40,0
    .goto 1447/1,-5587.35,4555.19,40,0
    .goto 1447/1,-5619.30,4618.08,40,0
    .goto 1447/1,-5574.17,4623.83,40,0
    .goto 1447/1,-5512.31,4646.82,40,0
    .goto 1447/1,-5547.80,4580.55,40,0
    .goto 1447/1,-5513.83,4481.14,40,0
    >>Kill |cRXP_ENEMY_Timbermaw Shaman|r and loot |cRXP_LOOT_Sealed Azure Bag|r
    .complete 8234,1 --Sealed Azure Bag (1)
    .mob Timbermaw Shaman
    .isOnQuest 8234
step << Rogue
    .goto 1447/1,-4760.30,3982.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Xylem|r
    .turnin 8234 >>Turn in Sealed Azure Bag
    .target Archmage Xylem
    .isOnQuest 8234
step << Priest
    .goto 1447/1,-5427.12,3900.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ogtinc|r
    .turnin 8254 >>Turn in Cenarion Aid
    .target Ogtinc
    .isOnQuest 8254
step << Hunter
    .goto 1447/1,-5427.12,3900.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ogtinc|r
    .turnin 8151 >>Turn in The Hunter's Charm
    .target Ogtinc
    .isOnQuest 8151
step << Mage
    .goto 1447/1,-4702.49,3648.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sanath Lim-yo|r
    .turnin 8250 >>Turn in Magecraft
    .target Sanath Lim-yo
    .isOnQuest 8250
step
    .goto 1447/1,-5283.10,3642.59
    >>Open the |cRXP_PICK_Rune of Jin'yael|r. Loot it for |cRXP_LOOT_Rubbing: Rune of Jin'yael|r
    .complete 3449,2 --Rubbing: Rune of Jin'yael (1)
    .isOnQuest 3449
step
    .goto 1447/1,-5148.73,3543.86
    >>Open the |cRXP_PICK_Rune of Beth'Amara|r. Loot it for |cRXP_LOOT_Rubbing: Rune of Beth'Amara|r
    .complete 3449,1 --Rubbing: Rune of Beth'Amara (1)
    .isOnQuest 3449
step
    .goto 1447/1,-5272.96,3465.75
    >>Open the |cRXP_PICK_Rune of Markri|r. Loot it for |cRXP_LOOT_Rubbing: Rune of Markri|r
    .complete 3449,3 --Rubbing: Rune of Markri (1)
    .isOnQuest 3449
step
    .goto 1447/1,-5426.10,3172.59
    >>Open the |cRXP_PICK_Rune of Sael'hai|r. Loot it for |cRXP_LOOT_Rubbing: Rune of Sael'hai|r
    .complete 3449,4 --Rubbing: Rune of Sael'hai (1)
    .isOnQuest 3449
step
    .goto 1447/1,-6361.16,3098.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loramus Thalipedes|r
    .complete 2744,1 --Loramus Thalipedes
    .target Loramus Thalipedes
    .isOnQuest 2744
step
    .goto 1447/1,-6361.16,3098.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loramus Thalipedes|r
    .turnin 2744 >>Turn in The Demon Hunter
    .target Loramus Thalipedes
    .isOnQuest 2744
step
    .goto 1447/1,-7222.70,2251.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pilot Xiggs Fuselighter|r
    .turnin 3449 >>Turn in Arcane Runes
    .target Pilot Xiggs Fuselighter
    .isOnQuest 3449
step
    .goto 1447/1,-7222.70,2251.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pilot Xiggs Fuselighter|r
    .accept 3461 >>Accept Return to Tymor
    .target Pilot Xiggs Fuselighter
    .isQuestTurnedIn 3449 --any of: Arcane Runes
    .xp <45,1
step
    +|cRXP_WARN_That is all of Azshara for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Ironforge|r: Return to Tymor
    >>|cRXP_FRIENDLY_Undercity|r: Everyday Etiquette
step
    +|cRXP_WARN_End of the Azshara route.|r
]])
