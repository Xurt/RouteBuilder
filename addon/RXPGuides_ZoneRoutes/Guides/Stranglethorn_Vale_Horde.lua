-- 30-50 Stranglethorn Vale: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 8 parts (from level 30, 33, 36, 39, 42, 45, 48, 51).
-- Split into 8 guides, listed under "30 - 52 Stranglethorn Vale" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Stranglethorn Vale.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 30 - 52 Stranglethorn Vale
#subweight -30
#name 30-31 Stranglethorn Vale: around Barnil Stonepot

step
    .goto 1434/0,415.58,-14469.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drizzlik|r
    .accept 575 >>Accept Supply and Demand
    .target Drizzlik
step
    .goto 1434/0,459.61,-14464.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Scooty|r
    .turnin 2842 >>Turn in Chief Engineer Scooty
    .target Scooty
    .isOnQuest 2842
step
    .goto 1434/0,487.05,-14444.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fleet Master Seahorn|r
    .turnin 669 >>Turn in Sunken Treasure
    .target Fleet Master Seahorn
    .isOnQuest 669
step
    .goto 1434/0,501.09,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krazek|r
    .turnin 1115 >>Turn in The Rumormonger
    .target Krazek
    .isOnQuest 1115
step
    .goto 1434/0,501.09,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krazek|r
    .accept 201 >>Accept Investigate the Camp
    .target Krazek
step
    .goto 1434/0,539.37,-14298.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wharfmaster Lozgil|r
    .turnin 1180 >>Turn in Goblin Sponsorship
    .target Wharfmaster Lozgil
    .isOnQuest 1180
step
    .goto 1434/0,-54.08,-11619.27
    >>Locate the hunters' camp
    .complete 201,1 --Locate the hunters' camp
step << Mage
    .goto 1434/0,211.38,-12434.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Thulbek|r
    .target Innkeeper Thulbek
    .train 3567,3
step
    .goto 1434/0,-54.72,-11616.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barnil Stonepot|r
    .accept 583 >>Accept Welcome to the Jungle
    .target Barnil Stonepot
step
    .goto 1434/0,-54.72,-11628.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hemet Nesingwary|r
    .turnin 583 >>Turn in Welcome to the Jungle
    .target Hemet Nesingwary
step
    .goto 1434/0,-54.72,-11628.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hemet Nesingwary|r
    .turnin 5762 >>Turn in Hemet Nesingwary
    .target Hemet Nesingwary
    .isOnQuest 5762
step
    .goto 1434/0,-54.72,-11628.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hemet Nesingwary|r
    .turnin 5763 >>Turn in Hunting in Stranglethorn
    .target Hemet Nesingwary
    .isOnQuest 5763
step
    .goto 1434/0,-52.17,-11620.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ajeck Rouack|r
    .accept 185 >>Accept Tiger Mastery
    .target Ajeck Rouack
step
    .goto 1434/0,-47.70,-11617.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sir S. J. Erlgadin|r
    .accept 190 >>Accept Panther Mastery
    .target Sir S. J. Erlgadin
step
    #completewith Along13
    >>As you go: Kill |cRXP_ENEMY_River Crocolisks|r. Loot them for |cRXP_LOOT_Large River Crocolisk Skin|r. |cRXP_WARN_Anything left is finished later|r
    .complete 575,1 --Large River Crocolisk Skin (2)
    .mob River Crocolisk
step
    #label Along13
    #loop
    .goto 1434/0,-445.25,-11711.16,0
    .goto 1434/0,-445.25,-11711.16,40,0
    .goto 1434/0,-463.76,-11600.12,40,0
    >>Kill |cRXP_ENEMY_Young Panthers|r
    .complete 190,1 --Young Panther slain (10)
    .mob Young Panther
step
    #loop
    .goto 1434/0,-38.13,-11704.77,0
    .goto 1434/0,-38.13,-11704.77,40,0
    .goto 1434/0,63.97,-11696.27,40,0
    >>Kill |cRXP_ENEMY_Young Stranglethorn Tigers|r
    .complete 185,1 --Young Stranglethorn Tiger slain (10)
    .mob Young Stranglethorn Tiger
step
    .goto 1434/0,-47.70,-11617.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sir S. J. Erlgadin|r
    .turnin 190 >>Turn in Panther Mastery while you are here
    .isQuestComplete 190
    .target Sir S. J. Erlgadin
step
    .goto 1434/0,-52.17,-11620.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ajeck Rouack|r
    .turnin 185 >>Turn in Tiger Mastery
    .accept 186 >>Accept Tiger Mastery
    .target Ajeck Rouack
step
    .goto 1434/0,-47.70,-11617.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sir S. J. Erlgadin|r
    .turnin 190 >>Turn in Panther Mastery
    .accept 191 >>Accept Panther Mastery
    .target Sir S. J. Erlgadin
step
    #loop
    .goto 1434/0,268.17,-11577.15,0
    .goto 1434/0,268.17,-11577.15,40,0
    .goto 1434/0,268.17,-11679.25,40,0
    .goto 1434/0,284.76,-11817.08,40,0
    >>Kill |cRXP_ENEMY_Panthers|r
    >>Kill |cRXP_ENEMY_Stranglethorn Tigers|r
    .complete 191,1 --Panther slain (10)
    .complete 186,1 --Stranglethorn Tiger slain (10)
    .mob Panther
    .mob Stranglethorn Tiger
step
    .goto 1434/0,-47.70,-11617.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sir S. J. Erlgadin|r
    .turnin 191 >>Turn in Panther Mastery
    .target Sir S. J. Erlgadin
step
    .goto 1434/0,-52.17,-11620.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ajeck Rouack|r
    .turnin 186 >>Turn in Tiger Mastery
    .target Ajeck Rouack
step
    .xp 30 >>Grind to level 30 (The Green Hills of Stranglethorn needs it)
step
    .goto 1434/0,-54.72,-11616.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barnil Stonepot|r
    .accept 338 >>Accept The Green Hills of Stranglethorn
    .target Barnil Stonepot
step
    #loop
    .goto 1434/0,-130.66,-11615.86,0
    .goto 1434/0,-130.66,-11615.86,40,0
    .goto 1434/0,-249.99,-11650.32,40,0
    .goto 1434/0,-53.44,-11513.34,40,0
    >>Kill |cRXP_ENEMY_River Crocolisks|r. Loot them for |cRXP_LOOT_Large River Crocolisk Skin|r
    .complete 575,1 --Large River Crocolisk Skin (2)
    .mob River Crocolisk
step
    .goto 1434/0,-54.72,-11616.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barnil Stonepot|r
    .turnin 338 >>Turn in The Green Hills of Stranglethorn
    .target Barnil Stonepot
    .isQuestComplete 338
step
    .goto 1434/0,539.37,-14298.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wharfmaster Lozgil|r
    .accept 1181 >>Accept Goblin Sponsorship
    .target Wharfmaster Lozgil
    .isQuestTurnedIn 1180 --any of: Goblin Sponsorship
    .xp <29,1
step
    .goto 1434/0,501.09,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krazek|r
    .turnin 201 >>Turn in Investigate the Camp
    .target Krazek
step
    .goto 1434/0,501.09,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krazek|r
    .accept 1117 >>Accept Rumors for Kravel
    .target Krazek
    .isQuestTurnedIn 1116 --any of: Dream Dust in the Swamp
    .xp <30,1
step
    .goto 1434/0,501.09,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krazek|r
    .accept 1116 >>Accept Dream Dust in the Swamp
    .target Krazek
    .isQuestTurnedIn 1115 --any of: The Rumormonger
    .xp <30,1
step << Rogue
    .goto 1434/0,509.38,-14450.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ian|r on the second floor of the inn
    .train 8691 >> Train your class spells
    >>|T132273:0|t[Instant Poison Rank 3] |cRXP_WARN_requires 160 skill in Poisons!|r
    .target Ian Strom
    .xp <36,1
    .xp >38,1
step << Rogue
    .goto 1434/0,509.38,-14450.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ian|r on the second floor of the inn
    .train 8621 >> Train your class spells
    >>|T132273:0|t[Instant Poison Rank 3] |cRXP_WARN_requires 160 skill in Poisons!|r
    .target Ian Strom
    .xp <38,1
step
    .goto 1434/0,483.22,-14438.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baron Revilgaz|r
    .turnin 1181 >>Turn in Goblin Sponsorship
    .target Baron Revilgaz
    .isOnQuest 1181
step
    .goto 1434/0,415.58,-14469.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drizzlik|r
    .turnin 575 >>Turn in Supply and Demand
    .target Drizzlik
step
    .goto 1434/0,425.15,-14491.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_Talk to|r |cRXP_FRIENDLY_Glyx|r
    .vendor >> |cRXP_BUY_Buy|r |T134832:0|t[Greater Healing Potions] |cRXP_BUY_from him if they're up|r
    .target Glyx Brewright
    .subzoneskip 35,1
step << Rogue
    .goto 1434/0,408.56,-14437.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sly|r
    .vendor >>|cRXP_BUY_Stock up on|r |T134387:0|t[Flash Powder] |cRXP_BUY_and|r |T132273:0|t[Poisons]
    .target Sly Garret
    .subzoneskip 35,1
step
    .goto 1434/0,161.60,-12347.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kin'weelay|r
    .turnin 1240 >>Turn in The Troll Witchdoctor
    .target Kin'weelay
    .isOnQuest 1240
step
    .goto 1434/0,212.02,-12434.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Thulbek|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Thulbek
    .subzoneskip 117,1
step
    .goto 1434/0,164.79,-12342.90
    >>Click the |cRXP_PICK_Bubbling Cauldron|r
    .accept 1261 >>Accept Marg Speaks
    .isQuestTurnedIn 1240 --any of: The Troll Witchdoctor
    .xp <30,1
