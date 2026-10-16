-- 18-32 Ashenvale: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 5 parts with a level check between them (from level 18, 21, 24, 27, 30).
-- Sections (the guide starts at the one for your level): around Shindrell Swiftfire from 18; part 2 from 21; part 3 from 24; part 4 from 27; part 5 from 30.
-- Edit zones/Ashenvale.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#name 18-32 Ashenvale

step
    .xp <21,1,RBSection1_1
    .xp 21 >>Finding the place in this guide for your level
step
    .xp <24,1,RBSection2_1
    .xp 24 >>Finding the place in this guide for your level
step
    .xp <27,1,RBSection3_1
    .xp 27 >>Finding the place in this guide for your level
step
    .xp <30,1,RBSection4_1
    .xp 30 >>Finding the place in this guide for your level
step
    .xp <61,1,RBSection5_1
step
    #label RBSection1_1
    #completewith next
    +|cRXP_WARN_Ashenvale: around Shindrell Swiftfire|r (planned from level 18)
step
    .goto 1440/1,156.26,3254.19
    >>Escort Kerlonian Evershade to Maestra's Post
    .complete 5321,2 --Escort Kerlonian Evershade to Maestra's Post
    .isOnQuest 5321
step
    .goto 1440/1,128.01,3305.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Liladris Moonriver|r
    .turnin 5321 >>Turn in The Sleeper Has Awakened
    .target Liladris Moonriver
    .isQuestComplete 5321
step
    .goto 1440/1,166.07,3261.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Onaeya|r
    .turnin 5713 >>Turn in One Shot. One Kill.
    .target Sentinel Onaeya
    .isQuestComplete 5713
step
    .goto 1440/1,189.13,3185.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Delgren the Purifier|r
    .turnin 967 >>Turn in The Tower of Althalaxx
    .target Delgren the Purifier
    .isOnQuest 967
step
    .goto 1440/1,189.13,3185.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Delgren the Purifier|r
    .accept 970 >>Accept The Tower of Althalaxx
    .target Delgren the Purifier
    .isQuestTurnedIn 967 --any of: The Tower of Althalaxx
    .xp <13,1
step
    .goto 1440/1,189.13,3185.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Delgren the Purifier|r
    .turnin 981 >>Turn in The Tower of Althalaxx
    .target Delgren the Purifier
    .isOnQuest 981
step
    #loop
    .goto 1440/1,-76.13,3457.91,0
    .goto 1440/1,-76.13,3457.91,40,0
    .goto 1440/1,-52.49,3481.74,40,0
    .goto 1440/1,-114.77,3546.70,40,0
    .goto 1440/1,-179.36,3546.31,40,0
    .goto 1440/1,-151.68,3518.64,40,0
    .goto 1440/1,-114.19,3514.41,40,0
    .goto 1440/1,-123.42,3493.65,40,0
    .goto 1440/1,-136.11,3461.37,40,0
    .goto 1440/1,-87.09,3485.58,40,0
    >>Kill |cRXP_ENEMY_Dark Strand Cultists|r, |cRXP_ENEMY_Dark Strand Enforcers|r, |cRXP_ENEMY_Dark Strand Adepts|r and |cRXP_ENEMY_Dark Strand Excavators|r. Loot them for |cRXP_LOOT_Glowing Soul Gem|r
    .complete 970,1 --Glowing Soul Gem (1)
    .mob Dark Strand Cultist
    .mob Dark Strand Enforcer
    .mob Dark Strand Adept
    .mob Dark Strand Excavator
    .isOnQuest 970
step
    .goto 1440/1,-102.08,3492.890
    .xp 20-1650 >>Keep killing |cRXP_ENEMY_Dark Strand mobs|r until you have enough xp to reach level 20
step
    .goto 1440/1,189.13,3185.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Delgren the Purifier|r
    .turnin 970 >>Turn in The Tower of Althalaxx
    .target Delgren the Purifier
    .isOnQuest 970
step
    .goto 1440/1,-138.99,3806.92
    .xp 20 >> Grind to level 20
step
    .goto 1440/1,394.43,2677.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Therysil|r
    .turnin 945 >>Turn in Therylune's Escape
    .target Therysil
    .isQuestComplete 945
step << Hunter
    .goto 1440/1,663.38,2365.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bolyun|r
    .trainer >> Train your pet skills
    .target Bolyun
step << Hunter
    .goto 1440/1,661.42,2373.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alenndaar Lapidaar|r
    .trainer >> Train your class skills
    .train 5118 >> Train |T132242:0|t[Aspect of the Cheetah]
    .target Alenndaar Lapidaar
step
    .goto 1440/1,-283.73,2827.920
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Daelyshia|r
    .fp Astranaar>> Get the Astranaar Flight Path
    .target Daelyshia
step
    .goto 1440/1,-299.30,2795.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shindrell Swiftfire|r
    .turnin 1133 >>Turn in Journey to Astranaar
    .target Shindrell Swiftfire
    .isOnQuest 1133
step
    .goto 1440/1,-299.30,2795.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shindrell Swiftfire|r
    .accept 1008 >>Accept The Zoram Strand
    .target Shindrell Swiftfire
step
    .goto 1440/1,-311.99,2759.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Thenysil|r
    .turnin 1082 >>Turn in Update for Sentinel Thenysil
    .target Sentinel Thenysil
    .isOnQuest 1082
step
    .goto 1440/1,-311.99,2759.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Thenysil|r
    .accept 1070 >>Accept On Guard in Stonetalon
    .target Sentinel Thenysil
step
    .goto 1440/1,-362.74,2785.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Faldreas Goeth'Shael|r
    .accept 1056 >>Accept Journey to Stonetalon Peak
    .target Faldreas Goeth'Shael
step
    .goto 1440/1,-411.75,2767.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raene Wolfrunner|r
    .accept 991 >>Accept Raene's Cleansing
    .target Raene Wolfrunner
step
    .goto 1440/1,-410.60,2758.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maliynn|r
    .vendor >> |cRXP_BUY_Buy food and water if necessary|r
    .target Maliynn
