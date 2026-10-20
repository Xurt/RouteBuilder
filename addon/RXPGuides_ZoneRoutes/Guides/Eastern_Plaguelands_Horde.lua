-- 55-60 Eastern Plaguelands: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 3 parts (from level 55, 58, 60).
-- Split into 3 guides, listed under "55 - 61 Eastern Plaguelands" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Eastern Plaguelands.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 55 - 61 Eastern Plaguelands
#subweight -55
#name 55-56 Eastern Plaguelands: around Tirion Fordring

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
    .turnin 5944 >>Turn in In Dreams
    .target Tirion Fordring
    .isQuestComplete 5944
step
    .goto 1423/0,-2478.24,2671.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tirion Fordring|r
    .accept 5861 >>Accept Find Myranda
    .target Tirion Fordring
    .isQuestTurnedIn 5848 --any of: Of Love and Family
    .xp <52,1
step
    .goto 1423/0,-3212.60,1871.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathanos Blightcaller|r
    .accept 6022 >>Accept To Kill With Purpose
    .turnin 6022 >>Turn in To Kill With Purpose
    .accept 6042 >>Accept Un-Life's Little Annoyances
    .target Nathanos Blightcaller
step
    .goto 1423/0,-3596.35,1456.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pamela Redpath|r
    .turnin 5601 >>Turn in Sister Pamela
    .target Pamela Redpath
    .isOnQuest 5601
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
    .goto 1423/0,-3680.24,1407.79
    >>Pick up |cRXP_PICK_Pamela's Doll's Left Side|r from the ground
    >>Pick up |cRXP_PICK_Pamela's Doll's Right Side|r from the ground
    >>Pick up |cRXP_PICK_Pamela's Doll's Head|r from the ground
    .collect 12887,1,5149,1 --Pamela's Doll's Left Side (1)
    .collect 12888,1,5149,1 --Pamela's Doll's Right Side (1)
    .collect 12886,1,5149,1 --Pamela's Doll's Head (1)
step
    .goto 1423/0,-3596.35,1456.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pamela Redpath|r
    .turnin 5149 >>Turn in Pamela's Doll
    .target Pamela Redpath
    .isQuestComplete 5149
step
    .goto 1423/0,-3596.35,1456.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pamela Redpath|r
    .accept 5152 >>Accept Auntie Marlene
    .accept 5241 >>Accept Uncle Carlin
    .target Pamela Redpath
    .isQuestTurnedIn 5149 --any of: Pamela's Doll
    .xp <50,1
step
    #loop
    .goto 1423/0,-2962.22,1729.43,0
    .goto 1423/0,-2962.22,1729.43,40,0
    .goto 1423/0,-2821.97,1750.07,40,0
    .goto 1423/0,-2889.95,1887.67,40,0
    >>Kill |cRXP_ENEMY_Plaguebats|r
    >>Kill |cRXP_ENEMY_Plaguehound Runts|r
    .complete 5543,1 --Plaguebat slain (30)
    .complete 5542,1 --Plaguehound Runt slain (20)
    .mob Plaguebat
    .mob Plaguehound Runt
step
    #loop
    .goto 1423/0,-4288.98,2312.23,0
    .goto 1423/0,-4288.98,2312.23,40,0
    .goto 1423/0,-4443.43,2231.96,40,0
    >>Kill |cRXP_ENEMY_Plaguehounds|r
    .complete 5542,2 --Plaguehound slain (20)
    .mob Plaguehound
step << Mage
    .goto 1423/0,-5766.75,1991.73
    .fp Light's Hope Chapel >> Get the Light's Hope Chapel flight path
step
    #loop
    .goto 1423/0,-4790.18,2192.11,0
    .goto 1423/0,-4790.18,2192.11,40,0
    .goto 1423/0,-4815.99,2088.05,40,0
    >>Kill |cRXP_ENEMY_Noxious Plaguebats|r
    .complete 6042,1 --Noxious Plaguebat slain (20)
    .mob Noxious Plaguebat
step
    .goto 1423/0,-5305.57,2303.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Smokey LaRue|r
    .accept 6026 >>Accept That's Asking A Lot
    .target Smokey LaRue
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
    .goto 1423/0,-5349.45,2303.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lord Maxwell Tyrosus|r
    .turnin 8859 >>Turn in Secrets of the Colossus - Zora
    .target Lord Maxwell Tyrosus
    .isOnQuest 8859
