-- 19-30 Ashenvale: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 4 parts with a level check between them (from level 19, 22, 25, 32).
-- Edit zones/Ashenvale.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#name 19-30 Ashenvale

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
    .goto 1440/1,-2554.65,2310.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senani Thunderheart|r
    .turnin 742 >>Turn in The Ashenvale Hunt
    .target Senani Thunderheart
    .isOnQuest 742
step
    .goto 1440/1,-2554.65,2310.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senani Thunderheart|r
    .turnin 235 >>Turn in The Ashenvale Hunt
    .target Senani Thunderheart
    .isOnQuest 235
step
    .goto 1440/1,-2554.65,2310.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senani Thunderheart|r
    .turnin 6382 >>Turn in The Ashenvale Hunt
    .target Senani Thunderheart
    .isOnQuest 6382
step
    .goto 1440/1,-2520.05,2305.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vhulgra|r
    .fp Splintertree Post >> Get the Splintertree Post flight path
    .target Vhulgra
step << Hunter
    .goto 1440/1,-2520.05,2305.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vhulgra|r
    .fp Splintertree Post >> Get the Splintertree Post flight path
    .target Vhulgra
step
    .goto 1440/1,-631.46,2309.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Va'xug Firefure|r
    .accept 98252 >>Accept A Void Path
    .target Va'xug Firefure
step
    #loop
    .goto 1440/1,-504.60,2437.78,0
    .goto 1440/1,-504.60,2437.78,40,0
    .goto 1440/1,-544.96,2447.39,40,0
    .goto 1440/1,-738.72,2481.21,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eye of Kilrogg|r. |cRXP_WARN_This NPC walks a patrol route|r
    .turnin 98252 >>Turn in A Void Path
    .unitscan Eye of Kilrogg
step
    .goto 1440/1,994.16,3373.730
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Andruk|r
    .fp Zoram'gar Outpost >> Get the Zoram'gar Outpost flight path
    .target Andruk
step
    .goto 1440/1,1025.88,3331.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marukai|r
    .accept 6442 >>Accept Naga at the Zoram Strand
    .target Marukai
step
    #loop
    .goto 1440/1,1095.65,3529.79,0
    .goto 1440/1,1095.65,3529.79,40,0
    .goto 1440/1,954.37,3587.44,40,0
    .goto 1440/1,1017.23,3652.79,40,0
    .goto 1440/1,1077.78,3630.11,40,0
    .goto 1440/1,1097.96,3688.53,40,0
    .goto 1440/1,1014.34,3754.64,40,0
    .goto 1440/1,1082.39,3743.50,40,0
    .goto 1440/1,1154.47,3723.13,40,0
    .goto 1440/1,1215.60,3586.29,40,0
    >>Kill |cRXP_ENEMY_Wrathtail Myrmidons|r, |cRXP_ENEMY_Wrathtail Razortails|r, |cRXP_ENEMY_Wrathtail Wave Riders|r and |cRXP_ENEMY_Wrathtail Sea Witches|r. Loot them for |cRXP_LOOT_Wrathtail Head|r
    .complete 6442,1 --Wrathtail Head (20)
    .mob Wrathtail Myrmidon
    .mob Wrathtail Razortail
    .mob Wrathtail Wave Rider
    .mob Wrathtail Sea Witch
step
    .goto 1440/1,1025.88,3331.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marukai|r
    .turnin 6442 >>Turn in Naga at the Zoram Strand
    .target Marukai
step
    .xp 22 >>|cRXP_WARN_The rest of Ashenvale is planned from level 22.|r Come back to this guide then
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
    .goto 1440/1,-2400.68,2054.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kuray'bin|r
    .accept 6503 >>Accept Ashenvale Outrunners
    .target Kuray'bin
