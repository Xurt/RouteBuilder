-- 1-50 Stranglethorn Vale: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 8 parts with a level check between them (from level 1, 28, 31, 34, 37, 41, 44, 47).
-- Edit zones/Stranglethorn Vale.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#name 1-50 Stranglethorn Vale

step
    .goto 1434/0,451.31,-14441.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Flipfin"|r
    .accept 97067 >>Accept Tip the Scales - Dezian Queenfish
    .accept 97066 >>Accept Tip the Scales - Brownell's Blue Striped Racer
    .accept 97065 >>Accept Tip the Scales - Keefer's Angelfish
    .target "Flipfin"
step
    .goto 1434/0,495.34,-14451.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nixxrax Fillamug|r
    .turnin 98463 >>Turn in Talk of the Town
    .target Nixxrax Fillamug
    .isOnQuest 98463
step
    .goto 1434/0,539.37,-14298.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wharfmaster Lozgil|r
    .turnin 1180 >>Turn in Goblin Sponsorship
    .target Wharfmaster Lozgil
    .isOnQuest 1180
step
    .goto 1434/0,474.29,-14320.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Caravaneer Ruzzgot|r
    .turnin 1040 >>Turn in Passage to Booty Bay
    .target Caravaneer Ruzzgot
    .isOnQuest 1040
step
    .goto 1434/0,-54.72,-11628.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hemet Nesingwary|r
    .turnin 93928 >>Turn in Of Mice and Milk
    .target Hemet Nesingwary
    .isOnQuest 93928
step << Hunter
    .goto 1434/0,-204.04,-11296.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corporal Bluth|r
    .vendor >> |cRXP_BUY_Restock on |r |T132382:0|t[Razor Arrows] |cRXP_BUY_if needed|r
    .target Corporal Bluth
step
    .goto 1434/0,-54.72,-11628.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hemet Nesingwary|r
    .turnin 5762 >>Turn in Hemet Nesingwary
    .target Hemet Nesingwary
    .isOnQuest 5762
step << Warlock
    .goto 1434/0,-26.64,-13328.16
    >>Open the |cRXP_PICK_Solid Chest|r. Loot it for |cRXP_LOOT_Gold Bar|r
    .complete 4781,1 --Gold Bar (1)
    .isOnQuest 4781
step << Warlock
    .goto 1434/0,388.78,-14439.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Xizk Goodstitch|r
    .turnin 4781 >>Turn in Components for the Enchanted Gold Bloodrobe
    .target Xizk Goodstitch
    .isOnQuest 4781
step
    .goto 1434/0,501.09,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krazek|r
    .turnin 1115 >>Turn in The Rumormonger
    .target Krazek
    .isOnQuest 1115
step << Rogue
    .goto 1434/0,509.57,-14450.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_FRIENDLY_Ian Strom|r up stairs
    .trainer >> Train your class spells
    .target Ian Strom
step
    .goto 1434/0,480.03,-14467.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Catelyn the Blade|r
    .turnin 603 >>Turn in Ansirem's Key
    .target Catelyn the Blade
    .isOnQuest 603
step
    .goto 1434/0,490.24,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Crank Fizzlebub|r
    .turnin 1118 >>Turn in Back to Booty Bay
    .target Crank Fizzlebub
    .isOnQuest 1118
step
    .goto 1434/0,487.05,-14444.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fleet Master Seahorn|r
    .turnin 669 >>Turn in Sunken Treasure
    .target Fleet Master Seahorn
    .isOnQuest 669
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
    +|cRXP_WARN_That is all of Stranglethorn Vale for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_another zone|r: Tip the Scales - Keefer's Angelfish, Tip the Scales - Brownell's Blue Striped Racer, Tip the Scales - Dezian Queenfish
step
    .xp 28 >>|cRXP_WARN_The rest of Stranglethorn Vale is planned from level 28.|r Come back to this guide then
step
    .goto 1434/0,474.29,-14320.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Caravaneer Ruzzgot|r
    .accept 1041 >>Accept The Caravan Road
    .target Caravaneer Ruzzgot
    .isQuestTurnedIn 1040 --any of: Passage to Booty Bay
    .xp <25,1
step
    .goto 1434/0,415.58,-14469.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drizzlik|r
    .accept 575 >>Accept Supply and Demand
    .target Drizzlik
step
    #loop
    .goto 1434/0,14.20,-11613.74,0
    .goto 1434/0,14.20,-11613.74,40,0
    .goto 1434/0,15.47,-11513.34,40,0
    .goto 1434/0,-57.27,-11517.59,40,0
    .goto 1434/0,-249.99,-11650.32,40,0
    .goto 1434/0,-130.66,-11615.86,40,0
    >>Kill |cRXP_ENEMY_River Crocolisks|r. Loot them for |cRXP_LOOT_Large River Crocolisk Skin|r
    .complete 575,1 --Large River Crocolisk Skin (2)
    .mob River Crocolisk
step
    .goto 1434/0,415.58,-14469.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drizzlik|r
    .turnin 575 >>Turn in Supply and Demand
    .target Drizzlik
step
    +|cRXP_WARN_That is all of Stranglethorn Vale for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Duskwood|r: The Caravan Road
step
    .xp 31 >>|cRXP_WARN_The rest of Stranglethorn Vale is planned from level 31.|r Come back to this guide then
step
    #loop
    .goto 1434/0,-332.30,-11524.82,0
    .goto 1434/0,-332.30,-11524.82,40,0
    .goto 1434/0,-290.83,-11476.75,40,0
    .goto 1434/0,-286.36,-11395.50,40,0
    .goto 1434/0,-216.80,-11372.95,40,0
    .goto 1434/0,-223.82,-11331.68,40,0
    .goto 1434/0,-202.77,-11313.82,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Private Thorsen|r. |cRXP_WARN_This NPC walks a patrol route|r
    .accept 215 >>Accept Jungle Secrets
    .unitscan Private Thorsen
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
    #loop
    .goto 1434/0,-54.08,-11685.21,0
    .goto 1434/0,-54.08,-11685.21,40,0
    .goto 1434/0,-17.07,-11683.93,40,0
    .goto 1434/0,46.74,-11650.75,40,0
    .goto 1434/0,76.73,-11636.71,40,0
    .goto 1434/0,63.97,-11696.27,40,0
    .goto 1434/0,56.95,-11720.94,40,0
    .goto 1434/0,12.92,-11747.32,40,0
    .goto 1434/0,-75.14,-11718.81,40,0
    .goto 1434/0,-50.89,-11696.27,40,0
    >>Kill |cRXP_ENEMY_Young Stranglethorn Tigers|r
    .complete 185,1 --Young Stranglethorn Tiger slain (10)
    .mob Young Stranglethorn Tiger
step
    .goto 1434/0,-52.17,-11620.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ajeck Rouack|r
    .turnin 185 >>Turn in Tiger Mastery while you are here
    .isQuestComplete 185
    .target Ajeck Rouack
step
    #loop
    .goto 1434/0,-366.13,-11653.72,0
    .goto 1434/0,-366.13,-11653.72,40,0
    .goto 1434/0,-373.14,-11644.79,40,0
    .goto 1434/0,-420.37,-11613.74,40,0
    .goto 1434/0,-463.76,-11600.12,40,0
    .goto 1434/0,-489.28,-11575.45,40,0
    .goto 1434/0,-517.36,-11615.44,40,0
    .goto 1434/0,-526.93,-11692.44,40,0
    .goto 1434/0,-445.25,-11711.16,40,0
    .goto 1434/0,-417.81,-11714.13,40,0
    >>Kill |cRXP_ENEMY_Young Panthers|r
    .complete 190,1 --Young Panther slain (10)
    .mob Young Panther
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
    .target Sir S. J. Erlgadin
step
    .goto 1434/0,-206.59,-11296.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lieutenant Doren|r
    .turnin 215 >>Turn in Jungle Secrets
    .target Lieutenant Doren
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
    .accept 198 >>Accept Supplies to Private Thorsen
    .target Krazek
