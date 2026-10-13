-- 55-60 Eastern Plaguelands: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 2 parts with a level check between them (from level 55, 58).
-- Edit zones/Eastern Plaguelands.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#name 55-60 Eastern Plaguelands

step
    .goto 1423/0,-3596.35,1456.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pamela Redpath|r
    .turnin 5142 >>Turn in Little Pamela
    .target Pamela Redpath
    .isOnQuest 5142
step
    .goto 1423/0,-3596.35,1456.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pamela Redpath|r
    .accept 5149 >>Accept Pamela's Doll
    .target Pamela Redpath
step
    #completewith Along2
    >>As you go: Pick up |cRXP_PICK_Pamela's Doll's Right Side|r from the ground. Pick up |cRXP_PICK_Pamela's Doll's Head|r from the ground. |cRXP_WARN_Anything left is finished later|r
    .collect 12888,1,5149,1 --Pamela's Doll's Right Side (1)
    .collect 12886,1,5149,1 --Pamela's Doll's Head (1)
step
    #label Along2
    .goto 1423/0,-3663.89,1423.56
    >>Pick up |cRXP_PICK_Pamela's Doll's Left Side|r from the ground
    .collect 12887,1,5149,1 --Pamela's Doll's Left Side (1)
step
    .goto 1423/0,-3596.35,1456.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pamela Redpath|r
    .turnin 5149 >>Turn in Pamela's Doll
    .target Pamela Redpath
    .isQuestComplete 5149
step
    .goto 1423/0,-3715.95,1477.17
    >>Pick up |cRXP_PICK_Pamela's Doll's Right Side|r from the ground
    >>Pick up |cRXP_PICK_Pamela's Doll's Head|r from the ground
    .collect 12888,1,5149,1 --Pamela's Doll's Right Side (1)
    .collect 12886,1,5149,1 --Pamela's Doll's Head (1)
step
    .goto 1423/0,-3596.35,1456.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pamela Redpath|r
    .accept 5152 >>Accept Auntie Marlene
    .accept 5241 >>Accept Uncle Carlin
    .target Pamela Redpath
    .isQuestTurnedIn 5149 --any of: Pamela's Doll
    .xp <50,1
step
    .xp 55 >>Grind to level 55 (The Restless Souls needs it)
step
    .goto 1423/0,-5264.70,2151.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Caretaker Alen|r
    .accept 5281 >>Accept The Restless Souls
    .target Caretaker Alen
step
    .goto 1423/0,-5340.84,2257.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carlin Redpath|r
    .turnin 5241 >>Turn in Uncle Carlin
    .target Carlin Redpath
    .isOnQuest 5241
step
    .goto 1423/0,-5768.04,1992.31
    >>Talk to |cRXP_FRIENDLY_Khaelyn|r
    .fp Light's Hope Chapel >> Get the Light's Hope Chapel flight path
    .target Khaelyn Steelwing
step
    .goto 1423/0,-5349.45,2303.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lord Maxwell Tyrosus|r
    .turnin 8859 >>Turn in Secrets of the Colossus - Zora
    .target Lord Maxwell Tyrosus
    .isOnQuest 8859
step
    .goto 1423/0,-5349.02,2307.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Leonid Barthalomew the Revered|r
    .turnin 5462 >>Turn in The Dying, Ras Frostwhisper
    .target Leonid Barthalomew the Revered
    .isOnQuest 5462
step
    .goto 1423/0,-5349.02,2307.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Leonid Barthalomew the Revered|r
    .turnin 5522 >>Turn in Leonid Barthalomew
    .target Leonid Barthalomew the Revered
    .isOnQuest 5522
step
    .goto 1423/0,-3379.52,3367.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Anthion Harmon|r
    .turnin 8929 >>Turn in In Search of Anthion
    .target Anthion Harmon
    .isOnQuest 8929
step
    .goto 1423/0,-2744.97,2929.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Egan|r
    .turnin 5281 >>Turn in The Restless Souls
    .target Egan
