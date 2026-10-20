-- 30-42 Arathi Highlands: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 5 parts (from level 30, 33, 36, 39, 42).
-- Split into 5 guides, listed under "30 - 43 Arathi Highlands" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Arathi Highlands.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 30 - 43 Arathi Highlands
#subweight -30
#name 30-31 Arathi Highlands
--RouteBuilder:next
#next Zone Routes (Alliance)\30-31 Wetlands

step
    .goto 1417/0,-1675.23,-714.37
    >>Click the |cRXP_PICK_Messenger Bag|r
    .turnin 79975 >>Turn in Eagle's Fist
    .isOnQuest 79975
step
    .goto 1417/0,-1675.23,-714.37
    >>Click the |cRXP_PICK_Messenger Bag|r
    .accept 79976 >>Accept This Must Be The Place
step
    .goto 1417/0,-1674.87,-714.37
    >>Click the |cRXP_PICK_Hastily Rolled-Up Satchel|r
    .turnin 79976 >>Turn in This Must Be The Place
step
    .goto 1417/0,-2028.75,-2086.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shakes O'Breen|r
    .turnin 670 >>Turn in Sunken Treasure
    .target Shakes O'Breen
    .isOnQuest 670
step
    .goto 1417/0,-2423.31,-2356.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Foggy MacKreel|r
    .accept 647 >>Accept MacKreel's Moonshine
    .target Foggy MacKreel
step
    .goto 1417/0,-2516.55,-1274.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Nials|r
    .turnin 634 >>Turn in Plea To The Alliance
    .target Captain Nials
    .isOnQuest 634
step
    .goto 1417/0,-2546.07,-1261.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Skuerto|r
    .turnin 690 >>Turn in Malin's Request
    .target Skuerto
    .isOnQuest 690
step << Hunter
    .goto 1417/0,-2364.27,-1280.53,0
    .goto 1417/0,-2371.47,-1539.73,0
    .goto 1417/0,-2630.67,-1338.13,0
    .goto 1417/0,-2364.27,-1280.53,40,0
    .goto 1417/0,-2371.47,-1539.73,40,0
    .goto 1417/0,-2630.67,-1338.13,40,0
    .goto 1417/0,-2594.67,-1539.73
    >>|cRXP_WARN_Cast|r |T132172:0|t[Eagle Eye] |cRXP_WARN_to try and find a |cRXP_ENEMY_Plains Creeper|r. Some of their locations are marked on your map|r
    >>|cRXP_WARN_Cast|r |T132164:0|t[Tame Beast] |cRXP_WARN_on a |cRXP_ENEMY_Plains Creeper|r to tame it|r
    .train 17265 >>|cRXP_WARN_Attack mobs with it to learn|r |T132278:0|t[Bite (Rank 5)]
step << Mage
    .goto 1417/0,-2512.95,-1239.73
    .fp Refuge Pointe >> Get the Refuge Pointe flight path
step
    .goto 1417/0,-3033.15,-1425.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quae|r
    .turnin 659 >>Turn in Hints of a New Plague?
    .target Quae
    .isOnQuest 659
step << Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Targot Jinglepocket|r
    .goto 1417/0,-2537.07,-1227.73
    .vendor >> |cRXP_BUY_Buy up to a stack of|r |T133969:0|t[Wild Hog Shank] |cRXP_BUY_to serve as pet food|r
    .target Targot Jinglepocket
step << Shaman
    .goto 1417/0,-3020.91,-795.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veyric Thunderhame|r
    .turnin 94789 >>Turn in Call of Air
    .target Veyric Thunderhame
    .isOnQuest 94789
step
    +|cRXP_WARN_That is all of Arathi Highlands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Hillsbrad Foothills|r: MacKreel's Moonshine
step
    +|cRXP_WARN_Suggested next zones at level 30|r: |cRXP_FRIENDLY_Wetlands|r (about 0.5 levels of quests). Completing this step loads the guide for Wetlands --RouteBuilder:next
step
    +|cRXP_WARN_The rest of Arathi Highlands is planned from level 33.|r Load its guide for level 33 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 30 - 43 Arathi Highlands
#subweight -30
#name 33-34 Arathi Highlands: around Alliance Brigadier General

step
    .goto 1417/0,-3516.27,-1698.13
    >>Click the |cRXP_PICK_Scrolls|r
    .accept 79949 >>Accept A Web of Lies: Debunking Myths and Legends
step
    .goto 1417/0,-3516.27,-1698.13
    >>Open the |cRXP_PICK_Scrolls|r. Loot it for |cRXP_LOOT_A Web of Lies: Debunking Myths and Legends|r
    .complete 79949,1 --A Web of Lies: Debunking Myths and Legends (1)
step
    .goto 1417/0,-2516.55,-1274.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Nials|r
    .accept 681 >>Accept Northfold Manor
    .target Captain Nials
step
    .goto 1417/0,-3033.15,-1425.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quae|r
    .accept 658 >>Accept Hints of a New Plague?
    .target Quae
    .isQuestTurnedIn 659 --any of: Hints of a New Plague?
    .xp <30,1
