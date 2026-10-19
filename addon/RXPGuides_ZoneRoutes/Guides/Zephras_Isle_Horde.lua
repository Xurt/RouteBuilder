-- 1-13 Zephras Isle: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- Split into 4 guides, listed under "1 - 15 Zephras Isle" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Zephras Isle.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 1 - 15 Zephras Isle
#subweight -1
#name 1-5 Zephras Isle: around Rorian the Dayseeker
#next Zone Routes (Horde)\5-9 Zephras Isle: around Constable Aonda

step
    .goto 2521,42.82,23.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ailee Farheart|r
    .accept 92460 >>Accept Coming of Age
    .target Ailee Farheart
step
    .goto 2521,42.05,23.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rorian the Dayseeker|r
    .turnin 92460 >>Turn in Coming of Age
    .accept 92461 >>Accept Harmony in Balance
    .target Rorian the Dayseeker
step
    #completewith Along2
    >>As you go: Kill |cRXP_ENEMY_Juvenile Vuldrens|r. |cRXP_WARN_Anything left is finished later|r
    .complete 92461,1 --Juvenile Vuldren slain (8)
    .mob Juvenile Vuldren
step
    #label Along2
    .goto 2521,43.44,24.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elatrell Featherlight|r
    .accept 92462 >>Accept Infestation Investigation
    .target Elatrell Featherlight
step
    #loop
    .goto 2521,45.04,25.33,0
    .goto 2521,45.04,25.33,40,0
    .goto 2521,47.17,22.03,40,0
    .goto 2521,44.98,20.20,40,0
    .goto 2521,43.25,21.87,40,0
    .goto 2521,41.17,28.03,40,0
    .goto 2521,44.15,28.30,40,0
    .goto 2521,45.91,27.99,40,0
    .goto 2521,47.74,28.36,40,0
    .goto 2521,46.92,25.56,40,0
    >>Kill |cRXP_ENEMY_Pesky Cirrusflies|r
    >>Kill |cRXP_ENEMY_Juvenile Vuldrens|r
    .complete 92462,1 --Pesky Cirrusfly slain (8)
    .complete 92461,1 --Juvenile Vuldren slain (8)
    .mob Pesky Cirrusfly
    .mob Juvenile Vuldren
step << Horde Shaman
    .xp 2+480 >>Grind to 480+/900xp to reach level 3 after turn ins for the totem quest.
step
    .goto 2521,43.44,24.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elatrell Featherlight|r
    .turnin 92462 >>Turn in Infestation Investigation
    .accept 92463 >>Accept The Cirrusfly Queen
    .target Elatrell Featherlight
step << Warrior
    .goto 2521,43.66,24.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Blademaster Ren::251964|r.
    .train 6673 >>Train |T132333:0|t[Battle Shout]
    .target Blademaster Ren::251964
    .money <0.0010
    .xp <1,1
    .train 5242,1
step << Skyborne
    .goto 2521,43.68,24.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Myriaal Mistwake|r
    .accept 92474 >>Accept Falling With Style
    .target Myriaal Mistwake
step
    .goto 2521,42.05,23.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rorian the Dayseeker|r
    .turnin 92461 >>Turn in Harmony in Balance
    .turnin 92474 >>Turn in Falling With Style << Skyborne
    .accept 92464 >>Accept Elemental Unrest
    .accept 92532 >>Accept The Warrior's Path << Warrior
    .accept 92482 >>Accept The Way of the Hunter << Hunter
    .accept 92484 >>Accept Embracing the Elements << Shaman
    .accept 92483 >>Accept At Home in the Shadows << Rogue
    .accept 92485 >>Accept A Student of Nature << Druid
    .target Rorian the Dayseeker
step << Warrior
    .goto 2521,43.65,24.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Blademaster Ren|r
    .turnin 92532 >>Turn in The Warrior's Path while you are here
    .isQuestComplete 92532
    .target Blademaster Ren
step << Rogue
    .goto 2521,43.74,24.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Akeri Duskblade|r
    .turnin 92483 >>Turn in At Home in the Shadows while you are here
    .isQuestComplete 92483
    .target Akeri Duskblade
step << Skyborne
    .goto 2521,42.61,24.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ventaari Brightwish|r
    .accept 92598 >>Accept The Gift of Skysight
    .target Ventaari Brightwish
step << !Warrior !Rogue
    .goto 2521,42.749,24.496
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Uualia Suncrest::251537|r
    >>|cRXP_BUY_Buy|r |T132794:0|t[Refreshing Spring Water] |cRXP_BUY_from her|r << !Hunter !Shaman
    >>|cRXP_BUY_Buy|r |T132382:0|t[Rough Arrows] |cRXP_BUY_from her|r << Hunter
    .vendor 251537 >>|cRXP_WARN_Vendor trash|r
    .collect 159,20 << !Hunter !Shaman
    .collect 2512,1000 << Hunter
    .target Uualia Suncrest::251537
    .subzoneskip 16635,1
step << Hunter
    .goto 2521,42.49,23.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tai'ree Farsight|r
    .turnin 92482 >>Turn in The Way of the Hunter
    .target Tai'ree Farsight
step << Shaman
    .goto 2521,42.79,23.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Windshaper Boro|r
    .turnin 92484 >>Turn in Embracing the Elements
    .accept 92466 >>Accept Call of Earth
    .target Windshaper Boro
step << Horde Shaman
    .goto 2521,42.79,23.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Windshaper Boro::251374|r.
    .train 8017 >>Train |T136086:0|t[Rockbiter]
    .target Windshaper Boro::251374
    .money <0.0010
    .xp <1,1
step << Druid
    .goto 2521,41.66,23.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Xyton Silverwind|r
    .turnin 92485 >>Turn in A Student of Nature
    .target Xyton Silverwind
step << Druid
    .goto 2521,41.653,23.337
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Xyton Silverwind::251373|r.
    .train 1126 >>Train |T136078:0|t[Mark of the Wild]
    .target Xyton Silverwind::251373
    .money <0.0010
    .xp <1,1
step << Alliance Mage
    .goto 2521,41.55,23.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dorii Brightwhisper::251379|r.
    .train 1459 >>Train |T135932:0|t[Arcane Intellect]
    .target Dorii Brightwhisper::251379
    .money <0.0010
    .xp <1,1
step
    .goto 2521,43.37,23.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dalia the Collector|r
    .accept 93552 >>Accept Harvesting Windstones
    .target Dalia the Collector
step
    .xp 2 >>Grind to level 2 (The Anchors of Zephras needs it)
step
    #completewith Along14
    >>As you go: Loot the |cRXP_PICK_Raw Windstones|r for |cRXP_LOOT_Windstone Cluster|r. |cRXP_WARN_Anything left is finished later|r
    .complete 93552,1 --Windstone Cluster (15)
step
    .goto 2521,43.77,24.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Halaan Hawk-Eye|r
    .accept 94414 >>Accept The Anchors of Zephras
    .target Halaan Hawk-Eye
step
    .goto 2521,43.77,24.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Halaan Hawk-Eye|r
    .complete 94414,1 --Halaan Hawk-Eye
    .target Halaan Hawk-Eye
step
    #label Along14
    .goto 2521,43.77,24.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Halaan Hawk-Eye|r
    .turnin 94414 >>Turn in The Anchors of Zephras
    .target Halaan Hawk-Eye
step << Skyborne
    #completewith Along15
    >>As you go: Click the |cRXP_PICK_Elemental Convergence|r. |cRXP_WARN_Anything left is finished later|r
    .complete 92598,1 --Elemental Convergence
step << Shaman
    #completewith Along15
    >>As you go: Kill |cRXP_ENEMY_Al'Aketh Brutes|r, |cRXP_ENEMY_Al'Aketh Converts|r, |cRXP_ENEMY_Al'Aketh Neophytes|r and |cRXP_ENEMY_High Priestess Lorthunas|r. Loot them for |cRXP_LOOT_Signet of Akir|r. |cRXP_WARN_Anything left is finished later|r
    .complete 92466,1 --Signet of Akir (1)
    .mob Al'Aketh Brute
    .mob Al'Aketh Convert
    .mob Al'Aketh Neophyte
    .mob High Priestess Lorthuna
step
    #label Along15
    .goto 2521,47.25,21.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yala Windwatcher|r
    .turnin 92464 >>Turn in Elemental Unrest
    .accept 92465 >>Accept Agitators
    .target Yala Windwatcher
step
    #loop
    .goto 2521,47.66,21.38,0
    .goto 2521,47.66,21.38,40,0
    .goto 2521,49.02,21.04,40,0
    .goto 2521,48.01,18.99,40,0
    .goto 2521,47.18,17.69,40,0
    .goto 2521,46.81,19.40,40,0
    .goto 2521,45.92,18.98,40,0
    .goto 2521,45.05,20.50,40,0
    .goto 2521,45.64,22.32,40,0
    .goto 2521,46.98,23.32,40,0
    >>Click the |cRXP_PICK_Elemental Convergence|r << Skyborne
    >>Kill |cRXP_ENEMY_Al'Aketh Converts|r
    >>Kill |cRXP_ENEMY_Roiling Winds|r
    >>Kill |cRXP_ENEMY_Al'Aketh Brutes|r, |cRXP_ENEMY_Al'Aketh Converts|r, |cRXP_ENEMY_Al'Aketh Neophytes|r and |cRXP_ENEMY_High Priestess Lorthunas|r. Loot them for |cRXP_LOOT_Signet of Akir|r << Shaman
    .complete 92598,1 << Skyborne --Elemental Convergence
    .complete 92465,1 --Al'Aketh Convert slain (7)
    .complete 92465,2 --Roiling Winds slain (6)
    .complete 92466,1 << Shaman --Signet of Akir (1)
    .mob Al'Aketh Convert
    .mob Roiling Winds
    .mob Al'Aketh Brute << Shaman
    .mob Al'Aketh Neophyte << Shaman
    .mob High Priestess Lorthuna << Shaman
step
    .goto 2521,47.25,21.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yala Windwatcher|r
    .turnin 92465 >>Turn in Agitators
    .accept 92469 >>Accept Return to Rorian
    .target Yala Windwatcher
step << Horde Shaman
    .subzoneskip 16622,1
    .hs >>Hearth to Thendal Village
step
    #completewith Along19
    >>As you go: Loot the |cRXP_PICK_Raw Windstones|r for |cRXP_LOOT_Windstone Cluster|r. |cRXP_WARN_Anything left is finished later|r
    .complete 93552,1 --Windstone Cluster (15)
step << Shaman
    .goto 2521,42.79,23.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Windshaper Boro|r
    .turnin 92466 >>Turn in Call of Earth
    .accept 92467 >>Accept Call of Earth
    .target Windshaper Boro
step << Skyborne
    .goto 2521,42.61,24.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ventaari Brightwish|r
    .turnin 92598 >>Turn in The Gift of Skysight while you are here
    .isQuestComplete 92598
    .target Ventaari Brightwish
step
    .goto 2521,42.05,23.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rorian the Dayseeker|r
    .turnin 92469 >>Turn in Return to Rorian while you are here
    .isQuestComplete 92469
    .target Rorian the Dayseeker
step
    #label Along19
    .goto 2521,48.41,28.53
    >>Kill |cRXP_ENEMY_Cirrusfly Queen|r
    .complete 92463,1 --Cirrusfly Queen slain (1)
    .mob Cirrusfly Queen
step << Shaman
    .goto 2521,49.67,23.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Minor Manifestation of Earth|r
    .turnin 92467 >>Turn in Call of Earth
    .accept 92468 >>Accept Call of Earth
    .target Minor Manifestation of Earth
step
    #loop
    .goto 2521,48.13,29.30,0
    .goto 2521,48.13,29.30,40,0
    .goto 2521,46.76,27.94,40,0
    .goto 2521,45.33,29.14,40,0
    .goto 2521,42.87,28.75,40,0
    .goto 2521,41.51,26.94,40,0
    .goto 2521,42.82,22.27,40,0
    .goto 2521,44.23,24.95,40,0
    .goto 2521,46.61,24.60,40,0
    .goto 2521,48.29,25.67,40,0
    >>Loot the |cRXP_PICK_Raw Windstones|r for |cRXP_LOOT_Windstone Cluster|r
    .complete 93552,1 --Windstone Cluster (15)
step << Alliance/!Shaman
    .xp 3+300 >>Grind to 300+/1400xp
step << Alliance/!Shaman
    .hs >>Hearth to Thendal Village
    .cooldown item,6948,>0
step
    .goto 2521,43.44,24.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elatrell Featherlight|r
    .turnin 92463 >>Turn in The Cirrusfly Queen while you are here
    .isQuestComplete 92463
    .target Elatrell Featherlight
step << Shaman
    .goto 2521,42.79,23.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Windshaper Boro|r
    .turnin 92468 >>Turn in Call of Earth while you are here
    .isQuestComplete 92468
    .target Windshaper Boro
step
    .goto 2521,43.37,23.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dalia the Collector|r
    .turnin 93552 >>Turn in Harvesting Windstones
    .target Dalia the Collector
step
    .goto 2521,43.44,24.80
    .train 2575 >>Use |T4625105:0|t[Mining for Dummies] |cRXP_WARN_while walking towards the questgiver|r.
step
    .goto 2521,43.44,24.80
    .train 2366 >>Use |T4624731:0|t[Wild Harvest] |cRXP_WARN_while walking towards the questgiver|r.
step
    .goto 2521,43.44,24.80
    .train 8613 >>Use |T4624731:0|t[Pelt Collecting for Beginners] |cRXP_WARN_while walking towards the questgiver|r.
step << Rogue
    .goto 2521,43.74,24.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Akeri Duskblade|r
    .turnin 92483 >>Turn in At Home in the Shadows
    .target Akeri Duskblade
step << Warrior
    .train 6546,1
    .goto 2521,43.66,24.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Blademaster Ren::251964|r.
    .train 100 >>Train |T132337:0|t[Charge]
    .train 6178,1
    .train 772 >>Train |T132155:0|t[Rend]
    .target Blademaster Ren::251964
    .money <0.02
    .xp <4,1
    .isOnQuest 92469
step
    .goto 2521,43.44,24.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elatrell Featherlight|r
    .turnin 92463 >>Turn in The Cirrusfly Queen
    .target Elatrell Featherlight
step
    .train 2575 >>Use |T4625105:0|t[Mining for Dummies].
step
    .train 2366 >>Use |T4624731:0|t[Wild Harvest].
step
    .train 8613 >>Use |T4624731:0|t[Pelt Collecting for Beginners].
