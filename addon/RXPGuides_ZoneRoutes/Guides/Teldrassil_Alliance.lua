-- 1-14 Teldrassil: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 2 parts with a level check between them (from level 1, 15).
-- Edit zones/Teldrassil.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#name 1-14 Teldrassil

step
    .goto 1438/1,826.28,10328.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Conservator Ilthalaine|r
    .accept 456 >>Accept The Balance of Nature
    .target Conservator Ilthalaine
step
    #loop
    .goto 1438/1,744.31,10270.46,0
    .goto 1438/1,744.31,10270.46,40,0
    .goto 1438/1,689.32,10320.69,40,0
    .goto 1438/1,677.61,10441.85,40,0
    .goto 1438/1,684.23,10497.51,40,0
    .goto 1438/1,537.08,10457.80,40,0
    .goto 1438/1,539.62,10404.86,40,0
    .goto 1438/1,589.01,10401.12,40,0
    .goto 1438/1,656.73,10375.67,40,0
    .goto 1438/1,648.59,10289.13,40,0
    >>Kill |cRXP_ENEMY_Young Nightsabers|r
    >>Kill |cRXP_ENEMY_Young Thistle Boars|r
    .complete 456,1 --Young Nightsaber slain (7)
    .complete 456,2 --Young Thistle Boar slain (4)
    .mob Young Nightsaber
    .mob Young Thistle Boar
step
    .xp 2 >>Grind to level 2 (A Good Friend needs it)
step
    .goto 1438/1,713.76,10407.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dirania Silvershine|r
    .accept 4495 >>Accept A Good Friend
    .target Dirania Silvershine
step
    .goto 1438/1,763.66,10389.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Melithar Staghelm|r
    .accept 458 >>Accept The Woodland Protector
    .target Melithar Staghelm
step << Priest
    .goto 1438/1,779.8482,10450.1295
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dellylah|r
    .vendor >> |cRXP_WARN_Vendor trash|r
    >>|cRXP_BUY_Buy 15|r |T132794:0|t[Refreshing Spring Water]
    .collect 159,15
    .target Dellylah
step << Warrior
    .goto 1438/1,794.92,10436.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Keina|r
    .vendor >> |cRXP_WARN_Vendor trash|r
    .target Keina
step << Warrior
    .goto 1438/1,778.07,10526.62
    .target Alyissia
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alyissia|r
    .trainer >> Train |T132333:0|t[Battle Shout]
step
    .goto 1438/1,826.28,10328.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Conservator Ilthalaine|r
    .turnin 456 >>Turn in The Balance of Nature while you are here
    .isQuestComplete 456
    .target Conservator Ilthalaine
step
    .goto 1438/1,1035.04,10711.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Iverron|r
    .turnin 4495 >>Turn in A Good Friend
    .accept 3519 >>Accept A Friend in Need
    .target Iverron
step
    .goto 1438/1,870.07,10296.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tarindrella|r
    .turnin 458 >>Turn in The Woodland Protector
    .accept 459 >>Accept The Woodland Protector
    .accept 97977 >>Accept Nature's Call
    .target Tarindrella
step
    .goto 1438/1,826.28,10328.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Conservator Ilthalaine|r
    .turnin 456 >>Turn in The Balance of Nature
    .accept 3118 >>Accept Encrypted Sigil << NightElf Rogue
    .accept 457 >>Accept The Balance of Nature
    .accept 3116 >>Accept Simple Sigil << NightElf Warrior
    .accept 3117 >>Accept Etched Sigil << NightElf Hunter
    .accept 3119 >>Accept Hallowed Sigil << NightElf Priest
    .accept 3120 >>Accept Verdant Sigil << NightElf Druid
    .target Conservator Ilthalaine
step << NightElf Rogue
    .goto 1438/1,777.91,10519.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Frahun Shadewhisper|r
    .turnin 3118 >>Turn in Encrypted Sigil
    .target Frahun Shadewhisper
step << NightElf Warrior
    .goto 1438/1,777.91,10526.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alyissia|r
    .turnin 3116 >>Turn in Simple Sigil while you are here
    .isQuestComplete 3116
    .target Alyissia
step << NightElf Priest
    .goto 1438/1,801.84,10458.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shanda|r
    .turnin 3119 >>Turn in Hallowed Sigil while you are here
    .isQuestComplete 3119
    .target Shanda
step << NightElf Druid
    .goto 1438/1,829.34,10463.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mardant Strongoak|r
    .turnin 3120 >>Turn in Verdant Sigil while you are here
    .isQuestComplete 3120
    .target Mardant Strongoak
step << NightElf Hunter
    .goto 1438/1,827.81,10458.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ayanna Everstride|r
    .turnin 3117 >>Turn in Etched Sigil while you are here
    .isQuestComplete 3117
    .target Ayanna Everstride
step
    #loop
    .goto 1438/1,1009.08,10483.93,0
    .goto 1438/1,1009.08,10483.93,40,0
    .goto 1438/1,1020.79,10354.63,40,0
    .goto 1438/1,1036.57,10343.77,40,0
    .goto 1438/1,1018.75,10333.59,40,0
    .goto 1438/1,964.78,10271.14,40,0
    .goto 1438/1,942.88,10265.71,40,0
    .goto 1438/1,955.10,10276.57,40,0
    .goto 1438/1,967.32,10298.97,40,0
    .goto 1438/1,973.43,10327.82,40,0
    >>Kill |cRXP_ENEMY_Grells|r and |cRXP_ENEMY_Grellkins|r. Loot them for |cRXP_LOOT_Fel Moss|r
    >>Pick up |cRXP_PICK_Gnarlpine Totem|r from the ground
    .complete 459,1 --Fel Moss (8)
    .complete 97977,1 --Gnarlpine Totem (4)
    .mob Grell
    .mob Grellkin
step
    .goto 1438/1,870.07,10296.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tarindrella|r
    .turnin 459 >>Turn in The Woodland Protector
    .turnin 97977 >>Turn in Nature's Call
    .target Tarindrella
step
    .goto 1438/1,713.76,10407.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dirania Silvershine|r
    .turnin 3519 >>Turn in A Friend in Need
    .accept 3521 >>Accept Iverron's Antidote
    .target Dirania Silvershine
step << NightElf Warrior
    .goto 1438/1,777.91,10526.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alyissia|r
    .turnin 3116 >>Turn in Simple Sigil
    .target Alyissia
step << Warrior
    .goto 1438/1,778.07,10526.62
    .target Alyissia
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alyissia|r
    .trainer >> Train your class spells
step << Priest
    .goto 1438/1,779.8482,10450.1295
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dellylah|r
    .vendor >> |cRXP_WARN_Vendor trash|r
    >>|cRXP_BUY_Buy up to 25|r |T132794:0|t[Refreshing Spring Water]
    .collect 159,25
    .target Dellylah
step
    .xp 3 >>Grind to level 3 (Webwood Venom needs it)
step
    .goto 1438/1,871.09,10417.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gilshalan Windwalker|r
    .accept 916 >>Accept Webwood Venom
    .target Gilshalan Windwalker
step << NightElf Hunter
    .goto 1438/1,827.81,10458.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ayanna Everstride|r
    .turnin 3117 >>Turn in Etched Sigil
    .target Ayanna Everstride
step << Hunter
    .goto 1438/1,871.6,10440.83,25,0
    .goto 1438/1,827.86,10458.51
    >>Ascend the Aldrassil Tree
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ayanna Everstride|r
    .train 1978 >>Train Serpent Sting
    .target Ayanna Everstride
step << NightElf Druid
    .goto 1438/1,829.34,10463.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mardant Strongoak|r
    .turnin 3120 >>Turn in Verdant Sigil
    .target Mardant Strongoak
step << Druid
    .goto 1438/1,871.6,10440.83,25,0
    .goto 1438/1,829.54,10464.01
    >>Ascend the Aldrassil Tree
    .target Mardant Strongoak
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mardant Strongoak|r
    .train 8921 >>Train |T136096:0|t[Moonfire]
step
    #completewith Along15
    >>As you go: Kill |cRXP_ENEMY_Mangy Nightsabers|r. Kill |cRXP_ENEMY_Thistle Boars|r. |cRXP_WARN_Anything left is finished later|r
    .complete 457,1 --Mangy Nightsaber slain (7)
    .complete 457,2 --Thistle Boar slain (7)
    .mob Mangy Nightsaber
    .mob Thistle Boar
step
    #label Along15
    #loop
    .goto 1438/1,895.02,10484.95,0
    .goto 1438/1,895.02,10484.95,40,0
    .goto 1438/1,937.28,10510.74,40,0
    .goto 1438/1,915.39,10577.26,40,0
    .goto 1438/1,887.89,10608.48,40,0
    .goto 1438/1,857.34,10623.08,40,0
    .goto 1438/1,858.87,10587.44,40,0
    .goto 1438/1,813.56,10563.68,40,0
    .goto 1438/1,827.30,10535.86,40,0
    .goto 1438/1,859.38,10526.35,40,0
    >>Pick up |cRXP_PICK_Moonpetal Lily|r from the ground
    .complete 3521,2 --Moonpetal Lily (4)
step
    #loop
    .goto 1438/1,934.23,10665.84,0
    .goto 1438/1,934.23,10665.84,40,0
    .goto 1438/1,944.41,10704.53,40,0
    .goto 1438/1,944.41,10802.60,40,0
    .goto 1438/1,924.04,10766.63,40,0
    .goto 1438/1,902.66,10735.75,40,0
    .goto 1438/1,872.11,10723.87,40,0
    .goto 1438/1,822.72,10696.72,40,0
    .goto 1438/1,882.29,10681.79,40,0
    .goto 1438/1,900.11,10679.75,40,0
    >>Kill |cRXP_ENEMY_Webwood Spider|r and loot |cRXP_LOOT_Webwood Ichor|r
    >>Kill |cRXP_ENEMY_Webwood Spiders|r. Loot them for |cRXP_LOOT_Webwood Venom Sac|r
    .complete 3521,3 --Webwood Ichor (1)
    .complete 916,1 --Webwood Venom Sac (10)
    .mob Webwood Spider