step
    #completewith Drop635x1
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Witherbark Troll|r, |cRXP_ENEMY_Witherbark Shadowcaster|r, |cRXP_ENEMY_Witherbark Axe Thrower|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #label Drop635x1
    #loop
    .goto 1417/0,-2083.11,-871.81,0
    .goto 1417/0,-2083.11,-871.81,40,0
    .goto 1417/0,-1990.59,-744.85,40,0
    >>Kill |cRXP_ENEMY_Syndicate Highwaymans|r
    >>Kill |cRXP_ENEMY_Syndicate Mercenaries|r
    .complete 681,1 --Syndicate Highwayman slain (8)
    .complete 681,2 --Syndicate Mercenary slain (6)
    .mob Syndicate Highwayman
    .mob Syndicate Mercenary
step
    .goto 1417/0,-2516.55,-1274.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Nials|r
    .turnin 681 >>Turn in Northfold Manor
    .target Captain Nials
step
    .goto 1417/0,-2529.87,-1279.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apprentice Kryten|r
    .accept 691 >>Accept Worth Its Weight in Gold
    .target Apprentice Kryten
step
    .goto 1417/0,-3116.67,-942.85
    >>Click the |cRXP_PICK_Shards of Myzrael|r
    .accept 642 >>Accept The Princess Trapped
step
    .goto 1417/0,-3524.91,-912.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Adegwa|r
    .target Innkeeper Adegwa
    .home >>Set your Hearthstone to Innkeeper Adegwa's inn
step
    #completewith Drop635x2
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Witherbark Troll|r, |cRXP_ENEMY_Witherbark Shadowcaster|r, |cRXP_ENEMY_Witherbark Axe Thrower|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #label Drop635x2
    #loop
    .goto 1417/0,-3815.43,-1025.65,0
    .goto 1417/0,-3815.43,-1025.65,40,0
    .goto 1417/0,-3934.23,-882.61,40,0
    >>Kill |cRXP_ENEMY_Drywhisker Kobolds|r, |cRXP_ENEMY_Drywhisker Surveyors|r and |cRXP_ENEMY_Drywhisker Diggers|r. Loot them for |cRXP_LOOT_Mote of Myzrael|r
    .complete 642,1 --Mote of Myzrael (12)
    .mob Drywhisker Kobold
    .mob Drywhisker Surveyor
    .mob Drywhisker Digger
step
    .goto 1417/0,-3901.83,-876.13
    >>Click the |cRXP_PICK_Iridescent Shards|r
    .turnin 642 >>Turn in The Princess Trapped
step
    #completewith Drop635x3
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Witherbark Troll|r, |cRXP_ENEMY_Witherbark Shadowcaster|r, |cRXP_ENEMY_Witherbark Axe Thrower|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #label Drop635x3
    #loop
    .goto 1417/0,-3196.95,-1852.69,0
    .goto 1417/0,-3196.95,-1852.69,40,0
    .goto 1417/0,-3350.31,-2021.65,40,0
    .goto 1417/0,-3297.75,-2065.57,40,0
    >>Kill |cRXP_ENEMY_Witherbark Trolls|r, |cRXP_ENEMY_Witherbark Shadowcasters|r, |cRXP_ENEMY_Witherbark Axe Throwers|r and |cRXP_ENEMY_Witherbark Witch Doctors|r. Loot them for |cRXP_LOOT_Witherbark Tusk|r
    >>Kill |cRXP_ENEMY_Witherbark Witch Doctors|r. Loot them for |cRXP_LOOT_Witherbark Medicine Pouch|r
    >>Kill |cRXP_ENEMY_Witherbark Shadow Hunter|r and loot |cRXP_LOOT_Shadow Hunter Knife|r
    .complete 691,1 --Witherbark Tusk (10)
    .complete 691,2 --Witherbark Medicine Pouch (4)
    .complete 691,3 --Shadow Hunter Knife (1)
    .mob Witherbark Troll
    .mob Witherbark Shadowcaster
    .mob Witherbark Axe Thrower
    .mob Witherbark Witch Doctor
    .mob Witherbark Shadow Hunter
step
    .goto 1417/0,-3116.67,-942.85
    >>Click the |cRXP_PICK_Shards of Myzrael|r
    .turnin 635 >>Turn in Crystal in the Mountains
    .isOnQuest 635
step << Shaman
    .goto 1417/0,-3020.91,-795.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veyric Thunderhame|r
    .accept 79358 >>Accept Storm, Earth, and Fire
    .accept 96135 >>Accept Heed My Call
    .accept 96264 >>Accept Elemental Aid
    .accept 96016 >>Accept The Tempest's Weapons
    .target Veyric Thunderhame
step << Shaman
    .goto 1417/0,-3020.91,-795.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veyric Thunderhame|r
    .turnin 96264 >>Turn in Elemental Aid
    .target Veyric Thunderhame
    .isQuestComplete 96264
step << Shaman
    .goto 1417/0,-3020.91,-795.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veyric Thunderhame|r
    .turnin 79358 >>Turn in Storm, Earth, and Fire
    .target Veyric Thunderhame
    .isQuestComplete 79358