step << Warrior
    .goto 2521,43.65,24.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Blademaster Ren|r
    .turnin 92532 >>Turn in The Warrior's Path
    .target Blademaster Ren
step << Hunter Horde
    .goto 2521,42.467,23.731
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tai'ree Farsight::251376|r
    .train 13163 >>Train |T132159:0|t[Aspect of the Monkey]
    .train 1978 >>Train |T132204:0|t[Serpent Sting]
    .xp <4,1
    .money <0.02
    .target Tai'ree Farsight::251376
step << Shaman
    .goto 2521,42.79,23.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Windshaper Boro|r
    .turnin 92468 >>Turn in Call of Earth
    .target Windshaper Boro
step
    .goto 2521,42.05,23.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rorian the Dayseeker|r
    .turnin 92469 >>Turn in Return to Rorian
    .accept 92471 >>Accept Aetheen of the Gales
    .target Rorian the Dayseeker
step << Druid Horde
    .goto 2521,41.653,23.337
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Xyton Silverwind::251373|r.
    .train 8921 >>Train |T136096:0|t[Moonfire]
    .train 774 >>Train |T136081:0|t[Rejuvenation]
    .xp <4,1
    .money <0.02
    .target Xyton Silverwind::251373
step << Druid Alliance
    .goto 2521,41.653,23.337
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Xyton Silverwind::251373|r.
    .train 8921 >>Train |T136096:0|t[Moonfire]
    .train 774 >>Train |T136081:0|t[Rejuvenation]
    .xp <4,1
    .money <0.02
    .target Xyton Silverwind::251373
step << Alliance Mage
    .goto 2521,41.55,23.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dorii Brightwhisper::251379|r.
    .train 116 >>Train |T135846:0|t[Frostbolt]
    .target Dorii Brightwhisper::251379
    .money <0.01
    .xp <4,1
step
    .goto 2521,42.76,23.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aetheen of the Gales|r
    .turnin 92471 >>Turn in Aetheen of the Gales
    .accept 92470 >>Accept Foul Matriarch
    .target Aetheen of the Gales
step << Horde Shaman
    .goto 2521,42.788,23.566
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Windshaper Boro::251374|r.
    .train 8042 >>Train |T136026:0|t[Earth Shock]
    .target Windshaper Boro::251374
    .money <0.01
    .xp <4,1
step << Skyborne
    .goto 2521,42.61,24.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ventaari Brightwish|r
    .turnin 92598 >>Turn in The Gift of Skysight
    .target Ventaari Brightwish
step << Hunter Alliance
    .goto 2521,42.467,23.731
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tai'ree Farsight::251376|r
    .train 13163 >>Train |T132159:0|t[Aspect of the Monkey]
    .train 1978 >>Train |T132204:0|t[Serpent Sting]
    .xp <4,1
    .money <0.02
    .target Tai'ree Farsight::251376
step
    .goto 2521,42.41,25.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Valreaa Valewind|r
    .accept 92473 >>Accept Aggressive Encroachment
    .target Valreaa Valewind
step
    #loop
    .goto 2521,39.71,26.78,0
    .goto 2521,39.71,26.78,40,0
    .goto 2521,38.05,28.12,40,0
    .goto 2521,38.88,30.20,40,0
    .goto 2521,40.35,29.86,40,0
    .goto 2521,38.75,32.56,40,0
    .goto 2521,36.83,31.17,40,0
    .goto 2521,35.65,26.07,40,0
    .goto 2521,36.17,22.76,40,0
    .goto 2521,37.88,24.44,40,0
    >>Kill |cRXP_ENEMY_Scrawny Urseras|r. Loot them for |cRXP_LOOT_Scrawny Ursera Claw|r
    >>Kill |cRXP_ENEMY_Urs'anah|r and loot |cRXP_LOOT_Head of Urs'anah|r
    >>Kill |cRXP_ENEMY_Ursera Scavengers|r
    .complete 92473,1 --Scrawny Ursera Claw (6)
    .complete 92470,2 --Head of Urs'anah (1)
    .complete 92470,1 --Ursera Scavenger slain (8)
    .mob Scrawny Ursera
    .mob Urs'anah
    .mob Ursera Scavenger
step
    .goto 2521,42.76,23.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aetheen of the Gales|r
    .turnin 92470 >>Turn in Foul Matriarch
    .accept 92472 >>Accept The Next Step
    .accept 96638 >>Accept The Adventurer
    .target Aetheen of the Gales
step
    .goto 2521,42.41,25.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Valreaa Valewind|r
    .turnin 92473 >>Turn in Aggressive Encroachment
    .target Valreaa Valewind
step
    .goto 2521,38.31,30.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hanaa Nightwind|r
    .accept 92544 >>Accept Al'Aketh Thugs
    .target Hanaa Nightwind
step
    #loop
    .goto 2521,38.28,30.69,0
    .goto 2521,38.28,30.69,40,0
    .goto 2521,36.67,30.71,40,0
    .goto 2521,35.31,32.00,40,0
    .goto 2521,36.05,33.53,40,0
    .goto 2521,36.28,35.28,40,0
    .goto 2521,37.17,34.78,40,0
    .goto 2521,38.05,34.32,40,0
    .goto 2521,39.09,34.12,40,0
    .goto 2521,37.18,33.37,40,0
    >>Kill |cRXP_ENEMY_Malduko Cloudcrush|r
    >>Kill |cRXP_ENEMY_Al'Aketh Brutes|r
    >>Kill |cRXP_ENEMY_Al'Aketh Neophytes|r
    .complete 92544,3 --Malduko Cloudcrush slain (1)
    .complete 92544,1 --Al'Aketh Brute slain (6)
    .complete 92544,2 --Al'Aketh Neophyte slain (4)
    .mob Malduko Cloudcrush
    .mob Al'Aketh Brute
    .mob Al'Aketh Neophyte
step
    .xp 5+1740 >>Grind to level 5 1740+/2800xp to reach level 6 after turn ins in the next village to be able to train new spells.
step
    .goto 2521,38.31,30.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hanaa Nightwind|r
    .turnin 92544 >>Turn in Al'Aketh Thugs
    .target Hanaa Nightwind
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 1 - 15 Zephras Isle
#subweight -1
#name 5-9 Zephras Isle: around Constable Aonda
#next Zone Routes (Horde)\9-11 Zephras Isle: around Quel'ana Quickgale

step
    .goto 2521,45.67,45.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Constable Aonda|r
    .turnin 92472 >>Turn in The Next Step
    .target Constable Aonda
    .isOnQuest 92472
step
    .goto 2521,45.67,45.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Constable Aonda|r
    .accept 92514 >>Accept Welcome to Shen'dar Village
    .target Constable Aonda
step << Mage
    .goto 2521,45.1,45.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dorii Brightwhisper::251379|r.
    .train 143 >>Train |T135812:0|t[Fireball (Rank 2)]
    .train 2136 >>Train |T135807:0|t[Fire Blast]
    .train 1296017 >>Train |T8188276:0|t[Comprehend Scroll]
    .target Dorii Brightwhisper::251379
    .money <0.03
    .xp <6,1
step
    .goto 2521,43.51,44.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Illaya Amberwind|r
    .complete 92514,1 --Illaya Amberwind
    .target Illaya Amberwind
step
    .goto 2521,41.66,44.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raan Wildwind|r
    .turnin 96638 >>Turn in The Adventurer while you are here
    .isQuestComplete 96638
    .target Raan Wildwind
step
    .goto 2521,43.51,44.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Illaya Amberwind|r
    .accept 92595 >>Accept The Windshapers
    .target Illaya Amberwind
step
    .goto 2521,43.51,44.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Illaya Amberwind|r
    .complete 92595,1 --Illaya Amberwind
    .target Illaya Amberwind
step
    .goto 2521,43.51,44.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Illaya Amberwind|r
    .turnin 92595 >>Turn in The Windshapers
    .accept 94411 >>Accept Meddlesome Mages
    .target Illaya Amberwind
step << Horde Shaman
    .goto 2521,43.454,44.872
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aarnor Galestrike::254082|r
    .trainer >>Train your class spells
    .target Aarnor Galestrike::254082
    .money <0.01
    .xp <6,1
step
    #loop
    .goto 2521,43.52,44.15,0
    .goto 2521,43.52,44.15,40,0
    .goto 2521,43.25,43.88,40,0
    .goto 2521,41.76,44.72,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Coriella Calmbreeze|r
    .complete 92514,2 --Coriella Calmbreeze
    .target Coriella Calmbreeze
step << Alliance Rogue
    .goto 2521,43.16,43.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Miriaan Mistblade::254087|r
    .train 1757 >>Train |T136189:0|t[Sinister Strike (Rank 2)]
    .train 1776 >>Train |T132155:0|t[Gouge]
    .train 1777,1
    .target Miriaan Mistblade::254087
    .money <0.02
    .xp <6,1
step << Alliance Rogue
    .goto 2521,43.16,43.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Miriaan Mistblade::254087|r
    .train 1757 >> Train |T136189:0|t[Sinister Strike (Rank 2)]
    .target Miriaan Mistblade::254087
    .money <0.01
    .xp <6,1
step
    .goto 2521,43.20,43.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Coriella Calmbreeze|r
    .target Coriella Calmbreeze
    .home >>Set your Hearthstone to Coriella Calmbreeze's inn
step << Horde Rogue
    .goto 2521,43.16,43.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Miriaan Mistblade::254087|r
    .train 1757 >>Train |T136189:0|t[Sinister Strike (Rank 2)]
    .train 1776 >>Train |T132155:0|t[Gouge]
    .train 1777,1
    .target Miriaan Mistblade::254087
    .money <0.02
    .xp <6,1
step << Horde Rogue
    .goto 2521,43.16,43.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Miriaan Mistblade::254087|r
    .train 1757 >> Train |T136189:0|t[Sinister Strike (Rank 2)]
    .target Miriaan Mistblade::254087
    .money <0.01
    .xp <6,1
step << Mage
    .isOnQuest 93461
    .subzoneskip 16624,1
    .goto 2521,43.24,43.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nasalanna Windsinger::257020|r
    .train 7411 >>Train |T136189:0|t[Enchanting] |cRXP_WARN_for immediate wand|r
    .target Nasalanna Windsinger::257020