step
    .goto 1423/0,-5345.15,2300.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jessica Chambers|r
    .target Jessica Chambers
    .home >>Set your Hearthstone to Jessica Chambers's inn
step
    .goto 1423/0,-5337.83,2255.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duke Nicholas Zverenhoff|r
    .turnin 6030 >>Turn in Duke Nicholas Zverenhoff
    .target Duke Nicholas Zverenhoff
    .isOnQuest 6030
step
    .goto 1423/0,-5340.84,2257.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carlin Redpath|r
    .turnin 5241 >>Turn in Uncle Carlin
    .target Carlin Redpath
    .isOnQuest 5241
step
    .goto 1423/0,-5340.84,2257.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carlin Redpath|r
    .accept 5211 >>Accept Defenders of Darrowshire
    .target Carlin Redpath
step
    .goto 1423/0,-5337.83,2255.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duke Nicholas Zverenhoff|r
    .accept 5503 >>Accept Argent Dawn Commission
    .turnin 5503 >>Turn in Argent Dawn Commission
    .target Duke Nicholas Zverenhoff
step
    .goto 1423/0,-5264.70,2151.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Caretaker Alen|r
    .accept 6021 >>Accept Zaeldarr the Outcast
    .accept 5281 >>Accept The Restless Souls
    .target Caretaker Alen
step
    .goto 1423/0,-5707.38,2057.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Georgia|r
    .fp Light's Hope Chapel	>>Get the Light's Hope Chapel flight path
    .target Georgia
step
    #loop
    .goto 1423/0,-4227.46,3176.24,0
    .goto 1423/0,-4227.46,3176.24,40,0
    .goto 1423/0,-4109.59,3098.55,40,0
    >>Kill |cRXP_ENEMY_Monstrous Plaguebats|r
    .complete 6042,2 --Monstrous Plaguebat slain (10)
    .mob Monstrous Plaguebat
step
    #loop
    .goto 1423/0,-4911.07,2645.62,0
    .goto 1423/0,-4911.07,2645.62,40,0
    .goto 1423/0,-4987.64,2731.91,40,0
    .goto 1423/0,-4909.78,2488.53,40,0
    >>Kill |cRXP_ENEMY_Frenzied Plaguehounds|r
    >>Kill |cRXP_ENEMY_Carrion Grubs|r and |cRXP_ENEMY_Carrion Devourers|r. Loot them for |cRXP_LOOT_Slab of Carrion Worm Meat|r
    .complete 5542,3 --Frenzied Plaguehound slain (5)
    .complete 5544,1 --Slab of Carrion Worm Meat (1)
    .mob Frenzied Plaguehound
    .mob Carrion Grub
    .mob Carrion Devourer
step
    .goto 1423/0,-3379.52,3367.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Anthion Harmon|r
    .turnin 8930 >>Turn in In Search of Anthion
    .target Anthion Harmon
    .isOnQuest 8930
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
    .goto 1423/0,-2877.47,2731.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Augustus|r again
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r
step
    .goto 1423/0,-2478.24,2671.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tirion Fordring|r
    .turnin 5542 >>Turn in Demon Dogs
    .turnin 5543 >>Turn in Blood Tinged Skies
    .turnin 5544 >>Turn in Carrion Grubbage
    .accept 5742 >>Accept Redemption
    .target Tirion Fordring
step
    .goto 1423/0,-2478.24,2671.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tirion Fordring|r
    .complete 5742,1 --Tirion Fordring
    .target Tirion Fordring
step
    .goto 1423/0,-2478.24,2671.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tirion Fordring|r
    .turnin 5742 >>Turn in Redemption
    .accept 5781 >>Accept Of Forgotten Memories
    .target Tirion Fordring
step
    .goto 1423/0,-3212.60,1871.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathanos Blightcaller|r
    .turnin 6042 >>Turn in Un-Life's Little Annoyances
    .target Nathanos Blightcaller
step
    .goto 1423/0,-3282.30,1564.03
    >>Kill |cRXP_ENEMY_Mercutio Filthgorger|r and loot |cRXP_LOOT_Taelan's Hammer|r
    >>Kill |cRXP_ENEMY_Zaeldarr the Outcast|r and loot |cRXP_LOOT_Zaeldarr's Head|r
    .complete 5781,1 --Taelan's Hammer (1)
    .complete 6021,1 --Zaeldarr's Head (1)
    .mob Mercutio Filthgorger
    .mob Zaeldarr the Outcast