step << Warlock
    .goto 1434/0,-26.64,-13328.16
    >>Open the |cRXP_PICK_Solid Chest|r. Loot it for |cRXP_LOOT_Gold Bar|r
    .complete 4781,1 --Gold Bar (1)
    .isOnQuest 4781
step
    .goto 1434/0,411.11,-14416.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Oglethorpe Obnoticus|r
    .turnin 2767 >>Turn in Rescue OOX-22/FE!
    .target Oglethorpe Obnoticus
    .isQuestComplete 2767
step
    .goto 1434/0,490.24,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Crank Fizzlebub|r
    .turnin 1118 >>Turn in Back to Booty Bay
    .target Crank Fizzlebub
    .isOnQuest 1118
step
    .hs >>Hearth to Camp Mojache
    .zoneskip Feralas
step
    .goto 1434/0,411.11,-14416.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Oglethorpe Obnoticus|r
    .turnin 648 >>Turn in Rescue OOX-17/TN!
    .target Oglethorpe Obnoticus
    .isQuestComplete 648
step
    .goto 1434/0,411.11,-14416.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Oglethorpe Obnoticus|r
    .turnin 836 >>Turn in Rescue OOX-09/HL!
    .target Oglethorpe Obnoticus
    .isQuestComplete 836
step << Warlock
    .goto 1434/0,388.78,-14439.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Xizk Goodstitch|r
    .turnin 4781 >>Turn in Components for the Enchanted Gold Bloodrobe
    .target Xizk Goodstitch
    .isOnQuest 4781
step
    .goto 1434/0,448.12,-14447.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Sea Wolf" MacKinley|r
    .turnin 2874 >>Turn in Deliver to MacKinley
    .target "Sea Wolf" MacKinley
    .isOnQuest 2874
step
    .goto 1434/0,490.24,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Crank Fizzlebub|r
    .turnin 1122 >>Turn in Report Back to Fizzlebub
    .target Crank Fizzlebub
    .isOnQuest 1122
step
    .goto 1434/0,495.34,-14451.69,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nixxrax|r
    >>|cRXP_WARN_If you didn't get|r |T133974:0|t[Barbecued Buzzard Wings] |cRXP_WARN_earlier (and none of your group members do either), then skip this step. You need 10 wings in total to summon|r |cRXP_ENEMY_Negolash|r
    .vendor >>Buy |cRXP_BUY_Junglevine Wine|r from |cRXP_FRIENDLY_Nixxrax|r
    .collect 4457,10
    .collect 4595,5
    .target Nixxrax Fillamug
    .isOnQuest 8554
step << Rogue
    .goto 1434/0,509.38,-14450.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ian|r on the second floor of the inn
    .train 8643 >> Train your class spells
    .target Ian Strom
    .xp <50,1
    .xp >52,1
step << Rogue
    .goto 1434/0,509.38,-14450.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ian|r on the second floor of the inn
    .train 11342 >> Train your class spells
    .target Ian Strom
    .xp <52,1
step
    .goto 1434/0,501.09,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krazek|r
    .turnin 1116 >>Turn in Dream Dust in the Swamp
    .target Krazek
    .isQuestComplete 1116
step
    +|cRXP_WARN_That is all of Stranglethorn Vale for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Dustwallow Marsh|r: Marg Speaks
    >>|cRXP_FRIENDLY_Thousand Needles|r: Rumors for Kravel
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: The Green Hills of Stranglethorn
step
    +|cRXP_WARN_The rest of Stranglethorn Vale is planned from level 33.|r Load its guide for level 33 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 30 - 52 Stranglethorn Vale
#subweight -30
#name 33-34 Stranglethorn Vale: around Kebok

step
    .goto 1434/0,-421.00,-13334.12
    >>Click the |cRXP_PICK_Research Notes|r
    .accept 79535 >>Accept Basilisks: Should Petrification be Feared?
step
    .goto 1434/0,-427.39,-13334.12
    >>Open the |cRXP_PICK_Research Notes|r. Loot it for |cRXP_LOOT_Basilisks: Should Petrification be Feared?|r
    .complete 79535,1 --Basilisks: Should Petrification be Feared? (1)
step << Warlock
    .goto 1434/0,388.78,-14439.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Xizk Goodstitch|r
    .accept 4782 >>Accept Components for the Enchanted Gold Bloodrobe
    .target Xizk Goodstitch
    .isQuestTurnedIn 4781 --any of: Components for the Enchanted Gold Bloodrobe
    .xp <31,1
step
    .goto 1434/0,459.61,-14464.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Scooty|r
    .accept 2843 >>Accept Gnomer-gooooone!
    .target Scooty
    .isQuestTurnedIn 2842 --any of: Chief Engineer Scooty
    .xp <20,1
step
    .goto 1434/0,459.61,-14464.88
    >>Wait for Scooty to calibrate the Goblin Transponder.
    .complete 2843,1 --Scooty
    .target Scooty
    .isOnQuest 2843
step
    .goto 1434/0,459.61,-14464.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Scooty|r
    .turnin 2843 >>Turn in Gnomer-gooooone!
    .target Scooty
    .isOnQuest 2843
step << Warrior/Shaman
    .goto 1434/0,412.39,-14378.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_Talk to|r |cRXP_FRIENDLY_Zarena|r
    .vendor >>|cRXP_BUY_Buy a|r |T135158:0|t[Big Stick] |cRXP_BUY_or a|r |T135144:0|t[Staff of Protection] |cRXP_BUY_from her if one of them is available|r
    .money <5.3896
    .target Zarena Cromwind
step
    .goto 1434/0,490.24,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Crank Fizzlebub|r
    .accept 605 >>Accept Singing Blue Shards
    .target Crank Fizzlebub
step << Rogue
    .goto 1434/0,509.38,-14450.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ian|r on the second floor of the inn
    .train 8696 >> Train your class spells
    .target Ian Strom
    .xp <34,1
    .xp >36,1
step << Rogue
    .goto 1434/0,509.38,-14450.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ian|r on the second floor of the inn
    .train 8691 >> Train your class spells
    >>|T132273:0|t[Instant Poison Rank 3] |cRXP_WARN_requires 160 skill in Poisons!|r
    .target Ian Strom
    .xp <36,1
step
    .goto 1434/0,497.90,-14449.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kebok|r
    .accept 189 >>Accept Bloodscalp Ears
    .accept 213 >>Accept Hostile Takeover
    .target Kebok
step
    .goto 1434/0,504.28,-14448.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gringer|r around the corner of the balcony
    .fp Booty Bay >> Get the Booty Bay flight path
    .target Gringer
    .subzoneskip 35,1
step
    .goto 1434/0,211.38,-12434.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Thulbek|r
    .target Innkeeper Thulbek
    .home >>Set your Hearthstone to Innkeeper Thulbek's inn
step
    .goto 1434/0,167.99,-12398.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Aggro'gosh|r
    .accept 568 >>Accept The Defense of Grom'gol
    .target Commander Aggro'gosh
step
    .goto 1434/0,161.60,-12347.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kin'weelay|r
    .accept 596 >>Accept Bloody Bone Necklaces
    .target Kin'weelay
step
    .goto 1434/0,168.62,-12348.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nimboya|r
    .accept 581 >>Accept Hunt for Yenniku
    .target Nimboya
step
    .goto 1434/0,-54.72,-11628.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hemet Nesingwary|r
    .accept 194 >>Accept Raptor Mastery
    .target Hemet Nesingwary
    .isQuestTurnedIn 583 --any of: Welcome to the Jungle
step
    .goto 1434/0,-54.72,-11616.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barnil Stonepot|r
    .turnin 338 >>Turn in The Green Hills of Stranglethorn
    .target Barnil Stonepot
    .isQuestComplete 338
step
    #completewith Along14
    >>As you go: Kill |cRXP_ENEMY_Stone Maw Basilisks|r, |cRXP_ENEMY_Crystal Spine Basilisks|r, |cRXP_ENEMY_Cold Eye Basilisks|r and |cRXP_ENEMY_Thrashtail Basilisks|r. Loot them for |cRXP_LOOT_Singing Crystal Shard|r. |cRXP_WARN_Anything left is finished later|r
    .complete 605,1 --Singing Crystal Shard (10)
    .mob Stone Maw Basilisk
    .mob Crystal Spine Basilisk
    .mob Cold Eye Basilisk
    .mob Thrashtail Basilisk
step
    #label Along14
    #loop
    .goto 1434/0,447.48,-11777.95,0
    .goto 1434/0,447.48,-11777.95,40,0
    .goto 1434/0,513.85,-11917.91,40,0
    .goto 1434/0,678.49,-11856.22,40,0
    >>Kill |cRXP_ENEMY_Stranglethorn Raptors|r
    .complete 194,1 --Stranglethorn Raptor slain (10)
    .mob Stranglethorn Raptor
    .isOnQuest 194
step
    .goto 1434/0,-52.17,-11620.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ajeck Rouack|r
    .accept 187 >>Accept Tiger Mastery
    .target Ajeck Rouack
    .isQuestTurnedIn 186 --any of: Tiger Mastery
step
    .goto 1434/0,-54.72,-11628.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hemet Nesingwary|r
    .turnin 194 >>Turn in Raptor Mastery
    .target Hemet Nesingwary
    .isOnQuest 194
step
    .goto 1434/0,-54.72,-11628.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hemet Nesingwary|r
    .accept 195 >>Accept Raptor Mastery
    .target Hemet Nesingwary
    .isQuestTurnedIn 194 --any of: Raptor Mastery
