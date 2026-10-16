-- 43-60 Tanaris: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 3 parts with a level check between them (from level 43, 46, 49).
-- Sections (the guide starts at the one for your level): around Chief Engineer Bilgewhizzle from 43; around Senior Surveyor Fizzledowser from 46; part 3 from 49.
-- Edit zones/Tanaris.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#name 43-60 Tanaris
#next Zone Routes (Horde)\50-56 Un'Goro Crater

step
    .xp <46,1,RBSection1_1
    .xp 46 >>Finding the place in this guide for your level
step
    .xp <49,1,RBSection2_1
    .xp 49 >>Finding the place in this guide for your level
step
    .xp <61,1,RBSection3_1
step
    #label RBSection1_1
    #completewith next
    +|cRXP_WARN_Tanaris: around Chief Engineer Bilgewhizzle|r (planned from level 43)
step
    .goto 1446/1,-3730.16,-7115.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alchemist Pestlezugg|r
    .turnin 4494 >>Turn in March of the Silithid
    .target Alchemist Pestlezugg
    .isOnQuest 4494
step
    .goto 1446/1,-3777.08,-7105.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tran'rek|r
    .turnin 2864 >>Turn in Tran'rek
    .target Tran'rek
    .isOnQuest 2864
step
    .goto 1446/1,-3839.18,-7127.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mux Manascrambler|r
    .turnin 8923 >>Turn in A Supernatural Device
    .target Mux Manascrambler
    .isOnQuest 8923
step
    .goto 1446/1,-3841.94,-7158.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Fizzgrimble|r
    .target Innkeeper Fizzgrimble
    .home >>Set your Hearthstone to Innkeeper Fizzgrimble's inn
step
    .goto 1446/1,-3769.49,-7200.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krinkle Goodsteel|r
    .turnin 4450 >>Turn in Ledger from Tanaris
    .target Krinkle Goodsteel
    .isQuestComplete 4450
step
    .goto 1446/1,-3769.49,-7200.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krinkle Goodsteel|r
    .turnin 5514 >>Turn in Mold Rhymes With...
    .target Krinkle Goodsteel
    .isOnQuest 5514
step
    .goto 1446/1,-3838.49,-7186.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Bilgewhizzle|r
    .turnin 243 >>Turn in Into the Field
    .target Chief Engineer Bilgewhizzle
    .isOnQuest 243
step
    .goto 1446/1,-3838.49,-7186.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Bilgewhizzle|r
    .accept 379 >>Accept Slake That Thirst
    .target Chief Engineer Bilgewhizzle
    .isQuestTurnedIn 243 --any of: Into the Field
    .xp <38,1
step
    .goto 1446/1,-3838.49,-7186.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Bilgewhizzle|r
    .accept 1690 >>Accept Wastewander Justice
    .target Chief Engineer Bilgewhizzle
step
    .goto 1446/1,-3840.56,-7183.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spigot Operator Luglunket|r
    .accept 1707 >>Accept Water Pouch Bounty
    .target Spigot Operator Luglunket
step << Hunter
    .goto 1446/1,-3949.58,-7356.66
    >>|cRXP_WARN_Cast|r |T132164:0|t[Tame Beast] |cRXP_WARN_on a |cRXP_ENEMY_Scorpid Hunter|r to tame it|r
    .train 2976 >>|cRXP_WARN_Attack mobs with it to learn|r |T132140:0|t[Claw (Rank 6)]
    .xp <40,1
    .zoneskip Tanaris,1
step << Hunter
    .goto 1446/1,-3824.21,-7163.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Laziphus|r
    .target Laziphus
    .train 2976,3
    .zoneskip Tanaris,1
step
    #completewith Drop351x1
    >>|cRXP_LOOT_OOX-17/TN Distress Beacon|r can drop from |cRXP_ENEMY_Glasshide Basilisk|r, |cRXP_ENEMY_Glasshide Gazer|r, |cRXP_ENEMY_Glasshide Petrifier|r. Use it to start the quest if you get one
    .collect 8623,1,351 --OOX-17/TN Distress Beacon (1)
    .accept 351 >>Accept Find OOX-17/TN!
    .use 8623
step
    #completewith Drop351x1
    >>As you go: Kill |cRXP_ENEMY_Wastewander Bandits|r. Kill |cRXP_ENEMY_Wastewander Thiefs|r. |cRXP_WARN_Anything left is finished later|r
    .complete 1690,1 --Wastewander Bandit slain (10)
    .complete 1690,2 --Wastewander Thief slain (8)
    .mob Wastewander Bandit
    .mob Wastewander Thief
step
    #loop
    .goto 1446/1,-4544.36,-7257.76,0
    .goto 1446/1,-4544.36,-7257.76,40,0
    .goto 1446/1,-4554.71,-7291.34,40,0
    .goto 1446/1,-4556.78,-7387.94,40,0
    .goto 1446/1,-4606.46,-7444.06,40,0
    .goto 1446/1,-4616.12,-7411.40,40,0
    .goto 1446/1,-4608.53,-7381.96,40,0
    .goto 1446/1,-4627.85,-7311.58,40,0
    .goto 1446/1,-4629.92,-7213.14,40,0
    .goto 1446/1,-4594.04,-7225.10,40,0
    >>Kill |cRXP_ENEMY_Wastewander Rogues|r, |cRXP_ENEMY_Wastewander Thiefs|r, |cRXP_ENEMY_Wastewander Shadow Mages|r and |cRXP_ENEMY_Wastewander Bandits|r. Loot them for |cRXP_LOOT_Wastewander Water Pouch|r
    .complete 1707,1 --Wastewander Water Pouch (5)
    .mob Wastewander Rogue
    .mob Wastewander Thief
    .mob Wastewander Shadow Mage
    .mob Wastewander Bandit