step << Shaman
    .goto 1417/0,-3020.91,-795.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veyric Thunderhame|r
    .turnin 96135 >>Turn in Heed My Call
    .target Veyric Thunderhame
    .isQuestComplete 96135
step
    .goto 1417/0,-2529.87,-1279.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apprentice Kryten|r
    .turnin 691 >>Turn in Worth Its Weight in Gold
    .target Apprentice Kryten
step
    .goto 1417/0,-2510.07,-1231.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alliance Brigadier General|r
    .accept 98896 >>Accept Darkspear Islands Clash
    .accept 98895 >>Accept Darkspear Islands Clash
    .target Alliance Brigadier General
step
    .goto 1417/0,-2510.07,-1231.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alliance Brigadier General|r
    .turnin 98895 >>Turn in Darkspear Islands Clash
    .target Alliance Brigadier General
    .isQuestComplete 98895
step
    .goto 1417/0,-2510.07,-1231.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alliance Brigadier General|r
    .turnin 98896 >>Turn in Darkspear Islands Clash
    .target Alliance Brigadier General
    .isQuestComplete 98896
step
    .goto 1417/0,-2755.59,-1610.05
    >>Kill |cRXP_ENEMY_Forsaken Courier|r and loot |cRXP_LOOT_Sealed Folder|r
    .complete 658,1 --Sealed Folder (1)
    .mob Forsaken Courier
    .isOnQuest 658
step
    .goto 1417/0,-3033.15,-1425.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quae|r
    .turnin 658 >>Turn in Hints of a New Plague?
    .target Quae
    .isOnQuest 658
step
    .goto 1417/0,-3033.15,-1425.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quae|r
    .accept 657 >>Accept Hints of a New Plague?
    .target Quae
    .isQuestTurnedIn 658 --any of: Hints of a New Plague?
    .xp <30,1
step
    .goto 1417/0,-3035.31,-1427.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kinelory|r
    .turnin 657 >>Turn in Hints of a New Plague?
    .target Kinelory
    .isOnQuest 657
step << Mage
    .trainer >> Train your class spells
    >>Bank your cloth too if needed
step << Mage
    .vendor >> Buy up to 140 level 35 water
step << Mage
    .vendor >> Buy level 35 drink if needed
step
    +|cRXP_WARN_That is all of Arathi Highlands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Alterac Mountains|r: The Tempest's Weapons << Shaman
    >>|cRXP_FRIENDLY_Undercity|r: A Web of Lies: Debunking Myths and Legends
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Elemental Aid << Shaman
    >>|cRXP_FRIENDLY_Dustwallow Marsh, Swamp of Sorrows, Badlands, Desolace and back here|r: Storm, Earth, and Fire << Shaman
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Darkspear Islands Clash, Darkspear Islands Clash
    >>|cRXP_FRIENDLY_Thousand Needles and back here|r: Heed My Call << Shaman
step
    +|cRXP_WARN_The rest of Arathi Highlands is planned from level 36.|r Load its guide for level 36 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 30 - 43 Arathi Highlands
#subweight -30
#name 36-37 Arathi Highlands

step
    .goto 1417/0,-2510.07,-1231.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alliance Brigadier General|r
    .turnin 98896 >>Turn in Darkspear Islands Clash
    .target Alliance Brigadier General
    .isQuestComplete 98896
step
    .goto 1417/0,-2510.07,-1231.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alliance Brigadier General|r
    .turnin 98895 >>Turn in Darkspear Islands Clash
    .target Alliance Brigadier General
    .isQuestComplete 98895
step << Shaman
    .goto 1417/0,-3020.91,-795.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veyric Thunderhame|r
    .turnin 96135 >>Turn in Heed My Call
    .target Veyric Thunderhame
    .isQuestComplete 96135
step << Shaman
    .goto 1417/0,-3020.91,-795.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veyric Thunderhame|r
    .turnin 79358 >>Turn in Storm, Earth, and Fire
    .target Veyric Thunderhame
    .isQuestComplete 79358
step << Shaman
    .goto 1417/0,-3020.91,-795.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veyric Thunderhame|r
    .turnin 96264 >>Turn in Elemental Aid
    .target Veyric Thunderhame
    .isQuestComplete 96264
step
    .goto 1417/0,-3901.83,-876.13
    >>Click the |cRXP_PICK_Iridescent Shards|r
    .accept 651 >>Accept Stones of Binding
    .isQuestTurnedIn 642 --any of: The Princess Trapped
step
    .goto 1417/0,-3267.87,-846.61
    >>Open the |cRXP_PICK_Stone of East Binding|r. Loot it for |cRXP_LOOT_Cresting Key|r
    .complete 651,2 --Cresting Key (1)
    .isOnQuest 651
step
    .goto 1417/0,-3035.31,-1427.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kinelory|r
    .accept 660 >>Accept Hints of a New Plague?
    .target Kinelory
    .isQuestTurnedIn 657 --any of: Hints of a New Plague?
    .xp <30,1