step
    #completewith Drop635x1
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Bloodscalp Warrior|r, |cRXP_ENEMY_Bloodscalp Scout|r, |cRXP_ENEMY_Bloodscalp Hunter|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #label Drop635x1
    #loop
    .goto 1434/0,55.68,-11844.31,0
    .goto 1434/0,55.68,-11844.31,40,0
    .goto 1434/0,224.14,-11717.11,40,0
    .goto 1434/0,338.36,-12004.69,40,0
    .goto 1434/0,270.09,-11938.33,40,0
    >>Kill |cRXP_ENEMY_Bloodscalp Warriors|r, |cRXP_ENEMY_Bloodscalp Scouts|r, |cRXP_ENEMY_Bloodscalp Hunters|r and |cRXP_ENEMY_Bloodscalp Berserkers|r. Loot them for |cRXP_LOOT_Bloodscalp Tusk|r
    >>Kill |cRXP_ENEMY_Bloodscalp Warriors|r, |cRXP_ENEMY_Bloodscalp Scouts|r, |cRXP_ENEMY_Bloodscalp Hunters|r and |cRXP_ENEMY_Bloodscalp Berserkers|r. Loot them for |cRXP_LOOT_Bloodscalp Ear|r
    >>Kill |cRXP_ENEMY_Bloodscalp Warriors|r, |cRXP_ENEMY_Bloodscalp Scouts|r, |cRXP_ENEMY_Bloodscalp Hunters|r and |cRXP_ENEMY_Bloodscalp Berserkers|r. Loot them for |cRXP_LOOT_Bloody Bone Necklace|r
    .complete 581,1 --Bloodscalp Tusk (9)
    .complete 189,1 --Bloodscalp Ear (15)
    .complete 596,1 --Bloody Bone Necklace (25)
    .mob Bloodscalp Warrior
    .mob Bloodscalp Scout
    .mob Bloodscalp Hunter
    .mob Bloodscalp Berserker
step
    #loop
    .goto 1434/0,173.09,-11976.62,0
    .goto 1434/0,173.09,-11976.62,40,0
    .goto 1434/0,81.20,-11947.69,40,0
    >>Kill |cRXP_ENEMY_Elder Stranglethorn Tigers|r
    .complete 187,1 --Elder Stranglethorn Tiger slain (10)
    .mob Elder Stranglethorn Tiger
    .isOnQuest 187
step
    #loop
    .goto 1434/0,146.93,-12079.99,0
    .goto 1434/0,146.93,-12079.99,40,0
    .goto 1434/0,175.00,-12180.82,40,0
    .goto 1434/0,53.76,-12252.29,40,0
    >>Kill |cRXP_ENEMY_Lashtail Raptors|r
    .complete 568,1 --Lashtail Raptor slain (15)
    .mob Lashtail Raptor
step
    #loop
    .goto 1434/0,175.00,-12180.82,0
    .goto 1434/0,175.00,-12180.82,40,0
    .goto 1434/0,255.41,-12156.57,40,0
    .goto 1434/0,53.76,-12252.29,40,0
    >>Kill |cRXP_ENEMY_Lashtail Raptors|r
    .complete 195,1 --Lashtail Raptor slain (10)
    .mob Lashtail Raptor
    .isOnQuest 195
step
    .goto 1434/0,168.62,-12348.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nimboya|r
    .turnin 581 >>Turn in Hunt for Yenniku
    .target Nimboya
step
    .goto 1434/0,161.60,-12347.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kin'weelay|r
    .turnin 596 >>Turn in Bloody Bone Necklaces while you are here
    .isQuestComplete 596
    .target Kin'weelay
step
    .goto 1434/0,167.99,-12398.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Aggro'gosh|r
    .turnin 568 >>Turn in The Defense of Grom'gol
    .target Commander Aggro'gosh
step << Hunter
    .goto 1434/0,227.97,-12388.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kragg|r
    .train 14303 >>Train your class spells
    .target Kragg
    .xp <36,1
    .xp >38,1
step << Hunter
    .goto 1434/0,227.97,-12388.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kragg|r
    .train 14320 >>Train your class spells
    .target Kragg
    .xp <38,1
step
    #loop
    .goto 1434/0,492.15,-11957.90,0
    .goto 1434/0,492.15,-11957.90,40,0
    .goto 1434/0,647.22,-11891.53,40,0
    .goto 1434/0,707.84,-11891.11,40,0
    >>Kill |cRXP_ENEMY_Stone Maw Basilisks|r, |cRXP_ENEMY_Crystal Spine Basilisks|r, |cRXP_ENEMY_Cold Eye Basilisks|r and |cRXP_ENEMY_Thrashtail Basilisks|r. Loot them for |cRXP_LOOT_Singing Crystal Shard|r
    .complete 605,1 --Singing Crystal Shard (10)
    .mob Stone Maw Basilisk
    .mob Crystal Spine Basilisk
    .mob Cold Eye Basilisk
    .mob Thrashtail Basilisk
step
    #completewith next
    .hs >>Hearth to Innkeeper Thulbek's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1434/0,161.60,-12347.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kin'weelay|r
    .turnin 596 >>Turn in Bloody Bone Necklaces
    .target Kin'weelay
step
    #completewith Drop635x2
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Bloodscalp Warrior|r, |cRXP_ENEMY_Bloodscalp Scout|r, |cRXP_ENEMY_Bloodscalp Hunter|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #label Drop635x2
    #loop
    .goto 1434/0,-573.52,-12153.59,0
    .goto 1434/0,-573.52,-12153.59,40,0
    .goto 1434/0,-525.66,-11979.59,40,0
    .goto 1434/0,-616.91,-11916.63,40,0
    >>Kill |cRXP_ENEMY_Venture Co. Geologists|r. Loot them for |cRXP_LOOT_Tumbled Crystal|r
    .complete 213,1 --Tumbled Crystal (8)
    .mob Venture Co. Geologist
step
    .goto 1434/0,-539.70,-12064.25,60,0
    .goto 1434/0,-496.30,-12104.67,60,0
    .goto 1434/0,-572.88,-12138.70,60,0
    .goto 1434/0,-613.72,-12170.61,60,0
    .goto 1434/0,-674.98,-12159.12,60,0
    .goto 1434/0,-733.05,-12166.35,60,0
    .goto 1434/0,-731.13,-12102.11,60,0
    .goto 1434/0,-779.63,-12020.43,60,0
    .goto 1434/0,-757.30,-11982.57,60,0
    .goto 1434/0,-736.24,-11934.50,60,0
    .goto 1434/0,-667.96,-11924.29,60,0
    .goto 1434/0,-643.71,-11883.02,60,0
    .goto 1434/0,-614.99,-11857.50,60,0
    .goto 1434/0,-561.39,-11840.91,60,0
    .goto 1434/0,-547.99,-11918.76,60,0
    .goto 1434/0,-564.58,-11990.65,60,0
    .xp 36+50000 >> Grind to level 36 50000+/71600 xp
step
    .goto 1434/0,-52.17,-11620.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ajeck Rouack|r
    .turnin 187 >>Turn in Tiger Mastery
    .target Ajeck Rouack
    .isOnQuest 187
step
    .goto 1434/0,-54.72,-11628.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hemet Nesingwary|r
    .turnin 195 >>Turn in Raptor Mastery
    .target Hemet Nesingwary
    .isOnQuest 195
step
    .goto 1434/0,168.62,-12348.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nimboya|r
    .accept 638 >>Accept Trollbane
    .target Nimboya
step
    .goto 1434/0,497.90,-14449.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kebok|r
    .turnin 189 >>Turn in Bloodscalp Ears
    .turnin 213 >>Turn in Hostile Takeover
    .target Kebok
step
    .goto 1434/0,490.24,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Crank Fizzlebub|r
    .turnin 605 >>Turn in Singing Blue Shards
    .target Crank Fizzlebub
step
    .goto 1434/0,415.58,-14469.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drizzlik|r
    .accept 577 >>Accept Some Assembly Required
    .target Drizzlik
    .isQuestTurnedIn 575 --any of: Supply and Demand
step
    #loop
    .goto 1434/0,-344.43,-12326.73,0
    .goto 1434/0,-344.43,-12326.73,40,0
    .goto 1434/0,-378.89,-12112.32,40,0
    .goto 1434/0,-422.28,-12050.21,40,0
    .goto 1434/0,-454.82,-11845.59,40,0
    .goto 1434/0,-315.08,-11913.23,40,0
    >>Kill |cRXP_ENEMY_Snapjaw Crocolisks|r. Loot them for |cRXP_LOOT_Snapjaw Crocolisk Skin|r
    .complete 577,1 --Snapjaw Crocolisk Skin (5)
    .mob Snapjaw Crocolisk
    .isOnQuest 577
step
    .goto 1434/0,415.58,-14469.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drizzlik|r
    .turnin 577 >>Turn in Some Assembly Required
    .target Drizzlik
    .isOnQuest 577
step
    +|cRXP_WARN_That is all of Stranglethorn Vale for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Arathi Highlands|r: Crystal in the Mountains, Trollbane
    >>|cRXP_FRIENDLY_The Barrens|r: Components for the Enchanted Gold Bloodrobe << Warlock
    >>|cRXP_FRIENDLY_Undercity|r: Basilisks: Should Petrification be Feared?
step
    +|cRXP_WARN_The rest of Stranglethorn Vale is planned from level 36.|r Load its guide for level 36 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 30 - 52 Stranglethorn Vale
#subweight -30
#name 36-37 Stranglethorn Vale: around Nimboya

step
    .goto 1434/0,-54.72,-11616.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barnil Stonepot|r
    .turnin 338 >>Turn in The Green Hills of Stranglethorn
    .target Barnil Stonepot
    .isQuestComplete 338
step
    .goto 1434/0,211.38,-12434.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Thulbek|r
    .target Innkeeper Thulbek
    .home >>Set your Hearthstone to Innkeeper Thulbek's inn
step
    .goto 1434/0,171.18,-12412.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Far Seer Mok'thardin|r
    .accept 570 >>Accept Mok'thardin's Enchantment
    .target Far Seer Mok'thardin
