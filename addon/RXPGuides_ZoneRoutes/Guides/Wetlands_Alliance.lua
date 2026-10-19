-- 20-34 Wetlands: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 5 parts (from level 20, 23, 27, 30, 33).
-- Split into 5 guides, listed under "20 - 34 Wetlands" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Wetlands.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 20 - 34 Wetlands
#subweight -20
#name 20-21 Wetlands: around Karl Boran
--RouteBuilder:next
#next Zone Routes (Alliance)\17-19 Darkshore: around Archaeologist Hollee;Zone Routes (Alliance)\20-21 Duskwood: around Madame Eva

step
    .goto 1437/0,-1779.08,-3468.16
    >>Click the |cRXP_PICK_Scrolls|r
    .accept 78146 >>Accept Goaz Scrolls
step
    .goto 1437/0,-1779.08,-3468.16
    >>Open the |cRXP_PICK_Scrolls|r. Loot it for |cRXP_LOOT_Goaz Scrolls|r
    .complete 78146,1 --Goaz Scrolls (1)
step
    .goto 1437/0,-718.35,-3701.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dewin Shimmerdawn|r
    .vendor 1453 >> |cRXP_WARN_Buy as many|r |T134831:0|t[Healing Potions] |cRXP_WARN_that are available|r
    >>|cRXP_WARN_This is a limited supply item. Skip this step if |cRXP_FRIENDLY_Dewin Shimmerdawn|r doesn't have any|r
    .target Dewin Shimmerdawn
step
    .goto 1437/0,-733.65,-3762.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Karl Boran|r
    .accept 279 >>Accept Claws from the Deep
    .target Karl Boran
step << NightElf
    .goto 1437/0,-782.03,-3793.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shellei|r
    .fp Wetlands>> Get the Wetlands flight path
    .target Shellei Brondir
step
    .goto 1437/0,-778.73,-3767.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bart Tidewater|r
    .turnin 98459 >>Turn in A Lack of Virtue
    .target Bart Tidewater
    .isOnQuest 98459
step
    .goto 1437/0,-840.34,-3791.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_First Mate Fitzsimmons|r
    .accept 463 >>Accept The Greenwarden
    .target First Mate Fitzsimmons
step
    .goto 1437/0,-832.07,-3827.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Helbrek|r
    .target Innkeeper Helbrek
    .home >>Set your Hearthstone to Innkeeper Helbrek's inn
step
    .goto 1437/0,-807.26,-3716.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Valstag Ironjaw|r
    .accept 98197 >>Accept Spoils of War
    .target Valstag Ironjaw
step
    .goto 1437/0,-837.86,-3813.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archaeologist Flagongut|r
    .turnin 942 >>Turn in The Absent Minded Prospector
    .target Archaeologist Flagongut
    .isOnQuest 942
step
    .goto 1437/0,-819.67,-3691.42,15,0
    .goto 1437/0,-807.26,-3716.22,15,0
    .goto 1437/0,-827.94,-3724.49,15,0
    .goto 1437,10.760,56.721
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Neal Allen|r
    .vendor 1448 >> |cRXP_WARN_Buy a|r |T133024:0|t[Bronze Tube] |cRXP_BUY_from him if its up|r
    >>|cRXP_WARN_This is a limited supply item. Skip this step if |cRXP_FRIENDLY_Neal Allen|r doesn't have one|r
    .target Neal Allen
    .money <0.08
step
    .goto 1437/0,-880.87,-3769.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Caitlin Grassman|r
    .accept 98282 >>Accept Alchemical Hazards
    .target Caitlin Grassman
    .xp <20,1
step
    #completewith Along8
    >>As you go: Pick up |cRXP_PICK_Khaz Modan Timber|r from the ground. |cRXP_WARN_Anything left is finished later|r
    .complete 98197,1 --Khaz Modan Timber (6)
step
    #label Along8
    .goto 1437/0,-865.16,-3585.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tarrel Rockweaver|r
    .turnin 98461 >>Turn in Unrequited Love
    .target Tarrel Rockweaver
    .isOnQuest 98461
step
    #loop
    .goto 1437/0,-914.78,-3314.36,0
    .goto 1437/0,-914.78,-3314.36,40,0
    .goto 1437/0,-880.46,-3283.77,40,0
    .goto 1437/0,-842.00,-3246.56,40,0
    .goto 1437/0,-894.52,-3224.51,40,0
    .goto 1437/0,-947.45,-3247.94,40,0
    .goto 1437/0,-1027.68,-3212.66,40,0
    .goto 1437/0,-1040.91,-3272.19,40,0
    .goto 1437/0,-977.23,-3284.87,40,0
    .goto 1437/0,-948.28,-3306.92,40,0
    >>Kill |cRXP_ENEMY_Bluegill Murlocs|r
    .complete 279,1 --Bluegill Murloc slain (12)
    .mob Bluegill Murloc
step
    .goto 1437/0,-1136.85,-3246.01
    >>Kill |cRXP_ENEMY_Gobbler|r and loot |cRXP_LOOT_Gobbler's Head|r
    .complete 279,2 --Gobbler's Head (1)
    .mob Gobbler
step
    .goto 1437/0,-2453.98,-3233.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Einar Stonegrip|r
    .accept 469 >>Accept Daily Delivery
    .target Einar Stonegrip
step
    .goto 1437/0,-2720.72,-3261.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rethiel the Greenwarden|r
    .turnin 463 >>Turn in The Greenwarden
    .accept 276 >>Accept Tramping Paws
    .target Rethiel the Greenwarden
step
    #loop
    .goto 1437/0,-2935.35,-3988.26,0
    .goto 1437/0,-2935.35,-3988.26,40,0
    .goto 1437/0,-3001.93,-4052.21,40,0
    .goto 1437/0,-2977.53,-4152.81,40,0
    .goto 1437/0,-2979.59,-4214.28,40,0
    .goto 1437/0,-2910.12,-4218.69,40,0
    .goto 1437/0,-2884.48,-4181.20,40,0
    .goto 1437/0,-2920.87,-4162.74,40,0
    .goto 1437/0,-2948.99,-4129.11,40,0
    .goto 1437/0,-2882.83,-4116.98,40,0
    >>Kill |cRXP_ENEMY_Mosshide Gnolls|r
    >>Kill |cRXP_ENEMY_Mosshide Mongrels|r
    .complete 276,1 --Mosshide Gnoll slain (15)
    .complete 276,2 --Mosshide Mongrel slain (10)
    .mob Mosshide Gnoll
    .mob Mosshide Mongrel
step << Shaman
    .goto 1437/0,-3109.03,-4257.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hervdana Saegrund|r
    .turnin 94495 >>Turn in Call of Water
    .target Hervdana Saegrund
    .isOnQuest 94495
step << Shaman
    .xp 20 >>Grind to level 20 (Call of Water needs it)
step << Shaman
    .goto 1437/0,-3109.03,-4257.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hervdana Saegrund|r
    .accept 94500 >>Accept Call of Water
    .turnin 94500 >>Turn in Call of Water
    .accept 94497 >>Accept Call of Water
    .turnin 94497 >>Turn in Call of Water
    .accept 94499 >>Accept Call of Water
    .turnin 94499 >>Turn in Call of Water
    .accept 94501 >>Accept Call of Water
    .target Hervdana Saegrund
step
    .goto 1437/0,-2720.72,-3261.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rethiel the Greenwarden|r
    .turnin 276 >>Turn in Tramping Paws
    .target Rethiel the Greenwarden
step
    .goto 1437/0,-3034.60,-3897.31,0
    .goto 1437/0,-2980.84,-4063.51,0
    .goto 1437/0,-2693.01,-4220.34,0
    .goto 1437/0,-2942.38,-4141.24,0
    .goto 1437/0,-3034.60,-3897.31,60,0
    .goto 1437/0,-2980.84,-4063.51,60,0
    .goto 1437/0,-2693.01,-4220.34,60,0
    .goto 1437/0,-2942.38,-4141.24,60,0
    .goto 1437/0,-2980.84,-4063.51,60,0
    .goto 1437/0,-3034.60,-3897.31,60,0
    >>Kill |cRXP_ENEMY_Mosshide Gnolls|r and |cRXP_ENEMY_Mosshide Mongrels|r
    .xp 23+3170 >> Grind to 3170+/29400xp
step
    .goto 1437/0,-3034.60,-3897.31,0
    .goto 1437/0,-2980.84,-4063.51,0
    .goto 1437/0,-2693.01,-4220.34,0
    .goto 1437/0,-2942.38,-4141.24,0
    .goto 1437/0,-3034.60,-3897.31,60,0
    .goto 1437/0,-2980.84,-4063.51,60,0
    .goto 1437/0,-2693.01,-4220.34,60,0
    .goto 1437/0,-2942.38,-4141.24,60,0
    .goto 1437/0,-2980.84,-4063.51,60,0
    .goto 1437/0,-3034.60,-3897.31,60,0
    >>Kill |cRXP_ENEMY_Mosshide Gnolls|r and |cRXP_ENEMY_Mosshide Mongrels|r
    .xp 23+7970 >> Grind to 7970+/29400xp
step
    .goto 1437/0,-2720.72,-3261.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rethiel the Greenwarden|r
    .accept 277 >>Accept Fire Taboo
    .target Rethiel the Greenwarden
    .xp <20,1