step
    #loop
    .goto 1438/1,1020.79,10354.63,0
    .goto 1438/1,1020.79,10354.63,40,0
    .goto 1438/1,1036.57,10343.77,40,0
    .goto 1438/1,1018.75,10333.59,40,0
    .goto 1438/1,967.32,10298.97,40,0
    .goto 1438/1,964.78,10271.14,40,0
    .goto 1438/1,955.10,10276.57,40,0
    .goto 1438/1,942.88,10265.71,40,0
    .goto 1438/1,892.48,10275.89,40,0
    .goto 1438/1,908.26,10328.16,40,0
    >>Kill |cRXP_ENEMY_Grells|r and |cRXP_ENEMY_Grellkins|r. Loot them for |cRXP_LOOT_Hyacinth Mushroom|r. It can also be picked up from |cRXP_PICK_Hyacinth Mushroom|r on the ground
    .complete 3521,1 --Hyacinth Mushroom (7)
    .mob Grell
    .mob Grellkin
step
    .goto 1438/1,713.76,10407.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dirania Silvershine|r
    .turnin 3521 >>Turn in Iverron's Antidote
    .accept 3522 >>Accept Iverron's Antidote
    .target Dirania Silvershine
step << !Priest
    .goto 1438/1,794.92,10436.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Keina|r
    .vendor >> |cRXP_WARN_Vendor trash|r << !Hunter
    .vendor >> |cRXP_BUY_Buy 3 or 4 stacks of|r |T132382:0|t[Rough Arrows] << Hunter
    .target Keina
step
    .goto 1438/1,871.09,10417.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gilshalan Windwalker|r
    .turnin 916 >>Turn in Webwood Venom
    .accept 917 >>Accept Webwood Egg
    .target Gilshalan Windwalker
step
    .goto 1438/1,1035.04,10711.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Iverron|r
    .turnin 3522 >>Turn in Iverron's Antidote
    .target Iverron
step
    .goto 1438/1,929.14,10933.26
    >>Open the |cRXP_PICK_Webwood Eggs|r. Loot it for |cRXP_LOOT_Webwood Egg|r
    .complete 917,1 --Webwood Egg (1)
step
    .goto 1438/1,930.15,10938.35
    >>Kill |cRXP_ENEMY_Githyiss the Vile|r and loot |cRXP_LOOT_Fang of Githyiss|r. Use it to start the quest
    .collect 277190,1,97236 --Fang of Githyiss (1)
    .accept 97236 >>Accept Fang of Githyiss
    .use 277190
    .mob Githyiss the Vile
step
    .goto 1438/1,871.09,10417.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gilshalan Windwalker|r
    .turnin 97236 >>Turn in Fang of Githyiss
    .turnin 917 >>Turn in Webwood Egg
    .accept 920 >>Accept Tenaron's Summons
    .target Gilshalan Windwalker
step
    .goto 1438/1,807.45,10492.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tenaron Stormgrip|r
    .turnin 920 >>Turn in Tenaron's Summons
    .accept 921 >>Accept Crown of the Earth
    .target Tenaron Stormgrip
step << NightElf Priest
    .goto 1438/1,801.84,10458.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shanda|r
    .accept 5622 >>Accept In Favor of Elune
    .target Shanda
    .xp <5,1
step
    #loop
    .goto 1438/1,695.94,10504.97,0
    .goto 1438/1,695.94,10504.97,40,0
    .goto 1438/1,849.20,10648.87,40,0
    .goto 1438/1,788.61,10656.67,40,0
    .goto 1438/1,762.13,10709.62,40,0
    .goto 1438/1,759.58,10608.14,40,0
    .goto 1438/1,689.83,10608.14,40,0
    .goto 1438/1,629.24,10662.78,40,0
    .goto 1438/1,613.96,10593.55,40,0
    .goto 1438/1,584.43,10514.81,40,0
    >>Open the |cRXP_PICK_Shadowglen Moonwell|r. Loot it for |cRXP_LOOT_Filled Crystal Phial|r
    >>Kill |cRXP_ENEMY_Mangy Nightsabers|r
    >>Kill |cRXP_ENEMY_Thistle Boars|r
    .complete 921,1 --Filled Crystal Phial (1)
    .complete 457,1 --Mangy Nightsaber slain (7)
    .complete 457,2 --Thistle Boar slain (7)
    .mob Mangy Nightsaber
    .mob Thistle Boar
step
    .goto 1438/1,826.28,10328.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Conservator Ilthalaine|r
    .turnin 457 >>Turn in The Balance of Nature
    .target Conservator Ilthalaine
step
    .goto 1438/1,807.45,10492.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tenaron Stormgrip|r
    .turnin 921 >>Turn in Crown of the Earth
    .accept 928 >>Accept Crown of the Earth
    .target Tenaron Stormgrip
step
    .goto 1438/1,806.94,10489.02
    >>Click the |cRXP_PICK_Lost Journal|r
    .accept 96630 >>Accept The Adventurer
step << NightElf Priest
    .goto 1438/1,801.84,10458.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shanda|r
    .turnin 3119 >>Turn in Hallowed Sigil
    .target Shanda
step << NightElf Priest
    .xp 5 >>Grind to level 5 (In Favor of Elune needs it)
step << NightElf Priest
    .goto 1438/1,801.84,10458.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shanda|r
    .accept 5622 >>Accept In Favor of Elune
    .target Shanda
step << Priest
    .goto 1438/1,801.64,10458.75
    .target Shanda
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shanda|r up stairs
    .trainer >> Train your class spells
step
    .goto 1438/1,700.52,10214.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Porthannius|r
    .accept 2159 >>Accept Dolanaar Delivery
    .target Porthannius
step
    .goto 1438/1,741.76,9925.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zenn Foulhoof|r
    .accept 488 >>Accept Zenn's Bidding
    .target Zenn Foulhoof
step
    .goto 1438/1,882.80,9909.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lyreena Duskblade|r
    .turnin 96630 >>Turn in The Adventurer
    .accept 96606 >>Accept The Great Outdoors
    .target Lyreena Duskblade
step
    .goto 1438/1,878.73,9905.64
    >>Click the |cRXP_PICK_Basic Campfire|r
    .complete 96606,2 --Basic Campfire
    .complete 96606,1 --Basic Campfire
step
    .goto 1438/1,882.80,9909.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lyreena Duskblade|r
    .turnin 96606 >>Turn in The Great Outdoors
    .accept 96634 >>Accept Camping 101: Cooking
    .target Lyreena Duskblade
step
    .goto 1438/1,959.18,9872.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Syral Bladeleaf|r
    .accept 997 >>Accept Denalan's Earth
    .target Syral Bladeleaf
step
    .goto 1438/1,965.29,9887.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Athridas Bearmantle|r
    .accept 475 >>Accept A Troubling Breeze
    .target Athridas Bearmantle
step << NightElf Priest
    .goto 1438/1,985.65,9905.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Laurna Morninglight|r
    .turnin 5622 >>Turn in In Favor of Elune
    .accept 5621 >>Accept Garments of the Moon
    .target Laurna Morninglight
step << Priest
    .goto 1438/1,985.45,9905.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Laurna Morninglight|r
    .target Laurna Morninglight
    .trainer >> Train your class spells
step
    .goto 1438/1,988.20,9891.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aldia|r
    .accept 87288 >>Accept Soft Saber Pelts
    .target Aldia
step << Rogue
    .goto 1438/1,988.30,9891.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aldia|r up stairs
    .vendor >> |cRXP_BUY_Buy and equip a|r |T135641:0|t[Balanced Throwing Dagger]
    .target Aldia
step
    .goto 1438/1,985.14,9898.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tallonkai Swiftroot|r
    .accept 932 >>Accept Twisted Hatred
    .accept 2438 >>Accept The Emerald Dreamcatcher
    .target Tallonkai Swiftroot
step << Hunter
    .goto 1438/1,968.85,9821.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jeena Featherbow|r
    .vendor >>|cRXP_BUY_Buy|r |T132382:0|t[Rough Arrows] |cRXP_BUY_until your Quiver is full|r
    .target Jeena Featherbow
step << NightElf Hunter
    .goto 1438/1,928.63,9812.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dazalar|r
    .turnin 6722 >>Turn in The Hunter's Path
    .target Dazalar
    .isOnQuest 6722
step << NightElf Hunter
    .goto 1438/1,928.63,9812.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dazalar|r
    .turnin 6721 >>Turn in The Hunter's Path
    .target Dazalar
    .isOnQuest 6721
step << NightElf Hunter
    .goto 1438/1,928.63,9812.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dazalar|r
    .turnin 6073 >>Turn in The Hunter's Path
    .target Dazalar
    .isOnQuest 6073
step
    .goto 1438/1,963.25,9811.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Kyra Starsong|r
    .accept 99046 >>Accept The Lost Runner
    .target Sentinel Kyra Starsong
step << Warrior
    .goto 1438/1,952.00,9822.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kyra Windblade|r
    .trainer >> Train your class spells
    .target Kyra Windblade
step << Rogue
    .goto 1438/1,943.85,9790.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jannok Breezesong|r
    .trainer >> Train your class spells
    .target Jannok Breezesong
step
    .goto 1438/1,982.60,9802.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Keldamyr|r
    .turnin 2159 >>Turn in Dolanaar Delivery
    .target Innkeeper Keldamyr
    .home >>Set your Hearthstone to Innkeeper Keldamyr's inn
step
    .goto 1438/1,982.65,9802.19
    .target Innkeeper Keldamyr
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Keldamyr|r
    .vendor >>|cRXP_BUY_Buy 10 |T132815:0|t|cRXP_LOOT_Ice Cold Milk|r or as much as you can afford << Priest
step << Hunter
    .goto 1438/1,928.83,9812.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dazalar|r
    .train 3044 >> Train Arcane Shot << era
    .train 5116 >> Train Concussive Shot << sod
    .target Dazalar
step << Druid
    .goto 1438/1,966.05,9741.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kal|r
    >>Skip training |T136006:0|t[|cRXP_LOOT_Wrath|r] if you can't afford it. Prioritize |T136104:0|t[|cRXP_LOOT_Thorns|r]
    .trainer >> Train your class spells
    .target Kal