step
    .goto 1434/0,161.60,-12347.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kin'weelay|r
    .accept 629 >>Accept The Vile Reef
    .target Kin'weelay
step
    .goto 1434/0,-47.70,-11617.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sir S. J. Erlgadin|r
    .accept 192 >>Accept Panther Mastery
    .target Sir S. J. Erlgadin
    .isQuestTurnedIn 191 --any of: Panther Mastery
step
    .goto 1434/0,483.22,-14438.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baron Revilgaz|r
    .accept 1182 >>Accept Goblin Sponsorship
    .target Baron Revilgaz
    .isQuestTurnedIn 1181 --any of: Goblin Sponsorship
    .xp <29,1
step
    .goto 1434/0,487.05,-14444.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fleet Master Seahorn|r
    .accept 670 >>Accept Sunken Treasure
    .target Fleet Master Seahorn
    .isQuestTurnedIn 669 --any of: Sunken Treasure
    .xp <35,1
step
    #completewith next
    .hs >>Hearth to Innkeeper Thulbek's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1434/0,168.62,-12348.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nimboya|r
    .accept 582 >>Accept Headhunting
    .target Nimboya
    .isQuestTurnedIn 581 --any of: Hunt for Yenniku
step
    .goto 1434/0,167.99,-12398.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Aggro'gosh|r
    .accept 569 >>Accept The Defense of Grom'gol
    .target Commander Aggro'gosh
    .isQuestTurnedIn 568 --any of: The Defense of Grom'gol
step
    .goto 1434/0,637.01,-12148.48
    >>Open the |cRXP_PICK_Gri'lek the Wanderer|r. Loot it for |cRXP_LOOT_Tablet Shard|r
    .complete 629,1 --Tablet Shard (1)
step
    #loop
    .goto 1434/0,675.29,-11612.03,0
    .goto 1434/0,675.29,-11612.03,40,0
    .goto 1434/0,756.97,-11600.97,40,0
    >>Kill |cRXP_ENEMY_Bloodscalp Headhunters|r. Loot them for |cRXP_LOOT_Shrunken Head|r
    .complete 582,1 --Shrunken Head (20)
    .mob Bloodscalp Headhunter
    .isOnQuest 582
step
    .goto 1434/0,168.62,-12348.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nimboya|r
    .turnin 582 >>Turn in Headhunting
    .target Nimboya
    .isOnQuest 582
step
    .goto 1434/0,161.60,-12347.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kin'weelay|r
    .turnin 629 >>Turn in The Vile Reef
    .target Kin'weelay
step
    .goto 1434/0,-171.50,-12482.86
    >>Kill |cRXP_ENEMY_Mosh'Ogg Brutes|r
    .complete 569,1 --Mosh'Ogg Brute slain (10)
    .mob Mosh'Ogg Brute
    .isOnQuest 569
step
    #loop
    .goto 1434/0,-171.50,-12489.24,0
    .goto 1434/0,-171.50,-12489.24,40,0
    .goto 1434/0,-84.07,-12516.90,40,0
    >>Kill |cRXP_ENEMY_Mosh'Ogg Witch Doctors|r
    .complete 569,2 --Mosh'Ogg Witch Doctor slain (5)
    .mob Mosh'Ogg Witch Doctor
    .isOnQuest 569
step
    .goto 1434/0,-500.13,-11949.39
    >>Kill |cRXP_ENEMY_Foreman Cozzle|r and loot |cRXP_LOOT_Cozzle's Key|r
    .collect 5851,1,1182,1 --Cozzle's Key (1)
    .mob Foreman Cozzle
    .isOnQuest 1182
step
    .goto 1434/0,-544.16,-12033.62
    >>Open the |cRXP_PICK_Cozzle's Footlocker|r. Loot it for |cRXP_LOOT_Fuel Regulator Blueprints|r
    .complete 1182,1 --Fuel Regulator Blueprints (1)
    .isOnQuest 1182
step
    #completewith Along18
    >>As you go: Kill |cRXP_ENEMY_Stranglethorn Tigress|r and loot |cRXP_LOOT_Pristine Tigress Fang|r. |cRXP_WARN_Anything left is finished later|r
    .complete 570,2 --Pristine Tigress Fang (1)
    .mob Stranglethorn Tigress
step
    #loop
    .goto 1434/0,-821.11,-12118.28,0
    .goto 1434/0,-821.11,-12118.28,40,0
    .goto 1434/0,-922.57,-12036.17,40,0
    .goto 1434/0,-949.37,-12192.30,40,0
    >>Kill |cRXP_ENEMY_Shadowmaw Panthers|r and |cRXP_ENEMY_Elder Shadowmaw Panthers|r. Loot them for |cRXP_LOOT_Shadowmaw Claw|r
    .complete 570,1 --Shadowmaw Claw (8)
    .mob Shadowmaw Panther
    .mob Elder Shadowmaw Panther
step
    #label Along18
    #loop
    .goto 1434/0,-821.11,-12118.28,0
    .goto 1434/0,-821.11,-12118.28,40,0
    .goto 1434/0,-922.57,-12036.17,40,0
    .goto 1434/0,-949.37,-12192.30,40,0
    >>Kill |cRXP_ENEMY_Shadowmaw Panthers|r
    .complete 192,1 --Shadowmaw Panther slain (10)
    .mob Shadowmaw Panther
    .isOnQuest 192
step
    #loop
    .goto 1434/0,-821.11,-12118.28,0
    .goto 1434/0,-821.11,-12118.28,40,0
    .goto 1434/0,-922.57,-12036.17,40,0
    .goto 1434/0,-949.37,-12192.30,40,0
    >>Kill |cRXP_ENEMY_Stranglethorn Tigress|r and loot |cRXP_LOOT_Pristine Tigress Fang|r
    .complete 570,2 --Pristine Tigress Fang (1)
    .mob Stranglethorn Tigress
step
    .goto 1434/0,-47.70,-11617.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sir S. J. Erlgadin|r
    .turnin 192 >>Turn in Panther Mastery
    .target Sir S. J. Erlgadin
    .isOnQuest 192
step
    .goto 1434/0,-52.17,-11620.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ajeck Rouack|r
    .accept 188 >>Accept Tiger Mastery
    .target Ajeck Rouack
    .isQuestTurnedIn 187 --any of: Tiger Mastery
step
    .goto 1434/0,165.43,-11908.55
    >>Kill |cRXP_ENEMY_Sin'Dall|r and loot |cRXP_LOOT_Paw of Sin'Dall|r
    .complete 188,1 --Paw of Sin'Dall (1)
    .mob Sin'Dall
    .isOnQuest 188
step
    .goto 1434/0,-52.17,-11620.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ajeck Rouack|r
    .turnin 188 >>Turn in Tiger Mastery
    .target Ajeck Rouack
    .isOnQuest 188
step
    .goto 1434/0,167.99,-12398.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Aggro'gosh|r
    .turnin 569 >>Turn in The Defense of Grom'gol
    .target Commander Aggro'gosh
    .isOnQuest 569
step
    .goto 1434/0,171.18,-12412.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Far Seer Mok'thardin|r
    .turnin 570 >>Turn in Mok'thardin's Enchantment
    .target Far Seer Mok'thardin
step
    .goto 1434/0,415.58,-14469.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drizzlik|r
    .accept 628 >>Accept Excelsior
    .target Drizzlik
    .isQuestTurnedIn 577 --any of: Some Assembly Required
step
    #completewith next
    .hs >>Hearth to Innkeeper Thulbek's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1434/0,168.62,-12348.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nimboya|r
    .accept 2932 >>Accept Grim Message
    .target Nimboya
step
    .goto 1434/0,168.62,-12348.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nimboya|r
    .turnin 2932 >>Turn in Grim Message
    .target Nimboya
    .isQuestComplete 2932
step
    .goto 1434/0,483.22,-14438.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baron Revilgaz|r
    .turnin 1182 >>Turn in Goblin Sponsorship
    .target Baron Revilgaz
    .isOnQuest 1182
step
    .goto 1434/0,483.22,-14438.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baron Revilgaz|r
    .accept 1183 >>Accept Goblin Sponsorship
    .target Baron Revilgaz
    .isQuestTurnedIn 1182 --any of: Goblin Sponsorship
    .xp <29,1
step
    .goto 1434/0,87.58,-12552.63
    >>Kill |cRXP_ENEMY_Elder Saltwater Crocolisk|r and loot |cRXP_LOOT_Elder Crocolisk Skin|r
    .complete 628,1 --Elder Crocolisk Skin (1)
    .mob Elder Saltwater Crocolisk
    .isOnQuest 628
step
    .goto 1434/0,415.58,-14469.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drizzlik|r
    .turnin 628 >>Turn in Excelsior
    .target Drizzlik
    .isOnQuest 628
step
    +|cRXP_WARN_That is all of Stranglethorn Vale for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Arathi Highlands|r: Sunken Treasure
    >>|cRXP_FRIENDLY_Thousand Needles|r: Goblin Sponsorship
    >>|cRXP_FRIENDLY_another zone and back here|r: Grim Message
step
    +|cRXP_WARN_The rest of Stranglethorn Vale is planned from level 39.|r Load its guide for level 39 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 30 - 52 Stranglethorn Vale
#subweight -30
#name 39-40 Stranglethorn Vale: around First Mate Crazz

step
    .goto 1434/0,-47.70,-11617.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sir S. J. Erlgadin|r
    .accept 193 >>Accept Panther Mastery
    .target Sir S. J. Erlgadin
    .isQuestTurnedIn 192 --any of: Panther Mastery
step
    .goto 1434/0,-54.72,-11616.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barnil Stonepot|r
    .turnin 338 >>Turn in The Green Hills of Stranglethorn
    .target Barnil Stonepot
    .isQuestComplete 338