step
    .goto 1434/0,483.22,-14438.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baron Revilgaz|r
    .turnin 1181 >>Turn in Goblin Sponsorship
    .target Baron Revilgaz
    .isOnQuest 1181
step
    #loop
    .goto 1434/0,-332.30,-11524.82,0
    .goto 1434/0,-332.30,-11524.82,40,0
    .goto 1434/0,-290.83,-11476.75,40,0
    .goto 1434/0,-286.36,-11395.50,40,0
    .goto 1434/0,-216.80,-11372.95,40,0
    .goto 1434/0,-223.82,-11331.68,40,0
    .goto 1434/0,-202.77,-11313.82,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Private Thorsen|r. |cRXP_WARN_This NPC walks a patrol route|r
    .turnin 198 >>Turn in Supplies to Private Thorsen
    .unitscan Private Thorsen
step
    .goto 1434/0,-205.32,-11310.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sergeant Yohwa|r
    .accept 203 >>Accept The Second Rebellion
    .accept 204 >>Accept Bad Medicine
    .target Sergeant Yohwa
step
    .goto 1434/0,-206.59,-11296.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lieutenant Doren|r
    .accept 200 >>Accept Bookie Herod
    .target Lieutenant Doren
step
    #completewith Drop635x1
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Bloodscalp Warrior|r, |cRXP_ENEMY_Bloodscalp Scout|r, |cRXP_ENEMY_Bloodscalp Hunter|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #completewith Along17
    >>As you go: Kill |cRXP_ENEMY_Kurzen Jungle Fighters|r. Kill |cRXP_ENEMY_Kurzen Medicine Mans|r, |cRXP_ENEMY_Kurzen Headshrinkers|r and |cRXP_ENEMY_Kurzen Witch Doctors|r. Loot them for |cRXP_LOOT_Jungle Remedy|r. |cRXP_WARN_Anything left is finished later|r
    .complete 203,1 --Kurzen Jungle Fighter slain (15)
    .complete 204,1 --Jungle Remedy (7)
    .mob Kurzen Jungle Fighter
    .mob Kurzen Medicine Man
    .mob Kurzen Headshrinker
    .mob Kurzen Witch Doctor
step
    #label Drop635x1
    .goto 1434/0,-618.18,-11582.25
    >>Open the |cRXP_PICK_Kurzen Supplies|r. Loot it for |cRXP_LOOT_Venom Fern Extract|r
    .complete 204,2 --Venom Fern Extract (1)
step
    #label Along17
    .goto 1434/0,-565.86,-11567.37
    >>Click the |cRXP_PICK_Bookie Herod's Records|r
    .turnin 200 >>Turn in Bookie Herod
    .accept 328 >>Accept The Hidden Key
step
    #completewith Drop635x2
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Bloodscalp Warrior|r, |cRXP_ENEMY_Bloodscalp Scout|r, |cRXP_ENEMY_Bloodscalp Hunter|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #label Drop635x2
    #loop
    .goto 1434/0,-567.77,-11575.02,0
    .goto 1434/0,-567.77,-11575.02,40,0
    .goto 1434/0,-579.90,-11472.07,40,0
    .goto 1434/0,-652.64,-11524.40,40,0
    .goto 1434/0,-777.08,-11613.31,40,0
    .goto 1434/0,-719.01,-11648.19,40,0
    .goto 1434/0,-724.75,-11704.77,40,0
    .goto 1434/0,-669.87,-11648.19,40,0
    .goto 1434/0,-585.00,-11680.10,40,0
    .goto 1434/0,-627.76,-11593.32,40,0
    >>Kill |cRXP_ENEMY_Kurzen Jungle Fighters|r
    >>Kill |cRXP_ENEMY_Kurzen Medicine Mans|r, |cRXP_ENEMY_Kurzen Headshrinkers|r and |cRXP_ENEMY_Kurzen Witch Doctors|r. Loot them for |cRXP_LOOT_Jungle Remedy|r
    .complete 203,1 --Kurzen Jungle Fighter slain (15)
    .complete 204,1 --Jungle Remedy (7)
    .mob Kurzen Jungle Fighter
    .mob Kurzen Medicine Man
    .mob Kurzen Headshrinker
    .mob Kurzen Witch Doctor
step
    #loop
    .goto 1434/0,-680.72,-11787.31,0
    .goto 1434/0,-680.72,-11787.31,40,0
    .goto 1434/0,-752.83,-11781.35,40,0
    .goto 1434/0,-786.65,-11817.51,40,0
    .goto 1434/0,-786.65,-11883.88,40,0
    .goto 1434/0,-789.20,-11954.49,40,0
    .goto 1434/0,-740.07,-11917.48,40,0
    .goto 1434/0,-714.54,-11887.28,40,0
    .goto 1434/0,-750.91,-11853.25,40,0
    .goto 1434/0,-714.54,-11823.89,40,0
    >>Kill |cRXP_ENEMY_Stranglethorn Tigers|r
    .complete 186,1 --Stranglethorn Tiger slain (10)
    .mob Stranglethorn Tiger
step
    .goto 1434/0,-205.32,-11310.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sergeant Yohwa|r
    .turnin 203 >>Turn in The Second Rebellion
    .turnin 204 >>Turn in Bad Medicine
    .target Sergeant Yohwa
step
    .goto 1434/0,-54.72,-11628.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hemet Nesingwary|r
    .accept 194 >>Accept Raptor Mastery
    .target Hemet Nesingwary
step
    .goto 1434/0,-52.17,-11620.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ajeck Rouack|r
    .turnin 186 >>Turn in Tiger Mastery
    .target Ajeck Rouack
step
    .goto 1434/0,-47.70,-11617.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sir S. J. Erlgadin|r
    .accept 191 >>Accept Panther Mastery
    .target Sir S. J. Erlgadin
step
    #loop
    .goto 1434/0,268.17,-11679.25,0
    .goto 1434/0,268.17,-11679.25,40,0
    .goto 1434/0,276.47,-11622.67,40,0
    .goto 1434/0,306.46,-11585.66,40,0
    .goto 1434/0,319.22,-11500.57,40,0
    .goto 1434/0,344.75,-11554.60,40,0
    .goto 1434/0,408.56,-11560.13,40,0
    .goto 1434/0,408.56,-11619.69,40,0
    .goto 1434/0,395.80,-11670.74,40,0
    .goto 1434/0,319.22,-11645.22,40,0
    >>Kill |cRXP_ENEMY_Panthers|r
    .complete 191,1 --Panther slain (10)
    .mob Panther
step
    #loop
    .goto 1434/0,447.48,-11777.95,0
    .goto 1434/0,447.48,-11777.95,40,0
    .goto 1434/0,473.01,-11826.02,40,0
    .goto 1434/0,526.61,-11850.69,40,0
    .goto 1434/0,579.58,-11841.33,40,0
    .goto 1434/0,685.50,-11835.38,40,0
    .goto 1434/0,640.84,-11852.39,40,0
    .goto 1434/0,561.07,-11895.79,40,0
    .goto 1434/0,513.85,-11917.91,40,0
    .goto 1434/0,462.80,-11920.46,40,0
    >>Kill |cRXP_ENEMY_Stranglethorn Raptors|r
    .complete 194,1 --Stranglethorn Raptor slain (10)
    .mob Stranglethorn Raptor
step
    .goto 1434/0,-54.72,-11628.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hemet Nesingwary|r
    .turnin 194 >>Turn in Raptor Mastery
    .target Hemet Nesingwary
step
    .goto 1434/0,-47.70,-11617.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sir S. J. Erlgadin|r
    .turnin 191 >>Turn in Panther Mastery
    .target Sir S. J. Erlgadin
step
    .goto 1434/0,497.90,-14449.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kebok|r
    .accept 189 >>Accept Bloodscalp Ears
    .target Kebok
