-- 20-40 Hillsbrad Foothills: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 7 parts (from level 20, 23, 26, 29, 32, 35, 38).
-- Split into 7 guides, listed under "20 - 39 Hillsbrad Foothills" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Hillsbrad Foothills.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 20 - 39 Hillsbrad Foothills
#subweight -20
#name 20-21 Hillsbrad Foothills: around Apothecary Lydon
--RouteBuilder:next
#next Zone Routes (Horde)\18-20 The Barrens: around Tonga Runetotem

step << Undead Paladin
    .goto 1424/0,-867.09,-158.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ott|r
    .turnin 95111 >>Turn in An Underrated Talent
    .target Ott
    .isOnQuest 95111
step
    .goto 1424/0,401.39,-611.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathstalker Lesh|r
    .accept 494 >>Accept Time To Strike
    .target Deathstalker Lesh
step
    .goto 1424/0,-857.81,2.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zarise|r
    .fp Tarren Mill >> Get the Tarren Mill Flight Path
    .target Zarise
step
    .goto 1424/0,-927.89,-36.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Darthalia|r
    .turnin 494 >>Turn in Time To Strike while you are here
    .isQuestComplete 494
    .target High Executor Darthalia
step
    .goto 1424/0,-899.41,-6.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Lydon|r
    .turnin 2933 >>Turn in Venom Bottles
    .target Apothecary Lydon
    .isOnQuest 2933
step << Rogue
    .goto 1424/0,-905.49,-9.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Serge Hinott|r
    .turnin 2479 >>Turn in Hinott's Assistance
    .target Serge Hinott
    .isOnQuest 2479
step << Rogue
    .goto 1424/0,-905.49,-9.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Serge Hinott|r
    .accept 2480 >>Accept Hinott's Assistance
    .target Serge Hinott
    .isQuestTurnedIn 2479 --any of: Hinott's Assistance
    .xp <20,1
step << Rogue
    .goto 1424/0,-903.57,-9.81
    >>Cure Completed
    .complete 2480,1 --Cure Completed
    .isOnQuest 2480
step << Rogue
    .goto 1424/0,-905.49,-9.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Serge Hinott|r
    .turnin 2480 >>Turn in Hinott's Assistance
    .target Serge Hinott
    .isOnQuest 2480
step
    .goto 1424/0,-899.41,-6.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Lydon|r
    .turnin 1065 >>Turn in Journey to Tarren Mill
    .target Apothecary Lydon
    .isOnQuest 1065
step
    .goto 1424/0,-857.81,2.77
    .fp Hillsbrad >> Get the Tarren Mill Flight Path
step
    .goto 1424/0,-899.41,-6.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Lydon|r
    .accept 1066 >>Accept Blood of Innocents
    .target Apothecary Lydon
    .isQuestTurnedIn 1065 --any of: Journey to Tarren Mill
    .xp <13,1
step
    .goto 1424/0,-899.41,-6.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Lydon|r
    .turnin 493 >>Turn in Journey to Hillsbrad Foothills
    .target Apothecary Lydon
    .isOnQuest 493
step
    .goto 1424/0,-899.41,-6.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Lydon|r
    .accept 496 >>Accept Elixir of Suffering
    .target Apothecary Lydon
step
    .goto 1424/0,-927.89,-36.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Darthalia|r
    .turnin 494 >>Turn in Time To Strike
    .accept 98094 >>Accept Scout Support
    .target High Executor Darthalia
step
    .goto 1424/0,-937.49,-40.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Melisara|r
    .turnin 495 >>Turn in The Crown of Will
    .target Melisara
    .isOnQuest 495
step
    .goto 1424/0,-937.49,-42.67
    >>Click the |cRXP_PICK_WANTED|r
    .accept 549 >>Accept WANTED: Syndicate Personnel
step
    .goto 1424/0,-941.65,-6.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Shay|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Shay
    .subzoneskip 272,1
step << Shaman/Warrior
    .goto 1424/0,-867.09,-158.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ott|r
    .vendor >> |cRXP_BUY_Buy a|r |T132408:0|t[Merciless Axe] |cRXP_BUY_from him if it's up and you don't have it yet|r
    .money <3.0195
    .target Ott
    .subzoneskip 272,1
step << Rogue
    .goto 1424/0,-867.09,-158.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ott|r
    .vendor >> |cRXP_BUY_Buy a|r |T135640:0|t[Broad Bladed Knife] |cRXP_BUY_from him if it's up and you don't have it yet|r
    .money <2.8372
    .target Ott
    .subzoneskip 272,1
step << Hunter
    .goto 1424/0,-787.09,-194.13,0
    .goto 1424/0,-787.09,-194.13,60,0
    .goto 1424/0,-817.49,-288.64,60,0
    .goto 1424/0,-909.97,-371.41,60,0
    .train 16829 >>|cRXP_WARN_Cast|r |T132164:0|t[Tame Beast] |cRXP_WARN_on a |cRXP_ENEMY_Gray Bear|r. Attack mobs with it to learn|r |T132140:0|t[Claw (Rank 3)]
    .train 17263 >>|cRXP_WARN_Cast|r |T132164:0|t[Tame Beast] |cRXP_WARN_on a |cRXP_ENEMY_Forest Most Creeper|r. Attack mobs with it to learn|r |T132278:0|t[Bite (Rank 3)]
step << Rogue/Hunter/Shaman
    .goto 1424/0,-1497.81,-429.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kris|r
    >>|cRXP_BUY_Buy|r |T134590:0|t[|cRXP_FRIENDLY_Stalking Pants|r] |cRXP_BUY_and|r |T132603:0|t[|cRXP_FRIENDLY_Wolf Bracers|r] |cRXP_BUY_from her if they're up|r
    .vendor >> Vendor and Repair
    .target Kris Legace
    .money <1.1374
    .isOnQuest 498
step << Rogue/Hunter/Shaman/Druid
    .goto 1424/0,-1497.81,-429.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kris|r
    >>|cRXP_BUY_Buy|r |T134590:0|t[|cRXP_FRIENDLY_Stalking Pants|r] |cRXP_BUY_from her if they're up|r
    .vendor >> Vendor and Repair
    .target Kris Legace
    .money <0.7859
    .isOnQuest 498
step << Rogue/Hunter/Shaman/Druid
    .goto 1424/0,-1497.81,-429.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kris|r
    >>|cRXP_BUY_Buy|r |T132603:0|t[|cRXP_FRIENDLY_Wolf Bracers|r] |cRXP_BUY_from her if they're up|r
    .vendor >> Vendor and Repair
    .target Kris Legace
    .money <0.3515
    .isOnQuest 498
step << !Rogue !Hunter !Shaman !Druid
    .goto 1424/0,-1497.81,-429.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kris|r
    .vendor >> Vendor and Repair
    .target Kris Legace
    .isOnQuest 498
    .subzoneskip 275,1
step
    .goto 1424/0,-957.01,-40.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krusk|r
    .turnin 508 >>Turn in Taretha's Gift
    .target Krusk
    .isOnQuest 508