step
    .goto 1423/0,-2478.24,2671.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tirion Fordring|r
    .turnin 5781 >>Turn in Of Forgotten Memories
    .accept 5845 >>Accept Of Lost Honor
    .target Tirion Fordring
step
    #completewith next
    .hs >>Hearth to Jessica Chambers's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1423/0,-5264.70,2151.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Caretaker Alen|r
    .turnin 6021 >>Turn in Zaeldarr the Outcast
    .target Caretaker Alen
step
    .goto 1423/0,-5337.83,2255.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duke Nicholas Zverenhoff|r
    .accept 5264 >>Accept Lord Maxwell Tyrosus
    .target Duke Nicholas Zverenhoff
    .isQuestTurnedIn 5263 --any of: Above and Beyond
    .xp <55,1
step
    .goto 1423/0,-5340.84,2257.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carlin Redpath|r
    .turnin 5210 >>Turn in Brother Carlin
    .target Carlin Redpath
    .isOnQuest 5210
step
    .goto 1423/0,-5340.84,2257.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carlin Redpath|r
    .accept 5168 >>Accept Heroes of Darrowshire
    .accept 5181 >>Accept Villains of Darrowshire
    .target Carlin Redpath
    .isQuestTurnedIn 5210 --any of: Brother Carlin
    .xp <50,1
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
    .goto 1423/0,-4946.34,2923.11
    >>Pick up |cRXP_PICK_Symbol of Lost Honor|r from the ground
    .complete 5845,1 --Symbol of Lost Honor (1)
step
    #loop
    .goto 1423/0,-4738.98,2872.66,0
    .goto 1423/0,-4738.98,2872.66,40,0
    .goto 1423/0,-4722.20,2774.05,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Darrowshire Spirit|r
    .complete 5211,1 --Darrowshire Spirit (15)
    .target Darrowshire Spirit
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
    .goto 1423/0,-5305.57,2303.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Smokey LaRue|r
    .accept 6041 >>Accept When Smokey Sings, I Get Violent
    .target Smokey LaRue
    .isQuestTurnedIn 6026 --any of: That's Asking A Lot
    .xp <54,1
step
    .goto 1423/0,-4272.21,2102.67
    >>Pick up |cRXP_PICK_Shattered Sword of Marduk|r from the ground
    .complete 5181,2 --Shattered Sword of Marduk (1)
    .isOnQuest 5181
step
    .goto 1423/0,-4163.79,2511.17
    >>Open the |cRXP_PICK_Horgus' Skull|r. Loot it for |cRXP_LOOT_Skull of Horgus|r
    .complete 5181,1 --Skull of Horgus (1)
    .isOnQuest 5181
step
    .goto 1423/0,-3759.83,2803.00
    >>Kill |cRXP_ENEMY_Scourge Structures|r
    .complete 6041,1 --Scourge Structures Destroyed (8)
    .mob Scourge Structure
    .isOnQuest 6041
step
    .goto 1423/0,-4467.09,2814.75
    >>Kill |cRXP_ENEMY_Crimson Courier|r and loot |cRXP_LOOT_The Grand Crusader's Command|r
    .complete 6145,1 --The Grand Crusader's Command (1)
    .mob Crimson Courier
    .isOnQuest 6145
step
    .goto 1423/0,-5305.57,2303.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Smokey LaRue|r
    .turnin 6041 >>Turn in When Smokey Sings, I Get Violent
    .target Smokey LaRue
    .isOnQuest 6041
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
    .goto 1423/0,-5340.84,2257.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carlin Redpath|r
    .turnin 5168 >>Turn in Heroes of Darrowshire
    .target Carlin Redpath
    .isQuestComplete 5168
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
    .goto 1423/0,-3212.60,1871.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathanos Blightcaller|r
    .turnin 5961 >>Turn in The Champion of the Banshee Queen
    .target Nathanos Blightcaller
    .isOnQuest 5961
step
    .goto 1423/0,-3212.60,1871.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathanos Blightcaller|r
    .turnin 6145 >>Turn in The Crimson Courier
    .target Nathanos Blightcaller
    .isOnQuest 6145
step
    .goto 1423/0,-2478.24,2671.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tirion Fordring|r
    .turnin 5845 >>Turn in Of Lost Honor
    .accept 5846 >>Accept Of Love and Family
    .target Tirion Fordring