step
    .goto 1437/0,-2459.36,-2648.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ashlan Stonesmirk|r
    .turnin 161 >>Turn in A Dark Threat Looms
    .target Ashlan Stonesmirk
    .isOnQuest 161
step
    .goto 1437/0,-2459.36,-2648.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ashlan Stonesmirk|r
    .accept 274 >>Accept A Dark Threat Looms
    .target Ashlan Stonesmirk
    .isQuestTurnedIn 161 --any of: A Dark Threat Looms
    .xp <16,1
step
    #completewith next
    .hs >>Hearth to Innkeeper Helbrek's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .xp 20 >>Grind to level 20 (Alchemical Hazards needs it)
step
    .goto 1437/0,-880.87,-3769.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Caitlin Grassman|r
    .accept 98282 >>Accept Alchemical Hazards
    .target Caitlin Grassman
step
    .goto 1437/0,-733.65,-3762.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Karl Boran|r
    .turnin 279 >>Turn in Claws from the Deep
    .accept 281 >>Accept Reclaiming Goods
    .target Karl Boran
step
    .goto 1437/0,-743.16,-3684.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_James Halloran|r
    .turnin 469 >>Turn in Daily Delivery
    .target James Halloran
step
    #loop
    .goto 1437/0,-625.30,-3672.12,0
    .goto 1437/0,-625.30,-3672.12,40,0
    .goto 1437/0,-637.71,-3603.22,40,0
    .goto 1437/0,-633.57,-3578.41,40,0
    .goto 1437/0,-670.79,-3564.63,40,0
    .goto 1437/0,-716.28,-3545.34,40,0
    .goto 1437/0,-724.55,-3534.31,40,0
    .goto 1437/0,-666.66,-3479.19,40,0
    .goto 1437/0,-583.95,-3548.09,40,0
    .goto 1437/0,-596.35,-3597.70,40,0
    >>Pick up |cRXP_PICK_Khaz Modan Iron|r from the ground
    >>Pick up |cRXP_PICK_Khaz Modan Timber|r from the ground
    .complete 98197,2 --Khaz Modan Iron (30)
    .complete 98197,1 --Khaz Modan Timber (6)
step
    .goto 1437/0,-948.69,-3288.45
    >>Click the |cRXP_PICK_Damaged Crate|r
    .turnin 281 >>Turn in Reclaiming Goods
    .accept 284 >>Accept The Search Continues
step
    .goto 1437/0,-952.00,-3201.36
    >>Click the |cRXP_PICK_Sealed Barrel|r
    .turnin 284 >>Turn in The Search Continues
    .accept 285 >>Accept Search More Hovels
step
    .goto 1437/0,-966.06,-3107.37
    >>Click the |cRXP_PICK_Half-buried Barrel|r
    .turnin 285 >>Turn in Search More Hovels
    .accept 286 >>Accept Return the Statuette
step
    .goto 1437/0,-807.26,-3716.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Valstag Ironjaw|r
    .turnin 98197 >>Turn in Spoils of War
    .target Valstag Ironjaw
step
    .goto 1437/0,-733.65,-3762.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Karl Boran|r
    .turnin 286 >>Turn in Return the Statuette
    .accept 98189 >>Accept Return the Statuette
    .target Karl Boran
step
    .goto 1437,20.536,41.104,0
    .goto 1437,15.636,41.235,0
    .goto 1437,18.174,39.649,0
    .goto 1437,20.536,41.104,60,0
    .goto 1437,17.665,41.331,60,0
    .goto 1437,15.636,41.235,60,0
    .goto 1437,13.124,41.109,60,0
    .goto 1437,13.314,38.082,60,0
    .goto 1437,15.286,38.732,60,0
    .goto 1437,18.174,39.649,60,0
    .xp 24 >> Grind to level 24
step
    .goto 1437/0,-718.35,-3701.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dewin Shimmerdawn|r
    .vendor >> |cRXP_BUY_Buy as many|r |T134831:0|t[Healing Potions] |cRXP_BUY_that are available|r
    >>|cRXP_WARN_This is a limited supply item. Skip this step if |cRXP_FRIENDLY_Dewin Shimmerdawn|r doesn't have any|r
    .target Dewin Shimmerdawn
step
    .goto 1437/0,-823.64,-3807.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Samor Festivus|r upstairs
    .vendor >> |cRXP_BUY_Buy as many|r |T134831:0|t[Healing Potions] |cRXP_BUY_that are available|r
    >>|cRXP_WARN_This is a limited supply item. Skip this step if |cRXP_FRIENDLY_Samor Festivus|r doesn't have any|r
    .target Samor Festivus
step
    .goto 1437/0,-819.67,-3691.42,25,0
    .goto 1437/0,-807.26,-3716.22,25,0
    .goto 1437/0,-827.94,-3724.49,25,0
    .goto 1437/0,-834.60,-3711.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Neal Allen|r
    .vendor >> |cRXP_BUY_Buy a|r |T133024:0|t[Bronze Tube]
    >>|cRXP_WARN_This is a limited supply item. Skip this step if |cRXP_FRIENDLY_Neal Allen|r doesn't have one|r
    .target Neal Allen
step
    .goto 1437/0,-1481.33,-2857.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fradd Swiftgear|r
    .vendor >> |cRXP_BUY_Buy a|r |T133024:0|t[Bronze Tube]
    >>|cRXP_WARN_This is a limited supply item. Skip this step if |cRXP_FRIENDLY_Fradd Swiftgear|r doesn't have one|r
    .target Fradd Swiftgear
step
    .goto 1437/0,-717.11,-3685.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sylessa Duskwhisper|r
    .accept 98208 >>Accept Bloom of the Heavens
    .target Sylessa Duskwhisper
step
    .goto 1437/0,-743.16,-3684.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_James Halloran|r
    .accept 98240 >>Accept Crimson Crate Delivery
    .target James Halloran
step
    .goto 1437/0,-717.11,-3685.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sylessa Duskwhisper|r
    .turnin 98208 >>Turn in Bloom of the Heavens
    .target Sylessa Duskwhisper
    .isQuestComplete 98208
step
    .goto 1437/0,-797.34,-3732.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Stoutfist|r
    .turnin 98189 >>Turn in Return the Statuette
    .accept 98190 >>Accept A Friend of the Family
    .target Captain Stoutfist
step
    #loop
    .goto 1437/0,-2278.64,-3835.84,0
    .goto 1437/0,-2278.64,-3835.84,40,0
    .goto 1437/0,-2325.79,-3855.96,40,0
    .goto 1437/0,-2320.00,-3907.23,40,0
    .goto 1437/0,-2352.25,-3891.52,40,0
    .goto 1437/0,-2401.05,-3877.74,40,0
    .goto 1437/0,-2398.98,-3857.07,40,0
    .goto 1437/0,-2391.54,-3821.24,40,0
    .goto 1437/0,-2371.27,-3797.26,40,0
    .goto 1437/0,-2300.15,-3784.85,40,0
    >>Kill |cRXP_ENEMY_Leech Stalkers|r and |cRXP_ENEMY_Cave Stalkers|r. Loot them for |cRXP_LOOT_Unruptured Stalker Gland|r
    .complete 98282,1 --Unruptured Stalker Gland (1)
    .mob Leech Stalker
    .mob Cave Stalker
step
    .goto 1437/0,-2430.82,-3309.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Howin Kindfeather|r
    .turnin 98240 >>Turn in Crimson Crate Delivery
    .target Howin Kindfeather
step
    .goto 1437/0,-2720.72,-3261.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rethiel the Greenwarden|r
    .accept 277 >>Accept Fire Taboo
    .target Rethiel the Greenwarden
step
    .goto 1437/0,-827.11,-3817.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Glorin Steelbrow|r
    .turnin 270 >>Turn in The Doomed Fleet
    .target Glorin Steelbrow
    .isOnQuest 270
step
    .goto 1437/0,-880.87,-3769.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Caitlin Grassman|r
    .turnin 98282 >>Turn in Alchemical Hazards while you are here
    .isQuestComplete 98282
    .target Caitlin Grassman
step
    #loop
    .goto 1437/0,-2175.26,-3104.34,0
    .goto 1437/0,-2175.26,-3104.34,40,0
    .goto 1437/0,-2170.29,-3054.17,40,0
    .goto 1437/0,-2150.03,-3025.78,40,0
    .goto 1437/0,-2257.14,-3026.88,40,0
    .goto 1437/0,-2277.40,-3021.92,40,0
    .goto 1437/0,-2264.58,-3043.42,40,0
    .goto 1437/0,-2288.15,-3104.34,40,0
    .goto 1437/0,-2209.58,-3110.67,40,0
    .goto 1437/0,-2198.41,-3086.97,40,0
    >>Kill |cRXP_ENEMY_Mosshide Mistweavers|r, |cRXP_ENEMY_Mosshide Fenrunners|r, |cRXP_ENEMY_Mosshide Trappers|r and |cRXP_ENEMY_Mosshide Brutes|r. Loot them for |cRXP_LOOT_Crude Flint|r
    .complete 277,1 --Crude Flint (9)
    .mob Mosshide Mistweaver
    .mob Mosshide Fenrunner
    .mob Mosshide Trapper
    .mob Mosshide Brute
step
    .goto 1437/0,-2720.72,-3261.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rethiel the Greenwarden|r
    .turnin 277 >>Turn in Fire Taboo
    .target Rethiel the Greenwarden
step << Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Edwina Monzor|r
    .goto 1437/0,-844.48,-3763.08
    .vendor >> |cRXP_BUY_Restock on |r |T132382:0|t[Razor Arrows] |cRXP_BUY_if needed|r
    .target Edwina Monzor
step
    .goto 1437/0,-2611.13,-4086.39
    >>Traverse Dun Algaz
    .complete 455,3 --Traverse Dun Algaz
    .isOnQuest 455
step
    #loop
    .goto 1437/0,-2486.24,-4268.02,0
    .goto 1437/0,-2486.24,-4268.02,40,0
    .goto 1437/0,-2454.40,-4245.97,40,0
    .goto 1437/0,-2384.09,-4207.39,40,0
    .goto 1437/0,-2360.94,-4265.27,40,0
    .goto 1437/0,-2384.51,-4304.41,40,0
    .goto 1437/0,-2428.34,-4268.85,40,0
    .goto 1437/0,-2430.00,-4346.03,40,0
    .goto 1437/0,-2460.60,-4340.51,40,0
    .goto 1437/0,-2506.92,-4339.69,40,0
    >>Kill |cRXP_ENEMY_Dragonmaw Scouts|r
    .complete 455,1 --Dragonmaw Scout slain (8)
    .mob Dragonmaw Scout
    .isOnQuest 455
step
    #loop
    .goto 1437/0,-2404.36,-4277.40,0
    .goto 1437/0,-2404.36,-4277.40,40,0
    .goto 1437/0,-2340.26,-4272.16,40,0
    .goto 1437/0,-2358.46,-4231.09,40,0
    .goto 1437/0,-2367.97,-4197.19,40,0
    .goto 1437/0,-2383.27,-4236.33,40,0
    .goto 1437/0,-2456.88,-4270.50,40,0
    .goto 1437/0,-2519.32,-4310.75,40,0
    >>Kill |cRXP_ENEMY_Dragonmaw Grunts|r
    .complete 455,2 --Dragonmaw Grunt slain (6)
    .mob Dragonmaw Grunt
    .isOnQuest 455
step
    .goto 1437/0,-880.87,-3769.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Caitlin Grassman|r
    .turnin 98282 >>Turn in Alchemical Hazards
    .target Caitlin Grassman
step
    .goto 1437/0,-807.26,-3716.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Valstag Ironjaw|r
    .turnin 455 >>Turn in The Algaz Gauntlet
    .target Valstag Ironjaw
    .isOnQuest 455
step
    .goto 1437/0,-827.11,-3817.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Glorin Steelbrow|r
    .accept 321 >>Accept Lightforge Iron
    .target Glorin Steelbrow
    .isQuestTurnedIn 270 --any of: The Doomed Fleet
    .xp <20,1
step
    .goto 1437/0,-890.38,-3917.15
    >>Click the |cRXP_PICK_Waterlogged Chest|r
    .turnin 321 >>Turn in Lightforge Iron
    .isOnQuest 321
step << Hunter
    .goto 1437/0,-784.10,-4069.02
    .xp 29+29000 >> Grind to |cRXP_ENEMY_Murlocs|r 29000/44300 xp
step << Hunter
    .goto 1437/0,-784.10,-4069.02
    .xp 29+31100 >> Grind |cRXP_ENEMY_Murlocs|r to 31100/44300 xp
step << Hunter
    .goto 1437/0,-784.10,-4069.02
    .xp 29+31550 >> Grind |cRXP_ENEMY_Murlocs|r to 31550/44300 xp
step << Hunter
    .goto 1437/0,-784.10,-4069.02
    .xp 29+33650 >> Grind |cRXP_ENEMY_Murlocs|r to 33650/44300 xp
step
    .goto 1437/0,-827.94,-3822.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mikhail|r
    .turnin 1248 >>Turn in The Missing Diplomat
    .target Mikhail
    .isOnQuest 1248
step
    +|cRXP_WARN_That is all of Wetlands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Loch Modan|r: A Dark Threat Looms
    >>|cRXP_FRIENDLY_Loch Modan|r: Call of Water << Shaman
    >>|cRXP_FRIENDLY_Stormwind City|r: A Friend of the Family
    >>|cRXP_FRIENDLY_Undercity|r: Goaz Scrolls
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Bloom of the Heavens
step
    +|cRXP_WARN_Suggested next zones at level 20|r: |cRXP_FRIENDLY_Darkshore|r (about 0.7 levels of quests, starting around Archaeologist Hollee), |cRXP_FRIENDLY_Duskwood|r (about 0.5 levels of quests, starting around Madame Eva). Completing this step loads the guide for Darkshore --RouteBuilder:next
step
    +|cRXP_WARN_The rest of Wetlands is planned from level 23.|r Load its guide for level 23 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 20 - 34 Wetlands
#subweight -20
#name 23-24 Wetlands: around Captain Stoutfist

step
    .goto 1437/0,-743.16,-3684.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_James Halloran|r
    .accept 98072 >>Accept Crocs of the Sky
    .target James Halloran
step
    .goto 1437/0,-717.11,-3685.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sylessa Duskwhisper|r
    .turnin 98208 >>Turn in Bloom of the Heavens
    .target Sylessa Duskwhisper
    .isQuestComplete 98208
step
    .goto 1437/0,-832.07,-3827.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Helbrek|r
    .target Innkeeper Helbrek
    .home >>Set your Hearthstone to Innkeeper Helbrek's inn
step
    .goto 1437/0,-837.86,-3813.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archaeologist Flagongut|r
    .accept 943 >>Accept The Absent Minded Prospector
    .target Archaeologist Flagongut
    .isQuestTurnedIn 942 --any of: The Absent Minded Prospector
    .xp <15,1
step << Hunter
    .goto 1437/0,-823.64,-3807.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Samor Festivus|r upstairs
    .vendor >> |cRXP_BUY_Buy as many|r |T134831:0|t[Healing Potions] |cRXP_BUY_that are available|r
    >>|cRXP_WARN_This is a limited supply item. Skip this step if |cRXP_FRIENDLY_Samor Festivus|r doesn't have any|r
    .target Samor Festivus
step
    .goto 1437/0,-877.56,-3746.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sida|r
    .accept 470 >>Accept Digging Through the Ooze
    .target Sida
step << Hunter
    .goto 1437/0,-819.67,-3691.42,25,0
    .goto 1437/0,-807.26,-3716.22,25,0
    .goto 1437/0,-827.94,-3724.49,25,0
    .goto 1437/0,-834.60,-3711.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Neal Allen|r
    .vendor >> |cRXP_BUY_Buy a|r |T133024:0|t[Bronze Tube]
    >>|cRXP_WARN_This is a limited supply item. Skip this step if |cRXP_FRIENDLY_Neal Allen|r doesn't have one|r
    .target Neal Allen
step
    .goto 1437/0,-865.16,-3585.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tarrel Rockweaver|r
    .accept 305 >>Accept In Search of The Excavation Team
    .target Tarrel Rockweaver
step << Hunter
    .goto 1437/0,-1481.33,-2857.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fradd Swiftgear|r
    .vendor >> |cRXP_BUY_Buy a|r |T133024:0|t[Bronze Tube]
    >>|cRXP_WARN_This is a limited supply item. Skip this step if |cRXP_FRIENDLY_Fradd Swiftgear|r doesn't have one|r
    .target Fradd Swiftgear
step
    .goto 1437/0,-1968.49,-3550.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ormer Ironbraid|r
    .accept 294 >>Accept Ormer's Revenge
    .target Ormer Ironbraid
step
    .goto 1437/0,-1998.67,-3590.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Merrin Rockweaver|r
    .turnin 305 >>Turn in In Search of The Excavation Team while you are here
    .isQuestComplete 305
    .target Merrin Rockweaver
step
    .xp 23 >>Grind to level 23 (Old Habits needs it)
step
    .goto 1437/0,-2600.38,-3650.35
    >>Click the |cRXP_PICK_Tattered Spellbook|r
    .accept 98223 >>Accept Old Habits
step
    #completewith Along8
    >>As you go: Kill |cRXP_ENEMY_Crimson Oozes|r, |cRXP_ENEMY_Black Oozes|r and |cRXP_ENEMY_Monstrous Oozes|r. Loot them for |cRXP_LOOT_Sida's Bag|r. |cRXP_WARN_Anything left is finished later|r
    .complete 470,1 --Sida's Bag (1)
    .mob Crimson Ooze
    .mob Black Ooze
    .mob Monstrous Ooze
step
    #label Along8
    #loop
    .goto 1437/0,-2854.29,-3363.70,0
    .goto 1437/0,-2854.29,-3363.70,40,0
    .goto 1437/0,-2951.89,-3433.71,40,0
    .goto 1437/0,-3025.91,-3457.96,40,0
    .goto 1437/0,-2983.32,-3571.24,40,0
    .goto 1437/0,-3082.57,-3511.98,40,0
    .goto 1437/0,-3118.54,-3414.14,40,0
    .goto 1437/0,-3185.54,-3336.69,40,0
    .goto 1437/0,-3061.89,-3367.28,40,0
    .goto 1437/0,-3044.52,-3290.93,40,0
    >>Kill |cRXP_ENEMY_Red Whelps|r, |cRXP_ENEMY_Lost Whelps|r, |cRXP_ENEMY_Flamesnorting Whelps|r and |cRXP_ENEMY_Crimson Whelps|r. Loot them for |cRXP_LOOT_Pristine Crimson Scale|r
    .complete 98072,1 --Pristine Crimson Scale (8)
    .mob Red Whelp
    .mob Lost Whelp
    .mob Flamesnorting Whelp
    .mob Crimson Whelp