step
    #loop
    .goto 1440/1,-2458.34,1971.14,0
    .goto 1440/1,-2458.34,1971.14,40,0
    .goto 1440/1,-2502.17,1975.37,40,0
    .goto 1440/1,-2580.60,2003.43,40,0
    .goto 1440/1,-2635.96,1960.77,40,0
    .goto 1440/1,-2689.59,2018.81,40,0
    .goto 1440/1,-2704.00,1954.62,40,0
    .goto 1440/1,-2671.71,1928.86,40,0
    .goto 1440/1,-2686.13,1863.14,40,0
    .goto 1440/1,-2546.57,1951.93,40,0
    >>Kill |cRXP_ENEMY_Ashenvale Outrunners|r
    .complete 6503,1 --Ashenvale Outrunner slain (9)
    .mob Ashenvale Outrunner
step
    .goto 1440/1,-2554.65,2310.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senani Thunderheart|r
    .accept 6383 >>Accept The Ashenvale Hunt
    .target Senani Thunderheart
step
    .goto 1440/1,-2554.65,2310.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senani Thunderheart|r
    >>|cRXP_WARN_The database has no objectives for The Ashenvale Hunt. Skip this step if the quest is not finished|r
    .turnin 6383 >>Turn in The Ashenvale Hunt
    .target Senani Thunderheart
    .isOnQuest 6383
step << !Hunter
    .goto 1440/1,-2520.05,2305.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vhulgra|r
    .fp Splintertree Post >> Get the Splintertree Post flight path
    .target Vhulgra
step << Hunter
    .goto 1440/1,-2066.21,2187.93,0
    .goto 1440/1,-2285.92,2195.62,0
    .goto 1440/1,-2285.92,2195.62,50,0
    .goto 1440/1,-2255.36,2346.29,50,0
    .goto 1440/1,-2141.75,2258.66,50,0
    .goto 1440/1,-2066.21,2187.93,50,0
    .train 16830 >>|cRXP_WARN_Cast|r |T132164:0|t[Tame Beast] |cRXP_WARN_on a |cRXP_ENEMY_Elder Ashenvale Bear|r. Attack mobs with it to learn|r |T132140:0|t[Claw (Rank 4)]
    .train 17264 >>|cRXP_WARN_Cast|r |T132164:0|t[Tame Beast] |cRXP_WARN_on a |cRXP_ENEMY_Ghostpaw Alpha|r. Attack mobs with it to learn|r |T132278:0|t[Bite (Rank 4)]
    .xp <27,1
step << Hunter
    .goto 1440/1,-2066.21,2187.93,0
    .goto 1440/1,-2255.36,2346.29,50,0
    .goto 1440/1,-2141.75,2258.66,50,0
    .goto 1440/1,-2066.21,2187.93,50,0
    .train 16830 >>|cRXP_WARN_Cast|r |T132164:0|t[Tame Beast] |cRXP_WARN_on a |cRXP_ENEMY_Elder Ashenvale Bear|r. Attack mobs with it to learn|r |T132140:0|t[Claw (Rank 4)]
    .xp >26,1
step
    .goto 1440/1,-592.83,2166.41
    >>Kill |cRXP_ENEMY_Ursangous|r and loot |cRXP_LOOT_Ursangous's Paw|r. Use it to start the quest
    .collect 16303,1,23 --Ursangous's Paw (1)
    .accept 23 >>Accept Ursangous's Paw
    .use 16303
    .mob Ursangous
    .isQuestTurnedIn 6383 --any of: The Ashenvale Hunt
    .xp <20,1
step
    .goto 1440/1,1013.77,3345.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Karang Amakkar|r
    .accept 216 >>Accept Between a Rock and a Thistlefur
    .target Karang Amakkar
step
    .goto 1440/1,1028.18,3333.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mitsuwa|r
    .accept 6462 >>Accept Troll Charm
    .target Mitsuwa
step << Paladin
    .goto 1440/1,1014.92,3346.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ulric Frostveil|r
    .accept 95042 >>Accept Seeking the Kor Gem
    .target Ulric Frostveil
