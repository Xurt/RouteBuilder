-- 17-31 Duskwood: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 5 parts with a level check between them (from level 17, 20, 23, 26, 29).
-- Edit zones/Duskwood.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#name 17-31 Duskwood

step
    .hs >> Hearth to Stormwind City
    .zoneskip Stormwind City
step
    .goto 1431/0,-1200.85,-10594.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elaine Carevin|r
    .accept 163 >>Accept Raven Hill
    .accept 164 >>Accept Deliveries to Sven
    .accept 165 >>Accept The Hermit
    .target Elaine Carevin
step
    .goto 1431/0,-1272.67,-10586.073
    >>Talk to |cRXP_FRIENDLY_Herble|r
    .vendor 3133 >>|cRXP_BUY_Buy a|r |T133024:0|t[Bronze Tube] |cRXP_BUY_from him if its up|r
    .target Herble Baubbletump
step
    .goto 1431/0,-1258.63,-10513.89
    >>Talk to |cRXP_FRIENDLY_Felicia|r
    .fp Duskwood >> Get the Duskwood flight path
    .target Felicia Mane
step
    .goto 1431/0,-1375.81,-10072.35
    >>Talk to |cRXP_FRIENDLY_Kzixx|r
    .vendor 3134 >>|cRXP_BUY_Buy|r |T134851:0|t[Lesser Mana Potions] |cRXP_BUY_and|r  |T134831:0|t[Healing Potions] |cRXP_BUY_from him (if they're up)|r
    .target Kzixx
step
    .goto 1431/0,-1375.81,-10072.35
    >>Talk to |cRXP_FRIENDLY_Kzixx|r
    .vendor 3134 >>|cRXP_BUY_Buy|r |T134851:0|t[Lesser Mana Potions]|cRXP_BUY_,|r |T134831:0|t[Healing Potions]|cRXP_BUY_, and a|r |T132515:0|t[Cloth Belt] |cRXP_BUY_from him (if they're up, and if needed)|r
    .target Kzixx
step
    .goto 1431/0,-1138.48,-10516.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Avette Fellwood|r
    .turnin 95161 >>Turn in Remember That I Love You
    .target Avette Fellwood
    .isOnQuest 95161
step
    .goto 1431/0,-1250.26,-10020.33
    >>Kill |cRXP_ENEMY_Elmpaw|r and loot |cRXP_LOOT_Elmpaw's Head|r. Use it to start the quest
    .collect 247862,1,91746 --Elmpaw's Head (1)
    .accept 91746 >>Accept Elmpaw's Head
    .use 247862
    .mob Elmpaw
step
    .goto 1431/0,623.27,-10329.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sven Yorgen|r
    .turnin 164 >>Turn in Deliveries to Sven
    .target Sven Yorgen
step
    .goto 1431/0,74.36,-10282.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Abercrombie|r
    .turnin 165 >>Turn in The Hermit
    .target Abercrombie
step
    .goto 1431/0,-1138.48,-10516.05
    >>Talk to |cRXP_FRIENDLY_Avette|r
    .vendor 228 >> Vendor Trash. Repair
    .target Avette Fellwood
step
    .goto 1431/0,337.07,-10731.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jitters|r
    .turnin 163 >>Turn in Raven Hill
    .accept 5 >>Accept Jitters' Growling Gut
    .target Jitters
step
    .goto 1431/0,-1157.92,-10499.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chef Grual|r
    .turnin 5 >>Turn in Jitters' Growling Gut
    .accept 93 >>Accept Dusky Crab Cakes
    .target Chef Grual
step
    .goto 1431/0,-1125.25,-10560.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Clerk Daltry|r
    .turnin 68 >>Turn in The Legend of Stalvan
    .target Clerk Daltry
    .isOnQuest 68
step
    .goto 1431/0,395.39,-10312.47,40,0
    .goto 1431/0,345.17,-10307.07,40,0
    .goto 1431/0,239.33,-10401.75,40,0
    .goto 1431/0,242.03,-10322.19,40,0
    .goto 1431/0,147.26,-10323.99,40,0
    .goto 1431/0,170.75,-10417.95,40,0
    .goto 1431/0,202.61,-10451.25,40,0
    .goto 1431/0,178.31,-10481.67,40,0
    .goto 1431/0,217.19,-10556.73,40,0
    .goto 1431/0,237.98,-10584.99,40,0
    .goto 1431/0,280.37,-10567.35,40,0
    .goto 1431/0,354.89,-10577.97,40,0
    .goto 1431/0,438.32,-10577.43,40,0
    .goto 1431/0,444.26,-10468.17,40,0
    .goto 1431/0,395.39,-10312.47,40,0
    .xp 27+36025 >> Grind to 36025+/38900xp
step
    #loop
    .goto 1431/0,-1186.54,-10513.89,0
    .goto 1431/0,-1186.54,-10513.89,40,0
    .goto 1431/0,-1160.35,-10428.75,40,0
    .goto 1431/0,-1115.53,-10386.63,40,0
    .goto 1431/0,-1109.59,-10359.45,40,0
    .goto 1431/0,-1122.55,-10330.83,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Watcher Backus|r. |cRXP_WARN_This NPC walks a patrol route|r
    .turnin 1243 >>Turn in The Missing Diplomat
    .unitscan Watcher Backus
    .isOnQuest 1243
step
    .goto 1431/0,-1158.73,-10517.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tavernkeep Smitts|r
    .turnin 78 >>Turn in The Legend of Stalvan
    .target Tavernkeep Smitts
    .isOnQuest 78
step
    .goto 1431/0,-1157.65,-10997.55,30,0
    .goto 1431/0,-1139.83,-11070.99,30,0
    .goto 1431/0,-1147.93,-11096.73,30,0
    .goto 1431/0,-1174.12,-11117.07,30,0
    .goto 1431/0,-1165.48,-11140.65,30,0
    .goto 1431/0,-1174.12,-11117.07,30,0
    .goto 1431/0,-1147.93,-11096.73,30,0
    .goto 1431/0,-1139.83,-11070.99,30,0
    .goto 1431/0,-1107.97,-10988.55,30,0
    .goto 1431/0,-1044.52,-11017.71,30,0
    .goto 1431/0,-1020.76,-11067.57,30,0
    .goto 1431/0,-1021.84,-11110.77,30,0
    .goto 1431/0,-984.58,-11170.89,30,0
    .goto 1431/0,-935.71,-11160.27,30,0
    .goto 1431/0,-909.79,-11202.93,30,0
    .goto 1431/0,-856.33,-11224.17,30,0
    .goto 1431/0,-837.16,-11210.13,30,0
    .goto 1431/0,-840.13,-11183.49,30,0
    .goto 1431/0,-818.53,-11072.25,30,0
    .goto 1431/0,-898.72,-11032.65,30,0
    .goto 1431/0,-917.08,-10737.63,30,0
    .goto 1431/0,-889.27,-10640.79,30,0
    .goto 1431/0,-1157.65,-10997.55,30,0
    .xp 30 >>AoE |cRXP_ENEMY_Nightbane Vile Fangs|r, |cRXP_ENEMY_Nightbane Tainted Ones|r, and |cRXP_ENEMY_Nightbane Dark Runners|r to Level 30
    >>|cRXP_WARN_Be careful of |cRXP_ENEMY_Nightbane Vile Fangs|r as they cast|r |T136066:0|t[Infected Wound] |cRXP_WARN_(Increases physical damage taken by 6, stackable if batched), |cRXP_ENEMY_Nightbane Tainted Ones|r cast|r |T136188:0|t[Tainted Howl] |cRXP_WARN_(stackable buff giving a chance to inflict|r |T136016:0|t[Poison] |cRXP_WARN_on melee attack, dealing 16.5 damage every 3 seconds for 30 seconds)|r |cRXP_ENEMY_Nightbane Dark Runners|r |cRXP_WARN_as they have|r |T132307:0|t[Increased Movespeed] |cRXP_WARN_and cast|r |T132090:0|t[Exploit Weakness] |cRXP_WARN_(deals double damage from behind)|r
step
    .goto 1431/0,-1157.65,-10997.55,30,0
    .goto 1431/0,-1139.83,-11070.99,30,0
    .goto 1431/0,-1147.93,-11096.73,30,0
    .goto 1431/0,-1174.12,-11117.07,30,0
    .goto 1431/0,-1165.48,-11140.65,30,0
    .goto 1431/0,-1174.12,-11117.07,30,0
    .goto 1431/0,-1147.93,-11096.73,30,0
    .goto 1431/0,-1139.83,-11070.99,30,0
    .goto 1431/0,-1107.97,-10988.55,30,0
    .goto 1431/0,-1044.52,-11017.71,30,0
    .goto 1431/0,-1020.76,-11067.57,30,0
    .goto 1431/0,-1021.84,-11110.77,30,0
    .goto 1431/0,-984.58,-11170.89,30,0
    .goto 1431/0,-935.71,-11160.27,30,0
    .goto 1431/0,-877.12,-11181.51,30,0
    .goto 1431/0,-840.13,-11183.49,30,0
    .goto 1431/0,-818.53,-11072.25,30,0
    .goto 1431/0,-898.72,-11032.65,30,0
    .goto 1431/0,-917.08,-10737.63,30,0
    .goto 1431/0,-889.27,-10640.79,30,0
    .goto 1431/0,-1157.65,-10997.55,30,0
    .xp 31 >>AoE |cRXP_ENEMY_Nightbane Vile Fangs|r, |cRXP_ENEMY_Nightbane Tainted Ones|r, and |cRXP_ENEMY_Nightbane Dark Runners|r until your |T134414:0|t[Hearthstone] is off cooldown
    >>|cRXP_WARN_Be careful of |cRXP_ENEMY_Nightbane Vile Fangs|r as they cast|r |T136066:0|t[Infected Wound] |cRXP_WARN_(Increases physical damage taken by 6, stackable if batched), |cRXP_ENEMY_Nightbane Tainted Ones|r cast|r |T136188:0|t[Tainted Howl] |cRXP_WARN_(stackable buff giving a chance to inflict|r |T136016:0|t[Poison] |cRXP_WARN_on melee attack, dealing 16.5 damage every 3 seconds for 30 seconds)|r |cRXP_ENEMY_Nightbane Dark Runners|r |cRXP_WARN_as they have|r |T132307:0|t[Increased Movespeed] |cRXP_WARN_and cast|r |T132090:0|t[Exploit Weakness] |cRXP_WARN_(deals double damage from behind)|r
step
    .goto 1431/0,-1156.03,-10590.57,10,0
    .goto 1431/0,-1163.05,-10596.33
    >>Talk to |cRXP_FRIENDLY_Morg|r or |cRXP_FRIENDLY_Gavin|r
    .vendor >> Vendor Trash. Repair
    >>|cRXP_WARN_Do NOT sell your|r |T132917:0|t[Light Feathers]
    .target Morg Gnarltree
    .target Gavin Gnarltree
step
    .goto 1431/0,-1157.65,-10997.55,30,0
    .goto 1431/0,-1139.83,-11070.99,30,0
    .goto 1431/0,-1147.93,-11096.73,30,0
    .goto 1431/0,-1174.12,-11117.07,30,0
    .goto 1431/0,-1165.48,-11140.65,30,0
    .goto 1431/0,-1174.12,-11117.07,30,0
    .goto 1431/0,-1147.93,-11096.73,30,0
    .goto 1431/0,-1139.83,-11070.99,30,0
    .goto 1431/0,-1107.97,-10988.55,30,0
    .goto 1431/0,-1044.52,-11017.71,30,0
    .goto 1431/0,-1020.76,-11067.57,30,0
    .goto 1431/0,-1021.84,-11110.77,30,0
    .goto 1431/0,-984.58,-11170.89,30,0
    .goto 1431/0,-935.71,-11160.27,30,0
    .goto 1431/0,-877.12,-11181.51,30,0
    .goto 1431/0,-840.13,-11183.49,30,0
    .goto 1431/0,-818.53,-11072.25,30,0
    .goto 1431/0,-898.72,-11032.65,30,0
    .goto 1431/0,-917.08,-10737.63,30,0
    .goto 1431/0,-889.27,-10640.79,30,0
    .goto 1431/0,-1157.65,-10997.55,30,0
    .xp 32 >>AoE |cRXP_ENEMY_Nightbane Vile Fangs|r, |cRXP_ENEMY_Nightbane Tainted Ones|r, and |cRXP_ENEMY_Nightbane Dark Runners|r to Level 32
    >>|cRXP_WARN_Be careful of |cRXP_ENEMY_Nightbane Vile Fangs|r as they cast|r |T136066:0|t[Infected Wound] |cRXP_WARN_(Increases physical damage taken by 6, stackable if batched), |cRXP_ENEMY_Nightbane Tainted Ones|r cast|r |T136188:0|t[Tainted Howl] |cRXP_WARN_(stackable buff giving a chance to inflict|r |T136016:0|t[Poison] |cRXP_WARN_on melee attack, dealing 16.5 damage every 3 seconds for 30 seconds)|r |cRXP_ENEMY_Nightbane Dark Runners|r |cRXP_WARN_as they have|r |T132307:0|t[Increased Movespeed] |cRXP_WARN_and cast|r |T132090:0|t[Exploit Weakness] |cRXP_WARN_(deals double damage from behind)|r
    >>Talk to |cRXP_FRIENDLY_Morg|r or |cRXP_FRIENDLY_Gavin|r in Darkshire to Vendor and Repair whenever needed after clearing the northern |cRXP_ENEMY_Nightbane Dark Runner|r camp
step
    .goto 1431/0,623.27,-10329.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sven Yorgen|r
    .turnin 325 >>Turn in Armed and Ready
    .target Sven Yorgen
    .isOnQuest 325
step
    .goto 1431/0,-1258.79,-10513.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Felicia Maline|r
    .fp Duskwood>> Get the Duskwood Flight Path
    .target Felicia Maline
step
    .goto 1431/0,-1272.45,-10586.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Herble Baubbletump|r
    .vendor >> |cRXP_BUY_Buy a|r |T133024:0|t[Bronze Tube]
    >>|cRXP_WARN_This is a limited supply item. Skip this step if |cRXP_FRIENDLY_Herble Baubbletump|r doesn't have one|r
    .target Herble Baubbletump
step
    .goto 1431/0,-384.91,-10923.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Watcher Dodds|r
    .accept 245 >>Accept Eight-Legged Menaces
    .target Watcher Dodds
step
    .goto 1431/0,-1125.25,-10560.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Clerk Daltry|r
    .turnin 1041 >>Turn in The Caravan Road
    .target Clerk Daltry
    .isOnQuest 1041
step
    .goto 1431/0,-1375.81,-10072.53
    .vendor >> Talk to Kzixx. Buy one of the green BoE belts (lower level = better). Buy potions too if any of these are available
step
    >>Follow the road down into Darkshire.
    .goto 1431/0,-1258.63,-10513.89
    .fp Darkshire >> Get the Darkshire flight path
step
    >>Go behind Eva
    .goto 1431/0,-1226.50,-10531.71
    .vendor >> Buy 2 Runes of Teleportation from Alyssa
    .collect 17031,2
step
    #loop
    .goto 1431/0,509.33,-10638.99,0
    .goto 1431/0,509.33,-10638.99,40,0
    .goto 1431/0,542.00,-10670.67,40,0
    .goto 1431/0,576.02,-10684.53,40,0
    .goto 1431/0,578.99,-10746.09,40,0
    .goto 1431/0,584.12,-10811.43,40,0
    .goto 1431/0,552.53,-10779.75,40,0
    .goto 1431/0,510.14,-10782.09,40,0
    .goto 1431/0,543.08,-10713.69,40,0
    >>Kill |cRXP_ENEMY_Pygmy Venom Web Spiders|r
    .complete 245,1 --Pygmy Venom Web Spider slain (15)
    .mob Pygmy Venom Web Spider
step
    .goto 1431/0,-384.91,-10923.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Watcher Dodds|r
    .turnin 245 >>Turn in Eight-Legged Menaces
    .target Watcher Dodds
step
    .goto 1431/0,256.88,-10559.07
    .xp 25+29845 >> Grind to 29845+/34000xp
step
    #loop
    .goto 1431/0,476.39,-10768.05,0
    .goto 1431/0,476.39,-10768.05,40,0
    .goto 1431/0,519.32,-10844.55,40,0
    .goto 1431/0,584.12,-10811.43,40,0
    .goto 1431/0,578.99,-10746.09,40,0
    .goto 1431/0,542.00,-10670.67,40,0
    .goto 1431/0,576.02,-10610.37,40,0
    .goto 1431/0,550.64,-10520.37,40,0
    .goto 1431/0,479.36,-10570.95,40,0
    .goto 1431/0,481.79,-10634.31,40,0
    >>Kill |cRXP_ENEMY_Venom Web Spiders|r, |cRXP_ENEMY_Pygmy Venom Web Spiders|r, |cRXP_ENEMY_Green Recluses|r and |cRXP_ENEMY_Naraxis|r. Loot them for |cRXP_LOOT_Gooey Spider Leg|r
    .complete 93,1 --Gooey Spider Leg (6)
    .mob Venom Web Spider
    .mob Pygmy Venom Web Spider
    .mob Green Recluse
    .mob Naraxis
step
    .goto 1431/0,-1157.92,-10499.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chef Grual|r
    .turnin 93 >>Turn in Dusky Crab Cakes
    .accept 240 >>Accept Return to Jitters
    .target Chef Grual
step
    .goto 1431/0,337.07,-10731.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jitters|r
    .turnin 240 >>Turn in Return to Jitters
    .target Jitters
step
    .goto 1431/0,-1108.78,-10552.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lord Ello Ebonlocke|r
    .turnin 145 >>Turn in Messenger to Darkshire
    .target Lord Ello Ebonlocke
    .isOnQuest 145
step
    .xp 22 >> Grind to 22
step
    +|cRXP_WARN_That is all of Duskwood for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Elwynn Forest|r: Elmpaw's Head
step
    .xp 20 >>|cRXP_WARN_The rest of Duskwood is planned from level 20.|r Come back to this guide then
step
    .goto 1431/0,-1108.78,-10552.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lord Ello Ebonlocke|r
    .accept 146 >>Accept Messenger to Darkshire
    .target Lord Ello Ebonlocke
    .isQuestTurnedIn 145 --any of: Messenger to Darkshire
    .xp <18,1
step
    .goto 1431/0,623.27,-10329.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sven Yorgen|r
    .accept 95 >>Accept Sven's Revenge
    .target Sven Yorgen
step
    .goto 1431/0,625.16,-10314.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lars|r
    .accept 226 >>Accept Wolves at Our Heels
    .target Lars
step
    .goto 1431/0,74.36,-10282.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Abercrombie|r
    .accept 148 >>Accept Supplies from Darkshire
    .target Abercrombie
step
    #loop
    .goto 1431/0,-61.45,-10244.97,0
    .goto 1431/0,-61.45,-10244.97,40,0
    .goto 1431/0,-113.83,-10184.85,40,0
    .goto 1431/0,-185.11,-10062.45,40,0
    .goto 1431/0,-247.48,-10060.83,40,0
    .goto 1431/0,-313.09,-10052.55,40,0
    .goto 1431/0,-423.52,-10018.53,40,0
    .goto 1431/0,-352.78,-10082.97,40,0
    .goto 1431/0,-249.37,-10113.75,40,0
    .goto 1431/0,-182.68,-10179.45,40,0
    >>Kill |cRXP_ENEMY_Starving Dire Wolfs|r
    >>Kill |cRXP_ENEMY_Rabid Dire Wolfs|r
    .complete 226,1 --Starving Dire Wolf slain (8)
    .complete 226,2 --Rabid Dire Wolf slain (8)
    .mob Starving Dire Wolf
    .mob Rabid Dire Wolf
step
    .goto 1431/0,-1161.16,-10516.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Trelayne|r
    .target Innkeeper Trelayne
    .home >>Set your Hearthstone to Innkeeper Trelayne's inn
step
    .goto 1431/0,-1213.00,-10532.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Madame Eva|r
    .turnin 148 >>Turn in Supplies from Darkshire
    .accept 149 >>Accept Ghost Hair Thread
    .target Madame Eva
step
    .goto 1431/0,-1152.25,-10559.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Althea Ebonlocke|r
    .accept 56 >>Accept The Night Watch
    .target Commander Althea Ebonlocke
step
    .goto 1431/0,-1127.41,-10573.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sirra Von'Indi|r
    .accept 96139 >>Accept The Valor Family
    .target Sirra Von'Indi
step
    .goto 1431/0,-1380.40,-10780.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Blind Mary|r
    .turnin 149 >>Turn in Ghost Hair Thread
    .accept 154 >>Accept Return the Comb
    .target Blind Mary
step
    #completewith Drop337x1
    >>|cRXP_LOOT_An Old History Book|r can drop from |cRXP_ENEMY_Flesh Eater|r, |cRXP_ENEMY_Skeletal Warrior|r, |cRXP_ENEMY_Skeletal Horror|r. Use it to start the quest if you get one
    .collect 2794,1,337 --An Old History Book (1)
    .accept 337 >>Accept An Old History Book
    .use 2794
step
    #label Drop337x1
    #loop
    .goto 1431/0,-1343.14,-10916.55,0
    .goto 1431/0,-1343.14,-10916.55,40,0
    .goto 1431/0,-1384.45,-10953.27,40,0
    .goto 1431/0,-1342.06,-10980.27,40,0
    .goto 1431/0,-1381.75,-11012.13,40,0
    .goto 1431/0,-1349.35,-11045.43,40,0
    .goto 1431/0,-1276.72,-11078.19,40,0
    .goto 1431/0,-1289.68,-10991.97,40,0
    .goto 1431/0,-1242.43,-10981.17,40,0
    .goto 1431/0,-1273.48,-10922.85,40,0
    >>Kill |cRXP_ENEMY_Skeletal Warriors|r
    >>Kill |cRXP_ENEMY_Skeletal Mages|r
    .complete 56,1 --Skeletal Warrior slain (8)
    .complete 56,2 --Skeletal Mage slain (6)
    .mob Skeletal Warrior
    .mob Skeletal Mage
step
    .goto 1431/0,-1213.00,-10532.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Madame Eva|r
    .turnin 154 >>Turn in Return the Comb
    .accept 157 >>Accept Deliver the Thread
    .target Madame Eva
step
    .goto 1431/0,-1152.25,-10559.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Althea Ebonlocke|r
    .turnin 56 >>Turn in The Night Watch
    .target Commander Althea Ebonlocke
step
    .goto 1431/0,-512.62,-11115.45
    >>Click the |cRXP_PICK_Mound of loose dirt|r
    .turnin 95 >>Turn in Sven's Revenge
    .accept 230 >>Accept Sven's Camp
step
    .goto 1431/0,74.36,-10282.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Abercrombie|r
    .turnin 157 >>Turn in Deliver the Thread
    .accept 158 >>Accept Zombie Juice
    .target Abercrombie
step
    .goto 1431/0,625.16,-10314.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lars|r
    .turnin 226 >>Turn in Wolves at Our Heels
    .target Lars
step
    .goto 1431/0,623.27,-10329.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sven Yorgen|r
    .turnin 230 >>Turn in Sven's Camp
    .accept 262 >>Accept The Shadowy Figure
    .target Sven Yorgen
step
    #completewith next
    .hs >>Hearth to Innkeeper Trelayne's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1431/0,-1158.73,-10517.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tavernkeep Smitts|r
    .turnin 158 >>Turn in Zombie Juice
    .target Tavernkeep Smitts
step
    .goto 1431/0,-1213.00,-10532.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Madame Eva|r
    .turnin 262 >>Turn in The Shadowy Figure
    .accept 265 >>Accept The Shadowy Search Continues
    .target Madame Eva
step
    .goto 1431/0,-1125.25,-10560.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Clerk Daltry|r
    .turnin 265 >>Turn in The Shadowy Search Continues
    .accept 266 >>Accept Inquire at the Inn
    .target Clerk Daltry
step
    .goto 1431/0,-1158.73,-10517.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tavernkeep Smitts|r
    .turnin 266 >>Turn in Inquire at the Inn
    .accept 453 >>Accept Finding the Shadowy Figure
    .target Tavernkeep Smitts
step
    .goto 1431/0,263.63,-10717.47
    >>Open the |cRXP_PICK_Memory of Valor|r. Loot it for |cRXP_LOOT_Raven Hill Tome|r
    .complete 96139,1 --Raven Hill Tome (1)
step
    .goto 1431/0,337.07,-10731.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jitters|r
    .turnin 453 >>Turn in Finding the Shadowy Figure
    .accept 268 >>Accept Return to Sven
    .target Jitters
step
    .goto 1431/0,623.27,-10329.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sven Yorgen|r
    .turnin 268 >>Turn in Return to Sven
    .target Sven Yorgen
step
    .goto 1431/0,-1127.41,-10573.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sirra Von'Indi|r
    .turnin 96139 >>Turn in The Valor Family
    .target Sirra Von'Indi
step
    +|cRXP_WARN_That is all of Duskwood for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Redridge Mountains|r: Messenger to Darkshire
    >>|cRXP_FRIENDLY_Stormwind City|r: An Old History Book
step
    .xp 23 >>|cRXP_WARN_The rest of Duskwood is planned from level 23.|r Come back to this guide then
step
    .goto 1431/0,-1321.27,-10581.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Viktori Prism'Antras|r
    .accept 174 >>Accept Look To The Stars
    .target Viktori Prism'Antras
step
    .goto 1431/0,-1272.40,-10586.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy |cRXP_LOOT_Bronze Tube|r from |cRXP_FRIENDLY_Herble Baubbletump|r
    .complete 174,1 --Bronze Tube (1)
    .target Herble Baubbletump
step
    .goto 1431/0,-1321.27,-10581.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Viktori Prism'Antras|r
    .turnin 174 >>Turn in Look To The Stars
    .accept 175 >>Accept Look To The Stars
    .target Viktori Prism'Antras
step
    .goto 1431/0,-1380.40,-10780.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Blind Mary|r
    .turnin 175 >>Turn in Look To The Stars
    .target Blind Mary
step << !Warrior
    .goto 1431/0,-438.800,-10793.400,30 >> Head to the path leading into the Twilight Grove
    .train 431705,1 << Priest
    .train 429308,1 << Mage
    .train 431747,1 << Warlock
    .train 432297,1 << Rogue
    .train 431611,1 << Hunter
    .train 431447,1 << Druid
    .train 429261,1 << Paladin
step << !Warrior
    >>Look for a Quartermaster of |cRXP_FRIENDLY_The Emerald Wardens|r in the marked location and buy your rune from them
    .goto 1431/0,-397.87,-10638.27
    .target Quartermaster Falinar
    .collect 221480,1 << Mage
    .collect 221481,1 << Priest
    .collect 221482,1 << Warlock
    .collect 221511,1 << Warrior
    .collect 221512,1 << Rogue
    .collect 221515,1 << Hunter
    .collect 221517,1 << Druid
    .collect 223288,1 << Paladin
    .train 431705,1 << Priest
    .train 429308,1 << Mage
    .train 431747,1 << Warlock
    .train 432297,1 << Rogue
    .train 431611,1 << Hunter
    .train 431447,1 << Druid
    .train 429261,1 << Paladin
step << !Warrior
    .train 431705 >>|cRXP_WARN_Use the|r |T135791:0|t[|cRXP_FRIENDLY_Nihilist Epiphany|r] |cRXP_WARN_to train|r |T132886:0|t[Void Zone] << Priest
    .train 429308 >>|cRXP_WARN_Use the|r |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: Molten Armor|r] |cRXP_WARN_to train|r |T132221:0|t[Molten Armor] << Mage
    .train 431747 >>|cRXP_WARN_Use the|r |T134419:0|t[|cRXP_FRIENDLY_Rune of Affliction|r] |cRXP_WARN_to train|r |T136228:0|t[Unstable Affliction] << Warlock
    .train 416066 >>|cRXP_WARN_Use the|r |T134419:0|t[|cRXP_FRIENDLY_Rune of Burn|r] |cRXP_WARN_to train|r |T135822:0|t[Burn] << Shaman
    .train 432297 >>|cRXP_WARN_Use the|r |T134419:0|t[|cRXP_FRIENDLY_Rune of Alclarity|r] |cRXP_WARN_to train|r |T236269:0|t[Cut to the Chase] << Rogue
    .train 431611 >>|cRXP_WARN_Use the|r |T134419:0|t[|cRXP_FRIENDLY_Rune of Detonation|r] |cRXP_WARN_to train|r |T133713:0|t[T.N.T.] << Hunter
    .train 431447 >>|cRXP_WARN_Use the|r |T134419:0|t[|cRXP_FRIENDLY_Rune of Bloodshed|r] |cRXP_WARN_to train|r |T304501:0|t[Gore] << Druid
    .train 429261 >>|cRXP_WARN_Use the|r |T134419:0|t[|cRXP_FRIENDLY_Rune of the Hammer|r] |cRXP_WARN_to train|r |T236262:0|t[Improved Hammer of Wrath] << Paladin
    .train 431705,1 << Priest
    .train 429308,1 << Mage
    .train 431747,1 << Warlock
    .train 416066,1 << Shaman
    .train 432297,1 << Rogue
    .train 431611,1 << Hunter
    .train 431447,1 << Druid
    .train 429261,1 << Paladin
step << !Warrior
    .goto 1431/0,-397.87,-10638.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quartermaster Falinar|r
    .vendor >> |cRXP_BUY_Buy up to 5|r |T134718:0|t[Greater Healing Potions] |cRXP_BUY_from him if you want.|r |cRXP_WARN_These can only be used within the incursion zones|r
    .target Quartermaster Falinar
    .train 431705,1 << Priest
    .train 429308,1 << Mage
    .train 431747,1 << Warlock
    .train 432297,1 << Rogue
    .train 431611,1 << Hunter
    .train 431447,1 << Druid
    .train 429261,1 << Paladin
step
    .goto 1431/0,-1213.00,-10532.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Madame Eva|r
    .accept 66 >>Accept The Legend of Stalvan
    .target Madame Eva
step
    .goto 1431/0,-1125.25,-10560.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Clerk Daltry|r
    .turnin 66 >>Turn in The Legend of Stalvan
    .accept 67 >>Accept The Legend of Stalvan
    .target Clerk Daltry
step
    .goto 1431/0,-1152.25,-10559.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Althea Ebonlocke|r
    .accept 57 >>Accept The Night Watch
    .target Commander Althea Ebonlocke
step
    .goto 1431/0,-1158.73,-10517.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tavernkeep Smitts|r
    .accept 156 >>Accept Gather Rot Blossoms
    .target Tavernkeep Smitts
step
    .goto 1431/0,-1125.25,-10560.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Clerk Daltry|r
    .accept 69 >>Accept The Legend of Stalvan
    .target Clerk Daltry
    .isQuestTurnedIn 68 --any of: The Legend of Stalvan
    .xp <22,1
step
    #completewith Along10
    >>As you go: Kill |cRXP_ENEMY_Skeletal Horrors|r and |cRXP_ENEMY_Skeletal Fiends|r. Loot them for |cRXP_LOOT_Rot Blossom|r. |cRXP_WARN_Anything left is finished later|r
    .complete 156,1 --Rot Blossom (8)
    .mob Skeletal Horror
    .mob Skeletal Fiend
step
    #loop
    .goto 1431/0,191.27,-10508.67,0
    .goto 1431/0,191.27,-10508.67,40,0
    .goto 1431/0,203.15,-10484.37,40,0
    .goto 1431/0,221.78,-10445.49,40,0
    .goto 1431/0,232.85,-10478.43,40,0
    .goto 1431/0,228.80,-10491.39,40,0
    >>Kill |cRXP_ENEMY_Skeletal Fiends|r
    .complete 57,1 --Skeletal Fiend slain (15)
    .mob Skeletal Fiend
step
    #label Along10
    #loop
    .goto 1431/0,210.71,-10564.65,0
    .goto 1431/0,210.71,-10564.65,40,0
    .goto 1431/0,231.50,-10573.29,40,0
    .goto 1431/0,277.67,-10571.67,40,0
    .goto 1431/0,353.00,-10578.69,40,0
    .goto 1431/0,391.88,-10586.61,40,0
    .goto 1431/0,441.02,-10579.05,40,0
    .goto 1431/0,445.07,-10548.81,40,0
    .goto 1431/0,453.71,-10476.27,40,0
    .goto 1431/0,393.50,-10536.39,40,0
    >>Kill |cRXP_ENEMY_Skeletal Horrors|r
    .complete 57,2 --Skeletal Horror slain (15)
    .mob Skeletal Horror
step
    .goto 1431/0,-1152.25,-10559.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Althea Ebonlocke|r
    .turnin 57 >>Turn in The Night Watch
    .target Commander Althea Ebonlocke
step
    #loop
    .goto 1431/0,169.67,-10470.33,0
    .goto 1431/0,169.67,-10470.33,40,0
    .goto 1431/0,210.71,-10564.65,40,0
    .goto 1431/0,275.78,-10551.87,40,0
    .goto 1431/0,379.46,-10564.47,40,0
    .goto 1431/0,445.07,-10548.81,40,0
    .goto 1431/0,453.71,-10476.27,40,0
    .goto 1431/0,394.85,-10487.25,40,0
    .goto 1431/0,232.85,-10478.43,40,0
    .goto 1431/0,221.78,-10445.49,40,0
    >>Kill |cRXP_ENEMY_Skeletal Horrors|r and |cRXP_ENEMY_Skeletal Fiends|r. Loot them for |cRXP_LOOT_Rot Blossom|r
    .complete 156,1 --Rot Blossom (8)
    .mob Skeletal Horror
    .mob Skeletal Fiend
step
    .goto 1431/0,-1158.73,-10517.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tavernkeep Smitts|r
    .accept 79 >>Accept The Legend of Stalvan
    .target Tavernkeep Smitts
    .isQuestTurnedIn 78 --any of: The Legend of Stalvan
    .xp <22,1
step
    .goto 1431/0,-1158.73,-10517.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tavernkeep Smitts|r
    .turnin 156 >>Turn in Gather Rot Blossoms
    .accept 159 >>Accept Juice Delivery
    .target Tavernkeep Smitts
step
    .goto 1431/0,-1152.25,-10559.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Althea Ebonlocke|r
    .turnin 79 >>Turn in The Legend of Stalvan
    .target Commander Althea Ebonlocke
    .isOnQuest 79
step
    .goto 1431/0,-1152.25,-10559.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Althea Ebonlocke|r
    .accept 80 >>Accept The Legend of Stalvan
    .target Commander Althea Ebonlocke
    .isQuestTurnedIn 79 --any of: The Legend of Stalvan
    .xp <22,1
step
    .goto 1431/0,-1125.25,-10560.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Clerk Daltry|r
    .turnin 80 >>Turn in The Legend of Stalvan
    .target Clerk Daltry
    .isOnQuest 80
step
    .goto 1431/0,-1125.25,-10560.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Clerk Daltry|r
    .accept 97 >>Accept The Legend of Stalvan
    .target Clerk Daltry
    .isQuestTurnedIn 80 --any of: The Legend of Stalvan
    .xp <22,1
step
    .goto 1431/0,-1152.25,-10559.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Althea Ebonlocke|r
    .turnin 97 >>Turn in The Legend of Stalvan
    .target Commander Althea Ebonlocke
    .isOnQuest 97
step
    .goto 1431/0,74.36,-10282.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Abercrombie|r
    .turnin 159 >>Turn in Juice Delivery
    .target Abercrombie
step
    +|cRXP_WARN_That is all of Duskwood for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Elwynn Forest|r: The Legend of Stalvan
    >>|cRXP_FRIENDLY_Westfall|r: The Legend of Stalvan
step
    .xp 26 >>|cRXP_WARN_The rest of Duskwood is planned from level 26.|r Come back to this guide then
step
    .goto 1431/0,-1380.40,-10780.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Blind Mary|r
    .accept 177 >>Accept Look To The Stars
    .target Blind Mary
step
    .goto 1431/0,-1161.16,-10516.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Trelayne|r
    .target Innkeeper Trelayne
    .home >>Set your Hearthstone to Innkeeper Trelayne's inn
step
    .goto 1431/0,-1213.00,-10532.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Madame Eva|r
    .accept 101 >>Accept The Totem of Infliction
    .target Madame Eva
step
    .goto 1431/0,-1211.92,-10572.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Calor|r
    .accept 173 >>Accept Worgen in the Woods
    .target Calor
step
    #completewith Along4
    >>As you go: Kill |cRXP_ENEMY_Skeletal Warriors|r, |cRXP_ENEMY_Skeletal Horrors|r, |cRXP_ENEMY_Skeletal Mages|r and |cRXP_ENEMY_Skeletal Fiends|r. Loot them for |cRXP_LOOT_Skeleton Finger|r. |cRXP_WARN_Anything left is finished later|r
    .complete 101,3 --Skeleton Finger (10)
    .mob Skeletal Warrior
    .mob Skeletal Horror
    .mob Skeletal Mage
    .mob Skeletal Fiend
step
    #label Along4
    .goto 1431/0,-1350.97,-11011.95
    >>Kill |cRXP_ENEMY_Insane Ghoul|r and loot |cRXP_LOOT_Mary's Looking Glass|r
    .complete 177,1 --Mary's Looking Glass (1)
    .mob Insane Ghoul
step
    .goto 1431/0,-1321.27,-10581.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Viktori Prism'Antras|r
    .turnin 177 >>Turn in Look To The Stars
    .target Viktori Prism'Antras
step
    #loop
    .goto 1431/0,-920.32,-10540.17,0
    .goto 1431/0,-920.32,-10540.17,40,0
    .goto 1431/0,-913.57,-10488.15,40,0
    .goto 1431/0,-924.64,-10412.19,40,0
    .goto 1431/0,-878.20,-10512.45,40,0
    .goto 1431/0,-825.28,-10542.33,40,0
    .goto 1431/0,-840.67,-10576.53,40,0
    >>Kill |cRXP_ENEMY_Nightbane Shadow Weavers|r
    .complete 173,1 --Nightbane Shadow Weaver slain (6)
    .mob Nightbane Shadow Weaver
step
    #loop
    .goto 1431/0,-112.21,-10298.97,0
    .goto 1431/0,-112.21,-10298.97,40,0
    .goto 1431/0,-73.06,-10331.19,40,0
    .goto 1431/0,-52.81,-10364.85,40,0
    .goto 1431/0,-56.05,-10428.03,40,0
    .goto 1431/0,-39.04,-10424.97,40,0
    .goto 1431/0,-18.79,-10480.59,40,0
    .goto 1431/0,1.46,-10365.39,40,0
    .goto 1431/0,0.11,-10301.67,40,0
    .goto 1431/0,-30.13,-10329.75,40,0
    >>Kill |cRXP_ENEMY_Venom Web Spiders|r, |cRXP_ENEMY_Pygmy Venom Web Spiders|r, |cRXP_ENEMY_Green Recluses|r and |cRXP_ENEMY_Naraxis|r. Loot them for |cRXP_LOOT_Vial of Spider Venom|r
    .complete 101,2 --Vial of Spider Venom (1)
    .mob Venom Web Spider
    .mob Pygmy Venom Web Spider
    .mob Green Recluse
    .mob Naraxis
step
    #completewith next
    .hs >>Hearth to Innkeeper Trelayne's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1431/0,-1211.92,-10572.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Calor|r
    .turnin 173 >>Turn in Worgen in the Woods
    .accept 221 >>Accept Worgen in the Woods
    .target Calor
step
    .goto 1431/0,-1152.25,-10559.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Althea Ebonlocke|r
    .accept 58 >>Accept The Night Watch
    .target Commander Althea Ebonlocke
step
    .goto 1431/0,623.27,-10329.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sven Yorgen|r
    .accept 323 >>Accept Proving Your Worth
    .target Sven Yorgen
step
    #loop
    .goto 1431/0,394.85,-10487.25,0
    .goto 1431/0,394.85,-10487.25,40,0
    .goto 1431/0,445.07,-10548.81,40,0
    .goto 1431/0,393.50,-10536.39,40,0
    .goto 1431/0,353.00,-10578.69,40,0
    .goto 1431/0,275.78,-10551.87,40,0
    .goto 1431/0,210.71,-10564.65,40,0
    .goto 1431/0,169.67,-10470.33,40,0
    .goto 1431/0,221.78,-10445.49,40,0
    .goto 1431/0,232.85,-10478.43,40,0
    >>Kill |cRXP_ENEMY_Skeletal Warriors|r, |cRXP_ENEMY_Skeletal Horrors|r, |cRXP_ENEMY_Skeletal Mages|r and |cRXP_ENEMY_Skeletal Fiends|r. Loot them for |cRXP_LOOT_Skeleton Finger|r
    .complete 101,3 --Skeleton Finger (10)
    .mob Skeletal Warrior
    .mob Skeletal Horror
    .mob Skeletal Mage
    .mob Skeletal Fiend
step
    #loop
    .goto 1431/0,343.55,-10426.23,0
    .goto 1431/0,343.55,-10426.23,40,0
    .goto 1431/0,359.21,-10382.67,40,0
    .goto 1431/0,370.01,-10345.59,40,0
    .goto 1431/0,377.30,-10280.79,40,0
    .goto 1431/0,369.74,-10222.29,40,0
    .goto 1431/0,464.24,-10317.69,40,0
    .goto 1431/0,445.34,-10368.45,40,0
    .goto 1431/0,407.27,-10401.03,40,0
    .goto 1431/0,404.84,-10455.39,40,0
    >>Kill |cRXP_ENEMY_Skeletal Raiders|r
    >>Kill |cRXP_ENEMY_Skeletal Healers|r
    >>Kill |cRXP_ENEMY_Skeletal Warders|r
    .complete 323,1 --Skeletal Raider slain (15)
    .complete 323,2 --Skeletal Healer slain (3)
    .complete 323,3 --Skeletal Warder slain (3)
    .mob Skeletal Raider
    .mob Skeletal Healer
    .mob Skeletal Warder
step
    .goto 1431/0,623.27,-10329.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sven Yorgen|r
    .turnin 323 >>Turn in Proving Your Worth
    .accept 269 >>Accept Seeking Wisdom
    .target Sven Yorgen
step
    #loop
    .goto 1431/0,-844.45,-10485.99,0
    .goto 1431/0,-844.45,-10485.99,40,0
    .goto 1431/0,-890.62,-10452.87,40,0
    .goto 1431/0,-957.04,-10523.79,40,0
    .goto 1431/0,-991.60,-10542.15,40,0
    .goto 1431/0,-955.15,-10576.17,40,0
    .goto 1431/0,-979.18,-10609.65,40,0
    .goto 1431/0,-912.49,-10650.33,40,0
    .goto 1431/0,-884.14,-10646.73,40,0
    .goto 1431/0,-894.13,-10613.61,40,0
    >>Kill |cRXP_ENEMY_Nightbane Dark Runners|r
    .complete 221,1 --Nightbane Dark Runner slain (12)
    .mob Nightbane Dark Runner
step
    .goto 1431/0,74.36,-10282.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Abercrombie|r
    .accept 133 >>Accept Ghoulish Effigy
    .target Abercrombie
step
    #loop
    .goto 1431/0,107.84,-10333.71,0
    .goto 1431/0,107.84,-10333.71,40,0
    .goto 1431/0,148.34,-10419.21,40,0
    .goto 1431/0,181.55,-10365.57,40,0
    .goto 1431/0,233.93,-10381.95,40,0
    .goto 1431/0,278.21,-10257.57,40,0
    .goto 1431/0,351.11,-10228.77,40,0
    .goto 1431/0,237.17,-10202.31,40,0
    .goto 1431/0,143.75,-10222.47,40,0
    .goto 1431/0,206.39,-10306.89,40,0
    >>Kill |cRXP_ENEMY_Plague Spreaders|r
    >>Kill |cRXP_ENEMY_Flesh Eaters|r, |cRXP_ENEMY_Bone Chewers|r, |cRXP_ENEMY_Brain Eaters|r and |cRXP_ENEMY_Plague Spreaders|r. Loot them for |cRXP_LOOT_Ghoul Fang|r
    >>Kill |cRXP_ENEMY_Flesh Eaters|r, |cRXP_ENEMY_Bone Chewers|r, |cRXP_ENEMY_Brain Eaters|r and |cRXP_ENEMY_Plague Spreaders|r. Loot them for |cRXP_LOOT_Ghoul Rib|r
    .complete 58,1 --Plague Spreader slain (20)
    .complete 101,1 --Ghoul Fang (10)
    .complete 133,1 --Ghoul Rib (7)
    .mob Plague Spreader
    .mob Flesh Eater
    .mob Bone Chewer
    .mob Brain Eater
step
    .goto 1431/0,74.36,-10282.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Abercrombie|r
    .turnin 133 >>Turn in Ghoulish Effigy
    .target Abercrombie
step
    .hs >> Hearth to Darkshire
step
    #completewith next
    .hs >>Hearth to Innkeeper Trelayne's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1431/0,-1213.00,-10532.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Madame Eva|r
    .turnin 101 >>Turn in The Totem of Infliction
    .target Madame Eva
step
    .goto 1431/0,-1211.92,-10572.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Calor|r
    .turnin 221 >>Turn in Worgen in the Woods
    .target Calor
step
    .goto 1431/0,-1152.25,-10559.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Althea Ebonlocke|r
    .turnin 58 >>Turn in The Night Watch
    .target Commander Althea Ebonlocke
step
    .goto 1431/0,-1125.25,-10560.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Clerk Daltry|r
    .accept 1042 >>Accept The Carevin Family
    .target Clerk Daltry
    .isQuestTurnedIn 1041 --any of: The Caravan Road
    .xp <25,1
step
    .goto 1431/0,-1200.31,-10599.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jonathan Carevin|r
    .turnin 1042 >>Turn in The Carevin Family
    .target Jonathan Carevin
    .isOnQuest 1042
step
    +|cRXP_WARN_That is all of Duskwood for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Stormwind City|r: Seeking Wisdom
step
    .xp 29 >>|cRXP_WARN_The rest of Duskwood is planned from level 29.|r Come back to this guide then
step
    .goto 1431/0,-1321.27,-10581.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Viktori Prism'Antras|r
    .accept 181 >>Accept Look To The Stars
    .target Viktori Prism'Antras
step
    #loop
    .goto 1431/0,-1186.54,-10513.89,0
    .goto 1431/0,-1186.54,-10513.89,40,0
    .goto 1431/0,-1160.35,-10428.75,40,0
    .goto 1431/0,-1115.53,-10386.63,40,0
    .goto 1431/0,-1109.59,-10359.45,40,0
    .goto 1431/0,-1122.55,-10330.83,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Watcher Backus|r. |cRXP_WARN_This NPC walks a patrol route|r
    .accept 1244 >>Accept The Missing Diplomat
    .unitscan Watcher Backus
    .isQuestTurnedIn 1243 --any of: The Missing Diplomat
    .xp <28,1
step
    .goto 1431/0,74.36,-10282.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Abercrombie|r
    .accept 134 >>Accept Ogre Thieves
    .target Abercrombie
step
    .goto 1431/0,187.49,-11013.93
    >>Open the |cRXP_PICK_Defias Strongbox|r. Loot it for |cRXP_LOOT_Defias Docket|r
    .complete 1244,1 --Defias Docket (1)
    .isOnQuest 1244
step
    .goto 1431/0,-69.01,-11090.97
    >>Pick up |cRXP_PICK_Abercrombie's Crate|r from the ground
    .complete 134,1 --Abercrombie's Crate (1)
step
    .goto 1431/0,-160.54,-11224.89
    >>Kill |cRXP_ENEMY_Zzarc' Vul|r and loot |cRXP_LOOT_Ogre's Monocle|r
    .complete 181,1 --Ogre's Monocle (1)
    .mob Zzarc' Vul
step
    .goto 1431/0,74.36,-10282.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Abercrombie|r
    .turnin 134 >>Turn in Ogre Thieves
    .accept 160 >>Accept Note to the Mayor
    .target Abercrombie
step << Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Avette Fellwood|r
    .goto 1431/0,-1145.23,-10522.35
    .vendor 228 >>|cRXP_BUY_Stock up on|r |T132382:0|t[Razor Arrows] |cRXP_WARN_Don't forget this, there is a grinding session ahead!|r
    .target Avette Fellwood
step
    .goto 1431/0,-1108.78,-10552.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lord Ello Ebonlocke|r
    .turnin 160 >>Turn in Note to the Mayor while you are here
    .isQuestComplete 160
    .target Lord Ello Ebonlocke
step
    #loop
    .goto 1431/0,-1122.55,-10330.83,0
    .goto 1431/0,-1122.55,-10330.83,40,0
    .goto 1431/0,-1109.59,-10359.45,40,0
    .goto 1431/0,-1115.53,-10386.63,40,0
    .goto 1431/0,-1160.35,-10428.75,40,0
    .goto 1431/0,-1186.54,-10513.89,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Watcher Backus|r. |cRXP_WARN_This NPC walks a patrol route|r
    .turnin 1244 >>Turn in The Missing Diplomat
    .unitscan Watcher Backus
    .isOnQuest 1244
step
    #loop
    .goto 1431/0,-1122.55,-10330.83,0
    .goto 1431/0,-1122.55,-10330.83,40,0
    .goto 1431/0,-1109.59,-10359.45,40,0
    .goto 1431/0,-1115.53,-10386.63,40,0
    .goto 1431/0,-1160.35,-10428.75,40,0
    .goto 1431/0,-1186.54,-10513.89,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Watcher Backus|r. |cRXP_WARN_This NPC walks a patrol route|r
    .accept 1245 >>Accept The Missing Diplomat
    .unitscan Watcher Backus
    .isQuestTurnedIn 1244 --any of: The Missing Diplomat
    .xp <28,1
step
    .goto 1431/0,-1321.27,-10581.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Viktori Prism'Antras|r
    .turnin 181 >>Turn in Look To The Stars
    .target Viktori Prism'Antras
step
    .goto 1431/0,-1211.92,-10572.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Calor|r
    .accept 222 >>Accept Worgen in the Woods
    .target Calor
step
    .goto 1431/0,-1108.78,-10552.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lord Ello Ebonlocke|r
    .turnin 160 >>Turn in Note to the Mayor
    .accept 251 >>Accept Translate Abercrombie's Note
    .target Lord Ello Ebonlocke
step
    .goto 1431/0,-1127.41,-10573.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sirra Von'Indi|r
    .turnin 251 >>Turn in Translate Abercrombie's Note
    .accept 401 >>Accept Wait for Sirra to Finish
    .turnin 401 >>Turn in Wait for Sirra to Finish
    .accept 252 >>Accept Translation to Ello
    .target Sirra Von'Indi
step
    .goto 1431/0,-1108.78,-10552.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lord Ello Ebonlocke|r
    .turnin 252 >>Turn in Translation to Ello
    .accept 253 >>Accept Bride of the Embalmer
    .target Lord Ello Ebonlocke
step
    #loop
    .goto 1431/0,-1121.74,-10929.51,0
    .goto 1431/0,-1121.74,-10929.51,40,0
    .goto 1431/0,-1122.82,-10969.11,40,0
    .goto 1431/0,-1099.06,-11006.55,40,0
    .goto 1431/0,-1111.75,-11061.45,40,0
    .goto 1431/0,-1141.18,-11076.03,40,0
    .goto 1431/0,-1166.29,-11149.29,40,0
    .goto 1431/0,-1161.97,-11106.63,40,0
    .goto 1431/0,-1147.93,-11023.29,40,0
    .goto 1431/0,-1157.38,-10974.87,40,0
    >>Kill |cRXP_ENEMY_Nightbane Vile Fangs|r
    >>Kill |cRXP_ENEMY_Nightbane Tainted Ones|r
    .complete 222,1 --Nightbane Vile Fang slain (8)
    .complete 222,2 --Nightbane Tainted One slain (8)
    .mob Nightbane Vile Fang
    .mob Nightbane Tainted One
step
    .goto 1431/0,-1211.92,-10572.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Calor|r
    .turnin 222 >>Turn in Worgen in the Woods
    .accept 223 >>Accept Worgen in the Woods
    .target Calor
step
    .goto 1431/0,-1200.31,-10599.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jonathan Carevin|r
    .turnin 223 >>Turn in Worgen in the Woods
    .target Jonathan Carevin
step
    .goto 1431/0,55.19,-10273.05
    >>Kill |cRXP_ENEMY_Eliza|r and loot |cRXP_LOOT_The Embalmer's Heart|r
    .complete 253,1 --The Embalmer's Heart (1)
    .mob Eliza
step
    .goto 1431/0,-1108.78,-10552.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lord Ello Ebonlocke|r
    .turnin 253 >>Turn in Bride of the Embalmer
    .target Lord Ello Ebonlocke
step
    .goto 1431/0,-1200.31,-10599.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jonathan Carevin|r
    .accept 1043 >>Accept The Scythe of Elune
    .target Jonathan Carevin
    .isQuestTurnedIn 1042 --any of: The Carevin Family
    .xp <25,1
step
    .goto 1431/0,-1151.98,-11141.19
    >>Click the |cRXP_PICK_Mound of Dirt|r
    .complete 1043,1 --Find evidence of the Scythe of Elune
    .isOnQuest 1043
step
    .goto 1431/0,-1200.31,-10599.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jonathan Carevin|r
    .turnin 1043 >>Turn in The Scythe of Elune
    .target Jonathan Carevin
    .isOnQuest 1043
step
    .goto 1431/0,-1200.31,-10599.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jonathan Carevin|r
    .accept 1044 >>Accept Answered Questions
    .target Jonathan Carevin
    .isQuestTurnedIn 1043 --any of: The Scythe of Elune
    .xp <25,1
step
    +|cRXP_WARN_End of the Duskwood route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Darnassus|r: Answered Questions
    >>|cRXP_FRIENDLY_Stormwind City|r: The Missing Diplomat
]])