step
    .goto 1423/0,-2744.97,2935.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Augustus the Touched|r
    .accept 6164 >>Accept Augustus' Receipt Book
    .target Augustus the Touched
step
    .goto 1423/0,-2860.26,2997.36
    >>Pick up |cRXP_PICK_Augustus' Receipt Book|r from the ground
    .complete 6164,1 --Augustus' Receipt Book (1)
step
    .goto 1423/0,-2744.97,2935.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Augustus the Touched|r
    .turnin 6164 >>Turn in Augustus' Receipt Book
    .target Augustus the Touched
step
    .goto 1423/0,-2478.24,2671.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tirion Fordring|r
    .accept 5542 >>Accept Demon Dogs
    .accept 5543 >>Accept Blood Tinged Skies
    .accept 5544 >>Accept Carrion Grubbage
    .target Tirion Fordring
step
    .goto 1423/0,-2478.24,2671.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tirion Fordring|r
    .accept 5861 >>Accept Find Myranda
    .target Tirion Fordring
    .isQuestTurnedIn 5848 --any of: Of Love and Family
    .xp <52,1
step
    #loop
    .goto 1423/0,-3416.52,2770.89,0
    .goto 1423/0,-3416.52,2770.89,40,0
    .goto 1423/0,-3432.44,2710.69,40,0
    .goto 1423/0,-3457.82,2661.39,40,0
    .goto 1423/0,-3434.59,2634.73,40,0
    >>Kill |cRXP_ENEMY_Carrion Grubs|r and |cRXP_ENEMY_Carrion Devourers|r. Loot them for |cRXP_LOOT_Slab of Carrion Worm Meat|r
    .complete 5544,1 --Slab of Carrion Worm Meat (1)
    .mob Carrion Grub
    .mob Carrion Devourer
step
    .goto 1423/0,-3596.35,1456.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pamela Redpath|r
    .turnin 5601 >>Turn in Sister Pamela
    .target Pamela Redpath
    .isOnQuest 5601
step
    #loop
    .goto 1423/0,-2980.29,1757.81,0
    .goto 1423/0,-2980.29,1757.81,40,0
    .goto 1423/0,-2911.46,1688.15,40,0
    .goto 1423/0,-2849.94,1722.55,40,0
    .goto 1423/0,-2780.67,1766.70,40,0
    .goto 1423/0,-2721.31,1794.51,40,0
    .goto 1423/0,-2766.05,1851.84,40,0
    .goto 1423/0,-2889.95,1887.67,40,0
    .goto 1423/0,-2930.82,1837.79,40,0
    .goto 1423/0,-2889.52,1794.79,40,0
    >>Kill |cRXP_ENEMY_Plaguebats|r
    >>Kill |cRXP_ENEMY_Plaguehound Runts|r
    .complete 5543,1 --Plaguebat slain (30)
    .complete 5542,1 --Plaguehound Runt slain (20)
    .mob Plaguebat
    .mob Plaguehound Runt
step
    #loop
    .goto 1423/0,-4240.37,2306.78,0
    .goto 1423/0,-4240.37,2306.78,40,0
    .goto 1423/0,-4288.98,2312.23,40,0
    .goto 1423/0,-4385.78,2276.97,40,0
    .goto 1423/0,-4443.43,2231.96,40,0
    .goto 1423/0,-4323.83,2284.71,40,0
    >>Kill |cRXP_ENEMY_Plaguehounds|r
    .complete 5542,2 --Plaguehound slain (20)
    .mob Plaguehound
step
    .goto 1423/0,-5337.83,2255.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duke Nicholas Zverenhoff|r
    .accept 5503 >>Accept Argent Dawn Commission
    .turnin 5503 >>Turn in Argent Dawn Commission
    .target Duke Nicholas Zverenhoff