step
    #completewith next
    .hs >>Hearth to Innkeeper Helbrek's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1437/0,-797.34,-3732.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Stoutfist|r
    .turnin 98223 >>Turn in Old Habits
    .target Captain Stoutfist
step
    .goto 1437/0,-743.16,-3684.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_James Halloran|r
    .turnin 98072 >>Turn in Crocs of the Sky
    .target James Halloran
step
    #loop
    .goto 1437/0,-1339.49,-3704.92,0
    .goto 1437/0,-1339.49,-3704.92,40,0
    .goto 1437/0,-1391.18,-3595.77,40,0
    .goto 1437/0,-1432.54,-3519.70,40,0
    .goto 1437/0,-1514.83,-3436.74,40,0
    .goto 1437/0,-1464.79,-3456.31,40,0
    .goto 1437/0,-1405.66,-3437.01,40,0
    .goto 1437/0,-1388.70,-3478.36,40,0
    .goto 1437/0,-1386.63,-3537.89,40,0
    .goto 1437/0,-1339.07,-3528.52,40,0
    >>Kill |cRXP_ENEMY_Mottled Raptors|r
    >>Kill |cRXP_ENEMY_Mottled Screechers|r
    .complete 294,1 --Mottled Raptor slain (10)
    .complete 294,2 --Mottled Screecher slain (10)
    .mob Mottled Raptor
    .mob Mottled Screecher
step
    #loop
    .goto 1437/0,-1377.53,-3447.49,0
    .goto 1437/0,-1377.53,-3447.49,40,0
    .goto 1437/0,-1464.79,-3456.31,40,0
    .goto 1437/0,-1480.51,-3425.16,40,0
    .goto 1437/0,-1514.83,-3436.74,40,0
    .goto 1437/0,-1472.65,-3502.61,40,0
    .goto 1437/0,-1432.54,-3519.70,40,0
    .goto 1437/0,-1386.63,-3537.89,40,0
    .goto 1437/0,-1391.18,-3595.77,40,0
    .goto 1437/0,-1339.07,-3528.52,40,0
    >>Kill |cRXP_ENEMY_Mottled Raptors|r, |cRXP_ENEMY_Mottled Screechers|r, |cRXP_ENEMY_Mottled Scytheclaws|r and |cRXP_ENEMY_Mottled Razormaws|r. Loot them for |cRXP_LOOT_Stone of Relu|r
    .complete 943,1 --Stone of Relu (1)
    .mob Mottled Raptor
    .mob Mottled Screecher
    .mob Mottled Scytheclaw
    .mob Mottled Razormaw
    .isOnQuest 943
step
    .goto 1437/0,-1968.49,-3550.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ormer Ironbraid|r
    .turnin 294 >>Turn in Ormer's Revenge
    .accept 295 >>Accept Ormer's Revenge
    .target Ormer Ironbraid
step
    #loop
    .goto 1437/0,-1862.62,-3577.03,0
    .goto 1437/0,-1862.62,-3577.03,40,0
    .goto 1437/0,-1849.39,-3511.98,40,0
    .goto 1437/0,-1880.40,-3481.11,40,0
    .goto 1437/0,-1844.42,-3422.96,40,0
    .goto 1437/0,-1789.42,-3478.36,40,0
    .goto 1437/0,-1767.09,-3441.98,40,0
    .goto 1437/0,-1721.60,-3489.93,40,0
    .goto 1437/0,-1746.83,-3554.16,40,0
    .goto 1437/0,-1809.27,-3513.64,40,0
    >>Kill |cRXP_ENEMY_Mottled Scytheclaws|r
    >>Kill |cRXP_ENEMY_Mottled Razormaws|r
    .complete 295,1 --Mottled Scytheclaw slain (10)
    .complete 295,2 --Mottled Razormaw slain (10)
    .mob Mottled Scytheclaw
    .mob Mottled Razormaw
step
    .goto 1437/0,-1968.49,-3550.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ormer Ironbraid|r
    .turnin 295 >>Turn in Ormer's Revenge
    .target Ormer Ironbraid
step
    .goto 1437/0,-1996.61,-3586.95
    >>Pick up |cRXP_PICK_Flagongut's Fossil|r from the ground
    .complete 943,2 --Flagongut's Fossil (1)
    .isOnQuest 943
step
    .goto 1437/0,-1998.67,-3590.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Merrin Rockweaver|r
    .turnin 305 >>Turn in In Search of The Excavation Team
    .accept 306 >>Accept In Search of The Excavation Team
    .target Merrin Rockweaver
step << Mage
    .trainer >> Teleport back to Stormwind or Ironforge, and train your level 24 class spells
step
    #loop
    .goto 1437/0,-2176.08,-2952.19,0
    .goto 1437/0,-2176.08,-2952.19,40,0
    .goto 1437/0,-2211.23,-2913.88,40,0
    .goto 1437/0,-2249.28,-2878.60,40,0
    .goto 1437/0,-2319.58,-2881.35,40,0
    .goto 1437/0,-2351.42,-2910.57,40,0
    .goto 1437/0,-2380.37,-2825.95,40,0
    .goto 1437/0,-2309.24,-2830.92,40,0
    .goto 1437/0,-2209.17,-2814.38,40,0
    .goto 1437/0,-2162.44,-2874.19,40,0
    >>Kill |cRXP_ENEMY_Crimson Oozes|r, |cRXP_ENEMY_Black Oozes|r and |cRXP_ENEMY_Monstrous Oozes|r. Loot them for |cRXP_LOOT_Sida's Bag|r
    .complete 470,1 --Sida's Bag (1)
    .mob Crimson Ooze
    .mob Black Ooze
    .mob Monstrous Ooze
step
    .goto 1437/0,-837.86,-3813.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archaeologist Flagongut|r
    .turnin 943 >>Turn in The Absent Minded Prospector
    .target Archaeologist Flagongut
    .isOnQuest 943
step
    .goto 1437/0,-877.56,-3746.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sida|r
    .turnin 470 >>Turn in Digging Through the Ooze
    .target Sida
step
    .goto 1437/0,-865.16,-3585.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tarrel Rockweaver|r
    .turnin 306 >>Turn in In Search of The Excavation Team
    .target Tarrel Rockweaver
step << Hunter
    .goto 1437/0,-718.35,-3701.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dewin Shimmerdawn|r
    .vendor >> |cRXP_BUY_Buy as many|r |T134831:0|t[Healing Potions] |cRXP_BUY_that are available|r
    >>|cRXP_WARN_This is a limited supply item. Skip this step if |cRXP_FRIENDLY_Dewin Shimmerdawn|r doesn't have any|r
    .target Dewin Shimmerdawn
step << Hunter NightElf
    .goto 1437/0,-782.03,-3793.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shellei|r
    .fp Wetlands>> Get the Wetlands flight path
    .target Shellei Brondir
step
    .goto 1437/0,-840.34,-3791.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_First Mate Fitzsimmons|r
    .accept 288 >>Accept The Third Fleet
    .target First Mate Fitzsimmons
step
    .goto 1437/0,-832.07,-3827.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy |cRXP_LOOT_Flagon of Mead|r from |cRXP_FRIENDLY_Innkeeper Helbrek|r
    .complete 288,1 --Flagon of Mead (1)
    .target Innkeeper Helbrek
step
    .goto 1437/0,-840.34,-3791.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_First Mate Fitzsimmons|r
    .turnin 288 >>Turn in The Third Fleet
    .target First Mate Fitzsimmons
step << Hunter Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Edwina Monzor|r
    .goto 1437/0,-844.48,-3763.08
    .vendor >> |cRXP_BUY_Restock on|r |T132382:0|t[Sharp Arrows] |cRXP_BUY_if needed. If you're close to level 25 you can buy some|r |T132382:0|t[Razor Arrows] |cRXP_BUY_from her as well|r
    .xp >25,1
    .target Edwina Monzor
step
    .goto 1437/0,-807.26,-3716.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Valstag Ironjaw|r
    .accept 473 >>Accept Report to Captain Stoutfist
    .target Valstag Ironjaw
    .isQuestTurnedIn 455 --any of: The Algaz Gauntlet
    .xp <23,1
step
    .goto 1437/0,-743.16,-3684.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_James Halloran|r
    .accept 471 >>Accept Apprentice's Duties
    .target James Halloran
    .isQuestTurnedIn 484 --any of: Young Crocolisk Skins
    .xp <18,1
step
    .goto 1437/0,-797.34,-3732.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Stoutfist|r
    .turnin 473 >>Turn in Report to Captain Stoutfist
    .target Captain Stoutfist
    .isOnQuest 473
step
    .goto 1437/0,-797.34,-3732.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Stoutfist|r
    .accept 98230 >>Accept This Land Was Their Land
    .accept 464 >>Accept War Banners
    .target Captain Stoutfist
step
    .goto 1437/0,-2430.82,-3309.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Howin Kindfeather|r
    .turnin 98230 >>Turn in This Land Was Their Land
    .target Howin Kindfeather