step
    .goto 1434/0,-54.72,-11628.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hemet Nesingwary|r
    .accept 196 >>Accept Raptor Mastery
    .target Hemet Nesingwary
    .isQuestTurnedIn 195 --any of: Raptor Mastery
step
    .goto 1434/0,168.62,-12348.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nimboya|r
    .turnin 2932 >>Turn in Grim Message
    .target Nimboya
    .isQuestComplete 2932
step
    .goto 1434/0,497.90,-14449.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kebok|r
    .accept 209 >>Accept Skullsplitter Tusks
    .target Kebok
    .isQuestTurnedIn 189 --any of: Bloodscalp Ears
step
    .goto 1434/0,490.24,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Crank Fizzlebub|r
    .accept 600 >>Accept Venture Company Mining
    .target Crank Fizzlebub
    .isQuestTurnedIn 605 --any of: Singing Blue Shards
step
    .goto 1434/0,211.38,-12434.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Thulbek|r
    .target Innkeeper Thulbek
    .home >>Set your Hearthstone to Innkeeper Thulbek's inn
step
    .goto 1434/0,171.18,-12412.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Far Seer Mok'thardin|r
    .accept 572 >>Accept Mok'thardin's Enchantment
    .target Far Seer Mok'thardin
    .isQuestTurnedIn 570 --any of: Mok'thardin's Enchantment
step
    .goto 1434/0,168.62,-12348.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nimboya|r
    .accept 584 >>Accept Bloodscalp Clan Heads
    .target Nimboya
    .isQuestTurnedIn 582 --any of: Headhunting
step
    .goto 1434/0,161.60,-12347.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kin'weelay|r
    .accept 598 >>Accept Split Bone Necklace
    .target Kin'weelay
    .isQuestTurnedIn 596 --Bloody Bone Necklaces
    .isQuestTurnedIn 629 --The Vile Reef
step
    .goto 1434/0,719.96,-11574.17
    >>Kill |cRXP_ENEMY_Nezzliok the Dire|r and loot |cRXP_LOOT_Nezzliok's Head|r
    .complete 584,2 --Nezzliok's Head (1)
    .mob Nezzliok the Dire
    .isOnQuest 584
step
    .goto 1434/0,725.07,-11514.19
    >>Kill |cRXP_ENEMY_Gan'zulah|r and loot |cRXP_LOOT_Gan'zulah's Head|r
    .complete 584,1 --Gan'zulah's Head (1)
    .mob Gan'zulah
    .isOnQuest 584
step
    #completewith next
    .hs >>Hearth to Innkeeper Thulbek's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1434/0,164.79,-12342.90
    >>Click the |cRXP_PICK_Bubbling Cauldron|r
    .turnin 584 >>Turn in Bloodscalp Clan Heads
    .isOnQuest 584
step
    .goto 1434/0,164.79,-12342.90
    >>Click the |cRXP_PICK_Bubbling Cauldron|r
    .accept 585 >>Accept Speaking with Nezzliok
    .isQuestTurnedIn 584 --any of: Bloodscalp Clan Heads
step
    #loop
    .goto 1434/0,178.83,-12970.81,0
    .goto 1434/0,178.83,-12970.81,40,0
    .goto 1434/0,265.62,-13044.84,40,0
    >>Kill |cRXP_ENEMY_Jungle Stalkers|r
    .complete 196,1 --Jungle Stalker slain (10)
    .mob Jungle Stalker
    .isOnQuest 196
step
    #loop
    .goto 1434/0,178.83,-12970.81,0
    .goto 1434/0,178.83,-12970.81,40,0
    .goto 1434/0,265.62,-13044.84,40,0
    .goto 1434/0,416.22,-13145.66,40,0
    .goto 1434/0,376.01,-13047.39,40,0
    >>Kill |cRXP_ENEMY_Jungle Stalkers|r. Loot them for |cRXP_LOOT_Jungle Stalker Feather|r
    .complete 572,1 --Jungle Stalker Feather (10)
    .mob Jungle Stalker
    .isOnQuest 572
step
    #loop
    .goto 1434/0,-436.96,-12992.94,0
    .goto 1434/0,-436.96,-12992.94,40,0
    .goto 1434/0,-444.61,-13090.36,40,0
    >>Kill |cRXP_ENEMY_Venture Co. Strip Miners|r, |cRXP_ENEMY_Venture Co. Foremans|r, |cRXP_ENEMY_Venture Co. Surveyors|r and |cRXP_ENEMY_Venture Co. Tinkerers|r. Loot them for |cRXP_LOOT_Singing Blue Crystal|r
    .complete 600,1 --Singing Blue Crystal (10)
    .mob Venture Co. Strip Miner
    .mob Venture Co. Foreman
    .mob Venture Co. Surveyor
    .mob Venture Co. Tinkerer
    .isOnQuest 600
step
    .goto 1434/0,-472.69,-12704.93
    >>Open the |cRXP_PICK_Ziata'jai Trophy Skulls|r. Loot it for |cRXP_LOOT_Ziata'jai Trophy|r
    .complete 585,2 --Ziata'jai Trophy (1)
    .isOnQuest 585
step
    .goto 1434/0,-819.83,-12850.85
    >>Open the |cRXP_PICK_Zul'Mamwe Trophy Skulls|r. Loot it for |cRXP_LOOT_Zul'Mamwe Trophy|r
    .complete 585,3 --Zul'Mamwe Trophy (1)
    .isOnQuest 585
step
    .goto 1434/0,-722.84,-12544.12
    >>Open the |cRXP_PICK_Balia'mah Trophy Skulls|r. Loot it for |cRXP_LOOT_Balia'mah Trophy|r
    .complete 585,1 --Balia'mah Trophy (1)
    .isOnQuest 585
step
    #loop
    .goto 1434/0,-728.58,-12530.08,0
    .goto 1434/0,-728.58,-12530.08,40,0
    .goto 1434/0,-784.74,-12619.00,40,0
    .goto 1434/0,-784.74,-12847.44,40,0
    .goto 1434/0,-622.01,-12938.91,40,0
    .goto 1434/0,-487.37,-12670.05,40,0
    >>Kill |cRXP_ENEMY_Skullsplitter Warriors|r, |cRXP_ENEMY_Skullsplitter Hunters|r, |cRXP_ENEMY_Skullsplitter Witch Doctors|r and |cRXP_ENEMY_Skullsplitter Spiritchasers|r. Loot them for |cRXP_LOOT_Skullsplitter Tusk|r
    .complete 209,1 --Skullsplitter Tusk (18)
    .mob Skullsplitter Warrior
    .mob Skullsplitter Hunter
    .mob Skullsplitter Witch Doctor
    .mob Skullsplitter Spiritchaser
    .isOnQuest 209
step
    #loop
    .goto 1434/0,-487.37,-12670.05,0
    .goto 1434/0,-487.37,-12670.05,40,0
    .goto 1434/0,-728.58,-12530.08,40,0
    .goto 1434/0,-784.74,-12619.00,40,0
    .goto 1434/0,-784.74,-12847.44,40,0
    .goto 1434/0,-622.01,-12938.91,40,0
    >>Kill |cRXP_ENEMY_Skullsplitter Warriors|r, |cRXP_ENEMY_Skullsplitter Hunters|r, |cRXP_ENEMY_Skullsplitter Witch Doctors|r and |cRXP_ENEMY_Skullsplitter Spiritchasers|r. Loot them for |cRXP_LOOT_Split Bone Necklace|r
    .complete 598,1 --Split Bone Necklace (25)
    .mob Skullsplitter Warrior
    .mob Skullsplitter Hunter
    .mob Skullsplitter Witch Doctor
    .mob Skullsplitter Spiritchaser
    .isOnQuest 598
step
    .goto 1434/0,-931.50,-12189.75
    >>Kill |cRXP_ENEMY_Bhag'thera|r and loot |cRXP_LOOT_Fang of Bhag'thera|r
    .complete 193,1 --Fang of Bhag'thera (1)
    .mob Bhag'thera
    .isOnQuest 193
step
    #completewith next
    .hs >>Hearth to Innkeeper Thulbek's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1434/0,171.18,-12412.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Far Seer Mok'thardin|r
    .turnin 572 >>Turn in Mok'thardin's Enchantment
    .target Far Seer Mok'thardin
    .isOnQuest 572
step
    .goto 1434/0,161.60,-12347.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kin'weelay|r
    .turnin 598 >>Turn in Split Bone Necklace
    .target Kin'weelay
    .isOnQuest 598
step
    .goto 1434/0,164.79,-12342.90
    >>Click the |cRXP_PICK_Bubbling Cauldron|r
    .turnin 585 >>Turn in Speaking with Nezzliok
    .isOnQuest 585
step
    .goto 1434/0,-54.72,-11628.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hemet Nesingwary|r
    .turnin 196 >>Turn in Raptor Mastery
    .target Hemet Nesingwary
    .isOnQuest 196
step
    .goto 1434/0,-47.70,-11617.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sir S. J. Erlgadin|r
    .turnin 193 >>Turn in Panther Mastery
    .target Sir S. J. Erlgadin
    .isOnQuest 193
step
    .goto 1434/0,171.18,-12412.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Far Seer Mok'thardin|r
    .accept 571 >>Accept Mok'thardin's Enchantment
    .target Far Seer Mok'thardin
    .isQuestTurnedIn 572 --any of: Mok'thardin's Enchantment
step
    .goto 1434/0,513.21,-14418.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Privateer Bloads|r
    .accept 617 >>Accept Akiris by the Bundle
    .target Privateer Bloads
step
    .goto 1434/0,497.90,-14449.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kebok|r
    .turnin 209 >>Turn in Skullsplitter Tusks
    .target Kebok
    .isOnQuest 209