step
    .goto 1446/1,-5305.43,-8030.56
    .xp 44 >> AoE Grind to 44
    >>Use any Captain's Keys you get on the 2nd floor of the 2nd ship to the east
    >>Start saving the Silk Cloth and Mageweave Cloth you get. You need 12 stacks of each for later
step
    .goto 1446/1,-5305.43,-8030.56
    .xp 48 >> AoE grind to 48
    >>Use any Captain's Keys you get on the 2nd floor of the 2nd ship to the east
step
    .trainer >> Teleport to Orgrimmar or Undercity. Train your level 46-48 spells
step
    .goto 1446/1,-5305.43,-8030.56
    .xp 52 >> AoE grind to 52
    >>Use any Captain's Keys you get on the 2nd floor of the 2nd ship to the east
    >>Remember to save 12 stacks of Mageweave. You'll need it for cloth turnins later
step
    #label Drop351x1
    #loop
    .goto 1446/1,-4627.85,-7311.58,0
    .goto 1446/1,-4627.85,-7311.58,40,0
    .goto 1446/1,-4608.53,-7381.96,40,0
    .goto 1446/1,-4616.12,-7411.40,40,0
    .goto 1446/1,-4606.46,-7444.06,40,0
    .goto 1446/1,-4556.78,-7387.94,40,0
    .goto 1446/1,-4554.71,-7291.34,40,0
    .goto 1446/1,-4544.36,-7257.76,40,0
    .goto 1446/1,-4594.04,-7225.10,40,0
    .goto 1446/1,-4629.92,-7213.14,40,0
    >>Kill |cRXP_ENEMY_Wastewander Rogues|r, |cRXP_ENEMY_Wastewander Thiefs|r, |cRXP_ENEMY_Wastewander Shadow Mages|r and |cRXP_ENEMY_Wastewander Bandits|r. Loot them for |cRXP_LOOT_Wastewander Water Pouch|r
    .complete 379,1 --Wastewander Water Pouch (5)
    .mob Wastewander Rogue
    .mob Wastewander Thief
    .mob Wastewander Shadow Mage
    .mob Wastewander Bandit
    .isOnQuest 379
step
    .goto 1446/1,-4841.06,-6903.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yeh'kinya|r
    .accept 3528 >>Accept The God Hakkar
    .target Yeh'kinya
    .isQuestTurnedIn 4787 --any of: The Ancient Egg
    .xp <40,1
step
    .goto 1446/1,-4841.06,-6903.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yeh'kinya|r
    .turnin 3528 >>Turn in The God Hakkar
    .target Yeh'kinya
    .isOnQuest 3528
step
    .goto 1446/1,-4841.06,-6903.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yeh'kinya|r
    .accept 3520 >>Accept Screecher Spirits
    .target Yeh'kinya
step
    .goto 1446/1,-4849.34,-6978.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Stoley|r
    .turnin 2872 >>Turn in Stoley's Debt
    .target Stoley
    .isOnQuest 2872
step
    #completewith Drop351x2
    >>|cRXP_LOOT_OOX-17/TN Distress Beacon|r can drop from |cRXP_ENEMY_Glasshide Basilisk|r, |cRXP_ENEMY_Glasshide Gazer|r, |cRXP_ENEMY_Glasshide Petrifier|r. Use it to start the quest if you get one
    .collect 8623,1,351 --OOX-17/TN Distress Beacon (1)
    .accept 351 >>Accept Find OOX-17/TN!
    .use 8623
step
    #label Drop351x2
    #loop
    .goto 1446/1,-4645.10,-7218.66,0
    .goto 1446/1,-4645.10,-7218.66,40,0
    .goto 1446/1,-4617.50,-7215.90,40,0
    .goto 1446/1,-4594.04,-7225.10,40,0
    .goto 1446/1,-4544.36,-7257.76,40,0
    .goto 1446/1,-4556.78,-7387.94,40,0
    .goto 1446/1,-4590.59,-7382.42,40,0
    .goto 1446/1,-4616.12,-7411.40,40,0
    .goto 1446/1,-4627.85,-7311.58,40,0
    .goto 1446/1,-4620.26,-7244.88,40,0
    >>Kill |cRXP_ENEMY_Wastewander Bandits|r
    >>Kill |cRXP_ENEMY_Wastewander Thiefs|r
    .complete 1690,1 --Wastewander Bandit slain (10)
    .complete 1690,2 --Wastewander Thief slain (8)
    .mob Wastewander Bandit
    .mob Wastewander Thief
step << Shaman
    .goto 1446/1,-3850.22,-7168.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dirge Quikcleave|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Dirge Quikcleave
    .subzoneskip 976,1
step
    .goto 1446/1,-3840.56,-7183.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spigot Operator Luglunket|r
    .turnin 1707 >>Turn in Water Pouch Bounty while you are here
    .isQuestComplete 1707
    .target Spigot Operator Luglunket
step
    .goto 1446/1,-3838.49,-7186.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Bilgewhizzle|r
    .turnin 1690 >>Turn in Wastewander Justice while you are here
    .isQuestComplete 1690
    .target Chief Engineer Bilgewhizzle
step
    #completewith next
    .hs >>Hearth to Innkeeper Fizzgrimble's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1446/1,-3838.49,-7186.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Bilgewhizzle|r
    .turnin 379 >>Turn in Slake That Thirst
    .target Chief Engineer Bilgewhizzle
    .isOnQuest 379
step
    #completewith next
    .hs >>Hearth to Innkeeper Fizzgrimble's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1446/1,-3838.49,-7186.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Bilgewhizzle|r
    .turnin 1690 >>Turn in Wastewander Justice
    .accept 1691 >>Accept More Wastewander Justice
    .target Chief Engineer Bilgewhizzle
