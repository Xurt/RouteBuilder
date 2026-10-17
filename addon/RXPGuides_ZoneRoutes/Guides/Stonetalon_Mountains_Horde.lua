-- 18-29 Stonetalon Mountains: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 3 parts (from level 18, 21, 24).
-- Split into 3 guides, listed under "18 - 25 Stonetalon Mountains" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Stonetalon Mountains.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 18 - 25 Stonetalon Mountains
#subweight -18
#name 18-19 Stonetalon Mountains
--RouteBuilder:next
#next Zone Routes (Horde)\18-20 The Barrens: around Tonga Runetotem;Zone Routes (Horde)\11-15 Zephras Isle: around Elegael Thornpaw

step
    .goto 1442/1,-387.37,126.06
    >>Click the |cRXP_PICK_Scrolls|r
    .accept 78149 >>Accept Fury of the Land
step
    .goto 1442/1,-387.37,126.06
    >>Open the |cRXP_PICK_Scrolls|r. Loot it for |cRXP_LOOT_Fury of the Land|r
    .complete 78149,1 --Fury of the Land (1)
step
    .goto 1442/1,-342.44,129.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kaya Flathoof|r
    .accept 6523 >>Accept Protect Kaya
    .target Kaya Flathoof
step
    .goto 1442/1,-519.22,-41.64
    >>Kaya Escorted to Camp Aparaje
    .complete 6523,1 --Kaya Escorted to Camp Aparaje
step
    .goto 1442/1,-331.21,-173.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Darn Talongrip|r
    .accept 6542 >>Accept Report to Kadrak
    .target Darn Talongrip
step
    .goto 1442/1,-233.54,-177.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Xen'Zilla|r
    .accept 6461 >>Accept Blood Feeders
    .target Xen'Zilla
step
    #completewith Along8
    >>As you go: Kill |cRXP_ENEMY_Deepmoss Venomspitters|r. |cRXP_WARN_Anything left is finished later|r
    .complete 6461,2 --Deepmoss Venomspitter slain (7)
    .mob Deepmoss Venomspitter
step
    #loop
    .goto 1442/1,367.60,452.99,0
    .goto 1442/1,367.60,452.99,40,0
    .goto 1442/1,433.52,432.15,40,0
    .goto 1442/1,498.96,429.87,40,0
    .goto 1442/1,514.10,434.10,40,0
    .goto 1442/1,563.42,445.17,40,0
    .goto 1442/1,628.86,436.71,40,0
    .goto 1442/1,619.09,445.17,40,0
    .goto 1442/1,580.51,468.62,40,0
    .goto 1442/1,576.12,481.97,40,0
    >>Kill |cRXP_ENEMY_Deepmoss Creepers|r
    .complete 6461,1 --Deepmoss Creeper slain (10)
    .mob Deepmoss Creeper
step
    .goto 1442/1,927.72,893.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Jayka|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Jayka
step
    .goto 1442/1,920.88,911.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jeeda|r on the second floor of the inn
    .vendor >> |cRXP_BUY_Buy|r |T134831:0|t[Healing Potions] |cRXP_BUY_from her if they're up|r << !Warrior
    .vendor >> |cRXP_BUY_Buy|r |T134831:0|t[Healing Potions] |cRXP_BUY_and|r |T134413:0|t[Liferoot] |cRXP_BUY_from her if they're up|r << Warrior
    .target Jeeda
step
    .goto 1442/1,1041.99,967.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tharm|r
    .fp Sun Rock Retreat >> Get the Sun Rock Retreat flight path
    .target Tharm
    .subzoneskip 460,1
step
    .goto 1442/1,365.16,878.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ziz Fizziks|r
    .turnin 1483 >>Turn in Ziz Fizziks
    .target Ziz Fizziks
    .isOnQuest 1483
step
    #label Along8
    .goto 1442/1,365.16,878.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ziz Fizziks|r
    .accept 1093 >>Accept Super Reaper 6000
    .target Ziz Fizziks