step << Paladin
    .goto 1440/1,918.62,4209.36
    >>Kill |cRXP_ENEMY_Blackfathom Tide Priestess|r and loot |cRXP_LOOT_Corrupted Kor Gem|r
    .complete 95042,1 --Corrupted Kor Gem (1)
    .mob Blackfathom Tide Priestess
step
    #loop
    .goto 1440/1,-617.62,3481.74,0
    .goto 1440/1,-617.62,3481.74,40,0
    .goto 1440/1,-661.45,3458.29,40,0
    .goto 1440/1,-656.26,3379.88,40,0
    .goto 1440/1,-705.85,3347.59,40,0
    .goto 1440/1,-702.97,3300.70,40,0
    .goto 1440/1,-633.19,3349.13,40,0
    .goto 1440/1,-599.75,3359.51,40,0
    .goto 1440/1,-604.36,3401.40,40,0
    .goto 1440/1,-636.08,3432.54,40,0
    >>Loot the |cRXP_PICK_Troll Chests|r for |cRXP_LOOT_Troll Charm|r
    .complete 6462,1 --Troll Charm (8)
step
    #loop
    .goto 1440/1,-271.62,3178.85,0
    .goto 1440/1,-271.62,3178.85,40,0
    .goto 1440/1,-254.32,3179.62,40,0
    .goto 1440/1,-86.51,3009.73,40,0
    .goto 1440/1,-121.69,2984.74,40,0
    .goto 1440/1,-178.78,3029.71,40,0
    .goto 1440/1,-246.25,3145.79,40,0
    >>Kill |cRXP_ENEMY_Thistlefur Shamans|r
    .complete 216,2 --Thistlefur Shaman slain (8)
    .mob Thistlefur Shaman
step
    #loop
    .goto 1440/1,-416.94,3252.27,0
    .goto 1440/1,-416.94,3252.27,40,0
    .goto 1440/1,-412.91,3286.86,40,0
    .goto 1440/1,-420.40,3318.38,40,0
    .goto 1440/1,-355.24,3411.01,40,0
    .goto 1440/1,-363.31,3442.53,40,0
    .goto 1440/1,-415.79,3415.63,40,0
    .goto 1440/1,-457.89,3355.66,40,0
    .goto 1440/1,-487.30,3346.05,40,0
    >>Kill |cRXP_ENEMY_Thistlefur Avengers|r
    .complete 216,1 --Thistlefur Avenger slain (8)
    .mob Thistlefur Avenger
step
    .goto 1440/1,-1615.83,2518.49
    >>Kill |cRXP_ENEMY_Shadumbra|r and loot |cRXP_LOOT_Shadumbra's Head|r. Use it to start the quest
    .collect 16304,1,24 --Shadumbra's Head (1)
    .accept 24 >>Accept Shadumbra's Head
    .use 16304
    .mob Shadumbra
    .isQuestTurnedIn 6383 --any of: The Ashenvale Hunt
    .xp <20,1
step
    .goto 1440/1,-2400.68,2054.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kuray'bin|r
    .turnin 6503 >>Turn in Ashenvale Outrunners
    .target Kuray'bin
step
    .goto 1440/1,-2623.85,1979.99
    >>Kill |cRXP_ENEMY_Sharptalon|r and loot |cRXP_LOOT_Sharptalon's Claw|r. Use it to start the quest
    .collect 16305,1,2 --Sharptalon's Claw (1)
    .accept 2 >>Accept Sharptalon's Claw
    .use 16305
    .mob Sharptalon
    .isQuestTurnedIn 6383 --any of: The Ashenvale Hunt
    .xp <20,1
step
    .goto 1440/1,-2554.65,2310.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senani Thunderheart|r
    .turnin 2 >>Turn in Sharptalon's Claw
    .target Senani Thunderheart
    .isOnQuest 2
step
    .goto 1440/1,-2554.65,2310.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senani Thunderheart|r
    .turnin 24 >>Turn in Shadumbra's Head
    .target Senani Thunderheart
    .isOnQuest 24