step << Hunter
    .goto 1440/1,-306.80,2720.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Haljan Oakheart|r
    .vendor >> |cRXP_BUY_Restock on Ammo if necessary|r
    .target Haljan Oakheart
step
    #loop
    .goto 1440/1,912.27,3485.20,0
    .goto 1440/1,912.27,3485.20,40,0
    .goto 1440/1,960.71,3520.94,40,0
    .goto 1440/1,954.37,3587.44,40,0
    .goto 1440/1,1046.06,3597.05,40,0
    .goto 1440/1,1215.60,3586.29,40,0
    .goto 1440/1,1212.72,3519.79,40,0
    .goto 1440/1,1153.32,3517.49,40,0
    .goto 1440/1,1055.29,3548.62,40,0
    .goto 1440/1,1017.23,3448.30,40,0
    >>Kill |cRXP_ENEMY_Wrathtail Myrmidons|r, |cRXP_ENEMY_Wrathtail Razortails|r, |cRXP_ENEMY_Wrathtail Wave Riders|r and |cRXP_ENEMY_Wrathtail Sea Witches|r. Loot them for |cRXP_LOOT_Wrathtail Head|r
    .complete 1008,1 --Wrathtail Head (20)
    .mob Wrathtail Myrmidon
    .mob Wrathtail Razortail
    .mob Wrathtail Wave Rider
    .mob Wrathtail Sea Witch
step
    .goto 1440/1,528.79,3045.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Teronis' Corpse|r
    .turnin 991 >>Turn in Raene's Cleansing
    .accept 1023 >>Accept Raene's Cleansing
    .target Teronis' Corpse
step
    #loop
    .goto 1440/1,512.64,3050.85,0
    .goto 1440/1,512.64,3050.85,40,0
    .goto 1440/1,513.80,3108.51,40,0
    .goto 1440/1,604.91,3124.27,40,0
    .goto 1440/1,580.69,3076.61,40,0
    .goto 1440/1,587.03,3014.72,40,0
    .goto 1440/1,547.24,2940.54,40,0
    .goto 1440/1,483.23,2982.05,40,0
    .goto 1440/1,441.71,3041.24,40,0
    .goto 1440/1,441.71,3089.29,40,0
    >>Kill |cRXP_ENEMY_Saltspittle Puddlejumpers|r, |cRXP_ENEMY_Saltspittle Warriors|r, |cRXP_ENEMY_Saltspittle Muckdwellers|r and |cRXP_ENEMY_Saltspittle Oracles|r. Loot them for |cRXP_LOOT_Glowing Gem|r
    .complete 1023,1 --Glowing Gem (1)
    .mob Saltspittle Puddlejumper
    .mob Saltspittle Warrior
    .mob Saltspittle Muckdweller
    .mob Saltspittle Oracle
step << Hunter
    .goto 1440/1,-399.07,2374.35
    .train 2982 >>|cRXP_WARN_Cast|r |T132164:0|t[Tame Beast] |cRXP_WARN_on a |cRXP_ENEMY_Ashenvale Bear|r. Attack mobs with it to learn|r |T132140:0|t[Claw (Rank 3)]
    .train 17263 >>|cRXP_WARN_Cast|r |T132164:0|t[Tame Beast] |cRXP_WARN_on a |cRXP_ENEMY_Ghostpaw Runner|r. Attack mobs with it to learn|r |T132278:0|t[Bite (Rank 3)]
step
    .goto 1440/1,-411.75,2767.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raene Wolfrunner|r
    .turnin 990 >>Turn in Trek to Ashenvale
    .target Raene Wolfrunner
    .isOnQuest 990
step << Mage/Warlock
    .goto 1440/1,1323.55,4159.35
    >>Kill |cRXP_ENEMY_Ruuzel|r. Loot her for the |cRXP_LOOT_Ring of Zoram|r
    >>|cRXP_ENEMY_Ruuzel|r |cRXP_WARN_patrols the island with a |cRXP_ENEMY_Wrathtail Myrmidon|r and |cRXP_ENEMY_Wrathtail Sea Witch|r. Kill one of them and then reset them if needed|r
    >>|cRXP_WARN_You can also cast|r |T135857:0|t[Blizzard] |cRXP_WARN_to split pull|r |cRXP_ENEMY_Ruuzel|r << Mage
    >>|cRXP_WARN_You can also cast|r |T135857:0|t[Rain of Fire] |cRXP_WARN_to split pull|r |cRXP_ENEMY_Ruuzel|r << Warlock
    .train 10,3 << Mage
    .train 5740,3 << Warlock
step
    .goto 1440/1,-411.75,2767.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raene Wolfrunner|r
    .turnin 1023 >>Turn in Raene's Cleansing
    .accept 1024 >>Accept Raene's Cleansing
    .target Raene Wolfrunner
step
    .goto 1440/1,-299.30,2795.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shindrell Swiftfire|r
    .turnin 1008 >>Turn in The Zoram Strand
    .accept 1134 >>Accept Pridewings of Stonetalon
    .target Shindrell Swiftfire
step << Hunter
    .goto 1440/1,-306.80,2720.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Haljan Oakheart|r
    .vendor >> |cRXP_BUY_Restock on Ammo, |cRXP_WARN_make sure you have at least 10-15 stacks as the next section is a grindy and there won't be any ammo vendor to restock|r|r
    .target Haljan Oakheart
step
    .goto 1440/1,-299.30,2795.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shindrell Swiftfire|r
    .turnin 1134 >>Turn in Pridewings of Stonetalon
    .target Shindrell Swiftfire
    .isQuestComplete 1134
step << Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Danlaar Nightstride|r
    .goto 1440/1,-1191.23,2061.13
    .trainer >> Train your class skills
    .target Danlaar Nightstride
step
    .goto 1440/1,-311.99,2759.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Thenysil|r
    .accept 1081 >>Accept Reception from Tyrande
    .target Sentinel Thenysil
    .isQuestTurnedIn 1082 --any of: Update for Sentinel Thenysil
    .xp <17,1
step
    .goto 1440/1,-802.73,1966.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alonso|r
    .accept 78134 >>Accept Dragonslayer's Lance
    .accept 78133 >>Accept Dragonslayer's Shield
    .accept 78132 >>Accept Dragonslayer's Helm
    .target Alonso