step
    .goto 1417/0,-3030.27,-1425.25
    >>Protect Kinelory
    .complete 660,1 --Protect Kinelory
    .isOnQuest 660
step
    .goto 1417/0,-3033.15,-1425.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quae|r
    .turnin 660 >>Turn in Hints of a New Plague?
    .target Quae
    .isOnQuest 660
step
    .goto 1417/0,-3033.15,-1425.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quae|r
    .accept 661 >>Accept Hints of a New Plague?
    .target Quae
    .isQuestTurnedIn 660 --any of: Hints of a New Plague?
    .xp <30,1
step
    .goto 1417/0,-2740.11,-1350.85
    >>Open the |cRXP_PICK_Stone of Outer Binding|r. Loot it for |cRXP_LOOT_Thundering Key|r
    .complete 651,3 --Thundering Key (1)
    .isOnQuest 651
step
    .goto 1417/0,-2516.55,-1274.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Nials|r
    .accept 682 >>Accept Stromgarde Badges
    .target Captain Nials
    .isQuestTurnedIn 681 --any of: Northfold Manor
step
    .goto 1417/0,-1783.23,-855.97
    >>Open the |cRXP_PICK_Stone of West Binding|r. Loot it for |cRXP_LOOT_Burning Key|r
    .complete 651,1 --Burning Key (1)
    .isOnQuest 651
step
    #loop
    .goto 1417/0,-1919.67,-1645.81,0
    .goto 1417/0,-1919.67,-1645.81,40,0
    .goto 1417/0,-1803.39,-1663.57,40,0
    >>Kill |cRXP_ENEMY_Syndicate Prowlers|r, |cRXP_ENEMY_Syndicate Conjurors|r and |cRXP_ENEMY_Syndicate Magus|r. Loot them for |cRXP_LOOT_Stromgarde Badge|r
    .complete 682,1 --Stromgarde Badge (7)
    .mob Syndicate Prowler
    .mob Syndicate Conjuror
    .mob Syndicate Magus
    .isOnQuest 682
step
    .goto 1417/0,-2170.95,-1510.45
    >>Click the |cRXP_PICK_Stone of Inner Binding|r
    .turnin 651 >>Turn in Stones of Binding
    .isOnQuest 651
step
    .goto 1417/0,-2516.55,-1274.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Nials|r
    .turnin 682 >>Turn in Stromgarde Badges
    .target Captain Nials
    .isOnQuest 682
step
    .goto 1417/0,-2010.75,-2117.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lolo the Lookout|r
    .accept 663 >>Accept Land Ho!
    .target Lolo the Lookout
step
    .goto 1417/0,-2028.75,-2086.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shakes O'Breen|r
    .turnin 663 >>Turn in Land Ho!
    .target Shakes O'Breen
step
    +|cRXP_WARN_That is all of Arathi Highlands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Hillsbrad Foothills|r: Hints of a New Plague?
step
    +|cRXP_WARN_The rest of Arathi Highlands is planned from level 39.|r Load its guide for level 39 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 30 - 43 Arathi Highlands
#subweight -30
#name 39-40 Arathi Highlands: around Skuerto

step
    .goto 1417/0,-2510.07,-1231.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alliance Brigadier General|r
    .turnin 98896 >>Turn in Darkspear Islands Clash
    .target Alliance Brigadier General
    .isQuestComplete 98896
step
    .goto 1417/0,-2510.07,-1231.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alliance Brigadier General|r
    .turnin 98895 >>Turn in Darkspear Islands Clash
    .target Alliance Brigadier General
    .isQuestComplete 98895
step
    .goto 1417/0,-2546.07,-1261.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Skuerto|r
    .accept 693 >>Accept Wand over Fist
    .target Skuerto
    .isQuestTurnedIn 691 --any of: Worth Its Weight in Gold
step
    .goto 1417/0,-2837.67,-2098.21
    >>Kill |cRXP_ENEMY_Kor'gresh Coldrage|r and loot |cRXP_LOOT_Trelane's Wand of Invocation|r
    .complete 693,1 --Trelane's Wand of Invocation (1)
    .mob Kor'gresh Coldrage
    .isOnQuest 693
step << NightElf
    .train 431663,1 << Priest
    .train 416031,1 << Paladin
    .train 401752,1 << Mage
    .train 410118,1 << Hunter
    .train 410029,1 << Druid
    .train 403467,1 << Warrior
    .train 426452,1 << Warlock
    .train 425102,1 << Rogue
    .train 425883,1 << Shaman
    .goto 1417/0,-4247.07,-1849.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Illari Duskfeather|r to receive |cRXP_LOOT_Illari's Key|r
    .collect 212347,1,79242,1
    .skipgossip 215655,1,1,2
    .target Illari Duskfeather
    .isOnQuest 79242