step
    #loop
    .goto 1437/0,-2294.36,-3305.82,0
    .goto 1437/0,-2294.36,-3305.82,40,0
    .goto 1437/0,-2214.13,-3335.86,40,0
    .goto 1437/0,-2221.16,-3379.41,40,0
    .goto 1437/0,-2264.58,-3371.97,40,0
    .goto 1437/0,-2235.22,-3425.99,40,0
    .goto 1437/0,-2271.20,-3456.86,40,0
    .goto 1437/0,-2315.45,-3448.04,40,0
    .goto 1437/0,-2358.04,-3441.98,40,0
    .goto 1437/0,-2324.54,-3396.77,40,0
    >>Kill |cRXP_ENEMY_Dragonmaw Raiders|r, |cRXP_ENEMY_Dragonmaw Swamprunners|r, |cRXP_ENEMY_Dragonmaw Centurions|r and |cRXP_ENEMY_Dragonmaw Battlemasters|r. Loot them for |cRXP_LOOT_Dragonmaw War Banner|r
    .complete 464,1 --Dragonmaw War Banner (8)
    .mob Dragonmaw Raider
    .mob Dragonmaw Swamprunner
    .mob Dragonmaw Centurion
    .mob Dragonmaw Battlemaster
step
    .goto 1437/0,-1994.54,-3591.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Whelgar|r
    .accept 299 >>Accept Uncovering the Past
    .target Prospector Whelgar
step
    #loop
    .goto 1437/0,-1882.47,-3492.97,0
    .goto 1437/0,-1882.47,-3492.97,40,0
    .goto 1437/0,-1828.71,-3534.31,40,0
    .goto 1437/0,-1824.57,-3594.95,40,0
    .goto 1437/0,-1721.19,-3548.09,40,0
    .goto 1437/0,-1725.32,-3481.94,40,0
    .goto 1437/0,-1762.54,-3426.82,40,0
    .goto 1437/0,-1787.35,-3487.45,40,0
    .goto 1437/0,-1832.84,-3443.35,40,0
    .goto 1437/0,-1845.25,-3374.45,40,0
    >>Loot the |cRXP_PICK_Ancient Relics|r for |cRXP_LOOT_Ados Fragment|r
    >>Loot the |cRXP_PICK_Ancient Relics|r for |cRXP_LOOT_Modr Fragment|r
    >>Loot the |cRXP_PICK_Ancient Relics|r for |cRXP_LOOT_Golm Fragment|r
    >>Loot the |cRXP_PICK_Loose Soils|r for |cRXP_LOOT_Neru Fragment|r
    .complete 299,1 --Ados Fragment (4)
    .complete 299,2 --Modr Fragment (4)
    .complete 299,3 --Golm Fragment (4)
    .complete 299,4 --Neru Fragment (4)
step
    .goto 1437/0,-1994.54,-3591.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Whelgar|r
    .turnin 299 >>Turn in Uncovering the Past
    .target Prospector Whelgar
step
    .goto 1437/0,-2720.72,-3261.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rethiel the Greenwarden|r
    .accept 275 >>Accept Blisters on The Land
    .target Rethiel the Greenwarden
    .isQuestTurnedIn 277 --any of: Fire Taboo
step << Mage
    .goto 1437/0,-831.66,-3827.85
    .vendor >>Buy some level 25 drink from the Innkeeper
    >>Remember to Conjure level 15 food instead of buying it (and DONT buy level 25 food)
step
    #completewith next
    .hs >>Hearth to Innkeeper Helbrek's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1437/0,-797.34,-3732.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Stoutfist|r
    .turnin 464 >>Turn in War Banners
    .accept 98221 >>Accept From the Ashes
    .accept 465 >>Accept Nek'rosh's Gambit
    .target Captain Stoutfist
step
    .goto 1437/0,-797.34,-3732.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Stoutfist|r
    >>|cRXP_WARN_The database has no objectives for From the Ashes. Skip this step if the quest is not finished|r
    .turnin 98221 >>Turn in From the Ashes
    .target Captain Stoutfist
    .isOnQuest 98221
step
    .goto 1437/0,-717.11,-3685.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sylessa Duskwhisper|r
    .accept 98209 >>Accept Bloom of the Heavens
    .target Sylessa Duskwhisper
step
    #loop
    .goto 1437/0,-1117.83,-2950.26,0
    .goto 1437/0,-1117.83,-2950.26,40,0
    .goto 1437/0,-1149.26,-2893.21,40,0
    .goto 1437/0,-1240.65,-2814.10,40,0
    .goto 1437/0,-1184.41,-2780.48,40,0
    .goto 1437/0,-1176.55,-2831.19,40,0
    .goto 1437/0,-1112.87,-2796.74,40,0
    .goto 1437/0,-1059.11,-2870.88,40,0
    .goto 1437/0,-1091.78,-2888.25,40,0
    >>Kill |cRXP_ENEMY_Giant Wetlands Crocolisks|r. Loot them for |cRXP_LOOT_Giant Crocolisk Skin|r
    .complete 471,1 --Giant Crocolisk Skin (6)
    .mob Giant Wetlands Crocolisk
    .isOnQuest 471
step
    .goto 1437/0,-2352.25,-3443.63
    >>Click the |cRXP_PICK_Dragonmaw Catapult|r
    .turnin 465 >>Turn in Nek'rosh's Gambit
step
    #loop
    .goto 1437/0,-1512.35,-3226.99,0
    .goto 1437/0,-1512.35,-3226.99,40,0
    .goto 1437/0,-1521.86,-3171.04,40,0
    .goto 1437/0,-1364.71,-3029.92,40,0
    >>Kill |cRXP_ENEMY_Fen Creepers|r
    .complete 275,1 --Fen Creeper slain (12)
    .mob Fen Creeper
    .isOnQuest 275
step
    .goto 1437/0,-2430.82,-3309.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Howin Kindfeather|r
    .accept 98246 >>Accept Trying Times
    .target Howin Kindfeather
step
    .goto 1437/0,-2430.82,-3309.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Howin Kindfeather|r
    .turnin 98246 >>Turn in Trying Times
    .target Howin Kindfeather
    .isQuestComplete 98246
step
    .goto 1437/0,-2720.72,-3261.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rethiel the Greenwarden|r
    .turnin 275 >>Turn in Blisters on The Land
    .target Rethiel the Greenwarden
    .isOnQuest 275
step
    .goto 1437/0,-2822.45,-3389.33
    >>Click the |cRXP_PICK_Dragonmaw Armaments|r
    .accept 98293 >>Accept Forced Disarmament
step
    .goto 1437/0,-797.34,-3732.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Stoutfist|r
    .turnin 98293 >>Turn in Forced Disarmament
    .target Captain Stoutfist
    .isQuestComplete 98293
step
    .goto 1437/0,-743.16,-3684.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_James Halloran|r
    .turnin 471 >>Turn in Apprentice's Duties
    .target James Halloran
    .isOnQuest 471
step
    +|cRXP_WARN_That is all of Wetlands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Darkshore|r: Bloom of the Heavens
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Trying Times, Forced Disarmament
step
    +|cRXP_WARN_The rest of Wetlands is planned from level 27.|r Load its guide for level 27 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 20 - 34 Wetlands
#subweight -20
#name 27-28 Wetlands

step
    .goto 1437/0,-797.34,-3732.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Stoutfist|r
    .turnin 98293 >>Turn in Forced Disarmament
    .target Captain Stoutfist
    .isQuestComplete 98293
step
    .goto 1437/0,-797.34,-3732.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Stoutfist|r
    .turnin 98221 >>Turn in From the Ashes
    .target Captain Stoutfist
    .isOnQuest 98221
step
    .goto 1437/0,-717.11,-3685.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sylessa Duskwhisper|r
    .turnin 98208 >>Turn in Bloom of the Heavens
    .target Sylessa Duskwhisper
    .isQuestComplete 98208
step
    .goto 1437/0,-1968.49,-3550.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ormer Ironbraid|r
    .accept 296 >>Accept Ormer's Revenge
    .target Ormer Ironbraid
    .isQuestTurnedIn 295 --any of: Ormer's Revenge
step
    .goto 1437/0,-1765.02,-3567.66
    >>Kill |cRXP_ENEMY_Sarltooth|r and loot |cRXP_LOOT_Sarltooth's Talon|r
    .complete 296,1 --Sarltooth's Talon (1)
    .mob Sarltooth
    .isOnQuest 296
step
    .goto 1437/0,-1968.49,-3550.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ormer Ironbraid|r
    .turnin 296 >>Turn in Ormer's Revenge
    .target Ormer Ironbraid
    .isOnQuest 296
step
    .goto 1437/0,-827.11,-3817.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Glorin Steelbrow|r
    .accept 526 >>Accept Lightforge Ingots
    .target Glorin Steelbrow
step
    .goto 1437/0,-840.34,-3791.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_First Mate Fitzsimmons|r
    .accept 289 >>Accept The Cursed Crew
    .target First Mate Fitzsimmons
    .isQuestTurnedIn 288 --any of: The Third Fleet
step
    .goto 1437/0,-838.28,-3688.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Harlo Barnaby|r
    .accept 472 >>Accept Fall of Dun Modr
    .target Harlo Barnaby
step
    .goto 1437/0,-2430.82,-3309.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Howin Kindfeather|r
    .turnin 98246 >>Turn in Trying Times
    .target Howin Kindfeather
    .isQuestComplete 98246