step
    .goto 1446/1,-3840.56,-7183.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spigot Operator Luglunket|r
    .turnin 1707 >>Turn in Water Pouch Bounty
    .target Spigot Operator Luglunket
step << !Shaman
    .goto 1446/1,-3850.22,-7168.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dirge Quikcleave|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Dirge Quikcleave
    .subzoneskip 976,1
step
    #completewith Drop351x3
    >>|cRXP_LOOT_OOX-17/TN Distress Beacon|r can drop from |cRXP_ENEMY_Glasshide Basilisk|r, |cRXP_ENEMY_Glasshide Gazer|r, |cRXP_ENEMY_Glasshide Petrifier|r. Use it to start the quest if you get one
    .collect 8623,1,351 --OOX-17/TN Distress Beacon (1)
    .accept 351 >>Accept Find OOX-17/TN!
    .use 8623
step
    #loop
    .goto 1446/1,-4584.38,-7596.32,0
    .goto 1446/1,-4584.38,-7596.32,40,0
    .goto 1446/1,-4594.73,-7619.78,40,0
    .goto 1446/1,-4614.74,-7651.52,40,0
    .goto 1446/1,-4678.91,-7683.72,40,0
    .goto 1446/1,-4645.10,-7687.86,40,0
    .goto 1446/1,-4635.44,-7707.18,40,0
    .goto 1446/1,-4594.04,-7717.30,40,0
    >>Kill |cRXP_ENEMY_Wastewander Rogues|r
    >>Kill |cRXP_ENEMY_Wastewander Assassins|r
    .complete 1691,1 --Wastewander Rogue slain (8)
    .complete 1691,2 --Wastewander Assassin slain (6)
    .mob Wastewander Rogue
    .mob Wastewander Assassin
step
    #label Drop351x3
    #loop
    .goto 1446/1,-4514.00,-7485.00,0
    .goto 1446/1,-4514.00,-7485.00,40,0
    .goto 1446/1,-4496.06,-7489.60,40,0
    .goto 1446/1,-4351.85,-7585.28,40,0
    .goto 1446/1,-4290.44,-7580.68,40,0
    .goto 1446/1,-4284.92,-7524.10,40,0
    .goto 1446/1,-4480.19,-7457.40,40,0
    >>Kill |cRXP_ENEMY_Wastewander Shadow Mages|r
    .complete 1691,3 --Wastewander Shadow Mage slain (10)
    .mob Wastewander Shadow Mage
step
    .goto 1446/1,-3838.49,-7186.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Bilgewhizzle|r
    .turnin 1691 >>Turn in More Wastewander Justice
    .target Chief Engineer Bilgewhizzle
step
    .hs >> Hearth to Feralas
    .subzoneskip 1099
    .cooldown item,6948,>0,1
step
    .goto 1446/1,-3734.99,-7128.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shreev|r
    .turnin 1188 >>Turn in Safety First
    .target Shreev
    .isOnQuest 1188
step
    .goto 1446/1,-3734.99,-7128.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shreev|r
    .accept 1189 >>Accept Safety First
    .target Shreev
    .isQuestTurnedIn 1188 --any of: Safety First
    .xp <29,1
step
    .goto 1446/1,-3683.24,-7139.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senior Surveyor Fizzledowser|r
    .accept 992 >>Accept Gadgetzan Water Survey
    .target Senior Surveyor Fizzledowser
step
    .goto 1446/1,-2909.75,-7209.00
    >>Open the |cRXP_PICK_Sandsorrow Watch Water Hole|r. Loot it for |cRXP_LOOT_Tapped Dowsing Widget|r
    .complete 992,1 --Tapped Dowsing Widget (1)
step
    .goto 1446/1,-3683.24,-7139.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senior Surveyor Fizzledowser|r
    .turnin 992 >>Turn in Gadgetzan Water Survey
    .target Senior Surveyor Fizzledowser
step
    .goto 1446/1,-3939.23,-6948.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gaeriyan|r
    .turnin 3912 >>Turn in Meet at the Grave
    .target Gaeriyan
    .isOnQuest 3912
step
    .goto 1446/1,-4829.33,-6900.34
    >>Click the |cRXP_PICK_Wanted Poster|r
    .accept 2875 >>Accept WANTED: Andre Firebeard
step
    .goto 1446/1,-3833.66,-7115.62
    >>Click the |cRXP_PICK_Egg-O-Matic|r
    .accept 2741 >>Accept The Super Egg-O-Matic
step
    .goto 1446/1,-4811.39,-6899.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Haughty Modiste|r
    .accept 8365 >>Accept Pirate Hats Ahoy!
    .target Haughty Modiste
step
    .goto 1446/1,-4845.89,-6973.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Security Chief Bilgewhizzle|r
    .accept 8366 >>Accept Southsea Shakedown
    .target Security Chief Bilgewhizzle
step
    .goto 1446/1,-4849.34,-6978.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Stoley|r
    .accept 2873 >>Accept Stoley's Shipment
    .target Stoley
step
    #completewith Drop351x4
    >>|cRXP_LOOT_OOX-17/TN Distress Beacon|r can drop from |cRXP_ENEMY_Glasshide Basilisk|r, |cRXP_ENEMY_Glasshide Gazer|r, |cRXP_ENEMY_Glasshide Petrifier|r. Use it to start the quest if you get one
    .collect 8623,1,351 --OOX-17/TN Distress Beacon (1)
    .accept 351 >>Accept Find OOX-17/TN!
    .use 8623