step
    .goto 1423/0,-5337.83,2255.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duke Nicholas Zverenhoff|r
    .turnin 6030 >>Turn in Duke Nicholas Zverenhoff
    .target Duke Nicholas Zverenhoff
    .isOnQuest 6030
step
    .goto 1423/0,-5340.84,2257.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carlin Redpath|r
    .accept 5211 >>Accept Defenders of Darrowshire
    .target Carlin Redpath
step
    .goto 1423/0,-5305.57,2303.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Smokey LaRue|r
    .accept 6026 >>Accept That's Asking A Lot
    .target Smokey LaRue
step
    .goto 1423/0,-5264.70,2151.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Caretaker Alen|r
    .accept 6021 >>Accept Zaeldarr the Outcast
    .target Caretaker Alen
step
    .goto 1423/0,-5672.32,1857.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Caretaker Alen|r
    .vendor >> |cRXP_BUY_Restock on|r |T135661:0|t[Jagged Arrows] |cRXP_BUY_if needed|r << Hunter
    .target Caretaker Alen
step
    .goto 1423/0,-4256.29,3232.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aurora Skycaller|r
    .accept 5247 >>Accept Fragments of the Past
    .target Aurora Skycaller
    .isQuestTurnedIn 5246 --any of: Fragments of the Past
    .xp <53,1
step
    .goto 1423/0,-4256.29,3232.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aurora Skycaller|r
    .accept 5248 >>Accept Tormented By the Past
    .target Aurora Skycaller
    .isQuestTurnedIn 5247 --any of: Fragments of the Past
    .xp <53,1
step
    .goto 1423/0,-4256.29,3232.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aurora Skycaller|r
    .turnin 5245 >>Turn in Troubled Spirits of Kel'Theril
    .target Aurora Skycaller
    .isQuestComplete 5245
step
    .goto 1423/0,-4256.29,3232.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aurora Skycaller|r
    .accept 5246 >>Accept Fragments of the Past
    .target Aurora Skycaller
    .isQuestTurnedIn 5245 --any of: Troubled Spirits of Kel'Theril
    .xp <53,1
step
    .goto 1423/0,-4256.29,3232.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aurora Skycaller|r
    .turnin 5246 >>Turn in Fragments of the Past
    .target Aurora Skycaller
    .isQuestComplete 5246
step
    .goto 1423/0,-4256.29,3232.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aurora Skycaller|r
    .turnin 5247 >>Turn in Fragments of the Past
    .target Aurora Skycaller
    .isQuestComplete 5247
step
    #loop
    .goto 1423/0,-4168.53,2880.97,0
    .goto 1423/0,-4168.53,2880.97,40,0
    .goto 1423/0,-4154.33,2812.75,40,0
    .goto 1423/0,-4128.52,2753.41,40,0
    .goto 1423/0,-4142.28,2725.89,40,0
    .goto 1423/0,-4192.62,2792.39,40,0
    .goto 1423/0,-4267.90,2776.91,40,0
    .goto 1423/0,-4229.19,2805.58,40,0
    >>Kill |cRXP_ENEMY_Frenzied Plaguehounds|r
    .complete 5542,3 --Frenzied Plaguehound slain (5)
    .mob Frenzied Plaguehound
step
    .goto 1423/0,-2478.24,2671.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tirion Fordring|r
    .turnin 5542 >>Turn in Demon Dogs
    .turnin 5543 >>Turn in Blood Tinged Skies
    .turnin 5544 >>Turn in Carrion Grubbage
    .target Tirion Fordring
step
    .goto 1423/0,-2478.24,2671.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tirion Fordring|r
    .accept 5781 >>Accept Of Forgotten Memories
    .target Tirion Fordring
    .isQuestTurnedIn 5742 --any of: Redemption
    .xp <52,1
step
    .goto 1423/0,-3248.74,1609.61
    >>Kill |cRXP_ENEMY_Zaeldarr the Outcast|r and loot |cRXP_LOOT_Zaeldarr's Head|r
    .complete 6021,1 --Zaeldarr's Head (1)
    .mob Zaeldarr the Outcast