step
    .goto 1440/1,-2554.65,2310.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senani Thunderheart|r
    .turnin 23 >>Turn in Ursangous's Paw
    .target Senani Thunderheart
    .isOnQuest 23
step
    .goto 1440/1,-2554.65,2310.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senani Thunderheart|r
    .accept 247 >>Accept The Hunt Completed
    .target Senani Thunderheart
    .isQuestTurnedIn 2 --Sharptalon's Claw
    .isQuestTurnedIn 23 --Ursangous's Paw
    .isQuestTurnedIn 24 --Shadumbra's Head
    .xp <20,1
step
    .goto 1440/1,-2554.65,2310.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senani Thunderheart|r
    .turnin 247 >>Turn in The Hunt Completed
    .target Senani Thunderheart
    .isOnQuest 247
step
    .goto 1440/1,1013.77,3345.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Karang Amakkar|r
    .turnin 216 >>Turn in Between a Rock and a Thistlefur
    .target Karang Amakkar
step << Paladin
    .goto 1440/1,1014.92,3346.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ulric Frostveil|r
    .turnin 95042 >>Turn in Seeking the Kor Gem
    .target Ulric Frostveil
step
    .goto 1440/1,1028.18,3333.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mitsuwa|r
    .turnin 6462 >>Turn in Troll Charm
    .target Mitsuwa
step
    .goto 1440/1,-631.46,2309.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Va'xug Firefure|r
    .accept 98251 >>Accept Never Coming Back
    .target Va'xug Firefure
step
    #loop
    .goto 1440/1,-580.14,2280.95,0
    .goto 1440/1,-580.14,2280.95,40,0
    .goto 1440/1,-586.48,2239.44,40,0
    .goto 1440/1,-643.57,2130.28,40,0
    .goto 1440/1,-664.91,2112.98,40,0
    .goto 1440/1,-689.71,2100.29,40,0
    .goto 1440/1,-595.13,2090.30,40,0
    .goto 1440/1,-584.75,2166.41,40,0
    .goto 1440/1,-540.35,2207.54,40,0
    .goto 1440/1,-507.48,2260.19,40,0
    >>Kill |cRXP_ENEMY_Ashenvale Bears|r
    .complete 98251,2 --Ashenvale Bear slain (6)
    .mob Ashenvale Bear
step
    #loop
    .goto 1440/1,-779.67,2205.61,0
    .goto 1440/1,-779.67,2205.61,40,0
    .goto 1440/1,-812.54,2235.98,40,0
    .goto 1440/1,-916.91,2194.08,40,0
    .goto 1440/1,-773.32,2039.95,40,0
    .goto 1440/1,-728.34,1980.75,40,0
    .goto 1440/1,-693.74,1940.78,40,0
    >>Kill |cRXP_ENEMY_Shadowhorn Stags|r
    .complete 98251,1 --Shadowhorn Stag slain (6)
    .mob Shadowhorn Stag
step
    .goto 1440/1,-631.46,2309.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Va'xug Firefure|r
    .turnin 98251 >>Turn in Never Coming Back
    .target Va'xug Firefure
step
    .xp 25 >>|cRXP_WARN_The rest of Ashenvale is planned from level 25.|r Come back to this guide then
step
    .goto 1440/1,-2554.65,2310.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senani Thunderheart|r
    .turnin 6383 >>Turn in The Ashenvale Hunt
    .target Senani Thunderheart
    .isOnQuest 6383
step
    .goto 1440/1,-2513.13,2309.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pixel|r
    .accept 6441 >>Accept Satyr Horns
    .target Pixel
step
    .goto 1440/1,-2337.24,1937.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gurda Ragescar|r
    .accept 6504 >>Accept The Lost Pages
    .target Gurda Ragescar
step
    .goto 1440/1,-2337.24,1937.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gurda Ragescar|r
    .turnin 6504 >>Turn in The Lost Pages
    .target Gurda Ragescar
    .isQuestComplete 6504