step
    .goto 1424/0,-967.89,-733.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathstalker Masoj|r
    .turnin 98094 >>Turn in Scout Support
    .accept 98095 >>Accept Valuable Vantages
    .target Deathstalker Masoj
step
    .goto 1424/0,-967.89,-733.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathstalker Masoj|r
    >>|cRXP_WARN_The database has no objectives for Valuable Vantages. Skip this step if the quest is not finished|r
    .turnin 98095 >>Turn in Valuable Vantages
    .target Deathstalker Masoj
    .isOnQuest 98095
step
    #completewith Along17
    >>As you go: Kill |cRXP_ENEMY_Syndicate Rogues|r. Kill |cRXP_ENEMY_Syndicate Watchmans|r. |cRXP_WARN_Anything left is finished later|r
    .complete 549,1 --Syndicate Rogue slain (10)
    .complete 549,2 --Syndicate Watchman slain (8)
    .mob Syndicate Rogue
    .mob Syndicate Watchman
step
    #label Along17
    #loop
    .goto 1424/0,-1025.17,-638.51,0
    .goto 1424/0,-1025.17,-638.51,40,0
    .goto 1424/0,-1008.53,-604.37,40,0
    .goto 1424/0,-1066.13,-581.33,40,0
    .goto 1424/0,-1106.77,-607.57,40,0
    .goto 1424/0,-1068.69,-667.73,40,0
    >>Kill |cRXP_ENEMY_Syndicate Shadow Mage|r and loot |cRXP_LOOT_Vial of Innocent Blood|r
    .complete 1066,1 --Vial of Innocent Blood (1)
    .mob Syndicate Shadow Mage
    .isOnQuest 1066
step
    #loop
    .goto 1424/0,-1047.89,-639.57,0
    .goto 1424/0,-1047.89,-639.57,40,0
    .goto 1424/0,-1080.53,-686.08,40,0
    .goto 1424/0,-1083.73,-671.15,40,0
    .goto 1424/0,-1096.53,-615.25,40,0
    .goto 1424/0,-1078.93,-586.45,40,0
    .goto 1424/0,-1047.89,-572.80,40,0
    .goto 1424/0,-1024.85,-593.49,40,0
    >>Kill |cRXP_ENEMY_Syndicate Rogues|r
    >>Kill |cRXP_ENEMY_Syndicate Watchmans|r
    .complete 549,1 --Syndicate Rogue slain (10)
    .complete 549,2 --Syndicate Watchman slain (8)
    .mob Syndicate Rogue
    .mob Syndicate Watchman
step
    .goto 1424/0,-927.89,-36.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Darthalia|r
    .turnin 549 >>Turn in WANTED: Syndicate Personnel
    .target High Executor Darthalia
step
    .goto 1424/0,-941.65,-6.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Shay|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Shay
    .isOnQuest 527
    .subzoneskip 272,1
step
    .goto 1424/0,-899.41,-6.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Lydon|r
    .turnin 1066 >>Turn in Blood of Innocents
    .target Apothecary Lydon
    .isOnQuest 1066
step
    .goto 1424/0,-941.65,-6.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Shay|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Shay
    .isOnQuest 528
    .subzoneskip 272,1
step
    #loop
    .goto 1424/0,-823.57,-298.67,0
    .goto 1424/0,-823.57,-298.67,40,0
    .goto 1424/0,-791.89,-326.61,40,0
    .goto 1424/0,-688.85,-443.52,40,0
    .goto 1424/0,-509.01,-517.97,40,0
    .goto 1424/0,-487.89,-586.45,40,0
    .goto 1424/0,-639.57,-506.03,40,0
    .goto 1424/0,-734.29,-520.96,40,0
    .goto 1424/0,-753.17,-460.16,40,0
    .goto 1424/0,-837.65,-379.73,40,0
    >>Kill |cRXP_ENEMY_Gray Bears|r, |cRXP_ENEMY_Vicious Gray Bears|r, |cRXP_ENEMY_Elder Gray Bears|r and |cRXP_ENEMY_Big Samras|r. Loot them for |cRXP_LOOT_Gray Bear Tongue|r
    .complete 496,1 --Gray Bear Tongue (10)
    .mob Gray Bear
    .mob Vicious Gray Bear
    .mob Elder Gray Bear
    .mob Big Samras
step << Undead Paladin
    .xp 20 >>Grind to level 20 (The Moonsilver Blade needs it)
step << Undead Paladin
    .goto 1424/0,-867.09,-158.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ott|r
    .accept 95126 >>Accept The Moonsilver Blade
    .accept 95125 >>Accept Ott's Masterwork
    .target Ott
step << Undead Paladin
    .goto 1424/0,-867.09,-158.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ott|r
    >>|cRXP_WARN_The database has no objectives for Ott's Masterwork. Skip this step if the quest is not finished|r
    .turnin 95125 >>Turn in Ott's Masterwork
    .target Ott
    .isOnQuest 95125
step
    #loop
    .goto 1424/0,-129.81,-1011.84,0
    .goto 1424/0,-129.81,-1011.84,40,0
    .goto 1424/0,-75.09,-1016.53,40,0
    .goto 1424/0,-39.25,-1108.69,40,0
    .goto 1424/0,21.23,-1142.19,40,0
    .goto 1424/0,44.91,-1227.31,40,0
    .goto 1424/0,-54.93,-1178.24,40,0
    .goto 1424/0,-149.97,-1153.71,40,0
    .goto 1424/0,-211.73,-1153.49,40,0
    .goto 1424/0,-127.89,-1099.09,40,0
    >>Kill |cRXP_ENEMY_Torn Fin Muckdwellers|r, |cRXP_ENEMY_Torn Fin Coastrunners|r, |cRXP_ENEMY_Torn Fin Oracles|r and |cRXP_ENEMY_Torn Fin Tidehunters|r. Loot them for |cRXP_LOOT_Torn Fin Eye|r
    .complete 515,3 --Torn Fin Eye (5)
    .mob Torn Fin Muckdweller
    .mob Torn Fin Coastrunner
    .mob Torn Fin Oracle
    .mob Torn Fin Tidehunter
    .isOnQuest 515
step
    #loop
    .goto 1424/0,-906.45,-1345.49,0
    .goto 1424/0,-906.45,-1345.49,40,0
    .goto 1424/0,-981.01,-1351.89,40,0
    .goto 1424/0,-976.53,-1418.03,40,0
    .goto 1424/0,-1027.09,-1440.64,40,0
    .goto 1424/0,-1084.37,-1457.71,40,0
    .goto 1424/0,-1040.53,-1382.61,40,0
    .goto 1424/0,-1014.29,-1313.92,40,0
    .goto 1424/0,-1054.61,-1297.28,40,0
    .goto 1424/0,-985.17,-1236.48,40,0
    >>Kill |cRXP_ENEMY_Daggerspine Shorestalkers|r, |cRXP_ENEMY_Daggerspine Shorehunters|r, |cRXP_ENEMY_Daggerspine Screamers|r and |cRXP_ENEMY_Daggerspine Sirens|r. Loot them for |cRXP_LOOT_Daggerspine Scale|r
    .complete 515,2 --Daggerspine Scale (5)
    .mob Daggerspine Shorestalker
    .mob Daggerspine Shorehunter
    .mob Daggerspine Screamer
    .mob Daggerspine Siren
    .isOnQuest 515