step << Warlock
    .goto 1434/0,388.78,-14439.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Xizk Goodstitch|r
    .accept 4782 >>Accept Components for the Enchanted Gold Bloodrobe
    .target Xizk Goodstitch
    .isQuestTurnedIn 4781 --any of: Components for the Enchanted Gold Bloodrobe
    .xp <31,1
step
    .goto 1434/0,-945.54,-11490.36
    >>Click the |cRXP_PICK_Bookie Herod's Strongbox|r
    .turnin 328 >>Turn in The Hidden Key
    .accept 329 >>Accept The Spy Revealed!
step
    #completewith Drop635x3
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Bloodscalp Warrior|r, |cRXP_ENEMY_Bloodscalp Scout|r, |cRXP_ENEMY_Bloodscalp Hunter|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #label Drop635x3
    #loop
    .goto 1434/0,460.88,-11636.71,0
    .goto 1434/0,460.88,-11636.71,40,0
    .goto 1434/0,539.37,-11732.00,40,0
    .goto 1434/0,619.78,-11739.23,40,0
    .goto 1434/0,561.71,-11657.98,40,0
    .goto 1434/0,614.03,-11648.19,40,0
    .goto 1434/0,620.42,-11589.91,40,0
    .goto 1434/0,579.58,-11565.24,40,0
    .goto 1434/0,550.86,-11523.12,40,0
    .goto 1434/0,553.41,-11598.85,40,0
    >>Kill |cRXP_ENEMY_Bloodscalp Warriors|r, |cRXP_ENEMY_Bloodscalp Scouts|r, |cRXP_ENEMY_Bloodscalp Hunters|r and |cRXP_ENEMY_Bloodscalp Berserkers|r. Loot them for |cRXP_LOOT_Bloodscalp Ear|r
    .complete 189,1 --Bloodscalp Ear (15)
    .mob Bloodscalp Warrior
    .mob Bloodscalp Scout
    .mob Bloodscalp Hunter
    .mob Bloodscalp Berserker
step
    .goto 1434/0,592.34,-11566.94
    .xp 38-26000 >>Grind until you are 26k xp away from level 38
step
    .goto 1434/0,592.34,-11566.94
    .xp 37+53000 >>Grind until you are 53000/76100 xp into level 37
step
    .goto 1434/0,592.34,-11566.94
    .xp 37+57500 >>Grind until you are 57500/76100 xp into level 37
step
    .goto 1434/0,-206.59,-11296.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lieutenant Doren|r
    .turnin 329 >>Turn in The Spy Revealed!
    .accept 330 >>Accept Patrol Schedules
    .target Lieutenant Doren
step
    .goto 1434/0,-182.35,-11312.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corporal Sethman|r
    .turnin 330 >>Turn in Patrol Schedules
    .accept 331 >>Accept Report to Doren
    .target Corporal Sethman
step
    .goto 1434/0,-206.59,-11296.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lieutenant Doren|r
    .turnin 331 >>Turn in Report to Doren
    .target Lieutenant Doren
step
    .goto 1434/0,497.90,-14449.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kebok|r
    .turnin 189 >>Turn in Bloodscalp Ears
    .target Kebok
step
    .goto 1434/0,211.38,-12434.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Thulbek|r
    .target Innkeeper Thulbek
    .home >>Set your Hearthstone to Innkeeper Thulbek's inn
step
    .goto 1434/0,501.09,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krazek|r
    .accept 1116 >>Accept Dream Dust in the Swamp
    .target Krazek
    .isQuestTurnedIn 1115 --any of: The Rumormonger
    .xp <30,1
step
    .xp 38 >> Make sure you are level 38 before starting the next segment
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
    .turnin 1116 >>Turn in Dream Dust in the Swamp
    .target Krazek
    .isQuestComplete 1116
step
    .goto 1434/0,-54.72,-11616.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barnil Stonepot|r
    .accept 338 >>Accept The Green Hills of Stranglethorn
    .target Barnil Stonepot
step
    .goto 1434/0,-54.72,-11616.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barnil Stonepot|r
    .turnin 338 >>Turn in The Green Hills of Stranglethorn
    .target Barnil Stonepot
    .isQuestComplete 338
step
    +|cRXP_WARN_That is all of Stranglethorn Vale for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Arathi Highlands|r: Crystal in the Mountains
    >>|cRXP_FRIENDLY_The Barrens|r: Components for the Enchanted Gold Bloodrobe << Warlock
    >>|cRXP_FRIENDLY_Thousand Needles|r: Rumors for Kravel
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: The Green Hills of Stranglethorn
step
    .xp 34 >>|cRXP_WARN_The rest of Stranglethorn Vale is planned from level 34.|r Come back to this guide then
step
    .goto 1434/0,211.38,-12434.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Thulbek|r
    .target Innkeeper Thulbek
    .home >>Set your Hearthstone to Innkeeper Thulbek's inn
step
    .goto 1434/0,490.24,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Crank Fizzlebub|r
    .accept 605 >>Accept Singing Blue Shards
    .target Crank Fizzlebub
step
    .goto 1434/0,497.90,-14449.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kebok|r
    .accept 213 >>Accept Hostile Takeover
    .target Kebok
step
    .goto 1434/0,501.09,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krazek|r
    .accept 616 >>Accept The Haunted Isle
    .target Krazek
step
    .goto 1434/0,483.22,-14438.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baron Revilgaz|r
    .turnin 616 >>Turn in The Haunted Isle
    .target Baron Revilgaz
step
    #loop
    .goto 1434/0,-644.99,-12171.88,0
    .goto 1434/0,-644.99,-12171.88,40,0
    .goto 1434/0,-629.67,-12111.90,40,0
    .goto 1434/0,-618.18,-12045.11,40,0
    .goto 1434/0,-677.53,-12053.19,40,0
    .goto 1434/0,-713.27,-11952.79,40,0
    .goto 1434/0,-824.30,-11975.34,40,0
    .goto 1434/0,-773.25,-12013.20,40,0
    .goto 1434/0,-733.69,-12080.42,40,0
    .goto 1434/0,-745.81,-12185.07,40,0
    >>Kill |cRXP_ENEMY_Venture Co. Geologists|r. Loot them for |cRXP_LOOT_Tumbled Crystal|r
    .complete 213,1 --Tumbled Crystal (8)
    .mob Venture Co. Geologist
step
    .goto 1434/0,-187.45,-11309.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corporal Kaleb|r
    .accept 210 >>Accept Krazek's Cookery
    .target Corporal Kaleb
step
    .goto 1434/0,-52.17,-11620.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ajeck Rouack|r
    .accept 187 >>Accept Tiger Mastery
    .target Ajeck Rouack
step
    #loop
    .goto 1434/0,49.93,-11916.21,0
    .goto 1434/0,49.93,-11916.21,40,0
    .goto 1434/0,81.20,-11947.69,40,0
    .goto 1434/0,120.76,-11977.89,40,0
    .goto 1434/0,151.39,-11953.22,40,0
    .goto 1434/0,182.66,-11852.82,40,0
    .goto 1434/0,224.14,-11875.79,40,0
    .goto 1434/0,222.86,-11943.43,40,0
    .goto 1434/0,210.10,-12025.54,40,0
    .goto 1434/0,53.12,-11995.33,40,0
    >>Kill |cRXP_ENEMY_Elder Stranglethorn Tigers|r
    .complete 187,1 --Elder Stranglethorn Tiger slain (10)
    .mob Elder Stranglethorn Tiger
