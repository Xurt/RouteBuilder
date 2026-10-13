-- 41-51 Feralas: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 3 parts with a level check between them (from level 41, 44, 47).
-- Edit zones/Feralas.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#name 41-51 Feralas

step
    .goto 1444/1,-773.02,-4497.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kristy Grant|r
    .accept 98155 >>Accept Pristine Pesterhide Pelts
    .target Kristy Grant
step
    .goto 1444/1,-773.02,-4497.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kristy Grant|r
    .turnin 98155 >>Turn in Pristine Pesterhide Pelts
    .target Kristy Grant
    .isQuestComplete 98155
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thyssiana|r
    .goto 1444/1,-778.37,-4491.19
    .fp Thalanaar >> Get the Thalanaar flight path
    .target Thyssiana
step
    .goto 1444/1,-788.31,-4524.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Falfindel Waywarder|r
    .accept 1101 >>Accept The Crone of the Kraul
    .target Falfindel Waywarder
    .isQuestTurnedIn 1100 --any of: Lonebrow's Journal
    .xp <29,1
step
    .goto 1444/1,-788.31,-4524.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Falfindel Waywarder|r
    .turnin 1059 >>Turn in Reclaiming the Charred Vale
    .target Falfindel Waywarder
    .isOnQuest 1059
step
    .goto 1444/1,-788.31,-4524.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Falfindel Waywarder|r
    .turnin 1101 >>Turn in The Crone of the Kraul
    .target Falfindel Waywarder
    .isQuestComplete 1101
step
    .goto 1444/1,3340.13,-4370.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fyldren Moonfeather|r
    .fp Feathermoon >> Get the Feathermoon Flight Path
    .target Fyldren Moonfeather
step
    .goto 1444/1,858.84,-4481.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kindal Moonweaver|r
    .accept 3841 >>Accept An Orphan Looking For a Home
    .target Kindal Moonweaver
    .isQuestTurnedIn 2972 --any of: Doling Justice
    .xp <38,1
step
    .goto 1444/1,3312.88,-4345.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pratt McGrubben|r
    .accept 2821 >>Accept The Mark of Quality
    .target Pratt McGrubben
step << Hunter
    .goto 1444/1,3312.74,-4345.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pratt McGrubben|r
    .target Pratt McGrubben
    .train 415428,1
step << Hunter
    .goto 1444/1,3370.57,-4645.80
    >>|cRXP_WARN_Cast|r |T132164:0|t[Tame Beast] |cRXP_WARN_on a |cRXP_ENEMY_Longtooth Runner|r to tame it|r
    .train 17266 >>|cRXP_WARN_Attack mobs with it to learn|r |T132278:0|t[Bite (Rank 6)]
step
    .goto 1444/1,3289.25,-4381.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Shyria|r
    .target Innkeeper Shyria
    .home >>Set your Hearthstone to Innkeeper Shyria's inn
step
    .goto 1444/1,3330.26,-4505.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Latronicus Moonspear|r
    .accept 4124 >>Accept The Missing Courier
    .target Latronicus Moonspear
step
    .goto 1444/1,3337.21,-4505.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shandris Feathermoon|r
    .accept 2866 >>Accept The Ruins of Solarsal
    .target Shandris Feathermoon
step
    .goto 1444/1,3186.39,-4395.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quintis Jonespyre|r
    .turnin 3787 >>Turn in Jonespyre's Request
    .target Quintis Jonespyre
    .isOnQuest 3787
step
    .goto 1444/1,3227.40,-4457.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ginro Hearthkindle|r
    .turnin 4124 >>Turn in The Missing Courier
    .accept 4125 >>Accept The Missing Courier
    .target Ginro Hearthkindle
step
    .goto 1444/1,3613.12,-4791.75
    >>Click the |cRXP_PICK_Solarsal Gazebo|r
    .turnin 2866 >>Turn in The Ruins of Solarsal
    .accept 2867 >>Accept Return to Feathermoon Stronghold