step
    +|cRXP_WARN_That is all of Eastern Plaguelands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Western Plaguelands|r: Auntie Marlene, Of Love and Family, Find Myranda, Return to Chromie
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Pamela's Doll, That's Asking A Lot
step
    +|cRXP_WARN_The rest of Eastern Plaguelands is planned from level 58.|r Load its guide for level 58 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 55 - 61 Eastern Plaguelands
#subweight -55
#name 58-59 Eastern Plaguelands

step
    .goto 1423/0,-5347.73,2307.93
    >>Click the |cRXP_PICK_Book|r
    .accept 84398 >>Accept A Study of the Light
step
    .goto 1423/0,-5347.73,2307.93
    >>Open the |cRXP_PICK_Book|r. Loot it for |cRXP_LOOT_A Study of the Light|r
    .complete 84398,1 --A Study of the Light (1)
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
step
    .goto 1423/0,-5283.63,2317.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Emmisary Gormok|r
    .accept 9665 >>Accept Bolstering Our Defenses
    .target Emmisary Gormok
step
    .goto 1423/0,-4796.20,2561.91
    >>Capture Crown Guard Tower, Eastwall Tower, Northpass Tower and Plaguewood Tower in the Eastern Plaguelands, then return to Emmisary Gormok at Light's Hope Chapel.
    .complete 9665,2 --<TXT>Eastwall Capture Quest Doodad
    .target <TXT>Eastwall Capture Quest Doodad
step
    .goto 1423/0,-4291.14,2481.07
    >>Click the |cRXP_PICK_Book|r
    .accept 84400 >>Accept The Knight and the Lady
step
    .goto 1423/0,-4291.14,2481.07
    >>Open the |cRXP_PICK_Book|r. Loot it for |cRXP_LOOT_The Knight and the Lady|r
    .complete 84400,1 --The Knight and the Lady (1)
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
step
    .goto 1423/0,-3212.60,1871.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathanos Blightcaller|r
    .accept 6133 >>Accept The Ranger Lord's Behest
    .target Nathanos Blightcaller
step
    .goto 1423/0,-3212.60,1871.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathanos Blightcaller|r
    .accept 6146 >>Accept Nathanos' Ruse
    .target Nathanos Blightcaller
    .isQuestTurnedIn 6145 --any of: The Crimson Courier
    .xp <56,1
step
    .goto 1423/0,-3241.43,1600.15
    >>Click the |cRXP_PICK_Torn Scroll|r
    .accept 6024 >>Accept Hameya's Plea
step
    .goto 1423/0,-3722.83,1854.13
    >>Capture Crown Guard Tower, Eastwall Tower, Northpass Tower and Plaguewood Tower in the Eastern Plaguelands, then return to Emmisary Gormok at Light's Hope Chapel.
    .complete 9665,1 --<TXT>Crown Guard Capture Quest Doodad
    .target <TXT>Crown Guard Capture Quest Doodad
step
    .goto 1423/0,-4375.03,3169.93
    >>Capture Crown Guard Tower, Eastwall Tower, Northpass Tower and Plaguewood Tower in the Eastern Plaguelands, then return to Emmisary Gormok at Light's Hope Chapel.
    .complete 9665,3 --<TXT>Northpass Capture Quest Doodad
    .target <TXT>Northpass Capture Quest Doodad
step
    .goto 1423/0,-4921.82,3373.18
    >>Kill |cRXP_ENEMY_Infiltrator Hameya|r and loot |cRXP_LOOT_Hameya's Key|r
    .complete 6024,1 --Hameya's Key (1)
    .mob Infiltrator Hameya
step
    #loop
    .goto 1423/0,-4261.45,3380.35,0
    .goto 1423/0,-4261.45,3380.35,40,0
    .goto 1423/0,-4242.95,3312.98,40,0
    >>Kill |cRXP_ENEMY_Pathstriders|r
    >>Kill |cRXP_ENEMY_Rangers|r
    >>Kill |cRXP_ENEMY_Woodsmans|r
    >>Pick up |cRXP_PICK_Quel'Thalas Registry|r from the ground
    .complete 6133,1 --Pathstrider slain (8)
    .complete 6133,2 --Ranger slain (8)
    .complete 6133,3 --Woodsman slain (8)
    .complete 6133,4 --Quel'Thalas Registry (1)
    .mob Pathstrider
    .mob Ranger
    .mob Woodsman