step
    #loop
    .goto 1434/0,492.15,-11957.90,0
    .goto 1434/0,492.15,-11957.90,40,0
    .goto 1434/0,545.76,-11938.33,40,0
    .goto 1434/0,618.50,-11920.89,40,0
    .goto 1434/0,647.22,-11891.53,40,0
    .goto 1434/0,656.15,-11885.15,40,0
    .goto 1434/0,707.84,-11891.11,40,0
    .goto 1434/0,749.32,-11919.61,40,0
    .goto 1434/0,648.49,-11941.31,40,0
    >>Kill |cRXP_ENEMY_Stone Maw Basilisks|r, |cRXP_ENEMY_Crystal Spine Basilisks|r, |cRXP_ENEMY_Cold Eye Basilisks|r and |cRXP_ENEMY_Thrashtail Basilisks|r. Loot them for |cRXP_LOOT_Singing Crystal Shard|r
    .complete 605,1 --Singing Crystal Shard (10)
    .mob Stone Maw Basilisk
    .mob Crystal Spine Basilisk
    .mob Cold Eye Basilisk
    .mob Thrashtail Basilisk
step
    .goto 1434/0,-54.72,-11628.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hemet Nesingwary|r
    .accept 195 >>Accept Raptor Mastery
    .target Hemet Nesingwary
step
    .goto 1434/0,-52.17,-11620.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ajeck Rouack|r
    .turnin 187 >>Turn in Tiger Mastery
    .target Ajeck Rouack
step
    .goto 1434/0,490.24,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Crank Fizzlebub|r
    .turnin 605 >>Turn in Singing Blue Shards
    .target Crank Fizzlebub
step
    .goto 1434/0,497.90,-14449.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kebok|r
    .turnin 213 >>Turn in Hostile Takeover
    .target Kebok
step
    .goto 1434/0,501.09,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krazek|r
    .turnin 210 >>Turn in Krazek's Cookery
    .accept 627 >>Accept Favor for Krazek
    .target Krazek
step
    .goto 1434/0,483.22,-14438.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baron Revilgaz|r
    .accept 601 >>Accept Water Elementals
    .target Baron Revilgaz
    .isQuestTurnedIn 578 --any of: The Stone of the Tides
    .xp <32,1
step
    .goto 1434/0,415.58,-14469.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drizzlik|r
    .accept 577 >>Accept Some Assembly Required
    .target Drizzlik
step
    .goto 1434/0,-205.32,-11310.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sergeant Yohwa|r
    .accept 574 >>Accept Special Forces
    .target Sergeant Yohwa
step
    #loop
    .goto 1434/0,-610.53,-11507.81,0
    .goto 1434/0,-610.53,-11507.81,40,0
    .goto 1434/0,-622.65,-11530.35,40,0
    .goto 1434/0,-680.08,-11526.95,40,0
    .goto 1434/0,-711.99,-11537.16,40,0
    .goto 1434/0,-849.19,-11525.67,40,0
    .goto 1434/0,-864.50,-11472.07,40,0
    .goto 1434/0,-796.22,-11492.49,40,0
    .goto 1434/0,-739.43,-11453.35,40,0
    .goto 1434/0,-730.49,-11500.57,40,0
    >>Kill |cRXP_ENEMY_Kurzen Commandos|r
    >>Kill |cRXP_ENEMY_Kurzen Headshrinkers|r
    .complete 574,1 --Kurzen Commando slain (10)
    .complete 574,2 --Kurzen Headshrinker slain (6)
    .mob Kurzen Commando
    .mob Kurzen Headshrinker
step
    #loop
    .goto 1434/0,-378.89,-12112.32,0
    .goto 1434/0,-378.89,-12112.32,40,0
    .goto 1434/0,-344.43,-12326.73,40,0
    .goto 1434/0,-338.69,-12424.15,40,0
    .goto 1434/0,-327.84,-12473.08,40,0
    .goto 1434/0,-277.43,-12525.40,40,0
    .goto 1434/0,-195.11,-12556.88,40,0
    .goto 1434/0,-230.84,-12502.86,40,0
    .goto 1434/0,-244.88,-12436.07,40,0
    .goto 1434/0,-296.57,-12390.55,40,0
    >>Kill |cRXP_ENEMY_Snapjaw Crocolisks|r. Loot them for |cRXP_LOOT_Snapjaw Crocolisk Skin|r
    .complete 577,1 --Snapjaw Crocolisk Skin (5)
    .mob Snapjaw Crocolisk
step
    #loop
    .goto 1434/0,153.31,-12214.85,0
    .goto 1434/0,153.31,-12214.85,40,0
    .goto 1434/0,289.23,-12217.83,40,0
    .goto 1434/0,262.43,-12177.84,40,0
    .goto 1434/0,264.34,-12168.48,40,0
    .goto 1434/0,255.41,-12156.57,40,0
    .goto 1434/0,271.36,-12124.66,40,0
    .goto 1434/0,180.75,-12048.51,40,0
    .goto 1434/0,153.31,-12154.44,40,0
    .goto 1434/0,175.00,-12180.82,40,0
    >>Kill |cRXP_ENEMY_Lashtail Raptors|r
    .complete 195,1 --Lashtail Raptor slain (10)
    .mob Lashtail Raptor
step
    #loop
    .goto 1434/0,783.14,-12152.74,0
    .goto 1434/0,783.14,-12152.74,40,0
    .goto 1434/0,814.41,-12122.11,40,0
    .goto 1434/0,880.13,-12160.82,40,0
    .goto 1434/0,879.49,-12110.20,40,0
    .goto 1434/0,924.80,-12086.37,40,0
    .goto 1434/0,980.96,-12117.85,40,0
    .goto 1434/0,950.96,-12210.60,40,0
    .goto 1434/0,882.69,-12214.85,40,0
    .goto 1434/0,825.25,-12205.06,40,0
    >>Kill |cRXP_ENEMY_Lesser Water Elementals|r. Loot them for |cRXP_LOOT_Water Elemental Bracers|r
    .complete 601,1 --Water Elemental Bracers (6)
    .mob Lesser Water Elemental
    .isOnQuest 601
step
    .goto 1434/0,-54.72,-11628.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hemet Nesingwary|r
    .turnin 195 >>Turn in Raptor Mastery
    .target Hemet Nesingwary
step
    .goto 1434/0,-206.59,-11296.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lieutenant Doren|r
    .turnin 574 >>Turn in Special Forces
    .target Lieutenant Doren
step
    .goto 1434/0,483.22,-14438.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baron Revilgaz|r
    .turnin 601 >>Turn in Water Elementals
    .target Baron Revilgaz
    .isOnQuest 601
step
    .goto 1434/0,483.22,-14438.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baron Revilgaz|r
    .accept 602 >>Accept Magical Analysis
    .target Baron Revilgaz
    .isQuestTurnedIn 601 --any of: Water Elementals
    .xp <32,1
step
    .goto 1434/0,415.58,-14469.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drizzlik|r
    .turnin 577 >>Turn in Some Assembly Required
    .target Drizzlik
step
    .goto 1434/0,501.09,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krazek|r
    .turnin 627 >>Turn in Favor for Krazek
    .target Krazek
    .isQuestComplete 627
step
    .goto 1434/0,501.09,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krazek|r
    .accept 622 >>Accept Return to Corporal Kaleb
    .target Krazek
    .isQuestTurnedIn 627 --any of: Favor for Krazek
    .xp <32,1
step
    .goto 1434/0,-187.45,-11309.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corporal Kaleb|r
    .turnin 622 >>Turn in Return to Corporal Kaleb
    .target Corporal Kaleb
    .isOnQuest 622
step
    .goto 1434/0,-54.72,-11616.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barnil Stonepot|r
    .turnin 338 >>Turn in The Green Hills of Stranglethorn
    .target Barnil Stonepot
    .isQuestComplete 338
step
    +|cRXP_WARN_That is all of Stranglethorn Vale for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Alterac Mountains|r: Magical Analysis
    >>|cRXP_FRIENDLY_Arathi Highlands and back here|r: Favor for Krazek
step
    .xp 37 >>|cRXP_WARN_The rest of Stranglethorn Vale is planned from level 37.|r Come back to this guide then
step
    .goto 1434/0,487.05,-14444.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fleet Master Seahorn|r
    .accept 670 >>Accept Sunken Treasure
    .target Fleet Master Seahorn
    .isQuestTurnedIn 669 --any of: Sunken Treasure
    .xp <35,1