step
    .goto 1423/0,-3282.30,1564.03
    >>Kill |cRXP_ENEMY_Mercutio Filthgorger|r and loot |cRXP_LOOT_Taelan's Hammer|r
    .complete 5781,1 --Taelan's Hammer (1)
    .mob Mercutio Filthgorger
    .isOnQuest 5781
step
    .goto 1423/0,-2478.24,2671.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tirion Fordring|r
    .turnin 5781 >>Turn in Of Forgotten Memories
    .target Tirion Fordring
    .isOnQuest 5781
step
    .goto 1423/0,-2478.24,2671.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tirion Fordring|r
    .accept 5845 >>Accept Of Lost Honor
    .target Tirion Fordring
    .isQuestTurnedIn 5781 --any of: Of Forgotten Memories
    .xp <52,1
step
    .goto 1423/0,-5337.83,2255.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duke Nicholas Zverenhoff|r
    .accept 5264 >>Accept Lord Maxwell Tyrosus
    .target Duke Nicholas Zverenhoff
    .isQuestTurnedIn 5263 --any of: Above and Beyond
    .xp <55,1
step
    .goto 1423/0,-5345.15,2300.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jessica Chambers|r
    .target Jessica Chambers
    .home >>Set your Hearthstone to Jessica Chambers's inn
step
    .goto 1423/0,-5349.45,2303.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lord Maxwell Tyrosus|r
    .turnin 5264 >>Turn in Lord Maxwell Tyrosus
    .target Lord Maxwell Tyrosus
    .isOnQuest 5264
step
    .goto 1423/0,-5349.45,2303.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lord Maxwell Tyrosus|r
    .accept 5265 >>Accept The Argent Hold
    .target Lord Maxwell Tyrosus
    .isQuestTurnedIn 5264 --any of: Lord Maxwell Tyrosus
    .xp <55,1
step
    .goto 1423/0,-5352.03,2303.91
    >>Click the |cRXP_PICK_The Argent Hold|r
    .turnin 5265 >>Turn in The Argent Hold
    .isOnQuest 5265
step
    .goto 1423/0,-5340.84,2257.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carlin Redpath|r
    .turnin 5210 >>Turn in Brother Carlin
    .target Carlin Redpath
    .isOnQuest 5210
step
    .goto 1423/0,-5340.84,2257.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carlin Redpath|r
    .accept 5181 >>Accept Villains of Darrowshire
    .accept 5168 >>Accept Heroes of Darrowshire
    .target Carlin Redpath
    .isQuestTurnedIn 5210 --any of: Brother Carlin
    .xp <50,1
step
    .goto 1423/0,-5264.70,2151.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Caretaker Alen|r
    .turnin 6021 >>Turn in Zaeldarr the Outcast
    .target Caretaker Alen
step
    .goto 1423/0,-4946.34,2923.11
    >>Pick up |cRXP_PICK_Symbol of Lost Honor|r from the ground
    .complete 5845,1 --Symbol of Lost Honor (1)
    .isOnQuest 5845
step
    .goto 1423/0,-4163.79,2511.17
    >>Open the |cRXP_PICK_Horgus' Skull|r. Loot it for |cRXP_LOOT_Skull of Horgus|r
    .complete 5181,1 --Skull of Horgus (1)
    .isOnQuest 5181
step
    #loop
    .goto 1423/0,-4688.65,2810.74,0
    .goto 1423/0,-4688.65,2810.74,40,0
    .goto 1423/0,-4720.05,2811.89,40,0
    .goto 1423/0,-4738.98,2872.66,40,0
    .goto 1423/0,-4785.01,2771.47,40,0
    .goto 1423/0,-4783.72,2745.95,40,0
    .goto 1423/0,-4722.20,2774.05,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Darrowshire Spirit|r
    .complete 5211,1 --Darrowshire Spirit (15)
    .target Darrowshire Spirit