step
    #loop
    .goto 1424/0,-746.13,40.32,0
    .goto 1424/0,-746.13,40.32,40,0
    .goto 1424/0,-760.85,111.36,40,0
    .goto 1424/0,-833.49,108.16,40,0
    .goto 1424/0,-937.17,107.73,40,0
    .goto 1424/0,-971.41,94.08,40,0
    .goto 1424/0,-880.53,83.41,40,0
    >>Kill |cRXP_ENEMY_Elder Moss Creepers|r, |cRXP_ENEMY_Giant Moss Creepers|r, |cRXP_ENEMY_Forest Moss Creepers|r and |cRXP_ENEMY_Creepthess|r. Loot them for |cRXP_LOOT_Creeper Ichor|r
    .complete 496,2 --Creeper Ichor (1)
    .mob Elder Moss Creeper
    .mob Giant Moss Creeper
    .mob Forest Moss Creeper
    .mob Creepthess
step
    .goto 1424/0,-899.41,-6.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Lydon|r
    .turnin 515 >>Turn in Elixir of Agony
    .target Apothecary Lydon
    .isOnQuest 515
step
    .goto 1424/0,-899.41,-6.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Lydon|r
    .turnin 496 >>Turn in Elixir of Suffering
    .accept 499 >>Accept Elixir of Suffering
    .target Apothecary Lydon
step
    .goto 1424/0,-902.93,-8.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Umpi|r
    .turnin 499 >>Turn in Elixir of Suffering
    .target Umpi
step
    .goto 1424/0,-899.41,-6.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Lydon|r
    .accept 1067 >>Accept Return to Thunder Bluff
    .target Apothecary Lydon
    .isQuestTurnedIn 1066 --any of: Blood of Innocents
    .xp <13,1
step
    .goto 1424/0,-941.65,-6.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Shay|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Shay
    .isOnQuest 529
    .subzoneskip 272,1
step
    .goto 1424/0,-105.81,-564.48,60,0
    .goto 1424/0,-86.29,-547.20,60,0
    .goto 1424/0,-32.85,-551.89,60,0
    .goto 1424/0,-15.57,-576.00,60,0
    .goto 1424/0,2.67,-635.52,60,0
    .goto 1424/0,-40.21,-626.77,60,0
    .goto 1424/0,-62.61,-608.64,60,0
    .goto 1424/0,-101.01,-613.12,60,0
    .goto 1424/0,-105.81,-564.48,60,0
    .xp 24 >>Grind to level 24
step
    .goto 1424/0,-926.61,-6.19
    .vendor >> Buy 3 Soothing Spices from Christoph on the first floor of the Inn
    .collect 3713,3
step
    .goto 1424/0,-957.01,-40.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krusk|r
    .turnin 506 >>Turn in Blackmoore's Legacy
    .target Krusk
    .isOnQuest 506
step
    +|cRXP_WARN_That is all of Hillsbrad Foothills for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Silverpine Forest|r: The Moonsilver Blade << Undead Paladin
    >>|cRXP_FRIENDLY_Thunder Bluff|r: Return to Thunder Bluff
step
    +|cRXP_WARN_Suggested next zones at level 20|r: |cRXP_FRIENDLY_The Barrens|r (about 1.0 levels of quests, starting around Tonga Runetotem). Completing this step loads the guide for The Barrens --RouteBuilder:next
step
    +|cRXP_WARN_The rest of Hillsbrad Foothills is planned from level 23.|r Load its guide for level 23 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 20 - 39 Hillsbrad Foothills
#subweight -20
#name 23-24 Hillsbrad Foothills: around Apothecary Lydon

step
    .goto 1424/0,-899.41,-6.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Lydon|r
    .accept 501 >>Accept Elixir of Pain
    .target Apothecary Lydon
step
    .goto 1424/0,-927.89,-36.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Darthalia|r
    .accept 527 >>Accept Battle of Hillsbrad
    .target High Executor Darthalia
step
    .goto 1424/0,-957.01,-40.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krusk|r
    .accept 498 >>Accept The Rescue
    .target Krusk
step << Shaman
    .goto 1424/0,-867.09,-158.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ott|r
    .vendor >> |cRXP_BUY_Buy a|r |T132408:0|t[Merciless Axe] |cRXP_BUY_from him if it's up and you don't have it yet|r
    .money <3.0195
    .target Ott
    .subzoneskip 272,1
step
    .goto 1424/0,-1486.61,-445.87
    >>Click the |cRXP_PICK_Locked ball and chain|r
    >>Kill |cRXP_ENEMY_Jailor Marlgen|r and loot |cRXP_LOOT_Burnished Gold Key|r
    >>Kill |cRXP_ENEMY_Jailor Eston|r and loot |cRXP_LOOT_Dull Iron Key|r
    .complete 498,2 --Rescue Tog'thar
    .collect 3499,1,498,1 --Burnished Gold Key (1)
    .collect 3467,1,498,1 --Dull Iron Key (1)
    .mob Jailor Marlgen
    .mob Jailor Eston
step << Rogue
    .goto 1424/0,-1497.81,-429.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kris|r
    >>|cRXP_BUY_Buy|r |T134590:0|t[|cRXP_FRIENDLY_Stalking Pants|r] |cRXP_BUY_and |T132603:0|t[|cRXP_FRIENDLY_Wolf Bracers|r] |cRXP_BUY_from her if they're up|r
    .vendor >> Vendor and Repair
    .target Kris Legace
    .money <1.1374
step << Rogue
    .goto 1424/0,-1497.81,-429.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kris|r
    >>|cRXP_BUY_Buy|r |T134590:0|t[|cRXP_FRIENDLY_Stalking Pants|r] |cRXP_BUY_from her if they're up|r
    .vendor >> Vendor and Repair
    .target Kris Legace
    .money <0.7859
step << Rogue
    .goto 1424/0,-1497.81,-429.65
    >>|cRXP_BUY_Buy|r |T132603:0|t[|cRXP_FRIENDLY_Wolf Bracers|r] |cRXP_BUY_from her if they're up|r
    .vendor >> Vendor and Repair
    .target Kris Legace
    .money <0.3515
step
    .goto 1424/0,-1343.89,-485.33
    >>Click the |cRXP_PICK_Locked ball and chain|r
    .complete 498,1 --Rescue Drull
step
    .goto 1424/0,-957.01,-40.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krusk|r
    .turnin 498 >>Turn in The Rescue
    .target Krusk
step << Undead Paladin
    .goto 1424/0,-867.09,-158.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ott|r
    .turnin 95125 >>Turn in Ott's Masterwork
    .target Ott
    .isOnQuest 95125
step
    #completewith Along7
    >>As you go: Kill |cRXP_ENEMY_Hillsbrad Farmers|r. Kill |cRXP_ENEMY_Hillsbrad Farmhands|r. |cRXP_WARN_Anything left is finished later|r
    .complete 527,1 --Hillsbrad Farmer slain (6)
    .complete 527,2 --Hillsbrad Farmhand slain (6)
    .mob Hillsbrad Farmer
    .mob Hillsbrad Farmhand
