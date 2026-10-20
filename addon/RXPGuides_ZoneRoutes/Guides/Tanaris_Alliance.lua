-- 43-60 Tanaris: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 3 parts (from level 43, 46, 49).
-- Split into 3 guides, listed under "43 - 50 Tanaris" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Tanaris.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 43 - 50 Tanaris
#subweight -43
#name 43-44 Tanaris: around Chief Engineer Bilgewhizzle

step
    .goto 1446/1,-5228.15,-8073.80
    >>Click the |cRXP_PICK_Book|r
    .accept 81949 >>Accept Legends of the Tidesages
step
    .goto 1446/1,-5228.15,-8073.80
    >>Open the |cRXP_PICK_Book|r. Loot it for |cRXP_LOOT_Legends of the Tidesages|r
    .complete 81949,1 --Legends of the Tidesages (1)
step
    .goto 1446/1,-3769.49,-7200.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krinkle Goodsteel|r
    .turnin 4450 >>Turn in Ledger from Tanaris
    .target Krinkle Goodsteel
    .isQuestComplete 4450
step
    .goto 1446/1,-3769.49,-7200.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krinkle Goodsteel|r
    .turnin 5538 >>Turn in Mold Rhymes With...
    .target Krinkle Goodsteel
    .isOnQuest 5538
step
    .goto 1446/1,-3838.49,-7186.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Bilgewhizzle|r
    .accept 1690 >>Accept Wastewander Justice
    .target Chief Engineer Bilgewhizzle
step << Mage
    .goto 1446/1,-3770.18,-7200.72
    >>Talk to |cRXP_FRIENDLY_Krinkle|r
    .vendor 5411 >> Vendor Trash. Repair
    .target Krinkle Goodsteel
step << Mage skip
    .goto 1446/1,-3738.44,-7225.10
    >>Talk to |cRXP_FRIENDLY_Bera|r
    .fp Gadgetzan >> Get the Gadgetzan flight path
    .target Bera Stonehammer
step
    .goto 1446/1,-3840.56,-7183.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spigot Operator Luglunket|r
    .accept 1707 >>Accept Water Pouch Bounty
    .target Spigot Operator Luglunket
step
    .goto 1446/1,-3839.18,-7127.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mux Manascrambler|r
    .turnin 8922 >>Turn in A Supernatural Device
    .target Mux Manascrambler
    .isOnQuest 8922
step
    .goto 1446/1,-3831.59,-7112.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Curgle Cranklehop|r
    .accept 3022 >>Accept Handle With Care
    .target Curgle Cranklehop
step
    .goto 1446/1,-3777.08,-7105.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tran'rek|r
    .turnin 2864 >>Turn in Tran'rek
    .target Tran'rek
    .isOnQuest 2864
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
    .goto 1446/1,-3730.16,-7115.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alchemist Pestlezugg|r
    .turnin 4493 >>Turn in March of the Silithid
    .target Alchemist Pestlezugg
    .isOnQuest 4493
step
    .goto 1446/1,-3939.23,-6948.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gaeriyan|r
    .turnin 3912 >>Turn in Meet at the Grave
    .target Gaeriyan
    .isOnQuest 3912
step
    .goto 1446/1,-4811.39,-6899.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Haughty Modiste|r
    .accept 8365 >>Accept Pirate Hats Ahoy!
    .target Haughty Modiste
step
    .goto 1446/1,-4841.06,-6903.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yeh'kinya|r
    .accept 3520 >>Accept Screecher Spirits
    .target Yeh'kinya
step
    .goto 1446/1,-4845.89,-6973.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Security Chief Bilgewhizzle|r
    .accept 8366 >>Accept Southsea Shakedown
    .target Security Chief Bilgewhizzle
step
    .goto 1446/1,-4849.34,-6978.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Stoley|r
    .turnin 2872 >>Turn in Stoley's Debt
    .target Stoley
    .isOnQuest 2872
step
    .goto 1446/1,-4849.34,-6978.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Stoley|r
    .accept 2873 >>Accept Stoley's Shipment
    .target Stoley
step
    #completewith Drop351x1
    >>|cRXP_LOOT_OOX-17/TN Distress Beacon|r can drop from |cRXP_ENEMY_Glasshide Basilisk|r, |cRXP_ENEMY_Glasshide Gazer|r, |cRXP_ENEMY_Glasshide Petrifier|r. Use it to start the quest if you get one
    .collect 8623,1,351 --OOX-17/TN Distress Beacon (1)
    .accept 351 >>Accept Find OOX-17/TN!
    .use 8623