step
    .goto 1444/1,3337.21,-4505.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shandris Feathermoon|r
    .turnin 2867 >>Turn in Return to Feathermoon Stronghold
    .accept 3130 >>Accept Against the Hatecrest
    .target Shandris Feathermoon
step
    .goto 1444/1,3330.26,-4505.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Latronicus Moonspear|r
    .turnin 3130 >>Turn in Against the Hatecrest
    .accept 2869 >>Accept Against the Hatecrest
    .target Latronicus Moonspear
step
    #completewith Drop2766x1
    >>|cRXP_LOOT_OOX-22/FE Distress Beacon|r can drop from |cRXP_ENEMY_Gordunni Ogre|r, |cRXP_ENEMY_Gordunni Brute|r, |cRXP_ENEMY_Gordunni Mauler|r. Use it to start the quest if you get one
    .collect 8705,1,2766 --OOX-22/FE Distress Beacon (1)
    .accept 2766 >>Accept Find OOX-22/FE!
    .use 8705
step
    #label Drop2766x1
    #loop
    .goto 1444/1,3496.36,-4777.85,0
    .goto 1444/1,3496.36,-4777.85,40,0
    .goto 1444/1,3587.41,-4709.74,40,0
    .goto 1444/1,3584.63,-4782.95,40,0
    .goto 1444/1,3661.08,-4832.06,40,0
    .goto 1444/1,3685.40,-4927.05,40,0
    .goto 1444/1,3588.10,-4989.60,40,0
    .goto 1444/1,3451.19,-5024.81,40,0
    .goto 1444/1,3452.58,-4887.20,40,0
    .goto 1444/1,3555.44,-4854.30,40,0
    >>Kill |cRXP_ENEMY_Hatecrest Warriors|r, |cRXP_ENEMY_Hatecrest Wave Riders|r, |cRXP_ENEMY_Hatecrest Serpent Guards|r and |cRXP_ENEMY_Hatecrest Myrmidons|r. Loot them for |cRXP_LOOT_Hatecrest Naga Scale|r
    .complete 2869,1 --Hatecrest Naga Scale (10)
    .mob Hatecrest Warrior
    .mob Hatecrest Wave Rider
    .mob Hatecrest Serpent Guard
    .mob Hatecrest Myrmidon
step
    .goto 1444/1,3330.26,-4505.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Latronicus Moonspear|r
    .turnin 2869 >>Turn in Against the Hatecrest
    .target Latronicus Moonspear
step
    .goto 1444/1,2283.59,-5376.48
    >>Click the |cRXP_PICK_Wrecked Row Boat|r
    .turnin 4125 >>Turn in The Missing Courier
    .accept 4127 >>Accept Boat Wreckage
step
    #completewith next
    .hs >>Hearth to Innkeeper Shyria's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1444/1,3227.40,-4457.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ginro Hearthkindle|r
    .turnin 4127 >>Turn in Boat Wreckage
    .accept 4129 >>Accept The Knife Revealed
    .target Ginro Hearthkindle
step
    .goto 1444/1,3186.39,-4395.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quintis Jonespyre|r
    .turnin 4129 >>Turn in The Knife Revealed
    .accept 4130 >>Accept Psychometric Reading
    .target Quintis Jonespyre
step
    .goto 1444/1,3227.40,-4457.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ginro Hearthkindle|r
    .turnin 4130 >>Turn in Psychometric Reading
    .accept 4131 >>Accept The Woodpaw Gnolls
    .target Ginro Hearthkindle
step
    .goto 1444/1,858.14,-4479.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jer'kai Moonweaver|r
    .accept 2970 >>Accept Doling Justice
    .target Jer'kai Moonweaver
    .isQuestTurnedIn 2969 --any of: Freedom for All Creatures
    .xp <38,1