step
    #label Drop351x4
    #loop
    .goto 1446/1,-5110.85,-7829.08,0
    .goto 1446/1,-5110.85,-7829.08,40,0
    .goto 1446/1,-5204.69,-7906.82,40,0
    .goto 1446/1,-5252.99,-8014.46,40,0
    .goto 1446/1,-5371.67,-7976.28,40,0
    .goto 1446/1,-5383.40,-8072.88,40,0
    .goto 1446/1,-5301.98,-8096.34,40,0
    .goto 1446/1,-5213.66,-8110.60,40,0
    .goto 1446/1,-5110.85,-8052.18,40,0
    .goto 1446/1,-5147.42,-7971.22,40,0
    >>Kill |cRXP_ENEMY_Andre Firebeard|r and loot |cRXP_LOOT_Firebeard's Head|r
    >>Open the |cRXP_PICK_Stolen Cargo|r. Loot it for |cRXP_LOOT_Stoley's Shipment|r
    >>Kill |cRXP_ENEMY_Southsea Pirates|r
    >>Kill |cRXP_ENEMY_Southsea Freebooters|r
    >>Kill |cRXP_ENEMY_Southsea Dock Workers|r
    >>Kill |cRXP_ENEMY_Southsea Swashbucklers|r
    >>Kill |cRXP_ENEMY_Southsea Pirates|r, |cRXP_ENEMY_Southsea Freebooters|r, |cRXP_ENEMY_Southsea Dock Workers|r and |cRXP_ENEMY_Southsea Swashbucklers|r. Loot them for |cRXP_LOOT_Southsea Pirate Hat|r
    .complete 2875,1 --Firebeard's Head (1)
    .complete 2873,1 --Stoley's Shipment (1)
    .complete 8366,1 --Southsea Pirate slain (10)
    .complete 8366,2 --Southsea Freebooter slain (10)
    .complete 8366,3 --Southsea Dock Worker slain (10)
    .complete 8366,4 --Southsea Swashbuckler slain (10)
    .complete 8365,1 --Southsea Pirate Hat (20)
    .mob Andre Firebeard
    .mob Southsea Pirate
    .mob Southsea Freebooter
    .mob Southsea Dock Worker
    .mob Southsea Swashbuckler
step
    .goto 1446/1,-5113.61,-7846.10,50,0
    .goto 1446/1,-5201.93,-7915.10,50,0
    .goto 1446/1,-5226.77,-7958.80,50,0
    .goto 1446/1,-5122.58,-7992.38,50,0
    .goto 1446/1,-5135.00,-8082.08,50,0
    .goto 1446/1,-5213.66,-8093.58,50,0
    .goto 1446/1,-5227.46,-8041.60,50,0
    .goto 1446/1,-5274.38,-8082.54,50,0
    .goto 1446/1,-5342.00,-8049.42,50,0
    .goto 1446/1,-5302.67,-7985.94,50,0
    .goto 1446/1,-5226.77,-7958.80,50,0
    .goto 1446/1,-5201.93,-7915.10,50,0
    >>Kill |cRXP_ENEMY_Southsea Pirates|r
    .xp 47 >> Grind to level 47
step
    .goto 1446/1,-3855.74,-7987.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marvon Rivetseeker|r
    .turnin 3380 >>Turn in The Sunken Temple
    .target Marvon Rivetseeker
    .isOnQuest 3380
step
    .goto 1446/1,-2815.22,-9619.40
    >>Click the |cRXP_PICK_Uldum Pedestal|r
    .turnin 2966 >>Turn in Seeing What Happens
    .isOnQuest 2966
step
    .goto 1446/1,-4845.89,-6973.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Security Chief Bilgewhizzle|r
    .turnin 2875 >>Turn in WANTED: Andre Firebeard
    .turnin 8366 >>Turn in Southsea Shakedown
    .target Security Chief Bilgewhizzle
step
    .goto 1446/1,-4849.34,-6978.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Stoley|r
    .turnin 2873 >>Turn in Stoley's Shipment
    .accept 2874 >>Accept Deliver to MacKinley
    .target Stoley
step
    .goto 1446/1,-4811.39,-6899.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Haughty Modiste|r
    .turnin 8365 >>Turn in Pirate Hats Ahoy!
    .target Haughty Modiste
step
    .goto 1446/1,-4841.06,-6903.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yeh'kinya|r
    .turnin 3520 >>Turn in Screecher Spirits
    .target Yeh'kinya
    .isQuestComplete 3520
step
    .goto 1446/1,-4841.06,-6903.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yeh'kinya|r
    .accept 3527 >>Accept The Prophecy of Mosh'aru
    .target Yeh'kinya
    .isQuestTurnedIn 3520 --any of: Screecher Spirits
    .xp <40,1
step
    .goto 1446/1,-3850.22,-7168.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dirge Quikcleave|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Dirge Quikcleave
    .subzoneskip 976,1
step
    .goto 1446/1,-4834.16,-6980.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Ironboot|r
    .accept 8182 >>Accept The Hand of Rastakhan
    .target Prospector Ironboot
    .isQuestTurnedIn 8181 --any of: Confront Yeh'kinya
    .xp <40,1
step
    .goto 1446/1,-4834.16,-6980.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Ironboot|r
    .accept 5065 >>Accept The Lost Tablets of Mosh'aru
    .target Prospector Ironboot
    .isQuestTurnedIn 3528 --any of: The God Hakkar
    .xp <40,1
step
    .goto 1446/1,-4374.62,-8852.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Homing Robot OOX-17/TN|r
    .turnin 351 >>Turn in Find OOX-17/TN!
    .target Homing Robot OOX-17/TN
    .isOnQuest 351
step
    .goto 1446/1,-3850.22,-7168.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dirge|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Dirge Quikcleave
    .isQuestComplete 10
step
    #completewith next
    .hs >>Hearth to Innkeeper Fizzgrimble's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1446/1,-3766.04,-7197.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trenton Lighthammer|r
    .accept 3042 >>Accept Troll Temper
    .target Trenton Lighthammer