step
    .goto 1423/0,-3393.29,3257.94
    >>Click the |cRXP_PICK_Book|r
    .accept 84401 >>Accept Scourge: Undead Menace or Misunderstood?
step
    .goto 1423/0,-3393.29,3257.94
    >>Open the |cRXP_PICK_Book|r. Loot it for |cRXP_LOOT_Scourge: Undead Menace or Misunderstood?|r
    .complete 84401,1 --Scourge: Undead Menace or Misunderstood? (1)
step
    .goto 1423/0,-3037.51,2973.28
    >>Capture Crown Guard Tower, Eastwall Tower, Northpass Tower and Plaguewood Tower in the Eastern Plaguelands, then return to Emmisary Gormok at Light's Hope Chapel.
    .complete 9665,4 --<TXT>Plaguewood Capture Quest Doodad
    .target <TXT>Plaguewood Capture Quest Doodad
step
    .goto 1423/0,-3212.60,1871.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathanos Blightcaller|r
    .turnin 6133 >>Turn in The Ranger Lord's Behest
    .target Nathanos Blightcaller
step
    .goto 1423/0,-3212.60,1871.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathanos Blightcaller|r
    .accept 6135 >>Accept Duskwing, Oh How I Hate Thee...
    .target Nathanos Blightcaller
    .isQuestTurnedIn 6022 --To Kill With Purpose
    .isQuestTurnedIn 6042 --Un-Life's Little Annoyances
step
    .goto 1423/0,-3378.23,1999.47
    >>Kill |cRXP_ENEMY_Duskwing|r and loot |cRXP_LOOT_Patch of Duskwing's Fur|r
    .complete 6135,1 --Patch of Duskwing's Fur (1)
    .mob Duskwing
    .isOnQuest 6135
step
    .goto 1423/0,-3212.60,1871.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathanos Blightcaller|r
    .turnin 6135 >>Turn in Duskwing, Oh How I Hate Thee...
    .target Nathanos Blightcaller
    .isOnQuest 6135
step
    .goto 1423/0,-3270.68,1576.35
    >>Click the |cRXP_PICK_Mound of Dirt|r
    .turnin 6024 >>Turn in Hameya's Plea
step
    #loop
    .goto 1423/0,-5488.41,1651.46,0
    .goto 1423/0,-5488.41,1651.46,40,0
    .goto 1423/0,-5470.77,1581.51,40,0
    .goto 1423/0,-5502.17,1537.94,40,0
    .goto 1423/0,-5554.23,1596.42,40,0
    .goto 1423/0,-5570.15,1588.11,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Crusader Lord Valdelmar|r. |cRXP_WARN_This NPC walks a patrol route|r
    .turnin 6146 >>Turn in Nathanos' Ruse
    .unitscan Crusader Lord Valdelmar
    .isOnQuest 6146
step
    #loop
    .goto 1423/0,-5488.41,1651.46,0
    .goto 1423/0,-5488.41,1651.46,40,0
    .goto 1423/0,-5470.77,1581.51,40,0
    .goto 1423/0,-5502.17,1537.94,40,0
    .goto 1423/0,-5554.23,1596.42,40,0
    .goto 1423/0,-5570.15,1588.11,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Crusader Lord Valdelmar|r. |cRXP_WARN_This NPC walks a patrol route|r
    .accept 6147 >>Accept Return to Nathanos
    .unitscan Crusader Lord Valdelmar
    .isQuestTurnedIn 6146 --any of: Nathanos' Ruse
    .xp <56,1
step
    .goto 1423/0,-5283.63,2317.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Emmisary Gormok|r
    .turnin 9665 >>Turn in Bolstering Our Defenses
    .target Emmisary Gormok
step
    .goto 1423/0,-3212.60,1871.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathanos Blightcaller|r
    .turnin 6147 >>Turn in Return to Nathanos
    .target Nathanos Blightcaller
    .isOnQuest 6147
step
    +|cRXP_WARN_That is all of Eastern Plaguelands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Stormwind City|r: A Study of the Light, The Knight and the Lady, Scourge: Undead Menace or Misunderstood?
    >>|cRXP_FRIENDLY_Western Plaguelands|r: Soulbound Keepsake
step
    +|cRXP_WARN_The rest of Eastern Plaguelands is planned from level 60.|r Load its guide for level 60 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 55 - 61 Eastern Plaguelands
#subweight -55
#name 60-61 Eastern Plaguelands