step
    #label Drop351x1
    #loop
    .goto 1446/1,-4620.26,-7244.88,0
    .goto 1446/1,-4620.26,-7244.88,40,0
    .goto 1446/1,-4592.66,-7407.26,40,0
    >>Kill |cRXP_ENEMY_Wastewander Bandits|r
    >>Kill |cRXP_ENEMY_Wastewander Thiefs|r
    >>Kill |cRXP_ENEMY_Wastewander Rogues|r, |cRXP_ENEMY_Wastewander Thiefs|r, |cRXP_ENEMY_Wastewander Shadow Mages|r and |cRXP_ENEMY_Wastewander Bandits|r. Loot them for |cRXP_LOOT_Wastewander Water Pouch|r
    .complete 1690,1 --Wastewander Bandit slain (10)
    .complete 1690,2 --Wastewander Thief slain (8)
    .complete 1707,1 --Wastewander Water Pouch (5)
    .mob Wastewander Bandit
    .mob Wastewander Thief
    .mob Wastewander Rogue
    .mob Wastewander Shadow Mage
step
    .goto 1446/1,-3840.56,-7183.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spigot Operator Luglunket|r
    .turnin 1707 >>Turn in Water Pouch Bounty
    .target Spigot Operator Luglunket
step
    .goto 1446/1,-3766.04,-7197.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trenton Lighthammer|r
    .accept 3042 >>Accept Troll Temper
    .target Trenton Lighthammer
step
    .goto 1446/1,-3838.49,-7186.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Bilgewhizzle|r
    .turnin 1690 >>Turn in Wastewander Justice
    .accept 2768 >>Accept Divino-matic Rod
    .target Chief Engineer Bilgewhizzle
step
    .goto 1446/1,-3777.08,-7105.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tran'rek|r
    .accept 2865 >>Accept Scarab Shells
    .target Tran'rek
step
    .goto 1446/1,-3841.94,-7158.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Fizzgrimble|r
    .target Innkeeper Fizzgrimble
    .home >>Set your Hearthstone to Innkeeper Fizzgrimble's inn
step
    .goto 1446/1,-3831.59,-7112.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Curgle Cranklehop|r
    .turnin 2941 >>Turn in The Borrower
    .target Curgle Cranklehop
    .isOnQuest 2941
step
    .goto 1446/1,-3831.59,-7112.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Curgle Cranklehop|r
    .accept 2944 >>Accept The Super Snapper FX
    .target Curgle Cranklehop
    .isQuestTurnedIn 2941 --any of: The Borrower
    .xp <42,1
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
    #completewith next
    .hs >>Hearth to Innkeeper Fizzgrimble's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1446/1,-3683.24,-7139.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senior Surveyor Fizzledowser|r
    .turnin 992 >>Turn in Gadgetzan Water Survey
    .target Senior Surveyor Fizzledowser
step
    .goto 1446/1,-3838.49,-7186.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Bilgewhizzle|r
    .accept 1691 >>Accept More Wastewander Justice
    .target Chief Engineer Bilgewhizzle
step
    .goto 1446/1,-4829.33,-6900.34
    >>Click the |cRXP_PICK_Wanted Poster|r
    .accept 2875 >>Accept WANTED: Andre Firebeard
step
    .goto 1446/1,-3855.74,-7987.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marvon Rivetseeker|r
    .turnin 3445 >>Turn in The Sunken Temple
    .target Marvon Rivetseeker
    .isOnQuest 3445
step
    #completewith Drop351x2
    >>|cRXP_LOOT_OOX-17/TN Distress Beacon|r can drop from |cRXP_ENEMY_Glasshide Basilisk|r, |cRXP_ENEMY_Glasshide Gazer|r, |cRXP_ENEMY_Glasshide Petrifier|r. Use it to start the quest if you get one
    .collect 8623,1,351 --OOX-17/TN Distress Beacon (1)
    .accept 351 >>Accept Find OOX-17/TN!
    .use 8623
step
    #loop
    .goto 1446/1,-4612.67,-7680.96,0
    .goto 1446/1,-4612.67,-7680.96,40,0
    .goto 1446/1,-4584.38,-7596.32,40,0
    >>Kill |cRXP_ENEMY_Wastewander Rogues|r
    >>Kill |cRXP_ENEMY_Wastewander Assassins|r
    .complete 1691,1 --Wastewander Rogue slain (8)
    .complete 1691,2 --Wastewander Assassin slain (6)
    .mob Wastewander Rogue
    .mob Wastewander Assassin