step
    .goto 1437/0,-2430.82,-3309.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Howin Kindfeather|r
    .accept 98245 >>Accept Razormaw Needling
    .target Howin Kindfeather
step
    .goto 1437/0,-2449.02,-2651.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Longbraid the Grim|r
    .turnin 472 >>Turn in Fall of Dun Modr
    .target Longbraid the Grim
step
    #loop
    .goto 1437/0,-1983.79,-2614.83,0
    .goto 1437/0,-1983.79,-2614.83,40,0
    .goto 1437/0,-1963.52,-2580.37,40,0
    .goto 1437/0,-1793.56,-2490.79,40,0
    .goto 1437/0,-1755.51,-2506.50,40,0
    .goto 1437/0,-1719.12,-2550.88,40,0
    .goto 1437/0,-1741.04,-2569.90,40,0
    .goto 1437/0,-1782.81,-2559.70,40,0
    .goto 1437/0,-1780.32,-2617.03,40,0
    >>Kill |cRXP_ENEMY_Highland Razormaws|r and |cRXP_ENEMY_Elder Razormaws|r. Loot them for |cRXP_LOOT_Razormaw Incisor|r
    .complete 98245,1 --Razormaw Incisor (10)
    .mob Highland Razormaw
    .mob Elder Razormaw
step
    #loop
    .goto 1437/0,-1554.53,-2592.22,0
    .goto 1437/0,-1554.53,-2592.22,40,0
    .goto 1437/0,-1506.97,-2613.45,40,0
    .goto 1437/0,-1480.51,-2657.00,40,0
    .goto 1437/0,-1415.99,-2649.28,40,0
    .goto 1437/0,-1387.87,-2612.90,40,0
    .goto 1437/0,-1451.14,-2615.10,40,0
    .goto 1437/0,-1470.17,-2597.19,40,0
    >>Kill |cRXP_ENEMY_Bluegill Raiders|r. Loot them for |cRXP_LOOT_Lightforge Ingot|r
    .complete 526,1 --Lightforge Ingot (5)
    .mob Bluegill Raider
step
    .goto 1437/0,-957.79,-2967.90
    >>Kill |cRXP_ENEMY_Cursed Sailors|r
    .complete 289,1 --Cursed Sailor slain (13)
    .mob Cursed Sailor
    .isOnQuest 289
step
    #loop
    .goto 1437/0,-1002.04,-2827.06,0
    .goto 1437/0,-1002.04,-2827.06,40,0
    .goto 1437/0,-993.77,-2819.34,40,0
    .goto 1437/0,-956.14,-2812.45,40,0
    .goto 1437/0,-992.94,-2800.60,40,0
    .goto 1437/0,-1030.57,-2811.35,40,0
    >>Kill |cRXP_ENEMY_Cursed Marines|r
    .complete 289,2 --Cursed Marine slain (5)
    .mob Cursed Marine
    .isOnQuest 289
step
    .goto 1437/0,-959.86,-2979.75
    >>Kill |cRXP_ENEMY_First Mate Snellig|r and loot |cRXP_LOOT_Snellig's Snuffbox|r
    .complete 289,3 --Snellig's Snuffbox (1)
    .mob First Mate Snellig
    .isOnQuest 289
step
    .goto 1437/0,-840.34,-3791.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_First Mate Fitzsimmons|r
    .turnin 289 >>Turn in The Cursed Crew
    .target First Mate Fitzsimmons
    .isOnQuest 289
step
    .goto 1437/0,-827.11,-3817.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Glorin Steelbrow|r
    .turnin 526 >>Turn in Lightforge Ingots
    .target Glorin Steelbrow
step
    .goto 1437/0,-1994.54,-3591.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Whelgar|r
    .accept 98313 >>Accept For Further Study
    .target Prospector Whelgar
step
    .goto 1437/0,-2430.82,-3309.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Howin Kindfeather|r
    .turnin 98245 >>Turn in Razormaw Needling
    .accept 98300 >>Accept Word to Ironforge
    .target Howin Kindfeather
step
    .xp 27 >>Grind to level 27 (Spark of Freedom needs it)
step
    .goto 1437/0,-2279.47,-2608.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captive Fire Elemental|r
    .accept 87491 >>Accept Spark of Freedom
    .target Captive Fire Elemental
step
    .goto 1437/0,-2451.09,-2646.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Roggo Harlbarrow|r
    .turnin 87491 >>Turn in Spark of Freedom
    .target Roggo Harlbarrow
step
    .goto 1437/0,-2459.36,-2648.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ashlan Stonesmirk|r
    .accept 88756 >>Accept Bring Back a Bang
    .target Ashlan Stonesmirk
step
    .goto 1437/0,-2459.36,-2648.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ashlan Stonesmirk|r
    .turnin 88756 >>Turn in Bring Back a Bang
    .target Ashlan Stonesmirk
    .isQuestComplete 88756
step
    .goto 1437/0,-890.38,-3917.15
    >>Click the |cRXP_PICK_Waterlogged Chest|r
    .accept 324 >>Accept The Lost Ingots
    .isQuestTurnedIn 321 --any of: Lightforge Iron
    .xp <20,1
step
    #loop
    .goto 1437/0,-885.01,-3899.51,0
    .goto 1437/0,-885.01,-3899.51,40,0
    .goto 1437/0,-954.48,-3912.19,40,0
    .goto 1437/0,-901.55,-3982.20,40,0
    .goto 1437/0,-846.13,-4120.84,40,0
    .goto 1437/0,-784.52,-4146.75,40,0
    .goto 1437/0,-748.54,-4114.50,40,0
    .goto 1437/0,-746.88,-4049.73,40,0
    .goto 1437/0,-812.22,-3975.59,40,0
    .goto 1437/0,-857.30,-3954.64,40,0
    >>Kill |cRXP_ENEMY_Bluegill Raiders|r. Loot them for |cRXP_LOOT_Lightforge Ingot|r
    .complete 324,1 --Lightforge Ingot (5)
    .mob Bluegill Raider
    .isOnQuest 324
step
    .goto 1437/0,-827.11,-3817.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Glorin Steelbrow|r
    .turnin 324 >>Turn in The Lost Ingots
    .target Glorin Steelbrow
    .isOnQuest 324
step
    .goto 1437/0,-827.11,-3817.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Glorin Steelbrow|r
    .accept 322 >>Accept Blessed Arm
    .target Glorin Steelbrow
    .isQuestTurnedIn 324 --any of: The Lost Ingots
    .xp <20,1
step
    +|cRXP_WARN_That is all of Wetlands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Ironforge|r: For Further Study, Word to Ironforge
    >>|cRXP_FRIENDLY_Stormwind City|r: Blessed Arm
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Bring Back a Bang
step
    +|cRXP_WARN_The rest of Wetlands is planned from level 30.|r Load its guide for level 30 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 20 - 34 Wetlands
#subweight -20
#name 30-31 Wetlands

step
    .goto 1437/0,-832.07,-3827.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Helbrek|r
    .target Innkeeper Helbrek
    .home >>Set your Hearthstone to Innkeeper Helbrek's inn
step
    .goto 1437/0,-840.34,-3791.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_First Mate Fitzsimmons|r
    .accept 290 >>Accept Lifting the Curse
    .target First Mate Fitzsimmons
    .isQuestTurnedIn 289 --any of: The Cursed Crew
step
    .goto 1437/0,-797.34,-3732.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Stoutfist|r
    .turnin 98293 >>Turn in Forced Disarmament
    .target Captain Stoutfist
    .isQuestComplete 98293
step
    .goto 1437/0,-797.34,-3732.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Stoutfist|r
    .turnin 98221 >>Turn in From the Ashes
    .target Captain Stoutfist
    .isOnQuest 98221
step
    .goto 1437/0,-801.47,-3745.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Red Jack Flint|r
    .accept 1132 >>Accept Fiora Longears
    .target Red Jack Flint
    .xp <30,1
step
    .goto 1437/0,-717.11,-3685.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sylessa Duskwhisper|r
    .turnin 98208 >>Turn in Bloom of the Heavens
    .target Sylessa Duskwhisper
    .isQuestComplete 98208
step
    .goto 1437/0,-1028.51,-2798.67
    >>Kill |cRXP_ENEMY_Captain Halyndor|r and loot |cRXP_LOOT_Intrepid Strongbox Key|r
    .complete 290,1 --Intrepid Strongbox Key (1)
    .mob Captain Halyndor
    .isOnQuest 290
step
    .goto 1437/0,-984.26,-2810.52
    >>Click the |cRXP_PICK_Intrepid's Locked Strongbox|r
    .turnin 290 >>Turn in Lifting the Curse
    .isOnQuest 290
step
    .goto 1437/0,-984.26,-2810.52
    >>Click the |cRXP_PICK_Intrepid's Locked Strongbox|r
    .accept 292 >>Accept The Eye of Paleth
    .isQuestTurnedIn 290 --any of: Lifting the Curse
step
    .goto 1437/0,-2430.82,-3309.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Howin Kindfeather|r
    .turnin 98246 >>Turn in Trying Times
    .target Howin Kindfeather
    .isQuestComplete 98246
step
    .goto 1437/0,-2430.82,-3309.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Howin Kindfeather|r
    .accept 98291 >>Accept Death to the Dragonmaw
    .target Howin Kindfeather