step
    .goto 1438/1,956.12,9736.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corithras Moonrage|r
    .turnin 928 >>Turn in Crown of the Earth
    .accept 929 >>Accept Crown of the Earth
    .target Corithras Moonrage
step
    .goto 1438/1,906.22,9750.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zarrin|r
    .complete 96634,1 --Zarrin
    .target Zarrin
step
    .goto 1438/1,906.22,9750.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zarrin|r
    .turnin 96634 >>Turn in Camping 101: Cooking
    .target Zarrin
step
    .goto 1438/1,906.17,9751.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zarrin|r
    .train 2550 >>Train Cooking
    .target Zarrin
    .money <0.0094
step << NightElf Priest
    .goto 1438/1,900.11,9675.88
    >>Interact with |cRXP_FRIENDLY_Sentinel Shaya|r
    .complete 5621,1 --Sentinel Shaya
    .target Sentinel Shaya
step
    .goto 1438/1,713.76,9506.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Denalan|r
    .turnin 997 >>Turn in Denalan's Earth
    .accept 918 >>Accept Timberling Seeds
    .accept 919 >>Accept Timberling Sprouts
    .target Denalan
step
    #completewith Drop927x1
    >>|cRXP_LOOT_Moss-twined Heart|r can drop from |cRXP_ENEMY_Blackmoss the Fetid|r. Use it to start the quest if you get one
    .collect 5179,1,927 --Moss-twined Heart (1)
    .accept 927 >>Accept The Moss-twined Heart
    .use 5179
step
    #label Drop927x1
    #loop
    .goto 1438/1,647.06,9501.78,0
    .goto 1438/1,647.06,9501.78,40,0
    .goto 1438/1,778.42,9477.68,40,0
    .goto 1438/1,827.30,9359.24,40,0
    .goto 1438/1,1150.62,9319.88,40,0
    .goto 1438/1,1123.13,9408.79,40,0
    .goto 1438/1,1079.34,9492.62,40,0
    .goto 1438/1,969.87,9551.33,40,0
    .goto 1438/1,881.27,9590.70,40,0
    .goto 1438/1,756.53,9643.30,40,0
    >>Kill |cRXP_ENEMY_Timberlings|r, |cRXP_ENEMY_Timberling Bark Rippers|r, |cRXP_ENEMY_Timberling Tramplers|r and |cRXP_ENEMY_Timberling Mire Beasts|r. Loot them for |cRXP_LOOT_Timberling Seed|r
    >>Pick up |cRXP_PICK_Timberling Sprout|r from the ground
    .complete 918,1 --Timberling Seed (8)
    .complete 919,1 --Timberling Sprout (12)
    .mob Timberling
    .mob Timberling Bark Ripper
    .mob Timberling Trampler
    .mob Timberling Mire Beast
step
    .goto 1438/1,713.76,9506.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Denalan|r
    .turnin 918 >>Turn in Timberling Seeds
    .turnin 919 >>Turn in Timberling Sprouts
    .accept 922 >>Accept Rellian Greenspyre
    .target Denalan
step
    #loop
    .goto 1438/1,605.31,9653.48,0
    .goto 1438/1,605.31,9653.48,40,0
    .goto 1438/1,555.92,9655.86,40,0
    .goto 1438/1,392.98,9747.15,40,0
    .goto 1438/1,351.23,9806.88,40,0
    .goto 1438/1,345.63,9722.03,40,0
    .goto 1438/1,316.10,9713.55,40,0
    .goto 1438/1,460.19,9556.42,40,0
    .goto 1438/1,477.00,9576.10,40,0
    >>Kill |cRXP_ENEMY_Strigid Owls|r, |cRXP_ENEMY_Strigid Screechers|r and |cRXP_ENEMY_Strigid Hunters|r. Loot them for |cRXP_LOOT_Strigid Owl Feather|r
    >>Open the |cRXP_PICK_Tallonkai's Dresser|r. Loot it for |cRXP_LOOT_Emerald Dreamcatcher|r
    .complete 488,2 --Strigid Owl Feather (3)
    .complete 2438,1 --Emerald Dreamcatcher (1)
    .mob Strigid Owl
    .mob Strigid Screecher
    .mob Strigid Hunter
step
    .goto 1438/1,440.85,9845.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gaerolas Talvethren|r
    .turnin 475 >>Turn in A Troubling Breeze
    .accept 476 >>Accept Gnarlpine Corruption
    .target Gaerolas Talvethren
step
    #loop
    .goto 1438/1,587.49,9859.82,0
    .goto 1438/1,587.49,9859.82,40,0
    .goto 1438/1,618.54,9785.16,40,0
    .goto 1438/1,649.60,9737.65,40,0
    .goto 1438/1,782.50,9693.53,40,0
    .goto 1438/1,782.50,9805.18,40,0
    .goto 1438/1,702.05,9752.58,40,0
    .goto 1438/1,681.68,9828.26,40,0
    .goto 1438/1,720.38,9892.40,40,0
    .goto 1438/1,720.38,9978.94,40,0
    >>Open the |cRXP_PICK_Starbreeze Village Moonwell|r. Loot it for |cRXP_LOOT_Filled Jade Phial|r
    >>Kill |cRXP_ENEMY_Nightsabers|r. Loot them for |cRXP_LOOT_Soft Nightsaber Pelt|r
    >>Kill |cRXP_ENEMY_Elder Nightsabers|r, |cRXP_ENEMY_Feral Nightsabers|r, |cRXP_ENEMY_Nightsabers|r and |cRXP_ENEMY_Nightsaber Stalkers|r. Loot them for |cRXP_LOOT_Nightsaber Fang|r
    >>Kill |cRXP_ENEMY_Webwood Lurkers|r, |cRXP_ENEMY_Webwood Venomfangs|r, |cRXP_ENEMY_Webwood Silkspinners|r and |cRXP_ENEMY_Giant Webwood Spiders|r. Loot them for |cRXP_LOOT_Webwood Spider Silk|r
    .complete 929,1 --Filled Jade Phial (1)
    .complete 87288,1 --Soft Nightsaber Pelt (6)
    .complete 488,1 --Nightsaber Fang (3)
    .complete 488,3 --Webwood Spider Silk (3)
    .mob Nightsaber
    .mob Elder Nightsaber
    .mob Feral Nightsaber
    .mob Nightsaber Stalker
    .mob Webwood Lurker
    .mob Webwood Venomfang
    .mob Webwood Silkspinner
    .mob Giant Webwood Spider
step
    .goto 1438/1,741.76,9925.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zenn Foulhoof|r
    .turnin 488 >>Turn in Zenn's Bidding
    .target Zenn Foulhoof
step
    .goto 1438/1,963.25,9811.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Kyra Starsong|r
    .accept 489 >>Accept Seek Redemption!
    .target Sentinel Kyra Starsong
step
    .goto 1438/1,965.29,9887.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Athridas Bearmantle|r
    .turnin 476 >>Turn in Gnarlpine Corruption
    .accept 483 >>Accept The Relics of Wakening
    .target Athridas Bearmantle
step
    .goto 1438/1,985.65,9905.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Laurna Morninglight|r
    .turnin 5621 >>Turn in Garments of the Moon << NightElf Priest
    .accept 98391 >>Accept The Sisterhood of Elune
    .target Laurna Morninglight
step
    .goto 1438/1,988.20,9891.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aldia|r
    .turnin 87288 >>Turn in Soft Saber Pelts
    .target Aldia
step
    .goto 1438/1,985.14,9898.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tallonkai Swiftroot|r
    .turnin 2438 >>Turn in The Emerald Dreamcatcher
    .accept 2459 >>Accept Ferocitas the Dream Eater
    .target Tallonkai Swiftroot
step << Hunter
    .goto 1438/1,968.85,9821.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jeena Featherbow|r
    .vendor >>|cRXP_BUY_Buy up to 800|r |T132382:0|t[Rough Arrows]
    .target Jeena Featherbow
step << Hunter
    .goto 1438/1,928.83,9812.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dazalar|r
    .trainer >> Train your class spells
    .target Dazalar
    .xp <8,1
step << Rogue
    .goto 1438/1,943.85,9790.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jannok Breezesong|r
    .trainer >> Train your class spells
    .target Jannok Breezesong
    .xp <8,1
step << Warrior
    .goto 1438/1,952.00,9822.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kyra Windblade|r
    .trainer >> Train your class spells
    .target Kyra Windblade
    .xp <8,1
step
    .goto 1438/1,956.12,9736.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corithras Moonrage|r
    .turnin 929 >>Turn in Crown of the Earth
    .accept 933 >>Accept Crown of the Earth
    .target Corithras Moonrage
step << Druid
    .goto 1438/1,966.05,9741.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kal|r
    .trainer >> Train your class spells
    .target Kal
    .xp <8,1
step
    .goto 1438/1,1202.05,10127.93
    >>Kill |cRXP_ENEMY_Lord Melenas|r and loot |cRXP_LOOT_Melenas' Head|r
    .complete 932,1 --Melenas' Head (1)
    .mob Lord Melenas
step
    #loop
    .goto 1438/1,853.78,9952.13,0
    .goto 1438/1,853.78,9952.13,40,0
    .goto 1438/1,808.97,9927.02,40,0
    .goto 1438/1,810.50,9752.58,40,0
    .goto 1438/1,808.46,9719.32,40,0
    >>Pick up |cRXP_PICK_Fel Cone|r from the ground
    .complete 489,1 --Fel Cone (3)
step
    .goto 1438/1,741.76,9925.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zenn Foulhoof|r
    .turnin 489 >>Turn in Seek Redemption!
    .target Zenn Foulhoof
step
    .goto 1438/1,282.49,10018.65
    >>Kill |cRXP_ENEMY_Ferocitas the Dream Eater|r and loot |cRXP_LOOT_Gnarlpine Necklace|r
    .collect 8049,1,2459,1 --Gnarlpine Necklace (1)
    .mob Ferocitas the Dream Eater
step
    #loop
    .goto 1438/1,283.00,10025.44,0
    .goto 1438/1,283.00,10025.44,40,0
    .goto 1438/1,264.67,10036.30,40,0
    .goto 1438/1,308.97,10054.62,40,0
    .goto 1438/1,328.83,10076.34,40,0
    .goto 1438/1,338.50,10060.39,40,0
    .goto 1438/1,269.77,9953.83,40,0
    >>Kill |cRXP_ENEMY_Gnarlpine Mystics|r
    .complete 2459,1 --Gnarlpine Mystic slain (7)
    .mob Gnarlpine Mystic