step
    #loop
    .goto 1446/1,-4496.06,-7489.60,0
    .goto 1446/1,-4496.06,-7489.60,40,0
    .goto 1446/1,-4351.85,-7585.28,40,0
    .goto 1446/1,-4284.92,-7524.10,40,0
    >>Kill |cRXP_ENEMY_Wastewander Shadow Mages|r
    .complete 1691,3 --Wastewander Shadow Mage slain (10)
    .mob Wastewander Shadow Mage
step
    #label Drop351x2
    #loop
    .goto 1446/1,-5146.04,-7850.70,0
    .goto 1446/1,-5146.04,-7850.70,40,0
    .goto 1446/1,-5195.72,-8024.58,40,0
    .goto 1446/1,-5275.76,-8077.02,40,0
    .goto 1446/1,-5361.32,-8055.86,40,0
    >>Open the |cRXP_PICK_Stolen Cargo|r. Loot it for |cRXP_LOOT_Stoley's Shipment|r
    >>Kill |cRXP_ENEMY_Andre Firebeard|r and loot |cRXP_LOOT_Firebeard's Head|r
    >>Kill |cRXP_ENEMY_Southsea Pirates|r
    >>Kill |cRXP_ENEMY_Southsea Freebooters|r
    >>Kill |cRXP_ENEMY_Southsea Dock Workers|r
    >>Kill |cRXP_ENEMY_Southsea Swashbucklers|r
    >>Kill |cRXP_ENEMY_Southsea Pirates|r, |cRXP_ENEMY_Southsea Freebooters|r, |cRXP_ENEMY_Southsea Dock Workers|r and |cRXP_ENEMY_Southsea Swashbucklers|r. Loot them for |cRXP_LOOT_Southsea Pirate Hat|r
    .complete 2873,1 --Stoley's Shipment (1)
    .complete 2875,1 --Firebeard's Head (1)
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
    .goto 1446/1,-4374.62,-8852.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Homing Robot OOX-17/TN|r
    .turnin 351 >>Turn in Find OOX-17/TN!
    .target Homing Robot OOX-17/TN
    .isOnQuest 351
step
    .goto 1446/1,-4845.89,-6973.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Security Chief Bilgewhizzle|r
    .turnin 8366 >>Turn in Southsea Shakedown
    .turnin 2875 >>Turn in WANTED: Andre Firebeard
    .target Security Chief Bilgewhizzle
step << Mage
    .trainer >> Teleport to Stormwind or Ironforge. Train your level 46-48 spells
step << Mage
    .trainer >> Train your level 50-52 spells
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
step << Hunter
    .goto 1446/1,-4842.44,-6886.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jabbey|r
    .vendor 8139 >> |cRXP_BUY_Buy|r |T135661:0|t[Jagged Arrows] |cRXP_BUY_before leaving the port|r
    .target Jabbey
    .isQuestComplete 648
step
    .goto 1446/1,-4841.06,-6903.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yeh'kinya|r
    .accept 3527 >>Accept The Prophecy of Mosh'aru
    .target Yeh'kinya
    .isQuestTurnedIn 3520 --any of: Screecher Spirits
    .xp <40,1
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
    .accept 4787 >>Accept The Ancient Egg
    .target Yeh'kinya
    .isQuestTurnedIn 3527 --any of: The Prophecy of Mosh'aru
    .xp <40,1
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
    #completewith next
    .hs >>Hearth to Innkeeper Fizzgrimble's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1446/1,-3838.49,-7186.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Bilgewhizzle|r
    .turnin 1691 >>Turn in More Wastewander Justice
    .target Chief Engineer Bilgewhizzle
step << Hunter
    .goto 1446/1,-4842.44,-6886.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jabbey|r
    .vendor 8139 >> |cRXP_BUY_Buy|r |T135661:0|t[Jagged Arrows] |cRXP_BUY_before leaving the port|r
    .target Jabbey
step
    .goto 1446/1,-3766.04,-7197.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trenton Lighthammer|r
    .turnin 3042 >>Turn in Troll Temper
    .target Trenton Lighthammer
    .isQuestComplete 3042
step
    .goto 1446/1,-3833.66,-7115.62
    >>Click the |cRXP_PICK_Egg-O-Matic|r
    .accept 2741 >>Accept The Super Egg-O-Matic
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
    .goto 1446/1,-3833.66,-7115.62
    >>Click the |cRXP_PICK_Egg-O-Matic|r
    .turnin 2741 >>Turn in The Super Egg-O-Matic
    .isQuestComplete 2741