step
    .goto 1434/0,483.22,-14438.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baron Revilgaz|r
    .accept 1182 >>Accept Goblin Sponsorship
    .target Baron Revilgaz
    .isQuestTurnedIn 1181 --any of: Goblin Sponsorship
    .xp <29,1
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
    .goto 1434/0,-52.17,-11620.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ajeck Rouack|r
    .accept 188 >>Accept Tiger Mastery
    .target Ajeck Rouack
step
    .goto 1434/0,-47.70,-11617.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sir S. J. Erlgadin|r
    .accept 192 >>Accept Panther Mastery
    .target Sir S. J. Erlgadin
step
    .goto 1434/0,501.09,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krazek|r
    .turnin 627 >>Turn in Favor for Krazek
    .target Krazek
    .isQuestComplete 627
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
    .goto 1434/0,-193.19,-11320.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Nimetz|r
    .accept 207 >>Accept Kurzen's Mystery
    .target Brother Nimetz
step
    #loop
    .goto 1434/0,-680.72,-12244.63,0
    .goto 1434/0,-680.72,-12244.63,40,0
    .goto 1434/0,-720.28,-12282.92,40,0
    .goto 1434/0,-748.36,-12312.70,40,0
    .goto 1434/0,-779.63,-12348.86,40,0
    .goto 1434/0,-844.08,-12351.83,40,0
    .goto 1434/0,-776.44,-12426.71,40,0
    .goto 1434/0,-747.72,-12378.63,40,0
    .goto 1434/0,-710.71,-12348.00,40,0
    .goto 1434/0,-680.08,-12307.59,40,0
    >>Kill |cRXP_ENEMY_Shadowmaw Panthers|r
    .complete 192,1 --Shadowmaw Panther slain (10)
    .mob Shadowmaw Panther
step
    .goto 1434/0,165.43,-11908.55
    >>Kill |cRXP_ENEMY_Sin'Dall|r and loot |cRXP_LOOT_Paw of Sin'Dall|r
    .complete 188,1 --Paw of Sin'Dall (1)
    .mob Sin'Dall
step
    .goto 1434/0,339.64,-11983.00
    >>Open the |cRXP_PICK_Moon Over the Vale|r. Loot it for |cRXP_LOOT_The First Troll Legend|r
    .complete 207,1 --The First Troll Legend (1)
step
    .goto 1434/0,644.66,-11548.65
    >>Open the |cRXP_PICK_The Emperor's Tomb|r. Loot it for |cRXP_LOOT_The Fourth Troll Legend|r
    .complete 207,4 --The Fourth Troll Legend (1)
step
    .goto 1434/0,756.34,-11680.10
    >>Open the |cRXP_PICK_Fall of Gurubashi|r. Loot it for |cRXP_LOOT_The Third Troll Legend|r
    .complete 207,3 --The Third Troll Legend (1)
step
    .goto 1434/0,637.01,-12148.48
    >>Open the |cRXP_PICK_Gri'lek the Wanderer|r. Loot it for |cRXP_LOOT_The Second Troll Legend|r
    .complete 207,2 --The Second Troll Legend (1)
step
    .goto 1434/0,-54.72,-11628.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hemet Nesingwary|r
    .accept 196 >>Accept Raptor Mastery
    .target Hemet Nesingwary
step
    .goto 1434/0,-52.17,-11620.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ajeck Rouack|r
    .turnin 188 >>Turn in Tiger Mastery
    .target Ajeck Rouack
step
    .goto 1434/0,-47.70,-11617.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sir S. J. Erlgadin|r
    .turnin 192 >>Turn in Panther Mastery
    .accept 193 >>Accept Panther Mastery
    .target Sir S. J. Erlgadin
step
    .goto 1434/0,-193.19,-11320.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Nimetz|r
    .turnin 207 >>Turn in Kurzen's Mystery
    .accept 205 >>Accept Troll Witchery
    .target Brother Nimetz
step
    .goto 1434/0,-206.59,-11296.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lieutenant Doren|r
    .accept 202 >>Accept Colonel Kurzen
    .target Lieutenant Doren
step
    .goto 1434/0,211.38,-12434.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Thulbek|r
    .target Innkeeper Thulbek
    .home >>Set your Hearthstone to Innkeeper Thulbek's inn
step
    .goto 1434/0,480.03,-14467.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Catelyn the Blade|r
    .accept 610 >>Accept "Pretty Boy" Duncan
    .target Catelyn the Blade
    .isQuestTurnedIn 603 --any of: Ansirem's Key
    .xp <32,1
step
    .goto 1434/0,448.12,-14447.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Sea Wolf" MacKinley|r
    .accept 606 >>Accept Scaring Shaky
    .target "Sea Wolf" MacKinley
step
    .goto 1434/0,415.58,-14469.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drizzlik|r
    .accept 628 >>Accept Excelsior
    .target Drizzlik
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
    .goto 1434/0,473.01,-14121.99
    >>Kill |cRXP_ENEMY_"Pretty Boy" Duncan|r and loot |cRXP_LOOT_Catelyn's Blade|r
    .complete 610,1 --Catelyn's Blade (1)
    .mob "Pretty Boy" Duncan
    .isOnQuest 610
step
    .goto 1434/0,427.70,-14411.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_First Mate Crazz|r
    .turnin 597 >>Turn in The Bloodsail Buccaneers
    .accept 599 >>Accept The Bloodsail Buccaneers
    .target First Mate Crazz
step
    .goto 1434/0,480.03,-14467.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Catelyn the Blade|r
    .turnin 610 >>Turn in "Pretty Boy" Duncan
    .target Catelyn the Blade
    .isOnQuest 610
step
    .goto 1434/0,480.03,-14467.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Catelyn the Blade|r
    .accept 611 >>Accept The Curse of the Tides
    .target Catelyn the Blade
    .isQuestTurnedIn 610 --any of: "Pretty Boy" Duncan
    .xp <32,1
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
    #loop
    .goto 1434/0,111.83,-14043.72,0
    .goto 1434/0,111.83,-14043.72,40,0
    .goto 1434/0,171.81,-13982.46,40,0
    .goto 1434/0,215.21,-13949.70,40,0
    .goto 1434/0,111.83,-13927.15,40,0
    .goto 1434/0,104.17,-13867.17,40,0
    .goto 1434/0,178.20,-13713.59,40,0
    .goto 1434/0,25.68,-13828.45,40,0
    .goto 1434/0,11.64,-13951.83,40,0
    .goto 1434/0,113.11,-13981.60,40,0
    >>Kill |cRXP_ENEMY_Elder Mistvale Gorillas|r. Loot them for |cRXP_LOOT_Mistvale Giblets|r
    .complete 606,1 --Mistvale Giblets (5)
    .mob Elder Mistvale Gorilla
step
    #loop
    .goto 1434/0,229.25,-13067.81,0
    .goto 1434/0,229.25,-13067.81,40,0
    .goto 1434/0,265.62,-13044.84,40,0
    .goto 1434/0,297.52,-13021.86,40,0
    .goto 1434/0,247.75,-12978.47,40,0
    .goto 1434/0,277.74,-12948.27,40,0
    .goto 1434/0,207.55,-12900.20,40,0
    .goto 1434/0,150.76,-12943.59,40,0
    .goto 1434/0,171.81,-13000.59,40,0
    .goto 1434/0,212.02,-13013.36,40,0
    >>Kill |cRXP_ENEMY_Jungle Stalkers|r
    .complete 196,1 --Jungle Stalker slain (10)
    .mob Jungle Stalker