step
    #completewith Drop2766x2
    >>|cRXP_LOOT_OOX-22/FE Distress Beacon|r can drop from |cRXP_ENEMY_Gordunni Ogre|r, |cRXP_ENEMY_Gordunni Brute|r, |cRXP_ENEMY_Gordunni Mauler|r. Use it to start the quest if you get one
    .collect 8705,1,2766 --OOX-22/FE Distress Beacon (1)
    .accept 2766 >>Accept Find OOX-22/FE!
    .use 8705
step
    #loop
    .goto 1444/1,763.62,-4190.35,0
    .goto 1444/1,763.62,-4190.35,40,0
    .goto 1444/1,784.47,-4182.47,40,0
    .goto 1444/1,826.87,-4165.79,40,0
    .goto 1444/1,792.81,-4148.65,40,0
    .goto 1444/1,651.73,-4147.26,40,0
    .goto 1444/1,656.59,-4171.81,40,0
    .goto 1444/1,664.24,-4185.25,40,0
    .goto 1444/1,648.25,-4227.41,40,0
    .goto 1444/1,646.17,-4245.48,40,0
    >>Kill |cRXP_ENEMY_Grimtotem Naturalists|r
    .complete 2970,1 --Grimtotem Naturalist slain (12)
    .mob Grimtotem Naturalist
    .isOnQuest 2970
step
    #loop
    .goto 1444/1,660.76,-4123.16,0
    .goto 1444/1,660.76,-4123.16,40,0
    .goto 1444/1,578.06,-4117.14,40,0
    .goto 1444/1,598.21,-4185.71,40,0
    .goto 1444/1,648.25,-4254.75,40,0
    .goto 1444/1,668.41,-4213.98,40,0
    .goto 1444/1,623.23,-4171.35,40,0
    >>Kill |cRXP_ENEMY_Grimtotem Raiders|r
    .complete 2970,2 --Grimtotem Raider slain (10)
    .mob Grimtotem Raider
    .isOnQuest 2970
step
    #label Drop2766x2
    #loop
    .goto 1444/1,643.39,-4196.37,0
    .goto 1444/1,643.39,-4196.37,40,0
    .goto 1444/1,648.95,-4226.49,40,0
    .goto 1444/1,581.53,-4218.15,40,0
    >>Kill |cRXP_ENEMY_Grimtotem Shamans|r
    .complete 2970,3 --Grimtotem Shaman slain (6)
    .mob Grimtotem Shaman
    .isOnQuest 2970
step
    .goto 1444/1,858.14,-4479.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jer'kai Moonweaver|r
    .turnin 2970 >>Turn in Doling Justice
    .target Jer'kai Moonweaver
    .isOnQuest 2970
step
    .goto 1444/1,858.14,-4479.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jer'kai Moonweaver|r
    .accept 2972 >>Accept Doling Justice
    .target Jer'kai Moonweaver
    .isQuestTurnedIn 2970 --any of: Doling Justice
    .xp <38,1
step
    .goto 1444/1,345.93,-4975.70
    >>Click the |cRXP_PICK_Large Leather Backpacks|r
    .turnin 4131 >>Turn in The Woodpaw Gnolls
    .accept 4135 >>Accept The Writhing Deep
step
    .goto 1444/1,432.80,-5319.03
    >>Click the |cRXP_PICK_Zukk'ash Pod|r
    .turnin 4135 >>Turn in The Writhing Deep
step
    .goto 1444/1,3227.40,-4457.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ginro Hearthkindle|r
    .accept 4266 >>Accept A Hero's Welcome
    .target Ginro Hearthkindle
    .isQuestTurnedIn 4265 --any of: Freed from the Hive
    .xp <40,1
step
    .goto 1444/1,3337.21,-4505.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shandris Feathermoon|r
    .turnin 4266 >>Turn in A Hero's Welcome
    .target Shandris Feathermoon
    .isOnQuest 4266
step
    .goto 1444/1,3337.21,-4505.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shandris Feathermoon|r
    .accept 4267 >>Accept Rise of the Silithid
    .target Shandris Feathermoon
    .isQuestTurnedIn 4266 --any of: A Hero's Welcome
    .xp <40,1