step
    .goto 1446/1,-2815.22,-9619.40
    >>Click the |cRXP_PICK_Uldum Pedestal|r
    .turnin 2946 >>Turn in Seeing What Happens
    .isOnQuest 2946
step
    +|cRXP_WARN_That is all of Tanaris for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Stranglethorn Vale|r: Deliver to MacKinley, The Hand of Rastakhan
    >>|cRXP_FRIENDLY_Teldrassil|r: Handle With Care, The Super Snapper FX
    >>|cRXP_FRIENDLY_Thousand Needles|r: Safety First
    >>|cRXP_FRIENDLY_Undercity|r: Legends of the Tidesages
    >>|cRXP_FRIENDLY_Feralas and back here|r: Screecher Spirits, The Super Egg-O-Matic
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Scarab Shells, Troll Temper, Divino-matic Rod
step
    +|cRXP_WARN_The rest of Tanaris is planned from level 46.|r Load its guide for level 46 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 43 - 50 Tanaris
#subweight -43
#name 46-47 Tanaris: around Senior Surveyor Fizzledowser

step
    .goto 1446/1,-3855.74,-7987.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marvon Rivetseeker|r
    .accept 3161 >>Accept Gahz'ridian
    .target Marvon Rivetseeker
step
    #loop
    .goto 1446/1,-3427.25,-8828.20,0
    .goto 1446/1,-3427.25,-8828.20,40,0
    .goto 1446/1,-3309.95,-8874.20,40,0
    .goto 1446/1,-3530.75,-8975.40,40,0
    >>Loot the |cRXP_PICK_Gahz'ridians|r for |cRXP_LOOT_Gahz'ridian Ornament|r
    .complete 3161,1 --Gahz'ridian Ornament (30)
step
    .goto 1446/1,-3855.74,-7987.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marvon Rivetseeker|r
    .turnin 3161 >>Turn in Gahz'ridian
    .target Marvon Rivetseeker
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
    .goto 1446/1,-3683.24,-7139.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senior Surveyor Fizzledowser|r
    .accept 82 >>Accept Noxious Lair Investigation
    .target Senior Surveyor Fizzledowser
    .isQuestTurnedIn 992 --any of: Gadgetzan Water Survey
step
    #loop
    .goto 1446/1,-2598.56,-7692.00,0
    .goto 1446/1,-2598.56,-7692.00,40,0
    .goto 1446/1,-2546.81,-7806.08,40,0
    .goto 1446/1,-2652.38,-7846.56,40,0
    >>Kill |cRXP_ENEMY_Centipaar Wasps|r, |cRXP_ENEMY_Centipaar Stingers|r, |cRXP_ENEMY_Centipaar Swarmers|r and |cRXP_ENEMY_Centipaar Workers|r. Loot them for |cRXP_LOOT_Centipaar Insect Parts|r
    .complete 82,1 --Centipaar Insect Parts (5)
    .mob Centipaar Wasp
    .mob Centipaar Stinger
    .mob Centipaar Swarmer
    .mob Centipaar Worker
    .isOnQuest 82
step
    #loop
    .goto 1446/1,-2172.83,-8824.06,0
    .goto 1446/1,-2172.83,-8824.06,40,0
    .goto 1446/1,-2244.59,-8923.88,40,0
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
    .goto 1446/1,-3741.89,-7111.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sprinkle|r
    .turnin 2606 >>Turn in In Good Taste
    .accept 2641 >>Accept Sprinkle's Secret Ingredient
    .target Sprinkle
step
    .goto 1446/1,-3730.16,-7115.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alchemist Pestlezugg|r
    .turnin 82 >>Turn in Noxious Lair Investigation
    .target Alchemist Pestlezugg
    .isOnQuest 82
step
    .goto 1446/1,-3683.24,-7139.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senior Surveyor Fizzledowser|r
    .accept 10 >>Accept The Scrimshank Redemption
    .target Senior Surveyor Fizzledowser
    .isQuestTurnedIn 82 --any of: Noxious Lair Investigation
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
    .goto 1446/1,-4841.06,-6903.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yeh'kinya|r
    .turnin 3520 >>Turn in Screecher Spirits
    .target Yeh'kinya
    .isQuestComplete 3520