step
    .goto 1423/0,-4272.21,2102.67
    >>Pick up |cRXP_PICK_Shattered Sword of Marduk|r from the ground
    .complete 5181,2 --Shattered Sword of Marduk (1)
    .isOnQuest 5181
step
    .goto 1423/0,-3702.61,1442.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Joseph Redpath|r
    .complete 5721,1 --Joseph Redpath
    .target Joseph Redpath
    .isOnQuest 5721
step
    .goto 1423/0,-3596.35,1456.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pamela Redpath|r
    .turnin 5721 >>Turn in The Battle of Darrowshire
    .target Pamela Redpath
    .isOnQuest 5721
step
    .goto 1423/0,-3596.35,1456.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pamela Redpath|r
    .accept 5942 >>Accept Hidden Treasures
    .target Pamela Redpath
    .isQuestTurnedIn 5721 --any of: The Battle of Darrowshire
    .xp <50,1
step
    .goto 1423/0,-3586.45,1461.97
    >>Click the |cRXP_PICK_Joseph's Chest|r
    .turnin 5942 >>Turn in Hidden Treasures
    .isOnQuest 5942
step
    .goto 1423/0,-2478.24,2671.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tirion Fordring|r
    .turnin 5845 >>Turn in Of Lost Honor
    .target Tirion Fordring
    .isOnQuest 5845
step
    .goto 1423/0,-2478.24,2671.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tirion Fordring|r
    .accept 5846 >>Accept Of Love and Family
    .target Tirion Fordring
    .isQuestTurnedIn 5845 --any of: Of Lost Honor
    .xp <52,1
step
    #completewith next
    .hs >>Hearth to Jessica Chambers's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1423/0,-5340.84,2257.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carlin Redpath|r
    .turnin 5211 >>Turn in Defenders of Darrowshire
    .target Carlin Redpath
step
    .goto 1423/0,-5305.57,2303.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Smokey LaRue|r
    .turnin 6026 >>Turn in That's Asking A Lot
    .target Smokey LaRue
    .isQuestComplete 6026
step
    .goto 1423/0,-5768.34,1992.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Khaelyn Steelwing|r
    .fp Chapel >> Get the Light's Hope Chapel flight path
    .target Khaelyn Steelwing
step
    .goto 1423/0,-5340.84,2257.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carlin Redpath|r
    .turnin 5181 >>Turn in Villains of Darrowshire
    .target Carlin Redpath
    .isOnQuest 5181
step
    .goto 1423/0,-5340.84,2257.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carlin Redpath|r
    .accept 5206 >>Accept Marauders of Darrowshire
    .target Carlin Redpath
    .isQuestTurnedIn 5168 --Heroes of Darrowshire
    .isQuestTurnedIn 5181 --Villains of Darrowshire
    .xp <50,1
step
    .goto 1423/0,-5340.84,2257.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carlin Redpath|r
    .turnin 5206 >>Turn in Marauders of Darrowshire
    .target Carlin Redpath
    .isOnQuest 5206
step
    .goto 1423/0,-5340.84,2257.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carlin Redpath|r
    .accept 5941 >>Accept Return to Chromie
    .target Carlin Redpath
    .isQuestTurnedIn 5206 --any of: Marauders of Darrowshire
    .xp <50,1
step
    .goto 1423/0,-5305.57,2303.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Smokey LaRue|r
    .accept 6041 >>Accept When Smokey Sings, I Get Violent
    .target Smokey LaRue
    .isQuestTurnedIn 6026 --any of: That's Asking A Lot
    .xp <54,1
step
    .goto 1423/0,-3759.83,2803.00
    >>Kill |cRXP_ENEMY_Scourge Structures|r
    .complete 6041,1 --Scourge Structures Destroyed (8)
    .mob Scourge Structure
    .isOnQuest 6041