step
    .goto 1438/1,953.07,9788.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brannol Eaglemoon|r
    .vendor >> |cRXP_BUY_Vendor and repair if necessary|r
    .target Brannol Eaglemoon
step
    #completewith Along67
    >>As you go: Open the |cRXP_PICK_Chest of the Sky|r. Loot it for |cRXP_LOOT_Sapphire of Sky|r. |cRXP_WARN_Anything left is finished later|r
    .complete 483,3 --Sapphire of Sky (1)
step
    #completewith Along67
    >>As you go: Open the |cRXP_PICK_Chest of Nesting|r. Loot it for |cRXP_LOOT_Rune of Nesting|r. |cRXP_WARN_Anything left is finished later|r
    .complete 483,4 --Rune of Nesting (1)
step
    #label Along67
    .goto 1438/1,1526.39,9741.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Oben Rageclaw|r
    .accept 2541 >>Accept The Sleeping Druid
    .target Oben Rageclaw
step
    #completewith Along68
    >>As you go: Kill |cRXP_ENEMY_Gnarlpine Shaman|r and loot |cRXP_LOOT_Shaman Voodoo Charm|r. |cRXP_WARN_Anything left is finished later|r
    .complete 2541,1 --Shaman Voodoo Charm (1)
    .mob Gnarlpine Shaman
step
    #label Along68
    .goto 1438/1,1538.61,9712.19
    >>Open the |cRXP_PICK_Chest of the Sky|r. Loot it for |cRXP_LOOT_Sapphire of Sky|r
    .complete 483,3 --Sapphire of Sky (1)
step
    .goto 1438/1,1655.21,9555.06
    >>Open the |cRXP_PICK_Pools of Arlithrien Moonwell|r. Loot it for |cRXP_LOOT_Filled Tourmaline Phial|r
    .complete 933,1 --Filled Tourmaline Phial (1)
step
    .goto 1438/1,1645.02,9245.55
    >>Click the |cRXP_PICK_Strange Fruited Plant|r
    .accept 930 >>Accept The Glowing Fruit
step
    #loop
    .goto 1438/1,1453.58,9206.52,0
    .goto 1438/1,1453.58,9206.52,40,0
    .goto 1438/1,1430.16,9185.82,40,0
    .goto 1438/1,1393.50,9167.50,40,0
    .goto 1438/1,1318.14,9182.43,40,0
    .goto 1438/1,1373.64,9186.84,40,0
    .goto 1438/1,1376.69,9196.68,40,0
    .goto 1438/1,1403.68,9204.83,40,0
    >>Kill |cRXP_ENEMY_Gnarlpine Shaman|r and loot |cRXP_LOOT_Shaman Voodoo Charm|r
    .complete 2541,1 --Shaman Voodoo Charm (1)
    .mob Gnarlpine Shaman
step
    #completewith next
    .hs >>Hearth to Innkeeper Keldamyr's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1438/1,956.12,9736.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corithras Moonrage|r
    .turnin 933 >>Turn in Crown of the Earth
    .accept 7383 >>Accept Crown of the Earth
    .target Corithras Moonrage
step
    .goto 1438/1,906.17,9751.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zarrin|r
    .train 2550 >>Train Cooking
    .target Zarrin
step << Warrior/Rogue
    .goto 1438/1,999.40,9902.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Byancie|r
    .train 3273 >> Train |T135966:0|t[First Aid]
    .target Byancie
step
    .goto 1438/1,985.14,9898.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tallonkai Swiftroot|r
    .turnin 932 >>Turn in Twisted Hatred
    .target Tallonkai Swiftroot
step
    #loop
    .goto 1438/1,988.71,9847.94,0
    .goto 1438/1,988.71,9847.94,40,0
    .goto 1438/1,1039.63,9846.25,40,0
    .goto 1438/1,1096.14,9879.84,40,0
    .goto 1438/1,1169.46,9918.53,40,0
    .goto 1438/1,1224.45,9915.14,40,0
    .goto 1438/1,1240.24,9926.68,40,0
    .goto 1438/1,1244.82,9988.10,40,0
    .goto 1438/1,1258.57,10003.72,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Moon Priestess Amara|r. |cRXP_WARN_This NPC walks a patrol route|r
    .accept 487 >>Accept The Road to Darnassus
    .unitscan Moon Priestess Amara
step
    #loop
    .goto 1438/1,1347.16,9995.23,0
    .goto 1438/1,1347.16,9995.23,40,0
    .goto 1438/1,1431.68,9985.39,40,0
    .goto 1438/1,1458.67,9991.16,40,0
    .goto 1438/1,1512.64,9977.24,40,0
    .goto 1438/1,1485.15,10012.54,40,0
    .goto 1438/1,1497.37,10035.62,40,0
    .goto 1438/1,1464.78,10095.69,40,0
    .goto 1438/1,1436.77,10050.55,40,0
    .goto 1438/1,1448.49,10018.31,40,0
    >>Kill |cRXP_ENEMY_Gnarlpine Ambushers|r
    .complete 487,1 --Gnarlpine Ambusher slain (6)
    .mob Gnarlpine Ambusher
step
    #loop
    .goto 1438/1,1258.57,10003.72,0
    .goto 1438/1,1258.57,10003.72,40,0
    .goto 1438/1,1244.82,9988.10,40,0
    .goto 1438/1,1240.24,9926.68,40,0
    .goto 1438/1,1224.45,9915.14,40,0
    .goto 1438/1,1169.46,9918.53,40,0
    .goto 1438/1,1096.14,9879.84,40,0
    .goto 1438/1,1039.63,9846.25,40,0
    .goto 1438/1,988.71,9847.94,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Moon Priestess Amara|r. |cRXP_WARN_This NPC walks a patrol route|r
    .turnin 487 >>Turn in The Road to Darnassus
    .unitscan Moon Priestess Amara
step
    #loop
    .goto 1438/1,1661.32,10087.54,0
    .goto 1438/1,1661.32,10087.54,40,0
    .goto 1438/1,1727.00,10107.23,40,0
    .goto 1438/1,1770.28,10105.53,40,0
    .goto 1438/1,1819.16,10038.67,40,0
    .goto 1438/1,1830.87,10022.38,40,0
    .goto 1438/1,1870.58,9984.37,40,0
    .goto 1438/1,1913.86,9983.35,40,0
    .goto 1438/1,1956.63,9981.66,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Shayla Nightbreeze|r. |cRXP_WARN_This NPC walks a patrol route|r
    .accept 490 >>Accept Bounty: Gnarlpine Furbolg
    .unitscan Sentinel Shayla Nightbreeze
step
    #completewith Along78
    >>As you go: Open the |cRXP_PICK_Chest of the Raven Claw|r. Loot it for |cRXP_LOOT_Raven Claw Talisman|r. |cRXP_WARN_Anything left is finished later|r
    .complete 483,1 --Raven Claw Talisman (1)
step
    #label Along78
    #loop
    .goto 1438/1,1497.37,10035.62,0
    .goto 1438/1,1497.37,10035.62,40,0
    .goto 1438/1,1464.78,10095.69,40,0
    .goto 1438/1,1436.77,10050.55,40,0
    .goto 1438/1,1347.16,9995.23,40,0
    .goto 1438/1,1458.67,9991.16,40,0
    .goto 1438/1,1479.54,9896.13,40,0
    .goto 1438/1,1529.44,9885.61,40,0
    .goto 1438/1,1572.21,9910.39,40,0
    .goto 1438/1,1512.64,9977.24,40,0
    >>Kill |cRXP_ENEMY_Gnarlpine Ursas|r, |cRXP_ENEMY_Gnarlpine Gardeners|r, |cRXP_ENEMY_Gnarlpine Warriors|r and |cRXP_ENEMY_Gnarlpine Shamans|r. Loot them for |cRXP_LOOT_Gnarlpine Fang|r
    .complete 490,1 --Gnarlpine Fang (15)
    .mob Gnarlpine Ursa
    .mob Gnarlpine Gardener
    .mob Gnarlpine Warrior
    .mob Gnarlpine Shaman
step
    #loop
    .goto 1438/1,1661.32,10087.54,0
    .goto 1438/1,1661.32,10087.54,40,0
    .goto 1438/1,1727.00,10107.23,40,0
    .goto 1438/1,1770.28,10105.53,40,0
    .goto 1438/1,1819.16,10038.67,40,0
    .goto 1438/1,1830.87,10022.38,40,0
    .goto 1438/1,1870.58,9984.37,40,0
    .goto 1438/1,1913.86,9983.35,40,0
    .goto 1438/1,1956.63,9981.66,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Shayla Nightbreeze|r. |cRXP_WARN_This NPC walks a patrol route|r
    .turnin 490 >>Turn in Bounty: Gnarlpine Furbolg
    .unitscan Sentinel Shayla Nightbreeze
step
    .goto 1438/1,1903.17,10582.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Eralya Leafshadow|r
    .turnin 99046 >>Turn in The Lost Runner
    .accept 99047 >>Accept Not Dead Yet
    .target Sentinel Eralya Leafshadow
step
    #completewith Along81
    >>As you go: Open the |cRXP_PICK_Oracle Glade Moonwell|r. Loot it for |cRXP_LOOT_Filled Amethyst Phial|r. |cRXP_WARN_Anything left is finished later|r
    .complete 7383,1 --Filled Amethyst Phial (1)
step
    #label Along81
    .goto 1438/1,1863.46,10665.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Arynia Cloudsbreak|r
    .accept 937 >>Accept The Enchanted Glade
    .target Sentinel Arynia Cloudsbreak
step
    .goto 1438/1,1857.35,10675.34
    >>Open the |cRXP_PICK_Oracle Glade Moonwell|r. Loot it for |cRXP_LOOT_Filled Amethyst Phial|r
    .complete 7383,1 --Filled Amethyst Phial (1)