step
    #loop
    .goto 1434/0,-607.34,-12964.43,0
    .goto 1434/0,-607.34,-12964.43,40,0
    .goto 1434/0,-689.02,-12988.68,40,0
    .goto 1434/0,-781.54,-12947.42,40,0
    .goto 1434/0,-865.78,-12944.01,40,0
    .goto 1434/0,-887.47,-12874.67,40,0
    .goto 1434/0,-815.37,-12820.64,40,0
    .goto 1434/0,-750.91,-12889.13,40,0
    .goto 1434/0,-709.44,-12785.33,40,0
    .goto 1434/0,-653.28,-12879.78,40,0
    >>Kill |cRXP_ENEMY_Skullsplitter Witch Doctors|r and |cRXP_ENEMY_Skullsplitter Mystics|r. Loot them for |cRXP_LOOT_Skullsplitter Fetish|r
    .complete 205,1 --Skullsplitter Fetish (4)
    .mob Skullsplitter Witch Doctor
    .mob Skullsplitter Mystic
step
    #loop
    .goto 1434/0,-905.98,-12045.11,0
    .goto 1434/0,-905.98,-12045.11,40,0
    .goto 1434/0,-893.22,-12019.58,40,0
    .goto 1434/0,-867.69,-11985.55,40,0
    .goto 1434/0,-867.69,-12028.09,40,0
    >>Kill |cRXP_ENEMY_Bhag'thera|r and loot |cRXP_LOOT_Fang of Bhag'thera|r
    .complete 193,1 --Fang of Bhag'thera (1)
    .mob Bhag'thera
step
    #loop
    .goto 1434/0,-867.69,-11536.74,0
    .goto 1434/0,-867.69,-11536.74,40,0
    .goto 1434/0,-897.68,-11532.91,40,0
    .goto 1434/0,-927.04,-11503.13,40,0
    .goto 1434/0,-948.10,-11424.85,40,0
    .goto 1434/0,-947.46,-11332.11,40,0
    .goto 1434/0,-893.22,-11362.31,40,0
    .goto 1434/0,-888.11,-11415.92,40,0
    .goto 1434/0,-914.27,-11412.51,40,0
    .goto 1434/0,-916.83,-11438.46,40,0
    >>Kill |cRXP_ENEMY_Kurzen Elites|r
    >>Kill |cRXP_ENEMY_Kurzen Subchiefs|r
    >>Kill |cRXP_ENEMY_Colonel Kurzen|r and loot |cRXP_LOOT_Kurzen's Head|r
    .complete 202,1 --Kurzen Elite slain (6)
    .complete 202,2 --Kurzen Subchief slain (4)
    .complete 202,3 --Kurzen's Head (1)
    .mob Kurzen Elite
    .mob Kurzen Subchief
    .mob Colonel Kurzen
step
    .goto 1434/0,-193.19,-11320.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Nimetz|r
    .turnin 205 >>Turn in Troll Witchery
    .target Brother Nimetz
step
    .goto 1434/0,-206.59,-11296.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lieutenant Doren|r
    .turnin 202 >>Turn in Colonel Kurzen
    .target Lieutenant Doren
step
    .goto 1434/0,-47.70,-11617.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sir S. J. Erlgadin|r
    .turnin 193 >>Turn in Panther Mastery
    .target Sir S. J. Erlgadin
step
    .goto 1434/0,-54.72,-11628.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hemet Nesingwary|r
    .turnin 196 >>Turn in Raptor Mastery
    .target Hemet Nesingwary
step
    .goto 1434/0,603.19,-11986.40
    >>Kill |cRXP_ENEMY_Elder Saltwater Crocolisk|r and loot |cRXP_LOOT_Elder Crocolisk Skin|r
    .complete 628,1 --Elder Crocolisk Skin (1)
    .mob Elder Saltwater Crocolisk
step
    .goto 1434/0,627.44,-12171.88
    >>Kill |cRXP_ENEMY_Gazban|r and loot |cRXP_LOOT_Stone of the Tides|r
    .complete 611,1 --Stone of the Tides (1)
    .mob Gazban
    .isOnQuest 611
step
    .goto 1434/0,483.22,-14438.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baron Revilgaz|r
    .turnin 611 >>Turn in The Curse of the Tides
    .target Baron Revilgaz
    .isOnQuest 611
step
    .goto 1434/0,504.28,-14299.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Shaky" Phillipe|r
    .turnin 606 >>Turn in Scaring Shaky
    .accept 607 >>Accept Return to MacKinley
    .target "Shaky" Phillipe
step
    .goto 1434/0,448.12,-14447.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Sea Wolf" MacKinley|r
    .turnin 607 >>Turn in Return to MacKinley
    .target "Sea Wolf" MacKinley
step
    .goto 1434/0,415.58,-14469.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drizzlik|r
    .turnin 628 >>Turn in Excelsior
    .target Drizzlik
step
    #loop
    .goto 1434/0,419.41,-14674.18,0
    .goto 1434/0,419.41,-14674.18,40,0
    .goto 1434/0,456.42,-14679.29,40,0
    .goto 1434/0,477.48,-14677.59,40,0
    .goto 1434/0,508.11,-14682.69,40,0
    .goto 1434/0,527.89,-14721.40,40,0
    .goto 1434/0,506.83,-14735.87,40,0
    .goto 1434/0,485.13,-14715.45,40,0
    >>Kill |cRXP_ENEMY_Bloodsail Raiders|r, |cRXP_ENEMY_Bloodsail Mages|r, |cRXP_ENEMY_Bloodsail Swashbucklers|r and |cRXP_ENEMY_Bloodsail Warlocks|r. Loot them for |cRXP_LOOT_Snuff|r
    >>Kill |cRXP_ENEMY_Bloodsail Raiders|r, |cRXP_ENEMY_Bloodsail Mages|r, |cRXP_ENEMY_Bloodsail Swashbucklers|r and |cRXP_ENEMY_Bloodsail Warlocks|r. Loot them for |cRXP_LOOT_Dizzy's Eye|r
    .complete 587,1 --Snuff (15)
    .complete 576,1 --Dizzy's Eye (1)
    .mob Bloodsail Raider
    .mob Bloodsail Mage
    .mob Bloodsail Swashbuckler
    .mob Bloodsail Warlock
step
    .goto 1434/0,-54.72,-11616.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barnil Stonepot|r
    .turnin 338 >>Turn in The Green Hills of Stranglethorn
    .target Barnil Stonepot
    .isQuestComplete 338
step
    .goto 1434/0,503.00,-14459.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deeg|r
    .turnin 587 >>Turn in Up to Snuff
    .target Deeg
step
    .goto 1434/0,396.43,-14397.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dizzy One-Eye|r
    .turnin 576 >>Turn in Keep An Eye Out
    .target Dizzy One-Eye
step
    .goto 1434/0,497.90,-14449.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kebok|r
    .accept 209 >>Accept Skullsplitter Tusks
    .target Kebok
step
    .goto 1434/0,490.24,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Crank Fizzlebub|r
    .accept 600 >>Accept Venture Company Mining
    .target Crank Fizzlebub
step
    #loop
    .goto 1434/0,-470.14,-13135.03,0
    .goto 1434/0,-470.14,-13135.03,40,0
    .goto 1434/0,-472.05,-13073.34,40,0
    .goto 1434/0,-462.48,-12979.75,40,0
    .goto 1434/0,-483.54,-12930.40,40,0
    .goto 1434/0,-406.97,-12952.10,40,0
    .goto 1434/0,-354.00,-13031.65,40,0
    .goto 1434/0,-395.48,-13023.99,40,0
    .goto 1434/0,-430.58,-13018.46,40,0
    .goto 1434/0,-432.49,-13066.96,40,0
    >>Kill |cRXP_ENEMY_Venture Co. Strip Miners|r, |cRXP_ENEMY_Venture Co. Foremans|r, |cRXP_ENEMY_Venture Co. Surveyors|r and |cRXP_ENEMY_Venture Co. Tinkerers|r. Loot them for |cRXP_LOOT_Singing Blue Crystal|r
    .complete 600,1 --Singing Blue Crystal (10)
    .mob Venture Co. Strip Miner
    .mob Venture Co. Foreman
    .mob Venture Co. Surveyor
    .mob Venture Co. Tinkerer