step
    #label Along7
    #loop
    .goto 1424/0,-104.53,-440.53,0
    .goto 1424/0,-104.53,-440.53,40,0
    .goto 1424/0,-59.73,-461.87,40,0
    .goto 1424/0,-59.73,-410.67,40,0
    >>Kill |cRXP_ENEMY_Farmer Getzs|r
    .complete 527,4 --Farmer Getz slain (8)
    .mob Farmer Getz
step
    #loop
    .goto 1424/0,-61.65,-417.92,0
    .goto 1424/0,-61.65,-417.92,40,0
    .goto 1424/0,-15.89,-455.25,40,0
    .goto 1424/0,-110.29,-481.92,40,0
    .goto 1424/0,-58.77,-610.35,40,0
    .goto 1424/0,-50.13,-551.89,40,0
    .goto 1424/0,96.75,-431.79,40,0
    .goto 1424/0,89.71,-352.21,40,0
    .goto 1424/0,35.95,-371.63,40,0
    .goto 1424/0,-21.97,-361.39,40,0
    >>Kill |cRXP_ENEMY_Farmer Ray|r
    >>Kill |cRXP_ENEMY_Hillsbrad Farmers|r
    >>Kill |cRXP_ENEMY_Hillsbrad Farmhands|r
    .complete 527,3 --Farmer Ray slain (1)
    .complete 527,1 --Hillsbrad Farmer slain (6)
    .complete 527,2 --Hillsbrad Farmhand slain (6)
    .mob Farmer Ray
    .mob Hillsbrad Farmer
    .mob Hillsbrad Farmhand
step
    .goto 1424/0,-927.89,-36.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Darthalia|r
    .turnin 527 >>Turn in Battle of Hillsbrad
    .accept 528 >>Accept Battle of Hillsbrad
    .target High Executor Darthalia
step
    .goto 1424/0,-920.85,-20.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Samsa|r
    .accept 546 >>Accept Souvenirs of Death
    .target Deathguard Samsa
step
    #loop
    .goto 1424/0,-66.45,-496.21,0
    .goto 1424/0,-66.45,-496.21,40,0
    .goto 1424/0,-72.21,-545.28,40,0
    .goto 1424/0,-99.41,-569.17,40,0
    .goto 1424/0,-68.69,-585.60,40,0
    .goto 1424/0,-46.29,-606.08,40,0
    .goto 1424/0,-10.45,-610.13,40,0
    .goto 1424/0,-43.41,-551.04,40,0
    >>Kill |cRXP_ENEMY_Hillsbrad Peasants|r
    .complete 528,1 --Hillsbrad Peasant slain (15)
    .mob Hillsbrad Peasant
step
    >> If your hearth is down, keep AoE farming until it's back up
    .vendor >> Buy level 25 drink from the Innkeeper once you hearthed
step
    #loop
    .goto 1424/0,-533.65,-479.57,0
    .goto 1424/0,-533.65,-479.57,40,0
    .goto 1424/0,-584.85,-489.60,40,0
    .goto 1424/0,-593.17,-553.60,40,0
    .goto 1424/0,-657.17,-545.28,40,0
    .goto 1424/0,-713.17,-547.84,40,0
    .goto 1424/0,-818.13,-462.08,40,0
    .goto 1424/0,-646.93,-450.56,40,0
    .goto 1424/0,-640.85,-369.49,40,0
    .goto 1424/0,-565.01,-356.48,40,0
    >>Kill |cRXP_ENEMY_Starving Mountain Lions|r, |cRXP_ENEMY_Feral Mountain Lions|r and |cRXP_ENEMY_Mountain Lions|r. Loot them for |cRXP_LOOT_Mountain Lion Blood|r
    .complete 501,1 --Mountain Lion Blood (1)
    .mob Starving Mountain Lion
    .mob Feral Mountain Lion
    .mob Mountain Lion
step
    .goto 1424/0,-899.41,-6.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Lydon|r
    .turnin 501 >>Turn in Elixir of Pain
    .accept 502 >>Accept Elixir of Pain
    .target Apothecary Lydon
step
    .goto 1424/0,-927.89,-36.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Darthalia|r
    .turnin 528 >>Turn in Battle of Hillsbrad while you are here
    .isQuestComplete 528
    .target High Executor Darthalia
step
    .goto 1424/0,21.55,-353.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Stanley|r
    .turnin 502 >>Turn in Elixir of Pain
    .target Stanley
step
    .goto 1424/0,-927.89,-36.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Darthalia|r
    .turnin 528 >>Turn in Battle of Hillsbrad
    .target High Executor Darthalia
step
    #loop
    .goto 1424/0,29.87,-710.40,0
    .goto 1424/0,29.87,-710.40,40,0
    .goto 1424/0,35.95,-784.21,40,0
    .goto 1424/0,61.87,-869.33,40,0
    .goto 1424/0,154.03,-885.76,40,0
    .goto 1424/0,219.63,-918.61,40,0
    .goto 1424/0,180.59,-831.79,40,0
    .goto 1424/0,127.47,-812.37,40,0
    .goto 1424/0,166.19,-691.41,40,0
    .goto 1424/0,92.27,-750.51,40,0
    >>Kill |cRXP_ENEMY_Farmer Rays|r, |cRXP_ENEMY_Syndicate Shadow Mages|r, |cRXP_ENEMY_Syndicate Rogues|r and |cRXP_ENEMY_Syndicate Watchmans|r. Loot them for |cRXP_LOOT_Hillsbrad Human Skull|r
    .complete 546,1 --Hillsbrad Human Skull (30)
    .mob Farmer Ray
    .mob Syndicate Shadow Mage
    .mob Syndicate Rogue
    .mob Syndicate Watchman
step
    .goto 1424/0,69.87,-767.57,0
    .goto 1424/0,116.59,-837.97,15,0
    .goto 1424/0,165.23,-821.76,15,0
    .goto 1424/0,219.31,-853.12,15,0
    .goto 1424/0,190.19,-866.77,15,0
    .goto 1424/0,187.31,-828.80,15,0
    .goto 1424/0,168.75,-775.89,15,0
    .goto 1424/0,160.11,-732.80,15,0
    .goto 1424/0,69.87,-767.57,15,0
    .xp 31 >> Grind to 31 in Azurelode Mine. Return to Tarren Mill if you need to restock
step
    .goto 1424/0,-967.89,-733.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathstalker Masoj|r
    .turnin 98095 >>Turn in Valuable Vantages
    .target Deathstalker Masoj
    .isOnQuest 98095
step
    .goto 1424/0,-920.85,-20.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Samsa|r
    .turnin 546 >>Turn in Souvenirs of Death
    .target Deathguard Samsa
step
    +|cRXP_WARN_The rest of Hillsbrad Foothills is planned from level 26.|r Load its guide for level 26 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 20 - 39 Hillsbrad Foothills
#subweight -20
#name 26-27 Hillsbrad Foothills: around Apothecary Lydon