step << Hunter
    .goto 1444/1,3311.84,-4379.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Faralorn|r
    .vendor >>|cRXP_BUY_Buy Ammo if needed|r
    .target Faralorn
step << Hunter
    .goto 1444/1,3311.84,-4379.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Faralorn|r
    .vendor >>|cRXP_BUY_Buy Ammo for the next segment|r
    .target Faralorn
step
    #completewith Drop2766x3
    >>|cRXP_LOOT_OOX-22/FE Distress Beacon|r can drop from |cRXP_ENEMY_Gordunni Ogre|r, |cRXP_ENEMY_Gordunni Brute|r, |cRXP_ENEMY_Gordunni Mauler|r. Use it to start the quest if you get one
    .collect 8705,1,2766 --OOX-22/FE Distress Beacon (1)
    .accept 2766 >>Accept Find OOX-22/FE!
    .use 8705
step
    #label Drop2766x3
    #loop
    .goto 1444/1,1772.76,-5009.06,0
    .goto 1444/1,1772.76,-5009.06,40,0
    .goto 1444/1,1749.13,-4967.36,40,0
    .goto 1444/1,1722.03,-4926.12,40,0
    .goto 1444/1,1599.01,-4857.55,40,0
    .goto 1444/1,1513.53,-4984.50,40,0
    .goto 1444/1,1558.01,-5091.53,40,0
    .goto 1444/1,1582.33,-5015.54,40,0
    .goto 1444/1,1617.78,-4976.62,40,0
    .goto 1444/1,1668.51,-4944.19,40,0
    >>Kill |cRXP_ENEMY_Feral Scar Yetis|r, |cRXP_ENEMY_Hulking Feral Scars|r, |cRXP_ENEMY_Enraged Feral Scars|r and |cRXP_ENEMY_Bloodroar the Stalkers|r. Loot them for |cRXP_LOOT_Thick Yeti Hide|r
    .complete 2821,1 --Thick Yeti Hide (10)
    .mob Feral Scar Yeti
    .mob Hulking Feral Scar
    .mob Enraged Feral Scar
    .mob Bloodroar the Stalker
step
    .goto 1444/1,1575.38,-4981.72,50,0
    .goto 1444/1,1723.42,-4936.78
    >>Kill |cRXP_ENEMY_Feral Scar Yetis|r, |cRXP_ENEMY_Enraged Feral Scars|r and |cRXP_ENEMY_Hulking Feral Scars|r. Loot them for their |cRXP_LOOT_Thick Yeti Hides|r
    .train 415428,3 << Hunter sod
step
    .goto 1444/1,1733.84,-4947.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Homing Robot OOX-22/FE|r
    .turnin 2766 >>Turn in Find OOX-22/FE!
    .target Homing Robot OOX-22/FE
    .isOnQuest 2766
step
    .goto 1444/1,3312.88,-4345.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pratt McGrubben|r
    .turnin 2821 >>Turn in The Mark of Quality
    .target Pratt McGrubben
step
    .goto 1444/1,3232.96,-4474.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Troyas Moonbreeze|r
    .turnin 2943 >>Turn in Return to Troyas
    .target Troyas Moonbreeze
    .isOnQuest 2943
step
    .goto 1444/1,2305.83,-3551.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gregan Brewspewer|r
    .turnin 4142 >>Turn in A Visit to Gregan
    .target Gregan Brewspewer
    .isOnQuest 4142
step
    +|cRXP_WARN_That is all of Feralas for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Darnassus|r: Rise of the Silithid, Doling Justice
    >>|cRXP_FRIENDLY_Thousand Needles|r: An Orphan Looking For a Home
    >>|cRXP_FRIENDLY_Thousand Needles and back here|r: Pristine Pesterhide Pelts
step
    .xp 44 >>|cRXP_WARN_The rest of Feralas is planned from level 44.|r Come back to this guide then