step
    #loop
    .goto 1434/0,-560.75,-13106.95,0
    .goto 1434/0,-560.75,-13106.95,40,0
    .goto 1434/0,-609.25,-12984.00,40,0
    .goto 1434/0,-573.52,-12877.65,40,0
    .goto 1434/0,-718.37,-12959.33,40,0
    .goto 1434/0,-774.53,-12858.08,40,0
    .goto 1434/0,-887.47,-12874.67,40,0
    .goto 1434/0,-820.47,-12963.16,40,0
    .goto 1434/0,-843.44,-13054.62,40,0
    .goto 1434/0,-749.64,-13072.06,40,0
    >>Kill |cRXP_ENEMY_Skullsplitter Warriors|r, |cRXP_ENEMY_Skullsplitter Hunters|r, |cRXP_ENEMY_Skullsplitter Witch Doctors|r and |cRXP_ENEMY_Skullsplitter Spiritchasers|r. Loot them for |cRXP_LOOT_Skullsplitter Tusk|r
    .complete 209,1 --Skullsplitter Tusk (18)
    .mob Skullsplitter Warrior
    .mob Skullsplitter Hunter
    .mob Skullsplitter Witch Doctor
    .mob Skullsplitter Spiritchaser
step
    .goto 1434/0,490.24,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Crank Fizzlebub|r
    .turnin 600 >>Turn in Venture Company Mining
    .target Crank Fizzlebub
step
    .goto 1434/0,497.90,-14449.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kebok|r
    .turnin 209 >>Turn in Skullsplitter Tusks
    .target Kebok
step
    +|cRXP_WARN_That is all of Stranglethorn Vale for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Arathi Highlands|r: Sunken Treasure
    >>|cRXP_FRIENDLY_Thousand Needles|r: Goblin Sponsorship
step
    .xp 41 >>|cRXP_WARN_The rest of Stranglethorn Vale is planned from level 41.|r Come back to this guide then
step
    .goto 1434/0,495.34,-14457.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Skindle|r
    .target Innkeeper Skindle
    .home >>Set your Hearthstone to Innkeeper Skindle's inn
step
    .goto 1434/0,501.09,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krazek|r
    .turnin 627 >>Turn in Favor for Krazek
    .target Krazek
    .isQuestComplete 627
step
    .goto 1434/0,490.24,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Crank Fizzlebub|r
    .accept 621 >>Accept Zanzil's Secret
    .target Crank Fizzlebub
step
    .goto 1434/0,-54.72,-11628.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hemet Nesingwary|r
    .accept 197 >>Accept Raptor Mastery
    .target Hemet Nesingwary
step
    .goto 1434/0,166.07,-12989.53
    >>Kill |cRXP_ENEMY_Tethis|r and loot |cRXP_LOOT_Talon of Tethis|r
    .complete 197,1 --Talon of Tethis (1)
    .mob Tethis
step
    #completewith next
    .hs >>Hearth to Innkeeper Skindle's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1434/0,487.05,-14444.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fleet Master Seahorn|r
    .accept 604 >>Accept The Bloodsail Buccaneers
    .target Fleet Master Seahorn
step
    .goto 1434/0,448.12,-14447.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Sea Wolf" MacKinley|r
    .accept 609 >>Accept Voodoo Dues
    .target "Sea Wolf" MacKinley
step
    #loop
    .goto 1434/0,500.45,-14678.44,0
    .goto 1434/0,500.45,-14678.44,40,0
    .goto 1434/0,518.95,-14692.90,40,0
    .goto 1434/0,527.89,-14721.40,40,0
    .goto 1434/0,506.83,-14735.87,40,0
    .goto 1434/0,485.13,-14715.45,40,0
    .goto 1434/0,451.31,-14703.96,40,0
    >>Kill |cRXP_ENEMY_Bloodsail Swashbucklers|r
    >>Pick up |cRXP_PICK_Bloodsail Charts|r from the ground
    >>Pick up |cRXP_PICK_Bloodsail Orders|r from the ground
    .complete 604,1 --Bloodsail Swashbuckler slain (10)
    .complete 604,2 --Bloodsail Charts (1)
    .complete 604,3 --Bloodsail Orders (1)
    .mob Bloodsail Swashbuckler
step
    .goto 1434/0,-331.67,-13646.38
    >>Kill |cRXP_ENEMY_Chucky "Ten Thumbs"|r and loot |cRXP_LOOT_Chucky's Huge Ring|r
    .complete 609,3 --Chucky's Huge Ring (1)
    .mob Chucky "Ten Thumbs"
step
    .goto 1434/0,-7.50,-13374.11
    >>Kill |cRXP_ENEMY_Maury "Club Foot" Wilkins|r and loot |cRXP_LOOT_Maury's Clubbed Foot|r
    >>Kill |cRXP_ENEMY_Jon-Jon the Crow|r and loot |cRXP_LOOT_Jon-Jon's Golden Spyglass|r
    .complete 609,1 --Maury's Clubbed Foot (1)
    .complete 609,2 --Jon-Jon's Golden Spyglass (1)
    .mob Maury "Club Foot" Wilkins
    .mob Jon-Jon the Crow
step
    #loop
    .goto 1434/0,-247.43,-13577.03,0
    .goto 1434/0,-247.43,-13577.03,40,0
    .goto 1434/0,-325.29,-13604.69,40,0
    .goto 1434/0,-443.34,-13572.35,40,0
    .goto 1434/0,-378.89,-13637.87,40,0
    .goto 1434/0,-384.63,-13683.81,40,0
    .goto 1434/0,-331.67,-13646.38,40,0
    .goto 1434/0,-311.25,-13689.34,40,0
    .goto 1434/0,-246.16,-13711.89,40,0
    .goto 1434/0,-274.24,-13646.80,40,0
    >>Kill |cRXP_ENEMY_Zanzil Zombies|r, |cRXP_ENEMY_Zanzil Hunters|r, |cRXP_ENEMY_Zanzil Witch Doctors|r and |cRXP_ENEMY_Zanzil Nagas|r. Loot them for |cRXP_LOOT_Zanzil's Mixture|r
    .complete 621,1 --Zanzil's Mixture (1)
    .mob Zanzil Zombie
    .mob Zanzil Hunter
    .mob Zanzil Witch Doctor
    .mob Zanzil Naga
step
    .goto 1434/0,-54.72,-11628.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hemet Nesingwary|r
    .turnin 197 >>Turn in Raptor Mastery
    .accept 208 >>Accept Big Game Hunter
    .target Hemet Nesingwary
step
    .goto 1434/0,-54.72,-11616.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barnil Stonepot|r
    .turnin 338 >>Turn in The Green Hills of Stranglethorn
    .target Barnil Stonepot
    .isQuestComplete 338
step
    .goto 1434/0,-217.44,-12682.38
    >>Kill |cRXP_ENEMY_King Bangalash|r and loot |cRXP_LOOT_Head of Bangalash|r
    .complete 208,1 --Head of Bangalash (1)
    .mob King Bangalash
step
    .goto 1434/0,-54.72,-11628.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hemet Nesingwary|r
    .turnin 208 >>Turn in Big Game Hunter
    .target Hemet Nesingwary
step
    .goto 1434/0,501.09,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krazek|r
    .accept 2864 >>Accept Tran'rek
    .target Krazek
step
    .goto 1434/0,487.05,-14444.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fleet Master Seahorn|r
    .turnin 604 >>Turn in The Bloodsail Buccaneers
    .target Fleet Master Seahorn
step
    .goto 1434/0,488.96,-14463.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Whiskey Slim|r
    .accept 580 >>Accept Whiskey Slim's Lost Grog
    .target Whiskey Slim
step
    .goto 1434/0,490.24,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Crank Fizzlebub|r
    .turnin 621 >>Turn in Zanzil's Secret
    .target Crank Fizzlebub