step
    #completewith Along83
    >>As you go: Kill |cRXP_ENEMY_Bloodfeather Harpies|r, |cRXP_ENEMY_Bloodfeather Rogues|r, |cRXP_ENEMY_Bloodfeather Sorceress|r and |cRXP_ENEMY_Bloodfeather Furies|r. Loot them for |cRXP_LOOT_Bloodfeather Belt|r. |cRXP_WARN_Anything left is finished later|r
    .complete 937,1 --Bloodfeather Belt (6)
    .mob Bloodfeather Harpy
    .mob Bloodfeather Rogue
    .mob Bloodfeather Sorceress
    .mob Bloodfeather Fury
step
    #label Along83
    .goto 1438/1,2052.36,10855.21
    >>Click the |cRXP_PICK_Strange Fronded Plant|r
    .accept 931 >>Accept The Shimmering Frond
step
    #completewith next
    .zone 1457 >>Travel to Darnassus
    .zoneskip 1457
step << NightElf Hunter
    .xp 10 >>Grind to level 10 (The Hunter's Path needs it)
step << NightElf Hunter
    .goto 1457/1,2511.01,10177.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jocaste|r
    .accept 6071 >>Accept The Hunter's Path
    .target Jocaste
step
    .goto 1457/1,2534.29,10085.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rellian Greenspyre|r
    .turnin 922 >>Turn in Rellian Greenspyre
    .accept 923 >>Accept Tumors
    .target Rellian Greenspyre
step << NightElf Druid
    .xp 10 >>Grind to level 10 (Heeding the Call needs it)
step << NightElf Druid
    .goto 1457/1,2570.38,10186.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Denatharion|r
    .accept 5923 >>Accept Heeding the Call
    .target Denatharion
step << NightElf Druid
    .goto 1457/1,2564.03,10179.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mathrengyl Bearwalker|r
    .turnin 5924 >>Turn in Heeding the Call
    .target Mathrengyl Bearwalker
    .isOnQuest 5924
step << NightElf Druid
    .goto 1457/1,2564.03,10179.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mathrengyl Bearwalker|r
    .turnin 5923 >>Turn in Heeding the Call
    .accept 5921 >>Accept Moonglade
    .target Mathrengyl Bearwalker
step << Druid NightElf
    .isOnQuest 5923
    .goto 1457/1,2563.92,10179.040
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mathrengyl Bearwalker|r on the middle level
    .trainer >> Train your class spells
    .target Mathrengyl Bearwalker
step << Druid NightElf
    .isOnQuest 5925
    .goto 1457/1,2563.92,10179.040
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mathrengyl Bearwalker|r on the middle level
    .trainer >> Train your class spells
    .target Mathrengyl Bearwalker
step << NightElf Priest
    .goto 1457/1,2520.11,9665.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Alathea|r
    .turnin 5633 >>Turn in Returning Home
    .target Priestess Alathea
    .isOnQuest 5633
step << NightElf Priest
    .goto 1457/1,2520.11,9665.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Alathea|r
    .turnin 5632 >>Turn in Returning Home
    .target Priestess Alathea
    .isOnQuest 5632
step << NightElf Priest
    .goto 1457/1,2520.11,9665.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Alathea|r
    .turnin 5631 >>Turn in Returning Home
    .target Priestess Alathea
    .isOnQuest 5631
step << NightElf Priest
    .goto 1457/1,2520.11,9665.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Alathea|r
    .turnin 5630 >>Turn in Returning Home
    .target Priestess Alathea
    .isOnQuest 5630
step << NightElf Priest
    .goto 1457/1,2520.11,9665.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Alathea|r
    .turnin 5628 >>Turn in Returning Home
    .target Priestess Alathea
    .isOnQuest 5628
step
    .goto 1457/1,2518.73,9606.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Dalia Sunblade|r
    .accept 98067 >>Accept Eyes of the Sentinels
    .target Sentinel Dalia Sunblade
step
    .goto 1457/1,2550.48,9631.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess A'moora|r
    .accept 2518 >>Accept Tears of the Moon
    .target Priestess A'moora
step
    #completewith next
    .zone 1438 >>Leave Darnassus for Teldrassil
    .zoneskip 1438
step
    .goto 1438/1,1553.88,9772.60
    >>Open the |cRXP_PICK_Chest of the Black Feather|r. Loot it for |cRXP_LOOT_Black Feather Quill|r
    >>Open the |cRXP_PICK_Chest of Nesting|r. Loot it for |cRXP_LOOT_Rune of Nesting|r
    .complete 483,2 --Black Feather Quill (1)
    .complete 483,4 --Rune of Nesting (1)
step
    .goto 1438/1,1526.39,9741.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Oben Rageclaw|r
    .turnin 2541 >>Turn in The Sleeping Druid
    .target Oben Rageclaw
step << NightElf Priest
    #completewith next
    .zone 1457 >>Travel to Darnassus
    .zoneskip 1457
step << NightElf Priest
    .xp 10 >>Grind to level 10 (Stars of Elune needs it)
step << NightElf Priest
    .goto 1457/1,2520.11,9665.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Alathea|r
    .accept 5627 >>Accept Stars of Elune
    .target Priestess Alathea
step << NightElf Priest
    #completewith next
    .zone 1438 >>Leave Darnassus for Teldrassil
    .zoneskip 1438
step
    .goto 1438/1,999.40,9902.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Byancie|r
    .turnin 99047 >>Turn in Not Dead Yet
    .accept 99050 >>Accept The Great Tree Provides
    .target Byancie
step << Hunter
    .goto 1438/1,968.85,9821.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jeena Featherbow|r
    .vendor >> |cRXP_BUY_Buy 4 stacks of|r |T132382:0|t[Sharp Arrows]|cRXP_BUY_. Equip them as soon as you reach level 10|r
    .target Jeena Featherbow
step
    .goto 1438/1,985.14,9898.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tallonkai Swiftroot|r
    .accept 98403 >>Accept Twisted Hatred
    .target Tallonkai Swiftroot
step << NightElf Hunter
    .goto 1438/1,928.63,9812.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dazalar|r
    .turnin 6071 >>Turn in The Hunter's Path
    .accept 6063 >>Accept Taming the Beast
    .target Dazalar
step
    .goto 1438/1,956.12,9736.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corithras Moonrage|r
    .turnin 7383 >>Turn in Crown of the Earth
    .accept 935 >>Accept Crown of the Earth
    .target Corithras Moonrage
step
    #completewith Along107
    >>As you go: Kill |cRXP_ENEMY_Lasher Sproutlings|r, |cRXP_ENEMY_Blooming Lashers|r and |cRXP_ENEMY_Wrathvines|r. Loot them for |cRXP_LOOT_Dewy Lasher Frond|r. |cRXP_WARN_Anything left is finished later|r
    .complete 99050,1 --Dewy Lasher Frond (6)
    .mob Lasher Sproutling
    .mob Blooming Lasher
    .mob Wrathvine
step
    .goto 1438/1,713.76,9506.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Denalan|r
    .turnin 931 >>Turn in The Shimmering Frond
    .turnin 930 >>Turn in The Glowing Fruit
    .target Denalan
step
    .goto 1438/1,713.76,9506.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Denalan|r
    .turnin 927 >>Turn in The Moss-twined Heart
    .target Denalan
    .isOnQuest 927
step
    .goto 1438/1,713.76,9506.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Denalan|r
    .accept 941 >>Accept Planting the Heart
    .target Denalan
    .isQuestTurnedIn 927 --any of: The Moss-twined Heart
    .xp <9,1
step
    .goto 1438/1,720.38,9502.12
    >>Click the |cRXP_PICK_Denalan's Planter|r
    .turnin 941 >>Turn in Planting the Heart
    .isOnQuest 941
step
    #label Along107
    .goto 1438/1,719.87,9503.48
    >>Click the |cRXP_PICK_Sprouted Frond|r
    .accept 2399 >>Accept The Sprouted Fronds
    .turnin 2399 >>Turn in The Sprouted Fronds
step
    #loop
    .goto 1438/1,717.83,9508.91,0
    .goto 1438/1,717.83,9508.91,40,0
    .goto 1438/1,720.38,9424.74,40,0
    .goto 1438/1,653.17,9501.44,40,0
    .goto 1438/1,608.36,9624.63,40,0
    .goto 1438/1,758.57,9728.48,40,0
    .goto 1438/1,888.40,9687.08,40,0
    .goto 1438/1,858.87,9633.80,40,0
    .goto 1438/1,788.10,9649.41,40,0
    .goto 1438/1,717.83,9588.32,40,0
    >>Kill |cRXP_ENEMY_Lasher Sproutlings|r, |cRXP_ENEMY_Blooming Lashers|r and |cRXP_ENEMY_Wrathvines|r. Loot them for |cRXP_LOOT_Dewy Lasher Frond|r
    .complete 99050,1 --Dewy Lasher Frond (6)
    .mob Lasher Sproutling
    .mob Blooming Lasher
    .mob Wrathvine
step
    .goto 1438/1,784.02,10442.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy |cRXP_LOOT_Refreshing Spring Water|r from |cRXP_FRIENDLY_Lyrai|r
    .complete 99050,3 --Refreshing Spring Water (1)
    .target Lyrai
step
    #loop
    .goto 1438/1,1193.90,10347.50,0
    .goto 1438/1,1193.90,10347.50,40,0
    .goto 1438/1,1186.77,10320.35,40,0
    .goto 1438/1,1197.98,10293.54,40,0
    .goto 1438/1,1296.75,10270.46,40,0
    .goto 1438/1,1288.61,10301.69,40,0
    .goto 1438/1,1277.91,10338.34,40,0
    .goto 1438/1,1250.42,10347.50,40,0
    .goto 1438/1,1274.35,10381.10,40,0
    .goto 1438/1,1209.69,10378.05,40,0
    >>Kill |cRXP_ENEMY_Befouled Webwoods|r
    .complete 98403,1 --Befouled Webwood slain (8)
    .mob Befouled Webwood
step
    #completewith next
    .zone 1457 >>Travel to Darnassus
    .zoneskip 1457
step
    .goto 1457/1,2632.08,9915.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sister Aquinne|r
    .turnin 98391 >>Turn in The Sisterhood of Elune
    .accept 2519 >>Accept The Temple of the Moon
    .target Sister Aquinne
step
    .goto 1457/1,2593.98,10099.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy |cRXP_LOOT_Empty Vial|r from |cRXP_FRIENDLY_Kyrai|r
    .complete 99050,2 --Empty Vial (1)
    .target Kyrai
step
    .goto 1457/1,2569.96,10172.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Arch Druid Fandral Staghelm|r
    .turnin 935 >>Turn in Crown of the Earth while you are here
    .isQuestComplete 935
    .target Arch Druid Fandral Staghelm
step
    #completewith next
    .zone 1438 >>Leave Darnassus for Teldrassil
    .zoneskip 1438
step
    #completewith next
    .hs >>Hearth to Innkeeper Keldamyr's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1438/1,999.40,9902.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Byancie|r
    .turnin 99050 >>Turn in The Great Tree Provides
    .accept 99073 >>Accept Easing Suffering
    .target Byancie
step << Dwarf Priest
    .goto 1438/1,985.65,9905.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Laurna Morninglight|r
    .accept 5636 >>Accept Desperate Prayer
    .target Laurna Morninglight
    .xp <10,1
step
    .goto 1438/1,1490.24,9881.88
    >>Open the |cRXP_PICK_Chest of the Raven Claw|r. Loot it for |cRXP_LOOT_Raven Claw Talisman|r
    .complete 483,1 --Raven Claw Talisman (1)
step
    .goto 1438/1,1539.63,9831.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Lynessa Duskblossom|r
    .accept 99053 >>Accept Escaping Ban'ethil
    .target Sentinel Lynessa Duskblossom
step
    .goto 1438/1,1621.09,10078.38
    >>Escort Lynessa Duskblossom out of Ban'ethil
    .complete 99053,1 --Escort Lynessa Duskblossom out of Ban'ethil
step << Warrior
    .xp 10 >>Grind to level 10 (Elanaria needs it)
step << Warrior
    #loop
    .goto 1438/1,1258.57,10003.72,0
    .goto 1438/1,1258.57,10003.72,40,0
    .goto 1438/1,1244.82,9988.10,40,0
    .goto 1438/1,1240.24,9926.68,40,0
    .goto 1438/1,1224.45,9915.14,40,0
    .goto 1438/1,1169.46,9918.53,40,0
    .goto 1438/1,1096.14,9879.84,40,0
    .goto 1438/1,1039.63,9846.25,40,0
    .goto 1438/1,988.71,9847.94,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Moon Priestess Amara|r. |cRXP_WARN_This NPC walks a patrol route|r
    .accept 1684 >>Accept Elanaria
    .unitscan Moon Priestess Amara
step << Rogue
    .goto 1438/1,943.85,9790.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jannok Breezesong|r
    .trainer >> Train your class spells
    .train 5171 >> Train |T132306:0|t[Slice and Dice]
    .train 921 >> Train |T133644:0|t[Pick Pocket] as well which is needed for your level 10 Rogue quest
    .target Jannok Breezesong
step << Hunter
    .goto 1438/1,928.83,9812.34
    .target Dazalar
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dazalar|r
    .trainer >> Train your class spells
step
    .goto 1438/1,963.25,9811.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Kyra Starsong|r
    .turnin 99053 >>Turn in Escaping Ban'ethil while you are here
    .isQuestComplete 99053
    .target Sentinel Kyra Starsong
step
    .goto 1438/1,965.29,9887.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Athridas Bearmantle|r
    .turnin 483 >>Turn in The Relics of Wakening while you are here
    .isQuestComplete 483
    .target Athridas Bearmantle
step << Dwarf Priest
    .goto 1438/1,985.65,9905.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Laurna Morninglight|r
    .accept 5636 >>Accept Desperate Prayer
    .target Laurna Morninglight
    .xp <10,1
step << Rogue
    .xp 10 >>Grind to level 10 (The Apple Falls needs it)
step << Rogue
    .goto 1438/1,943.90,9790.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jannok Breezesong|r
    .accept 2241 >>Accept The Apple Falls
    .target Jannok Breezesong
step << Priest
    .goto 1438/1,985.45,9905.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Laurna Morninglight|r
    .trainer >> Train your class spells
    .target Laurna Morninglight
step << Rogue
    #completewith next
    .zone 1457 >>Travel to Darnassus
    .zoneskip 1457
step << Rogue
    .goto 1457/1,2546.89,10083.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Syurna|r
    .turnin 2241 >>Turn in The Apple Falls
    .accept 2242 >>Accept Destiny Calls
    .target Syurna
step << Rogue
    #completewith next
    .zone 1438 >>Leave Darnassus for Teldrassil
    .zoneskip 1438
step << NightElf Hunter
    #loop
    .goto 1438/1,686.77,9978.26,0
    .goto 1438/1,686.77,9978.26,40,0
    .goto 1438/1,720.38,9892.40,40,0
    .goto 1438/1,755.51,9854.73,40,0
    .goto 1438/1,747.87,9811.63,40,0
    .goto 1438/1,702.05,9752.58,40,0
    >>Interact with |cRXP_FRIENDLY_Webwood Lurker|r
    .complete 6063,1 --Webwood Lurker
    .target Webwood Lurker
step << NightElf Hunter
    .goto 1438/1,928.63,9812.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dazalar|r
    .turnin 6063 >>Turn in Taming the Beast
    .accept 6101 >>Accept Taming the Beast
    .target Dazalar
step << NightElf Hunter
    #loop
    .goto 1438/1,648.08,9384.36,0
    .goto 1438/1,648.08,9384.36,40,0
    .goto 1438/1,585.45,9381.98,40,0
    .goto 1438/1,579.85,9412.86,40,0
    >>Interact with |cRXP_FRIENDLY_Nightsaber Stalker|r
    .complete 6101,1 --Nightsaber Stalker
    .target Nightsaber Stalker
step << NightElf Hunter
    .goto 1438/1,928.63,9812.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dazalar|r
    .turnin 6101 >>Turn in Taming the Beast
    .accept 6102 >>Accept Taming the Beast
    .target Dazalar
step << NightElf Hunter
    #loop
    .goto 1438/1,1800.83,9980.30,0
    .goto 1438/1,1800.83,9980.30,40,0
    .goto 1438/1,1791.66,10008.47,40,0
    .goto 1438/1,1823.74,10088.22,40,0
    .goto 1438/1,1838.00,10084.83,40,0
    .goto 1438/1,1900.12,10090.60,40,0
    >>Interact with |cRXP_FRIENDLY_Strigid Screecher|r
    .complete 6102,1 --Strigid Screecher
    .target Strigid Screecher
step << NightElf Hunter
    .goto 1438/1,928.63,9812.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dazalar|r
    .turnin 6102 >>Turn in Taming the Beast
    .accept 6103 >>Accept Training the Beast
    .target Dazalar
step
    #completewith next
    .zone 1457 >>Travel to Darnassus
    .zoneskip 1457
step
    .goto 1457/1,1994.96,9993.00
    >>Place Sentinel Owls at the entrance to the Cenarion Hold depths, the Darnassus Bank, the Craftsman's Terrace Inn, and the City Gate for Sentinel Dalia Sunblade in the Temple of the Moon in Darnassus.
    .complete 98067,4 --Credit
    .target Credit
step << Hunter
    .goto 1438/1,1716.82,10324.42,0
    .goto 1438/1,1564.07,10480.54,0
    .goto 1438/1,1492.78,10765.61,0
    .goto 1438/1,1900.12,10853.85,0
    >>|cRXP_WARN_Cast|r |T132164:0|t[Tame Beast] |cRXP_WARN_on a |cRXP_ENEMY_Strigid Hunter|r to tame it|r
    .train 2981 >> |cRXP_WARN_Attack mobs with it to learn|r |T132140:0|t[Claw (Rank 2)]
step
    #completewith next
    .zone 1438 >>Leave Darnassus for Teldrassil
    .zoneskip 1438
step
    #loop
    .goto 1438/1,1683.72,10413.00,0
    .goto 1438/1,1683.72,10413.00,40,0
    .goto 1438/1,1653.17,10449.65,40,0
    .goto 1438/1,1651.64,10518.55,40,0
    .goto 1438/1,1651.64,10583.03,40,0
    .goto 1438/1,1682.70,10680.09,40,0
    .goto 1438/1,1580.87,10647.17,40,0
    .goto 1438/1,1578.83,10501.24,40,0
    .goto 1438/1,1586.47,10449.65,40,0
    .goto 1438/1,1578.83,10382.46,40,0
    >>Kill |cRXP_ENEMY_Timberling Tramplers|r, |cRXP_ENEMY_Timberling Mire Beasts|r and |cRXP_ENEMY_Elder Timberlings|r. Loot them for |cRXP_LOOT_Mossy Tumor|r
    .complete 923,1 --Mossy Tumor (5)
    .mob Timberling Trampler
    .mob Timberling Mire Beast
    .mob Elder Timberling
step
    #loop
    .goto 1438/1,1676.08,10962.45,0
    .goto 1438/1,1676.08,10962.45,40,0
    .goto 1438/1,1706.63,10976.03,40,0
    .goto 1438/1,1808.47,10962.45,40,0
    .goto 1438/1,1798.28,10962.45,40,0
    .goto 1438/1,1727.00,10962.45,40,0
    >>Kill |cRXP_ENEMY_Lady Sathrah|r and loot |cRXP_LOOT_Silvery Spinnerets|r
    .complete 2518,1 --Silvery Spinnerets (1)
    .mob Lady Sathrah
step << Rogue
    .goto 1438/1,1925.07,11056.46
    >>Kill |cRXP_ENEMY_Sethir the Ancient|r and loot |cRXP_LOOT_Sethir's Journal|r
    .complete 2242,1 --Sethir's Journal (1)
    .mob Sethir the Ancient
step
    #loop
    .goto 1438/1,2067.63,10869.46,0
    .goto 1438/1,2067.63,10869.46,40,0
    .goto 1438/1,2076.29,10817.88,40,0
    .goto 1438/1,2148.59,10746.27,40,0
    .goto 1438/1,2155.72,10724.55,40,0
    .goto 1438/1,2174.56,10732.69,40,0
    .goto 1438/1,2196.96,10735.07,40,0
    .goto 1438/1,2143.50,10796.50,40,0
    .goto 1438/1,2128.73,10812.79,40,0
    .goto 1438/1,2115.49,10835.86,40,0
    >>Kill |cRXP_ENEMY_Bloodfeather Harpies|r, |cRXP_ENEMY_Bloodfeather Rogues|r, |cRXP_ENEMY_Bloodfeather Sorceress|r and |cRXP_ENEMY_Bloodfeather Furies|r. Loot them for |cRXP_LOOT_Bloodfeather Belt|r
    .complete 937,1 --Bloodfeather Belt (6)
    .mob Bloodfeather Harpy
    .mob Bloodfeather Rogue
    .mob Bloodfeather Sorceress
    .mob Bloodfeather Fury
step
    .goto 1438/1,1863.46,10665.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Arynia Cloudsbreak|r
    .turnin 937 >>Turn in The Enchanted Glade
    .accept 98392 >>Accept Darkness in the Glade
    .target Sentinel Arynia Cloudsbreak
step
    .goto 1438/1,2029.95,10497.85
    >>Kill |cRXP_ENEMY_Hatescreech|r and loot |cRXP_LOOT_Hatescreech's Amulet|r
    .complete 98392,1 --Hatescreech's Amulet (1)
    .mob Hatescreech
step
    .goto 1438/1,2125.17,10605.09
    >>Kill |cRXP_ENEMY_Windmistress Gaedress|r and loot |cRXP_LOOT_Windmistress Gaedress' Amulet|r
    .complete 98392,2 --Windmistress Gaedress' Amulet (1)
    .mob Windmistress Gaedress
step
    .goto 1438/1,2072.21,10883.04
    >>Kill |cRXP_ENEMY_Witchmother Arysa|r and loot |cRXP_LOOT_Witchmother Arysa's Amulet|r
    .complete 98392,3 --Witchmother Arysa's Amulet (1)
    .mob Witchmother Arysa
step
    .goto 1438/1,1863.46,10665.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Arynia Cloudsbreak|r
    .turnin 98392 >>Turn in Darkness in the Glade
    .accept 98398 >>Accept The Oracle Tree
    .target Sentinel Arynia Cloudsbreak
step
    .goto 1438/1,1931.68,10678.39
    >>Click the |cRXP_PICK_Oracle Tree Bark|r
    .turnin 98398 >>Turn in The Oracle Tree
    .accept 940 >>Accept Teldrassil
step << Hunter
    .goto 1457/1,2316.49,9924.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ariyell Skyshadow|r
    .vendor >>|cRXP_BUY_Sell your vendor trash|r
    .target Ariyell Skyshadow
step << Hunter
    .goto 1457/1,2329.19,9908.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ilyenia Moonfire|r
    .train 227 >>Train Staves
    >>If you have a Staff in your bags, equip it
    .target Ilyenia Moonfire
step << Priest
    .goto 1457/1,2315.900,10148.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lalina Summermoon|r
    .train 7411 >>Train |T136244:0|t[|cRXP_LOOT_Enchanting|r]. You will need it to craft a |T135139:0|t[|cRXP_LOOT_Wand|r]
    .target Lalina Summermoon
step << Priest
    .goto 1457/1,2315.900,10148.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lalina Summermoon|r
    .train 14293 >>Train |T135139:0|t[|cRXP_FRIENDLY_Lesser Magic Wand|r] from her
    .target Lalina Summermoon
step << Warrior
    .goto 1457/1,2331.94,9994.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elanaria|r
    .turnin 1684 >>Turn in Elanaria while you are here
    .isQuestComplete 1684
    .target Elanaria
step
    #completewith next
    .zone 1457 >>Travel to Darnassus
    .zoneskip 1457
step
    .goto 1457/1,2569.96,10172.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Arch Druid Fandral Staghelm|r
    .turnin 940 >>Turn in Teldrassil
    .target Arch Druid Fandral Staghelm
step << NightElf Hunter
    .goto 1457/1,2511.01,10177.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jocaste|r
    .turnin 6103 >>Turn in Training the Beast while you are here
    .isQuestComplete 6103
    .target Jocaste
step
    #completewith next
    .zone 1438 >>Leave Darnassus for Teldrassil
    .zoneskip 1438
step
    .goto 1438/1,1903.17,10582.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Eralya Leafshadow|r
    .turnin 99073 >>Turn in Easing Suffering
    .target Sentinel Eralya Leafshadow
step
    #completewith next
    .zone 1457 >>Travel to Darnassus
    .zoneskip 1457
step << NightElf
    .xp 10 >>Grind to level 10 (Nessa Shadowsong needs it)
step << NightElf
    .goto 1457/1,2190.33,9918.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mydrannul|r
    .accept 6344 >>Accept Nessa Shadowsong
    .target Mydrannul
step << Warrior
    .goto 1457/1,2331.94,9994.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elanaria|r
    .turnin 1684 >>Turn in Elanaria
    .accept 1683 >>Accept Vorlus Vilehoof
    .target Elanaria
step
    #completewith next
    .zone 1438 >>Leave Darnassus for Teldrassil
    .zoneskip 1438
step << Warrior
    .goto 1438/1,1408.77,9672.83
    >>Kill |cRXP_ENEMY_Vorlus Vilehoof|r and loot |cRXP_LOOT_Horn of Vorlus|r
    .complete 1683,1 --Horn of Vorlus (1)
    .mob Vorlus Vilehoof
step
    #completewith next
    .zone 1457 >>Travel to Darnassus
    .zoneskip 1457
step << Warrior
    .goto 1457/1,2331.94,9994.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elanaria|r
    .turnin 1683 >>Turn in Vorlus Vilehoof
    .accept 1686 >>Accept The Shade of Elura
    .target Elanaria
step << Warrior
    .goto 1457/1,2331.94,9994.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elanaria|r
    .turnin 1686 >>Turn in The Shade of Elura
    .target Elanaria
    .isQuestComplete 1686
step << Warrior
    .goto 1457/1,2331.94,9994.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elanaria|r
    .accept 1692 >>Accept Smith Mathiel
    .target Elanaria
    .isQuestTurnedIn 1686 --any of: The Shade of Elura
    .xp <10,1
step << Warrior
    .goto 1457/1,2308.55,9918.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mathiel|r
    .turnin 1692 >>Turn in Smith Mathiel
    .target Mathiel
    .isOnQuest 1692
step << Warrior
    .goto 1457/1,2308.55,9918.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mathiel|r
    .accept 1693 >>Accept Weapons of Elunite
    .target Mathiel
    .isQuestTurnedIn 1692 --any of: Smith Mathiel
    .xp <10,1
step << Warrior
    .goto 1457/1,2308.55,9918.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mathiel|r
    .turnin 1693 >>Turn in Weapons of Elunite
    .target Mathiel
    .isOnQuest 1693
step
    .goto 1457/1,2234.99,10129.99
    >>Place Sentinel Owls at the entrance to the Cenarion Hold depths, the Darnassus Bank, the Craftsman's Terrace Inn, and the City Gate for Sentinel Dalia Sunblade in the Temple of the Moon in Darnassus.
    .complete 98067,3 --Credit
    .target Credit
step << NightElf Druid
    .goto 1457/1,2564.03,10179.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mathrengyl Bearwalker|r
    .turnin 5931 >>Turn in Back to Darnassus
    .target Mathrengyl Bearwalker
    .isOnQuest 5931
step
    .goto 1457/1,2569.96,10172.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Arch Druid Fandral Staghelm|r
    .turnin 935 >>Turn in Crown of the Earth
    .accept 98046 >>Accept Crown of the Earth
    .target Arch Druid Fandral Staghelm
step << NightElf Hunter
    .goto 1457/1,2511.01,10177.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jocaste|r
    .turnin 6103 >>Turn in Training the Beast
    .target Jocaste
step << Hunter
    >>|cRXP_WARN_Go up the ramp to the right of|r |cRXP_FRIENDLY_Jocaste|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Silvaria|r
    .goto 1457/1,2491.75,10176.21
    .trainer >>Train pet spells
    .target Silvaria
step
    .goto 1457/1,2584.99,10119.97
    >>Place Sentinel Owls at the entrance to the Cenarion Hold depths, the Darnassus Bank, the Craftsman's Terrace Inn, and the City Gate for Sentinel Dalia Sunblade in the Temple of the Moon in Darnassus.
    .complete 98067,1 --Credit
    .target Credit
step
    .goto 1457/1,2534.29,10085.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rellian Greenspyre|r
    .turnin 923 >>Turn in Tumors while you are here
    .isQuestComplete 923
    .target Rellian Greenspyre
step << Rogue
    .goto 1457/1,2546.89,10083.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Syurna|r
    .turnin 2242 >>Turn in Destiny Calls
    .target Syurna
step
    .goto 1457/1,2534.29,10085.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rellian Greenspyre|r
    .turnin 923 >>Turn in Tumors
    .accept 2498 >>Accept Return to Denalan
    .target Rellian Greenspyre
step
    .goto 1457/1,2504.02,9930.97
    >>Place Sentinel Owls at the entrance to the Cenarion Hold depths, the Darnassus Bank, the Craftsman's Terrace Inn, and the City Gate for Sentinel Dalia Sunblade in the Temple of the Moon in Darnassus.
    .complete 98067,2 --Credit
    .target Credit
step
    .goto 1457/1,2511.33,9612.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lariia|r
    .turnin 98046 >>Turn in Crown of the Earth
    .accept 98065 >>Accept Crown of the Earth
    .target Lariia
step
    .goto 1457/1,2518.73,9606.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Dalia Sunblade|r
    .turnin 98067 >>Turn in Eyes of the Sentinels
    .target Sentinel Dalia Sunblade
step
    .goto 1457/1,2550.48,9631.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess A'moora|r
    .turnin 2519 >>Turn in The Temple of the Moon
    .turnin 2518 >>Turn in Tears of the Moon
    .target Priestess A'moora
step << Hunter/Warrior/Priest/Sod Rogue
    .goto 1457/1,2329.19,9908.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ilyenia Moonfire|r
    .train 227 >>Train Staves << Hunter/Warrior/Priest
    .train 265 >>Train Bows << Sod Rogue
    >>If you have a Staff in your bags, equip it << Hunter
    >>If you have a Bow in your bags, equip it << Rogue
    .target Ilyenia Moonfire
step << Hunter
    .goto 1457/1,2316.49,9924.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ariyell Skyshadow|r
    .vendor >>|cRXP_BUY_Buy|r |T132382:0|t[Sharp Arrows]
    .target Ariyell Skyshadow
step
    .goto 1457/1,2524.55,9662.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tyrande Whisperwind|r
    .turnin 98065 >>Turn in Crown of the Earth
    .target Tyrande Whisperwind
step << NightElf Priest
    .goto 1457/1,2520.11,9665.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Alathea|r
    >>|cRXP_WARN_The database has no objectives for Stars of Elune. Skip this step if the quest is not finished|r
    .turnin 5627 >>Turn in Stars of Elune
    .target Priestess Alathea
    .isOnQuest 5627
step
    #completewith next
    .zone 1438 >>Leave Darnassus for Teldrassil
    .zoneskip 1438
step
    .goto 1438/1,1186.77,10320.69
    >>Kill |cRXP_ENEMY_Xethorr the Wicked|r and loot |cRXP_LOOT_Mature Fel Moss|r
    .complete 98403,2 --Mature Fel Moss (1)
    .mob Xethorr the Wicked
step << Dwarf Priest
    .goto 1438/1,985.65,9905.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Laurna Morninglight|r
    .accept 5636 >>Accept Desperate Prayer
    .target Laurna Morninglight
step
    .goto 1438/1,985.14,9898.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tallonkai Swiftroot|r
    .turnin 98403 >>Turn in Twisted Hatred
    .target Tallonkai Swiftroot
step
    .goto 1438/1,965.29,9887.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Athridas Bearmantle|r
    .turnin 483 >>Turn in The Relics of Wakening
    .accept 486 >>Accept Ursal the Mauler
    .target Athridas Bearmantle
step
    .goto 1438/1,963.25,9811.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Kyra Starsong|r
    .turnin 99053 >>Turn in Escaping Ban'ethil
    .target Sentinel Kyra Starsong
step
    .goto 1438/1,713.76,9506.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Denalan|r
    .turnin 2498 >>Turn in Return to Denalan
    .accept 2499 >>Accept Oakenscowl
    .target Denalan
step
    .goto 1438/1,1077.30,9281.87
    >>Kill |cRXP_ENEMY_Oakenscowl|r and loot |cRXP_LOOT_Gargantuan Tumor|r
    .complete 2499,1 --Gargantuan Tumor (1)
    .mob Oakenscowl
step
    .goto 1438/1,1837.49,9122.70
    >>Kill |cRXP_ENEMY_Ursal the Mauler|r
    .complete 486,1 --Ursal the Mauler slain (1)
    .mob Ursal the Mauler
step
    #completewith next
    .hs >>Hearth to Innkeeper Keldamyr's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1438/1,965.29,9887.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Athridas Bearmantle|r
    .turnin 486 >>Turn in Ursal the Mauler
    .target Athridas Bearmantle
step
    .goto 1438/1,985.14,9898.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tallonkai Swiftroot|r
    .turnin 2459 >>Turn in Ferocitas the Dream Eater
    .target Tallonkai Swiftroot
    .isQuestComplete 2459
step
    .goto 1438/1,713.76,9506.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Denalan|r
    .turnin 2499 >>Turn in Oakenscowl
    .target Denalan
step << NightElf
    .goto 1438/1,950.01,8694.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nessa Shadowsong|r
    .turnin 6344 >>Turn in Nessa Shadowsong
    .accept 6341 >>Accept The Bounty of Teldrassil
    .target Nessa Shadowsong
step << NightElf
    .goto 1438/1,950.01,8694.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nessa Shadowsong|r
    .turnin 6343 >>Turn in Return to Nessa
    .target Nessa Shadowsong
    .isOnQuest 6343
step << NightElf
    .goto 1438/1,841.05,8640.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vesprystus|r
    .turnin 6341 >>Turn in The Bounty of Teldrassil
    .accept 6342 >>Accept Flight to Auberdine
    .target Vesprystus
step << Druid NightElf
    .goto 1457/1,2563.98,10179.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mathrengyl Bearwalker|r
    .trainer >> Train your class spells
    .target Mathrengyl Bearwalker
    .isOnQuest 6001
step << Druid
    .goto 1457/1,2563.98,10179.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mathrengyl Bearwalker|r
    .trainer >> Train your class spells
    .target Mathrengyl Bearwalker
step << Dwarf Hunter/Human Hunter/Skyborne Hunter
    .goto 1438/1,841.56,8640.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vesprystus|r
    .fp Teldrassil >> Get the Teldrassil Flight Path
    .target Vesprystus
step << Dwarf Hunter/Human Hunter/Skyborne Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ilyenia Moonfire|r
    .goto 1457/1,2329.19,9908.60
    .train 264 >> Train Bows
    .train 227 >> Train Staves
    .target Ilyenia Moonfire
step << !Warlock !NightElf
    .goto 1438/1,841.56,8640.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vesprystus|r
    .fp Teldrassil >> Get the Rut'theran Village Flight Path
    .target Vesprystus
step << NightElf Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ilyenia Moonfire|r
    .goto 1457/1,2329.19,9908.60
    .train 2567 >> Train Thrown
    .target Ilyenia Moonfire
step << NightElf Druid
    #completewith next
    .zone 1457 >>Travel to Darnassus
    .zoneskip 1457
    .isOnQuest 6125
step << NightElf Druid
    .goto 1457/1,2564.03,10179.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mathrengyl Bearwalker|r
    .turnin 6125 >>Turn in Power over Poison
    .target Mathrengyl Bearwalker
    .isOnQuest 6125
step << Druid
    .goto 1457/1,2563.98,10179.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mathrengyl Bearwalker|r
    .trainer >> Train your class spells
    .target Mathrengyl Bearwalker
    .isOnQuest 6125
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Arias'ta Bladesinger|r
    .goto 1457/1,2316.91,9991.88
    .trainer >> Train your class spells
    .target Arias'ta Bladesinger
step << Rogue
    >>Enter the Cenarion Enclave
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Syurna|r
    .goto 1457/1,2601.39,10120.53,30,0
    .goto 1457/1,2546.78,10083.62
    .trainer >> Train your class spells
    .target Syurna
step << Hunter
    .goto 1457/1,2511.04,10178.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jocaste|r
    .trainer >> Train your class spells
    .target Jocaste
step << Priest
    .goto 1457/1,2537.25,9654.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jandria|r
    .trainer >> Train your class spells
    .target Jandria
step << Warlock
    .goto 1438/1,841.56,8640.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vesprystus|r
    .fp Teldrassil >> Get the Ruth'theran Village Flight Path
    .fly Ashenvale >> Fly to Ashenvale
    .target Vesprystus
    .zoneskip Ashenvale
step
    +|cRXP_WARN_That is all of Teldrassil for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Darkshore|r: Flight to Auberdine << NightElf
    >>|cRXP_FRIENDLY_Moonglade|r: Moonglade << NightElf Druid
    >>|cRXP_FRIENDLY_Stormwind City|r: Desperate Prayer << Dwarf Priest
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Ferocitas the Dream Eater
    >>|cRXP_FRIENDLY_Darkshore and back here|r: The Shade of Elura << Warrior
step
    .xp 15 >>|cRXP_WARN_The rest of Teldrassil is planned from level 15.|r Come back to this guide then
step << NightElf Druid/Skyborne Druid
    #completewith next
    .zone 1457 >>Travel to Darnassus
    .zoneskip 1457
step << NightElf Druid/Skyborne Druid
    .goto 1457/1,2564.03,10179.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mathrengyl Bearwalker|r
    .accept 6121 >>Accept Lessons Anew
    .target Mathrengyl Bearwalker
step << NightElf Druid/Skyborne Druid
    #completewith next
    .zone 1438 >>Leave Darnassus for Teldrassil
    .zoneskip 1438
step
    .goto 1438/1,282.49,10018.65
    >>Kill |cRXP_ENEMY_Ferocitas the Dream Eater|r and loot |cRXP_LOOT_Gnarlpine Necklace|r
    .collect 8049,1,2459,1 --Gnarlpine Necklace (1)
    .mob Ferocitas the Dream Eater
    .isOnQuest 2459
step
    #loop
    .goto 1438/1,283.00,10025.44,0
    .goto 1438/1,283.00,10025.44,40,0
    .goto 1438/1,264.67,10036.30,40,0
    .goto 1438/1,308.97,10054.62,40,0
    .goto 1438/1,328.83,10076.34,40,0
    .goto 1438/1,338.50,10060.39,40,0
    .goto 1438/1,269.77,9953.83,40,0
    >>Kill |cRXP_ENEMY_Gnarlpine Mystics|r
    .complete 2459,1 --Gnarlpine Mystic slain (7)
    .mob Gnarlpine Mystic
    .isOnQuest 2459
step
    .goto 1438/1,985.14,9898.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tallonkai Swiftroot|r
    .turnin 2459 >>Turn in Ferocitas the Dream Eater
    .target Tallonkai Swiftroot
    .isQuestComplete 2459
step
    #completewith next
    .zone 1457 >>Travel to Darnassus
    .zoneskip 1457
step << Warrior
    .goto 1457/1,2331.94,9994.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elanaria|r
    .turnin 1686 >>Turn in The Shade of Elura
    .target Elanaria
    .isQuestComplete 1686
step << NightElf Priest
    .goto 1457/1,2520.11,9665.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Priestess Alathea|r
    .turnin 5627 >>Turn in Stars of Elune
    .target Priestess Alathea
    .isOnQuest 5627
step
    .goto 1457/1,2607.74,9641.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Archaeologist Greywhisker|r
    .accept 730 >>Accept Trouble In Darkshore?
    .target Chief Archaeologist Greywhisker
step
    +|cRXP_WARN_End of the Teldrassil route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Darkshore|r: Trouble In Darkshore?
    >>|cRXP_FRIENDLY_Moonglade|r: Lessons Anew << NightElf Druid/Skyborne Druid
]])