step
    .goto 1440/1,-802.73,1966.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alonso|r
    >>|cRXP_WARN_The database has no objectives for Dragonslayer's Helm. Skip this step if the quest is not finished|r
    .turnin 78132 >>Turn in Dragonslayer's Helm
    .target Alonso
    .isOnQuest 78132
step
    .goto 1440/1,-802.73,1966.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alonso|r
    >>|cRXP_WARN_The database has no objectives for Dragonslayer's Shield. Skip this step if the quest is not finished|r
    .turnin 78133 >>Turn in Dragonslayer's Shield
    .target Alonso
    .isOnQuest 78133
step
    .goto 1440/1,-802.73,1966.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alonso|r
    >>|cRXP_WARN_The database has no objectives for Dragonslayer's Lance. Skip this step if the quest is not finished|r
    .turnin 78134 >>Turn in Dragonslayer's Lance
    .target Alonso
    .isOnQuest 78134
step
    .goto 1440/1,-1387.47,2896.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shael'dryn|r
    .turnin 1024 >>Turn in Raene's Cleansing
    .target Shael'dryn
step << Human Paladin/Dwarf Paladin
    #loop
    .goto 1440/1,-2950.82,2179.48,0
    .goto 1440/1,-2950.82,2179.48,40,0
    .goto 1440/1,-3010.79,2117.59,40,0
    .goto 1440/1,-3078.26,2114.13,40,0
    .goto 1440/1,-3056.92,2019.96,40,0
    .goto 1440/1,-3146.88,1983.44,40,0
    .goto 1440/1,-3169.37,1853.53,40,0
    .goto 1440/1,-3088.64,1915.41,40,0
    .goto 1440/1,-2985.99,1949.62,40,0
    .goto 1440/1,-2948.51,2050.71,40,0
    >>Kill |cRXP_ENEMY_Legion Hounds|r, |cRXP_ENEMY_Searing Infernals|r, |cRXP_ENEMY_Felguards|r and |cRXP_ENEMY_Mannoroc Lashers|r. Loot them for |cRXP_LOOT_Mote of Mannoroth|r
    .complete 78092,1 --Mote of Mannoroth (12)
    .mob Legion Hound
    .mob Searing Infernal
    .mob Felguard
    .mob Mannoroc Lasher
    .isOnQuest 78092
step << Human Paladin/Dwarf Paladin
    .goto 1440/1,-3455.40,1709.39
    >>Click the |cRXP_PICK_Spear of Mannoroth|r
    .turnin 78092 >>Turn in It Must Be Destroyed
    .isOnQuest 78092
step
    +|cRXP_WARN_That is all of Ashenvale for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Darnassus|r: Reception from Tyrande
    >>|cRXP_FRIENDLY_Stonetalon Mountains|r: Journey to Stonetalon Peak, On Guard in Stonetalon
    >>|cRXP_FRIENDLY_Stonetalon Mountains and back here|r: Pridewings of Stonetalon
step
    +|cRXP_WARN_Until level 21, suggested zones|r: |cRXP_FRIENDLY_Darkshore|r (about 1.0 levels of quests, starting around Archaeologist Hollee), |cRXP_FRIENDLY_Zephras Isle|r (about 0.6 levels of quests, starting around Elegael Thornpaw). Then come back to this Ashenvale guide --RouteBuilder:next
step
    .xp 21 >>|cRXP_WARN_The rest of Ashenvale is planned from level 21.|r Come back to this guide then
step
    #label RBSection2_1
    #completewith next
    +|cRXP_WARN_Ashenvale: part 2|r (planned from level 21)
step
    .goto 1440/1,175.29,3189.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Orendil Broadleaf|r
    .accept 1010 >>Accept Bathran's Hair
    .target Orendil Broadleaf
step
    #loop
    .goto 1440/1,-36.92,3722.36,0
    .goto 1440/1,-36.92,3722.36,40,0
    .goto 1440/1,-68.06,3763.10,40,0
    .goto 1440/1,-83.63,3866.50,40,0
    .goto 1440/1,-111.89,3838.44,40,0
    .goto 1440/1,-155.71,3837.67,40,0
    .goto 1440/1,-252.59,3853.43,40,0
    .goto 1440/1,-208.19,3823.06,40,0
    .goto 1440/1,-149.37,3769.25,40,0
    .goto 1440/1,-157.44,3730.04,40,0
    >>Loot the |cRXP_PICK_Plant Bundles|r for |cRXP_LOOT_Bathran's Hair|r
    .complete 1010,1 --Bathran's Hair (5)
step
    .goto 1440/1,175.29,3189.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Orendil Broadleaf|r
    .turnin 1010 >>Turn in Bathran's Hair
    .accept 1020 >>Accept Orendil's Cure
    .target Orendil Broadleaf
step
    .goto 1440/1,-283.73,2827.920
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Daelyshia|r
    .fp Astranaar >> Get the Astranaar Flight Path
    .target Daelyshia
step
    .goto 1440/1,-455.00,2682.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pelturas Whitemoon|r
    .turnin 1020 >>Turn in Orendil's Cure
    .accept 1033 >>Accept Elune's Tear
    .target Pelturas Whitemoon
step
    .goto 1440/1,-959.59,2894.03
    >>Pick up |cRXP_PICK_Elune's Tear|r from the ground
    .complete 1033,1 --Elune's Tear (1)
step
    .goto 1440/1,-455.00,2682.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pelturas Whitemoon|r
    .turnin 1033 >>Turn in Elune's Tear
    .accept 1034 >>Accept The Ruins of Stardust
    .target Pelturas Whitemoon
step
    #loop
    .goto 1440/1,-257.21,2114.13,0
    .goto 1440/1,-257.21,2114.13,40,0
    .goto 1440/1,-270.47,2072.62,40,0
    .goto 1440/1,-231.83,2073.00,40,0
    .goto 1440/1,-222.03,2059.94,40,0
    .goto 1440/1,-227.22,2034.18,40,0
    .goto 1440/1,-192.04,2042.25,40,0
    .goto 1440/1,-178.78,2101.06,40,0
    .goto 1440/1,-218.57,2089.92,40,0
    >>Loot the |cRXP_PICK_Stardust Covered Bushes|r for |cRXP_LOOT_Handful of Stardust|r
    .complete 1034,1 --Handful of Stardust (5)