step
    .goto 1446/1,-3838.49,-7186.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Bilgewhizzle|r
    .turnin 2781 >>Turn in WANTED: Caliph Scorpidsting
    .target Chief Engineer Bilgewhizzle
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
    .accept 162 >>Accept Rise of the Silithid
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
    .goto 1446/1,-3793.64,-7193.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marin Noggenfogger|r
    >>|cRXP_WARN_The database has no objectives for Noggenfogger Elixir. Skip this step if the quest is not finished|r
    .turnin 2662 >>Turn in Noggenfogger Elixir
    .target Marin Noggenfogger
    .isOnQuest 2662
step
    +|cRXP_WARN_That is all of Tanaris for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Darnassus|r: Rise of the Silithid
    >>|cRXP_FRIENDLY_Stranglethorn Vale|r: Rescue OOX-17/TN!
    >>|cRXP_FRIENDLY_The Hinterlands and back here|r: Sprinkle's Secret Ingredient
step
    +|cRXP_WARN_The rest of Tanaris is planned from level 49.|r Load its guide for level 49 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 43 - 50 Tanaris
#subweight -43
#name 49-50 Tanaris
--RouteBuilder:next
#next Zone Routes (Alliance)\50-51 Un'Goro Crater: around Torwa Pathfinder

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
    .goto 1446/1,-3939.23,-6948.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gaeriyan|r
    .accept 3913 >>Accept A Grave Situation
    .target Gaeriyan
    .isQuestTurnedIn 3912 --any of: Meet at the Grave
    .xp <47,1
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
    .goto 1446/1,-3863.33,-7135.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Andi Lynn|r
    .accept 5863 >>Accept The Dunemaul Compound
    .target Andi Lynn
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
    .goto 1446/1,-3741.89,-7111.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sprinkle|r
    .turnin 2641 >>Turn in Sprinkle's Secret Ingredient
    .target Sprinkle
    .isQuestComplete 2641
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
    .goto 1446/1,-4841.06,-6903.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yeh'kinya|r
    .turnin 3520 >>Turn in Screecher Spirits
    .target Yeh'kinya
    .isQuestComplete 3520
step
    #loop
    .goto 1446/1,-3179.54,-8395.80,0
    .goto 1446/1,-3179.54,-8395.80,40,0
    .goto 1446/1,-3053.96,-8275.74,40,0
    .goto 1446/1,-3022.22,-8513.56,40,0
    >>Kill |cRXP_ENEMY_Gor'marok the Ravager|r
    >>Kill |cRXP_ENEMY_Dunemaul Brutes|r
    .complete 5863,3 --Gor'marok the Ravager slain (1)
    .complete 5863,1 --Dunemaul Brute slain (10)
    .mob Gor'marok the Ravager
    .mob Dunemaul Brute
step
    #loop
    .goto 1446/1,-2835.23,-8514.02,0
    .goto 1446/1,-2835.23,-8514.02,40,0
    .goto 1446/1,-2893.88,-8290.92,40,0
    .goto 1446/1,-2969.09,-8217.32,40,0
    >>Kill |cRXP_ENEMY_Dunemaul Enforcers|r
    .complete 5863,2 --Dunemaul Enforcer slain (10)
    .mob Dunemaul Enforcer
step
    #loop
    .goto 1446/1,-2287.37,-8785.42,0
    .goto 1446/1,-2287.37,-8785.42,40,0
    .goto 1446/1,-2243.90,-8954.24,40,0
    >>Kill |cRXP_ENEMY_Gnarled Thistleshrubs|r
    >>Kill |cRXP_ENEMY_Thistleshrub Rootshapers|r
    .complete 3362,1 --Gnarled Thistleshrub slain (8)
    .complete 3362,2 --Thistleshrub Rootshaper slain (8)
    .mob Gnarled Thistleshrub
    .mob Thistleshrub Rootshaper
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
    .accept 2977 >>Accept Return to Ironforge
    .isQuestTurnedIn 2954 --any of: The Stone Watcher
    .xp <45,1
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
    +|cRXP_WARN_End of the Tanaris route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Ironforge|r: Return to Ironforge
    >>|cRXP_FRIENDLY_Un'Goro Crater|r: Linken's Sword
    >>|cRXP_FRIENDLY_another zone|r: Into the Depths, Secret of the Circle
    >>|cRXP_FRIENDLY_Un'Goro Crater and back here|r: Super Sticky
step
    +|cRXP_WARN_Suggested next zones at level 49|r: |cRXP_FRIENDLY_Un'Goro Crater|r (about 0.5 levels of quests, starting around Torwa Pathfinder; 1 quest from here hands in there). Completing this step loads the guide for Un'Goro Crater --RouteBuilder:next
]])