step
    #loop
    .goto 1442/1,365.64,940.77,0
    .goto 1442/1,365.64,940.77,40,0
    .goto 1442/1,292.39,866.53,40,0
    .goto 1442/1,267.49,754.84,40,0
    .goto 1442/1,196.68,850.90,40,0
    .goto 1442/1,162.99,917.65,40,0
    .goto 1442/1,226.96,929.70,40,0
    .goto 1442/1,207.42,983.11,40,0
    .goto 1442/1,258.21,1052.46,40,0
    .goto 1442/1,288.49,971.71,40,0
    >>Kill |cRXP_ENEMY_Deepmoss Venomspitters|r
    .complete 6461,2 --Deepmoss Venomspitter slain (7)
    .mob Deepmoss Venomspitter
step << Undead Warrior/Skyborne Warrior
    .goto 1442/1,402.76,1231.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veenix|r
    .vendor >>|cRXP_BUY_Buy an|r |T135329:0|t[Executioner's Sword] |cRXP_BUY_from him|r
    >>|cRXP_WARN_If it's not up, buy a|r |T135280:0|t[Dacian Falx] |cRXP_WARN_instead|r
    .money <1.5024
    .target Veenix
step
    #loop
    .goto 1442/1,43.34,1234.81,0
    .goto 1442/1,43.34,1234.81,40,0
    .goto 1442/1,10.63,1234.49,40,0
    .goto 1442/1,-30.39,1210.07,40,0
    >>Kill |cRXP_ENEMY_Venture Co. Operator|r and loot |cRXP_LOOT_Super Reaper 6000 Blueprints|r
    .complete 1093,1 --Super Reaper 6000 Blueprints (1)
    .mob Venture Co. Operator
step
    .goto 1442/1,-602.23,1428.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Braug Dimspirit|r
    .turnin 1152 >>Turn in Test of Lore
    .target Braug Dimspirit
    .isOnQuest 1152
step
    .goto 1442/1,402.76,1231.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veenix|r
    .accept 78270 >>Accept Goblin Lockpicks
    .target Veenix
step
    .goto 1442/1,402.76,1231.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veenix|r
    >>|cRXP_WARN_The database has no objectives for Goblin Lockpicks. Skip this step if the quest is not finished|r
    .turnin 78270 >>Turn in Goblin Lockpicks
    .target Veenix
    .isOnQuest 78270
step
    .goto 1442/1,365.16,878.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ziz Fizziks|r
    .turnin 1093 >>Turn in Super Reaper 6000
    .accept 1094 >>Accept Further Instructions
    .target Ziz Fizziks
step
    .goto 1442/1,939.92,831.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mor'rogal|r
    .accept 6421 >>Accept Boulderslide Ravine
    .target Mor'rogal
step
    #completewith Along16
    >>As you go: Pick up |cRXP_PICK_Resonite Crystal|r from the ground. |cRXP_WARN_Anything left is finished later|r
    .complete 6421,1 --Resonite Crystal (10)
step
    #label Along16
    .goto 1442/1,402.76,2.00
    >>Investigate Cave in Boulderslide Ravine
    .complete 6421,2 --Investigate Cave in Boulderslide Ravine
step
    #loop
    .goto 1442/1,441.34,-4.19,0
    .goto 1442/1,441.34,-4.19,40,0
    .goto 1442/1,419.36,-53.68,40,0
    .goto 1442/1,384.20,-83.64,40,0
    .goto 1442/1,377.36,-123.69,40,0
    .goto 1442/1,271.88,-93.74,40,0
    .goto 1442/1,246.49,-49.13,40,0
    .goto 1442/1,301.67,-32.19,40,0
    .goto 1442/1,333.90,-62.48,40,0
    .goto 1442/1,354.90,-11.03,40,0
    >>Pick up |cRXP_PICK_Resonite Crystal|r from the ground
    .complete 6421,1 --Resonite Crystal (10)
step << Warlock
    .goto 1442/1,-331.21,-181.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ken'zigla|r
    .turnin 1510 >>Turn in News of Dogran
    .target Ken'zigla
    .isOnQuest 1510
step
    .goto 1442/1,-233.54,-177.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Xen'Zilla|r
    .turnin 6461 >>Turn in Blood Feeders
    .target Xen'Zilla
step
    .goto 1442/1,927.72,893.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Jayka|r
    >>|cRXP_WARN_Do NOT set your|r |T134414:0|t[Hearthstone]
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .vendor >> Vendor Trash
    .target Innkeeper Jayka
    .isOnQuest 1095
step
    .goto 1442/1,925.27,885.42,5,0
    .goto 1442/1,920.88,911.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jeeda|r on the second floor of the inn
    .vendor 4083 >> |cRXP_BUY_Buy|r |T134831:0|t[Healing Potions] |cRXP_BUY_from her if they're up|r << !Warrior
    .vendor 4083 >> |cRXP_BUY_Buy|r |T134831:0|t[Healing Potions] |cRXP_BUY_and|r |T134413:0|t[Liferoot] |cRXP_BUY_from her if they're up|r << Warrior
    .target Jeeda
    .isOnQuest 1095
step
    .goto 1442/1,939.92,831.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mor'rogal|r
    .turnin 6421 >>Turn in Boulderslide Ravine
    .accept 6481 >>Accept Earthen Arise
    .target Mor'rogal
step
    .goto 1442/1,442.80,5.58
    >>Kill |cRXP_ENEMY_Goggeroc|r
    .complete 6481,1 --Goggeroc slain (1)
    .mob Goggeroc
step
    .goto 1442/1,939.92,831.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mor'rogal|r
    .turnin 6481 >>Turn in Earthen Arise
    .target Mor'rogal
step
    .goto 1442/1,1255.39,1204.86
    >>Click the |cRXP_PICK_Pocket Litter|r
    .turnin 79192 >>Turn in Stepping Stones
    .isOnQuest 79192
step
    .goto 1442/1,1255.39,1204.86
    >>Click the |cRXP_PICK_Pocket Litter|r
    .accept 79980 >>Accept Scramble
step
    .goto 1442/1,1311.06,1293.10
    >>Click the |cRXP_PICK_Mound of Dirt|r
    .turnin 79980 >>Turn in Scramble
step
    .goto 1442/1,928.20,1015.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tammra Windfield|r
    .turnin 6401 >>Turn in Kaya's Alive
    .target Tammra Windfield
    .isOnQuest 6401
step
    .goto 1442/1,927.72,893.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Jayka|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Jayka
    .subzoneskip 460,1
step
    .goto 1442/1,920.88,911.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jeeda|r on the second floor of the inn
    .vendor >> |cRXP_BUY_Buy|r |T134831:0|t[Healing Potions] |cRXP_BUY_from her if they're up|r
    .target Jeeda
    .subzoneskip 460,1
step
    .goto 1442/1,1042.47,968.13
    .fp Sun Rock>> Get the Sun Rock Retreat flight path
step
    .goto 1442/1,365.16,878.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ziz Fizziks|r
    .turnin 1095 >>Turn in Further Instructions
    .target Ziz Fizziks
    .isOnQuest 1095
step
    .goto 1442/1,183.98,1608.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_Talk to|r |cRXP_FRIENDLY_Nizzik|r
    .vendor >>|cRXP_BUY_Buy gear upgrades if any are available|r
    .target Nizzik
    .isOnQuest 1096
step
    .goto 1442/1,-394.20,-272.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Jin'Zil|r
    .turnin 1060 >>Turn in Letter to Jin'Zil
    .target Witch Doctor Jin'Zil
    .isOnQuest 1060
step
    +|cRXP_WARN_That is all of Stonetalon Mountains for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_The Barrens|r: Protect Kaya, Report to Kadrak, Further Instructions
    >>|cRXP_FRIENDLY_Undercity|r: Fury of the Land
step
    +|cRXP_WARN_Suggested next zones at level 18|r: |cRXP_FRIENDLY_The Barrens|r (about 1.4 levels of quests, starting around Tonga Runetotem), |cRXP_FRIENDLY_Zephras Isle|r (about 0.7 levels of quests, starting around Elegael Thornpaw). Completing this step loads the guide for The Barrens --RouteBuilder:next
step
    +|cRXP_WARN_The rest of Stonetalon Mountains is planned from level 21.|r Load its guide for level 21 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 18 - 25 Stonetalon Mountains
#subweight -18
#name 21-22 Stonetalon Mountains
--RouteBuilder:next
#next Zone Routes (Horde)\18-20 The Barrens: around Tonga Runetotem

step << Warlock
    .goto 1442/1,-331.21,-181.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ken'zigla|r
    .accept 1511 >>Accept Ken'zigla's Draught
    .target Ken'zigla
    .isQuestTurnedIn 1510 --any of: News of Dogran
    .xp <20,1
step
    .goto 1442/1,-263.82,962.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Piznik|r
    .accept 1090 >>Accept Gerenzo's Orders
    .target Piznik
step
    .goto 1442/1,-263.82,962.92
    >>Get the mysterious ore from Piznik after he finishes mining it.
    .complete 1090,1 --Piznik
    .target Piznik
step
    .goto 1442/1,-263.82,962.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Piznik|r
    .turnin 1090 >>Turn in Gerenzo's Orders
    .accept 1092 >>Accept Gerenzo's Orders
    .target Piznik
step
    .goto 1442/1,365.16,878.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ziz Fizziks|r
    .turnin 1092 >>Turn in Gerenzo's Orders
    .target Ziz Fizziks
step
    .goto 1442/1,402.76,1231.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veenix|r
    .turnin 78270 >>Turn in Goblin Lockpicks
    .target Veenix
    .isOnQuest 78270
step
    .goto 1442/1,928.20,1015.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tammra Windfield|r
    .accept 6301 >>Accept Cycle of Rebirth
    .target Tammra Windfield
step
    .goto 1442/1,361.74,451.36
    >>Click the |cRXP_PICK_Wanted Poster: Besseleth|r
    .accept 6284 >>Accept Arachnophobia
step
    #loop
    .goto 1442/1,579.53,546.12,0
    .goto 1442/1,579.53,546.12,40,0
    .goto 1442/1,589.30,578.68,40,0
    .goto 1442/1,657.67,591.70,40,0
    .goto 1442/1,686.97,578.68,40,0
    .goto 1442/1,706.50,513.55,40,0
    .goto 1442/1,686.97,487.50,40,0
    .goto 1442/1,677.20,507.04,40,0
    .goto 1442/1,667.43,552.63,40,0
    .goto 1442/1,628.37,552.63,40,0
    >>Kill |cRXP_ENEMY_Besseleth|r and loot |cRXP_LOOT_Besseleth's Fang|r
    .complete 6284,1 --Besseleth's Fang (1)
    .mob Besseleth
step
    .goto 1442/1,940.90,925.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maggran Earthbinder|r
    .turnin 6284 >>Turn in Arachnophobia
    .target Maggran Earthbinder
step
    #loop
    .goto 1442/1,717.73,1528.85,0
    .goto 1442/1,717.73,1528.85,40,0
    .goto 1442/1,757.29,1577.37,40,0
    .goto 1442/1,794.89,1640.22,40,0
    .goto 1442/1,773.40,1726.18,40,0
    >>Pick up |cRXP_PICK_Gaea Seed|r from the ground
    .complete 6301,1 --Gaea Seed (10)
step
    .goto 1442/1,928.20,1015.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tammra Windfield|r
    .turnin 6301 >>Turn in Cycle of Rebirth
    .target Tammra Windfield
step
    +|cRXP_WARN_That is all of Stonetalon Mountains for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_The Barrens|r: Ken'zigla's Draught << Warlock
step
    +|cRXP_WARN_Suggested next zones at level 21|r: |cRXP_FRIENDLY_The Barrens|r (about 1.1 levels of quests, starting around Tonga Runetotem). Completing this step loads the guide for The Barrens --RouteBuilder:next
step
    +|cRXP_WARN_The rest of Stonetalon Mountains is planned from level 24.|r Load its guide for level 24 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 18 - 25 Stonetalon Mountains
#subweight -18
#name 24-25 Stonetalon Mountains: around Maggran Earthbinder

step
    .goto 1442/1,402.76,1231.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veenix|r
    .turnin 78270 >>Turn in Goblin Lockpicks
    .target Veenix
    .isOnQuest 78270
step
    .goto 1442/1,-394.20,-272.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Jin'Zil|r
    .accept 1058 >>Accept Jin'Zil's Forest Magic
    .target Witch Doctor Jin'Zil
step
    .goto 1442/1,927.72,893.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Jayka|r
    .target Innkeeper Jayka
    .home >>Set your Hearthstone to Innkeeper Jayka's inn
step
    .goto 1442/1,1002.43,949.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Braelyn Firehand|r
    .accept 1087 >>Accept Cenarius' Legacy
    .target Braelyn Firehand
step
    .goto 1442/1,940.90,925.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maggran Earthbinder|r
    .accept 5881 >>Accept Calling in the Reserves
    .accept 6282 >>Accept Harpies Threaten
    .accept 86576 >>Accept Bloodfury Trinkets
    .target Maggran Earthbinder
step
    .goto 1442/1,933.09,824.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tsunaman|r
    .accept 6393 >>Accept Elemental War
    .target Tsunaman
step
    #loop
    .goto 1442/1,1619.68,2517.12,0
    .goto 1442/1,1619.68,2517.12,40,0
    .goto 1442/1,1677.79,2541.87,40,0
    .goto 1442/1,1730.53,2542.52,40,0
    .goto 1442/1,1736.39,2603.42,40,0
    .goto 1442/1,1672.91,2627.19,40,0
    .goto 1442/1,1631.89,2655.52,40,0
    .goto 1442/1,1569.87,2657.47,40,0
    .goto 1442/1,1559.62,2587.13,40,0
    .goto 1442/1,1620.66,2593.32,40,0
    >>Kill |cRXP_ENEMY_Twilight Runners|r. Loot them for |cRXP_LOOT_Twilight Whisker|r
    .complete 1058,2 --Twilight Whisker (5)
    .mob Twilight Runner
step
    #loop
    .goto 1442/1,1522.99,2557.18,0
    .goto 1442/1,1522.99,2557.18,40,0
    .goto 1442/1,1627.98,2486.52,40,0
    .goto 1442/1,1515.18,2419.11,40,0
    .goto 1442/1,1440.46,2428.88,40,0
    .goto 1442/1,1417.02,2488.80,40,0
    .goto 1442/1,1379.42,2544.80,40,0
    .goto 1442/1,1465.86,2490.42,40,0
    .goto 1442/1,1496.62,2506.70,40,0
    .goto 1442/1,1492.72,2574.43,40,0
    >>Kill |cRXP_ENEMY_Son of Cenarius|r
    >>Kill |cRXP_ENEMY_Daughter of Cenarius|r
    >>Kill |cRXP_ENEMY_Cenarion Botanists|r
    >>Kill |cRXP_ENEMY_Fey Dragons|r, |cRXP_ENEMY_Wily Fey Dragons|r and |cRXP_ENEMY_Nal'taszars|r. Loot them for |cRXP_LOOT_Fey Dragon Scale|r
    .complete 1087,1 --Son of Cenarius slain (4)
    .complete 1087,2 --Daughter of Cenarius slain (4)
    .complete 1087,3 --Cenarion Botanist slain (4)
    .complete 1058,4 --Fey Dragon Scale (1)
    .mob Son of Cenarius
    .mob Daughter of Cenarius
    .mob Cenarion Botanist
    .mob Fey Dragon
    .mob Wily Fey Dragon
    .mob Nal'taszar
step
    #loop
    .goto 1442/1,1501.99,2319.47,0
    .goto 1442/1,1501.99,2319.47,40,0
    .goto 1442/1,1504.44,2262.49,40,0
    .goto 1442/1,1431.67,2269.98,40,0
    .goto 1442/1,1418.98,2253.37,40,0
    .goto 1442/1,1383.82,2301.89,40,0
    >>Kill |cRXP_ENEMY_Sap Beast|r and loot |cRXP_LOOT_Stonetalon Sap|r
    .complete 1058,1 --Stonetalon Sap (1)
    .mob Sap Beast
step
    #loop
    .goto 1442/1,1290.06,2518.10,0
    .goto 1442/1,1290.06,2518.10,40,0
    .goto 1442/1,1239.76,2547.08,40,0
    .goto 1442/1,1286.64,2645.42,40,0
    .goto 1442/1,1257.83,2721.29,40,0
    .goto 1442/1,1331.08,2724.55,40,0
    .goto 1442/1,1318.87,2677.01,40,0
    .goto 1442/1,1350.61,2654.86,40,0
    .goto 1442/1,1312.03,2610.90,40,0
    .goto 1442/1,1289.08,2558.48,40,0
    >>Kill |cRXP_ENEMY_Antlered Coursers|r and |cRXP_ENEMY_Great Coursers|r. Loot them for |cRXP_LOOT_Courser Eye|r
    .complete 1058,3 --Courser Eye (30)
    .mob Antlered Courser
    .mob Great Courser
step
    #completewith Along11
    >>As you go: Kill |cRXP_ENEMY_Bloodfury Harpies|r, |cRXP_ENEMY_Bloodfury Roguefeathers|r, |cRXP_ENEMY_Bloodfury Slayers|r and |cRXP_ENEMY_Bloodfury Ambushers|r. Loot them for |cRXP_LOOT_Glittering Sunstone|r. |cRXP_WARN_Anything left is finished later|r
    .complete 86576,1 --Glittering Sunstone (15)
    .mob Bloodfury Harpy
    .mob Bloodfury Roguefeather
    .mob Bloodfury Slayer
    .mob Bloodfury Ambusher
step
    #loop
    .goto 1442/1,1691.47,1003.29,0
    .goto 1442/1,1691.47,1003.29,40,0
    .goto 1442/1,1735.42,987.99,40,0
    .goto 1442/1,1781.81,901.70,40,0
    .goto 1442/1,1798.41,877.60,40,0
    .goto 1442/1,1741.77,919.93,40,0
    .goto 1442/1,1715.40,949.24,40,0
    .goto 1442/1,1679.75,948.91,40,0
    .goto 1442/1,1655.33,941.43,40,0
    >>Kill |cRXP_ENEMY_Bloodfury Harpies|r
    >>Kill |cRXP_ENEMY_Bloodfury Ambushers|r
    .complete 6282,1 --Bloodfury Harpy slain (7)
    .complete 6282,2 --Bloodfury Ambusher slain (7)
    .mob Bloodfury Harpy
    .mob Bloodfury Ambusher
step
    #label Along11
    #loop
    .goto 1442/1,1777.90,719.02,0
    .goto 1442/1,1777.90,719.02,40,0
    .goto 1442/1,1805.74,681.90,40,0
    .goto 1442/1,1815.02,627.20,40,0
    .goto 1442/1,1819.90,600.17,40,0
    .goto 1442/1,1769.11,650.97,40,0
    .goto 1442/1,1741.77,672.78,40,0
    .goto 1442/1,1550.83,612.22,40,0
    .goto 1442/1,1543.50,665.95,40,0
    .goto 1442/1,1551.80,701.44,40,0
    >>Kill |cRXP_ENEMY_Bloodfury Slayers|r
    >>Kill |cRXP_ENEMY_Bloodfury Roguefeathers|r
    .complete 6282,3 --Bloodfury Slayer slain (7)
    .complete 6282,4 --Bloodfury Roguefeather slain (7)
    .mob Bloodfury Slayer
    .mob Bloodfury Roguefeather
step
    #completewith next
    .hs >>Hearth to Innkeeper Jayka's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1442/1,928.20,1015.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tammra Windfield|r
    .accept 6381 >>Accept New Life
    .target Tammra Windfield
    .isQuestTurnedIn 6301 --any of: Cycle of Rebirth
step
    .goto 1442/1,940.90,925.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maggran Earthbinder|r
    .turnin 6282 >>Turn in Harpies Threaten
    .accept 6283 >>Accept Bloodfury Bloodline
    .target Maggran Earthbinder
step
    .goto 1442/1,1002.43,949.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Braelyn Firehand|r
    .turnin 1087 >>Turn in Cenarius' Legacy
    .accept 1088 >>Accept Ordanus
    .target Braelyn Firehand
step
    #completewith Along15
    >>As you go: Kill |cRXP_ENEMY_Bloodfury Harpies|r, |cRXP_ENEMY_Bloodfury Roguefeathers|r, |cRXP_ENEMY_Bloodfury Slayers|r and |cRXP_ENEMY_Bloodfury Ambushers|r. Loot them for |cRXP_LOOT_Glittering Sunstone|r. |cRXP_WARN_Anything left is finished later|r
    .complete 86576,1 --Glittering Sunstone (15)
    .mob Bloodfury Harpy
    .mob Bloodfury Roguefeather
    .mob Bloodfury Slayer
    .mob Bloodfury Ambusher
step
    #label Along15
    .goto 1442/1,1744.21,900.72
    >>Kill |cRXP_ENEMY_Bloodfury Ripper|r and loot |cRXP_LOOT_Bloodfury Ripper's Remains|r
    .complete 6283,1 --Bloodfury Ripper's Remains (1)
    .mob Bloodfury Ripper
step
    #loop
    .goto 1442/1,1785.23,519.09,0
    .goto 1442/1,1785.23,519.09,40,0
    .goto 1442/1,1726.14,512.90,40,0
    .goto 1442/1,1622.61,478.39,40,0
    .goto 1442/1,1651.91,523.00,40,0
    >>Kill |cRXP_ENEMY_Rogue Flame Spirits|r, |cRXP_ENEMY_Burning Ravagers|r and |cRXP_ENEMY_Burning Destroyers|r. Loot them for |cRXP_LOOT_Incendrites|r
    .complete 6393,1 --Incendrites (10)
    .mob Rogue Flame Spirit
    .mob Burning Ravager
    .mob Burning Destroyer
step
    .goto 1442/1,933.09,824.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tsunaman|r
    .turnin 6393 >>Turn in Elemental War
    .target Tsunaman
step
    #completewith Along18
    >>As you go: Kill |cRXP_ENEMY_Bloodfury Harpies|r, |cRXP_ENEMY_Bloodfury Roguefeathers|r, |cRXP_ENEMY_Bloodfury Slayers|r and |cRXP_ENEMY_Bloodfury Ambushers|r. Loot them for |cRXP_LOOT_Glittering Sunstone|r. |cRXP_WARN_Anything left is finished later|r
    .complete 86576,1 --Glittering Sunstone (15)
    .mob Bloodfury Harpy
    .mob Bloodfury Roguefeather
    .mob Bloodfury Slayer
    .mob Bloodfury Ambusher
step
    #label Along18
    #loop
    .goto 1442/1,1487.83,792.61,0
    .goto 1442/1,1487.83,792.61,40,0
    .goto 1442/1,1526.41,841.46,40,0
    .goto 1442/1,1602.10,734.33,40,0
    .goto 1442/1,1562.06,666.92,40,0
    .goto 1442/1,1602.10,609.61,40,0
    .goto 1442/1,1600.15,541.23,40,0
    .goto 1442/1,1444.86,572.49,40,0
    .goto 1442/1,1493.20,637.29,40,0
    .goto 1442/1,1484.90,703.72,40,0
    >>Click the |cRXP_PICK_Gaea Dirt Mound|r
    .complete 6381,1 --Gaea seed planted
    .isOnQuest 6381
step
    #loop
    .goto 1442/1,1514.20,749.31,0
    .goto 1442/1,1514.20,749.31,40,0
    .goto 1442/1,1522.99,857.74,40,0
    .goto 1442/1,1560.59,936.87,40,0
    .goto 1442/1,1628.96,959.99,40,0
    .goto 1442/1,1730.05,894.21,40,0
    .goto 1442/1,1646.54,818.01,40,0
    .goto 1442/1,1685.61,750.93,40,0
    .goto 1442/1,1742.25,790.66,40,0
    .goto 1442/1,1741.77,672.78,40,0
    >>Kill |cRXP_ENEMY_Bloodfury Harpies|r, |cRXP_ENEMY_Bloodfury Roguefeathers|r, |cRXP_ENEMY_Bloodfury Slayers|r and |cRXP_ENEMY_Bloodfury Ambushers|r. Loot them for |cRXP_LOOT_Glittering Sunstone|r
    .complete 86576,1 --Glittering Sunstone (15)
    .mob Bloodfury Harpy
    .mob Bloodfury Roguefeather
    .mob Bloodfury Slayer
    .mob Bloodfury Ambusher
step
    .goto 1442/1,928.20,1015.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tammra Windfield|r
    .turnin 6381 >>Turn in New Life
    .target Tammra Windfield
    .isOnQuest 6381
step
    .goto 1442/1,940.90,925.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maggran Earthbinder|r
    .turnin 6283 >>Turn in Bloodfury Bloodline
    .target Maggran Earthbinder
step
    .goto 1442/1,1002.43,949.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Braelyn Firehand|r
    .turnin 1088 >>Turn in Ordanus
    .target Braelyn Firehand
    .isQuestComplete 1088
step
    .goto 1442/1,939.92,831.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mor'rogal|r
    .turnin 86576 >>Turn in Bloodfury Trinkets
    .target Mor'rogal
step
    .goto 1442/1,-394.20,-272.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Jin'Zil|r
    .turnin 1058 >>Turn in Jin'Zil's Forest Magic
    .target Witch Doctor Jin'Zil
step
    +|cRXP_WARN_End of the Stonetalon Mountains route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Thousand Needles|r: Calling in the Reserves
    >>|cRXP_FRIENDLY_Ashenvale and back here|r: Ordanus
]])