step
    .goto 1434/0,490.24,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Crank Fizzlebub|r
    .accept 1119 >>Accept Zanzil's Mixture and a Fool's Stout
    .target Crank Fizzlebub
    .isQuestTurnedIn 1118 --Back to Booty Bay
    .xp <35,1
step
    .goto 1434/0,448.12,-14447.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Sea Wolf" MacKinley|r
    .turnin 609 >>Turn in Voodoo Dues
    .accept 613 >>Accept Cracking Maury's Foot
    .accept 2872 >>Accept Stoley's Debt
    .target "Sea Wolf" MacKinley
step
    .goto 1434/0,513.21,-14418.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Privateer Bloads|r
    .accept 617 >>Accept Akiris by the Bundle
    .target Privateer Bloads
step
    #loop
    .goto 1434/0,658.70,-13908.01,0
    .goto 1434/0,658.70,-13908.01,40,0
    .goto 1434/0,681.68,-13818.67,40,0
    .goto 1434/0,622.97,-13741.67,40,0
    .goto 1434/0,616.59,-13668.92,40,0
    .goto 1434/0,574.47,-13705.51,40,0
    .goto 1434/0,494.07,-13708.06,40,0
    .goto 1434/0,541.29,-13748.90,40,0
    .goto 1434/0,582.77,-13777.40,40,0
    .goto 1434/0,583.40,-13856.96,40,0
    >>Kill |cRXP_ENEMY_Naga Explorers|r and |cRXP_ENEMY_Brinescale Skirmishers|r. Loot them for |cRXP_LOOT_Akiris Reed|r
    .complete 617,1 --Akiris Reed (1)
    .mob Naga Explorer
    .mob Brinescale Skirmisher
step
    #loop
    .goto 1434/0,-851.10,-12484.56,0
    .goto 1434/0,-851.10,-12484.56,40,0
    .goto 1434/0,-890.66,-12507.54,40,0
    .goto 1434/0,-921.29,-12479.03,40,0
    .goto 1434/0,-958.94,-12482.01,40,0
    .goto 1434/0,-1006.16,-12499.45,40,0
    .goto 1434/0,-951.29,-12442.87,40,0
    .goto 1434/0,-896.41,-12448.40,40,0
    .goto 1434/0,-891.30,-12386.72,40,0
    .goto 1434/0,-844.72,-12428.83,40,0
    >>Kill |cRXP_ENEMY_Mosh'Ogg Maulers|r, |cRXP_ENEMY_Mosh'Ogg Shamans|r, |cRXP_ENEMY_Mosh'Ogg Lords|r and |cRXP_ENEMY_Mosh'Ogg Warmongers|r. Loot them for |cRXP_LOOT_Maury's Key|r
    .complete 613,1 --Maury's Key (1)
    .mob Mosh'Ogg Mauler
    .mob Mosh'Ogg Shaman
    .mob Mosh'Ogg Lord
    .mob Mosh'Ogg Warmonger
step
    .goto 1434/0,448.12,-14447.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Sea Wolf" MacKinley|r
    .turnin 613 >>Turn in Cracking Maury's Foot
    .target "Sea Wolf" MacKinley
step
    .goto 1434/0,513.21,-14418.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Privateer Bloads|r
    .turnin 617 >>Turn in Akiris by the Bundle
    .accept 623 >>Accept Akiris by the Bundle
    .target Privateer Bloads
step
    .goto 1434/0,488.96,-14463.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Whiskey Slim|r
    .turnin 580 >>Turn in Whiskey Slim's Lost Grog
    .target Whiskey Slim
    .isQuestComplete 580
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
    +|cRXP_WARN_That is all of Stranglethorn Vale for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Dustwallow Marsh|r: Akiris by the Bundle
    >>|cRXP_FRIENDLY_Tanaris|r: Tran'rek, Stoley's Debt
    >>|cRXP_FRIENDLY_Thousand Needles|r: Zanzil's Mixture and a Fool's Stout
    >>|cRXP_FRIENDLY_The Hinterlands and back here|r: Whiskey Slim's Lost Grog
step
    .xp 44 >>|cRXP_WARN_The rest of Stranglethorn Vale is planned from level 44.|r Come back to this guide then
step
    .goto 1434/0,501.09,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krazek|r
    .turnin 627 >>Turn in Favor for Krazek
    .target Krazek
    .isQuestComplete 627
step
    .goto 1434/0,-54.72,-11616.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barnil Stonepot|r
    .turnin 338 >>Turn in The Green Hills of Stranglethorn
    .target Barnil Stonepot
    .isQuestComplete 338
step
    .goto 1434/0,458.97,-14433.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fin Fizracket|r
    .accept 348 >>Accept Stranglethorn Fever
    .target Fin Fizracket
step
    .goto 1434/0,488.96,-14463.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Whiskey Slim|r
    .turnin 580 >>Turn in Whiskey Slim's Lost Grog
    .target Whiskey Slim
    .isQuestComplete 580
step
    .goto 1434/0,-15.79,-13758.69
    >>Kill |cRXP_ENEMY_Mokk the Savage|r and loot |cRXP_LOOT_Heart of Mokk|r
    .complete 348,1 --Heart of Mokk (1)
    .mob Mokk the Savage
step
    .goto 1434/0,458.97,-14433.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fin Fizracket|r
    .turnin 348 >>Turn in Stranglethorn Fever
    .target Fin Fizracket
step
    .xp 47 >>|cRXP_WARN_The rest of Stranglethorn Vale is planned from level 47.|r Come back to this guide then
step
    .goto 1434/0,-193.19,-11320.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Nimetz|r
    .accept 206 >>Accept Mai'Zoth
    .target Brother Nimetz
step
    .goto 1434/0,-1156.76,-12342.90
    >>Kill |cRXP_ENEMY_Mai'Zoth|r and loot |cRXP_LOOT_Mind's Eye|r
    .complete 206,1 --Mind's Eye (1)
    .mob Mai'Zoth
step
    .goto 1434/0,-193.19,-11320.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Nimetz|r
    .turnin 206 >>Turn in Mai'Zoth
    .target Brother Nimetz
step
    .goto 1434/0,501.09,-14453.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krazek|r
    .turnin 627 >>Turn in Favor for Krazek
    .target Krazek
    .isQuestComplete 627
step
    .goto 1434/0,-54.72,-11616.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barnil Stonepot|r
    .turnin 338 >>Turn in The Green Hills of Stranglethorn
    .target Barnil Stonepot
    .isQuestComplete 338
step
    .goto 1434/0,517.68,-14300.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Hecklebury Smotts|r
    .accept 8551 >>Accept The Captain's Chest
    .target Captain Hecklebury Smotts
step
    .goto 1434/0,488.96,-14463.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Whiskey Slim|r
    .turnin 580 >>Turn in Whiskey Slim's Lost Grog
    .target Whiskey Slim
    .isQuestComplete 580
step
    .goto 1434/0,487.05,-14444.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fleet Master Seahorn|r
    .accept 608 >>Accept The Bloodsail Buccaneers
    .target Fleet Master Seahorn
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
    .goto 1434/0,349.85,-14924.75
    >>Kill |cRXP_ENEMY_Captain Keelhaul|r
    >>Kill |cRXP_ENEMY_Fleet Master Firallon|r
    .complete 608,2 --Captain Keelhaul slain (1)
    .complete 608,3 --Fleet Master Firallon slain (1)
    .mob Captain Keelhaul
    .mob Fleet Master Firallon
step
    .goto 1434/0,123.32,-14920.92
    >>Kill |cRXP_ENEMY_Captain Stillwater|r
    .complete 608,1 --Captain Stillwater slain (1)
    .mob Captain Stillwater
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
    .goto 1434/0,487.05,-14444.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fleet Master Seahorn|r
    .turnin 608 >>Turn in The Bloodsail Buccaneers
    .target Fleet Master Seahorn
step
    +|cRXP_WARN_End of the Stranglethorn Vale route.|r
]])