step
    #loop
    .goto 1440/1,-2148.10,2475.44,0
    .goto 1440/1,-2148.10,2475.44,40,0
    .goto 1440/1,-2116.96,2505.43,40,0
    .goto 1440/1,-2114.07,2551.94,40,0
    .goto 1440/1,-2114.07,2619.59,40,0
    .goto 1440/1,-2152.13,2681.85,40,0
    .goto 1440/1,-2276.12,2621.89,40,0
    .goto 1440/1,-2242.67,2579.61,40,0
    .goto 1440/1,-2181.54,2573.08,40,0
    .goto 1440/1,-2182.70,2536.18,40,0
    >>Kill |cRXP_ENEMY_Xavian Rogues|r, |cRXP_ENEMY_Xavian Betrayers|r, |cRXP_ENEMY_Xavian Felsworns|r and |cRXP_ENEMY_Xavian Hellcallers|r. Loot them for |cRXP_LOOT_Satyr Horns|r
    .complete 6441,1 --Satyr Horns (16)
    .mob Xavian Rogue
    .mob Xavian Betrayer
    .mob Xavian Felsworn
    .mob Xavian Hellcaller
step
    .goto 1440/1,1013.77,3345.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Karang Amakkar|r
    .accept 6621 >>Accept King of the Foulweald
    .target Karang Amakkar
step
    #loop
    .goto 1440/1,580.69,3076.61,0
    .goto 1440/1,580.69,3076.61,40,0
    .goto 1440/1,518.99,2981.67,40,0
    .goto 1440/1,483.23,2982.05,40,0
    .goto 1440/1,518.99,3010.49,40,0
    .goto 1440/1,512.64,3050.85,40,0
    .goto 1440/1,513.80,3108.51,40,0
    >>Kill |cRXP_ENEMY_Saltspittle Warrior|r and loot |cRXP_LOOT_Shredder Operating Manual - Page 6|r
    >>Kill |cRXP_ENEMY_Saltspittle Oracle|r and loot |cRXP_LOOT_Shredder Operating Manual - Page 11|r
    .collect 16650,1,6504,1 --Shredder Operating Manual - Page 6 (1)
    .collect 16655,1,6504,1 --Shredder Operating Manual - Page 11 (1)
    .mob Saltspittle Warrior
    .mob Saltspittle Oracle
step
    .goto 1440/1,-802.73,1966.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alonso|r
    .turnin 78134 >>Turn in Dragonslayer's Lance
    .target Alonso
    .isOnQuest 78134
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
    .goto 1440/1,-952.67,1982.29
    >>Kill |cRXP_ENEMY_Tideress|r and loot |cRXP_LOOT_Befouled Water Globe|r. Use it to start the quest
    .collect 16408,1,1918 --Befouled Water Globe (1)
    .accept 1918 >>Accept The Befouled Element
    .use 16408
    .mob Tideress
step
    .goto 1440/1,-1558.17,2232.14
    >>Kill |cRXP_ENEMY_Chief Murgut|r and loot |cRXP_LOOT_Murgut's Totem|r. It can also be picked up from |cRXP_PICK_Murgut's Totem Basket|r on the ground
    .complete 6621,1 --Murgut's Totem (1)
    .mob Chief Murgut
step
    .goto 1440/1,-2513.13,2309.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pixel|r
    .turnin 6441 >>Turn in Satyr Horns
    .target Pixel
step
    .goto 1440/1,-2548.30,2366.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mastok Wrilehiss|r
    .turnin 1918 >>Turn in The Befouled Element
    .accept 824 >>Accept Je'neu of the Earthen Ring
    .target Mastok Wrilehiss
step
    .goto 1440/1,1013.77,3345.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Karang Amakkar|r
    .turnin 6621 >>Turn in King of the Foulweald
    .target Karang Amakkar