step
    .goto 1440/1,847.11,3470.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Talen|r
    .accept 1007 >>Accept The Ancient Statuette
    .target Talen
step
    .goto 1440/1,881.13,3879.57
    >>Pick up |cRXP_PICK_Ancient Statuette|r from the ground
    .complete 1007,1 --Ancient Statuette (1)
step
    .goto 1440/1,847.11,3470.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Talen|r
    .turnin 1007 >>Turn in The Ancient Statuette
    .accept 1009 >>Accept Ruuzel
    .target Talen
step
    .goto 1440/1,1283.65,4170.92
    >>Kill |cRXP_ENEMY_Ruuzel|r and loot |cRXP_LOOT_Ring of Zoram|r
    .complete 1009,1 --Ring of Zoram (1)
    .mob Ruuzel
step
    .goto 1440/1,847.11,3470.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Talen|r
    .turnin 1009 >>Turn in Ruuzel
    .target Talen
step
    .goto 1440/1,-455.00,2682.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pelturas Whitemoon|r
    .turnin 1034 >>Turn in The Ruins of Stardust
    .target Pelturas Whitemoon
step
    .goto 1440/1,-299.30,2795.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shindrell Swiftfire|r
    .turnin 1134 >>Turn in Pridewings of Stonetalon
    .target Shindrell Swiftfire
    .isQuestComplete 1134
step
    .goto 1440/1,-802.73,1966.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alonso|r
    .turnin 78132 >>Turn in Dragonslayer's Helm
    .target Alonso
    .isOnQuest 78132
step
    .goto 1440/1,-802.73,1966.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alonso|r
    .turnin 78133 >>Turn in Dragonslayer's Shield
    .target Alonso
    .isOnQuest 78133
step
    .goto 1440/1,-802.73,1966.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alonso|r
    .turnin 78134 >>Turn in Dragonslayer's Lance
    .target Alonso
    .isOnQuest 78134
step
    .goto 1440/1,-1171.80,2089.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Velene Starstrike|r
    .accept 1016 >>Accept Elemental Bracers
    .turnin 1016 >>Turn in Elemental Bracers
    .accept 1017 >>Accept Mage Summoner
    .target Sentinel Velene Starstrike
step
    .goto 1440/1,-1171.80,2089.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Velene Starstrike|r
    .turnin 1017 >>Turn in Mage Summoner
    .target Sentinel Velene Starstrike
    .isQuestComplete 1017
step
    +|cRXP_WARN_That is all of Ashenvale for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_The Barrens and back here|r: Mage Summoner
step
    +|cRXP_WARN_Until level 24, suggested zones|r: |cRXP_FRIENDLY_Wetlands|r (about 0.8 levels of quests, starting around Karl Boran). Then come back to this Ashenvale guide --RouteBuilder:next
step
    .xp 24 >>|cRXP_WARN_The rest of Ashenvale is planned from level 24.|r Come back to this guide then
step
    #label RBSection3_1
    #completewith next
    +|cRXP_WARN_Ashenvale: part 3|r (planned from level 24)
step
    .goto 1440/1,189.13,3185.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Delgren the Purifier|r
    .accept 973 >>Accept The Tower of Althalaxx
    .target Delgren the Purifier
    .isQuestTurnedIn 970 --any of: The Tower of Althalaxx
    .xp <13,1
step
    .goto 1440/1,-411.75,2767.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raene Wolfrunner|r
    .accept 1054 >>Accept Culling the Threat
    .target Raene Wolfrunner
step
    .goto 1440/1,242.19,2340.14
    >>Kill |cRXP_ENEMY_Ilkrud Magthrull|r and loot |cRXP_LOOT_Ilkrud Magthrull's Tome|r
    .complete 973,1 --Ilkrud Magthrull's Tome (1)
    .mob Ilkrud Magthrull
    .isOnQuest 973
step
    .goto 1440/1,189.13,3185.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Delgren the Purifier|r
    .turnin 973 >>Turn in The Tower of Althalaxx
    .target Delgren the Purifier
    .isOnQuest 973
step
    .goto 1440/1,188.56,3178.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Feero Ironhand|r
    .accept 976 >>Accept Supplies to Auberdine
    .target Feero Ironhand
    .isQuestTurnedIn 973 --any of: The Tower of Althalaxx
    .xp <19,1
step
    .goto 1440/1,189.13,3185.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Delgren the Purifier|r
    .turnin 976 >>Turn in Supplies to Auberdine
    .target Delgren the Purifier
    .isQuestComplete 976
step
    .goto 1440/1,-299.30,2795.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shindrell Swiftfire|r
    .turnin 1134 >>Turn in Pridewings of Stonetalon
    .target Shindrell Swiftfire
    .isQuestComplete 1134
step
    .goto 1440/1,-411.75,2767.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raene Wolfrunner|r
    .accept 1025 >>Accept An Aggressive Defense
    .target Raene Wolfrunner
    .isQuestTurnedIn 1023 --any of: Raene's Cleansing
step
    #loop
    .goto 1440/1,-1351.72,2222.14,0
    .goto 1440/1,-1351.72,2222.14,40,0
    .goto 1440/1,-1381.71,2222.53,40,0
    .goto 1440/1,-1421.50,2215.99,40,0
    .goto 1440/1,-1544.90,2288.64,40,0
    .goto 1440/1,-1512.03,2282.49,40,0
    .goto 1440/1,-1447.45,2251.35,40,0
    >>Kill |cRXP_ENEMY_Foulweald Warriors|r
    .complete 1025,4 --Foulweald Warrior slain (12)
    .mob Foulweald Warrior
    .isOnQuest 1025
step
    #loop
    .goto 1440/1,-1412.85,2205.61,0
    .goto 1440/1,-1412.85,2205.61,40,0
    .goto 1440/1,-1411.69,2181.01,40,0
    .goto 1440/1,-1355.76,2251.74,40,0
    .goto 1440/1,-1386.90,2251.35,40,0
    >>Kill |cRXP_ENEMY_Foulweald Totemics|r
    .complete 1025,3 --Foulweald Totemic slain (10)
    .mob Foulweald Totemic
    .isOnQuest 1025