step
    .goto 1446/1,-3838.49,-7186.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Bilgewhizzle|r
    .accept 2768 >>Accept Divino-matic Rod
    .target Chief Engineer Bilgewhizzle
step
    .goto 1446/1,-3766.04,-7197.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trenton Lighthammer|r
    .turnin 3042 >>Turn in Troll Temper
    .target Trenton Lighthammer
    .isQuestComplete 3042
step
    .goto 1446/1,-3838.49,-7186.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Bilgewhizzle|r
    .turnin 2768 >>Turn in Divino-matic Rod
    .target Chief Engineer Bilgewhizzle
    .isQuestComplete 2768
step
    .goto 1446/1,-3777.08,-7105.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tran'rek|r
    .accept 2865 >>Accept Scarab Shells
    .target Tran'rek
step
    .goto 1446/1,-3777.08,-7105.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tran'rek|r
    .turnin 2865 >>Turn in Scarab Shells
    .target Tran'rek
    .isQuestComplete 2865
step
    .goto 1446/1,-3833.66,-7115.62
    >>Click the |cRXP_PICK_Egg-O-Matic|r
    .turnin 2741 >>Turn in The Super Egg-O-Matic
    .isQuestComplete 2741
step
    .goto 1446/1,-3838.49,-7186.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Bilgewhizzle|r
    .accept 864 >>Accept Return to Apothecary Zinge
    .target Chief Engineer Bilgewhizzle
    .isQuestTurnedIn 654 --any of: Tanaris Field Sampling
    .xp <38,1
step
    .goto 1446/1,-4841.06,-6903.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yeh'kinya|r
    .accept 4787 >>Accept The Ancient Egg
    .target Yeh'kinya
    .isQuestTurnedIn 3527 --any of: The Prophecy of Mosh'aru
    .xp <40,1
step
    .goto 1446/1,-4841.06,-6903.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yeh'kinya|r
    .turnin 3527 >>Turn in The Prophecy of Mosh'aru
    .target Yeh'kinya
    .isQuestComplete 3527
step
    .goto 1446/1,-4841.06,-6903.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yeh'kinya|r
    .turnin 4787 >>Turn in The Ancient Egg
    .target Yeh'kinya
    .isQuestComplete 4787
step
    .goto 1446/1,-4834.16,-6980.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Ironboot|r
    .turnin 5065 >>Turn in The Lost Tablets of Mosh'aru
    .target Prospector Ironboot
    .isQuestComplete 5065
step
    +|cRXP_WARN_That is all of Tanaris for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Stranglethorn Vale|r: Deliver to MacKinley, The Hand of Rastakhan
    >>|cRXP_FRIENDLY_Thousand Needles|r: Safety First
    >>|cRXP_FRIENDLY_Undercity|r: Return to Apothecary Zinge
    >>|cRXP_FRIENDLY_Feralas and back here|r: Screecher Spirits, The Super Egg-O-Matic
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Scarab Shells, Troll Temper, Divino-matic Rod
step
    .xp 46 >>|cRXP_WARN_The rest of Tanaris is planned from level 46.|r Come back to this guide then
step
    #label RBSection2_1
    #completewith next
    +|cRXP_WARN_Tanaris: around Senior Surveyor Fizzledowser|r (planned from level 46)
step
    .goto 1446/1,-4829.33,-6900.34
    >>Click the |cRXP_PICK_Wanted Poster|r
    .accept 2781 >>Accept WANTED: Caliph Scorpidsting
step
    .goto 1446/1,-4480.88,-7630.82
    >>Kill |cRXP_ENEMY_Caliph Scorpidsting|r and loot |cRXP_LOOT_Caliph Scorpidsting's Head|r
    .complete 2781,1 --Caliph Scorpidsting's Head (1)
    .mob Caliph Scorpidsting
step
    .goto 1446/1,-3838.49,-7186.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Bilgewhizzle|r
    .turnin 2781 >>Turn in WANTED: Caliph Scorpidsting
    .target Chief Engineer Bilgewhizzle
step
    .goto 1446/1,-3683.24,-7139.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senior Surveyor Fizzledowser|r
    .accept 82 >>Accept Noxious Lair Investigation
    .target Senior Surveyor Fizzledowser
    .isQuestTurnedIn 992 --any of: Gadgetzan Water Survey
step
    .goto 1446/1,-3793.64,-7193.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marin Noggenfogger|r
    .accept 2605 >>Accept The Thirsty Goblin
    .target Marin Noggenfogger
step
    .goto 1446/1,-3833.66,-7115.62
    >>Click the |cRXP_PICK_Egg-O-Matic|r
    .turnin 2741 >>Turn in The Super Egg-O-Matic
    .isQuestComplete 2741
step
    .goto 1446/1,-4841.06,-6903.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yeh'kinya|r
    .turnin 3520 >>Turn in Screecher Spirits
    .target Yeh'kinya
    .isQuestComplete 3520
step
    .goto 1446/1,-3855.74,-7987.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marvon Rivetseeker|r
    .accept 3161 >>Accept Gahz'ridian
    .target Marvon Rivetseeker
step
    #loop
    .goto 1446/1,-3482.45,-8791.40,0
    .goto 1446/1,-3482.45,-8791.40,40,0
    .goto 1446/1,-3406.55,-8786.80,40,0
    .goto 1446/1,-3316.85,-8837.40,40,0
    .goto 1446/1,-3399.65,-8892.60,40,0
    .goto 1446/1,-3378.95,-8947.80,40,0
    .goto 1446/1,-3468.65,-8911.00,40,0
    .goto 1446/1,-3537.65,-8980.00,40,0
    .goto 1446/1,-3523.85,-8901.80,40,0
    .goto 1446/1,-3544.55,-8851.20,40,0
    >>Loot the |cRXP_PICK_Gahz'ridians|r for |cRXP_LOOT_Gahz'ridian Ornament|r
    .complete 3161,1 --Gahz'ridian Ornament (30)