step
    .goto 1423/0,-3212.60,1871.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathanos Blightcaller|r
    .accept 6136 >>Accept The Corpulent One
    .target Nathanos Blightcaller
    .isQuestTurnedIn 6022 --To Kill With Purpose
    .isQuestTurnedIn 6042 --Un-Life's Little Annoyances
    .isQuestTurnedIn 6133 --The Ranger Lord's Behest
step
    .goto 1423/0,-3212.60,1871.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathanos Blightcaller|r
    .accept 6148 >>Accept The Scarlet Oracle, Demetria
    .target Nathanos Blightcaller
    .isQuestTurnedIn 6147 --any of: Return to Nathanos
    .xp <56,1
step
    .goto 1423/0,-4307.91,2978.73
    >>Kill |cRXP_ENEMY_Borelgore|r
    .complete 6136,1 --Borelgore slain (1)
    .mob Borelgore
    .isOnQuest 6136
step
    .goto 1423/0,-3379.52,3367.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Anthion Harmon|r
    .accept 9022 >>Accept Anthion's Parting Words << Warrior
    .accept 9017 >>Accept Anthion's Parting Words << Hunter
    .accept 8957 >>Accept Anthion's Parting Words << Shaman
    .accept 9018 >>Accept Anthion's Parting Words << Mage
    .accept 9020 >>Accept Anthion's Parting Words << Rogue
    .accept 9021 >>Accept Anthion's Parting Words << Warlock
    .accept 9019 >>Accept Anthion's Parting Words << Priest
    .accept 9016 >>Accept Anthion's Parting Words << Druid
    .target Anthion Harmon
    .isQuestTurnedIn 9015 --any of: The Challenge
    .xp <58,1
step
    .goto 1423/0,-3379.52,3367.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Anthion Harmon|r
    .accept 8947 >>Accept Anthion's Strange Request
    .target Anthion Harmon
    .isQuestTurnedIn 8946 --any of: Proof of Life
    .xp <58,1
step
    .goto 1423/0,-3379.52,3367.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Anthion Harmon|r
    .turnin 8947 >>Turn in Anthion's Strange Request
    .target Anthion Harmon
    .isQuestComplete 8947
step
    .goto 1423/0,-3212.60,1871.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathanos Blightcaller|r
    .turnin 6136 >>Turn in The Corpulent One
    .target Nathanos Blightcaller
    .isOnQuest 6136
step
    .goto 1423/0,-3212.60,1871.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathanos Blightcaller|r
    .accept 6144 >>Accept The Call to Command
    .target Nathanos Blightcaller
    .isQuestTurnedIn 6135 --Duskwing, Oh How I Hate Thee...
    .isQuestTurnedIn 6136 --The Corpulent One
step
    .goto 1423/0,-5305.57,2303.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Smokey LaRue|r
    .turnin 6026 >>Turn in That's Asking A Lot
    .target Smokey LaRue
    .isQuestComplete 6026
step
    .goto 1423/0,-4979.47,1764.69
    >>Kill |cRXP_ENEMY_Demetria|r
    .complete 6148,1 --Demetria slain (1)
    .mob Demetria
    .isOnQuest 6148
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
step
    .goto 1423/0,-3212.60,1871.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathanos Blightcaller|r
    .turnin 6148 >>Turn in The Scarlet Oracle, Demetria
    .target Nathanos Blightcaller
    .isOnQuest 6148
step
    +|cRXP_WARN_That is all of Eastern Plaguelands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Orgrimmar|r: Anthion's Parting Words << Shaman
    >>|cRXP_FRIENDLY_Orgrimmar|r: Anthion's Parting Words << Druid
    >>|cRXP_FRIENDLY_Orgrimmar|r: Anthion's Parting Words << Hunter
    >>|cRXP_FRIENDLY_Orgrimmar|r: Anthion's Parting Words << Mage
    >>|cRXP_FRIENDLY_Orgrimmar|r: Anthion's Parting Words << Priest
    >>|cRXP_FRIENDLY_Orgrimmar|r: Anthion's Parting Words << Rogue
    >>|cRXP_FRIENDLY_Orgrimmar|r: Anthion's Parting Words << Warlock
    >>|cRXP_FRIENDLY_Orgrimmar|r: Anthion's Parting Words << Warrior
    >>|cRXP_FRIENDLY_Undercity|r: The Call to Command
step
    +|cRXP_WARN_End of the Eastern Plaguelands route.|r
]])