step
    .goto 1440/1,-1197.17,2363.98
    >>Kill |cRXP_ENEMY_Foulweald Ursas|r
    .complete 1025,2 --Foulweald Ursa slain (2)
    .mob Foulweald Ursa
    .isOnQuest 1025
step
    .goto 1440/1,-1181.60,2370.51
    >>Kill |cRXP_ENEMY_Foulweald Den Watcher|r
    .complete 1025,1 --Foulweald Den Watcher slain (1)
    .mob Foulweald Den Watcher
    .isOnQuest 1025
step
    .goto 1440/1,-1171.80,2089.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Velene Starstrike|r
    .turnin 1017 >>Turn in Mage Summoner
    .target Sentinel Velene Starstrike
    .isQuestComplete 1017
step
    .goto 1440/1,-802.73,1966.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alonso|r
    .turnin 78132 >>Turn in Dragonslayer's Helm
    .target Alonso
    .isOnQuest 78132
step
    .goto 1440/1,-802.73,1966.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alonso|r
    .turnin 78133 >>Turn in Dragonslayer's Shield
    .target Alonso
    .isOnQuest 78133
step
    .goto 1440/1,-802.73,1966.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alonso|r
    .turnin 78134 >>Turn in Dragonslayer's Lance
    .target Alonso
    .isOnQuest 78134
step
    .goto 1440/1,-411.75,2767.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raene Wolfrunner|r
    .turnin 1025 >>Turn in An Aggressive Defense
    .target Raene Wolfrunner
    .isOnQuest 1025
step
    .goto 1440/1,-584.18,3277.25
    >>Kill |cRXP_ENEMY_Dal Bloodclaw|r and loot |cRXP_LOOT_Dal Bloodclaw's Skull|r
    .complete 1054,1 --Dal Bloodclaw's Skull (1)
    .mob Dal Bloodclaw
step
    .goto 1440/1,-411.75,2767.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raene Wolfrunner|r
    .turnin 1054 >>Turn in Culling the Threat
    .target Raene Wolfrunner
step
    .goto 1440/1,-299.30,2795.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shindrell Swiftfire|r
    .accept 4581 >>Accept Kayneth Stillwind
    .target Shindrell Swiftfire
step
    .goto 1440/1,-1387.47,2896.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shael'dryn|r
    .accept 1026 >>Accept Raene's Cleansing
    .target Shael'dryn
    .isQuestTurnedIn 1024 --any of: Raene's Cleansing
step
    #loop
    .goto 1440/1,-1457.83,3327.99,0
    .goto 1440/1,-1457.83,3327.99,40,0
    .goto 1440/1,-1453.79,3349.13,40,0
    .goto 1440/1,-1441.68,3363.35,40,0
    .goto 1440/1,-1475.70,3399.87,40,0
    >>Kill |cRXP_ENEMY_Withered Ancients|r and |cRXP_ENEMY_Crazed Ancients|r. Loot them for |cRXP_LOOT_Wooden Key|r
    .collect 5475,1,1026,1 --Wooden Key (1)
    .mob Withered Ancient
    .mob Crazed Ancient
    .isOnQuest 1026
step
    .goto 1440/1,-1438.22,3312.23
    >>Open the |cRXP_PICK_Worn Chest|r. Loot it for |cRXP_LOOT_Iron Shaft|r
    .complete 1026,1 --Iron Shaft (1)
    .isOnQuest 1026
step
    .goto 1440/1,-3215.51,2954.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kayneth Stillwind|r
    .turnin 4581 >>Turn in Kayneth Stillwind
    .target Kayneth Stillwind
step
    .goto 1440/1,-3276.63,2914.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maseara Autumnmoon|r
    .accept 98417 >>Accept Vengeful Trail
    .target Maseara Autumnmoon
step
    .goto 1440/1,-3276.63,2914.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maseara Autumnmoon|r
    .turnin 98417 >>Turn in Vengeful Trail
    .target Maseara Autumnmoon
    .isQuestComplete 98417
step << Human Paladin/Dwarf Paladin
    .goto 1440/1,-3455.40,1713.23
    >>Click the |cRXP_PICK_Shattered Orb|r
    .accept 78093 >>Accept Return to Delgren
step
    .goto 1440/1,-1387.47,2896.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shael'dryn|r
    .turnin 1026 >>Turn in Raene's Cleansing
    .target Shael'dryn
    .isOnQuest 1026
step << Human Paladin/Dwarf Paladin
    .goto 1440/1,189.13,3185.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Delgren the Purifier|r
    .turnin 78093 >>Turn in Return to Delgren
    .accept 78089 >>Accept Advice From Stormwind
    .target Delgren the Purifier
step
    +|cRXP_WARN_That is all of Ashenvale for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Stormwind City|r: Advice From Stormwind << Human Paladin/Dwarf Paladin
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Vengeful Trail
step
    +|cRXP_WARN_Until level 27, suggested zones|r: |cRXP_FRIENDLY_Wetlands|r (about 0.7 levels of quests, starting around Karl Boran). Then come back to this Ashenvale guide --RouteBuilder:next
step
    .xp 27 >>|cRXP_WARN_The rest of Ashenvale is planned from level 27.|r Come back to this guide then
step
    #label RBSection4_1
    #completewith next
    +|cRXP_WARN_Ashenvale: part 4|r (planned from level 27)
step
    .goto 1440/1,-433.09,2781.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Kimlya|r
    .target Innkeeper Kimlya
    .home >>Set your Hearthstone to Innkeeper Kimlya's inn
step
    .goto 1440/1,-299.30,2795.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shindrell Swiftfire|r
    .turnin 1134 >>Turn in Pridewings of Stonetalon
    .target Shindrell Swiftfire
    .isQuestComplete 1134
step
    .goto 1440/1,418.07,2636.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Melyria Frostshadow|r
    .accept 1022 >>Accept The Howling Vale
    .target Sentinel Melyria Frostshadow