step << Mage
    .isOnQuest 93461
    .train 7411,3
    >>Use the |T135225:0|t[Runed Copper Rod] macro below, then use the |T135645:0|t[Novice's Practice Wand] macro
    .collect 6218,1
    .collect 247789,1
step << Warrior
    .goto 2521,44.95,45.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corsan Earthrazer::254088|r
    .train 3127 >>Train |T132269:0|t[Parry]
    .target Corsan Earthrazer::254088
    .money <0.01
    .xp <6,1
step << Hunter
    .goto 2521,45.07,45.27,25,0
    .goto 2521,45.263,44.236
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elayaa Easewind::254084|r inside the house.
    .train 3044 >>Train |T132218:0|t[Arcane Shot]
    .train 1130 >>Train |T132212:0|t[Hunter's Mark]
    .target Elayaa Easewind::254084
    .money <0.02
    .xp <6,1
step << Druid
    .goto 2521,45.07,45.27,25,0
    .goto 2521,45.154,44.217
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Naeluna Swiftmend::254081|r inside the house.
    .train 467 >>Train |T136104:0|t[Thorns]
    .train 5177 >>Train |T136006:0|t[Wrath (Rank 2)]
    .xp <6,1
    .money <0.02
    .target Naeluna Swiftmend::254081
step
    .goto 2521,45.67,45.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Constable Aonda|r
    .turnin 92514 >>Turn in Welcome to Shen'dar Village
    .accept 92517 >>Accept The Criminal Element
    .target Constable Aonda
step
    .goto 2521,44.46,44.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Teeri Wellwind|r
    .accept 93319 >>Accept Pilfered Windstones
    .accept 92516 >>Accept Hippogryph Harrassment
    .target Teeri Wellwind
step
    .goto 2521,44.68,44.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Indari Sunseam|r
    .accept 92515 >>Accept The Problem With Prideclaws
    .target Indari Sunseam
step
    #completewith Along60
    >>As you go: Kill |cRXP_ENEMY_Prideclaws|r. Loot them for |cRXP_LOOT_Prideclaw Pelt|r. |cRXP_WARN_Anything left is finished later|r
    .complete 92515,1 --Prideclaw Pelt (10)
    .mob Prideclaw
step
    .goto 2521,44.88,44.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Taleen Shimmerthread|r
    .accept 93951 >>Accept A Little Beauty
    .target Taleen Shimmerthread
step
    .goto 2521,44.32,44.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zerril Softbreeze|r
    .accept 92553 >>Accept Restocking the Larders
    .target Zerril Softbreeze
step << Horde Rogue
    .goto 2521,43.16,43.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Miriaan Mistblade::254087|r
    .train 1757 >>Train |T136189:0|t[Sinister Strike (Rank 2)]
    .target Miriaan Mistblade::254087
    .money <0.01
    .xp <6,1
step << Alliance Rogue
    .goto 2521,43.16,43.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Miriaan Mistblade::254087|r
    .train 1757 >>Train |T136189:0|t[Sinister Strike (Rank 2)]
    .target Miriaan Mistblade::254087
    .money <0.01
    .xp <6,1
step
    #completewith Along81
    >>As you go: Kill |cRXP_ENEMY_Shadowgale Urseras|r, |cRXP_ENEMY_Highlands Urseras|r, |cRXP_ENEMY_Den'dralass|r and |cRXP_ENEMY_Hippogryph Matriarches|r. Loot them for |cRXP_LOOT_Small Egg|r. |cRXP_WARN_Anything left is finished later|r
    .complete 92553,1 --Small Egg (3)
    .mob Shadowgale Ursera
    .mob Highlands Ursera
    .mob Den'dralass
    .mob Hippogryph Matriarch
step
    #completewith Along77
    >>As you go: Kill |cRXP_ENEMY_Galestriders|r. Loot them for |cRXP_LOOT_Strider Meat|r. |cRXP_WARN_Anything left is finished later|r
    .complete 92553,2 --Strider Meat (8)
    .mob Galestrider
step
    #loop
    .goto 2521,45.21,41.42,0
    .goto 2521,45.21,41.42,40,0
    .goto 2521,45.87,40.44,40,0
    .goto 2521,45.93,38.94,40,0
    .goto 2521,46.80,39.11,40,0
    .goto 2521,46.87,40.33,40,0
    .goto 2521,47.67,38.81,40,0
    .goto 2521,48.10,37.37,40,0
    .goto 2521,45.88,37.36,40,0
    .goto 2521,44.89,39.27,40,0
    >>Kill |cRXP_ENEMY_High Order Apprentices|r
    .complete 94411,1 --High Order Apprentice slain (6)
    .mob High Order Apprentice
step
    #loop
    .goto 2521,47.67,39.10,0
    .goto 2521,47.67,39.10,40,0
    .goto 2521,45.74,36.73,40,0
    .goto 2521,46.80,36.84,40,0
    .goto 2521,47.64,36.04,40,0
    .goto 2521,50.85,33.33,40,0
    .goto 2521,50.21,36.04,40,0
    .goto 2521,49.30,37.06,40,0
    .goto 2521,50.06,39.64,40,0
    .goto 2521,48.56,38.41,40,0
    >>Kill |cRXP_ENEMY_"Badwind" Bennic|r
    >>Kill |cRXP_ENEMY_Highlands Bandits|r
    >>Kill |cRXP_ENEMY_Highlands Bandits|r and |cRXP_ENEMY_"Badwind" Bennics|r. Loot them for |cRXP_LOOT_Pilfered Windstone|r
    .complete 92517,2 --"Badwind" Bennic slain (1)
    .complete 92517,1 --Highlands Bandit slain (10)
    .complete 93319,1 --Pilfered Windstone (10)
    .mob "Badwind" Bennic
    .mob Highlands Bandit
step
    .isOnQuest 96638
    .goto 2521,43.86,43.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Zerril Softbreeze::251905|r.
    .vendor 251905 >>Vendor Trash
    .target Zerril Softbreeze::251905
step
    .goto 2521,43.850,43.840
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zerril Softbreeze::251905|r
    .train 2550 >>Train |T133971:0|t[Apprentice Cook]
    .target Zerril Softbreeze::251905
step << Rogue
    .goto 2521,43.16,43.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Miriaan Mistblade::254087|r
    .train 1757 >>Train |T136189:0|t[Sinister Strike (Rank 2)]
    .train 1776 >>Train |T132155:0|t[Gouge]
    .train 1777,1
    .target Miriaan Mistblade::254087
    .money <0.02
    .xp <6,1
step << Rogue
    .goto 2521,43.16,43.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Miriaan Mistblade::254087|r
    .train 1757 >> Train |T136189:0|t[Sinister Strike (Rank 2)]
    .target Miriaan Mistblade::254087
    .money <0.01
    .xp <6,1
step << Warrior
    .goto 2521,44.95,45.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corsan Earthrazer::254088|r
    .train 3127 >> Train |T132269:0|t[Parry]
    .target Corsan Earthrazer::254088
    .money <0.01
    .xp <6,1
step
    .goto 2521,45.67,45.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Constable Aonda|r
    .turnin 92517 >>Turn in The Criminal Element while you are here
    .isQuestComplete 92517
    .target Constable Aonda
step
    .goto 2521,43.51,44.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Illaya Amberwind|r
    .turnin 94411 >>Turn in Meddlesome Mages while you are here
    .isQuestComplete 94411
    .target Illaya Amberwind
step
    .goto 2521,44.46,44.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Teeri Wellwind|r
    .turnin 93319 >>Turn in Pilfered Windstones
    .target Teeri Wellwind
step << Mage/Druid/Shaman
    .subzoneskip 16624,1
    .goto 2521,44.71,45.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veena Vericloud::254358|r
    .vendor 254358 >>|cRXP_BUY_Buy a|r |T133634:0|t[Small Brown Pouches] |cRXP_BUY_as needed|r.
    .target Veena Vericloud::254358
step
    .goto 2521,43.51,44.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Illaya Amberwind|r
    .turnin 94411 >>Turn in Meddlesome Mages
    .target Illaya Amberwind
step
    .goto 2521,43.38,45.82
    >>Click the |cRXP_PICK_Bounty Available: Vulgara the Insatiable!|r
    .accept 93318 >>Accept WANTED: Vulgara the Insatiable
step << Warrior/Rogue
    .goto 2521,43.073,46.306
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Naleeia Tattermend::257018|r.
    .train 3273 >>Train First Aid
    .target Naleeia Tattermend::257018
step
    .goto 2521,41.66,44.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raan Wildwind|r
    .turnin 96638 >>Turn in The Adventurer
    .target Raan Wildwind
    .isOnQuest 96638
step
    .goto 2521,41.66,44.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raan Wildwind|r
    .accept 96101 >>Accept The Great Outdoors
    .target Raan Wildwind
step
    .goto 2521,41.73,44.78
    >>Click the |cRXP_PICK_Basic Campfire|r
    .complete 96101,1 --Basic Campfire
    .complete 96101,2 --Basic Campfire
step
    .goto 2521,41.66,44.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raan Wildwind|r
    .turnin 96101 >>Turn in The Great Outdoors
    .accept 96646 >>Accept Camping 101: Cooking
    .target Raan Wildwind
step
    .subzoneskip 16624,1
    .train 2575,3
    .goto 2521,41.658,44.784
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raan Wildwind::263664|r
    .target Raan Wildwind::263664
step
    .subzoneskip 16624,1
    .train 8613,3
    .goto 2521,41.658,44.784
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raan Wildwind::263664|r
    .target Raan Wildwind::263664
step
    .subzoneskip 16624,1
    .train 2366,3
    .goto 2521,41.658,44.784
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raan Wildwind::263664|r
    .target Raan Wildwind::263664
step
    .subzoneskip 16624,1
    .train 3273,3
    .goto 2521,41.658,44.784
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raan Wildwind::263664|r
    .target Raan Wildwind::263664
step
    .subzoneskip 16624,1
    .train 7620,3
    .goto 2521,41.658,44.784
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raan Wildwind::263664|r
    .target Raan Wildwind::263664
step
    .subzoneskip 16624,1
    .train 2259,3
    .goto 2521,41.658,44.784
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raan Wildwind::263664|r
    .target Raan Wildwind::263664
step
    .subzoneskip 16624,1
    .train 2018,3
    .goto 2521,41.658,44.784
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raan Wildwind::263664|r
    .target Raan Wildwind::263664
step
    .subzoneskip 16624,1
    .train 3908,3
    .goto 2521,41.658,44.784
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raan Wildwind::263664|r
    .target Raan Wildwind::263664
step
    .subzoneskip 16624,1
    .train 7411,3
    .goto 2521,41.658,44.784
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raan Wildwind::263664|r
    .target Raan Wildwind::263664
step
    .train 2108,3
    .subzoneskip 16624,1
    .goto 2521,41.658,44.784
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Raan Wildwind::263664|r
    .target Raan Wildwind::263664
step
    #loop
    .goto 2521,41.41,49.41,0
    .goto 2521,41.41,49.41,40,0
    .goto 2521,39.81,52.06,40,0
    .goto 2521,41.22,54.98,40,0
    .goto 2521,38.06,57.60,40,0
    .goto 2521,34.25,58.54,40,0
    .goto 2521,33.19,54.37,40,0
    .goto 2521,35.04,50.32,40,0
    .goto 2521,36.84,53.31,40,0
    .goto 2521,38.04,48.30,40,0
    >>Pick up |cRXP_PICK_Hippogryph Down|r from the ground
    >>Kill |cRXP_ENEMY_Hippogryph Youths|r
    >>Kill |cRXP_ENEMY_Hippogryph Protectors|r
    >>Kill |cRXP_ENEMY_Hippogryph Matriarch|r
    .complete 93951,1 --Hippogryph Down (8)
    .complete 92516,1 --Hippogryph Youth slain (8)
    .complete 92516,2 --Hippogryph Protector slain (6)
    .complete 92516,3 --Hippogryph Matriarch slain (1)
    .mob Hippogryph Youth
    .mob Hippogryph Protector
    .mob Hippogryph Matriarch
step
    #label Along60
    .goto 2521,42.66,52.80
    >>Kill |cRXP_ENEMY_Vulgara the Insatiable|r and loot |cRXP_LOOT_Vulgara's Head|r
    .complete 93318,1 --Vulgara's Head (1)
    .mob Vulgara the Insatiable
step
    #loop
    .goto 2521,42.82,45.53,0
    .goto 2521,42.82,45.53,40,0
    .goto 2521,43.27,40.66,40,0
    .goto 2521,40.63,39.64,40,0
    .goto 2521,38.83,42.57,40,0
    .goto 2521,39.68,34.91,40,0
    .goto 2521,43.44,35.71,40,0
    .goto 2521,45.83,36.22,40,0
    .goto 2521,47.92,38.95,40,0
    .goto 2521,45.84,42.31,40,0
    >>Kill |cRXP_ENEMY_Prideclaws|r. Loot them for |cRXP_LOOT_Prideclaw Pelt|r
    .complete 92515,1 --Prideclaw Pelt (10)
    .mob Prideclaw
step
    .train 3273,3
    .isQuestComplete 97965
    .goto 2521,43.08,46.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Naleeia Tattermend::257018|r
    .target Naleeia Tattermend::257018
step
    .train 7411,3
    .isQuestComplete 98286
    .goto 2521,43.25,43.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nasalanna Windsinger::257020|r
    .target Nasalanna Windsinger::257020
step
    .train 8613,3
    .isQuestComplete 97971
    .goto 2521,43.3,43.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mendalass Tattermend::257024|r
    .target Mendalass Tattermend::257024
step
    .isOnQuest 92516
    .goto 2521,43.851,43.848
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zerril Softbreeze::251905|r and buy 5 |T134059:0|t[Mild Spices]
    .vendor 251905 >>Vendor Trash
    .collect 2678,5
    .target Zerril Softbreeze::251905
step
    .goto 2521,44.88,44.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Taleen Shimmerthread|r
    .turnin 93951 >>Turn in A Little Beauty while you are here
    .isQuestComplete 93951
    .target Taleen Shimmerthread
step
    .goto 2521,44.68,44.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Indari Sunseam|r
    .turnin 92515 >>Turn in The Problem With Prideclaws while you are here
    .isQuestComplete 92515
    .target Indari Sunseam
step
    .goto 2521,44.46,44.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Teeri Wellwind|r
    .turnin 92516 >>Turn in Hippogryph Harrassment while you are here
    .isQuestComplete 92516
    .target Teeri Wellwind
step
    .goto 2521,45.24,45.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Danarii Bellowveil|r
    .turnin 93318 >>Turn in WANTED: Vulgara the Insatiable while you are here
    .isQuestComplete 93318
    .target Danarii Bellowveil
step
    .goto 2521,44.32,44.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zerril Softbreeze|r
    .complete 96646,1 --Zerril Softbreeze
    .target Zerril Softbreeze
step
    .goto 2521,44.32,44.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zerril Softbreeze|r
    .turnin 96646 >>Turn in Camping 101: Cooking
    .target Zerril Softbreeze
step
    .train 2550,3
    .isQuestComplete 96646
    .goto 2521,43.851,43.848
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zerril Softbreeze::251905|r
    .target Zerril Softbreeze::251905
step
    .train 2259,3
    .isQuestComplete 97963
    .goto 2521,43.7,43.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nyassa Swiftdraught::257019|r
    .target Nyassa Swiftdraught::257019
step
    .goto 2521,44.88,44.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Taleen Shimmerthread|r
    .turnin 93951 >>Turn in A Little Beauty
    .target Taleen Shimmerthread
step
    .train 3908,3
    .isQuestComplete 97973
    .goto 2521,44.88,44.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Taleen Shimmerthread::251991|r
    .target Taleen Shimmerthread::251991
step
    .train 2018,3
    .isQuestComplete 97964
    .goto 2521,44.89,44.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aedi Thriceforged::251913|r
    .target Aedi Thriceforged::251913
step
    .train 2575,3
    .isQuestComplete 97970
    .goto 2521,44.77,44.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Messana Crestwind::257022|r
    .target Messana Crestwind::257022
step
    .goto 2521,44.68,44.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Indari Sunseam|r
    .turnin 92515 >>Turn in The Problem With Prideclaws
    .target Indari Sunseam
step
    .train 2108,3
    .isQuestComplete 97969
    .goto 2521,44.69,44.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Indari Sunseam::251993|r
    .target Indari Sunseam::251993
step
    .goto 2521,44.46,44.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Teeri Wellwind|r
    .turnin 92516 >>Turn in Hippogryph Harrassment
    .target Teeri Wellwind
step << Warrior
    .subzoneskip 16624,1
    .goto 2521,44.95,45.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corsan Earthrazer::254088|r
    .train 284 >> Train |T132282:0|t[Heroic Strike (Rank 2)]
    .train 1715 >> Train |T132316:0|t[Hamstring]
    .train 7372,1
    .train 6343 >> Train |T136105:0|t[Thunder Clap]
    .train 8198,1
    .target Corsan Earthrazer::254088
    .money <0.05
    .xp <8,1
step
    .goto 2521,45.24,45.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Danarii Bellowveil|r
    .turnin 93318 >>Turn in WANTED: Vulgara the Insatiable
    .target Danarii Bellowveil
step << Alliance Druid
    .subzoneskip 16624,1
    .goto 2521,45.153,44.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Naeluna Swiftmend::254081|r.
    .train 339 >>Train |T136100:0|t[Entangling Roots]
    .train 5186 >>Train |T136041:0|t[Healing Touch (Rank 2)]
    .xp <8,1
    .money <0.04
    .target Naeluna Swiftmend::254081
step << Alliance Hunter
    .goto 2521,45.263,44.236
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elayaa Easewind::254084|r.
    .train 5116 >>Train |T135860:0|t[Concussive Shot]
    .train 3127 >>Train |T132269:0|t[Parry]
    .train 14260 >>Train |T132223:0|t[Raptor Strike (Rank 2)]
    .target Elayaa Easewind::254084
    .money <0.04
    .xp <8,1
step
    .goto 2521,45.67,45.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Constable Aonda|r
    .turnin 92517 >>Turn in The Criminal Element
    .accept 93036 >>Accept Infiltrating the Cult
    .target Constable Aonda
step << Hunter
    .subzoneskip 16624,1
    .goto 2521,45.263,44.236
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elayaa Easewind::254084|r.
    .train 5116 >>Train |T135860:0|t[Concussive Shot]
    .train 3127 >>Train |T132269:0|t[Parry]
    .train 14260 >>Train |T132223:0|t[Raptor Strike (Rank 2)]
    .target Elayaa Easewind::254084
    .money <0.06
    .xp <8,1
step << Horde Druid
    .subzoneskip 16624,1
    .goto 2521,45.153,44.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Naeluna Swiftmend::254081|r.
    .trainer >>Train your spells
    .target Naeluna Swiftmend::254081
    .money <0.04
    .xp <8,1
step
    .goto 2521,44.88,45.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sania Silverstream|r
    .turnin 93036 >>Turn in Infiltrating the Cult
    .accept 92529 >>Accept Falaath Village
    .target Sania Silverstream
step
    .subzoneskip 16624,1
    .goto 2521,44.71,45.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veena Vericloud::254358|r
    .vendor 254358 >>|cRXP_BUY_Buy up to three|r |T133634:0|t[Small Brown Pouches] |cRXP_BUY_as needed|r.
    >>|cRXP_BUY_Buy|r |T132815:0|t[Ice Cold Milk] |cRXP_BUY_from him|r << Druid
    >>|cRXP_BUY_Buy|r |T132815:0|t[Ice Cold Milk] |cRXP_BUY_from him|r << Mage
    .target Veena Vericloud::254358
step << Horde Shaman
    .goto 2521,43.454,44.872
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aarnor Galestrike::254082|r
    .trainer >>Train your class spells
    .target Aarnor Galestrike::254082
    .money <0.10
    .xp <8,1
step << Mage
    .goto 2521,45.1,45.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shenaan Spellwind::254086|r
    .train 5143 >> Train |T136096:0|t[Arcane Missiles]
    .train 205 >> Train |T135846:0|t[Frostbolt (Rank 2)]
    .train 118 >> Train |T136071:0|t[Polymorph]
    .target Shenaan Spellwind::254086
    .money <0.06
    .xp <8,1
step
    .train 7620,3
    .isQuestComplete 97967
    .goto 2521,45.03,48.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fenn Fairweather::251992|r
    .target Fenn Fairweather::251992
step
    .goto 2521,46.89,56.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Missionary Jasaan|r
    .turnin 92529 >>Turn in Falaath Village
    .accept 92528 >>Accept Among the Faithful
    .target Missionary Jasaan
step
    .goto 2521,48.84,53.93
    >>Look around Falaath Village to learn about the cult's intentions in the Shen'dar Highlands.
    .complete 92528,1 --Wardrobe
    .target Wardrobe
step << Rogue
    .goto 2521,44.37,46.69,30,0
    .goto 2521,43.15,43.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Miriaan Mistblade::254087|r
    .train 5277 >>Train |T136205:0|t[Evasion]
    .train 6760 >>Train |T132292:0|t[Eviscerate (Rank 2)]
    .target Miriaan Mistblade::254087
    .money <0.04
    .xp <8,1
step
    .goto 2521,45.67,45.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Constable Aonda|r
    .turnin 92528 >>Turn in Among the Faithful
    .accept 92550 >>Accept Havoc in the Highlands
    .accept 93926 >>Accept The Western Watch
    .target Constable Aonda
step
    .goto 2521,45.24,45.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Danarii Bellowveil|r
    .accept 92551 >>Accept Stolen Supplies
    .target Danarii Bellowveil
step
    .goto 2521,42.35,62.02
    >>Interact with |cRXP_FRIENDLY_Peacekeeper Vaaniel|r
    .complete 93926,1 --Peacekeeper Vaaniel
    .target Peacekeeper Vaaniel
step
    .goto 2521,42.35,62.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Peacekeeper Vaaniel|r
    .turnin 93926 >>Turn in The Western Watch
    .accept 93927 >>Accept A Last Request
    .target Peacekeeper Vaaniel
step
    .goto 2521,42.37,62.07
    >>Pick up |cRXP_PICK_Bloody Note|r from the ground
    >>Open the |cRXP_PICK_Arvensus Shadowsong|r. Loot it for |cRXP_LOOT_Shadowsong Family Signet|r
    >>Open the |cRXP_PICK_Raani Windgazer|r. Loot it for |cRXP_LOOT_Raani's Lucky Feather|r
    >>Kill |cRXP_ENEMY_Skypriest Aanders|r
    .complete 93927,1 --Bloody Note (1)
    .complete 93927,4 --Shadowsong Family Signet (1)
    .complete 93927,3 --Raani's Lucky Feather (1)
    .complete 93927,2 --Skypriest Aanders slain (1)
    .mob Skypriest Aanders
step
    #label Along77
    #loop
    .goto 2521,47.66,58.53,0
    .goto 2521,47.66,58.53,40,0
    .goto 2521,49.86,60.20,40,0
    .goto 2521,50.74,57.42,40,0
    .goto 2521,51.36,54.89,40,0
    .goto 2521,50.26,52.43,40,0
    .goto 2521,49.42,55.91,40,0
    .goto 2521,47.68,54.83,40,0
    .goto 2521,47.58,51.70,40,0
    .goto 2521,45.43,54.69,40,0
    >>Kill |cRXP_ENEMY_Commander Cyclas|r and loot |cRXP_LOOT_Commander Cyclas's Head|r
    >>Kill |cRXP_ENEMY_Al'Aketh Stormcallers|r
    >>Kill |cRXP_ENEMY_Al'Aketh Stormcallers|r, |cRXP_ENEMY_Al'Aketh Healers|r, |cRXP_ENEMY_Tel'daeor the Stormspeakers|r and |cRXP_ENEMY_Galemender Delaneas|r. Loot them for |cRXP_LOOT_Stolen Shen'dar Supplies|r. It can also be picked up from |cRXP_PICK_Supply Cache|r on the ground
    >>Kill |cRXP_ENEMY_Living Lightnings|r
    .complete 92550,3 --Commander Cyclas's Head (1)
    .complete 92550,1 --Al'Aketh Stormcaller slain (6)
    .complete 92551,1 --Stolen Shen'dar Supplies (10)
    .complete 92550,2 --Living Lightning slain (4)
    .mob Commander Cyclas
    .mob Al'Aketh Stormcaller
    .mob Al'Aketh Healer
    .mob Tel'daeor the Stormspeaker
    .mob Galemender Delanea
    .mob Living Lightning
step
    .goto 2521,56.81,61.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fendaal Windstone|r
    .accept 98512 >>Accept Al'Aketh Assassins
    .target Fendaal Windstone
step
    #loop
    .goto 2521,56.37,60.46,0
    .goto 2521,56.37,60.46,40,0
    .goto 2521,55.54,61.28,40,0
    .goto 2521,54.74,62.99,40,0
    .goto 2521,54.58,61.18,40,0
    .goto 2521,54.66,59.17,40,0
    .goto 2521,55.45,58.32,40,0
    .goto 2521,56.36,58.11,40,0
    .goto 2521,56.80,59.35,40,0
    .goto 2521,58.03,60.71,40,0
    >>Kill |cRXP_ENEMY_Al'Aketh Assassins|r
    .complete 98512,1 --Al'Aketh Assassin slain (10)
    .mob Al'Aketh Assassin
step
    .goto 2521,56.81,61.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fendaal Windstone|r
    .turnin 98512 >>Turn in Al'Aketh Assassins
    .target Fendaal Windstone
step
    #completewith next
    .hs >>Hearth to Coriella Calmbreeze's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    #label Along81
    #loop
    .goto 2521,42.58,44.42,0
    .goto 2521,42.58,44.42,40,0
    .goto 2521,46.97,45.34,40,0
    .goto 2521,47.25,40.56,40,0
    .goto 2521,48.79,37.31,40,0
    .goto 2521,45.71,35.85,40,0
    .goto 2521,44.65,39.22,40,0
    .goto 2521,41.51,36.96,40,0
    .goto 2521,42.20,40.43,40,0
    .goto 2521,39.75,41.57,40,0
    >>Kill |cRXP_ENEMY_Galestriders|r. Loot them for |cRXP_LOOT_Strider Meat|r
    .complete 92553,2 --Strider Meat (8)
    .mob Galestrider
step
    #loop
    .goto 2521,41.80,51.94,0
    .goto 2521,41.80,51.94,40,0
    .goto 2521,38.84,50.87,40,0
    .goto 2521,36.35,49.18,40,0
    .goto 2521,35.24,53.06,40,0
    .goto 2521,33.37,55.78,40,0
    .goto 2521,36.13,58.44,40,0
    .goto 2521,39.64,61.01,40,0
    .goto 2521,40.71,56.81,40,0
    .goto 2521,37.95,55.33,40,0
    >>Kill |cRXP_ENEMY_Shadowgale Urseras|r, |cRXP_ENEMY_Highlands Urseras|r, |cRXP_ENEMY_Den'dralass|r and |cRXP_ENEMY_Hippogryph Matriarches|r. Loot them for |cRXP_LOOT_Small Egg|r
    .complete 92553,1 --Small Egg (3)
    .mob Shadowgale Ursera
    .mob Highlands Ursera
    .mob Den'dralass
    .mob Hippogryph Matriarch
step
    .subzoneskip 16624,1
    .goto 2521,44.71,45.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veena Vericloud::254358|r
    .vendor 254358 >>Vendor Trash. If you need bags, |cRXP_BUY_buy up to three|r |T133634:0|t[Small Brown Pouches]
    .collect 2512,600 << Hunter
    .collect 2515,1000 << Hunter
    .collect 2515,600 << Rogue
    .target Veena Vericloud::254358
step
    .goto 2521,45.24,45.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Danarii Bellowveil|r
    .turnin 92551 >>Turn in Stolen Supplies while you are here
    .isQuestComplete 92551
    .target Danarii Bellowveil
step
    .goto 2521,45.67,45.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Constable Aonda|r
    .turnin 92550 >>Turn in Havoc in the Highlands while you are here
    .isQuestComplete 92550
    .target Constable Aonda
step
    .goto 2521,45.67,45.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Constable Aonda|r
    .turnin 93927 >>Turn in A Last Request while you are here
    .isQuestComplete 93927
    .target Constable Aonda
step
    .goto 2521,44.32,44.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zerril Softbreeze|r
    .turnin 92553 >>Turn in Restocking the Larders
    .target Zerril Softbreeze
step
    .goto 2521,45.24,45.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Danarii Bellowveil|r
    .turnin 92551 >>Turn in Stolen Supplies
    .target Danarii Bellowveil
step
    .goto 2521,45.67,45.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Constable Aonda|r
    .turnin 92550 >>Turn in Havoc in the Highlands
    .turnin 93927 >>Turn in A Last Request
    .accept 92579 >>Accept To Valanaar
    .accept 93948 >>Accept Deliver the Signet
    .target Constable Aonda
step << Hunter
    .goto 2521,59.395,75.730
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Falfaan Halfwind::271465|r inside the house.
    >>|cRXP_BUY_Buy and equip a|r |T7810733:0|t[Zephrali Bow]
    .collect 277110,1
    .vendor 271465 >>Vendor trash and repair if you need
    .target Falfaan Halfwind::271465
    .money <0.1345
step
    .subzoneskip 16638,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donaal Downbreeze::255940|r.
    .vendor 255940 >>Vendor trash
    .target Donaal Downbreeze::255940
    .goto 2521,62.180,72.616
    .collect 1179,20 << Mage/Druid/Shaman
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 1 - 15 Zephras Isle
#subweight -1
#name 9-11 Zephras Isle: around Quel'ana Quickgale
#next Zone Routes (Horde)\11-15 Zephras Isle: around Elegael Thornpaw

step
    .goto 2521,60.55,73.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nyalah Brightfire|r
    .accept 93317 >>Accept Crab Season
    .target Nyalah Brightfire
step
    .goto 2521,62.08,73.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alvarion Windfield|r
    .accept 92679 >>Accept Blood Tithe
    .target Alvarion Windfield
step
    .goto 2521,62.08,73.17
    >>Listen to what Alvarion Windfield has to say and find Aamelia Windfield at the Windfield Orchard.
    .complete 92679,2 --Alvarion Windfield
    .target Alvarion Windfield
step
    .goto 2521,63.99,75.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotheluum Starbreeze|r
    .accept 94484 >>Accept Unnerving Silence
    .target Lotheluum Starbreeze
step
    .goto 2521,66.04,74.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ealaane Nimbuswalker|r
    .accept 94896 >>Accept Aid For The Refugees
    .accept 94897 >>Accept The Fate of a Loved One
    .target Ealaane Nimbuswalker
step
    .goto 2521,66.17,76.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Talaanis Shadowsong|r
    .turnin 93948 >>Turn in Deliver the Signet
    .target Talaanis Shadowsong
    .isOnQuest 93948
step
    .goto 2521,66.14,76.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Valennia Stormfist|r
    .accept 93949 >>Accept Bugged
    .target Valennia Stormfist
    .isQuestTurnedIn 93948 --any of: Deliver the Signet
step
    .goto 2521,66.14,76.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Valennia Stormfist|r
    .turnin 92579 >>Turn in To Valanaar
    .target Valennia Stormfist
    .isOnQuest 92579
step
    .goto 2521,66.14,76.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Valennia Stormfist|r
    .accept 92700 >>Accept The Grand Skyseer
    .target Valennia Stormfist
    .isQuestTurnedIn 92579 --any of: To Valanaar
step
    .goto 2521,58.16,79.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ayessa Dawnsinger|r
    .turnin 92700 >>Turn in The Grand Skyseer
    .target Ayessa Dawnsinger
    .isOnQuest 92700
step
    .goto 2521,58.16,79.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ayessa Dawnsinger|r
    .accept 92708 >>Accept A Grand Adventure
    .accept 93735 >>Accept The Broken Construct
    .target Ayessa Dawnsinger
    .isQuestTurnedIn 92700 --any of: The Grand Skyseer
step << Horde
    .train 2366,3
    .isOnQuest 97968
    .isQuestComplete 97968
    .goto 2521,57.890,75.514
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Syriel Nightrain::254345|r.
    .target Syriel Nightrain::254345
step
    .goto 2521,58.13,78.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Endaria Mistgaze|r
    .accept 93736 >>Accept Unwelcome Spirits
    .target Endaria Mistgaze
    .isQuestTurnedIn 92700 --any of: The Grand Skyseer
step << Skyborne Shaman
    .goto 2521,58.31,78.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sessaria Skystride|r
    .accept 97243 >>Accept Call of Fire
    .target Sessaria Skystride
    .xp <10,1
step
    .goto 2521,59.06,72.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Riaani Nightwind|r
    .turnin 93735 >>Turn in The Broken Construct
    .target Riaani Nightwind
    .isOnQuest 93735
step
    .goto 2521,59.06,72.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Riaani Nightwind|r
    .accept 93737 >>Accept The Broken Construct
    .target Riaani Nightwind
    .isQuestTurnedIn 93735 --any of: The Broken Construct
step << Skyborne Hunter
    .goto 2521,59.56,72.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quel'ana Quickgale|r
    .accept 94978 >>Accept Taming the Beast
    .target Quel'ana Quickgale
    .xp <10,1
step << Skyborne Warrior
    .goto 2521,59.86,72.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Seena Skybreaker|r
    .accept 94003 >>Accept The Skybreaker Bulwark
    .target Seena Skybreaker
    .xp <10,1
step
    .goto 2521,59.06,72.98
    >>Speak with Rianni Nightwind and list to what he has to say.
    .complete 93737,1 --Riaani Nightwind
    .target Riaani Nightwind
    .isOnQuest 93737
step
    .goto 2521,46.70,81.95
    >>Interact with |cRXP_FRIENDLY_Aamelia Windfield|r
    .complete 92679,1 --Aamelia Windfield
    .target Aamelia Windfield
step
    .goto 2521,46.70,81.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aamelia Windfield|r
    .turnin 92679 >>Turn in Blood Tithe
    .accept 92682 >>Accept Make Yourself Useful
    .accept 92684 >>Accept Ornery Ornery Galestriders
    .accept 92683 >>Accept Flutterfly Dust
    .target Aamelia Windfield
step
    #completewith Along104
    >>As you go: Pick up |cRXP_PICK_Flutterfly Dust|r from the ground. Kill |cRXP_ENEMY_Ornery Galestriders|r. Loot them for |cRXP_LOOT_Lowlands Galestrider Tenderloin|r. |cRXP_WARN_Anything left is finished later|r
    .complete 92683,1 --Flutterfly Dust (5)
    .complete 92684,1 --Lowlands Galestrider Tenderloin (7)
    .mob Ornery Galestrider
step
    #loop
    .goto 2521,46.71,83.52,0
    .goto 2521,46.71,83.52,40,0
    .goto 2521,48.53,83.45,40,0
    .goto 2521,49.93,84.69,40,0
    .goto 2521,50.05,80.68,40,0
    .goto 2521,47.68,81.02,40,0
    .goto 2521,47.69,78.46,40,0
    .goto 2521,48.28,76.75,40,0
    .goto 2521,46.69,76.53,40,0
    .goto 2521,45.89,79.97,40,0
    >>Pick up |cRXP_PICK_Ripe Stormapple|r from the ground
    >>Kill |cRXP_ENEMY_Hungry Bandits|r
    .complete 92682,1 --Ripe Stormapple (5)
    .complete 92682,2 --Hungry Bandit slain (10)
    .mob Hungry Bandit
step
    .goto 2521,46.70,81.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aamelia Windfield|r
    .turnin 92682 >>Turn in Make Yourself Useful while you are here
    .isQuestComplete 92682
    .target Aamelia Windfield
step
    #label Along104
    .goto 2521,48.65,78.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Malfunctioning Cyclone Construct|r
    .accept 92698 >>Accept What Is My Purpose?
    .target Malfunctioning Cyclone Construct
step << Horde Shaman
    .xp 10 >>1
step << Skyborne Shaman
    .goto 2521,58.31,78.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sessaria Skystride|r
    .accept 97243 >>Accept Call of Fire
    .target Sessaria Skystride
step << Horde Shaman
    .goto 2521,58.313,78.499
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sessaria Skystride::252382|r.
    .trainer >>Train your class spells
    .target Sessaria Skystride::252382
    .money <0.12
    .xp <10,1
step << Skyborne Shaman
    .goto 2521,51.24,86.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Olariaan Swiftburn|r
    .turnin 97243 >>Turn in Call of Fire
    .accept 97244 >>Accept Call of Fire
    .target Olariaan Swiftburn
step << Skyborne Shaman
    .goto 2521,64.43,63.71
    >>Kill |cRXP_ENEMY_Skypriest Faladiel|r and loot |cRXP_LOOT_Faladiel's Heart|r
    .complete 97244,1 --Faladiel's Heart (1)
    .mob Skypriest Faladiel
step << Skyborne Shaman
    .goto 2521,51.24,86.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Olariaan Swiftburn|r
    .turnin 97244 >>Turn in Call of Fire
    .accept 97245 >>Accept Call of Fire
    .target Olariaan Swiftburn
step
    #loop
    .goto 2521,48.00,79.50,0
    .goto 2521,48.00,79.50,40,0
    .goto 2521,45.72,80.62,40,0
    .goto 2521,48.44,85.67,40,0
    .goto 2521,51.81,83.51,40,0
    .goto 2521,52.38,80.40,40,0
    .goto 2521,52.91,77.18,40,0
    .goto 2521,50.30,72.50,40,0
    .goto 2521,47.58,75.01,40,0
    .goto 2521,50.25,78.89,40,0
    >>Pick up |cRXP_PICK_Flutterfly Dust|r from the ground
    >>Kill |cRXP_ENEMY_Ornery Galestriders|r. Loot them for |cRXP_LOOT_Lowlands Galestrider Tenderloin|r
    .complete 92683,1 --Flutterfly Dust (5)
    .complete 92684,1 --Lowlands Galestrider Tenderloin (7)
    .mob Ornery Galestrider
step
    .goto 2521,46.70,81.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aamelia Windfield|r
    .turnin 92682 >>Turn in Make Yourself Useful
    .turnin 92684 >>Turn in Ornery Ornery Galestriders
    .turnin 92698 >>Turn in What Is My Purpose?
    .turnin 92683 >>Turn in Flutterfly Dust
    .accept 92685 >>Accept The Hills Have Eyes
    .target Aamelia Windfield
step
    #loop
    .goto 2521,45.90,79.89,0
    .goto 2521,45.90,79.89,40,0
    .goto 2521,45.05,77.17,40,0
    .goto 2521,43.27,74.95,40,0
    .goto 2521,45.06,73.70,40,0
    .goto 2521,46.51,71.08,40,0
    .goto 2521,46.78,73.87,40,0
    .goto 2521,48.35,73.46,40,0
    .goto 2521,48.33,77.00,40,0
    .goto 2521,46.80,76.43,40,0
    >>Kill |cRXP_ENEMY_Bandit Highwaymans|r. Loot them for |cRXP_LOOT_Blood-Stained Bandit Mask|r
    .complete 92685,1 --Blood-Stained Bandit Mask (7)
    .mob Bandit Highwayman
step
    #loop
    .goto 2521,44.80,76.70,0
    .goto 2521,44.80,76.70,40,0
    .goto 2521,43.90,75.50,40,0
    .goto 2521,43.90,75.40,40,0
    .goto 2521,43.30,74.50,40,0
    .goto 2521,44.70,73.40,40,0
    .goto 2521,44.80,74.20,40,0
    >>Open the |cRXP_PICK_Construct Parts|r. Loot it for |cRXP_LOOT_Air Construct Core|r
    .complete 93737,4 --Air Construct Core (1)
    .isOnQuest 93737
step << Skyborne Shaman
    .goto 2521,42.44,68.75
    >>Kill |cRXP_ENEMY_Kuramaa|r and loot |cRXP_LOOT_Kuramaa's Mask|r
    .complete 97245,1 --Kuramaa's Mask (1)
    .mob Kuramaa
step
    .goto 2521,46.70,81.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aamelia Windfield|r
    .turnin 92685 >>Turn in The Hills Have Eyes
    .accept 92693 >>Accept Standing Our Ground
    .target Aamelia Windfield
step
    .goto 2521,46.70,81.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aamelia Windfield|r
    .complete 92693,1 --Aamelia Windfield
    .target Aamelia Windfield
step
    #loop
    .goto 2521,46.47,78.22,0
    .goto 2521,46.47,78.22,40,0
    .goto 2521,47.59,78.30,40,0
    .goto 2521,47.86,78.19,40,0
    .goto 2521,48.56,76.82,40,0
    >>Speak with Aamelia Windfield when you are ready to confront the bandit leader.
    .complete 92693,2 --Ferauu the Bludgeon
    .target Ferauu the Bludgeon
step
    .goto 2521,46.70,81.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aamelia Windfield|r
    .turnin 92693 >>Turn in Standing Our Ground
    .accept 92703 >>Accept Deliver the News
    .target Aamelia Windfield
step << Alliance/!Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donaal Downbreeze::255940|r.
    .vendor 255940 >>Vendor trash
    .target Donaal Downbreeze::255940
    .goto 2521,62.180,72.616
    .collect 1179,15 >>Buy |T132815:0|t[Ice Cold Milk] << Mage/Druid
step
    .goto 2521,62.08,73.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alvarion Windfield|r
    .turnin 92703 >>Turn in Deliver the News while you are here
    .isQuestComplete 92703
    .target Alvarion Windfield
step << Skyborne Shaman
    .goto 2521,51.24,86.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Olariaan Swiftburn|r
    .turnin 97245 >>Turn in Call of Fire
    .accept 97257 >>Accept Call of Fire
    .target Olariaan Swiftburn
step << Skyborne Shaman
    .goto 2521,51.20,85.90
    >>Wait for Olariaan to begin the ritual at the Brazier of Offering and follow his instructions.
    .complete 97257,1 --Brazier of Offering
    .target Brazier of Offering
step << Skyborne Shaman
    .goto 2521,58.35,78.84
    >>Wait for Olariaan to begin the ritual at the Brazier of Offering and follow his instructions.
    .complete 97257,2 --Brazier of Eternal Flame
    .target Brazier of Eternal Flame
step << Skyborne Shaman
    .goto 2521,58.31,78.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sessaria Skystride|r
    .turnin 97257 >>Turn in Call of Fire
    .target Sessaria Skystride
step << Horde Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donaal Downbreeze::255940|r.
    .vendor 255940 >>Vendor trash
    .target Donaal Downbreeze::255940
    .goto 2521,62.180,72.616
step
    .goto 2521,62.08,73.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alvarion Windfield|r
    .turnin 92703 >>Turn in Deliver the News
    .target Alvarion Windfield
step << Skyborne Warrior
    .goto 2521,59.86,72.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Seena Skybreaker|r
    .accept 94003 >>Accept The Skybreaker Bulwark
    .target Seena Skybreaker
step << Warrior
    .goto 2521,59.89,72.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Seena Skybreaker::252377|r.
    .train 6546 >>Train |T132155:0|t[Rend (Rank 2)]
    .train 2687 >>Train |T132277:0|t[Bloodrage]
    .target Seena Skybreaker::252377
    .money <0.12
    .xp <10,1
step << Skyborne Hunter
    .goto 2521,59.56,72.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quel'ana Quickgale|r
    .accept 94978 >>Accept Taming the Beast
    .target Quel'ana Quickgale
step << Hunter Alliance
    .goto 2521,63.023,77.803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Anteleriaa Cloudgaze::252390|r.
    >>|cRXP_BUY_Buy|r |T132382:0|t[Sharp Arrow]
    .vendor 252390 >>Vendor trash
    .collect 2515,1000
    .target Anteleriaa Cloudgaze::252390
step << Skyborne Hunter
    #loop
    .goto 2521,57.06,56.59,0
    .goto 2521,57.06,56.59,40,0
    .goto 2521,56.12,56.34,40,0
    .goto 2521,54.09,56.82,40,0
    .goto 2521,54.45,59.99,40,0
    .goto 2521,53.23,59.14,40,0
    .goto 2521,51.71,56.93,40,0
    .goto 2521,51.75,58.24,40,0
    >>Interact with |cRXP_FRIENDLY_Windsong Crawler|r
    .complete 94978,1 --Windsong Crawler
    .target Windsong Crawler
step << Alliance
    .train 2366,3
    .isOnQuest 97968
    .isQuestComplete 97968
    .goto 2521,57.890,75.514
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Syriel Nightrain::254345|r.
    .target Syriel Nightrain::254345
step << Skyborne Hunter
    .goto 2521,59.56,72.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quel'ana Quickgale|r
    .turnin 94978 >>Turn in Taming the Beast
    .accept 94979 >>Accept Taming the Beast
    .target Quel'ana Quickgale
step << Skyborne Hunter
    #loop
    .goto 2521,50.49,72.81,0
    .goto 2521,50.49,72.81,40,0
    .goto 2521,51.74,74.69,40,0
    .goto 2521,52.91,77.18,40,0
    .goto 2521,52.66,78.51,40,0
    .goto 2521,50.25,80.00,40,0
    .goto 2521,45.72,80.80,40,0
    .goto 2521,50.25,83.43,40,0
    .goto 2521,50.21,85.02,40,0
    .goto 2521,48.65,85.51,40,0
    >>Interact with |cRXP_FRIENDLY_Ornery Galestrider|r
    .complete 94979,1 --Ornery Galestrider
    .target Ornery Galestrider
step << Skyborne Hunter
    .goto 2521,59.56,72.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quel'ana Quickgale|r
    .turnin 94979 >>Turn in Taming the Beast
    .accept 94013 >>Accept Taming the Beast
    .target Quel'ana Quickgale
step << Skyborne Hunter
    #loop
    .goto 2521,50.17,83.49,0
    .goto 2521,50.17,83.49,40,0
    .goto 2521,49.63,81.99,40,0
    .goto 2521,48.54,84.60,40,0
    .goto 2521,48.69,83.67,40,0
    .goto 2521,48.75,81.56,40,0
    .goto 2521,46.89,83.57,40,0
    .goto 2521,46.92,81.76,40,0
    .goto 2521,45.72,80.84,40,0
    >>Interact with |cRXP_FRIENDLY_Vuldren Alpha|r
    .complete 94013,1 --Vuldren Alpha
    .target Vuldren Alpha
step << Skyborne Hunter
    .goto 2521,59.56,72.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quel'ana Quickgale|r
    .turnin 94013 >>Turn in Taming the Beast
    .accept 94050 >>Accept Training the Beast
    .target Quel'ana Quickgale
step << Skyborne Hunter
    .goto 2521,59.92,72.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quel'dora Quickgale|r
    .turnin 94050 >>Turn in Training the Beast
    .target Quel'dora Quickgale
step << Horde Hunter
    .goto 2521,59.605,72.527
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quel'dora Quickgale::254411|r.
    .train 4195 >>Train |T136112:0|t[Great Stamina]
    .train 24547 >>Train |T136094:0|t[Natural Armor]
    .target Quel'dora Quickgale::254411
    .xp <10,1
step << Horde Hunter
    .goto 2521,60.905,69.414,35,0
    .goto 2521,58.339,68.476,35,0
    .goto 2521,53.799,72.161,35,0
    >>|cRXP_WARN_Cast|r |T132164:0|t[Tame Beast] |cRXP_WARN_on a |cRXP_ENEMY_Windsong Crawler::254588|r to tame it|r
    .train 2981 >> |cRXP_WARN_Attack mobs with it to learn|r |T132140:0|t[Claw (Rank 2)]
step << Mage
    .goto 2521,65.91,80.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Anathamaas Aetherwind::252373|r
    .train 168 >>Train |T135843:0|t[Frost Armor]
    .train 122 >>Train |T135848:0|t[Frost Nova]
    .train 5504 >>Train |T132794:0|t[Conjure Water]
    .train 587 >>Train |T133952:0|t[Conjure Food]
    .train 5505 >>Train |T132794:0|t[Conjure Water (Rank 2)]
    .money <0.08
    .xp <10,1
    .target Anathamaas Aetherwind::252373
step << Alliance Hunter
    .goto 2521,59.605,72.527
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quel'dora Quickgale::254411|r.
    .train 4195 >>Train |T136112:0|t[Great Stamina]
    .train 24547 >>Train |T136094:0|t[Natural Armor]
    .target Quel'dora Quickgale::254411
    .xp <10,1
step << Skyborne Druid
    .goto 2521,63.99,75.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotheluum Starbreeze|r
    .accept 94006 >>Accept The Great Ursera Spirit
    .target Lotheluum Starbreeze
step << Druid
    .goto 2521,63.983,75.093
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotheluum Starbreeze::252359|r.
    .train 16689 >>Train |T136063:0|t[Nature's Grasp]
    .train 1058 >>Train |T136081:0|t[Rejuvenation (Rank 2)]
    .train 5232 >>Train |T136078:0|t[Mark of the Wild (Rank 2)]
    .train 8924 >>Train |T136096:0|t[Moonfire (Rank 2)]
    .target Lotheluum Starbreeze::252359
    .money <0.12
    .xp <10,1
step << Rogue
    .goto 2521,59.9,72.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eltheen Nightbreeze::252379|r.
    .train 674 >>Train |T132147:0|t[Dual Wield]
    .train 6770 >>Train |T132310:0|t[Sap]
    .train 2070,1
    .train 5171 >>Train |T132306:0|t[Slice and Dice]
    .train 6774,1
    .train 2983 >>Train |T132307:0|t[Sprint]
    .train 8696,1
    .target Eltheen Nightbreeze::252379
    .money <0.09
    .xp <10,1
step << Hunter
    .goto 2521,59.571,72.639
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quel'ana Quickgale::252389|r.
    .train 13165 >>Train |T136076:0|t[Aspect of the Hawk]
    .train 13549 >>Train |T132204:0|t[Serpent Sting (Rank 2)]
    .target Quel'ana Quickgale::252389
    .money <0.08
    .xp <10,1
step
    #loop
    .goto 2521,61.32,72.83,0
    .goto 2521,61.32,72.83,40,0
    .goto 2521,59.67,72.83,40,0
    .goto 2521,57.26,74.75,40,0
    .goto 2521,58.18,75.78,40,0
    .goto 2521,58.89,77.37,40,0
    .goto 2521,59.83,75.24,40,0
    .goto 2521,60.99,76.14,40,0
    .goto 2521,61.65,74.66,40,0
    .goto 2521,62.91,73.99,40,0
    >>Kill |cRXP_ENEMY_Skyhoppers|r
    .complete 93949,1 --Skyhopper slain (8)
    .mob Skyhopper
    .isOnQuest 93949
step
    #completewith Along134
    >>As you go: Kill |cRXP_ENEMY_Windsong Crawlers|r. Loot them for |cRXP_LOOT_Windsong Crawler Meat|r. |cRXP_WARN_Anything left is finished later|r
    .complete 93317,1 --Windsong Crawler Meat (6)
    .mob Windsong Crawler
step
    #label Along134
    #loop
    .goto 2521,52.90,66.10,0
    .goto 2521,52.90,66.10,40,0
    .goto 2521,52.80,64.80,40,0
    .goto 2521,51.90,65.60,40,0
    .goto 2521,51.50,67.60,40,0
    .goto 2521,51.90,67.10,40,0
    >>Open the |cRXP_PICK_Construct Parts|r. Loot it for |cRXP_LOOT_Crystallized Lightning|r
    .complete 93737,2 --Crystallized Lightning (1)
    .isOnQuest 93737
step
    #loop
    .goto 2521,51.89,60.75,0
    .goto 2521,51.89,60.75,40,0
    .goto 2521,51.17,58.83,40,0
    .goto 2521,51.71,56.93,40,0
    .goto 2521,52.88,58.53,40,0
    .goto 2521,53.68,57.21,40,0
    .goto 2521,55.54,56.11,40,0
    .goto 2521,56.51,55.08,40,0
    .goto 2521,57.06,56.59,40,0
    .goto 2521,54.45,59.99,40,0
    >>Kill |cRXP_ENEMY_Windsong Crawlers|r. Loot them for |cRXP_LOOT_Windsong Crawler Meat|r
    .complete 93317,1 --Windsong Crawler Meat (6)
    .mob Windsong Crawler
step
    #loop
    .goto 2521,52.90,51.70,0
    .goto 2521,52.90,51.70,40,0
    .goto 2521,53.60,50.50,40,0
    .goto 2521,52.80,49.70,40,0
    .goto 2521,53.10,47.70,40,0
    .goto 2521,52.50,45.80,40,0
    .goto 2521,51.60,46.60,40,0
    .goto 2521,50.70,44.50,40,0
    .goto 2521,50.00,44.80,40,0
    .goto 2521,49.40,46.00,40,0
    >>Open the |cRXP_PICK_Construct Parts|r. Loot it for |cRXP_LOOT_Enchanted Gyrozephyr|r
    .complete 93737,3 --Enchanted Gyrozephyr (1)
    .isOnQuest 93737
step << Skyborne Warrior
    .goto 2521,56.56,50.36
    >>Kill |cRXP_ENEMY_Zaal Stormshield|r and loot |cRXP_LOOT_Skybreaker Bulwark|r
    .complete 94003,1 --Skybreaker Bulwark
    .mob Zaal Stormshield
step << Skyborne Druid
    .goto 2521,69.81,61.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Urs'endris|r
    .turnin 94006 >>Turn in The Great Ursera Spirit
    .accept 94638 >>Accept Strength and Mercy
    .target Urs'endris
step << Skyborne Druid
    .goto 2521,53.77,65.20
    >>Kill |cRXP_ENEMY_Ur'endras|r
    .complete 94638,1 --Ur'endra slain (8)
    .mob Ur'endra
step << Skyborne Druid
    .goto 2521,69.81,61.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Urs'endris|r
    .turnin 94638 >>Turn in Strength and Mercy
    .target Urs'endris
step
    .subzoneskip 16631
    .goto 2521,58.24,51.21,20,0
    .goto 2521,57.77,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Zendraas::272045|r.
    .vendor 272045 >>Vendor trash
    .skipgossip 272045,1,1,1,2
    .target Brother Zendraas::272045
step
    .goto 2521,53.96,38.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Strange Hermit|r
    .accept 93159 >>Accept The Strange Hermit
    .target Strange Hermit
step
    .goto 2521,53.96,38.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Strange Hermit|r
    .complete 93159,1 --Strange Hermit
    .target Strange Hermit
step
    .goto 2521,53.96,38.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Strange Hermit|r
    .turnin 93159 >>Turn in The Strange Hermit
    .accept 93160 >>Accept The Forest's Bounty
    .accept 93172 >>Accept Free the Hollows
    .target Strange Hermit
step
    .train 4036,3
    .goto 2521,53.95,38.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Strange Hermit::251684|r.
    .target Strange Hermit::251684
step
    #completewith Along145
    >>As you go: Pick up |cRXP_PICK_Abandoned Belongings|r from the ground. Kill |cRXP_ENEMY_Wind Hollows|r. |cRXP_WARN_Anything left is finished later|r
    .complete 94896,1 --Abandoned Belongings (8)
    .complete 93172,1 --Wind Hollow slain (10)
    .mob Wind Hollow
step
    .goto 2521,57.05,29.35
    >>Kill |cRXP_ENEMY_Resaan Nimbuswalker|r and loot |cRXP_LOOT_Resaan's Heirloom|r
    .complete 94897,1 --Resaan's Heirloom (1)
    .mob Resaan Nimbuswalker
step
    #label Along145
    #loop
    .goto 2521,57.17,29.30,0
    .goto 2521,57.17,29.30,40,0
    .goto 2521,57.31,33.42,40,0
    .goto 2521,57.12,35.42,40,0
    .goto 2521,58.08,34.88,40,0
    .goto 2521,59.41,34.14,40,0
    .goto 2521,59.68,31.84,40,0
    .goto 2521,58.16,31.35,40,0
    .goto 2521,58.69,29.37,40,0
    .goto 2521,58.32,26.62,40,0
    >>Kill |cRXP_ENEMY_Wind Hollows|r. Loot them for |cRXP_LOOT_Wind Hollow Essence|r
    .complete 93736,1 --Wind Hollow Essence (10)
    .mob Wind Hollow
    .isOnQuest 93736
step
    #loop
    .goto 2521,58.17,32.68,0
    .goto 2521,58.17,32.68,40,0
    .goto 2521,57.28,31.70,40,0
    .goto 2521,56.90,29.40,40,0
    .goto 2521,58.32,26.62,40,0
    .goto 2521,58.69,29.37,40,0
    .goto 2521,59.68,31.84,40,0
    .goto 2521,59.01,34.81,40,0
    .goto 2521,57.12,35.42,40,0
    .goto 2521,57.00,33.40,40,0
    >>Pick up |cRXP_PICK_Abandoned Belongings|r from the ground
    >>Kill |cRXP_ENEMY_Wind Hollows|r
    .complete 94896,1 --Abandoned Belongings (8)
    .complete 93172,1 --Wind Hollow slain (10)
    .mob Wind Hollow
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 1 - 15 Zephras Isle
#subweight -1
#name 11-15 Zephras Isle: around Elegael Thornpaw
--RouteBuilder:next
#next Zone Routes (Horde)\12-15 The Barrens: around Gazlowe;Zone Routes (Horde)\10-13 Silverpine Forest: around High Executor Hadrec;Zone Routes (Horde)\9-12 Durotar: around Orgnil Soulscar

step
    .goto 2521,61.72,39.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elegael Thornpaw|r
    .turnin 94484 >>Turn in Unnerving Silence
    .target Elegael Thornpaw
    .isOnQuest 94484
step
    .goto 2521,61.72,39.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elegael Thornpaw|r
    .accept 94486 >>Accept Feathers for Binding
    .accept 94485 >>Accept Tears of the Lady
    .accept 94487 >>Accept Unwanted and Unworthy
    .target Elegael Thornpaw
    .isQuestTurnedIn 94484,94493 --any of: Unnerving Silence, A Sacrifice in Vain
step
    #loop
    .goto 2521,61.60,38.86,0
    .goto 2521,61.60,38.86,40,0
    .goto 2521,63.43,38.82,40,0
    .goto 2521,65.21,38.84,40,0
    .goto 2521,65.16,36.91,40,0
    .goto 2521,65.83,35.70,40,0
    .goto 2521,63.94,34.64,40,0
    .goto 2521,63.43,36.84,40,0
    .goto 2521,61.63,35.93,40,0
    .goto 2521,59.41,35.93,40,0
    >>Kill |cRXP_ENEMY_Al'Aketh Stormchasers|r and |cRXP_ENEMY_Al'Aketh Footsoldiers|r. Loot them for |cRXP_LOOT_Bloody Heirloom|r
    .complete 94487,1 --Bloody Heirloom (10)
    .mob Al'Aketh Stormchaser
    .mob Al'Aketh Footsoldier
    .isOnQuest 94487
step
    .goto 2521,61.72,39.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elegael Thornpaw|r
    .turnin 94487 >>Turn in Unwanted and Unworthy while you are here
    .isQuestComplete 94487
    .target Elegael Thornpaw
step
    .goto 2521,63.81,36.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vayn Moongaze|r
    .accept 93165 >>Accept Mercy Falls on Deaf Ears
    .target Vayn Moongaze
    .isQuestTurnedIn 94484,94493 --any of: Unnerving Silence, A Sacrifice in Vain
step
    #loop
    .goto 2521,61.80,36.40,0
    .goto 2521,61.80,36.40,40,0
    .goto 2521,61.70,39.30,40,0
    .goto 2521,59.20,41.40,40,0
    .goto 2521,57.60,40.60,40,0
    .goto 2521,55.80,40.50,40,0
    .goto 2521,57.20,39.20,40,0
    .goto 2521,57.00,37.40,40,0
    .goto 2521,58.80,38.70,40,0
    .goto 2521,60.30,37.30,40,0
    >>Loot the |cRXP_PICK_Zephyrseed Cones|r for |cRXP_LOOT_Zephyrseed|r
    .complete 93160,1 --Zephyrseed (8)
    .isOnQuest 93160
step
    .goto 2521,53.96,38.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Strange Hermit|r
    .turnin 93160 >>Turn in The Forest's Bounty
    .target Strange Hermit
    .isOnQuest 93160
step
    .goto 2521,53.96,38.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Strange Hermit|r
    .turnin 93172 >>Turn in Free the Hollows
    .target Strange Hermit
    .isOnQuest 93172
step
    .train 4036,3
    .isOnQuest 98285
    .isQuestComplete 98285
    .goto 2521,53.97,38.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Strange Hermit::251684|r.
    .target Strange Hermit::251684
step
    #loop
    .goto 2521,58.70,40.00,0
    .goto 2521,58.70,40.00,40,0
    .goto 2521,59.20,38.50,40,0
    .goto 2521,61.20,35.30,40,0
    .goto 2521,62.10,36.40,40,0
    .goto 2521,64.30,39.30,40,0
    .goto 2521,62.80,39.40,40,0
    .goto 2521,61.80,38.90,40,0
    .goto 2521,60.80,38.70,40,0
    .goto 2521,60.00,40.30,40,0
    >>Pick up |cRXP_PICK_Lady's Tear Moss|r from the ground
    .complete 94485,1 --Lady's Tear Moss (8)
    .isOnQuest 94485
step
    .goto 2521,61.72,39.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elegael Thornpaw|r
    .turnin 94485 >>Turn in Tears of the Lady while you are here
    .isQuestComplete 94485
    .target Elegael Thornpaw
step
    #loop
    .goto 2521,59.84,38.32,0
    .goto 2521,59.84,38.32,40,0
    .goto 2521,60.14,40.57,40,0
    .goto 2521,60.08,43.03,40,0
    .goto 2521,59.10,44.39,40,0
    .goto 2521,57.76,42.85,40,0
    .goto 2521,58.94,41.58,40,0
    .goto 2521,58.03,39.74,40,0
    .goto 2521,56.57,35.67,40,0
    .goto 2521,58.35,36.93,40,0
    >>Kill |cRXP_ENEMY_Shadowgale Shrieklings|r. Loot them for |cRXP_LOOT_Pristine Shriekling Feather|r
    .complete 94486,1 --Pristine Shriekling Feather (20)
    .mob Shadowgale Shriekling
    .isOnQuest 94486
step
    .goto 2521,61.72,39.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elegael Thornpaw|r
    .turnin 94485 >>Turn in Tears of the Lady
    .target Elegael Thornpaw
    .isOnQuest 94485
step
    .goto 2521,61.72,39.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elegael Thornpaw|r
    .turnin 94486 >>Turn in Feathers for Binding
    .target Elegael Thornpaw
    .isOnQuest 94486
step
    .goto 2521,61.72,39.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elegael Thornpaw|r
    .turnin 94487 >>Turn in Unwanted and Unworthy
    .target Elegael Thornpaw
    .isOnQuest 94487
step
    .goto 2521,61.72,39.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elegael Thornpaw|r
    .accept 94488 >>Accept The Ties That Bind
    .accept 94489 >>Accept The Wounds of Betrayal
    .target Elegael Thornpaw
    .isQuestTurnedIn 94485 --Tears of the Lady
    .isQuestTurnedIn 94486 --Feathers for Binding
    .isQuestTurnedIn 94487 --Unwanted and Unworthy
step
    .goto 2521,65.53,36.32
    >>Kill |cRXP_ENEMY_Commander Haalien|r and loot |cRXP_LOOT_Commander Haalien's Severed Head|r
    .complete 94488,1 --Commander Haalien's Severed Head (1)
    .mob Commander Haalien
    .isOnQuest 94488
step
    .goto 2521,65.53,36.32
    >>Kill |cRXP_ENEMY_Commander Haalien|r and loot |cRXP_LOOT_Ripped Missive|r. Use it to start the quest
    .collect 265476,1,94490 --Ripped Missive (1)
    .accept 94490 >>Accept Ripped Missive
    .use 265476
    .mob Commander Haalien
    .isQuestTurnedIn 94485 --Tears of the Lady
    .isQuestTurnedIn 94486 --Feathers for Binding
    .isQuestTurnedIn 94487 --Unwanted and Unworthy
step
    #loop
    .goto 2521,64.96,34.95,0
    .goto 2521,64.96,34.95,40,0
    .goto 2521,65.92,33.55,40,0
    .goto 2521,65.80,32.96,40,0
    .goto 2521,64.43,31.90,40,0
    .goto 2521,64.01,31.96,40,0
    >>Kill |cRXP_ENEMY_Naaleos Leafwhisper|r, |cRXP_ENEMY_Telenos Leafwhisper|r, |cRXP_ENEMY_Nayeela Snarlfang|r and |cRXP_ENEMY_Neyasteel Mossmender|r
    .complete 94489,2 --Naaleos Leafwhisper (1)
    .mob Naaleos Leafwhisper
    .mob Telenos Leafwhisper
    .mob Nayeela Snarlfang
    .mob Neyasteel Mossmender
    .isOnQuest 94489
step
    .goto 2521,64.48,34.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jorel Windsinger|r
    .complete 94489,2 --Jorel Windsinger (7)
    .target Jorel Windsinger
    .isOnQuest 94489
step
    .goto 2521,61.72,39.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elegael Thornpaw|r
    .turnin 94489 >>Turn in The Wounds of Betrayal
    .target Elegael Thornpaw
    .isOnQuest 94489
step
    .goto 2521,61.72,39.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elegael Thornpaw|r
    .turnin 94490 >>Turn in Ripped Missive
    .target Elegael Thornpaw
    .isOnQuest 94490
step
    .goto 2521,61.72,39.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elegael Thornpaw|r
    .turnin 94488 >>Turn in The Ties That Bind
    .target Elegael Thornpaw
    .isOnQuest 94488
step
    .goto 2521,61.72,39.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elegael Thornpaw|r
    .accept 94491 >>Accept The Fate of the Den
    .target Elegael Thornpaw
    .isQuestTurnedIn 94490 --any of: Ripped Missive
step
    #loop
    .goto 2521,63.51,45.29,0
    .goto 2521,63.51,45.29,40,0
    .goto 2521,63.80,48.67,40,0
    .goto 2521,63.75,54.48,40,0
    .goto 2521,61.50,53.54,40,0
    .goto 2521,59.03,54.09,40,0
    .goto 2521,56.63,50.37,40,0
    .goto 2521,59.08,48.88,40,0
    .goto 2521,59.84,51.32,40,0
    .goto 2521,61.65,49.63,40,0
    >>Kill |cRXP_ENEMY_Al'Aketh Stormchasers|r, |cRXP_ENEMY_Al'Aketh Footsoldiers|r, |cRXP_ENEMY_Al'Aketh Guardians|r and |cRXP_ENEMY_Al'Aketh Spiritcallers|r. Loot them for |cRXP_LOOT_Al'Alketh Cultist's Ear|r
    .complete 93165,1 --Al'Alketh Cultist's Ear (10)
    .mob Al'Aketh Stormchaser
    .mob Al'Aketh Footsoldier
    .mob Al'Aketh Guardian
    .mob Al'Aketh Spiritcaller
    .isOnQuest 93165
step
    .goto 2521,66.04,74.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ealaane Nimbuswalker|r
    .turnin 94896 >>Turn in Aid For The Refugees
    .target Ealaane Nimbuswalker
    .isOnQuest 94896
step
    .goto 2521,66.04,74.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ealaane Nimbuswalker|r
    .turnin 94897 >>Turn in The Fate of a Loved One
    .target Ealaane Nimbuswalker
    .isOnQuest 94897
step
    .goto 2521,66.14,76.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Valennia Stormfist|r
    .turnin 93949 >>Turn in Bugged
    .target Valennia Stormfist
    .isOnQuest 93949
step
    .goto 2521,63.99,75.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotheluum Starbreeze|r
    .turnin 94491 >>Turn in The Fate of the Den
    .target Lotheluum Starbreeze
    .isOnQuest 94491
step << Alliance Druid
    .subzoneskip 16638,1
    .goto 2521,45.153,44.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Naeluna Swiftmend::254081|r.
    .train 5229 >>Train |T132126:0|t[Enrage]
    .train 8936 >>Train |T136085:0|t[Regrowth]
    .target Naeluna Swiftmend::254081
    .money <0.16
    .xp <12,1
step
    .goto 2521,60.55,73.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nyalah Brightfire|r
    .turnin 93317 >>Turn in Crab Season
    .target Nyalah Brightfire
    .isOnQuest 93317
step << Alliance Rogue
    .goto 2521,59.55,73.3,30,0
    .goto 2521,59.91,72.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eltheen Nightbreeze::252379|r.
    .train 1766 >>Train |T132219:0|t[Kick]
    .train 3127 >>Train |T132269:0|t[Parry]
    .target Eltheen Nightbreeze::252379
    .money <0.16
    .xp <12,1
step << Alliance Hunter
    .goto 2521,59.571,72.639
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quel'ana Quickgale::252389|r.
    .train 14281 >>Train |T132218:0|t[Arcane Shot (Rank 2)]
    .target Quel'ana Quickgale::252389
    .money <0.08
    .xp <12,1
step << Alliance Warrior
    .goto 2521,59.89,72.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Seena Skybreaker::252377|r.
    .train 5242 >>Train |T132333:0|t[Battle Shout (Rank 2)]
    .train 7384 >>Train |T132223:0|t[Overpower]
    .train 7887,1
    .train 72 >>Train |T132357:0|t[Shield Bash]
    .train 1671,1
    .target Seena Skybreaker::252377
    .money <0.3
    .xp <12,1
step << Skyborne Warrior
    .goto 2521,59.86,72.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Seena Skybreaker|r
    .turnin 94003 >>Turn in The Skybreaker Bulwark
    .target Seena Skybreaker
    .isOnQuest 94003
step << Warrior Horde
    .subzoneskip 16638,1
    .goto 2521,59.89,72.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Seena Skybreaker::252377|r.
    .train 5242 >>Train |T132333:0|t[Battle Shout (Rank 2)]
    .train 7384 >>Train |T132223:0|t[Overpower]
    .train 7887,1
    .train 72 >>Train |T132357:0|t[Shield Bash]
    .train 1671,1
    .target Seena Skybreaker::252377
    .money <0.3
    .xp <12,1
step << Warrior Horde
    .subzoneskip 16638,1
    .goto 2521,59.89,72.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Seena Skybreaker::252377|r.
    .train 1160 >>Train |Tinterface/icons/ability_warrior_warcry.blp:0|t[Demoralizing Shout]
    .train 6190,1
    .train 6572 >>Train |Tinterface/icons/ability_warrior_revenge.blp:0|t[Revenge]
    .train 6574,1
    .train 1310185 >>Train |T136031:0|t[Tactical Mastery]
    .target Seena Skybreaker::252377
    .money <0.45
    .xp <14,1
step << Horde Rogue
    .goto 2521,59.9,72.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eltheen Nightbreeze::252379|r.
    .train 1766 >>Train |T132219:0|t[Kick]
    .train 3127 >>Train |T132269:0|t[Parry]
    .target Eltheen Nightbreeze::252379
    .money <0.16
    .xp <12,1
step << Warrior Alliance
    .subzoneskip 16638,1
    .goto 2521,59.89,72.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Seena Skybreaker::252377|r.
    .train 1160 >>Train |Tinterface/icons/ability_warrior_warcry.blp:0|t[Demoralizing Shout]
    .train 6190,1
    .train 6572 >>Train |Tinterface/icons/ability_warrior_revenge.blp:0|t[Revenge]
    .train 6574,1
    .train 1310185 >>Train |T136031:0|t[Tactical Mastery]
    .target Seena Skybreaker::252377
    .money <0.45
    .xp <14,1
step
    .goto 2521,59.06,72.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Riaani Nightwind|r
    .turnin 93737 >>Turn in The Broken Construct
    .target Riaani Nightwind
    .isOnQuest 93737
step << Horde
    .goto 2521,58.986,75.460
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Railee Thriceforged::257422|r.
    .vendor 257422 >>Vendor trash.
    .target Railee Thriceforged::257422
step
    .goto 2521,59.06,72.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Riaani Nightwind|r
    .accept 93738 >>Accept The Broken Construct
    .target Riaani Nightwind
    .isQuestTurnedIn 93737 --any of: The Broken Construct
step
    .goto 2521,58.13,78.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Endaria Mistgaze|r
    .turnin 93736 >>Turn in Unwelcome Spirits
    .target Endaria Mistgaze
    .isOnQuest 93736
step
    .goto 2521,58.16,79.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ayessa Dawnsinger|r
    .turnin 93738 >>Turn in The Broken Construct
    .target Ayessa Dawnsinger
    .isOnQuest 93738
step
    .goto 2521,58.16,79.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ayessa Dawnsinger|r
    .accept 93746 >>Accept A Firm Response
    .target Ayessa Dawnsinger
    .isQuestTurnedIn 93738 --any of: The Broken Construct
step
    .goto 2521,58.16,79.45
    >>Listen to what Ayessa Dawnsinger has to say.
    .complete 92708,1 --Ayessa Dawnsinger
    .target Ayessa Dawnsinger
    .isOnQuest 92708
step
    .goto 2521,58.16,79.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ayessa Dawnsinger|r
    .turnin 92708 >>Turn in A Grand Adventure
    .target Ayessa Dawnsinger
    .isOnQuest 92708
step << Skyborne Hunter
    #completewith next
    .hs >>Hearth to Coriella Calmbreeze's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step << Skyborne Hunter
    .goto 2521,45.26,44.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elayaa Easewind|r
    .accept 94007 >>Accept Taming the Beast
    .target Elayaa Easewind
step
    .goto 2521,59.93,57.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Belathaan Brightwish|r
    .complete 93746,1 --Belathaan Brightwish
    .target Belathaan Brightwish
    .isOnQuest 93746
step << Skyborne Hunter
    .goto 2521,59.56,72.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quel'ana Quickgale|r
    .turnin 94007 >>Turn in Taming the Beast
    .target Quel'ana Quickgale
step
    .goto 2521,58.16,79.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ayessa Dawnsinger|r
    .turnin 93746 >>Turn in A Firm Response
    .target Ayessa Dawnsinger
    .isOnQuest 93746
step
    .goto 2521,58.16,79.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ayessa Dawnsinger|r
    .accept 92871 >>Accept In Service of Zephras
    .accept 93740 >>Accept Blood for Blood
    .target Ayessa Dawnsinger
    .isQuestTurnedIn 93746 --any of: A Firm Response
step << Druid
    .goto 2521,63.983,75.093
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotheluum Starbreeze::252359|r.
    .train 5232 >>Train |T1:0|t[Mark of the Wild (Rank 2)]
    .train 8924 >>Train |T1:0|t[Moonfire (Rank 2)]
    .target Lotheluum Starbreeze::252359
step
    .goto 2521,66.14,76.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Valennia Stormfist|r
    .turnin 92871 >>Turn in In Service of Zephras
    .target Valennia Stormfist
    .isOnQuest 92871
step
    .goto 2521,66.14,76.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Valennia Stormfist|r
    .accept 93320 >>Accept Tower Defense
    .target Valennia Stormfist
    .isQuestTurnedIn 92860,92871 --any of: In Service of Zephras, In Service of Zephras
step
    .goto 2521,69.65,67.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yorana Windyreed|r
    .turnin 93320 >>Turn in Tower Defense
    .target Yorana Windyreed
    .isOnQuest 93320
step
    .goto 2521,69.65,67.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yorana Windyreed|r
    .accept 92642 >>Accept Disrupting Logistics
    .accept 92645 >>Accept Breaking the Breaker
    .target Yorana Windyreed
    .isQuestTurnedIn 93320 --any of: Tower Defense
step
    .goto 2521,65.58,65.62
    >>Kill |cRXP_ENEMY_Commander Belguilos|r
    .complete 92645,1 --Commander Belguilos slain (1)
    .mob Commander Belguilos
    .isOnQuest 92645
step
    #loop
    .goto 2521,65.85,66.38,0
    .goto 2521,65.85,66.38,40,0
    .goto 2521,63.95,67.12,40,0
    .goto 2521,63.10,69.55,40,0
    .goto 2521,65.42,71.96,40,0
    .goto 2521,65.03,69.01,40,0
    .goto 2521,67.32,67.76,40,0
    .goto 2521,69.23,67.44,40,0
    .goto 2521,66.70,61.99,40,0
    .goto 2521,65.17,63.45,40,0
    >>Kill |cRXP_ENEMY_Al'Aketh Stormchasers|r, |cRXP_ENEMY_Al'Aketh Footsoldiers|r, |cRXP_ENEMY_Al'Aketh Guardians|r and |cRXP_ENEMY_Al'Aketh Spiritcallers|r. Loot them for |cRXP_LOOT_Al'Aketh Windstone Charm|r
    .complete 93740,1 --Al'Aketh Windstone Charm (10)
    .mob Al'Aketh Stormchaser
    .mob Al'Aketh Footsoldier
    .mob Al'Aketh Guardian
    .mob Al'Aketh Spiritcaller
    .isOnQuest 93740
step
    #loop
    .goto 2521,66.05,67.20,0
    .goto 2521,66.05,67.20,40,0
    .goto 2521,67.65,67.90,40,0
    .goto 2521,69.23,67.44,40,0
    .goto 2521,65.42,71.96,40,0
    .goto 2521,65.03,69.01,40,0
    .goto 2521,63.10,69.55,40,0
    .goto 2521,64.29,67.19,40,0
    .goto 2521,65.14,64.33,40,0
    .goto 2521,65.18,66.35,40,0
    >>Kill |cRXP_ENEMY_Al'Aketh Brawlers|r
    .complete 92642,2 --Al'Aketh Brawler slain (8)
    .mob Al'Aketh Brawler
    .isOnQuest 92642
step
    #loop
    .goto 2521,66.06,67.57,0
    .goto 2521,66.06,67.57,40,0
    .goto 2521,65.09,68.93,40,0
    .goto 2521,65.59,70.58,40,0
    .goto 2521,64.06,70.33,40,0
    .goto 2521,63.37,68.41,40,0
    .goto 2521,65.15,64.64,40,0
    .goto 2521,67.61,67.12,40,0
    .goto 2521,68.95,67.71,40,0
    .goto 2521,67.48,69.01,40,0
    >>Kill |cRXP_ENEMY_Al'Aketh Healers|r
    .complete 92642,1 --Al'Aketh Healer slain (4)
    .mob Al'Aketh Healer
    .isOnQuest 92642
step
    .goto 2521,69.65,67.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yorana Windyreed|r
    .turnin 92642 >>Turn in Disrupting Logistics
    .target Yorana Windyreed
    .isOnQuest 92642
step
    .goto 2521,69.65,67.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yorana Windyreed|r
    .turnin 92645 >>Turn in Breaking the Breaker
    .target Yorana Windyreed
    .isOnQuest 92645
step
    .goto 2521,69.65,67.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yorana Windyreed|r
    .accept 92880 >>Accept Return to Valanaar
    .target Yorana Windyreed
    .isQuestTurnedIn 92642 --Disrupting Logistics
    .isQuestTurnedIn 92645 --Breaking the Breaker
step
    .goto 2521,66.14,76.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Valennia Stormfist|r
    .turnin 92880 >>Turn in Return to Valanaar
    .target Valennia Stormfist
    .isOnQuest 92880
step
    .goto 2521,66.14,76.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Valennia Stormfist|r
    .accept 92881 >>Accept The High Elder's Request
    .target Valennia Stormfist
    .isQuestTurnedIn 92880 --any of: Return to Valanaar
step
    .goto 2521,66.17,76.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Talaanis Shadowsong|r
    .turnin 92881 >>Turn in The High Elder's Request
    .target Talaanis Shadowsong
    .isOnQuest 92881
step
    .goto 2521,66.17,76.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Talaanis Shadowsong|r
    .accept 92643 >>Accept The Turncoat
    .target Talaanis Shadowsong
    .isQuestTurnedIn 92881 --any of: The High Elder's Request
step << Alliance
    .subzoneskip 16638,1
    .goto 2521,63.14,76.9,20,0
    .goto 2521,62.9,77.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Belann Windwood::256507|r inside the house.
    .vendor 256507 >>Vendor trash and repair if needed
    .target Belann Windwood::256507
step
    .goto 2521,56.16,60.59
    >>Find the cultist turncoat at the house just inside the highlands northwest of Valanaar.
    .complete 92643,1 --DNT KILL CREDIT
    .target DNT KILL CREDIT
    .isOnQuest 92643
step
    .goto 2521,56.04,58.77
    >>Interact with |cRXP_FRIENDLY_Dead Cultist|r
    .complete 92643,2 --Dead Cultist
    .target Dead Cultist
    .isOnQuest 92643
step
    .goto 2521,56.04,58.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dead Cultist|r
    .turnin 92643 >>Turn in The Turncoat
    .target Dead Cultist
    .isOnQuest 92643
step
    .goto 2521,56.04,58.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dead Cultist|r
    .accept 92644 >>Accept Unfortunate News
    .target Dead Cultist
    .isQuestTurnedIn 92643 --any of: The Turncoat
step
    .goto 2521,66.17,76.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Talaanis Shadowsong|r
    .turnin 92644 >>Turn in Unfortunate News
    .target Talaanis Shadowsong
    .isOnQuest 92644
step
    .goto 2521,66.17,76.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Talaanis Shadowsong|r
    .accept 94568 >>Accept The Cult's True Plans
    .target Talaanis Shadowsong
    .isQuestTurnedIn 92644 --any of: Unfortunate News
step
    .goto 2521,66.17,76.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Talaanis Shadowsong|r
    .complete 94568,1 --Talaanis Shadowsong
    .target Talaanis Shadowsong
    .isOnQuest 94568
step
    .goto 2521,66.17,76.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Talaanis Shadowsong|r
    .turnin 94568 >>Turn in The Cult's True Plans
    .target Talaanis Shadowsong
    .isOnQuest 94568
step
    .goto 2521,66.17,76.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Talaanis Shadowsong|r
    .accept 92640 >>Accept Desperate Times
    .target Talaanis Shadowsong
    .isQuestTurnedIn 94568 --any of: The Cult's True Plans
step
    .goto 2521,66.14,76.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Valennia Stormfist|r
    .complete 92640,1 --Valennia Stormfist
    .target Valennia Stormfist
    .isOnQuest 92640
step
    .goto 2521,66.63,79.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Elaadrin Evengale|r
    .complete 92640,3 --Elaadrin Evengale
    .target Elaadrin Evengale
    .isOnQuest 92640
step
    .goto 2521,58.16,79.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ayessa Dawnsinger|r
    .complete 92640,2 --Ayessa Dawnsinger
    .target Ayessa Dawnsinger
    .isOnQuest 92640
step
    .goto 2521,58.16,79.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ayessa Dawnsinger|r
    .turnin 93740 >>Turn in Blood for Blood
    .target Ayessa Dawnsinger
    .isOnQuest 93740
step
    .goto 2521,66.14,76.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Valennia Stormfist|r
    .turnin 92640 >>Turn in Desperate Times
    .target Valennia Stormfist
    .isOnQuest 92640
step
    .goto 2521,66.14,76.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Valennia Stormfist|r
    .accept 93065 >>Accept Prepare for Battle
    .target Valennia Stormfist
    .isQuestTurnedIn 92640 --any of: Desperate Times
step
    .goto 2521,61.19,70.80
    >>Interact with |cRXP_FRIENDLY_Valennia Stormfist|r
    .complete 93065,1 --Valennia Stormfist
    .target Valennia Stormfist
    .isOnQuest 93065
step
    .goto 2521,61.17,70.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Valennia Stormfist|r
    .turnin 93065 >>Turn in Prepare for Battle
    .target Valennia Stormfist
    .isOnQuest 93065
step << Alliance Mage
    .goto 2521,65.4,80.22,10,0
    .goto 2521,65.91,80.58
    >>Enter the large stone hall beside the blacksmith, continue into the upper chamber, then turn right.
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Anathamaas Aetherwind::252373|r.
    .train 145 >>Train |T135812:0|t[Fireball (Rank 3)]
    .train 604 >>Train |T136006:0|t[Dampen Magic]
    .train 597 >>Train |T133952:0|t[Conjure Food (Rank 2)]
    .train 130 >>Train |T135992:0|t[Slow Fall]
    .target Anathamaas Aetherwind::252373
    .money <0.24
    .xp <12,1
step
    .goto 2521,61.17,70.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Valennia Stormfist|r
    .accept 92947 >>Accept Making Our Move
    .target Valennia Stormfist
    .isQuestTurnedIn 93065 --any of: Prepare for Battle
step
    #loop
    .goto 2521,64.72,55.89,0
    .goto 2521,64.72,55.89,40,0
    .goto 2521,63.90,54.42,40,0
    .goto 2521,62.55,53.02,40,0
    .goto 2521,61.61,53.31,40,0
    .goto 2521,62.56,51.65,40,0
    .goto 2521,63.33,52.34,40,0
    .goto 2521,64.47,52.15,40,0
    .goto 2521,64.94,49.58,40,0
    .goto 2521,66.43,53.31,40,0
    >>Kill |cRXP_ENEMY_Al'Aketh Blademasters|r
    .complete 92947,3 --Al'Aketh Blademaster slain (7)
    .mob Al'Aketh Blademaster
    .isOnQuest 92947
step
    #loop
    .goto 2521,63.09,53.60,0
    .goto 2521,63.09,53.60,40,0
    .goto 2521,61.68,53.36,40,0
    .goto 2521,59.03,54.09,40,0
    .goto 2521,60.69,52.16,40,0
    .goto 2521,62.46,51.30,40,0
    .goto 2521,63.58,52.07,40,0
    .goto 2521,65.11,53.56,40,0
    .goto 2521,65.88,56.94,40,0
    .goto 2521,64.20,55.22,40,0
    >>Kill |cRXP_ENEMY_Al'Aketh Spiritcallers|r
    .complete 92947,2 --Al'Aketh Spiritcaller slain (7)
    .mob Al'Aketh Spiritcaller
    .isOnQuest 92947
step
    #loop
    .goto 2521,61.68,51.47,0
    .goto 2521,61.68,51.47,40,0
    .goto 2521,61.96,49.11,40,0
    .goto 2521,59.91,50.05,40,0
    .goto 2521,58.14,51.04,40,0
    .goto 2521,58.97,53.90,40,0
    .goto 2521,63.21,53.88,40,0
    .goto 2521,64.77,55.81,40,0
    .goto 2521,64.79,53.73,40,0
    .goto 2521,64.06,51.97,40,0
    >>Kill |cRXP_ENEMY_Al'Aketh Guardians|r
    .complete 92947,1 --Al'Aketh Guardian slain (7)
    .mob Al'Aketh Guardian
    .isOnQuest 92947
step
    .goto 2521,63.82,50.59
    >>Interact with |cRXP_FRIENDLY_Hyusaa Quickbreeze|r
    .complete 92947,4 --Hyusaa Quickbreeze
    .target Hyusaa Quickbreeze
    .isOnQuest 92947
step
    .goto 2521,63.77,50.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hyusaa Quickbreeze|r
    .turnin 92947 >>Turn in Making Our Move
    .target Hyusaa Quickbreeze
    .isOnQuest 92947
step
    .goto 2521,63.77,50.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hyusaa Quickbreeze|r
    .accept 93958 >>Accept The Inner Sanctum
    .target Hyusaa Quickbreeze
    .isQuestTurnedIn 92947 --any of: Making Our Move
step
    .goto 2521,66.25,50.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Valennia Stormfist|r
    .turnin 93958 >>Turn in The Inner Sanctum
    .target Valennia Stormfist
    .isOnQuest 93958
step
    .goto 2521,66.25,50.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Valennia Stormfist|r
    .accept 92646 >>Accept Confront Lorthuna
    .target Valennia Stormfist
    .isQuestTurnedIn 93958 --any of: The Inner Sanctum
step
    .goto 2521,63.81,36.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vayn Moongaze|r
    .turnin 93165 >>Turn in Mercy Falls on Deaf Ears
    .target Vayn Moongaze
    .isOnQuest 93165
step
    .goto 2521,74.87,53.02
    >>Confront Lorthuna
    .complete 92646,1 --Confront Lorthuna
    .isOnQuest 92646
step
    .goto 2521,58.16,79.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ayessa Dawnsinger|r
    .turnin 92646 >>Turn in Confront Lorthuna
    .target Ayessa Dawnsinger
    .isOnQuest 92646
step
    .goto 2521,58.16,79.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ayessa Dawnsinger|r
    .accept 93836 >>Accept The Fate of Zephras
    .target Ayessa Dawnsinger
    .isQuestTurnedIn 92646 --any of: Confront Lorthuna
step
    .goto 2521,66.17,76.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Talaanis Shadowsong|r
    .complete 93836,1 --Talaanis Shadowsong
    .target Talaanis Shadowsong
    .isOnQuest 93836
step
    .goto 2521,66.17,76.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Talaanis Shadowsong|r
    .turnin 93836 >>Turn in The Fate of Zephras
    .target Talaanis Shadowsong
    .isOnQuest 93836
step
    .goto 2521,66.17,76.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Talaanis Shadowsong|r
    .accept 93090 >>Accept What Comes Next
    .target Talaanis Shadowsong
    .isQuestTurnedIn 93836 --any of: The Fate of Zephras
step
    .goto 2521,58.16,79.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ayessa Dawnsinger|r
    .turnin 93090 >>Turn in What Comes Next
    .target Ayessa Dawnsinger
    .isOnQuest 93090
step
    .goto 2521,58.16,79.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ayessa Dawnsinger|r
    .accept 95349 >>Accept The Earthen Ring
    .target Ayessa Dawnsinger
    .isQuestTurnedIn 93090 --any of: What Comes Next
step
    +|cRXP_WARN_End of the Zephras Isle route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Mulgore|r: The Earthen Ring
step
    +|cRXP_WARN_Suggested next zones at level 14|r: |cRXP_FRIENDLY_The Barrens|r (about 1.3 levels of quests, starting around Gazlowe), |cRXP_FRIENDLY_Silverpine Forest|r (about 0.9 levels of quests, starting around High Executor Hadrec), |cRXP_FRIENDLY_Durotar|r (about 0.8 levels of quests, starting around Orgnil Soulscar). Completing this step loads the guide for The Barrens --RouteBuilder:next
]])