step
    .goto 1424/0,-927.89,-36.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Darthalia|r
    .accept 529 >>Accept Battle of Hillsbrad
    .target High Executor Darthalia
    .isQuestTurnedIn 528 --any of: Battle of Hillsbrad
step
    .goto 1424/0,-904.53,-44.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magus Wordeen Voidglare|r
    .accept 97287 >>Accept Shrewd Negotiations
    .target Magus Wordeen Voidglare
step << Undead Paladin
    .goto 1424/0,-867.09,-158.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ott|r
    .turnin 95125 >>Turn in Ott's Masterwork
    .target Ott
    .isOnQuest 95125
step
    .goto 1424/0,42.35,-569.60
    >>Pick up |cRXP_PICK_Shipment of Iron|r from the ground
    .complete 529,3 --Shipment of Iron (1)
    .isOnQuest 529
step
    .goto 1424/0,39.15,-547.63
    >>Kill |cRXP_ENEMY_Blacksmith Verringtan|r
    .complete 529,1 --Blacksmith Verringtan slain (1)
    .mob Blacksmith Verringtan
    .isOnQuest 529
step
    #loop
    .goto 1424/0,55.15,-548.91,0
    .goto 1424/0,55.15,-548.91,40,0
    .goto 1424/0,69.23,-536.53,40,0
    .goto 1424/0,69.87,-596.69,40,0
    .goto 1424/0,43.95,-577.71,40,0
    .goto 1424/0,22.83,-562.99,40,0
    >>Kill |cRXP_ENEMY_Hillsbrad Apprentice Blacksmiths|r
    .complete 529,2 --Hillsbrad Apprentice Blacksmith slain (4)
    .mob Hillsbrad Apprentice Blacksmith
    .isOnQuest 529
step
    .goto 1424/0,-927.89,-36.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Darthalia|r
    .turnin 529 >>Turn in Battle of Hillsbrad
    .target High Executor Darthalia
    .isOnQuest 529
step
    .goto 1424/0,-899.41,-6.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Lydon|r
    .accept 509 >>Accept Elixir of Agony
    .target Apothecary Lydon
step
    .goto 1424/0,-941.65,-6.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Shay|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Shay
step
    .goto 1424/0,-967.89,-733.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathstalker Masoj|r
    .turnin 98095 >>Turn in Valuable Vantages
    .target Deathstalker Masoj
    .isOnQuest 98095
step
    #loop
    .goto 1424/0,-985.49,-881.28,0
    .goto 1424/0,-985.49,-881.28,40,0
    .goto 1424/0,-961.17,-897.28,40,0
    .goto 1424/0,-987.09,-914.56,40,0
    .goto 1424/0,-985.17,-935.68,40,0
    .goto 1424/0,-1017.17,-933.97,40,0
    .goto 1424/0,-1042.45,-912.21,40,0
    .goto 1424/0,-1028.69,-896.00,40,0
    .goto 1424/0,-1021.33,-883.63,40,0
    >>Loot the |cRXP_PICK_Mudsnout Blossoms|r for |cRXP_LOOT_Mudsnout Blossoms|r
    .complete 509,1 --Mudsnout Blossoms (6)
step
    .goto 1424/0,-899.41,-6.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Lydon|r
    .turnin 509 >>Turn in Elixir of Agony
    .accept 513 >>Accept Elixir of Agony
    .target Apothecary Lydon
step
    +|cRXP_WARN_That is all of Hillsbrad Foothills for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Alterac Mountains|r: Shrewd Negotiations
    >>|cRXP_FRIENDLY_Undercity|r: Elixir of Agony
step
    +|cRXP_WARN_The rest of Hillsbrad Foothills is planned from level 29.|r Load its guide for level 29 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 20 - 39 Hillsbrad Foothills
#subweight -20
#name 29-30 Hillsbrad Foothills: around Krusk

step
    .goto 1424/0,-935.25,-19.41
    >>Click the |cRXP_PICK_Dangerous!|r
    .accept 567 >>Accept Dangerous!
step
    .goto 1424/0,-899.41,-6.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Lydon|r
    .accept 517 >>Accept Elixir of Agony
    .target Apothecary Lydon
    .isQuestTurnedIn 515 --any of: Elixir of Agony
    .xp <24,1
step
    .goto 1424/0,22.83,-448.85
    >>Kill |cRXP_ENEMY_Citizen Wilkes|r
    .complete 567,2 --Citizen Wilkes slain (1)
    .mob Citizen Wilkes
step
    .goto 1424/0,-81.49,-593.49
    >>Kill |cRXP_ENEMY_Farmer Kalaba|r
    .complete 567,4 --Farmer Kalaba slain (1)
    .mob Farmer Kalaba
step << Undead Paladin
    .goto 1424/0,-867.09,-158.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ott|r
    .turnin 95125 >>Turn in Ott's Masterwork
    .target Ott
    .isOnQuest 95125
step
    .goto 1424/0,-927.89,-36.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Darthalia|r
    .accept 532 >>Accept Battle of Hillsbrad
    .target High Executor Darthalia
    .isQuestTurnedIn 529 --any of: Battle of Hillsbrad
step
    .goto 1424/0,-957.01,-40.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krusk|r
    .accept 533 >>Accept Infiltration
    .target Krusk
    .isQuestTurnedIn 498 --any of: The Rescue
step
    .goto 1424/0,-977.49,-19.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Novice Thaivand|r
    .accept 552 >>Accept Helcular's Revenge
    .target Novice Thaivand
step
    #loop
    .goto 1424/0,-450.13,-258.77,0
    .goto 1424/0,-450.13,-258.77,40,0
    .goto 1424/0,-382.29,-266.45,40,0
    .goto 1424/0,-358.93,-226.35,40,0
    .goto 1424/0,-377.81,-179.84,40,0
    .goto 1424/0,-353.49,-133.97,40,0
    .goto 1424/0,-321.49,-192.85,40,0
    .goto 1424/0,-285.97,-251.31,40,0
    .goto 1424/0,-279.25,-307.84,40,0
    .goto 1424/0,-417.17,-325.55,40,0
    >>Kill |cRXP_ENEMY_Cave Yetis|r and |cRXP_ENEMY_Ferocious Yetis|r. Loot them for |cRXP_LOOT_Helcular's Rod|r
    .complete 552,1 --Helcular's Rod (1)
    .mob Cave Yeti
    .mob Ferocious Yeti
step
    #completewith Along9
    >>As you go: Kill |cRXP_ENEMY_Clerk Horrace Whitesteed|r. |cRXP_WARN_Anything left is finished later|r
    .complete 567,1 --Clerk Horrace Whitesteed slain (1)
    .mob Clerk Horrace Whitesteed
step
    #label Along9
    .goto 1424/0,117.23,-488.32
    >>Kill |cRXP_ENEMY_Magistrate Burnside|r
    .complete 532,1 --Magistrate Burnside slain (1)
    .mob Magistrate Burnside
    .isOnQuest 532
step
    .goto 1424/0,122.35,-504.75
    >>Kill |cRXP_ENEMY_Clerk Horrace Whitesteed|r
    .complete 567,1 --Clerk Horrace Whitesteed slain (1)
    .mob Clerk Horrace Whitesteed