step
    .goto 1434/0,490.24,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Crank Fizzlebub|r
    .turnin 600 >>Turn in Venture Company Mining
    .target Crank Fizzlebub
    .isOnQuest 600
step
    .goto 1434/0,448.12,-14447.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Sea Wolf" MacKinley|r
    .accept 606 >>Accept Scaring Shaky
    .target "Sea Wolf" MacKinley
step
    .goto 1434/0,427.70,-14411.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_First Mate Crazz|r
    .accept 595 >>Accept The Bloodsail Buccaneers
    .target First Mate Crazz
step
    .goto 1434/0,480.03,-14126.25
    >>Click the |cRXP_PICK_Bloodsail Correspondence|r
    .turnin 595 >>Turn in The Bloodsail Buccaneers
    .accept 597 >>Accept The Bloodsail Buccaneers
step
    .goto 1434/0,427.70,-14411.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_First Mate Crazz|r
    .turnin 597 >>Turn in The Bloodsail Buccaneers
    .accept 599 >>Accept The Bloodsail Buccaneers
    .target First Mate Crazz
step
    .goto 1434/0,503.00,-14459.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deeg|r
    .accept 587 >>Accept Up to Snuff
    .target Deeg
step
    .goto 1434/0,487.05,-14444.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fleet Master Seahorn|r
    .turnin 599 >>Turn in The Bloodsail Buccaneers
    .target Fleet Master Seahorn
step
    .goto 1434/0,396.43,-14397.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dizzy One-Eye|r
    .accept 576 >>Accept Keep An Eye Out
    .target Dizzy One-Eye
step
    .goto 1434/0,314.12,-14623.56
    >>Kill |cRXP_ENEMY_Bloodsail Raiders|r, |cRXP_ENEMY_Bloodsail Mages|r, |cRXP_ENEMY_Bloodsail Swashbucklers|r and |cRXP_ENEMY_Bloodsail Warlocks|r. Loot them for |cRXP_LOOT_Dizzy's Eye|r
    .complete 576,1 --Dizzy's Eye (1)
    .mob Bloodsail Raider
    .mob Bloodsail Mage
    .mob Bloodsail Swashbuckler
    .mob Bloodsail Warlock
step
    #loop
    .goto 1434/0,185.21,-14043.29,0
    .goto 1434/0,185.21,-14043.29,40,0
    .goto 1434/0,113.11,-13981.60,40,0
    .goto 1434/0,82.48,-13875.25,40,0
    >>Kill |cRXP_ENEMY_Elder Mistvale Gorillas|r. Loot them for |cRXP_LOOT_Mistvale Giblets|r
    .complete 606,1 --Mistvale Giblets (5)
    .mob Elder Mistvale Gorilla
step
    #loop
    .goto 1434/0,171.81,-13982.46,0
    .goto 1434/0,171.81,-13982.46,40,0
    .goto 1434/0,80.56,-14019.89,40,0
    >>Kill |cRXP_ENEMY_Elder Mistvale Gorilla|r and loot |cRXP_LOOT_Aged Gorilla Sinew|r
    .complete 571,1 --Aged Gorilla Sinew (1)
    .mob Elder Mistvale Gorilla
    .isOnQuest 571
step
    .goto 1434/0,504.28,-14299.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Shaky" Phillipe|r
    .turnin 606 >>Turn in Scaring Shaky
    .accept 607 >>Accept Return to MacKinley
    .target "Shaky" Phillipe
step
    .goto 1434/0,396.43,-14397.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dizzy One-Eye|r
    .turnin 576 >>Turn in Keep An Eye Out
    .target Dizzy One-Eye
step
    .goto 1434/0,448.12,-14447.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Sea Wolf" MacKinley|r
    .turnin 607 >>Turn in Return to MacKinley
    .target "Sea Wolf" MacKinley
step
    .goto 1434/0,171.18,-12412.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Far Seer Mok'thardin|r
    .turnin 571 >>Turn in Mok'thardin's Enchantment
    .target Far Seer Mok'thardin
    .isOnQuest 571
step
    #loop
    .goto 1434/0,419.41,-14674.18,0
    .goto 1434/0,419.41,-14674.18,40,0
    .goto 1434/0,503.64,-14698.86,40,0
    >>Kill |cRXP_ENEMY_Bloodsail Raiders|r, |cRXP_ENEMY_Bloodsail Mages|r, |cRXP_ENEMY_Bloodsail Swashbucklers|r and |cRXP_ENEMY_Bloodsail Warlocks|r. Loot them for |cRXP_LOOT_Snuff|r
    .complete 587,1 --Snuff (15)
    .mob Bloodsail Raider
    .mob Bloodsail Mage
    .mob Bloodsail Swashbuckler
    .mob Bloodsail Warlock
step
    #loop
    .goto 1434/0,621.05,-13878.23,0
    .goto 1434/0,621.05,-13878.23,40,0
    .goto 1434/0,633.18,-13700.83,40,0
    .goto 1434/0,536.18,-13720.82,40,0
    >>Kill |cRXP_ENEMY_Naga Explorers|r and |cRXP_ENEMY_Brinescale Skirmishers|r. Loot them for |cRXP_LOOT_Akiris Reed|r
    .complete 617,1 --Akiris Reed (1)
    .mob Naga Explorer
    .mob Brinescale Skirmisher
step
    .goto 1434/0,513.21,-14418.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Privateer Bloads|r
    .turnin 617 >>Turn in Akiris by the Bundle
    .target Privateer Bloads
step
    .goto 1434/0,503.00,-14459.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deeg|r
    .turnin 587 >>Turn in Up to Snuff
    .target Deeg
step
    +|cRXP_WARN_The rest of Stranglethorn Vale is planned from level 42.|r Load its guide for level 42 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 30 - 52 Stranglethorn Vale
#subweight -30
#name 42-43 Stranglethorn Vale: around "Sea Wolf" MacKinley

step
    .goto 1434/0,-54.72,-11616.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barnil Stonepot|r
    .turnin 338 >>Turn in The Green Hills of Stranglethorn
    .target Barnil Stonepot
    .isQuestComplete 338
step
    .goto 1434/0,-54.72,-11628.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hemet Nesingwary|r
    .accept 197 >>Accept Raptor Mastery
    .target Hemet Nesingwary
    .isQuestTurnedIn 196 --any of: Raptor Mastery
step
    .goto 1434/0,168.62,-12348.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nimboya|r
    .turnin 2932 >>Turn in Grim Message
    .target Nimboya
    .isQuestComplete 2932
step
    .goto 1434/0,386.86,-13076.74
    >>Kill |cRXP_ENEMY_Tethis|r and loot |cRXP_LOOT_Talon of Tethis|r
    .complete 197,1 --Talon of Tethis (1)
    .mob Tethis
    .isOnQuest 197
step
    .goto 1434/0,-54.72,-11628.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hemet Nesingwary|r
    .turnin 197 >>Turn in Raptor Mastery
    .target Hemet Nesingwary
    .isOnQuest 197
step
    .goto 1434/0,-54.72,-11628.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hemet Nesingwary|r
    .accept 208 >>Accept Big Game Hunter
    .target Hemet Nesingwary
    .isQuestTurnedIn 188 --Tiger Mastery
    .isQuestTurnedIn 193 --Panther Mastery
    .isQuestTurnedIn 197 --Raptor Mastery
step
    .goto 1434/0,490.24,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Crank Fizzlebub|r
    .accept 621 >>Accept Zanzil's Secret
    .target Crank Fizzlebub
step
    .goto 1434/0,448.12,-14447.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Sea Wolf" MacKinley|r
    .accept 2872 >>Accept Stoley's Debt
    .target "Sea Wolf" MacKinley
step
    .goto 1434/0,458.97,-14433.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fin Fizracket|r
    .accept 348 >>Accept Stranglethorn Fever
    .target Fin Fizracket
step
    .goto 1434/0,487.05,-14444.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fleet Master Seahorn|r
    .accept 604 >>Accept The Bloodsail Buccaneers
    .target Fleet Master Seahorn
    .isQuestTurnedIn 599 --any of: The Bloodsail Buccaneers
step
    .goto 1434/0,501.09,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krazek|r
    .accept 2864 >>Accept Tran'rek
    .target Krazek
step << Rogue
    .goto 1434/0,509.38,-14450.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ian|r on the second floor of the inn
    .train 6774 >> Train your class spells
    .target Ian Strom
    .xp <42,1
    .xp >44,1
step << Rogue
    .goto 1434/0,509.38,-14450.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ian|r on the second floor of the inn
    .train 11341 >> Train your class spells
    .target Ian Strom
    .xp <44,1
step
    .goto 1434/0,495.34,-14457.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Skindle|r
    .target Innkeeper Skindle
    .home >>Set your Hearthstone to Innkeeper Skindle's inn
step
    .goto 1434/0,488.32,-14686.09
    >>Pick up |cRXP_PICK_Bloodsail Charts|r from the ground
    .complete 604,2 --Bloodsail Charts (1)
    .isOnQuest 604
step
    .goto 1434/0,486.41,-14685.24
    >>Pick up |cRXP_PICK_Bloodsail Orders|r from the ground
    .complete 604,3 --Bloodsail Orders (1)
    .isOnQuest 604
step
    .goto 1434/0,503.64,-14698.86
    >>Kill |cRXP_ENEMY_Bloodsail Swashbucklers|r
    .complete 604,1 --Bloodsail Swashbuckler slain (10)
    .mob Bloodsail Swashbuckler
    .isOnQuest 604
step
    .goto 1434/0,-15.79,-13758.69
    >>Kill |cRXP_ENEMY_Mokk the Savage|r and loot |cRXP_LOOT_Heart of Mokk|r
    .complete 348,1 --Heart of Mokk (1)
    .mob Mokk the Savage