step
    .goto 1440/1,446.90,2622.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Illiyana|r
    .accept 1021 >>Accept Vile Satyr! Dryads in Danger!
    .target Illiyana
step
    .goto 1440/1,189.13,3185.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Delgren the Purifier|r
    .accept 1140 >>Accept The Tower of Althalaxx
    .target Delgren the Purifier
    .isQuestTurnedIn 973 --any of: The Tower of Althalaxx
    .xp <13,1
step
    .goto 1440/1,-1211.59,3168.86
    >>Click the |cRXP_PICK_Tome of Mel'Thandris|r
    .complete 1022,1 --View the Tome of Mel'Thandris
step
    .goto 1440/1,-2817.03,2950.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Anilia|r
    .turnin 1021 >>Turn in Vile Satyr! Dryads in Danger!
    .target Anilia
step
    .goto 1440/1,-3276.63,2914.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maseara Autumnmoon|r
    .turnin 98417 >>Turn in Vengeful Trail
    .target Maseara Autumnmoon
    .isQuestComplete 98417
step
    .goto 1440/1,-3276.63,2914.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maseara Autumnmoon|r
    .accept 98418 >>Accept Shared Fury
    .target Maseara Autumnmoon
step
    .goto 1440/1,-3215.51,2954.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kayneth Stillwind|r
    .accept 1011 >>Accept Forsaken Diseases
    .target Kayneth Stillwind
step
    #loop
    .goto 1440/1,-2890.84,2871.74,0
    .goto 1440/1,-2890.84,2871.74,40,0
    .goto 1440/1,-2845.86,2879.42,40,0
    .goto 1440/1,-2822.22,2847.90,40,0
    .goto 1440/1,-2788.20,2878.27,40,0
    .goto 1440/1,-2802.61,2931.31,40,0
    .goto 1440/1,-2758.21,2947.46,40,0
    .goto 1440/1,-2786.47,3038.55,40,0
    .goto 1440/1,-2817.61,2993.58,40,0
    .goto 1440/1,-2859.13,2922.09,40,0
    >>Kill |cRXP_ENEMY_Xavian Felsworns|r
    >>Kill |cRXP_ENEMY_Xavian Rogues|r
    >>Kill |cRXP_ENEMY_Xavian Hellcallers|r
    .complete 98418,1 --Xavian Felsworn slain (5)
    .complete 98418,3 --Xavian Rogue slain (5)
    .complete 98418,2 --Xavian Hellcaller slain (5)
    .mob Xavian Felsworn
    .mob Xavian Rogue
    .mob Xavian Hellcaller
step
    .goto 1440/1,-1171.80,2089.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Velene Starstrike|r
    .turnin 1017 >>Turn in Mage Summoner
    .target Sentinel Velene Starstrike
    .isQuestComplete 1017
step
    .goto 1440/1,-802.73,1966.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alonso|r
    .turnin 78134 >>Turn in Dragonslayer's Lance
    .target Alonso
    .isOnQuest 78134
step
    .goto 1440/1,-802.73,1966.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alonso|r
    .turnin 78133 >>Turn in Dragonslayer's Shield
    .target Alonso
    .isOnQuest 78133
step
    .goto 1440/1,-802.73,1966.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alonso|r
    .turnin 78132 >>Turn in Dragonslayer's Helm
    .target Alonso
    .isOnQuest 78132
step
    .goto 1440/1,418.07,2636.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Melyria Frostshadow|r
    .turnin 1022 >>Turn in The Howling Vale
    .accept 1037 >>Accept Velinde Starsong
    .target Sentinel Melyria Frostshadow
step
    .goto 1440/1,-1387.47,2896.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shael'dryn|r
    .accept 1027 >>Accept Raene's Cleansing
    .target Shael'dryn
    .isQuestTurnedIn 1026 --any of: Raene's Cleansing
step
    .goto 1440/1,-2642.88,1908.11
    >>Pick up |cRXP_PICK_Bottle of Disease|r from the ground
    .complete 1011,1 --Bottle of Disease (1)
step
    #loop
    .goto 1440/1,-2605.97,1775.11,0
    .goto 1440/1,-2605.97,1775.11,40,0
    .goto 1440/1,-2586.94,1677.87,40,0
    .goto 1440/1,-2548.88,1715.15,40,0
    .goto 1440/1,-2488.33,1718.61,40,0
    .goto 1440/1,-2420.28,1714.38,40,0
    .goto 1440/1,-2342.43,1748.59,40,0
    .goto 1440/1,-2329.17,1824.31,40,0
    .goto 1440/1,-2396.64,1836.23,40,0
    .goto 1440/1,-2481.41,1785.49,40,0
    >>Open the |cRXP_PICK_Rusty Chest|r. Loot it for |cRXP_LOOT_Iron Pommel|r
    .complete 1027,1 --Iron Pommel (1)
    .isOnQuest 1027
step
    .goto 1440/1,-3276.63,2914.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maseara Autumnmoon|r
    .turnin 98418 >>Turn in Shared Fury
    .target Maseara Autumnmoon
step
    .goto 1440/1,-3215.51,2954.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kayneth Stillwind|r
    .turnin 1011 >>Turn in Forsaken Diseases
    .target Kayneth Stillwind
step
    .goto 1440/1,-3005.60,2806.01
    >>Click the |cRXP_PICK_Circle of Imprisonment|r
    .complete 1140,2 --Free the Highborne soul in Satyrnaar
    .isOnQuest 1140
step
    .goto 1440/1,-2141.75,2481.98
    >>Click the |cRXP_PICK_Circle of Imprisonment|r
    .complete 1140,1 --Free the Highborne soul in Night Run
    .isOnQuest 1140
step
    .goto 1440/1,-1387.47,2896.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shael'dryn|r
    .turnin 1027 >>Turn in Raene's Cleansing
    .target Shael'dryn
    .isOnQuest 1027
step
    .goto 1440/1,-1387.47,2896.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shael'dryn|r
    .accept 1028 >>Accept Raene's Cleansing
    .target Shael'dryn
    .isQuestTurnedIn 1027 --any of: Raene's Cleansing