step
    .goto 1424/0,122.03,-485.97
    >>Pick up |cRXP_PICK_Hillsbrad Town Registry|r from the ground
    .complete 532,4 --Hillsbrad Town Registry (1)
    .isOnQuest 532
step
    .goto 1424/0,115.31,-490.67
    >>Click the |cRXP_PICK_Hillsbrad Proclamation|r
    .complete 532,3 --Hillsbrad Proclamation destroyed
    .isOnQuest 532
step
    #loop
    .goto 1424/0,100.59,-499.41,0
    .goto 1424/0,100.59,-499.41,40,0
    .goto 1424/0,119.79,-447.36,40,0
    .goto 1424/0,129.07,-472.11,40,0
    .goto 1424/0,123.63,-520.32,40,0
    .goto 1424/0,98.99,-529.07,40,0
    .goto 1424/0,40.75,-505.17,40,0
    >>Kill |cRXP_ENEMY_Hillsbrad Councilmans|r
    .complete 532,2 --Hillsbrad Councilman slain (8)
    .mob Hillsbrad Councilman
    .isOnQuest 532
step
    .goto 1424/0,-927.89,-36.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Darthalia|r
    .turnin 532 >>Turn in Battle of Hillsbrad
    .target High Executor Darthalia
    .isOnQuest 532
step
    .goto 1424/0,-927.89,-36.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Darthalia|r
    .accept 539 >>Accept Battle of Hillsbrad
    .target High Executor Darthalia
    .isQuestTurnedIn 532 --any of: Battle of Hillsbrad
step
    .goto 1424/0,-977.49,-19.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Novice Thaivand|r
    .turnin 552 >>Turn in Helcular's Revenge
    .target Novice Thaivand
step
    .goto 1424/0,67.95,-794.88
    >>Kill |cRXP_ENEMY_Foreman Bonds|r
    .complete 539,1 --Foreman Bonds slain (1)
    .mob Foreman Bonds
    .isOnQuest 539
step
    #loop
    .goto 1424/0,92.59,-786.56,0
    .goto 1424/0,92.59,-786.56,40,0
    .goto 1424/0,35.95,-784.21,40,0
    .goto 1424/0,29.87,-710.40,40,0
    .goto 1424/0,166.19,-691.41,40,0
    .goto 1424/0,161.07,-769.07,40,0
    .goto 1424/0,202.99,-837.76,40,0
    .goto 1424/0,140.27,-822.83,40,0
    .goto 1424/0,100.27,-846.08,40,0
    .goto 1424/0,61.87,-869.33,40,0
    >>Kill |cRXP_ENEMY_Hillsbrad Miners|r
    .complete 539,2 --Hillsbrad Miner slain (10)
    .mob Hillsbrad Miner
    .isOnQuest 539
step
    .goto 1424/0,49.07,-724.27
    >>Kill |cRXP_ENEMY_Miner Hackett|r
    .complete 567,3 --Miner Hackett slain (1)
    .mob Miner Hackett
step
    .goto 1424/0,-927.89,-36.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Darthalia|r
    .turnin 567 >>Turn in Dangerous!
    .target High Executor Darthalia
step
    .goto 1424/0,-927.89,-36.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Darthalia|r
    .turnin 539 >>Turn in Battle of Hillsbrad
    .target High Executor Darthalia
    .isOnQuest 539
step
    .goto 1424/0,-941.65,-31.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Humbert|r
    .accept 547 >>Accept Humbert's Sword
    .target Deathguard Humbert
step
    .goto 1424/0,-967.89,-733.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathstalker Masoj|r
    .turnin 98095 >>Turn in Valuable Vantages
    .target Deathstalker Masoj
    .isOnQuest 98095
step
    #loop
    .goto 1424/0,-1177.81,-1149.01,0
    .goto 1424/0,-1177.81,-1149.01,40,0
    .goto 1424/0,-1173.33,-1200.85,40,0
    .goto 1424/0,-1158.29,-1262.72,40,0
    .goto 1424/0,-1137.17,-1296.85,40,0
    .goto 1424/0,-1189.97,-1300.91,40,0
    .goto 1424/0,-1247.25,-1356.59,40,0
    .goto 1424/0,-1258.45,-1304.96,40,0
    .goto 1424/0,-1206.93,-1266.99,40,0
    .goto 1424/0,-1222.61,-1201.71,40,0
    >>Kill |cRXP_ENEMY_Dun Garok Mountaineers|r, |cRXP_ENEMY_Dun Garok Riflemans|r, |cRXP_ENEMY_Dun Garok Priests|r and |cRXP_ENEMY_Tamra Stormpikes|r. Loot them for |cRXP_LOOT_Humbert's Sword|r
    .complete 547,1 --Humbert's Sword (1)
    .mob Dun Garok Mountaineer
    .mob Dun Garok Rifleman
    .mob Dun Garok Priest
    .mob Tamra Stormpike
step
    .goto 1424/0,-1237.97,-1331.41
    >>Pick up |cRXP_PICK_Keg of Shindigger Stout|r from the ground
    .complete 517,1 --Keg of Shindigger Stout (1)
    .isOnQuest 517
step
    .goto 1424/0,-941.65,-31.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Humbert|r
    .turnin 547 >>Turn in Humbert's Sword
    .target Deathguard Humbert
step
    .goto 1424/0,-957.01,-40.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krusk|r
    .accept 507 >>Accept Lord Aliden Perenolde
    .target Krusk
    .isQuestTurnedIn 506 --any of: Blackmoore's Legacy
    .xp <29,1
step
    .goto 1424/0,-957.01,-40.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krusk|r
    .turnin 533 >>Turn in Infiltration
    .target Krusk
    .isQuestComplete 533
step
    .goto 1424/0,-957.01,-40.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krusk|r
    .accept 503 >>Accept Gol'dir
    .target Krusk
    .isQuestTurnedIn 533 --any of: Infiltration
    .xp <29,1
step
    .goto 1424/0,-899.41,-6.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Lydon|r
    .turnin 517 >>Turn in Elixir of Agony
    .target Apothecary Lydon
    .isOnQuest 517
step
    .goto 1424/0,-899.41,-6.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Lydon|r
    .accept 524 >>Accept Elixir of Agony
    .target Apothecary Lydon
    .isQuestTurnedIn 517 --any of: Elixir of Agony
    .xp <24,1
step
    .goto 1424/0,-943.25,0.43
    >>Click the |cRXP_PICK_Dusty Rug|r
    .turnin 524 >>Turn in Elixir of Agony
    .isOnQuest 524
step
    +|cRXP_WARN_That is all of Hillsbrad Foothills for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Alterac Mountains|r: Gol'dir, Lord Aliden Perenolde
    >>|cRXP_FRIENDLY_Alterac Mountains and back here|r: Infiltration
step
    +|cRXP_WARN_The rest of Hillsbrad Foothills is planned from level 32.|r Load its guide for level 32 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 20 - 39 Hillsbrad Foothills