step
    .goto 1444/1,3232.96,-4474.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Troyas Moonbreeze|r
    .accept 2939 >>Accept In Search of Knowledge
    .target Troyas Moonbreeze
step
    .goto 1444/1,3229.48,-4479.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Angelas Moonbreeze|r
    .accept 2982 >>Accept The High Wilderness
    .target Angelas Moonbreeze
step
    #loop
    .goto 1444/1,1309.20,-5426.98,0
    .goto 1444/1,1309.20,-5426.98,40,0
    .goto 1444/1,1279.31,-5471.93,40,0
    .goto 1444/1,1251.51,-5418.64,40,0
    .goto 1444/1,1220.93,-5427.45,40,0
    .goto 1444/1,1241.09,-5369.07,40,0
    >>Kill |cRXP_ENEMY_Gordunni Shamans|r
    .complete 2982,2 --Gordunni Shaman slain (8)
    .mob Gordunni Shaman
step
    #loop
    .goto 1444/1,1242.48,-5063.27,0
    .goto 1444/1,1242.48,-5063.27,40,0
    .goto 1444/1,1245.26,-5011.84,40,0
    .goto 1444/1,1195.22,-4984.96,40,0
    .goto 1444/1,1144.48,-4946.04,40,0
    .goto 1444/1,1147.26,-4866.81,40,0
    .goto 1444/1,1175.76,-4913.61,40,0
    .goto 1444/1,1218.85,-4922.88,40,0
    .goto 1444/1,1243.17,-4890.91,40,0
    .goto 1444/1,1318.23,-5031.76,40,0
    >>Kill |cRXP_ENEMY_Gordunni Warlocks|r
    >>Kill |cRXP_ENEMY_Gordunni Brutes|r
    .complete 2982,1 --Gordunni Warlock slain (8)
    .complete 2982,3 --Gordunni Brute slain (8)
    .mob Gordunni Warlock
    .mob Gordunni Brute
step
    .goto 1444/1,-773.02,-4497.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kristy Grant|r
    .turnin 98155 >>Turn in Pristine Pesterhide Pelts
    .target Kristy Grant
    .isQuestComplete 98155
step
    .goto 1444/1,3229.48,-4479.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Angelas Moonbreeze|r
    .turnin 2982 >>Turn in The High Wilderness
    .target Angelas Moonbreeze
step
    +|cRXP_WARN_That is all of Feralas for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Teldrassil|r: In Search of Knowledge
step
    .xp 47 >>|cRXP_WARN_The rest of Feralas is planned from level 47.|r Come back to this guide then
step
    .goto 1444/1,3330.26,-4505.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Latronicus Moonspear|r
    .accept 2870 >>Accept Against Lord Shalzaru
    .target Latronicus Moonspear
step
    .goto 1444/1,3460.92,-5631.31
    >>Kill |cRXP_ENEMY_Lord Shalzaru|r and loot |cRXP_LOOT_Mysterious Relic|r
    .complete 2870,1 --Mysterious Relic (1)
    .mob Lord Shalzaru
step
    .goto 1444/1,3330.26,-4505.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Latronicus Moonspear|r
    .turnin 2870 >>Turn in Against Lord Shalzaru
    .accept 2871 >>Accept Delivering the Relic
    .target Latronicus Moonspear
step
    .goto 1444/1,3351.11,-4454.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vestia Moonspear|r
    .turnin 2871 >>Turn in Delivering the Relic
    .target Vestia Moonspear
step
    .goto 1444/1,3229.48,-4479.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Angelas Moonbreeze|r
    .accept 3445 >>Accept The Sunken Temple
    .target Angelas Moonbreeze
step
    .goto 1444/1,3312.88,-4345.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pratt McGrubben|r
    .accept 7733 >>Accept Improved Quality
    .target Pratt McGrubben
step
    .goto 1444/1,3232.96,-4474.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Troyas Moonbreeze|r
    .accept 2879 >>Accept The Stave of Equinex
    .target Troyas Moonbreeze
    .isQuestTurnedIn 2943 --any of: Return to Troyas
    .xp <42,1