step
    .goto 1440/1,1033.37,3354.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Je'neu Sancrea|r
    .turnin 824 >>Turn in Je'neu of the Earthen Ring
    .target Je'neu Sancrea
step
    +|cRXP_WARN_That is all of Ashenvale for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: The Lost Pages
step
    .xp 32 >>|cRXP_WARN_The rest of Ashenvale is planned from level 32.|r Come back to this guide then
step
    .goto 1440/1,-2417.40,2073.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Locke Okarr|r
    .accept 6571 >>Accept Warsong Supplies
    .target Locke Okarr
step
    .goto 1440/1,-2417.40,2073.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Locke Okarr|r
    .turnin 6571 >>Turn in Warsong Supplies
    .target Locke Okarr
    .isQuestComplete 6571
step
    .goto 1440/1,-2513.13,2309.78
    >>Kill |cRXP_ENEMY_Pixel|r and loot |cRXP_LOOT_Warsong Saw Blades|r
    .complete 6571,1 --Warsong Saw Blades (1)
    .mob Pixel
step
    .goto 1440/1,-2165.40,2493.89
    >>Pick up |cRXP_PICK_Warsong Oil|r from the ground
    .complete 6571,3 --Warsong Oil (1)
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
    #loop
    .goto 1440/1,483.23,2982.05,0
    .goto 1440/1,483.23,2982.05,40,0
    .goto 1440/1,518.99,2981.67,40,0
    .goto 1440/1,518.99,3010.49,40,0
    .goto 1440/1,512.64,3050.85,40,0
    .goto 1440/1,513.80,3108.51,40,0
    >>Kill |cRXP_ENEMY_Saltspittle Oracle|r and loot |cRXP_LOOT_Shredder Operating Manual - Page 11|r
    .collect 16655,1,6504,1 --Shredder Operating Manual - Page 11 (1)
    .mob Saltspittle Oracle
    .isOnQuest 6504
step
    .goto 1440/1,472.85,2997.81
    >>Kill |cRXP_ENEMY_Saltspittle Warrior|r and loot |cRXP_LOOT_Shredder Operating Manual - Page 6|r
    .collect 16650,1,6504,1 --Shredder Operating Manual - Page 6 (1)
    .mob Saltspittle Warrior
    .isOnQuest 6504
step
    #loop
    .goto 1440/1,-1384.59,2331.30,0
    .goto 1440/1,-1384.59,2331.30,40,0
    .goto 1440/1,-1401.89,2288.25,40,0
    .goto 1440/1,-1386.90,2251.35,40,0
    .goto 1440/1,-1351.72,2222.14,40,0
    .goto 1440/1,-1411.69,2181.01,40,0
    .goto 1440/1,-1485.51,2254.04,40,0
    .goto 1440/1,-1544.90,2288.64,40,0
    .goto 1440/1,-1451.48,2309.01,40,0
    .goto 1440/1,-1436.49,2274.03,40,0
    >>Kill |cRXP_ENEMY_Foulweald Warriors|r, |cRXP_ENEMY_Foulweald Pathfinders|r, |cRXP_ENEMY_Foulweald Den Watchers|r and |cRXP_ENEMY_Foulweald Shamans|r. Loot them for |cRXP_LOOT_Logging Rope|r
    .complete 6571,4 --Logging Rope (1)
    .mob Foulweald Warrior
    .mob Foulweald Pathfinder
    .mob Foulweald Den Watcher
    .mob Foulweald Shaman
step
    .goto 1440/1,-2554.65,2310.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Senani Thunderheart|r
    .turnin 6383 >>Turn in The Ashenvale Hunt
    .target Senani Thunderheart
    .isOnQuest 6383
step
    .goto 1440/1,-2337.24,1937.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gurda Ragescar|r
    .turnin 6504 >>Turn in The Lost Pages
    .target Gurda Ragescar
    .isQuestComplete 6504
step
    +|cRXP_WARN_End of the Ashenvale route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Stranglethorn Vale and back here|r: Warsong Supplies
]])