step
    #completewith next
    .hs >>Hearth to Innkeeper Skindle's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1434/0,458.97,-14433.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fin Fizracket|r
    .turnin 348 >>Turn in Stranglethorn Fever
    .target Fin Fizracket
step
    .goto 1434/0,448.12,-14447.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Sea Wolf" MacKinley|r
    .accept 609 >>Accept Voodoo Dues
    .target "Sea Wolf" MacKinley
    .isQuestTurnedIn 607 --any of: Return to MacKinley
step
    .goto 1434/0,487.05,-14444.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fleet Master Seahorn|r
    .turnin 604 >>Turn in The Bloodsail Buccaneers
    .target Fleet Master Seahorn
    .isOnQuest 604
step
    .goto 1434/0,171.18,-12412.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Far Seer Mok'thardin|r
    .accept 573 >>Accept Mok'thardin's Enchantment
    .target Far Seer Mok'thardin
    .isQuestTurnedIn 571 --any of: Mok'thardin's Enchantment
step
    .goto 1434/0,-217.44,-12682.38
    >>Kill |cRXP_ENEMY_King Bangalash|r and loot |cRXP_LOOT_Head of Bangalash|r
    .complete 208,1 --Head of Bangalash (1)
    .mob King Bangalash
    .isOnQuest 208
step
    #completewith Along23
    >>As you go: Kill |cRXP_ENEMY_Zanzil Zombies|r, |cRXP_ENEMY_Zanzil Hunters|r, |cRXP_ENEMY_Zanzil Witch Doctors|r and |cRXP_ENEMY_Zanzil Nagas|r. Loot them for |cRXP_LOOT_Zanzil's Mixture|r. |cRXP_WARN_Anything left is finished later|r
    .complete 621,1 --Zanzil's Mixture (1)
    .mob Zanzil Zombie
    .mob Zanzil Hunter
    .mob Zanzil Witch Doctor
    .mob Zanzil Naga
step
    .goto 1434/0,-29.20,-13349.86
    >>Kill |cRXP_ENEMY_Maury "Club Foot" Wilkins|r and loot |cRXP_LOOT_Maury's Clubbed Foot|r
    .complete 609,1 --Maury's Clubbed Foot (1)
    .mob Maury "Club Foot" Wilkins
    .isOnQuest 609
step
    .goto 1434/0,-7.50,-13374.11
    >>Kill |cRXP_ENEMY_Jon-Jon the Crow|r and loot |cRXP_LOOT_Jon-Jon's Golden Spyglass|r
    .complete 609,2 --Jon-Jon's Golden Spyglass (1)
    .mob Jon-Jon the Crow
    .isOnQuest 609
step
    #label Along23
    .goto 1434/0,-331.67,-13646.38
    >>Kill |cRXP_ENEMY_Chucky "Ten Thumbs"|r and loot |cRXP_LOOT_Chucky's Huge Ring|r
    .complete 609,3 --Chucky's Huge Ring (1)
    .mob Chucky "Ten Thumbs"
    .isOnQuest 609
step
    #loop
    .goto 1434/0,-331.67,-13646.38,0
    .goto 1434/0,-331.67,-13646.38,40,0
    .goto 1434/0,-269.13,-13651.06,40,0
    .goto 1434/0,-415.90,-13594.05,40,0
    >>Kill |cRXP_ENEMY_Zanzil Zombies|r, |cRXP_ENEMY_Zanzil Hunters|r, |cRXP_ENEMY_Zanzil Witch Doctors|r and |cRXP_ENEMY_Zanzil Nagas|r. Loot them for |cRXP_LOOT_Zanzil's Mixture|r
    .complete 621,1 --Zanzil's Mixture (1)
    .mob Zanzil Zombie
    .mob Zanzil Hunter
    .mob Zanzil Witch Doctor
    .mob Zanzil Naga
step
    .goto 1434/0,372.82,-13803.36
    >>Open the |cRXP_PICK_The Holy Spring|r. Loot it for |cRXP_LOOT_Holy Spring Water|r
    .complete 573,2 --Holy Spring Water (1)
    .isOnQuest 573
step
    #loop
    .goto 1434/0,536.18,-13720.82,0
    .goto 1434/0,536.18,-13720.82,40,0
    .goto 1434/0,633.18,-13700.83,40,0
    .goto 1434/0,621.05,-13878.23,40,0
    >>Kill |cRXP_ENEMY_Naga Explorers|r
    .complete 573,1 --Naga Explorer slain (10)
    .mob Naga Explorer
    .isOnQuest 573
step
    .goto 1434/0,448.12,-14447.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Sea Wolf" MacKinley|r
    .turnin 609 >>Turn in Voodoo Dues
    .target "Sea Wolf" MacKinley
    .isOnQuest 609
step
    .goto 1434/0,448.12,-14447.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Sea Wolf" MacKinley|r
    .accept 613 >>Accept Cracking Maury's Foot
    .target "Sea Wolf" MacKinley
    .isQuestTurnedIn 609 --any of: Voodoo Dues
step
    .goto 1434/0,490.24,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Crank Fizzlebub|r
    .turnin 621 >>Turn in Zanzil's Secret
    .target Crank Fizzlebub
step
    .goto 1434/0,488.96,-14463.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Whiskey Slim|r
    .accept 580 >>Accept Whiskey Slim's Lost Grog
    .target Whiskey Slim
step
    .goto 1434/0,490.24,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Crank Fizzlebub|r
    .accept 1119 >>Accept Zanzil's Mixture and a Fool's Stout
    .target Crank Fizzlebub
    .isQuestTurnedIn 1118 --Back to Booty Bay
    .xp <35,1
step
    .goto 1434/0,171.18,-12412.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Far Seer Mok'thardin|r
    .turnin 573 >>Turn in Mok'thardin's Enchantment
    .target Far Seer Mok'thardin
    .isOnQuest 573
step
    #loop
    .goto 1434/0,-786.65,-12222.51,0
    .goto 1434/0,-786.65,-12222.51,40,0
    .goto 1434/0,-891.30,-12386.72,40,0
    >>Kill |cRXP_ENEMY_Mosh'Ogg Maulers|r, |cRXP_ENEMY_Mosh'Ogg Shamans|r, |cRXP_ENEMY_Mosh'Ogg Lords|r and |cRXP_ENEMY_Mosh'Ogg Warmongers|r. Loot them for |cRXP_LOOT_Maury's Key|r
    .complete 613,1 --Maury's Key (1)
    .mob Mosh'Ogg Mauler
    .mob Mosh'Ogg Shaman
    .mob Mosh'Ogg Lord
    .mob Mosh'Ogg Warmonger
    .isOnQuest 613
step
    .goto 1434/0,-54.72,-11628.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hemet Nesingwary|r
    .turnin 208 >>Turn in Big Game Hunter
    .target Hemet Nesingwary
    .isOnQuest 208
step
    .goto 1434/0,737.19,-14236.00
    >>Kill |cRXP_ENEMY_Mok'rash|r and loot |cRXP_LOOT_Monogrammed Sash|r. Use it to start the quest
    .collect 3985,1,8552 --Monogrammed Sash (1)
    .accept 8552 >>Accept The Monogrammed Sash
    .use 3985
    .mob Mok'rash
step
    .goto 1434/0,517.68,-14300.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Hecklebury Smotts|r
    .turnin 8552 >>Turn in The Monogrammed Sash
    .accept 8553 >>Accept The Captain's Cutlass
    .target Captain Hecklebury Smotts
step
    .goto 1434/0,519.59,-14301.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sprogger|r
    .turnin 8553 >>Turn in The Captain's Cutlass
    .target Sprogger
step
    .goto 1434/0,448.12,-14447.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Sea Wolf" MacKinley|r
    .turnin 613 >>Turn in Cracking Maury's Foot
    .target "Sea Wolf" MacKinley
    .isOnQuest 613
step
    .goto 1434/0,488.96,-14463.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Whiskey Slim|r
    .turnin 580 >>Turn in Whiskey Slim's Lost Grog
    .target Whiskey Slim
    .isQuestComplete 580
step
    +|cRXP_WARN_That is all of Stranglethorn Vale for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Tanaris|r: Tran'rek, Stoley's Debt
    >>|cRXP_FRIENDLY_Thousand Needles|r: Zanzil's Mixture and a Fool's Stout
    >>|cRXP_FRIENDLY_The Hinterlands and back here|r: Whiskey Slim's Lost Grog
step
    +|cRXP_WARN_The rest of Stranglethorn Vale is planned from level 45.|r Load its guide for level 45 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 30 - 52 Stranglethorn Vale
#subweight -30
#name 45-46 Stranglethorn Vale: around Kin'weelay

step
    .goto 1434/0,164.79,-12342.90
    >>Click the |cRXP_PICK_Bubbling Cauldron|r
    .accept 586 >>Accept Speaking with Gan'zulah
    .isQuestTurnedIn 584 --any of: Bloodscalp Clan Heads
step
    .goto 1434/0,168.62,-12348.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nimboya|r
    .turnin 2932 >>Turn in Grim Message
    .target Nimboya
    .isQuestComplete 2932
step
    .goto 1434/0,-606.06,-13083.12
    >>Kill |cRXP_ENEMY_Ana'thek the Cruel|r and loot |cRXP_LOOT_Broken Armor of Ana'thek|r
    .complete 586,4 --Broken Armor of Ana'thek (1)
    .mob Ana'thek the Cruel
    .isOnQuest 586
step
    .goto 1434/0,-713.27,-13000.59
    >>Kill |cRXP_ENEMY_Skullsplitter Hunters|r
    .complete 586,1 --Skullsplitter Hunter slain (8)
    .mob Skullsplitter Hunter
    .isOnQuest 586