step << !NightElf
    .train 431663,1 << Priest
    .train 416031,1 << Paladin
    .train 401752,1 << Mage
    .train 410118,1 << Hunter
    .train 410029,1 << Druid
    .train 403467,1 << Warrior
    .train 426452,1 << Warlock
    .train 425102,1 << Rogue
    .train 425883,1 << Shaman
    .goto 1417/0,-4247.07,-1849.09
    >>Kill |cRXP_ENEMY_Illari Duskfeather|r. Open the |cRXP_PICK_Dropped Pouch|r she drops on the ground. Loot it for |cRXP_LOOT_Illari's Key|r
    .collect 212347,1,79242,1
    .skipgossip 215655,1,1,1
    .isOnQuest 79242
step << !NightElf
    .train 431663,1 << Priest
    .train 416031,1 << Paladin
    .train 401752,1 << Mage
    .train 410118,1 << Hunter
    .train 410029,1 << Druid
    .train 403467,1 << Warrior
    .train 426452,1 << Warlock
    .train 425102,1 << Rogue
    .train 425883,1 << Shaman
    .goto 1417/0,-4247.07,-1849.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Illari Duskfeather|r
    .skipgossip
    .target Illari Duskfeather
    .isOnQuest 79242
step
    .train 431663,1 << Priest
    .train 416031,1 << Paladin
    .train 401752,1 << Mage
    .train 410118,1 << Hunter
    .train 410029,1 << Druid
    .train 403467,1 << Warrior
    .train 426452,1 << Warlock
    .train 425102,1 << Rogue
    .train 425883,1 << Shaman
    >>Click |cRXP_PICK_Illari's Loot Cache|r on the ground
    .goto 1417/0,-4256.21,-1795.72
    .isOnQuest 79242
step
    .train 431663,1 << Priest
    .train 416031,1 << Paladin
    .train 401752,1 << Mage
    .train 410118,1 << Hunter
    .train 410029,1 << Druid
    .train 403467,1 << Warrior
    .train 426452,1 << Warlock
    .train 425102,1 << Rogue
    .train 425883,1 << Shaman
    >>Open the |T133876:0|t[|cRXP_LOOT_Jewel-Encrusted Box|r] for the |T135791:0|t[|cRXP_FRIENDLY_Psychosophic Epiphany|r] << Priest
    >>Open the |T133876:0|t[|cRXP_LOOT_Jewel-Encrusted Box|r] for the |T134419:0|t[|cRXP_FRIENDLY_Rune of Warfare|r] << Paladin
    >>Open the |T133876:0|t[|cRXP_LOOT_Jewel-Encrusted Box|r] for the |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: Brain Freeze|r] << Mage
    >>Open the |T133876:0|t[|cRXP_LOOT_Jewel-Encrusted Box|r] for the |T134419:0|t[|cRXP_FRIENDLY_Rune of the Trapper|r] << Hunter
    >>Open the |T133876:0|t[|cRXP_LOOT_Jewel-Encrusted Box|r] for the |T134419:0|t[|cRXP_FRIENDLY_Rune of Eclipse|r] << Druid
    >>Open the |T133876:0|t[|cRXP_LOOT_Jewel-Encrusted Box|r] for the |T134419:0|t[|cRXP_FRIENDLY_Rune of Healing Rage|r] << Warrior
    >>Open the |T133876:0|t[|cRXP_LOOT_Jewel-Encrusted Box|r] for the |T134419:0|t[|cRXP_FRIENDLY_Rune of Burning Darkness|r] << Warlock
    >>Open the |T133876:0|t[|cRXP_LOOT_Jewel-Encrusted Box|r] for the |T134419:0|t[|cRXP_FRIENDLY_Rune of Poisoned Blade|r] << Rogue
    >>Open the |T133876:0|t[|cRXP_LOOT_Jewel-Encrusted Box|r] for the |T134419:0|t[|cRXP_FRIENDLY_Rune of Ancestral Awakening|r] << Shaman
    .collect 212552,1 << Priest
    .collect 212551,1 << Paladin
    .collect 208853,1 << Mage
    .collect 212549,1 << Hunter
    .collect 212548,1 << Druid
    .collect 212562,1 << Warrior
    .collect 212561,1 << Warlock
    .collect 212559,1 << Rogue
    .collect 212560,1 << Shaman
    .isQuestTurnedIn 79242
