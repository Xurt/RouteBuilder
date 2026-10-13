-- 43-60 Tanaris: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 3 parts with a level check between them (from level 43, 46, 49).
-- Edit zones/Tanaris.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#name 43-60 Tanaris

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
    .goto 1446/1,-4829.33,-6900.34
    >>Click the |cRXP_PICK_Wanted Poster|r
    .accept 2875 >>Accept WANTED: Andre Firebeard
step
    .goto 1446/1,-3839.18,-7127.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mux Manascrambler|r
    .turnin 8922 >>Turn in A Supernatural Device
    .target Mux Manascrambler
    .isOnQuest 8922
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
    .turnin 5538 >>Turn in Mold Rhymes With...
    .target Krinkle Goodsteel
    .isOnQuest 5538
step
    .goto 1446/1,-3840.56,-7183.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spigot Operator Luglunket|r
    .accept 1707 >>Accept Water Pouch Bounty
    .target Spigot Operator Luglunket
step
    .goto 1446/1,-3838.49,-7186.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Bilgewhizzle|r
    .accept 1690 >>Accept Wastewander Justice
    .target Chief Engineer Bilgewhizzle
step
    .goto 1446/1,-3770.18,-7200.72
    >>Talk to |cRXP_FRIENDLY_Krinkle|r
    .vendor 5411 >> Vendor Trash. Repair
    .target Krinkle Goodsteel
step << skip
    .goto 1446/1,-3738.44,-7225.10
    >>Talk to |cRXP_FRIENDLY_Bera|r
    .fp Gadgetzan >> Get the Gadgetzan flight path
    .target Bera Stonehammer
step
    #completewith Drop351x1
    >>|cRXP_LOOT_OOX-17/TN Distress Beacon|r can drop from |cRXP_ENEMY_Glasshide Basilisk|r, |cRXP_ENEMY_Glasshide Gazer|r, |cRXP_ENEMY_Glasshide Petrifier|r. Use it to start the quest if you get one
    .collect 8623,1,351 --OOX-17/TN Distress Beacon (1)
    .accept 351 >>Accept Find OOX-17/TN!
    .use 8623
step
    #label Drop351x1
    #loop
    .goto 1446/1,-4544.36,-7257.76,0
    .goto 1446/1,-4544.36,-7257.76,40,0
    .goto 1446/1,-4594.04,-7225.10,40,0
    .goto 1446/1,-4645.10,-7218.66,40,0
    .goto 1446/1,-4620.26,-7244.88,40,0
    .goto 1446/1,-4627.85,-7311.58,40,0
    .goto 1446/1,-4608.53,-7381.96,40,0
    .goto 1446/1,-4616.12,-7411.40,40,0
    .goto 1446/1,-4606.46,-7444.06,40,0
    .goto 1446/1,-4556.78,-7387.94,40,0
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
    #completewith next
    .hs >>Hearth to Innkeeper Fizzgrimble's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1446/1,-3840.56,-7183.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spigot Operator Luglunket|r
    .turnin 1707 >>Turn in Water Pouch Bounty
    .target Spigot Operator Luglunket
step
    .goto 1446/1,-3838.49,-7186.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Bilgewhizzle|r
    .turnin 1690 >>Turn in Wastewander Justice
    .target Chief Engineer Bilgewhizzle