step
    .goto 1437/0,-2352.25,-3443.63
    >>Click the |cRXP_PICK_Dragonmaw Catapult|r
    .accept 474 >>Accept Defeat Nek'rosh
    .isQuestTurnedIn 465 --any of: Nek'rosh's Gambit
step
    .goto 1437/0,-2602.44,-3654.76
    >>Kill |cRXP_ENEMY_Chieftain Nek'rosh|r and loot |cRXP_LOOT_Nek'rosh's Head|r
    .complete 474,1 --Nek'rosh's Head (1)
    .mob Chieftain Nek'rosh
    .isOnQuest 474
step
    #loop
    .goto 1437/0,-2775.31,-3513.36,0
    .goto 1437/0,-2775.31,-3513.36,40,0
    .goto 1437/0,-2887.79,-3480.29,40,0
    .goto 1437/0,-2901.85,-3390.43,40,0
    .goto 1437/0,-2994.07,-3393.47,40,0
    .goto 1437/0,-2983.32,-3486.63,40,0
    .goto 1437/0,-3068.51,-3460.99,40,0
    .goto 1437/0,-3004.82,-3284.04,40,0
    .goto 1437/0,-2817.49,-3301.13,40,0
    .goto 1437/0,-2777.37,-3378.58,40,0
    >>Kill |cRXP_ENEMY_Dragonmaw Infiltrators|r
    >>Kill |cRXP_ENEMY_Dragonmaw Reclaimers|r
    >>Kill |cRXP_ENEMY_Dragonmaw Soulbinders|r
    .complete 98291,3 --Dragonmaw Infiltrator slain (3)
    .complete 98291,1 --Dragonmaw Reclaimer slain (8)
    .complete 98291,2 --Dragonmaw Soulbinder slain (5)
    .mob Dragonmaw Infiltrator
    .mob Dragonmaw Reclaimer
    .mob Dragonmaw Soulbinder
step
    .goto 1437/0,-2720.72,-3261.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rethiel the Greenwarden|r
    .accept 98283 >>Accept Carnage
    .target Rethiel the Greenwarden
step
    #loop
    .goto 1437/0,-2764.97,-3098.27,0
    .goto 1437/0,-2764.97,-3098.27,40,0
    .goto 1437/0,-2807.56,-2987.47,40,0
    .goto 1437/0,-2870.83,-2885.76,40,0
    .goto 1437/0,-2915.08,-2953.84,40,0
    .goto 1437/0,-2895.65,-3062.72,40,0
    .goto 1437/0,-2958.50,-3098.82,40,0
    .goto 1437/0,-3020.54,-3136.58,40,0
    .goto 1437/0,-2949.41,-3188.13,40,0
    .goto 1437/0,-2878.69,-3139.06,40,0
    >>Kill |cRXP_ENEMY_Maddened Rotclaw|r and loot |cRXP_LOOT_Malignant Rotclaw Flesh|r
    .complete 98283,1 --Malignant Rotclaw Flesh (1)
    .mob Maddened Rotclaw
step
    #loop
    .goto 1437/0,-3235.99,-2941.44,0
    .goto 1437/0,-3235.99,-2941.44,40,0
    .goto 1437/0,-3271.56,-2948.06,40,0
    .goto 1437/0,-3275.69,-2946.95,40,0
    .goto 1437/0,-3307.95,-2930.97,40,0
    .goto 1437/0,-3267.01,-2986.92,40,0
    >>Kill |cRXP_ENEMY_Carnage|r and loot |cRXP_LOOT_Carnage's Head|r
    .complete 98283,2 --Carnage's Head (1)
    .mob Carnage
step
    .goto 1437/0,-2459.36,-2648.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ashlan Stonesmirk|r
    .turnin 88756 >>Turn in Bring Back a Bang
    .target Ashlan Stonesmirk
    .isQuestComplete 88756
step
    .goto 1437/0,-2453.16,-2650.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rhag Garmason|r
    .accept 631 >>Accept The Thandol Span
    .target Rhag Garmason
step
    .goto 1437/0,-2443.64,-2650.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Motley Garmason|r
    .accept 303 >>Accept The Dark Iron War
    .target Motley Garmason
step
    #loop
    .goto 1437/0,-2867.94,-2782.41,0
    .goto 1437/0,-2867.94,-2782.41,40,0
    .goto 1437/0,-2862.98,-2845.80,40,0
    .goto 1437/0,-2935.35,-2898.99,40,0
    .goto 1437/0,-2974.63,-2946.95,40,0
    .goto 1437/0,-3006.06,-2941.17,40,0
    .goto 1437/0,-2992.00,-2903.96,40,0
    .goto 1437/0,-2973.39,-2859.86,40,0
    .goto 1437/0,-2934.11,-2869.23,40,0
    .goto 1437/0,-2889.44,-2833.12,40,0
    >>Kill |cRXP_ENEMY_Dark Iron Dwarfs|r
    >>Kill |cRXP_ENEMY_Dark Iron Tunnelers|r
    >>Kill |cRXP_ENEMY_Dark Iron Saboteurs|r
    >>Kill |cRXP_ENEMY_Dark Iron Demolitionists|r
    .complete 303,1 --Dark Iron Dwarf slain (8)
    .complete 303,2 --Dark Iron Tunneler slain (5)
    .complete 303,3 --Dark Iron Saboteur slain (5)
    .complete 303,4 --Dark Iron Demolitionist slain (5)
    .mob Dark Iron Dwarf
    .mob Dark Iron Tunneler
    .mob Dark Iron Saboteur
    .mob Dark Iron Demolitionist
step
    .goto 1437/0,-2443.64,-2650.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Motley Garmason|r
    .turnin 303 >>Turn in The Dark Iron War
    .target Motley Garmason
step
    .goto 1437/0,-2454.40,-2493.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Comar Villard|r
    .accept 87318 >>Accept Hearts of the Lost
    .target Comar Villard
step
    .goto 1437/0,-2520.98,-2395.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Essene Villard|r
    .turnin 87318 >>Turn in Hearts of the Lost
    .accept 88757 >>Accept Accessories of the Lost
    .accept 88758 >>Accept Sentiments of the Lost
    .target Essene Villard
step
    .goto 1437/0,-2510.22,-2367.04
    >>Click the |cRXP_PICK_Ebenezer Rustlocke's Corpse|r
    .turnin 631 >>Turn in The Thandol Span
    .accept 632 >>Accept The Thandol Span
step
    .goto 1437/0,-2520.98,-2395.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Essene Villard|r
    .turnin 88757 >>Turn in Accessories of the Lost
    .target Essene Villard
    .isQuestComplete 88757
step
    .goto 1437/0,-2454.40,-2493.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Comar Villard|r
    .turnin 88758 >>Turn in Sentiments of the Lost
    .target Comar Villard
step
    .goto 1437/0,-2453.16,-2650.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rhag Garmason|r
    .turnin 632 >>Turn in The Thandol Span
    .accept 633 >>Accept The Thandol Span
    .target Rhag Garmason
step
    #completewith next
    .hs >>Hearth to Innkeeper Helbrek's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1437/0,-827.11,-3817.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Glorin Steelbrow|r
    .turnin 292 >>Turn in The Eye of Paleth
    .target Glorin Steelbrow
    .isOnQuest 292
step
    .goto 1437/0,-827.11,-3817.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Glorin Steelbrow|r
    .accept 293 >>Accept Cleansing the Eye
    .target Glorin Steelbrow
    .isQuestTurnedIn 292 --any of: The Eye of Paleth
step
    .xp 30 >>Grind to level 30 (Fiora Longears needs it)
step
    .goto 1437/0,-801.47,-3745.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Red Jack Flint|r
    .accept 1132 >>Accept Fiora Longears
    .target Red Jack Flint
step
    .goto 1437/0,-797.34,-3732.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Stoutfist|r
    .turnin 474 >>Turn in Defeat Nek'rosh
    .target Captain Stoutfist
    .isOnQuest 474
step
    .goto 1437/0,-1994.54,-3591.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Whelgar|r
    .accept 98216 >>Accept Understanding Our Present
    .accept 98310 >>Accept Gleaning Our Future
    .target Prospector Whelgar
step
    #loop
    .goto 1437/0,-1904.39,-3589.99,0
    .goto 1437/0,-1904.39,-3589.99,40,0
    .goto 1437/0,-1833.67,-3600.18,40,0
    .goto 1437/0,-1765.44,-3563.53,40,0
    .goto 1437/0,-1742.69,-3475.33,40,0
    .goto 1437/0,-1793.97,-3445.01,40,0
    .goto 1437/0,-1849.80,-3436.19,40,0
    .goto 1437/0,-1797.69,-3497.38,40,0
    .goto 1437/0,-1836.15,-3527.97,40,0
    .goto 1437/0,-1859.31,-3565.73,40,0
    >>Kill |cRXP_ENEMY_Goaz Warder|r and loot |cRXP_LOOT_Titanic Keystone|r
    .complete 98216,1 --Titanic Keystone (1)
    .mob Goaz Warder
step
    .goto 1437/0,-1994.54,-3591.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Whelgar|r
    .turnin 98216 >>Turn in Understanding Our Present
    .target Prospector Whelgar
step
    .goto 1437/0,-2430.82,-3309.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Howin Kindfeather|r
    .turnin 98291 >>Turn in Death to the Dragonmaw
    .target Howin Kindfeather