step
    .goto 1440/1,-1549.52,2781.79
    >>Click the |cRXP_PICK_Hidden Shrine|r
    .turnin 1028 >>Turn in Raene's Cleansing
    .isOnQuest 1028
step
    .goto 1440/1,-1549.52,2781.79
    >>Click the |cRXP_PICK_Hidden Shrine|r
    .accept 1055 >>Accept Raene's Cleansing
    .isQuestTurnedIn 1028 --any of: Raene's Cleansing
step
    .goto 1440/1,-1387.47,2896.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shael'dryn|r
    .turnin 1055 >>Turn in Raene's Cleansing
    .target Shael'dryn
    .isOnQuest 1055
step
    .goto 1440/1,-1387.47,2896.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shael'dryn|r
    .accept 1029 >>Accept Raene's Cleansing
    .target Shael'dryn
    .isQuestTurnedIn 1055 --any of: Raene's Cleansing
step
    #completewith next
    .hs >>Hearth to Innkeeper Kimlya's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1440/1,-411.75,2767.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raene Wolfrunner|r
    .turnin 1029 >>Turn in Raene's Cleansing
    .target Raene Wolfrunner
    .isOnQuest 1029
step
    .goto 1440/1,-411.75,2767.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raene Wolfrunner|r
    .accept 1030 >>Accept Raene's Cleansing
    .target Raene Wolfrunner
    .isQuestTurnedIn 1029 --any of: Raene's Cleansing
step
    .xp 27 >>Grind to level 27 (Slowing the Orc Advance needs it)
step
    .goto 1440/1,-1153.35,2094.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shandrina|r
    .accept 86757 >>Accept Slowing the Orc Advance
    .target Shandrina
step
    .goto 1440/1,-1231.77,1787.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krolg|r
    .turnin 1030 >>Turn in Raene's Cleansing
    .target Krolg
    .isOnQuest 1030
step
    #loop
    .goto 1440/1,-2296.30,1506.05,0
    .goto 1440/1,-2296.30,1506.05,40,0
    .goto 1440/1,-2319.94,1428.79,40,0
    .goto 1440/1,-2388.57,1453.01,40,0
    .goto 1440/1,-2387.41,1520.27,40,0
    .goto 1440/1,-2474.49,1522.19,40,0
    .goto 1440/1,-2505.05,1581.00,40,0
    .goto 1440/1,-2462.38,1596.76,40,0
    .goto 1440/1,-2435.28,1579.85,40,0
    .goto 1440/1,-2422.01,1629.44,40,0
    >>Kill |cRXP_ENEMY_Horde Scouts|r. Loot them for |cRXP_LOOT_Curved Orcish Dagger|r
    >>Kill |cRXP_ENEMY_Horde Grunts|r. Loot them for |cRXP_LOOT_Jagged Orcish Sword|r
    .complete 86757,2 --Curved Orcish Dagger (4)
    .complete 86757,1 --Jagged Orcish Sword (6)
    .mob Horde Scout
    .mob Horde Grunt
step
    .goto 1440/1,-1930.69,1922.71
    >>Click the |cRXP_PICK_Gleaming Crescent Pendant|r
    .accept 98027 >>Accept Gleaming Crescent Necklace
step
    .goto 1440/1,-1153.35,2094.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shandrina|r
    .turnin 86757 >>Turn in Slowing the Orc Advance
    .target Shandrina
step
    .goto 1440/1,-411.75,2751.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maliynn|r
    .turnin 98027 >>Turn in Gleaming Crescent Necklace
    .target Maliynn
step
    .goto 1440/1,189.13,3185.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Delgren the Purifier|r
    .turnin 1140 >>Turn in The Tower of Althalaxx
    .target Delgren the Purifier
    .isOnQuest 1140
step
    .goto 1440/1,189.13,3185.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Delgren the Purifier|r
    .accept 1167 >>Accept The Tower of Althalaxx
    .target Delgren the Purifier
    .isQuestTurnedIn 1140 --any of: The Tower of Althalaxx
    .xp <13,1
step
    +|cRXP_WARN_That is all of Ashenvale for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Darkshore|r: The Tower of Althalaxx
    >>|cRXP_FRIENDLY_Darnassus|r: Velinde Starsong
step
    .xp 30 >>|cRXP_WARN_The rest of Ashenvale is planned from level 30.|r Come back to this guide then
step
    #label RBSection5_1
    #completewith next
    +|cRXP_WARN_Ashenvale: part 5|r (planned from level 30)
step
    .goto 1440/1,-802.73,1966.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alonso|r
    .turnin 78134 >>Turn in Dragonslayer's Lance
    .target Alonso
    .isOnQuest 78134
step
    .goto 1440/1,-802.73,1966.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alonso|r
    .turnin 78133 >>Turn in Dragonslayer's Shield
    .target Alonso
    .isOnQuest 78133
step
    .goto 1440/1,-802.73,1966.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alonso|r
    .turnin 78132 >>Turn in Dragonslayer's Helm
    .target Alonso
    .isOnQuest 78132
step
    .goto 1440/1,-299.30,2795.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shindrell Swiftfire|r
    .turnin 1134 >>Turn in Pridewings of Stonetalon
    .target Shindrell Swiftfire
    .isQuestComplete 1134
step
    .goto 1440/1,-455.00,2682.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pelturas Whitemoon|r
    .accept 1035 >>Accept Fallen Sky Lake
    .target Pelturas Whitemoon
    .isQuestTurnedIn 1034 --any of: The Ruins of Stardust
step
    .goto 1440/1,-1171.80,2089.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sentinel Velene Starstrike|r
    .turnin 1017 >>Turn in Mage Summoner
    .target Sentinel Velene Starstrike
    .isQuestComplete 1017
step
    .goto 1440/1,-2144.06,1514.51
    >>Kill |cRXP_ENEMY_Shadethicket Oracle|r and loot |cRXP_LOOT_Fallen Moonstone|r
    .complete 1035,1 --Fallen Moonstone (1)
    .mob Shadethicket Oracle
    .isOnQuest 1035
step
    .goto 1440/1,-455.00,2682.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pelturas Whitemoon|r
    .turnin 1035 >>Turn in Fallen Sky Lake
    .target Pelturas Whitemoon
    .isOnQuest 1035