step
    .goto 1444/1,2327.37,-4378.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zorbin Fandazzle|r
    .accept 7003 >>Accept Zapped Giants
    .accept 7721 >>Accept Fuel for the Zapping
    .target Zorbin Fandazzle
step
    #loop
    .goto 1444/1,2588.69,-3414.73,0
    .goto 1444/1,2588.69,-3414.73,40,0
    .goto 1444/1,2631.09,-3405.92,40,0
    .goto 1444/1,2684.60,-3399.90,40,0
    .goto 1444/1,2746.46,-3382.76,40,0
    .goto 1444/1,2817.35,-3382.29,40,0
    .goto 1444/1,2788.85,-3358.20,40,0
    .goto 1444/1,2784.68,-3320.67,40,0
    .goto 1444/1,2668.62,-3381.37,40,0
    >>Kill |cRXP_ENEMY_Land Walkers|r, |cRXP_ENEMY_Cliff Giants|r, |cRXP_ENEMY_Shore Striders|r and |cRXP_ENEMY_Deep Striders|r. Loot them for |cRXP_LOOT_Miniaturization Residue|r
    .complete 7003,1 --Miniaturization Residue (15)
    .mob Land Walker
    .mob Cliff Giant
    .mob Shore Strider
    .mob Deep Strider
step
    #loop
    .goto 1444/1,2680.43,-4075.90,0
    .goto 1444/1,2680.43,-4075.90,40,0
    .goto 1444/1,2625.53,-4115.75,40,0
    .goto 1444/1,2549.08,-4163.01,40,0
    .goto 1444/1,2515.72,-4155.60,40,0
    .goto 1444/1,2586.61,-4123.16,40,0
    >>Kill |cRXP_ENEMY_Sea Elementals|r and |cRXP_ENEMY_Sea Sprays|r. Loot them for |cRXP_LOOT_Water Elemental Core|r
    .complete 7721,1 --Water Elemental Core (10)
    .mob Sea Elemental
    .mob Sea Spray
step
    .goto 1444/1,2327.37,-4378.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zorbin Fandazzle|r
    .turnin 7003 >>Turn in Zapped Giants
    .turnin 7721 >>Turn in Fuel for the Zapping
    .target Zorbin Fandazzle
step
    #loop
    .goto 1444/1,1841.57,-3793.27,0
    .goto 1444/1,1841.57,-3793.27,40,0
    .goto 1444/1,1801.26,-3744.62,40,0
    .goto 1444/1,1762.34,-3775.20,40,0
    .goto 1444/1,1618.47,-3864.62,40,0
    .goto 1444/1,1568.43,-3897.98,40,0
    .goto 1444/1,1626.81,-3919.76,40,0
    .goto 1444/1,1685.19,-3872.96,40,0
    .goto 1444/1,1738.71,-3842.38,40,0
    .goto 1444/1,1790.14,-3837.75,40,0
    >>Kill |cRXP_ENEMY_Rage Scar Yetis|r, |cRXP_ENEMY_Elder Rage Scars|r, |cRXP_ENEMY_Ferocious Rage Scars|r and |cRXP_ENEMY_Lurking Feral Scars|r. Loot them for |cRXP_LOOT_Rage Scar Yeti Hide|r
    .complete 7733,1 --Rage Scar Yeti Hide (10)
    .mob Rage Scar Yeti
    .mob Elder Rage Scar
    .mob Ferocious Rage Scar
    .mob Lurking Feral Scar
step
    .goto 1444/1,2305.83,-3551.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gregan Brewspewer|r
    .accept 4143 >>Accept Haze of Evil
    .target Gregan Brewspewer
    .isQuestTurnedIn 4142 --any of: A Visit to Gregan
    .xp <47,1
step
    .goto 1444/1,2495.56,-3386.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rockbiter|r
    .accept 2844 >>Accept The Giant Guardian
    .target Rockbiter