step
    .goto 1437/0,-2720.72,-3261.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rethiel the Greenwarden|r
    .turnin 98283 >>Turn in Carnage
    .target Rethiel the Greenwarden
step
    #loop
    .goto 1437/0,-2478.38,-2724.25,0
    .goto 1437/0,-2478.38,-2724.25,40,0
    .goto 1437/0,-2494.92,-2685.66,40,0
    .goto 1437/0,-2508.98,-2650.11,40,0
    .goto 1437/0,-2526.35,-2618.41,40,0
    .goto 1437/0,-2492.44,-2582.58,40,0
    .goto 1437/0,-2498.65,-2551.71,40,0
    .goto 1437/0,-2461.01,-2518.36,40,0
    .goto 1437/0,-2466.80,-2627.23,40,0
    .goto 1437/0,-2396.09,-2652.03,40,0
    >>Kill |cRXP_ENEMY_Modr|r and loot |cRXP_LOOT_Heart of Modr|r
    .complete 98310,2 --Heart of Modr (1)
    .mob Modr
step
    .goto 1437/0,-2453.16,-2650.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rhag Garmason|r
    .turnin 633 >>Turn in The Thandol Span
    .target Rhag Garmason
    .isQuestComplete 633
step
    .goto 1437/0,-2453.16,-2650.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rhag Garmason|r
    .accept 634 >>Accept Plea To The Alliance
    .target Rhag Garmason
    .isQuestTurnedIn 633 --any of: The Thandol Span
    .xp <28,1
step
    #loop
    .goto 1437/0,-2824.52,-2792.05,0
    .goto 1437/0,-2824.52,-2792.05,40,0
    .goto 1437/0,-2850.98,-2772.76,40,0
    .goto 1437/0,-2874.56,-2754.29,40,0
    .goto 1437/0,-2907.22,-2747.95,40,0
    .goto 1437/0,-2911.36,-2744.92,40,0
    .goto 1437/0,-2912.19,-2795.08,40,0
    .goto 1437/0,-2893.16,-2862.61,40,0
    .goto 1437/0,-2827.41,-2846.63,40,0
    >>Kill |cRXP_ENEMY_Neru|r and loot |cRXP_LOOT_Heart of Neru|r
    .complete 98310,4 --Heart of Neru (1)
    .mob Neru
step
    #loop
    .goto 1437/0,-3575.92,-3413.31,0
    .goto 1437/0,-3575.92,-3413.31,40,0
    .goto 1437/0,-3611.07,-3425.71,40,0
    .goto 1437/0,-3599.49,-3449.97,40,0
    .goto 1437/0,-3583.78,-3458.24,40,0
    >>Kill |cRXP_ENEMY_Ados|r and loot |cRXP_LOOT_Heart of Ados|r
    .complete 98310,1 --Heart of Ados (1)
    .mob Ados
step
    #loop
    .goto 1437/0,-3158.66,-4042.29,0
    .goto 1437/0,-3158.66,-4042.29,40,0
    .goto 1437/0,-3174.79,-4065.72,40,0
    .goto 1437/0,-3188.43,-4107.89,40,0
    .goto 1437/0,-3189.67,-4122.22,40,0
    .goto 1437/0,-3224.82,-4172.38,40,0
    .goto 1437/0,-3155.35,-4169.35,40,0
    .goto 1437/0,-3165.69,-4069.85,40,0
    >>Kill |cRXP_ENEMY_Golm|r and loot |cRXP_LOOT_Heart of Golm|r
    .complete 98310,3 --Heart of Golm (1)
    .mob Golm
step
    .goto 1437/0,-1994.54,-3591.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Whelgar|r
    .turnin 98310 >>Turn in Gleaning Our Future
    .target Prospector Whelgar
step
    +|cRXP_WARN_That is all of Wetlands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Arathi Highlands|r: Plea To The Alliance
    >>|cRXP_FRIENDLY_Dustwallow Marsh|r: Fiora Longears
    >>|cRXP_FRIENDLY_Stormwind City|r: Cleansing the Eye
    >>|cRXP_FRIENDLY_Arathi Highlands and back here|r: The Thandol Span
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Accessories of the Lost
step
    +|cRXP_WARN_The rest of Wetlands is planned from level 33.|r Load its guide for level 33 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 20 - 34 Wetlands
#subweight -20
#name 33-34 Wetlands

step
    .goto 1437/0,-2430.82,-3309.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Howin Kindfeather|r
    .turnin 98246 >>Turn in Trying Times
    .target Howin Kindfeather
    .isQuestComplete 98246
step
    .goto 1437/0,-2430.82,-3309.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Howin Kindfeather|r
    .accept 98297 >>Accept Stopping the Cycle
    .target Howin Kindfeather
step
    .goto 1437/0,-2449.02,-2651.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Longbraid the Grim|r
    .accept 304 >>Accept A Grim Task
    .target Longbraid the Grim
step
    .goto 1437/0,-2459.36,-2648.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ashlan Stonesmirk|r
    .turnin 88756 >>Turn in Bring Back a Bang
    .target Ashlan Stonesmirk
    .isQuestComplete 88756
step
    .goto 1437/0,-2520.98,-2395.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Essene Villard|r
    .turnin 88757 >>Turn in Accessories of the Lost
    .target Essene Villard
    .isQuestComplete 88757
step
    #loop
    .goto 1437/0,-2973.81,-2931.24,0
    .goto 1437/0,-2973.81,-2931.24,40,0
    .goto 1437/0,-2937.00,-2969.28,40,0
    .goto 1437/0,-2937.00,-3018.89,40,0
    >>Kill |cRXP_ENEMY_Balgaras the Foul|r and loot |cRXP_LOOT_Ear of Balgaras|r
    .complete 304,1 --Ear of Balgaras (1)
    .mob Balgaras the Foul
step
    #loop
    .goto 1437/0,-3529.19,-3334.48,0
    .goto 1437/0,-3529.19,-3334.48,40,0
    .goto 1437/0,-3542.01,-3405.04,40,0
    .goto 1437/0,-3493.63,-3425.16,40,0
    .goto 1437/0,-3548.63,-3466.23,40,0
    .goto 1437/0,-3573.85,-3463.47,40,0
    .goto 1437/0,-3575.51,-3413.86,40,0
    .goto 1437/0,-3583.37,-3400.91,40,0
    .goto 1437/0,-3593.29,-3398.98,40,0
    >>Kill |cRXP_ENEMY_Subdued Dragonspawns|r
    .complete 98297,1 --Subdued Dragonspawn slain (8)
    .mob Subdued Dragonspawn
step
    .goto 1437/0,-2430.82,-3309.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Howin Kindfeather|r
    .turnin 98297 >>Turn in Stopping the Cycle
    .target Howin Kindfeather
step
    .goto 1437/0,-2449.02,-2651.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Longbraid the Grim|r
    .turnin 304 >>Turn in A Grim Task
    .target Longbraid the Grim
step
    .goto 1437/0,-2453.16,-2650.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rhag Garmason|r
    .turnin 633 >>Turn in The Thandol Span
    .target Rhag Garmason
    .isQuestComplete 633
step
    .goto 1437/0,-827.94,-3822.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mikhail|r
    .accept 1249 >>Accept The Missing Diplomat
    .target Mikhail
    .isQuestTurnedIn 1248 --any of: The Missing Diplomat
    .xp <28,1
step
    .goto 1437/0,-825.46,-3808.83
    >>Kill |cRXP_ENEMY_Tapoke "Slim" Jahn|r
    .complete 1249,1 --Tapoke "Slim" Jahn slain (1)
    .mob Tapoke "Slim" Jahn
    .isOnQuest 1249
step
    .goto 1437/0,-827.94,-3822.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mikhail|r
    .turnin 1249 >>Turn in The Missing Diplomat
    .target Mikhail
    .isOnQuest 1249
step
    .goto 1437/0,-825.46,-3808.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tapoke "Slim" Jahn|r
    .accept 1250 >>Accept The Missing Diplomat
    .target Tapoke "Slim" Jahn
    .isQuestTurnedIn 1249 --any of: The Missing Diplomat
    .xp <28,1
step
    .goto 1437/0,-827.94,-3822.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mikhail|r
    .turnin 1250 >>Turn in The Missing Diplomat
    .target Mikhail
    .isOnQuest 1250
step
    .goto 1437/0,-827.94,-3822.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mikhail|r
    .accept 1264 >>Accept The Missing Diplomat
    .target Mikhail
    .isQuestTurnedIn 1250 --any of: The Missing Diplomat
    .xp <28,1
step
    .goto 1437/0,-797.34,-3732.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Stoutfist|r
    .turnin 98221 >>Turn in From the Ashes
    .target Captain Stoutfist
    .isOnQuest 98221
step
    .goto 1437/0,-797.34,-3732.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Stoutfist|r
    .turnin 98293 >>Turn in Forced Disarmament
    .target Captain Stoutfist
    .isQuestComplete 98293
step
    .goto 1437/0,-717.11,-3685.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sylessa Duskwhisper|r
    .turnin 98208 >>Turn in Bloom of the Heavens
    .target Sylessa Duskwhisper
    .isQuestComplete 98208
step
    +|cRXP_WARN_End of the Wetlands route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Dustwallow Marsh|r: The Missing Diplomat
]])