step
    .train 431663 >>|cRXP_WARN_Use the|r |T135791:0|t[|cRXP_FRIENDLY_Psychosophic Epiphany|r] |cRXP_WARN_to train|r |T136181:0|t[Mind Spike] << Priest
    .train 416031 >>|cRXP_WARN_Use the|r |T134419:0|t[|cRXP_FRIENDLY_Rune of Warfare|r] |cRXP_WARN_to train|r |T236246:0|t[The Art of War] << Paladin
    .train 401752 >>|cRXP_WARN_Use the|r |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: Brain Freeze|r] |cRXP_WARN_to train|r |T236206:0|t[Brain Freeze] << Mage
    .train 410118 >>|cRXP_WARN_Use the|r |T134419:0|t[|cRXP_FRIENDLY_Rune of the Trapper|r] |cRXP_WARN_to train|r |T133882:0|t[Trap Launcher] << Hunter
    .train 410029 >>|cRXP_WARN_Use the|r |T134419:0|t[|cRXP_FRIENDLY_Rune of Eclipse|r] |cRXP_WARN_to train|r |T236151:0|t[Eclipse] << Druid
    .train 403467 >>|cRXP_WARN_Use the|r |T134419:0|t[|cRXP_FRIENDLY_Rune of Healing Rage|r] |cRXP_WARN_to train|r |T132345:0|t[Enraged Regeneration] << Warrior
    .train 426452 >>|cRXP_WARN_Use the|r |T134419:0|t[|cRXP_FRIENDLY_Rune of Burning Darkness|r] |cRXP_WARN_to train|r |T135823:0|t[Shadow and Flame] << Warlock
    .train 425102 >>|cRXP_WARN_Use the|r |T134419:0|t[|cRXP_FRIENDLY_Rune of Poisoned Blade|r] |cRXP_WARN_to train|r |T236270:0|t[Poisoned Knife] << Rogue
    .train 425883 >>|cRXP_WARN_Use the|r |T134419:0|t[|cRXP_FRIENDLY_Rune of Ancestral Awakening|r] |cRXP_WARN_to train|r |T237571:0|t[Ancestral Awakening] << Shaman
    .isQuestTurnedIn 79242
step
    .goto 1417/0,-2546.07,-1261.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Skuerto|r
    .turnin 693 >>Turn in Wand over Fist
    .target Skuerto
    .isOnQuest 693
step
    .goto 1417/0,-2546.07,-1261.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Skuerto|r
    .accept 694 >>Accept Trelane's Defenses
    .target Skuerto
    .isQuestTurnedIn 693 --any of: Wand over Fist
step
    .goto 1417/0,-2524.11,-1279.57
    >>Click the |cRXP_PICK_Wanted Board|r
    .accept 684 >>Accept Wanted!  Marez Cowl
    .accept 685 >>Accept Wanted!  Otto and Falconcrest
step
    #loop
    .goto 1417/0,-1932.99,-1644.61,0
    .goto 1417/0,-1932.99,-1644.61,40,0
    .goto 1417/0,-1810.59,-1706.53,40,0
    >>Kill |cRXP_ENEMY_Otto|r and loot |cRXP_LOOT_Otto's Head|r
    >>Kill |cRXP_ENEMY_Lord Falconcrest|r and loot |cRXP_LOOT_Falconcrest's Head|r
    >>Kill |cRXP_ENEMY_Marez Cowl|r and loot |cRXP_LOOT_Marez's Head|r
    .complete 685,1 --Otto's Head (1)
    .complete 685,2 --Falconcrest's Head (1)
    .complete 684,1 --Marez's Head (1)
    .mob Otto
    .mob Lord Falconcrest
    .mob Marez Cowl
step
    #loop
    .goto 1417/0,-1619.79,-1751.89,0
    .goto 1417/0,-1619.79,-1751.89,40,0
    .goto 1417/0,-1518.27,-1774.45,40,0
    >>Kill |cRXP_ENEMY_Boulderfist Shaman|r and loot |cRXP_LOOT_Azure Agate|r
    .complete 694,1 --Azure Agate (1)
    .mob Boulderfist Shaman
    .isOnQuest 694
step
    .goto 1417/0,-2047.47,-2088.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_First Mate Nilzlix|r
    .accept 662 >>Accept Deep Sea Salvage
    .target First Mate Nilzlix
    .isQuestTurnedIn 663 --any of: Land Ho!
step
    .goto 1417/0,-2090.67,-2072.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Steelgut|r
    .accept 664 >>Accept Drowned Sorrows
    .target Captain Steelgut
    .isQuestTurnedIn 663 --any of: Land Ho!
step
    .goto 1417/0,-2085.99,-2066.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Professor Phizzlethorpe|r
    .accept 665 >>Accept Sunken Treasure
    .target Professor Phizzlethorpe
    .isQuestTurnedIn 663 --any of: Land Ho!
step
    .goto 1417/0,-2085.99,-2067.73
    >>Defend Professor Phizzlethorpe
    .complete 665,1 --Defend Professor Phizzlethorpe
    .isOnQuest 665
step
    .goto 1417/0,-2085.63,-2064.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doctor Draxlegauge|r
    .turnin 665 >>Turn in Sunken Treasure
    .target Doctor Draxlegauge
    .isOnQuest 665
step
    .goto 1417/0,-2085.63,-2064.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doctor Draxlegauge|r
    .accept 666 >>Accept Sunken Treasure
    .target Doctor Draxlegauge
    .isQuestTurnedIn 665 --any of: Sunken Treasure
step
    .goto 1417/0,-1708.71,-2175.49
    >>Pick up |cRXP_PICK_Maiden's Folly Log|r from the ground
    .complete 662,2 --Maiden's Folly Log (1)
    .isOnQuest 662
step
    .goto 1417/0,-1696.47,-2161.57
    >>Pick up |cRXP_PICK_Maiden's Folly Charts|r from the ground
    .complete 662,1 --Maiden's Folly Charts (1)
    .isOnQuest 662