#subweight -20
#name 32-33 Hillsbrad Foothills: around Magus Wordeen Voidglare

step
    .goto 1424/0,-904.53,-44.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magus Wordeen Voidglare|r
    .accept 93680 >>Accept Key to the City
    .accept 92434 >>Accept Blood in the Streets
    .accept 544 >>Accept Prison Break In
    .target Magus Wordeen Voidglare
step
    .goto 1424/0,-901.33,-46.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Keeper Bel'varil|r
    .accept 556 >>Accept Stone Tokens
    .target Keeper Bel'varil
step
    .goto 1424/0,-927.89,-36.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Darthalia|r
    .accept 541 >>Accept Battle of Hillsbrad
    .target High Executor Darthalia
    .isQuestTurnedIn 539 --any of: Battle of Hillsbrad
step
    .goto 1424/0,-957.01,-40.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krusk|r
    .turnin 533 >>Turn in Infiltration
    .target Krusk
    .isQuestComplete 533
step
    .goto 1424/0,-913.17,-17.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tallow|r
    .accept 676 >>Accept The Hammer May Fall
    .target Tallow
step
    .goto 1424/0,-977.49,-19.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Novice Thaivand|r
    .accept 553 >>Accept Helcular's Revenge
    .target Novice Thaivand
    .isQuestTurnedIn 552 --any of: Helcular's Revenge
step
    .goto 1424/0,-957.01,-40.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krusk|r
    .accept 1361 >>Accept Regthar Deathgate
    .target Krusk
step << Undead Paladin
    .goto 1424/0,-867.09,-158.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ott|r
    .turnin 95125 >>Turn in Ott's Masterwork
    .target Ott
    .isOnQuest 95125
step
    .goto 1424/0,-967.89,-733.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathstalker Masoj|r
    .turnin 98095 >>Turn in Valuable Vantages
    .target Deathstalker Masoj
    .isOnQuest 98095
step
    #completewith Drop635x1
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Cave Yeti|r, |cRXP_ENEMY_Ferocious Yeti|r, |cRXP_ENEMY_Captain Ironhill|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #loop
    .goto 1424/0,-1177.81,-1149.01,0
    .goto 1424/0,-1177.81,-1149.01,40,0
    .goto 1424/0,-1173.33,-1200.85,40,0
    .goto 1424/0,-1158.29,-1262.72,40,0
    .goto 1424/0,-1137.17,-1296.85,40,0
    .goto 1424/0,-1189.97,-1300.91,40,0
    .goto 1424/0,-1262.61,-1334.83,40,0
    .goto 1424/0,-1258.45,-1304.96,40,0
    .goto 1424/0,-1242.13,-1285.97,40,0
    .goto 1424/0,-1206.93,-1266.99,40,0
    >>Kill |cRXP_ENEMY_Dun Garok Mountaineers|r
    .complete 541,1 --Dun Garok Mountaineer slain (8)
    .mob Dun Garok Mountaineer
    .isOnQuest 541
step
    #loop
    .goto 1424/0,-1220.69,-1310.72,0
    .goto 1424/0,-1220.69,-1310.72,40,0
    .goto 1424/0,-1223.89,-1335.68,40,0
    .goto 1424/0,-1257.17,-1311.57,40,0
    .goto 1424/0,-1222.61,-1201.71,40,0
    .goto 1424/0,-1172.37,-1232.64,40,0
    .goto 1424/0,-1173.97,-1293.65,40,0
    .goto 1424/0,-1195.09,-1276.80,40,0
    .goto 1424/0,-1221.01,-1276.59,40,0
    >>Kill |cRXP_ENEMY_Dun Garok Riflemans|r
    .complete 541,2 --Dun Garok Rifleman slain (8)
    .mob Dun Garok Rifleman
    .isOnQuest 541
step
    #loop
    .goto 1424/0,-1230.29,-1316.27,0
    .goto 1424/0,-1230.29,-1316.27,40,0
    .goto 1424/0,-1258.45,-1320.96,40,0
    .goto 1424/0,-1240.21,-1307.73,40,0
    .goto 1424/0,-1195.73,-1216.64,40,0
    >>Kill |cRXP_ENEMY_Dun Garok Priests|r
    .complete 541,3 --Dun Garok Priest slain (2)
    .mob Dun Garok Priest
    .isOnQuest 541
step
    #label Drop635x1
    .goto 1424/0,-1255.89,-1307.31
    >>Kill |cRXP_ENEMY_Captain Ironhills|r
    .complete 541,4 --Captain Ironhill slain (8)
    .mob Captain Ironhill
    .isOnQuest 541
step
    .goto 1424/0,-927.89,-36.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Darthalia|r
    .turnin 541 >>Turn in Battle of Hillsbrad
    .target High Executor Darthalia
    .isOnQuest 541
step
    .goto 1424/0,-927.89,-36.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Darthalia|r
    .accept 550 >>Accept Battle of Hillsbrad
    .target High Executor Darthalia
    .isQuestTurnedIn 541 --any of: Battle of Hillsbrad
step
    .goto 1424/0,-901.33,-46.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Keeper Bel'varil|r
    .turnin 556 >>Turn in Stone Tokens
    .target Keeper Bel'varil
    .isQuestComplete 556
step
    .goto 1424/0,-904.53,-44.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magus Wordeen Voidglare|r
    .turnin 93680 >>Turn in Key to the City
    .target Magus Wordeen Voidglare
    .isQuestComplete 93680
step
    .goto 1424/0,-904.53,-44.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magus Wordeen Voidglare|r
    .turnin 544 >>Turn in Prison Break In
    .target Magus Wordeen Voidglare
    .isQuestComplete 544
step
    .goto 1424/0,-342.93,-166.40
    >>Click the |cRXP_PICK_Flame of Veraz|r
    .complete 553,2 --Flame of Veraz charged
    .isOnQuest 553
step
    .goto 1424/0,-337.81,-198.61
    >>Click the |cRXP_PICK_Flame of Azel|r
    .complete 553,1 --Flame of Azel charged
    .isOnQuest 553
step
    .goto 1424/0,-621.33,-738.56
    >>Click the |cRXP_PICK_Helcular's Grave|r
    .turnin 553 >>Turn in Helcular's Revenge
    .isQuestComplete 553
step
    .goto 1424/0,-901.33,-46.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Keeper Bel'varil|r
    .accept 557 >>Accept Bracers of Binding
    .target Keeper Bel'varil
    .isQuestTurnedIn 556 --any of: Stone Tokens
    .xp <30,1
step
    .goto 1424/0,-904.53,-44.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magus Wordeen Voidglare|r
    .accept 545 >>Accept Dalaran Patrols
    .target Magus Wordeen Voidglare
    .isQuestTurnedIn 544 --any of: Prison Break In
    .xp <30,1
step
    .goto 1424/0,-901.33,-46.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Keeper Bel'varil|r
    .turnin 557 >>Turn in Bracers of Binding
    .target Keeper Bel'varil
    .isQuestComplete 557
step
    .goto 1424/0,-904.53,-44.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magus Wordeen Voidglare|r
    .turnin 545 >>Turn in Dalaran Patrols
    .target Magus Wordeen Voidglare
    .isQuestComplete 545