step
    .goto 1446/1,-3855.74,-7987.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marvon Rivetseeker|r
    .turnin 3161 >>Turn in Gahz'ridian
    .target Marvon Rivetseeker
step
    #loop
    .goto 1446/1,-2697.23,-7894.86,0
    .goto 1446/1,-2697.23,-7894.86,40,0
    .goto 1446/1,-2675.15,-8013.08,40,0
    .goto 1446/1,-2688.26,-8090.36,40,0
    .goto 1446/1,-2627.54,-8141.42,40,0
    .goto 1446/1,-2553.71,-8155.22,40,0
    .goto 1446/1,-2535.77,-8041.60,40,0
    .goto 1446/1,-2596.49,-7991.00,40,0
    .goto 1446/1,-2516.45,-7970.76,40,0
    .goto 1446/1,-2545.43,-7885.20,40,0
    >>Kill |cRXP_ENEMY_Centipaar Wasps|r, |cRXP_ENEMY_Centipaar Stingers|r, |cRXP_ENEMY_Centipaar Swarmers|r and |cRXP_ENEMY_Centipaar Workers|r. Loot them for |cRXP_LOOT_Centipaar Insect Parts|r
    .complete 82,1 --Centipaar Insect Parts (5)
    .mob Centipaar Wasp
    .mob Centipaar Stinger
    .mob Centipaar Swarmer
    .mob Centipaar Worker
    .isOnQuest 82
step
    #loop
    .goto 1446/1,-2163.86,-8769.78,0
    .goto 1446/1,-2163.86,-8769.78,40,0
    .goto 1446/1,-2172.83,-8824.06,40,0
    .goto 1446/1,-2244.59,-8923.88,40,0
    .goto 1446/1,-2155.58,-8845.68,40,0
    >>Kill |cRXP_ENEMY_Thistleshrub Dew Collector|r and loot |cRXP_LOOT_Laden Dew Gland|r
    .complete 2605,1 --Laden Dew Gland (1)
    .mob Thistleshrub Dew Collector
step
    .goto 1446/1,-3793.64,-7193.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marin Noggenfogger|r
    .turnin 2605 >>Turn in The Thirsty Goblin
    .accept 2606 >>Accept In Good Taste
    .target Marin Noggenfogger
step
    .goto 1446/1,-3730.16,-7115.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alchemist Pestlezugg|r
    .turnin 82 >>Turn in Noxious Lair Investigation
    .target Alchemist Pestlezugg
    .isOnQuest 82
step
    .goto 1446/1,-3741.89,-7111.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sprinkle|r
    .turnin 2606 >>Turn in In Good Taste
    .accept 2641 >>Accept Sprinkle's Secret Ingredient
    .target Sprinkle
step
    .goto 1446/1,-3683.24,-7139.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senior Surveyor Fizzledowser|r
    .accept 10 >>Accept The Scrimshank Redemption
    .target Senior Surveyor Fizzledowser
    .isQuestTurnedIn 82 --any of: Noxious Lair Investigation
step
    .goto 1446/1,-4079.99,-9148.82
    >>Pick up |cRXP_PICK_Scrimshank's Surveying Gear|r from the ground
    .complete 10,1 --Scrimshank's Surveying Gear (1)
    .isOnQuest 10
step
    .goto 1446/1,-4374.62,-8852.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Homing Robot OOX-17/TN|r
    .accept 648 >>Accept Rescue OOX-17/TN!
    .target Homing Robot OOX-17/TN
    .isQuestTurnedIn 351 --any of: Find OOX-17/TN!
    .xp <43,1
step
    .goto 1446/1,-4845.89,-6940.36
    >>Escort OOX-17/TN to Steamwheedle Port
    .complete 648,1 --Escort OOX-17/TN to Steamwheedle Port
    .isOnQuest 648
step
    .goto 1446/1,-3683.24,-7139.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senior Surveyor Fizzledowser|r
    .turnin 10 >>Turn in The Scrimshank Redemption
    .target Senior Surveyor Fizzledowser
    .isOnQuest 10
step
    .goto 1446/1,-3683.24,-7139.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senior Surveyor Fizzledowser|r
    .accept 110 >>Accept Insect Part Analysis
    .target Senior Surveyor Fizzledowser
    .isQuestTurnedIn 10 --any of: The Scrimshank Redemption
step
    .goto 1446/1,-3730.16,-7115.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alchemist Pestlezugg|r
    .turnin 110 >>Turn in Insect Part Analysis
    .target Alchemist Pestlezugg
    .isOnQuest 110
step
    .goto 1446/1,-3730.16,-7115.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alchemist Pestlezugg|r
    .accept 113 >>Accept Insect Part Analysis
    .target Alchemist Pestlezugg
    .isQuestTurnedIn 110 --any of: Insect Part Analysis
step
    .goto 1446/1,-3683.24,-7139.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senior Surveyor Fizzledowser|r
    .turnin 113 >>Turn in Insect Part Analysis
    .target Senior Surveyor Fizzledowser
    .isOnQuest 113
step
    .goto 1446/1,-3683.24,-7139.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senior Surveyor Fizzledowser|r
    .accept 32 >>Accept Rise of the Silithid
    .target Senior Surveyor Fizzledowser
    .isQuestTurnedIn 113 --any of: Insect Part Analysis
step
    .goto 1446/1,-3741.89,-7111.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sprinkle|r
    .turnin 2641 >>Turn in Sprinkle's Secret Ingredient
    .target Sprinkle
    .isQuestComplete 2641