step
    .goto 1446/1,-4655.45,-7226.48,60,0
    .goto 1446/1,-4587.83,-7232.00,60,0
    .goto 1446/1,-4564.37,-7288.12,60,0
    .goto 1446/1,-4627.85,-7314.80,60,0
    .goto 1446/1,-4551.26,-7409.10,60,0
    .goto 1446/1,-4587.83,-7453.72,60,0
    .goto 1446/1,-4718.93,-7403.58,60,0
    .goto 1446/1,-4745.84,-7346.08,60,0
    .goto 1446/1,-4281.47,-6964.28,60,0
    .goto 1446/1,-4424.30,-6935.30,60,0
    .goto 1446/1,-4411.19,-6997.86,60,0
    .goto 1446/1,-4655.45,-7226.48,50,0
    .goto 1446/1,-4587.83,-7232.00,50,0
    .goto 1446/1,-4564.37,-7288.12,50,0
    .goto 1446/1,-4627.85,-7314.80,50,0
    .goto 1446/1,-4551.26,-7409.10,50,0
    .goto 1446/1,-4587.83,-7453.72,50,0
    .goto 1446/1,-4718.93,-7403.58,50,0
    .goto 1446/1,-4745.84,-7346.08,50,0
    .goto 1446/1,-4281.47,-6964.28,50,0
    .goto 1446/1,-4424.30,-6935.30,50,0
    .goto 1446/1,-4411.19,-6997.86,50,0
    .goto 1446/1,-4655.45,-7226.48,50,0
    .xp 42+97000 >>AoE |cRXP_ENEMY_Wastewander Bandits|r and |cRXP_ENEMY_Wastewander Thieves|r to 97000+/101000xp
    >>|cRXP_WARN_Be careful as |cRXP_ENEMY_Wastewander Bandits|r cast|r |T132155:0|t[Gouge] |cRXP_WARN_(stuns you until you take damage if you're facing them) and|r |T132090:0|t[Backstab] |cRXP_WARN_(deals double damage from behind)|r
    >>|cRXP_WARN_You can make bigger pulls by kiting them around with|r |T135852:0|t[Cone of Cold] |cRXP_WARN_to slow them and refresh their leash|r
    >>|cRXP_WARN_Be careful as aggroing the |cRXP_ENEMY_Wastewanderers|r under the tent will evade your whole pull after about 10 seconds|r
    >>|cRXP_WARN_Avoid pulling any|r |cRXP_ENEMY_Wastewander Shadow Mages|r
step
    .goto 1446/1,-5414.45,-7978.12,20,0
    .goto 1446/1,-5364.08,-8076.56,20,0
    .goto 1446/1,-5283.35,-8004.34,20,0
    .goto 1446/1,-5969.90,-8051.72,20,0
    .goto 1446/1,-5205.38,-8009.86,20,0
    .goto 1446/1,-5414.45,-7978.12,20,0
    .xp 44 >>AoE |cRXP_ENEMY_Southsea Swashbucklers|r, |cRXP_ENEMY_Southsea Dock Workers|r, |cRXP_ENEMY_Southsea Freebooters|r, and |cRXP_ENEMY_Southsea Pirates|r to Level 44
    >>|cRXP_WARN_Be careful as |cRXP_ENEMY_Southsea Pirates|r cast|r |T132282:0|t[Strike] |cRXP_WARN_(deals double damage every 10 seconds) and |cRXP_ENEMY_Southsea Freebooters|r cast|r |T132222:0|t[Shoot] |cRXP_WARN_(Deals ranged damage)|r
step
    .goto 1446/1,-5414.45,-7978.12,20,0
    .goto 1446/1,-5364.08,-8076.56,20,0
    .goto 1446/1,-5283.35,-8004.34,20,0
    .goto 1446/1,-5969.90,-8051.72,20,0
    .goto 1446/1,-5205.38,-8009.86,20,0
    .goto 1446/1,-5414.45,-7978.12,20,0
    .xp 46 >>AoE |cRXP_ENEMY_Southsea Swashbucklers|r, |cRXP_ENEMY_Southsea Dock Workers|r, |cRXP_ENEMY_Southsea Freebooters|r, and |cRXP_ENEMY_Southsea Pirates|r to Level 46
    >>|cRXP_WARN_Be careful as |cRXP_ENEMY_Southsea Pirates|r cast|r |T132282:0|t[Strike] |cRXP_WARN_(deals double damage every 10 seconds) and |cRXP_ENEMY_Southsea Freebooters|r cast|r |T132222:0|t[Shoot] |cRXP_WARN_(Deals ranged damage)|r
step
    .goto 1446/1,-5414.45,-7978.12,20,0
    .goto 1446/1,-5364.08,-8076.56,20,0
    .goto 1446/1,-5283.35,-8004.34,20,0
    .goto 1446/1,-5969.90,-8051.72,20,0
    .goto 1446/1,-5281.28,-8099.10,20,0
    .goto 1446/1,-5240.57,-8078.40,20,0
    .goto 1446/1,-5205.38,-8009.86,20,0
    .goto 1446/1,-5414.45,-7978.12,20,0
    .xp 48 >>AoE |cRXP_ENEMY_Southsea Swashbucklers|r, |cRXP_ENEMY_Southsea Dock Workers|r, |cRXP_ENEMY_Southsea Freebooters|r, and |cRXP_ENEMY_Southsea Pirates|r to Level 48
    >>|cRXP_WARN_Be careful as |cRXP_ENEMY_Southsea Pirates|r cast|r |T132282:0|t[Strike] |cRXP_WARN_(deals double damage every 10 seconds) and |cRXP_ENEMY_Southsea Freebooters|r cast|r |T132222:0|t[Shoot] |cRXP_WARN_(Deals ranged damage)|r
step
    #completewith Drop351x2
    >>|cRXP_LOOT_OOX-17/TN Distress Beacon|r can drop from |cRXP_ENEMY_Glasshide Basilisk|r, |cRXP_ENEMY_Glasshide Gazer|r, |cRXP_ENEMY_Glasshide Petrifier|r. Use it to start the quest if you get one
    .collect 8623,1,351 --OOX-17/TN Distress Beacon (1)
    .accept 351 >>Accept Find OOX-17/TN!
    .use 8623
step
    #label Drop351x2
    #loop
    .goto 1446/1,-5155.01,-8085.76,0
    .goto 1446/1,-5155.01,-8085.76,40,0
    .goto 1446/1,-5197.10,-8023.20,40,0
    .goto 1446/1,-5276.45,-7943.16,40,0
    .goto 1446/1,-5419.97,-7988.24,40,0
    .goto 1446/1,-5492.42,-7981.80,40,0
    .goto 1446/1,-5383.40,-8072.88,40,0
    .goto 1446/1,-5321.99,-8017.22,40,0
    .goto 1446/1,-5257.13,-8048.04,40,0
    .goto 1446/1,-5270.93,-8115.66,40,0
    >>Kill |cRXP_ENEMY_Southsea Pirates|r, |cRXP_ENEMY_Southsea Freebooters|r, |cRXP_ENEMY_Southsea Dock Workers|r and |cRXP_ENEMY_Southsea Swashbucklers|r. Loot them for |cRXP_LOOT_Southsea Pirate Hat|r
    >>Kill |cRXP_ENEMY_Southsea Pirates|r
    >>Kill |cRXP_ENEMY_Southsea Freebooters|r
    >>Kill |cRXP_ENEMY_Southsea Dock Workers|r
    >>Kill |cRXP_ENEMY_Southsea Swashbucklers|r
    >>Kill |cRXP_ENEMY_Andre Firebeard|r and loot |cRXP_LOOT_Firebeard's Head|r
    >>Open the |cRXP_PICK_Stolen Cargo|r. Loot it for |cRXP_LOOT_Stoley's Shipment|r
    .complete 8365,1 --Southsea Pirate Hat (20)
    .complete 8366,1 --Southsea Pirate slain (10)
    .complete 8366,2 --Southsea Freebooter slain (10)
    .complete 8366,3 --Southsea Dock Worker slain (10)
    .complete 8366,4 --Southsea Swashbuckler slain (10)
    .complete 2875,1 --Firebeard's Head (1)
    .complete 2873,1 --Stoley's Shipment (1)
    .mob Southsea Pirate
    .mob Southsea Freebooter
    .mob Southsea Dock Worker
    .mob Southsea Swashbuckler
    .mob Andre Firebeard
step
    .goto 1446/1,-5414.45,-7978.12,20,0
    .goto 1446/1,-5364.08,-8076.56,20,0
    .goto 1446/1,-5283.35,-8004.34,20,0
    .goto 1446/1,-5969.90,-8051.72,20,0
    .goto 1446/1,-5281.28,-8099.10,20,0
    .goto 1446/1,-5240.57,-8078.40,20,0
    .goto 1446/1,-5205.38,-8009.86,20,0
    .goto 1446/1,-5414.45,-7978.12,20,0
    .xp 50 >>AoE |cRXP_ENEMY_Southsea Swashbucklers|r, |cRXP_ENEMY_Southsea Dock Workers|r, |cRXP_ENEMY_Southsea Freebooters|r, and |cRXP_ENEMY_Southsea Pirates|r to Level 50. Loot them for their Silk Cloth
    >>|cRXP_WARN_Be careful as |cRXP_ENEMY_Southsea Pirates|r cast|r |T132282:0|t[Strike] |cRXP_WARN_(deals double damage every 10 seconds) and |cRXP_ENEMY_Southsea Freebooters|r cast|r |T132222:0|t[Shoot] |cRXP_WARN_(Deals ranged damage)|r
    >>|cRXP_WARN_MAKE SURE You keep an extra 15|r |T132905:0|t[Silk Cloth] |cRXP_WARN_on your character for Searing Gorge|r
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
    .target Stoley
step
    .goto 1446/1,-4834.16,-6980.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Ironboot|r
    .accept 8182 >>Accept The Hand of Rastakhan
    .target Prospector Ironboot
    .isQuestTurnedIn 8181 --any of: Confront Yeh'kinya
    .xp <40,1
step
    .goto 1446/1,-4811.39,-6899.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Haughty Modiste|r
    .turnin 8365 >>Turn in Pirate Hats Ahoy!
    .target Haughty Modiste
step
    .goto 1446/1,-4841.06,-6903.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yeh'kinya|r
    .accept 4787 >>Accept The Ancient Egg
    .target Yeh'kinya
    .isQuestTurnedIn 3527 --any of: The Prophecy of Mosh'aru
    .xp <40,1
step
    #completewith next
    .hs >>Hearth to Innkeeper Fizzgrimble's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
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
step << Hunter
    .goto 1446/1,-3949.58,-7356.66
    >>|cRXP_WARN_Cast|r |T132164:0|t[Tame Beast] |cRXP_WARN_on a |cRXP_ENEMY_Scorpid Hunter|r to tame it|r
    .train 2976 >>|cRXP_WARN_Attack mobs with it to learn|r |T132140:0|t[Claw (Rank 6)]
step
    .goto 1446/1,-3831.59,-7112.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Curgle Cranklehop|r
    .accept 3022 >>Accept Handle With Care
    .target Curgle Cranklehop
step
    .goto 1446/1,-3833.66,-7115.62
    >>Click the |cRXP_PICK_Egg-O-Matic|r
    .accept 2741 >>Accept The Super Egg-O-Matic
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
    .goto 1446/1,-3766.04,-7197.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trenton Lighthammer|r
    .accept 3042 >>Accept Troll Temper
    .target Trenton Lighthammer
step
    .goto 1446/1,-3766.73,-7197.50
    .target Trenton Lighthammer
    >>Talk to |cRXP_FRIENDLY_Trenton Lighthammer|r
    .vendor >> Vendor and Repair at Krinkle
step
    .goto 1446/1,-3838.49,-7186.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Bilgewhizzle|r
    .accept 2768 >>Accept Divino-matic Rod
    .accept 1691 >>Accept More Wastewander Justice
    .target Chief Engineer Bilgewhizzle
step
    .goto 1446/1,-3777.08,-7105.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tran'rek|r
    .accept 2865 >>Accept Scarab Shells
    .target Tran'rek
step
    .trainer >> Teleport to Stormwind or Ironforge. Train your level 46-48 spells
step
    .goto 1446/1,-3777.08,-7105.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tran'rek|r
    .turnin 2865 >>Turn in Scarab Shells
    .target Tran'rek
    .isQuestComplete 2865
step
    .trainer >> Teleport to Stormwind or Ironforge. Train your level 50-52 spells
step
    .trainer >> Teleport to Ironforge. Train your level 54 spells
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
    .goto 1446/1,-3855.74,-7987.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marvon Rivetseeker|r
    .turnin 3445 >>Turn in The Sunken Temple
    .target Marvon Rivetseeker
    .isOnQuest 3445
step
    #completewith Drop351x3
    >>|cRXP_LOOT_OOX-17/TN Distress Beacon|r can drop from |cRXP_ENEMY_Glasshide Basilisk|r, |cRXP_ENEMY_Glasshide Gazer|r, |cRXP_ENEMY_Glasshide Petrifier|r. Use it to start the quest if you get one
    .collect 8623,1,351 --OOX-17/TN Distress Beacon (1)
    .accept 351 >>Accept Find OOX-17/TN!
    .use 8623
step
    #loop
    .goto 1446/1,-4594.04,-7717.30,0
    .goto 1446/1,-4594.04,-7717.30,40,0
    .goto 1446/1,-4635.44,-7707.18,40,0
    .goto 1446/1,-4645.10,-7687.86,40,0
    .goto 1446/1,-4678.91,-7683.72,40,0
    .goto 1446/1,-4614.74,-7651.52,40,0
    .goto 1446/1,-4594.73,-7619.78,40,0
    .goto 1446/1,-4584.38,-7596.32,40,0
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
    .goto 1446/1,-4374.62,-8852.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Homing Robot OOX-17/TN|r
    .turnin 351 >>Turn in Find OOX-17/TN!
    .target Homing Robot OOX-17/TN
    .isOnQuest 351
step
    .goto 1446/1,-4849.34,-6978.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Stoley|r
    .accept 2874 >>Accept Deliver to MacKinley
    .target Stoley
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
    .goto 1446/1,-3838.49,-7186.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Bilgewhizzle|r
    .turnin 2768 >>Turn in Divino-matic Rod
    .target Chief Engineer Bilgewhizzle
    .isQuestComplete 2768
step
    .goto 1446/1,-3833.66,-7115.62
    >>Click the |cRXP_PICK_Egg-O-Matic|r
    .turnin 2741 >>Turn in The Super Egg-O-Matic
    .isQuestComplete 2741
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
    .goto 1446/1,-2815.22,-9619.40
    >>Click the |cRXP_PICK_Uldum Pedestal|r
    .turnin 2946 >>Turn in Seeing What Happens
    .isOnQuest 2946
step
    +|cRXP_WARN_That is all of Tanaris for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Stranglethorn Vale|r: Deliver to MacKinley, The Hand of Rastakhan
    >>|cRXP_FRIENDLY_Teldrassil|r: Handle With Care, The Super Snapper FX
    >>|cRXP_FRIENDLY_Thousand Needles|r: Safety First
    >>|cRXP_FRIENDLY_Feralas and back here|r: Screecher Spirits, The Super Egg-O-Matic
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Scarab Shells, Troll Temper, Divino-matic Rod
step
    .xp 46 >>|cRXP_WARN_The rest of Tanaris is planned from level 46.|r Come back to this guide then
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
    .goto 1446/1,-3793.64,-7193.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marin Noggenfogger|r
    .accept 2605 >>Accept The Thirsty Goblin
    .target Marin Noggenfogger
step
    .goto 1446/1,-3683.24,-7139.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senior Surveyor Fizzledowser|r
    .accept 82 >>Accept Noxious Lair Investigation
    .target Senior Surveyor Fizzledowser
step
    #loop
    .goto 1446/1,-2752.43,-7714.54,0
    .goto 1446/1,-2752.43,-7714.54,40,0
    .goto 1446/1,-2715.17,-7851.62,40,0
    .goto 1446/1,-2636.51,-7865.88,40,0
    .goto 1446/1,-2657.21,-7729.72,40,0
    .goto 1446/1,-2572.34,-7791.36,40,0
    .goto 1446/1,-2459.87,-7833.68,40,0
    .goto 1446/1,-2496.44,-7729.26,40,0
    .goto 1446/1,-2533.70,-7627.14,40,0
    .goto 1446/1,-2650.31,-7650.60,40,0
    >>Kill |cRXP_ENEMY_Centipaar Wasps|r, |cRXP_ENEMY_Centipaar Stingers|r, |cRXP_ENEMY_Centipaar Swarmers|r and |cRXP_ENEMY_Centipaar Workers|r. Loot them for |cRXP_LOOT_Centipaar Insect Parts|r
    .complete 82,1 --Centipaar Insect Parts (5)
    .mob Centipaar Wasp
    .mob Centipaar Stinger
    .mob Centipaar Swarmer
    .mob Centipaar Worker
step
    #loop
    .goto 1446/1,-2244.59,-8923.88,0
    .goto 1446/1,-2244.59,-8923.88,40,0
    .goto 1446/1,-2280.47,-8953.78,40,0
    .goto 1446/1,-2339.81,-8968.50,40,0
    .goto 1446/1,-2217.68,-8980.46,40,0
    .goto 1446/1,-2176.28,-9033.82,40,0
    .goto 1446/1,-2136.26,-9049.00,40,0
    .goto 1446/1,-2121.77,-8996.56,40,0
    >>Kill |cRXP_ENEMY_Thistleshrub Dew Collector|r and loot |cRXP_LOOT_Laden Dew Gland|r
    .complete 2605,1 --Laden Dew Gland (1)
    .mob Thistleshrub Dew Collector
step
    .goto 1446/1,-2815.22,-9619.40
    >>Click the |cRXP_PICK_Uldum Pedestal|r
    .accept 2977 >>Accept Return to Ironforge
    .isQuestTurnedIn 2954 --any of: The Stone Watcher
    .xp <45,1
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
    .target Sprinkle
step
    .goto 1446/1,-3730.16,-7115.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alchemist Pestlezugg|r
    .turnin 82 >>Turn in Noxious Lair Investigation
    .target Alchemist Pestlezugg
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
    .goto 1446/1,-3833.66,-7115.62
    >>Click the |cRXP_PICK_Egg-O-Matic|r
    .turnin 2741 >>Turn in The Super Egg-O-Matic
    .isQuestComplete 2741
step
    .goto 1446/1,-3741.89,-7111.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sprinkle|r
    .accept 2641 >>Accept Sprinkle's Secret Ingredient
    .target Sprinkle
step
    .goto 1446/1,-3683.24,-7139.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senior Surveyor Fizzledowser|r
    .accept 10 >>Accept The Scrimshank Redemption
    .target Senior Surveyor Fizzledowser
step
    .goto 1446/1,-4079.99,-9148.82
    >>Pick up |cRXP_PICK_Scrimshank's Surveying Gear|r from the ground
    .complete 10,1 --Scrimshank's Surveying Gear (1)
step
    .goto 1446/1,-4841.06,-6903.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yeh'kinya|r
    .turnin 3520 >>Turn in Screecher Spirits
    .target Yeh'kinya
    .isQuestComplete 3520
step
    .goto 1446/1,-3683.24,-7139.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senior Surveyor Fizzledowser|r
    .turnin 10 >>Turn in The Scrimshank Redemption
    .accept 110 >>Accept Insect Part Analysis
    .target Senior Surveyor Fizzledowser
step
    .goto 1446/1,-3730.16,-7115.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alchemist Pestlezugg|r
    .turnin 110 >>Turn in Insect Part Analysis
    .accept 113 >>Accept Insect Part Analysis
    .target Alchemist Pestlezugg
step
    .goto 1446/1,-3683.24,-7139.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senior Surveyor Fizzledowser|r
    .turnin 113 >>Turn in Insect Part Analysis
    .accept 162 >>Accept Rise of the Silithid
    .target Senior Surveyor Fizzledowser
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
    >>|cRXP_FRIENDLY_Ironforge|r: Return to Ironforge
    >>|cRXP_FRIENDLY_The Hinterlands and back here|r: Sprinkle's Secret Ingredient
step
    .xp 49 >>|cRXP_WARN_The rest of Tanaris is planned from level 49.|r Come back to this guide then
step
    .goto 1446/1,-3863.33,-7135.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Andi Lynn|r
    .accept 5863 >>Accept The Dunemaul Compound
    .target Andi Lynn
step
    .goto 1446/1,-3777.08,-7105.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tran'rek|r
    .accept 3362 >>Accept Thistleshrub Valley
    .target Tran'rek
step
    #completewith Along3
    >>As you go: Kill |cRXP_ENEMY_Dunemaul Brutes|r. |cRXP_WARN_Anything left is finished later|r
    .complete 5863,1 --Dunemaul Brute slain (10)
    .mob Dunemaul Brute
step
    .goto 1446/1,-3082.25,-8534.26
    >>Kill |cRXP_ENEMY_Gor'marok the Ravager|r
    .complete 5863,3 --Gor'marok the Ravager slain (1)
    .mob Gor'marok the Ravager
step
    #label Along3
    #loop
    .goto 1446/1,-2861.45,-8504.82,0
    .goto 1446/1,-2861.45,-8504.82,40,0
    .goto 1446/1,-2835.23,-8514.02,40,0
    .goto 1446/1,-2826.26,-8477.22,40,0
    .goto 1446/1,-2865.59,-8307.02,40,0
    .goto 1446/1,-2893.88,-8290.92,40,0
    .goto 1446/1,-2900.09,-8264.70,40,0
    .goto 1446/1,-2953.91,-8231.58,40,0
    .goto 1446/1,-2987.72,-8235.26,40,0
    >>Kill |cRXP_ENEMY_Dunemaul Enforcers|r
    .complete 5863,2 --Dunemaul Enforcer slain (10)
    .mob Dunemaul Enforcer
step
    #loop
    .goto 1446/1,-3053.96,-8275.74,0
    .goto 1446/1,-3053.96,-8275.74,40,0
    .goto 1446/1,-3064.31,-8264.24,40,0
    .goto 1446/1,-3179.54,-8395.80,40,0
    .goto 1446/1,-3154.70,-8446.86,40,0
    .goto 1446/1,-3086.39,-8477.68,40,0
    .goto 1446/1,-3022.22,-8513.56,40,0
    .goto 1446/1,-2993.24,-8543.92,40,0
    >>Kill |cRXP_ENEMY_Dunemaul Brutes|r
    .complete 5863,1 --Dunemaul Brute slain (10)
    .mob Dunemaul Brute
step
    #loop
    .goto 1446/1,-2358.44,-8879.72,0
    .goto 1446/1,-2358.44,-8879.72,40,0
    .goto 1446/1,-2343.95,-8918.82,40,0
    .goto 1446/1,-2309.45,-8947.34,40,0
    .goto 1446/1,-2253.56,-8985.06,40,0
    .goto 1446/1,-2243.90,-8954.24,40,0
    .goto 1446/1,-2264.60,-8929.40,40,0
    .goto 1446/1,-2243.21,-8747.24,40,0
    .goto 1446/1,-2287.37,-8785.42,40,0
    >>Kill |cRXP_ENEMY_Gnarled Thistleshrubs|r
    >>Kill |cRXP_ENEMY_Thistleshrub Rootshapers|r
    .complete 3362,1 --Gnarled Thistleshrub slain (8)
    .complete 3362,2 --Thistleshrub Rootshaper slain (8)
    .mob Gnarled Thistleshrub
    .mob Thistleshrub Rootshaper
step
    .goto 1446/1,-3863.33,-7135.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Andi Lynn|r
    .turnin 5863 >>Turn in The Dunemaul Compound
    .target Andi Lynn
step
    .goto 1446/1,-3777.08,-7105.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tran'rek|r
    .turnin 3362 >>Turn in Thistleshrub Valley
    .target Tran'rek
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
    .accept 3447 >>Accept Secret of the Circle
    .accept 3446 >>Accept Into the Depths
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
    .goto 1446/1,-3777.08,-7105.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tran'rek|r
    .accept 4504 >>Accept Super Sticky
    .target Tran'rek
step
    .goto 1446/1,-3777.08,-7105.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tran'rek|r
    .turnin 4504 >>Turn in Super Sticky
    .target Tran'rek
    .isQuestComplete 4504
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
    +|cRXP_WARN_End of the Tanaris route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Un'Goro Crater|r: Linken's Sword
    >>|cRXP_FRIENDLY_another zone|r: Into the Depths, Secret of the Circle
    >>|cRXP_FRIENDLY_Un'Goro Crater and back here|r: Super Sticky
]])