step
    .goto 1440/1,-2817.03,2950.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Anilia|r
    .accept 1031 >>Accept The Branch of Cenarius
    .target Anilia
    .isQuestTurnedIn 1021 --any of: Vile Satyr! Dryads in Danger!
step
    .goto 1440/1,-2797.42,3042.40
    >>Kill |cRXP_ENEMY_Geltharis|r and loot |cRXP_LOOT_Branch of Cenarius|r
    .complete 1031,1 --Branch of Cenarius (1)
    .mob Geltharis
    .isOnQuest 1031
step
    .goto 1440/1,446.90,2622.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Illiyana|r
    .turnin 1031 >>Turn in The Branch of Cenarius
    .target Illiyana
    .isOnQuest 1031
step
    .goto 1440/1,446.90,2622.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Illiyana|r
    .accept 1032 >>Accept Satyr Slaying!
    .target Illiyana
    .isQuestTurnedIn 1031 --any of: The Branch of Cenarius
step
    #loop
    .goto 1440/1,-2822.22,2847.90,0
    .goto 1440/1,-2822.22,2847.90,40,0
    .goto 1440/1,-2890.84,2871.74,40,0
    .goto 1440/1,-3013.67,2820.61,40,0
    .goto 1440/1,-3084.60,2755.27,40,0
    .goto 1440/1,-3021.17,2668.79,40,0
    .goto 1440/1,-2949.66,2717.22,40,0
    .goto 1440/1,-2953.12,2762.96,40,0
    .goto 1440/1,-2911.60,2789.09,40,0
    .goto 1440/1,-2886.81,2746.43,40,0
    >>Kill |cRXP_ENEMY_Xavian Rogues|r, |cRXP_ENEMY_Xavian Betrayers|r, |cRXP_ENEMY_Xavian Felsworns|r and |cRXP_ENEMY_Xavian Hellcallers|r. Loot them for |cRXP_LOOT_Satyr Horns|r
    .complete 1032,1 --Satyr Horns (16)
    .mob Xavian Rogue
    .mob Xavian Betrayer
    .mob Xavian Felsworn
    .mob Xavian Hellcaller
    .isOnQuest 1032
step
    .goto 1440/1,-3215.51,2954.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kayneth Stillwind|r
    .accept 1012 >>Accept Insane Druids
    .target Kayneth Stillwind
    .isQuestTurnedIn 1011 --any of: Forsaken Diseases
step
    .goto 1440/1,-3276.63,2914.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maseara Autumnmoon|r
    .turnin 98417 >>Turn in Vengeful Trail
    .target Maseara Autumnmoon
    .isQuestComplete 98417
step
    .goto 1440/1,-2795.69,1876.97
    >>Kill |cRXP_ENEMY_Uthil Mooncall|r
    .complete 1012,2 --Uthil Mooncall slain (1)
    .mob Uthil Mooncall
    .isOnQuest 1012
step
    .goto 1440/1,-2750.71,1828.93
    >>Kill |cRXP_ENEMY_Taneel Darkwood|r
    .complete 1012,1 --Taneel Darkwood slain (1)
    .mob Taneel Darkwood
    .isOnQuest 1012
step
    .goto 1440/1,-2627.88,1820.85
    >>Kill |cRXP_ENEMY_Mavoris Cloudsbreak|r
    .complete 1012,3 --Mavoris Cloudsbreak slain (1)
    .mob Mavoris Cloudsbreak
    .isOnQuest 1012
step
    .goto 1440/1,-3215.51,2954.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kayneth Stillwind|r
    .turnin 1012 >>Turn in Insane Druids
    .target Kayneth Stillwind
    .isOnQuest 1012
step
    .goto 1440/1,-1231.77,1787.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krolg|r
    .accept 1045 >>Accept Raene's Cleansing
    .target Krolg
    .isQuestTurnedIn 1030 --any of: Raene's Cleansing
step
    #loop
    .goto 1440/1,-1467.63,1753.20,0
    .goto 1440/1,-1467.63,1753.20,40,0
    .goto 1440/1,-1493.00,1751.67,40,0
    .goto 1440/1,-1520.68,1773.96,40,0
    .goto 1440/1,-1525.87,1743.59,40,0
    .goto 1440/1,-1463.59,1643.27,40,0
    .goto 1440/1,-1470.51,1623.67,40,0
    .goto 1440/1,-1437.07,1614.06,40,0
    .goto 1440/1,-1457.83,1686.71,40,0
    >>Kill |cRXP_ENEMY_Bloodtooth Guards|r
    .complete 1045,2 --Bloodtooth Guard slain (4)
    .mob Bloodtooth Guard
    .isOnQuest 1045
step
    .goto 1440/1,-1457.25,1612.52
    >>Kill |cRXP_ENEMY_Ran Bloodtooths|r
    .complete 1045,1 --Ran Bloodtooth slain (4)
    .mob Ran Bloodtooth
    .isOnQuest 1045
step
    .goto 1440/1,-1231.77,1787.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krolg|r
    .turnin 1045 >>Turn in Raene's Cleansing
    .target Krolg
    .isOnQuest 1045
step
    .goto 1440/1,-1231.77,1787.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krolg|r
    .accept 1046 >>Accept Raene's Cleansing
    .target Krolg
    .isQuestTurnedIn 1045 --any of: Raene's Cleansing
step
    .goto 1440/1,-1457.25,1612.52
    >>Kill |cRXP_ENEMY_Ran Bloodtooth|r and loot |cRXP_LOOT_Ran Bloodtooth's Skull|r
    .complete 1046,1 --Ran Bloodtooth's Skull (1)
    .mob Ran Bloodtooth
    .isOnQuest 1046
step
    .goto 1440/1,446.90,2622.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Illiyana|r
    .turnin 1032 >>Turn in Satyr Slaying!
    .target Illiyana
    .isOnQuest 1032
step
    .goto 1440/1,-411.75,2767.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raene Wolfrunner|r
    .turnin 1046 >>Turn in Raene's Cleansing
    .target Raene Wolfrunner
    .isQuestComplete 1046
step
    +|cRXP_WARN_End of the Ashenvale route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Raene's Cleansing
]])