step
    .goto 1446/1,-3741.89,-7111.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sprinkle|r
    .accept 2661 >>Accept Delivery for Marin
    .target Sprinkle
    .isQuestTurnedIn 2641 --any of: Sprinkle's Secret Ingredient
    .xp <44,1
step
    .goto 1446/1,-3766.04,-7197.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trenton Lighthammer|r
    .turnin 3042 >>Turn in Troll Temper
    .target Trenton Lighthammer
    .isQuestComplete 3042
step
    .goto 1446/1,-3793.64,-7193.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marin Noggenfogger|r
    .turnin 2661 >>Turn in Delivery for Marin
    .target Marin Noggenfogger
    .isOnQuest 2661
step
    .goto 1446/1,-3793.64,-7193.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marin Noggenfogger|r
    .accept 2662 >>Accept Noggenfogger Elixir
    .target Marin Noggenfogger
    .isQuestTurnedIn 2661 --any of: Delivery for Marin
    .xp <44,1
step
    .goto 1446/1,-3838.49,-7186.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Bilgewhizzle|r
    .turnin 2768 >>Turn in Divino-matic Rod
    .target Chief Engineer Bilgewhizzle
    .isQuestComplete 2768
step
    .goto 1446/1,-3777.08,-7105.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tran'rek|r
    .turnin 2865 >>Turn in Scarab Shells
    .target Tran'rek
    .isQuestComplete 2865
step
    .goto 1446/1,-3793.64,-7193.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marin Noggenfogger|r
    >>|cRXP_WARN_The database has no objectives for Noggenfogger Elixir. Skip this step if the quest is not finished|r
    .turnin 2662 >>Turn in Noggenfogger Elixir
    .target Marin Noggenfogger
    .isOnQuest 2662
step
    +|cRXP_WARN_That is all of Tanaris for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Orgrimmar|r: Rise of the Silithid
    >>|cRXP_FRIENDLY_Stranglethorn Vale|r: Rescue OOX-17/TN!
    >>|cRXP_FRIENDLY_The Hinterlands and back here|r: Sprinkle's Secret Ingredient
step
    .xp 49 >>|cRXP_WARN_The rest of Tanaris is planned from level 49.|r Come back to this guide then
step
    #label RBSection3_1
    #completewith next
    +|cRXP_WARN_Tanaris: part 3|r (planned from level 49)
step
    .goto 1446/1,-3741.89,-7111.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sprinkle|r
    .turnin 2641 >>Turn in Sprinkle's Secret Ingredient
    .target Sprinkle
    .isQuestComplete 2641
step
    .goto 1446/1,-3777.08,-7105.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tran'rek|r
    .accept 4504 >>Accept Super Sticky
    .accept 3362 >>Accept Thistleshrub Valley
    .target Tran'rek
step
    .goto 1446/1,-3833.66,-7115.62
    >>Click the |cRXP_PICK_Egg-O-Matic|r
    .turnin 2741 >>Turn in The Super Egg-O-Matic
    .isQuestComplete 2741
step
    .goto 1446/1,-3863.33,-7135.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Andi Lynn|r
    .accept 5863 >>Accept The Dunemaul Compound
    .target Andi Lynn
step
    .goto 1446/1,-3939.23,-6948.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gaeriyan|r
    .accept 3913 >>Accept A Grave Situation
    .target Gaeriyan
    .isQuestTurnedIn 3912 --any of: Meet at the Grave
    .xp <47,1
step
    .goto 1446/1,-4841.06,-6903.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yeh'kinya|r
    .turnin 3520 >>Turn in Screecher Spirits
    .target Yeh'kinya
    .isQuestComplete 3520
step
    .goto 1446/1,-3931.64,-7211.76
    >>Click the |cRXP_PICK_A Conspicuous Gravestone|r
    .turnin 3913 >>Turn in A Grave Situation
    .isOnQuest 3913
step
    .goto 1446/1,-3931.64,-7211.76
    >>Click the |cRXP_PICK_A Conspicuous Gravestone|r
    .accept 3914 >>Accept Linken's Sword
    .isQuestTurnedIn 3913 --any of: A Grave Situation
    .xp <47,1
step
    .goto 1446/1,-3855.74,-7987.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marvon Rivetseeker|r
    .accept 3446 >>Accept Into the Depths
    .accept 3447 >>Accept Secret of the Circle
    .target Marvon Rivetseeker
    .isQuestTurnedIn 3444 --any of: The Stone Circle
    .xp <46,1
step
    .goto 1446/1,-3855.74,-7987.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marvon Rivetseeker|r
    .accept 3444 >>Accept The Stone Circle
    .target Marvon Rivetseeker
    .isQuestTurnedIn 3380,3445 --any of: The Sunken Temple, The Sunken Temple
    .xp <46,1
step
    .goto 1446/1,-3855.74,-7987.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marvon Rivetseeker|r
    .turnin 3444 >>Turn in The Stone Circle
    .target Marvon Rivetseeker
    .isQuestComplete 3444
step
    #loop
    .goto 1446/1,-3179.54,-8395.80,0
    .goto 1446/1,-3179.54,-8395.80,40,0
    .goto 1446/1,-3154.70,-8446.86,40,0
    .goto 1446/1,-3086.39,-8477.68,40,0
    .goto 1446/1,-3082.25,-8534.26,40,0
    .goto 1446/1,-2993.24,-8543.92,40,0
    .goto 1446/1,-3022.22,-8513.56,40,0
    .goto 1446/1,-3053.96,-8275.74,40,0
    .goto 1446/1,-3064.31,-8264.24,40,0
    >>Kill |cRXP_ENEMY_Gor'marok the Ravager|r
    >>Kill |cRXP_ENEMY_Dunemaul Brutes|r
    .complete 5863,3 --Gor'marok the Ravager slain (1)
    .complete 5863,1 --Dunemaul Brute slain (10)
    .mob Gor'marok the Ravager
    .mob Dunemaul Brute