step
    .goto 1423/0,-5305.57,2303.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Smokey LaRue|r
    .turnin 6041 >>Turn in When Smokey Sings, I Get Violent
    .target Smokey LaRue
    .isOnQuest 6041
step
    .goto 1423/0,-5340.84,2257.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carlin Redpath|r
    .turnin 5168 >>Turn in Heroes of Darrowshire
    .target Carlin Redpath
    .isQuestComplete 5168
step
    +|cRXP_WARN_That is all of Eastern Plaguelands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Western Plaguelands|r: Auntie Marlene, Of Love and Family, Find Myranda, Return to Chromie
    >>|cRXP_FRIENDLY_Winterspring|r: Tormented By the Past
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Pamela's Doll, That's Asking A Lot
step
    .xp 58 >>|cRXP_WARN_The rest of Eastern Plaguelands is planned from level 58.|r Come back to this guide then
step
    .goto 1423/0,-3657.87,1410.95
    >>Pick up |cRXP_PICK_Pamela's Doll's Head|r from the ground
    .collect 12886,1,5149,1 --Pamela's Doll's Head (1)
    .isOnQuest 5149
step
    .goto 1423/0,-3715.95,1477.17
    >>Pick up |cRXP_PICK_Pamela's Doll's Right Side|r from the ground
    .collect 12888,1,5149,1 --Pamela's Doll's Right Side (1)
    .isOnQuest 5149
step
    .goto 1423/0,-3663.89,1423.56
    >>Pick up |cRXP_PICK_Pamela's Doll's Left Side|r from the ground
    .collect 12887,1,5149,1 --Pamela's Doll's Left Side (1)
    .isOnQuest 5149
step
    .goto 1423/0,-3596.35,1456.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pamela Redpath|r
    .turnin 5149 >>Turn in Pamela's Doll
    .target Pamela Redpath
    .isQuestComplete 5149
step << Hunter
    .goto 1423/0,-5457.00,1894.27
    .goto 1423/0,-5375.26,1788.20,0
    .goto 1423/0,-5379.56,1865.60,0
    .goto 1423/0,-5555.95,1897.13,0
    .goto 1423/0,-5474.21,2003.20,0
    .goto 1423/0,-5555.95,2008.93,0
    .goto 1423/0,-4648.21,1771.00,0
    .goto 1423/0,-4592.28,1682.13,0
    .goto 1423/0,-4489.03,1685.00,0
    >>Kill and loot any |cRXP_ENEMY_Rotting Sludges|r and |cRXP_ENEMY_Living Decay|r untill you loot a |T132108:0|t[|cRXP_LOOT_Bubbling Green Ichor|r]. You will need it to get the rune of |T132178:0|t[|cRXP_FRIENDLY_Resourcefulness|r] soon
    >>|cRXP_WARN_The ichor is a gray item, be careful not to vendor it!|r
    .collect 20770,1
    .train 440557,1
step
    .goto 1423/0,-5349.02,2307.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Leonid Barthalomew the Revered|r
    .accept 5465 >>Accept Soulbound Keepsake
    .target Leonid Barthalomew the Revered
    .isQuestTurnedIn 5464 --any of: Menethil's Gift
    .xp <57,1
step
    .goto 1423/0,-5305.57,2303.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Smokey LaRue|r
    .turnin 6026 >>Turn in That's Asking A Lot
    .target Smokey LaRue
    .isQuestComplete 6026
step << Hunter
    .goto 1423/0,-3022.02,2825.93
    >>Head to Terrordale and kill |cRXP_ENEMY_Plagued Swines|r untill you loot a |T134046:0|t[|cRXP_LOOT_Tainted Boar Meat|r]
    .collect 225942,1
    .train 440557,1
step << Hunter
    >>Use the |T134046:0|t[|cRXP_LOOT_Tainted Boar Meat|r] to combine it with the |T132108:0|t[|cRXP_LOOT_Bubbling Green Ichor|r] and create a |T134047:0|t[Rancid Hunk of Flesh]
    .collect 225943,1
    .train 440557,1