step
    .goto 1417/0,-1603.23,-2187.97
    >>Pick up |cRXP_PICK_Spirit of Silverpine Charts|r from the ground
    .complete 662,3 --Spirit of Silverpine Charts (1)
    .isOnQuest 662
step
    .goto 1417/0,-1610.07,-2175.73
    >>Pick up |cRXP_PICK_Spirit of Silverpine Log|r from the ground
    .complete 662,4 --Spirit of Silverpine Log (1)
    .isOnQuest 662
step
    #loop
    .goto 1417/0,-1608.99,-2181.97,0
    .goto 1417/0,-1608.99,-2181.97,40,0
    .goto 1417/0,-1679.19,-2219.17,40,0
    .goto 1417/0,-1768.47,-2285.17,40,0
    >>Kill |cRXP_ENEMY_Daggerspine Raiders|r
    .complete 664,1 --Daggerspine Raider slain (10)
    .mob Daggerspine Raider
    .isOnQuest 664
step
    #loop
    .goto 1417/0,-1685.31,-2164.45,0
    .goto 1417/0,-1685.31,-2164.45,40,0
    .goto 1417/0,-1606.47,-2168.53,40,0
    >>Kill |cRXP_ENEMY_Daggerspine Sorceress|r
    .complete 664,2 --Daggerspine Sorceress slain (3)
    .mob Daggerspine Sorceress
    .isOnQuest 664
step
    #loop
    .goto 1417/0,-1658.67,-2149.33,0
    .goto 1417/0,-1658.67,-2149.33,40,0
    .goto 1417/0,-1730.67,-2245.33,40,0
    .goto 1417/0,-1550.67,-2293.33,40,0
    >>Loot the |cRXP_PICK_Calcified Elven Gems|r for |cRXP_LOOT_Elven Gem|r
    .complete 666,1 --Elven Gem (10)
    .isOnQuest 666
step
    .goto 1417/0,-2047.47,-2088.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_First Mate Nilzlix|r
    .turnin 662 >>Turn in Deep Sea Salvage
    .target First Mate Nilzlix
    .isOnQuest 662
step
    .goto 1417/0,-2090.67,-2072.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Steelgut|r
    .turnin 664 >>Turn in Drowned Sorrows
    .target Captain Steelgut
    .isOnQuest 664
step
    .goto 1417/0,-2085.63,-2064.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doctor Draxlegauge|r
    .turnin 666 >>Turn in Sunken Treasure
    .target Doctor Draxlegauge
    .isOnQuest 666
step
    .goto 1417/0,-2085.63,-2064.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doctor Draxlegauge|r
    .accept 668 >>Accept Sunken Treasure
    .target Doctor Draxlegauge
    .isQuestTurnedIn 666 --any of: Sunken Treasure
step
    .goto 1417/0,-2028.75,-2086.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shakes O'Breen|r
    .turnin 668 >>Turn in Sunken Treasure
    .target Shakes O'Breen
    .isOnQuest 668
step
    .goto 1417/0,-2028.75,-2086.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shakes O'Breen|r
    .accept 669 >>Accept Sunken Treasure
    .target Shakes O'Breen
    .isQuestTurnedIn 668 --any of: Sunken Treasure
step
    .goto 1417/0,-2516.55,-1274.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Nials|r
    .turnin 684 >>Turn in Wanted!  Marez Cowl
    .turnin 685 >>Turn in Wanted!  Otto and Falconcrest
    .target Captain Nials
step
    .goto 1417/0,-2529.87,-1279.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apprentice Kryten|r
    .turnin 694 >>Turn in Trelane's Defenses
    .target Apprentice Kryten
    .isOnQuest 694
step
    .goto 1417/0,-2529.87,-1279.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apprentice Kryten|r
    .accept 695 >>Accept An Apprentice's Enchantment
    .target Apprentice Kryten
    .isQuestTurnedIn 694 --any of: Trelane's Defenses
step
    .goto 1417/0,-2546.07,-1261.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Skuerto|r
    .turnin 695 >>Turn in An Apprentice's Enchantment
    .target Skuerto
    .isOnQuest 695
step
    .goto 1417/0,-2546.07,-1261.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Skuerto|r
    .accept 696 >>Accept Attack on the Tower
    .target Skuerto
    .isQuestTurnedIn 695 --any of: An Apprentice's Enchantment
step
    .goto 1417/0,-1515.75,-1762.21
    >>Open the |cRXP_PICK_Trelane's Lockbox|r. Loot it for |cRXP_LOOT_Trelane's Ember Agate|r
    .complete 696,3 --Trelane's Ember Agate (1)
    .isOnQuest 696
step
    .goto 1417/0,-1521.15,-1768.69
    >>Open the |cRXP_PICK_Trelane's Footlocker|r. Loot it for |cRXP_LOOT_Trelane's Phylactery|r
    .complete 696,1 --Trelane's Phylactery (1)
    .isOnQuest 696
step
    .goto 1417/0,-1520.79,-1792.93
    >>Open the |cRXP_PICK_Trelane's Chest|r. Loot it for |cRXP_LOOT_Trelane's Orb|r
    .complete 696,2 --Trelane's Orb (1)
    .isOnQuest 696