step
    .goto 1444/1,2765.92,-3098.27
    >>Open the |cRXP_PICK_Flame of Byltan|r. Loot it for |cRXP_LOOT_Byltan Essence|r
    .collect 9258,1,2879,1 --Byltan Essence (1)
    .isOnQuest 2879
step
    .goto 1444/1,2818.04,-2931.01
    >>Open the |cRXP_PICK_Flame of Lahassa|r. Loot it for |cRXP_LOOT_Lahassa Essence|r
    .collect 9255,1,2879,1 --Lahassa Essence (1)
    .isOnQuest 2879
step
    .goto 1444/1,2785.38,-2843.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shay Leafrunner|r
    .turnin 2844 >>Turn in The Giant Guardian
    .target Shay Leafrunner
step
    .goto 1444/1,2667.23,-2804.05
    >>Open the |cRXP_PICK_Flame of Imbel|r. Loot it for |cRXP_LOOT_Imbel Essence|r
    .collect 9256,1,2879,1 --Imbel Essence (1)
    .isOnQuest 2879
step
    .goto 1444/1,2624.14,-2953.25
    >>Open the |cRXP_PICK_Flame of Samha|r. Loot it for |cRXP_LOOT_Samha Essence|r
    .collect 9257,1,2879,1 --Samha Essence (1)
    .isOnQuest 2879
step
    .goto 1444/1,2742.98,-2976.88
    >>Open the |cRXP_PICK_Equinex Monolith|r. Loot it for |cRXP_LOOT_Stave of Equinex|r
    .complete 2879,1 --Stave of Equinex (1)
    .isOnQuest 2879
step
    .goto 1444/1,2742.98,-2976.88
    >>Click the |cRXP_PICK_Equinex Monolith|r
    .turnin 2879 >>Turn in The Stave of Equinex
    .isOnQuest 2879
step
    .goto 1444/1,2742.98,-2976.88
    >>Click the |cRXP_PICK_Equinex Monolith|r
    .accept 2942 >>Accept The Morrow Stone
    .isQuestTurnedIn 2879 --any of: The Stave of Equinex
    .xp <42,1
step
    .goto 1444/1,3232.96,-4474.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Troyas Moonbreeze|r
    .turnin 2942 >>Turn in The Morrow Stone
    .target Troyas Moonbreeze
    .isOnQuest 2942
step
    .goto 1444/1,3312.88,-4345.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pratt McGrubben|r
    .turnin 7733 >>Turn in Improved Quality
    .target Pratt McGrubben
step
    .goto 1444/1,3289.25,-4381.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Shyria|r
    .accept 3788 >>Accept Jonespyre's Request
    .target Innkeeper Shyria
    .isQuestTurnedIn 3781 --any of: Morrowgrain Research
    .xp <47,1
step
    .goto 1444/1,3186.39,-4395.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quintis Jonespyre|r
    .turnin 3788 >>Turn in Jonespyre's Request
    .target Quintis Jonespyre
    .isOnQuest 3788
step
    .goto 1444/1,3186.39,-4395.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quintis Jonespyre|r
    .accept 3791 >>Accept The Mystery of Morrowgrain
    .target Quintis Jonespyre
    .isQuestTurnedIn 3781 --any of: Morrowgrain Research
    .xp <47,1
step
    .goto 1444/1,3186.39,-4395.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quintis Jonespyre|r
    .turnin 3791 >>Turn in The Mystery of Morrowgrain
    .target Quintis Jonespyre
    .isOnQuest 3791
step
    .goto 1444/1,-773.02,-4497.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kristy Grant|r
    .turnin 98155 >>Turn in Pristine Pesterhide Pelts
    .target Kristy Grant
    .isQuestComplete 98155
step
    +|cRXP_WARN_End of the Feralas route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Tanaris|r: The Sunken Temple
    >>|cRXP_FRIENDLY_Un'Goro Crater|r: Haze of Evil
]])