step << Hunter
    .goto 1423/0,-3231.96,2627.56,-1
    .goto 1423/0,-3089.56,2934.29,-1
    .goto 1423/0,-3539.56,2572.23,-1
    >>Look for a |cRXP_ENEMY_Carrion Grub|r or a |cRXP_ENEMY_Carrion Devourer|r. The closest possible spawns to Terrordale are just north and south of it
    >>Use the |T134047:0|t[Rancid Hunk of Flesh] on it to feed it. |cRXP_WARN_The grub will spawn a skeleton after a short animation, loot it for|r |T134419:0|t[|cRXP_FRIENDLY_Rune of the Resourceful|r]
    .collect 225955,1
    .train 440557,1
step << Hunter
    .train 440557 >>Use |T134419:0|t[|cRXP_FRIENDLY_Rune of the Resourceful|r] |cRXP_WARN_to train|r |T132178:0|t[Resourcefulness]
    .train 440557,1
step
    .goto 1423/0,-3241.43,1600.15
    >>Click the |cRXP_PICK_Torn Scroll|r
    .accept 6024 >>Accept Hameya's Plea
step
    .goto 1423/0,-5332.67,2268.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Emmisary Whitebeard|r
    .accept 9664 >>Accept Establishing New Outposts
    .target Emmisary Whitebeard
step
    .goto 1423/0,-4796.20,2561.91
    >>Capture Crown Guard Tower, Eastwall Tower, Northpass Tower and Plaguewood Tower in the Eastern Plaguelands, then return to Emmisary Whitebeard at Light's Hope Chapel.
    .complete 9664,2 --<TXT>Eastwall Capture Quest Doodad
    .target <TXT>Eastwall Capture Quest Doodad
step
    .goto 1423/0,-4921.82,3373.18
    >>Kill |cRXP_ENEMY_Infiltrator Hameya|r and loot |cRXP_LOOT_Hameya's Key|r
    .complete 6024,1 --Hameya's Key (1)
    .mob Infiltrator Hameya
step
    .goto 1423/0,-4375.03,3169.93
    >>Capture Crown Guard Tower, Eastwall Tower, Northpass Tower and Plaguewood Tower in the Eastern Plaguelands, then return to Emmisary Whitebeard at Light's Hope Chapel.
    .complete 9664,3 --<TXT>Northpass Capture Quest Doodad
    .target <TXT>Northpass Capture Quest Doodad
step
    .goto 1423/0,-3037.51,2973.28
    >>Capture Crown Guard Tower, Eastwall Tower, Northpass Tower and Plaguewood Tower in the Eastern Plaguelands, then return to Emmisary Whitebeard at Light's Hope Chapel.
    .complete 9664,4 --<TXT>Plaguewood Capture Quest Doodad
    .target <TXT>Plaguewood Capture Quest Doodad
step
    .goto 1423/0,-3270.68,1576.35
    >>Click the |cRXP_PICK_Mound of Dirt|r
    .turnin 6024 >>Turn in Hameya's Plea
step
    .goto 1423/0,-3722.83,1854.13
    >>Capture Crown Guard Tower, Eastwall Tower, Northpass Tower and Plaguewood Tower in the Eastern Plaguelands, then return to Emmisary Whitebeard at Light's Hope Chapel.
    .complete 9664,1 --<TXT>Crown Guard Capture Quest Doodad
    .target <TXT>Crown Guard Capture Quest Doodad
step
    .goto 1423/0,-5332.67,2268.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Emmisary Whitebeard|r
    .turnin 9664 >>Turn in Establishing New Outposts
    .target Emmisary Whitebeard
step
    +|cRXP_WARN_That is all of Eastern Plaguelands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Western Plaguelands|r: Soulbound Keepsake
step
    +|cRXP_WARN_End of the Eastern Plaguelands route.|r
]])