step
    .goto 1417/0,-2546.07,-1261.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Skuerto|r
    .turnin 696 >>Turn in Attack on the Tower
    .target Skuerto
    .isOnQuest 696
step
    .goto 1417/0,-2546.07,-1261.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Skuerto|r
    .accept 697 >>Accept Malin's Request
    .target Skuerto
    .isQuestTurnedIn 696 --any of: Attack on the Tower
step << Shaman
    .goto 1417/0,-3020.91,-795.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veyric Thunderhame|r
    .turnin 96264 >>Turn in Elemental Aid
    .target Veyric Thunderhame
    .isQuestComplete 96264
step << Shaman
    .goto 1417/0,-3020.91,-795.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veyric Thunderhame|r
    .turnin 79358 >>Turn in Storm, Earth, and Fire
    .target Veyric Thunderhame
    .isQuestComplete 79358
step << Shaman
    .goto 1417/0,-3020.91,-795.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veyric Thunderhame|r
    .turnin 96135 >>Turn in Heed My Call
    .target Veyric Thunderhame
    .isQuestComplete 96135
step
    .goto 1417/0,-3524.91,-912.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Adegwa|r
    .target Innkeeper Adegwa
    .home >>Set your Hearthstone to Innkeeper Adegwa's inn
step
    +|cRXP_WARN_That is all of Arathi Highlands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Stormwind City|r: Malin's Request
    >>|cRXP_FRIENDLY_Stranglethorn Vale|r: Sunken Treasure
step
    +|cRXP_WARN_The rest of Arathi Highlands is planned from level 42.|r Load its guide for level 42 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 30 - 43 Arathi Highlands
#subweight -30
#name 42-43 Arathi Highlands

step
    .goto 1417/0,-2170.95,-1510.45
    >>Click the |cRXP_PICK_Stone of Inner Binding|r
    .accept 652 >>Accept Breaking the Keystone
    .isQuestTurnedIn 651 --any of: Stones of Binding
step
    .goto 1417/0,-2510.07,-1231.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alliance Brigadier General|r
    .turnin 98895 >>Turn in Darkspear Islands Clash
    .target Alliance Brigadier General
    .isQuestComplete 98895
step
    .goto 1417/0,-2510.07,-1231.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alliance Brigadier General|r
    .turnin 98896 >>Turn in Darkspear Islands Clash
    .target Alliance Brigadier General
    .isQuestComplete 98896
step << Shaman
    .goto 1417/0,-3020.91,-795.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veyric Thunderhame|r
    .turnin 96264 >>Turn in Elemental Aid
    .target Veyric Thunderhame
    .isQuestComplete 96264
step << Shaman
    .goto 1417/0,-3020.91,-795.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veyric Thunderhame|r
    .turnin 96135 >>Turn in Heed My Call
    .target Veyric Thunderhame
    .isQuestComplete 96135
step << Shaman
    .goto 1417/0,-3020.91,-795.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veyric Thunderhame|r
    .turnin 79358 >>Turn in Storm, Earth, and Fire
    .target Veyric Thunderhame
    .isQuestComplete 79358
step
    .goto 1417/0,-3167.07,-853.33
    >>Kill |cRXP_ENEMY_Fozruk|r and loot |cRXP_LOOT_Rod of Order|r
    .complete 652,1 --Rod of Order (1)
    .mob Fozruk
    .isOnQuest 652
step
    .goto 1417/0,-3550.11,-988.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zaruk|r
    .accept 687 >>Accept Theldurin the Lost
    .target Zaruk
    .isQuestTurnedIn 653,688 --any of: Myzrael's Allies, Myzrael's Allies
    .xp <30,1
step
    .goto 1417/0,-2165.55,-1527.49
    >>Click the |cRXP_PICK_Keystone|r
    .turnin 652 >>Turn in Breaking the Keystone
    .isOnQuest 652
step
    .goto 1417/0,-2165.55,-1527.49
    >>Click the |cRXP_PICK_Keystone|r
    .accept 653 >>Accept Myzrael's Allies
    .isQuestTurnedIn 652 --any of: Breaking the Keystone
step
    .goto 1417/0,-2028.75,-2086.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shakes O'Breen|r
    .accept 667 >>Accept Death From Below
    .target Shakes O'Breen
    .isQuestTurnedIn 670 --any of: Sunken Treasure
    .xp <35,1
step
    .goto 1417/0,-2016.15,-2097.01
    >>Defend Shakes O'Breen
    .complete 667,1 --Defend Shakes O'Breen
    .isOnQuest 667
step
    .goto 1417/0,-2028.75,-2086.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shakes O'Breen|r
    .turnin 667 >>Turn in Death From Below
    .target Shakes O'Breen
    .isOnQuest 667
step
    +|cRXP_WARN_End of the Arathi Highlands route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Badlands|r: Theldurin the Lost
    >>|cRXP_FRIENDLY_Ironforge|r: Myzrael's Allies
]])