step
    +|cRXP_WARN_That is all of Hillsbrad Foothills for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Arathi Highlands|r: The Hammer May Fall, Crystal in the Mountains
    >>|cRXP_FRIENDLY_Silverpine Forest|r: Blood in the Streets
    >>|cRXP_FRIENDLY_The Barrens|r: Regthar Deathgate
    >>|cRXP_FRIENDLY_Undercity|r: Battle of Hillsbrad
    >>|cRXP_FRIENDLY_Alterac Mountains and back here|r: Stone Tokens, Helcular's Revenge, Prison Break In
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Key to the City
step
    +|cRXP_WARN_The rest of Hillsbrad Foothills is planned from level 35.|r Load its guide for level 35 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 20 - 39 Hillsbrad Foothills
#subweight -20
#name 35-36 Hillsbrad Foothills

step
    .goto 1424/0,-937.49,-40.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Melisara|r
    .accept 518 >>Accept The Crown of Will
    .target Melisara
step
    .goto 1424/0,-937.49,-40.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Melisara|r
    .turnin 518 >>Turn in The Crown of Will
    .target Melisara
    .isQuestComplete 518
step
    .goto 1424/0,-937.49,-40.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Melisara|r
    .accept 520 >>Accept The Crown of Will
    .target Melisara
    .isQuestTurnedIn 519 --any of: The Crown of Will
    .xp <34,1
step
    .goto 1424/0,-937.49,-40.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Melisara|r
    .accept 519 >>Accept The Crown of Will
    .target Melisara
    .isQuestTurnedIn 518 --any of: The Crown of Will
    .xp <34,1
step
    .goto 1424/0,-937.49,-40.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Melisara|r
    .accept 521 >>Accept The Crown of Will
    .target Melisara
    .isQuestTurnedIn 520 --any of: The Crown of Will
    .xp <34,1
step
    .goto 1424/0,-901.33,-46.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Keeper Bel'varil|r
    .turnin 556 >>Turn in Stone Tokens
    .target Keeper Bel'varil
    .isQuestComplete 556
step
    .goto 1424/0,-904.53,-44.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magus Wordeen Voidglare|r
    .turnin 93680 >>Turn in Key to the City
    .target Magus Wordeen Voidglare
    .isQuestComplete 93680
step
    .goto 1424/0,-904.53,-44.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magus Wordeen Voidglare|r
    .turnin 544 >>Turn in Prison Break In
    .target Magus Wordeen Voidglare
    .isQuestComplete 544
step
    .goto 1424/0,-957.01,-40.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krusk|r
    .turnin 533 >>Turn in Infiltration
    .target Krusk
    .isQuestComplete 533
step
    .goto 1424/0,-937.49,-40.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Melisara|r
    .turnin 519 >>Turn in The Crown of Will
    .target Melisara
    .isQuestComplete 519
step
    .goto 1424/0,-937.49,-40.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Melisara|r
    .turnin 520 >>Turn in The Crown of Will
    .target Melisara
    .isQuestComplete 520
step << Undead Paladin
    .goto 1424/0,-867.09,-158.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ott|r
    .turnin 95125 >>Turn in Ott's Masterwork
    .target Ott
    .isOnQuest 95125
step
    .goto 1424/0,-342.93,-166.40
    >>Click the |cRXP_PICK_Flame of Veraz|r
    .complete 553,2 --Flame of Veraz charged
    .isOnQuest 553
step
    .goto 1424/0,-337.81,-198.61
    >>Click the |cRXP_PICK_Flame of Azel|r
    .complete 553,1 --Flame of Azel charged
    .isOnQuest 553
step
    .goto 1424/0,-621.33,-738.56
    >>Click the |cRXP_PICK_Helcular's Grave|r
    .turnin 553 >>Turn in Helcular's Revenge
    .isQuestComplete 553
step
    .goto 1424/0,-967.89,-733.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathstalker Masoj|r
    .turnin 98095 >>Turn in Valuable Vantages
    .target Deathstalker Masoj
    .isOnQuest 98095
step
    +|cRXP_WARN_That is all of Hillsbrad Foothills for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Undercity|r: The Crown of Will
    >>|cRXP_FRIENDLY_Alterac Mountains and back here|r: The Crown of Will
step
    +|cRXP_WARN_The rest of Hillsbrad Foothills is planned from level 38.|r Load its guide for level 38 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 20 - 39 Hillsbrad Foothills
#subweight -20
#name 38-39 Hillsbrad Foothills

step
    .goto 1424/0,-937.49,-42.67
    >>Click the |cRXP_PICK_WANTED|r
    .accept 566 >>Accept WANTED: Baron Vardus
    .isQuestTurnedIn 549 --any of: WANTED: Syndicate Personnel
step
    .goto 1424/0,-937.49,-40.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Melisara|r
    .turnin 518 >>Turn in The Crown of Will
    .target Melisara
    .isQuestComplete 518
step
    .goto 1424/0,-927.89,-36.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Darthalia|r
    .turnin 566 >>Turn in WANTED: Baron Vardus
    .target High Executor Darthalia
    .isQuestComplete 566
step
    .goto 1424/0,-904.53,-44.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magus Wordeen Voidglare|r
    .turnin 93680 >>Turn in Key to the City
    .target Magus Wordeen Voidglare
    .isQuestComplete 93680
step
    .goto 1424/0,-901.33,-46.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Keeper Bel'varil|r
    .turnin 556 >>Turn in Stone Tokens
    .target Keeper Bel'varil
    .isQuestComplete 556
step
    .goto 1424/0,-904.53,-44.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magus Wordeen Voidglare|r
    .turnin 544 >>Turn in Prison Break In
    .target Magus Wordeen Voidglare
    .isQuestComplete 544
step
    .goto 1424/0,-957.01,-40.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krusk|r
    .turnin 533 >>Turn in Infiltration
    .target Krusk
    .isQuestComplete 533
step << Undead Paladin
    .goto 1424/0,-867.09,-158.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ott|r
    .turnin 95125 >>Turn in Ott's Masterwork
    .target Ott
    .isOnQuest 95125
step
    .goto 1424/0,-342.93,-166.40
    >>Click the |cRXP_PICK_Flame of Veraz|r
    .complete 553,2 --Flame of Veraz charged
    .isOnQuest 553
step
    .goto 1424/0,-337.81,-198.61
    >>Click the |cRXP_PICK_Flame of Azel|r
    .complete 553,1 --Flame of Azel charged
    .isOnQuest 553
step
    .goto 1424/0,-621.33,-738.56
    >>Click the |cRXP_PICK_Helcular's Grave|r
    .turnin 553 >>Turn in Helcular's Revenge
    .isQuestComplete 553
step
    .goto 1424/0,-967.89,-733.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathstalker Masoj|r
    .turnin 98095 >>Turn in Valuable Vantages
    .target Deathstalker Masoj
    .isOnQuest 98095
step
    +|cRXP_WARN_End of the Hillsbrad Foothills route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Alterac Mountains and back here|r: WANTED: Baron Vardus
]])