step
    #loop
    .goto 1446/1,-2890.43,-8548.98,0
    .goto 1446/1,-2890.43,-8548.98,40,0
    .goto 1446/1,-2846.96,-8605.10,40,0
    .goto 1446/1,-2835.23,-8514.02,40,0
    .goto 1446/1,-2826.26,-8477.22,40,0
    .goto 1446/1,-2865.59,-8307.02,40,0
    .goto 1446/1,-2900.09,-8264.70,40,0
    .goto 1446/1,-2893.88,-8290.92,40,0
    .goto 1446/1,-2861.45,-8504.82,40,0
    >>Kill |cRXP_ENEMY_Dunemaul Enforcers|r
    .complete 5863,2 --Dunemaul Enforcer slain (10)
    .mob Dunemaul Enforcer
step
    .goto 1446/1,-2813.15,-9619.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Stone Watcher of Norgannon|r
    .accept 2954 >>Accept The Stone Watcher
    .target Stone Watcher of Norgannon
    .isQuestTurnedIn 2946,2966 --any of: Seeing What Happens, Seeing What Happens
    .xp <45,1
step
    .goto 1446/1,-2813.15,-9619.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Stone Watcher of Norgannon|r
    .complete 2954,1 --Stone Watcher of Norgannon
    .target Stone Watcher of Norgannon
    .isOnQuest 2954
step
    .goto 1446/1,-2815.22,-9619.40
    >>Click the |cRXP_PICK_Uldum Pedestal|r
    .turnin 2954 >>Turn in The Stone Watcher
    .isOnQuest 2954
step
    .goto 1446/1,-2815.22,-9619.40
    >>Click the |cRXP_PICK_Uldum Pedestal|r
    .accept 2967 >>Accept Return to Thunder Bluff
    .isQuestTurnedIn 2954 --any of: The Stone Watcher
    .xp <45,1
step
    #loop
    .goto 1446/1,-2309.45,-8947.34,0
    .goto 1446/1,-2309.45,-8947.34,40,0
    .goto 1446/1,-2253.56,-8985.06,40,0
    .goto 1446/1,-2243.90,-8954.24,40,0
    .goto 1446/1,-2264.60,-8929.40,40,0
    .goto 1446/1,-2243.21,-8747.24,40,0
    .goto 1446/1,-2287.37,-8785.42,40,0
    .goto 1446/1,-2358.44,-8879.72,40,0
    .goto 1446/1,-2343.95,-8918.82,40,0
    >>Kill |cRXP_ENEMY_Gnarled Thistleshrubs|r
    >>Kill |cRXP_ENEMY_Thistleshrub Rootshapers|r
    .complete 3362,1 --Gnarled Thistleshrub slain (8)
    .complete 3362,2 --Thistleshrub Rootshaper slain (8)
    .mob Gnarled Thistleshrub
    .mob Thistleshrub Rootshaper
step
    #loop
    .goto 1446/1,-2252.87,-8658.46,0
    .goto 1446/1,-2252.87,-8658.46,40,0
    .goto 1446/1,-2288.75,-8865.00,40,0
    .goto 1446/1,-2288.75,-9095.00,40,0
    .goto 1446/1,-2412.95,-9285.90,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tooga|r. |cRXP_WARN_This NPC walks a patrol route|r
    .accept 1560 >>Accept Tooga's Quest
    .unitscan Tooga
step
    .goto 1446/1,-4812.77,-7055.82
    >>Show Tooga the way back to his wife, Torta.
    .complete 1560,1 --Torta
    .target Torta
step
    .goto 1446/1,-4812.77,-7055.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Torta|r
    .turnin 1560 >>Turn in Tooga's Quest
    .target Torta
step
    .goto 1446/1,-3777.08,-7105.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tran'rek|r
    .turnin 3362 >>Turn in Thistleshrub Valley
    .target Tran'rek
step
    .goto 1446/1,-3777.08,-7105.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tran'rek|r
    .turnin 4504 >>Turn in Super Sticky
    .target Tran'rek
    .isQuestComplete 4504
step
    .goto 1446/1,-3863.33,-7135.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Andi Lynn|r
    .turnin 5863 >>Turn in The Dunemaul Compound
    .target Andi Lynn
step
    .goto 1446/1,-3766.04,-7197.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trenton Lighthammer|r
    .turnin 3042 >>Turn in Troll Temper
    .target Trenton Lighthammer
    .isQuestComplete 3042
step
    .goto 1446/1,-3838.49,-7186.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Bilgewhizzle|r
    .turnin 2768 >>Turn in Divino-matic Rod
    .target Chief Engineer Bilgewhizzle
    .isQuestComplete 2768
step
    .goto 1446/1,-3777.08,-7105.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tran'rek|r
    .turnin 2865 >>Turn in Scarab Shells
    .target Tran'rek
    .isQuestComplete 2865
step
    +|cRXP_WARN_End of the Tanaris route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Thunder Bluff|r: Return to Thunder Bluff
    >>|cRXP_FRIENDLY_Un'Goro Crater|r: Linken's Sword
    >>|cRXP_FRIENDLY_another zone|r: Into the Depths, Secret of the Circle
    >>|cRXP_FRIENDLY_Un'Goro Crater and back here|r: Super Sticky
step
    +|cRXP_WARN_Suggested next zones at level 49|r: |cRXP_FRIENDLY_Un'Goro Crater|r (about 0.5 levels of quests, starting around Torwa Pathfinder; 1 quest from here hands in there). Completing this step loads the guide for Un'Goro Crater --RouteBuilder:next
]])