step
    #loop
    .goto 1434/0,-773.25,-13086.10,0
    .goto 1434/0,-773.25,-13086.10,40,0
    .goto 1434/0,-828.13,-13027.40,40,0
    >>Kill |cRXP_ENEMY_Skullsplitter Berserkers|r
    .complete 586,3 --Skullsplitter Berserker slain (4)
    .mob Skullsplitter Berserker
    .isOnQuest 586
step
    .goto 1434/0,-837.06,-13000.59
    >>Kill |cRXP_ENEMY_Skullsplitter Headhunters|r
    .complete 586,2 --Skullsplitter Headhunter slain (6)
    .mob Skullsplitter Headhunter
    .isOnQuest 586
step
    .goto 1434/0,164.79,-12342.90
    >>Click the |cRXP_PICK_Bubbling Cauldron|r
    .turnin 586 >>Turn in Speaking with Gan'zulah
    .isOnQuest 586
step
    .goto 1434/0,164.79,-12342.90
    >>Click the |cRXP_PICK_Bubbling Cauldron|r
    .accept 588 >>Accept The Fate of Yenniku
    .isQuestTurnedIn 585 --Speaking with Nezzliok
    .isQuestTurnedIn 586 --Speaking with Gan'zulah
step
    .goto 1434/0,161.60,-12347.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kin'weelay|r
    .turnin 588 >>Turn in The Fate of Yenniku
    .target Kin'weelay
    .isOnQuest 588
step
    .goto 1434/0,161.60,-12347.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kin'weelay|r
    .accept 589 >>Accept The Singing Crystals
    .target Kin'weelay
    .isQuestTurnedIn 588 --any of: The Fate of Yenniku
step
    .goto 1434/0,517.68,-14300.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Hecklebury Smotts|r
    .accept 8551 >>Accept The Captain's Chest
    .target Captain Hecklebury Smotts
step
    #loop
    .goto 1434/0,-567.13,-13224.79,0
    .goto 1434/0,-567.13,-13224.79,40,0
    .goto 1434/0,-563.31,-13156.72,40,0
    >>Kill |cRXP_ENEMY_Ironjaw Basilisks|r. Loot them for |cRXP_LOOT_Pulsing Blue Shard|r
    .complete 589,1 --Pulsing Blue Shard (3)
    .mob Ironjaw Basilisk
    .isOnQuest 589
step
    .goto 1434/0,-137.04,-14135.18
    >>Kill |cRXP_ENEMY_Gorlash|r and loot |cRXP_LOOT_Smotts' Chest|r
    .complete 8551,1 --Smotts' Chest (1)
    .mob Gorlash
step
    .goto 1434/0,517.68,-14300.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Hecklebury Smotts|r
    .turnin 8551 >>Turn in The Captain's Chest
    .target Captain Hecklebury Smotts
step
    .goto 1434/0,161.60,-12347.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kin'weelay|r
    .turnin 589 >>Turn in The Singing Crystals
    .target Kin'weelay
    .isOnQuest 589
step
    .goto 1434/0,161.60,-12347.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kin'weelay|r
    .accept 591 >>Accept The Mind's Eye
    .target Kin'weelay
    .isQuestTurnedIn 589 --any of: The Singing Crystals
step
    .goto 1434/0,-1156.76,-12342.90
    >>Kill |cRXP_ENEMY_Mai'Zoth|r and loot |cRXP_LOOT_Mind's Eye|r
    .complete 591,1 --Mind's Eye (1)
    .mob Mai'Zoth
    .isOnQuest 591
step
    .goto 1434/0,-54.72,-11616.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barnil Stonepot|r
    .turnin 338 >>Turn in The Green Hills of Stranglethorn
    .target Barnil Stonepot
    .isQuestComplete 338
step
    .goto 1434/0,161.60,-12347.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kin'weelay|r
    .turnin 591 >>Turn in The Mind's Eye
    .target Kin'weelay
    .isOnQuest 591
step
    .goto 1434/0,161.60,-12347.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kin'weelay|r
    .accept 592 >>Accept Saving Yenniku
    .target Kin'weelay
    .isQuestTurnedIn 591 --any of: The Mind's Eye
step
    .goto 1434/0,-269.13,-13651.06
    >>Kill |cRXP_ENEMY_Yenniku|r and loot |cRXP_LOOT_Filled Soul Gem|r
    .complete 592,1 --Filled Soul Gem (1)
    .mob Yenniku
    .isOnQuest 592
step
    .goto 1434/0,168.62,-12348.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nimboya|r
    .turnin 592 >>Turn in Saving Yenniku
    .target Nimboya
    .isOnQuest 592
step
    .goto 1434/0,488.96,-14463.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Whiskey Slim|r
    .turnin 580 >>Turn in Whiskey Slim's Lost Grog
    .target Whiskey Slim
    .isQuestComplete 580
step
    +|cRXP_WARN_The rest of Stranglethorn Vale is planned from level 48.|r Load its guide for level 48 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 30 - 52 Stranglethorn Vale
#subweight -30
#name 48-49 Stranglethorn Vale

step
    .goto 1434/0,487.05,-14444.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fleet Master Seahorn|r
    .accept 608 >>Accept The Bloodsail Buccaneers
    .target Fleet Master Seahorn
    .isQuestTurnedIn 604 --any of: The Bloodsail Buccaneers
step
    .goto 1434/0,123.32,-14920.92
    >>Kill |cRXP_ENEMY_Captain Stillwater|r
    .complete 608,1 --Captain Stillwater slain (1)
    .mob Captain Stillwater
    .isOnQuest 608
step
    .goto 1434/0,269.45,-15024.30
    >>Kill |cRXP_ENEMY_Fleet Master Firallon|r
    .complete 608,3 --Fleet Master Firallon slain (1)
    .mob Fleet Master Firallon
    .isOnQuest 608
step
    .goto 1434/0,349.85,-14924.75
    >>Kill |cRXP_ENEMY_Captain Keelhaul|r
    .complete 608,2 --Captain Keelhaul slain (1)
    .mob Captain Keelhaul
    .isOnQuest 608
step
    .goto 1434/0,487.05,-14444.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fleet Master Seahorn|r
    .turnin 608 >>Turn in The Bloodsail Buccaneers
    .target Fleet Master Seahorn
    .isOnQuest 608
step
    .goto 1434/0,411.11,-14416.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Oglethorpe Obnoticus|r
    .accept 3721 >>Accept An OOX of Your Own
    .target Oglethorpe Obnoticus
    .isQuestTurnedIn 648 --Rescue OOX-17/TN!
    .isQuestTurnedIn 836 --Rescue OOX-09/HL!
    .isQuestTurnedIn 2767 --Rescue OOX-22/FE!
    .xp <45,1
step
    .goto 1434/0,411.11,-14416.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Oglethorpe Obnoticus|r
    .turnin 3721 >>Turn in An OOX of Your Own
    .target Oglethorpe Obnoticus
    .isOnQuest 3721
step
    .goto 1434/0,488.96,-14463.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Whiskey Slim|r
    .turnin 580 >>Turn in Whiskey Slim's Lost Grog
    .target Whiskey Slim
    .isQuestComplete 580
step
    .goto 1434/0,168.62,-12348.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nimboya|r
    .turnin 2932 >>Turn in Grim Message
    .target Nimboya
    .isQuestComplete 2932
step
    .goto 1434/0,-54.72,-11616.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barnil Stonepot|r
    .turnin 338 >>Turn in The Green Hills of Stranglethorn
    .target Barnil Stonepot
    .isQuestComplete 338
step
    +|cRXP_WARN_The rest of Stranglethorn Vale is planned from level 51.|r Load its guide for level 51 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 30 - 52 Stranglethorn Vale
#subweight -30
#name 51-52 Stranglethorn Vale

step
    .goto 1434/0,519.59,-14301.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sprogger|r
    .accept 8554 >>Accept Facing Negolash
    .target Sprogger
    .isQuestTurnedIn 8553 --any of: The Captain's Cutlass
step
    .goto 1434/0,488.96,-14463.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Whiskey Slim|r
    .turnin 580 >>Turn in Whiskey Slim's Lost Grog
    .target Whiskey Slim
    .isQuestComplete 580
step
    .goto 1434/0,150.12,-14638.87
    >>Kill |cRXP_ENEMY_Negolash|r and loot |cRXP_LOOT_Smotts' Cutlass|r
    .complete 8554,1 --Smotts' Cutlass (1)
    .mob Negolash
    .isOnQuest 8554
step
    .goto 1434/0,-237.86,-14596.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Princess Poobah|r
    .accept 630 >>Accept Message in a Bottle
    .target Princess Poobah
    .isQuestTurnedIn 594 --any of: Message in a Bottle
    .xp <45,1
step
    .goto 1434/0,-392.29,-14738.00
    >>Kill |cRXP_ENEMY_King Mukla|r and loot |cRXP_LOOT_Shackle Key|r
    .complete 630,1 --Shackle Key (1)
    .mob King Mukla
    .isOnQuest 630
step
    .goto 1434/0,-237.86,-14596.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Princess Poobah|r
    .turnin 630 >>Turn in Message in a Bottle
    .target Princess Poobah
    .isOnQuest 630
step
    .goto 1434/0,517.68,-14300.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Hecklebury Smotts|r
    .turnin 8554 >>Turn in Facing Negolash
    .target Captain Hecklebury Smotts
    .isOnQuest 8554
step
    .goto 1434/0,168.62,-12348.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nimboya|r
    .turnin 2932 >>Turn in Grim Message
    .target Nimboya
    .isQuestComplete 2932
step
    .goto 1434/0,-54.72,-11616.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barnil Stonepot|r
    .turnin 338 >>Turn in The Green Hills of Stranglethorn
    .target Barnil Stonepot
    .isQuestComplete 338
step
    +|cRXP_WARN_End of the Stranglethorn Vale route.|r
]])
