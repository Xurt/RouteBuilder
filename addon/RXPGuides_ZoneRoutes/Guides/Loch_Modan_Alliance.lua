-- 10-32 Loch Modan: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 4 parts with a level check between them (from level 10, 14, 18, 21).
-- Edit zones/Loch Modan.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#name 10-32 Loch Modan

step
    #loop
    .goto 1432/0,-2893.79,-5402.51,0
    .goto 1432/0,-2893.79,-5402.51,40,0
    .goto 1432/0,-2922.76,-5381.54,40,0
    .goto 1432/0,-2937.65,-5366.08,40,0
    .goto 1432/0,-2977.92,-5346.03,40,0
    .goto 1432/0,-3024.26,-5305.93,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Kadrell|r. |cRXP_WARN_This NPC walks a patrol route|r
    .turnin 414 >>Turn in Stout to Kadrell
    .unitscan Mountaineer Kadrell
    .isOnQuest 414
step
    .goto 1432/0,-2973.79,-5377.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Hearthstove|r
    .target Innkeeper Hearthstove
    .home >>Set your Hearthstone to Innkeeper Hearthstove's inn
step << Dwarf/Gnome
    .goto 1432/0,-3014.88,-5367.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brock Stoneseeker|r
    .accept 6387 >>Accept Honor Students
    .target Brock Stoneseeker
step << Dwarf/Gnome
    .goto 1432/0,-2929.93,-5424.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thorgrum Borrelson|r
    .turnin 6387 >>Turn in Honor Students
    .accept 6391 >>Accept Ride to Ironforge
    .target Thorgrum Borrelson
step << Human
    .goto 1432/0,-2658.51,-4822.30
    .vendor >>Vendor and repair
step
    .goto 1432/0,-2953.65,-5381.54
    .vendor >>Buy 1-2 6 slot bags to fill your bag slots
step
    .goto 1432/0,-2972.96,-5377.86
    .vendor >> Buy food/water (try to have 40 level 5 drink, 20 level 5 food)
step << Gnome
    .goto 1432/0,-2658.51,-4822.30
    .vendor >>Vendor and repair
step
    .goto 1432/0,-2658.51,-4822.30
    .vendor >>vendor and repair
step
    .goto 1432/0,-2952.55,-5381.91
    .vendor >> Buy 6 slots until your bag containers are full. Also buy 1 Flint and Tinder, and 2 Simple Wood
    .collect 4470,2
    .collect 4471,1
step
    .xp 12 >> Grind to 12
step
    .goto 1432/0,-2929.93,-5424.95
    .fp Thelsamar >> Get the Thelsamar flight path
    >>Talk to |cRXP_FRIENDLY_Thorgrum Borrelson|r
    .target Thorgrum Borrelson
    .fly Ironforge >> Fly to Ironforge
step
    .goto 1432/0,-3020.95,-5359.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jern Hornhelm|r
    .turnin 302 >>Turn in Powder to Ironband
    .target Jern Hornhelm
    .isOnQuest 302
step << Gnome
    .hs >> Hearth to Kharanos
step
    .goto 1432/0,-3000.54,-5375.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grenhild Darktalon|r
    .accept 86667 >>Accept Snowbound
    .target Grenhild Darktalon
    .xp <10,1
step
    .goto 1432/0,-2676.71,-4825.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Stormpike|r
    .turnin 353 >>Turn in Stormpike's Delivery
    .target Mountaineer Stormpike
    .isOnQuest 353
step
    #loop
    .goto 1432/0,-3024.26,-5305.93,0
    .goto 1432/0,-3024.26,-5305.93,40,0
    .goto 1432/0,-2977.92,-5346.03,40,0
    .goto 1432/0,-2937.65,-5366.08,40,0
    .goto 1432/0,-2922.76,-5381.54,40,0
    .goto 1432/0,-2893.79,-5402.51,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Kadrell|r. |cRXP_WARN_This NPC walks a patrol route|r
    .accept 416 >>Accept Rat Catching
    .accept 1339 >>Accept Mountaineer Stormpike's Task
    .unitscan Mountaineer Kadrell
step
    .goto 1432/0,-3000.54,-5375.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grenhild Darktalon|r
    .accept 86667 >>Accept Snowbound
    .target Grenhild Darktalon
step
    .goto 1432/0,-2954.48,-5394.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vidra Hearthstove|r
    .accept 418 >>Accept Thelsamar Blood Sausages
    .target Vidra Hearthstove
step
    #completewith Along9
    >>As you go: Kill |cRXP_ENEMY_Cliff Lurkers|r, |cRXP_ENEMY_Wood Lurkers|r, |cRXP_ENEMY_Forest Lurkers|r and |cRXP_ENEMY_Shanda the Spinners|r. Loot them for |cRXP_LOOT_Spider Ichor|r. |cRXP_WARN_Anything left is finished later|r
    .complete 418,3 --Spider Ichor (3)
    .mob Cliff Lurker
    .mob Wood Lurker
    .mob Forest Lurker
    .mob Shanda the Spinner
step
    #label Along9
    #loop
    .goto 1432/0,-3019.57,-5221.49,0
    .goto 1432/0,-3019.57,-5221.49,40,0
    .goto 1432/0,-3046.33,-5185.44,40,0
    .goto 1432/0,-3089.36,-5099.16,40,0
    .goto 1432/0,-3019.85,-5091.44,40,0
    .goto 1432/0,-2916.14,-5040.48,40,0
    .goto 1432/0,-2901.79,-5133.19,40,0
    .goto 1432/0,-2953.93,-5157.66,40,0
    .goto 1432/0,-2972.68,-5112.22,40,0
    .goto 1432/0,-3020.68,-5153.06,40,0
    >>Kill |cRXP_ENEMY_Mountain Boars|r, |cRXP_ENEMY_Mangy Mountain Boars|r and |cRXP_ENEMY_Elder Mountain Boars|r. Loot them for |cRXP_LOOT_Boar Intestines|r
    >>Kill |cRXP_ENEMY_Grizzled Black Bears|r, |cRXP_ENEMY_Black Bear Patriarches|r and |cRXP_ENEMY_Elder Black Bears|r. Loot them for |cRXP_LOOT_Bear Meat|r
    .complete 418,1 --Boar Intestines (3)
    .complete 418,2 --Bear Meat (1)
    .mob Mountain Boar
    .mob Mangy Mountain Boar
    .mob Elder Mountain Boar
    .mob Grizzled Black Bear
    .mob Black Bear Patriarch
    .mob Elder Black Bear
step
    #loop
    .goto 1432/0,-2851.59,-5050.60,0
    .goto 1432/0,-2851.59,-5050.60,40,0
    .goto 1432/0,-2785.67,-5053.54,40,0
    .goto 1432/0,-2758.64,-4878.41,40,0
    .goto 1432/0,-2748.71,-4824.88,40,0
    .goto 1432/0,-2785.67,-4797.10,40,0
    .goto 1432/0,-2813.80,-4827.27,40,0
    .goto 1432/0,-2880.00,-4801.70,40,0
    .goto 1432/0,-2821.53,-4852.11,40,0
    .goto 1432/0,-2818.49,-4903.80,40,0
    >>Kill |cRXP_ENEMY_Cliff Lurkers|r, |cRXP_ENEMY_Wood Lurkers|r, |cRXP_ENEMY_Forest Lurkers|r and |cRXP_ENEMY_Shanda the Spinners|r. Loot them for |cRXP_LOOT_Spider Ichor|r
    .complete 418,3 --Spider Ichor (3)
    .mob Cliff Lurker
    .mob Wood Lurker
    .mob Forest Lurker
    .mob Shanda the Spinner
step
    #completewith next
    .hs >>Hearth to Innkeeper Hearthstove's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1432/0,-2954.48,-5394.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vidra Hearthstove|r
    .turnin 418 >>Turn in Thelsamar Blood Sausages
    .target Vidra Hearthstove
step << !Warrior !Rogue !Hunter
    .goto 1432/0,-2973.90,-5377.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Hearthstove|r
    .vendor 6734 >> |cRXP_BUY_Buy|r |T132815:0|t[Ice Cold Milk]|cRXP_BUY_. Aim to have about 20|r
    .target Innkeeper Hearthstove
    .xp >15,1
step
    .goto 1432/0,-2929.87,-5424.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thorgrum Borrelson|r
    .fp Thelsamar >> Get the Thelsamar flight path
    .target Thorgrum Borrelson
step
    .goto 1432/0,-2634.51,-5842.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Rugelfuss|r
    .accept 267 >>Accept The Trogg Threat
    .target Captain Rugelfuss
step
    .goto 1432/0,-2602.51,-5832.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Cobbleflint|r
    .accept 224 >>Accept In Defense of the King's Lands
    .target Mountaineer Cobbleflint
step
    #completewith Along17
    >>As you go: Kill |cRXP_ENEMY_Tunnel Rat Vermins|r, |cRXP_ENEMY_Tunnel Rat Scouts|r, |cRXP_ENEMY_Tunnel Rat Geomancers|r and |cRXP_ENEMY_Tunnel Rat Diggers|r. Loot them for |cRXP_LOOT_Tunnel Rat Ear|r. |cRXP_WARN_Anything left is finished later|r
    .complete 416,1 --Tunnel Rat Ear (12)
    .mob Tunnel Rat Vermin
    .mob Tunnel Rat Scout
    .mob Tunnel Rat Geomancer
    .mob Tunnel Rat Digger
step << Shaman
    .goto 1432/0,-3148.39,-4837.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Norric Lochthane|r
    .turnin 94505 >>Turn in Call of Water
    .target Norric Lochthane
    .isOnQuest 94505
step << Shaman
    .goto 1432/0,-3148.39,-4837.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Norric Lochthane|r
    .turnin 94501 >>Turn in Call of Water
    .target Norric Lochthane
    .isOnQuest 94501
step << Shaman
    .goto 1432/0,-3148.39,-4837.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Norric Lochthane|r
    .turnin 94494 >>Turn in Call of Water
    .target Norric Lochthane
    .isOnQuest 94494
step
    #label Along17
    .goto 1432/0,-3148.39,-4837.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Norric Lochthane|r
    .turnin 86667 >>Turn in Snowbound
    .target Norric Lochthane
step
    .goto 1432/0,-3358.85,-4723.52
    >>Click the |cRXP_PICK_Carved Figurine|r
    .turnin 79974 >>Turn in Wet Job
    .isOnQuest 79974
step
    .goto 1432/0,-3263.96,-4737.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Hinderweir VII|r
    .turnin 274 >>Turn in A Dark Threat Looms
    .target Chief Engineer Hinderweir VII
    .isOnQuest 274
step
    #loop
    .goto 1432/0,-3110.05,-4671.46,0
    .goto 1432/0,-3110.05,-4671.46,40,0
    .goto 1432/0,-3023.44,-4689.30,40,0
    .goto 1432/0,-2947.58,-4679.74,40,0
    .goto 1432/0,-2916.96,-4720.58,40,0
    .goto 1432/0,-2946.75,-4808.32,40,0
    .goto 1432/0,-3051.02,-4849.53,40,0
    .goto 1432/0,-3115.84,-4845.30,40,0
    .goto 1432/0,-3023.99,-4789.56,40,0
    .goto 1432/0,-3054.05,-4750.56,40,0
    >>Kill |cRXP_ENEMY_Tunnel Rat Vermins|r, |cRXP_ENEMY_Tunnel Rat Scouts|r, |cRXP_ENEMY_Tunnel Rat Geomancers|r and |cRXP_ENEMY_Tunnel Rat Diggers|r. Loot them for |cRXP_LOOT_Tunnel Rat Ear|r
    .complete 416,1 --Tunnel Rat Ear (12)
    .mob Tunnel Rat Vermin
    .mob Tunnel Rat Scout
    .mob Tunnel Rat Geomancer
    .mob Tunnel Rat Digger
step
    .goto 1432/0,-2676.71,-4825.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Stormpike|r
    .turnin 1339 >>Turn in Mountaineer Stormpike's Task
    .accept 1338 >>Accept Stormpike's Order
    .target Mountaineer Stormpike
step
    #loop
    .goto 1432/0,-3024.26,-5305.93,0
    .goto 1432/0,-3024.26,-5305.93,40,0
    .goto 1432/0,-2977.92,-5346.03,40,0
    .goto 1432/0,-2937.65,-5366.08,40,0
    .goto 1432/0,-2922.76,-5381.54,40,0
    .goto 1432/0,-2893.79,-5402.51,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Kadrell|r. |cRXP_WARN_This NPC walks a patrol route|r
    .turnin 416 >>Turn in Rat Catching
    .unitscan Mountaineer Kadrell
step
    #loop
    .goto 1432/0,-2775.19,-5386.87,0
    .goto 1432/0,-2775.19,-5386.87,40,0
    .goto 1432/0,-2742.64,-5346.40,40,0
    .goto 1432/0,-2708.71,-5389.63,40,0
    .goto 1432/0,-2726.91,-5389.26,40,0
    .goto 1432/0,-2747.33,-5410.79,40,0
    .goto 1432/0,-2742.09,-5484.55,40,0
    .goto 1432/0,-2749.26,-5516.56,40,0
    .goto 1432/0,-2743.74,-5537.53,40,0
    .goto 1432/0,-2777.94,-5579.48,40,0
    >>Kill |cRXP_ENEMY_Stonesplinter Troggs|r
    >>Kill |cRXP_ENEMY_Stonesplinter Scouts|r
    >>Kill |cRXP_ENEMY_Stonesplinter Troggs|r, |cRXP_ENEMY_Stonesplinter Scouts|r, |cRXP_ENEMY_Stonesplinter Skullthumpers|r and |cRXP_ENEMY_Stonesplinter Bonesnappers|r. Loot them for |cRXP_LOOT_Trogg Stone Tooth|r
    .complete 224,1 --Stonesplinter Trogg slain (10)
    .complete 224,2 --Stonesplinter Scout slain (10)
    .complete 267,1 --Trogg Stone Tooth (8)
    .mob Stonesplinter Trogg
    .mob Stonesplinter Scout
    .mob Stonesplinter Skullthumper
    .mob Stonesplinter Bonesnapper
step
    .goto 1432/0,-2634.51,-5842.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Rugelfuss|r
    .turnin 267 >>Turn in The Trogg Threat
    .target Captain Rugelfuss
step
    .goto 1432/0,-2602.51,-5832.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Cobbleflint|r
    .turnin 224 >>Turn in In Defense of the King's Lands
    .target Mountaineer Cobbleflint
step << Warlock
    .goto 1432/0,-2747.60,-5530.540
    .xp 14 >>Grind to 14
    >>|cRXP_WARN_Fly to Ironforge and skip this step if you're planning on running the Hall of Thanes dungeon in Ironforge|r
step
    .goto 1432/0,-2643.06,-5892.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Gravelgaw|r
    .accept 237 >>Accept In Defense of the King's Lands
    .target Mountaineer Gravelgaw
step
    #loop
    .goto 1432/0,-2765.53,-5980.87,0
    .goto 1432/0,-2765.53,-5980.87,40,0
    .goto 1432/0,-2794.22,-5981.61,40,0
    .goto 1432/0,-2823.73,-6032.57,40,0
    .goto 1432/0,-2935.72,-6067.89,40,0
    .goto 1432/0,-2897.38,-6140.55,40,0
    .goto 1432/0,-2857.38,-6057.95,40,0
    .goto 1432/0,-2785.67,-6073.59,40,0
    .goto 1432/0,-2752.57,-6067.52,40,0
    .goto 1432/0,-2779.60,-6027.41,40,0
    >>Kill |cRXP_ENEMY_Stonesplinter Skullthumpers|r
    >>Kill |cRXP_ENEMY_Stonesplinter Seers|r
    .complete 237,1 --Stonesplinter Skullthumper slain (10)
    .complete 237,2 --Stonesplinter Seer slain (10)
    .mob Stonesplinter Skullthumper
    .mob Stonesplinter Seer
step
    .goto 1432/0,-2643.06,-5892.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Gravelgaw|r
    .turnin 237 >>Turn in In Defense of the King's Lands
    .target Mountaineer Gravelgaw
step
    .goto 1432/0,-3812.32,-5694.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Ironband|r
    .accept 298 >>Accept Excavation Progress Report
    .target Prospector Ironband
step
    .goto 1432/0,-3746.95,-5369.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bingles Blastenheimer|r
    .turnin 2039 >>Turn in Find Bingles
    .target Bingles Blastenheimer
    .isOnQuest 2039
step
    #completewith next
    .hs >>Hearth to Innkeeper Hearthstove's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1432/0,-3020.95,-5359.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jern Hornhelm|r
    .turnin 298 >>Turn in Excavation Progress Report
    .accept 301 >>Accept Report to Ironforge
    .target Jern Hornhelm
step
    .goto 1432/0,-2952.46,-5381.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yanni Stoutheart|r
    .vendor 1682 >> |cRXP_BUY_Buy|r |T133634:0|t[Small Brown Pouches] |cRXP_BUY_from her if needed|r
    .target Yanni Stoutheart
step << !Hunter
    .goto 1432/0,-2973.90,-5377.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Hearthstove|r
    .vendor 6734 >> |cRXP_BUY_Buy some|r |T133968:0|t[Freshly Baked Bread] |cRXP_BUY_if needed|r << Warrior/Rogue
    .vendor 6734 >> |cRXP_BUY_Buy some|r |T133968:0|t[Freshly Baked Bread] |cRXP_BUY_and|r |T132815:0|t[Ice Cold Milk] |cRXP_BUY_from her if needed|r << !Warrior !Rogue
    .target Innkeeper Hearthstove
step << Dwarf/Gnome
    .goto 1432/0,-3014.88,-5367.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brock Stoneseeker|r
    .turnin 6392 >>Turn in Return to Brock
    .target Brock Stoneseeker
    .isOnQuest 6392
step << Shaman
    .goto 1432/0,-2881.11,-5701.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Braldir Ashmantle|r
    .turnin 94465 >>Turn in Call of Fire
    .target Braldir Ashmantle
    .isOnQuest 94465
step << Shaman
    .goto 1432/0,-2881.11,-5701.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Braldir Ashmantle|r
    .accept 94466 >>Accept Call of Fire
    .target Braldir Ashmantle
    .isQuestTurnedIn 94465 --any of: Call of Fire
    .xp <10,1
step << Shaman
    #loop
    .goto 1432/0,-3361.61,-5038.64,0
    .goto 1432/0,-3361.61,-5038.64,40,0
    .goto 1432/0,-3336.23,-5018.77,40,0
    .goto 1432/0,-3313.34,-4912.08,40,0
    .goto 1432/0,-3276.37,-4877.49,40,0
    .goto 1432/0,-3318.85,-4839.04,40,0
    .goto 1432/0,-3335.95,-4873.63,40,0
    .goto 1432/0,-3371.81,-4921.09,40,0
    .goto 1432/0,-3401.60,-4916.49,40,0
    .goto 1432/0,-3375.95,-4988.60,40,0
    >>Kill |cRXP_ENEMY_Stonesplinter Seer|r and loot |cRXP_LOOT_Reagent Pouch|r
    .complete 94466,2 --Reagent Pouch (1)
    .mob Stonesplinter Seer
    .isOnQuest 94466
step << Shaman
    #loop
    .goto 1432/0,-3004.40,-4949.97,0
    .goto 1432/0,-3004.40,-4949.97,40,0
    .goto 1432/0,-2991.71,-4934.70,40,0
    .goto 1432/0,-2981.23,-4898.28,40,0
    .goto 1432/0,-2975.16,-4875.10,40,0
    .goto 1432/0,-2974.34,-5001.11,40,0
    .goto 1432/0,-3003.02,-4959.35,40,0
    >>Kill |cRXP_ENEMY_Tunnel Rat Geomancer|r and loot |cRXP_LOOT_Fire Tar|r
    .complete 94466,1 --Fire Tar (1)
    .mob Tunnel Rat Geomancer
    .isOnQuest 94466
step
    .goto 1432/0,-2729.40,-5534.96
    .xp 13+9600 >> Grind to 9600+/11400xp
    >>|cRXP_WARN_If you're planning on running the Hall of Thanes dungeon in Ironforge later, skip this step|r
step << Shaman
    .goto 1432/0,-2881.11,-5701.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Braldir Ashmantle|r
    .turnin 94466 >>Turn in Call of Fire
    .target Braldir Ashmantle
    .isOnQuest 94466
step << Shaman
    .goto 1432/0,-2881.11,-5701.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Braldir Ashmantle|r
    .accept 94467 >>Accept Call of Fire
    .target Braldir Ashmantle
    .isQuestTurnedIn 94466 --any of: Call of Fire
    .xp <10,1
step << Shaman
    .goto 1432/0,-2875.31,-5672.56
    >>Kill |cRXP_ENEMY_Minor Manifestation of Fire|r and loot |cRXP_LOOT_Glowing Ember|r
    .complete 94467,1 --Glowing Ember (1)
    .mob Minor Manifestation of Fire
    .isOnQuest 94467
step << Shaman
    .goto 1432/0,-2870.62,-5674.40
    >>Click the |cRXP_PICK_Brazier of the Dormant Flame|r
    .turnin 94467 >>Turn in Call of Fire
    .isOnQuest 94467
step << Shaman
    .goto 1432/0,-2870.62,-5674.40
    >>Click the |cRXP_PICK_Brazier of the Dormant Flame|r
    .accept 94468 >>Accept Call of Fire
    .isQuestTurnedIn 94467 --any of: Call of Fire
    .xp <10,1
step
    .goto 1432/0,-2659.34,-4822.300
    >>Talk to |cRXP_FRIENDLY_Gothor|r
    .vendor >>Vendor Trash
    .target Gothor Brumn
    .isOnQuest 1339
step
    .goto 1432/0,-2659.34,-4822.300
    >>Talk to |cRXP_FRIENDLY_Gothor|r
    .vendor >>Vendor Trash
    .target Gothor Brumn
    .isOnQuest 307
step << Human
    .goto 1432/0,-2849.11,-4944.45,50,0
    .goto 1432/0,-2895.45,-5014.91,50,0
    .goto 1432/0,-2957.24,-5067.89,50,0
    .goto 1432/0,-3008.26,-5098.06,50,0
    .goto 1432/0,-3087.43,-5091.25,50,0
    .goto 1432/0,-3046.05,-5189.48,50,0
    .goto 1432/0,-2918.62,-5233.08,50,0
    .goto 1432/0,-2817.66,-5471.86,50,0
    .goto 1432/0,-2809.66,-5343.64,50,0
    .goto 1432/0,-2819.87,-5220.39,50,0
    .goto 1432/0,-2740.98,-5225.170,50,0
    .goto 1432/0,-2794.49,-5102.66,50,0
    .goto 1432/0,-2743.74,-5021.16,50,0
    .goto 1432/0,-2704.57,-4958.430,50,0
    .goto 1432/0,-2645.82,-4895.890,50,0
    .goto 1432/0,-2849.11,-4944.45,50,0
    .xp 13+8675 >> Grind to 8675+/11400xp
step << Gnome
    .goto 1432/0,-2849.11,-4944.45,50,0
    .goto 1432/0,-2895.45,-5014.91,50,0
    .goto 1432/0,-2957.24,-5067.89,50,0
    .goto 1432/0,-3008.26,-5098.06,50,0
    .goto 1432/0,-3087.43,-5091.25,50,0
    .goto 1432/0,-3046.05,-5189.48,50,0
    .goto 1432/0,-2918.62,-5233.08,50,0
    .goto 1432/0,-2817.66,-5471.86,50,0
    .goto 1432/0,-2809.66,-5343.64,50,0
    .goto 1432/0,-2819.87,-5220.39,50,0
    .goto 1432/0,-2740.98,-5225.170,50,0
    .goto 1432/0,-2794.49,-5102.66,50,0
    .goto 1432/0,-2743.74,-5021.16,50,0
    .goto 1432/0,-2704.57,-4958.430,50,0
    .goto 1432/0,-2645.82,-4895.890,50,0
    .goto 1432/0,-2849.11,-4944.45,50,0
    .xp 13+6780 >> Grind to 6780+/11400xp
step
    .goto 1432/0,-2952.55,-5381.91
    >>Talk to |cRXP_FRIENDLY_Yanni|r
    >>|cRXP_BUY_Buy as many|r |T133634:0|t[Small Brown Pouches] |cRXP_BUY_as you need/can|r
    >>|cRXP_WARN_Do NOT go below 45 Silver|r
    .vendor >> Vendor Trash
    .isOnQuest 1338
step
    +|cRXP_WARN_That is all of Loch Modan for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Dun Morogh|r: Call of Fire << Shaman
    >>|cRXP_FRIENDLY_Ironforge|r: Ride to Ironforge << Dwarf/Gnome
    >>|cRXP_FRIENDLY_Ironforge|r: Report to Ironforge
    >>|cRXP_FRIENDLY_Stormwind City|r: Stormpike's Order
step
    .xp 14 >>|cRXP_WARN_The rest of Loch Modan is planned from level 14.|r Come back to this guide then
step
    .goto 1432/0,-2973.79,-5377.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Hearthstove|r
    .target Innkeeper Hearthstove
    .home >>Set your Hearthstone to Innkeeper Hearthstove's inn
step
    .goto 1432/0,-3020.95,-5359.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jern Hornhelm|r
    .accept 273 >>Accept Resupplying the Excavation
    .target Jern Hornhelm
    .isQuestTurnedIn 302 --any of: Powder to Ironband
    .xp <10,1
step << NightElf
    .goto 1432/0,-2929.87,-5424.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thorgrum Borrelson|r
    .fp Thelsamar >> Get the Thelsamar flight path
    .target Thorgrum Borrelson
step
    .goto 1432/0,-2676.71,-4825.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Stormpike|r
    .accept 307 >>Accept Filthy Paws
    .target Mountaineer Stormpike
step
    #loop
    .goto 1432/0,-2956.41,-4918.70,0
    .goto 1432/0,-2956.41,-4918.70,40,0
    .goto 1432/0,-2953.65,-4979.22,40,0
    .goto 1432/0,-2983.72,-4996.70,40,0
    .goto 1432/0,-3007.44,-4967.26,40,0
    .goto 1432/0,-2993.92,-4943.16,40,0
    .goto 1432/0,-2978.75,-4934.33,40,0
    .goto 1432/0,-2984.27,-4893.50,40,0
    .goto 1432/0,-2998.33,-4868.29,40,0
    .goto 1432/0,-2971.85,-4853.21,40,0
    >>Loot the |cRXP_PICK_Miners' League Crates|r for |cRXP_LOOT_Miners' Gear|r
    .complete 307,1 --Miners' Gear (4)
step
    .goto 1432/0,-2676.71,-4825.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Stormpike|r
    .turnin 307 >>Turn in Filthy Paws
    .target Mountaineer Stormpike
step
    .goto 1432/0,-3746.95,-5369.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bingles Blastenheimer|r
    .accept 2038 >>Accept Bingles' Missing Supplies
    .target Bingles Blastenheimer
step
    .goto 1432/0,-4296.13,-5691.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Daryl the Youngling|r
    .accept 257 >>Accept A Hunter's Boast
    .target Daryl the Youngling
step
    #loop
    .goto 1432/0,-4178.35,-5659.13,0
    .goto 1432/0,-4178.35,-5659.13,40,0
    .goto 1432/0,-4169.25,-5576.17,40,0
    .goto 1432/0,-4113.80,-5510.12,40,0
    .goto 1432/0,-4122.63,-5542.13,40,0
    .goto 1432/0,-4120.15,-5560.34,40,0
    >>Kill |cRXP_ENEMY_Mountain Buzzards|r
    .complete 257,1 --Mountain Buzzard slain (6)
    .mob Mountain Buzzard
step
    .goto 1432/0,-4248.96,-5621.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marek Ironheart|r
    .accept 86758 >>Accept Twisting the Knife
    .accept 385 >>Accept Crocolisk Hunting
    .target Marek Ironheart
step
    .goto 1432/0,-4296.13,-5691.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Daryl the Youngling|r
    .turnin 257 >>Turn in A Hunter's Boast
    .accept 258 >>Accept A Hunter's Challenge
    .target Daryl the Youngling
step
    #loop
    .goto 1432/0,-3852.04,-5247.25,0
    .goto 1432/0,-3852.04,-5247.25,40,0
    .goto 1432/0,-3785.01,-5201.81,40,0
    .goto 1432/0,-3737.02,-5133.19,40,0
    .goto 1432/0,-3654.54,-5111.30,40,0
    .goto 1432/0,-3577.86,-5069.36,40,0
    .goto 1432/0,-3529.59,-5149.01,40,0
    .goto 1432/0,-3476.63,-5230.88,40,0
    .goto 1432/0,-3648.75,-5184.52,40,0
    .goto 1432/0,-3686.81,-5287.35,40,0
    >>Kill |cRXP_ENEMY_Elder Mountain Boars|r
    >>Kill |cRXP_ENEMY_Daggerfang|r and loot |cRXP_LOOT_Marek's Croc-Hunting Knife|r
    >>Kill |cRXP_ENEMY_Loch Crocolisks|r, |cRXP_ENEMY_Large Loch Crocolisks|r and |cRXP_ENEMY_Daggerfangs|r. Loot them for |cRXP_LOOT_Crocolisk Skin|r
    >>Kill |cRXP_ENEMY_Loch Crocolisks|r, |cRXP_ENEMY_Large Loch Crocolisks|r and |cRXP_ENEMY_Daggerfangs|r. Loot them for |cRXP_LOOT_Crocolisk Meat|r
    .complete 258,1 --Elder Mountain Boar slain (5)
    .complete 86758,1 --Marek's Croc-Hunting Knife (1)
    .complete 385,2 --Crocolisk Skin (6)
    .complete 385,1 --Crocolisk Meat (1)
    .mob Elder Mountain Boar
    .mob Daggerfang
    .mob Loch Crocolisk
    .mob Large Loch Crocolisk
step
    .goto 1432/0,-3489.04,-4976.83
    >>Open the |cRXP_PICK_Bingles's Blastencapper|r. Loot it for |cRXP_LOOT_Bingles' Blastencapper|r
    >>Open the |cRXP_PICK_Bingles's Toolbucket|r. Loot it for |cRXP_LOOT_Bingles' Hammer|r
    .complete 2038,4 --Bingles' Blastencapper (1)
    .complete 2038,3 --Bingles' Hammer (1)
step
    .xp 14 >>Grind to level 14 (Eagle's Fist needs it)
step
    .goto 1432/0,-3358.85,-4723.52
    >>Click the |cRXP_PICK_Carved Figurine|r
    .accept 79975 >>Accept Eagle's Fist
step
    .goto 1432/0,-3328.23,-4864.80
    >>Open the |cRXP_PICK_Bingles's Toolbucket|r. Loot it for |cRXP_LOOT_Bingles' Screwdriver|r
    .complete 2038,2 --Bingles' Screwdriver (1)
step
    .goto 1432/0,-3337.89,-5041.03
    >>Open the |cRXP_PICK_Bingles's Toolbucket|r. Loot it for |cRXP_LOOT_Bingles' Wrench|r
    .complete 2038,1 --Bingles' Wrench (1)
step
    #loop
    .goto 1432/0,-3316.37,-5220.21,0
    .goto 1432/0,-3316.37,-5220.21,40,0
    .goto 1432/0,-3251.83,-5279.62,40,0
    .goto 1432/0,-3391.95,-5468.55,40,0
    .goto 1432/0,-3339.54,-5486.95,40,0
    >>Click the |cRXP_PICK_Discarded Fishing Toolbox|r
    .accept 86614 >>Accept Silver of the Waves
step
    .goto 1432/0,-3104.81,-5210.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Khara Deepwater|r
    .turnin 86614 >>Turn in Silver of the Waves
    .target Khara Deepwater
step
    .goto 1432/0,-3020.95,-5359.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jern Hornhelm|r
    .accept 436 >>Accept Ironband's Excavation
    .target Jern Hornhelm
step
    .goto 1432/0,-3404.91,-5756.08
    >>Find Huldar, Miran, and Saean
    .complete 273,1 --Find Huldar, Miran, and Saean
    .isOnQuest 273
step
    .goto 1432/0,-3433.32,-5762.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Huldar|r
    .turnin 273 >>Turn in Resupplying the Excavation
    .target Huldar
    .isOnQuest 273
step
    .goto 1432/0,-3433.32,-5762.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Huldar|r
    .accept 454 >>Accept After the Ambush
    .target Huldar
    .isQuestTurnedIn 273 --any of: Resupplying the Excavation
    .xp <10,1
step
    .goto 1432/0,-3433.88,-5764.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Miran|r
    .turnin 454 >>Turn in After the Ambush
    .target Miran
    .isOnQuest 454
step
    .goto 1432/0,-3433.88,-5764.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Miran|r
    .accept 309 >>Accept Protecting the Shipment
    .target Miran
    .isQuestTurnedIn 454 --any of: After the Ambush
    .xp <10,1
step
    .goto 1432/0,-3789.98,-5697.39
    >>Escort Miran to the excavation site
    .complete 309,1 --Escort Miran to the excavation site
    .isOnQuest 309
step
    .goto 1432/0,-3783.91,-5713.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magmar Fellhew|r
    .turnin 436 >>Turn in Ironband's Excavation
    .target Magmar Fellhew
step
    .goto 1432/0,-3812.32,-5694.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Ironband|r
    .turnin 309 >>Turn in Protecting the Shipment
    .target Prospector Ironband
    .isOnQuest 309
step
    .goto 1432/0,-4296.13,-5691.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Daryl the Youngling|r
    .turnin 258 >>Turn in A Hunter's Challenge
    .target Daryl the Youngling
step
    .goto 1432/0,-4248.96,-5621.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marek Ironheart|r
    .turnin 385 >>Turn in Crocolisk Hunting
    .turnin 86758 >>Turn in Twisting the Knife
    .target Marek Ironheart
step
    .goto 1432/0,-3746.95,-5369.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bingles Blastenheimer|r
    .turnin 2038 >>Turn in Bingles' Missing Supplies
    .target Bingles Blastenheimer
step
    .goto 1432/0,-2641.13,-5858.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Wallbang|r
    .accept 263 >>Accept In Defense of the King's Lands
    .target Mountaineer Wallbang
step
    #loop
    .goto 1432/0,-2913.38,-6161.34,0
    .goto 1432/0,-2913.38,-6161.34,40,0
    .goto 1432/0,-2947.03,-6171.09,40,0
    .goto 1432/0,-2952.55,-6223.15,40,0
    .goto 1432/0,-3007.99,-6214.68,40,0
    .goto 1432/0,-3023.44,-6186.91,40,0
    .goto 1432/0,-2993.65,-6161.89,40,0
    .goto 1432/0,-3028.68,-6144.41,40,0
    .goto 1432/0,-3048.26,-6100.81,40,0
    .goto 1432/0,-3027.30,-6073.77,40,0
    >>Kill |cRXP_ENEMY_Stonesplinter Bonesnappers|r
    >>Kill |cRXP_ENEMY_Stonesplinter Shamans|r
    .complete 263,2 --Stonesplinter Bonesnapper slain (10)
    .complete 263,1 --Stonesplinter Shaman slain (10)
    .mob Stonesplinter Bonesnapper
    .mob Stonesplinter Shaman
step
    .goto 1432/0,-2869.24,-6075.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Ylva|r
    .accept 86585 >>Accept Banner of the Fallen
    .target Mountaineer Ylva
step
    #loop
    .goto 1432/0,-2870.35,-6070.83,0
    .goto 1432/0,-2870.35,-6070.83,40,0
    .goto 1432/0,-2884.14,-6092.35,40,0
    .goto 1432/0,-2908.96,-6108.36,40,0
    .goto 1432/0,-2921.65,-6107.44,40,0
    .goto 1432/0,-2956.68,-6092.54,40,0
    >>Kill |cRXP_ENEMY_Headsplitters|r
    .complete 86585,1 --Headsplitter slain (8)
    .mob Headsplitter
step
    .goto 1432/0,-2641.13,-5858.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Wallbang|r
    .turnin 263 >>Turn in In Defense of the King's Lands
    .target Mountaineer Wallbang
step
    .goto 1432/0,-2634.51,-5842.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Rugelfuss|r
    .turnin 86585 >>Turn in Banner of the Fallen
    .accept 217 >>Accept In Defense of the King's Lands
    .target Captain Rugelfuss
step
    .goto 1432/0,-2949.24,-6153.24
    >>Kill |cRXP_ENEMY_Brawler|r
    >>Kill |cRXP_ENEMY_Gnasher|r
    >>Kill |cRXP_ENEMY_Grawmug|r
    .complete 217,3 --Brawler slain (1)
    .complete 217,2 --Gnasher slain (1)
    .complete 217,1 --Grawmug slain (1)
    .mob Brawler
    .mob Gnasher
    .mob Grawmug
step
    .goto 1432/0,-2634.51,-5842.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Rugelfuss|r
    .turnin 217 >>Turn in In Defense of the King's Lands
    .target Captain Rugelfuss
step
    +|cRXP_WARN_That is all of Loch Modan for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Arathi Highlands|r: Eagle's Fist
step
    .xp 18 >>|cRXP_WARN_The rest of Loch Modan is planned from level 18.|r Come back to this guide then
step
    .goto 1432/0,-3783.91,-5713.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magmar Fellhew|r
    .accept 297 >>Accept Gathering Idols
    .target Magmar Fellhew
step
    #loop
    .goto 1432/0,-3898.65,-5702.73,0
    .goto 1432/0,-3898.65,-5702.73,40,0
    .goto 1432/0,-3928.44,-5727.01,40,0
    .goto 1432/0,-3987.47,-5743.02,40,0
    .goto 1432/0,-3996.02,-5677.89,40,0
    .goto 1432/0,-3998.78,-5627.86,40,0
    .goto 1432/0,-3941.41,-5590.70,40,0
    .goto 1432/0,-3865.83,-5574.69,40,0
    .goto 1432/0,-3900.03,-5651.77,40,0
    .goto 1432/0,-3948.58,-5669.98,40,0
    >>Kill |cRXP_ENEMY_Stonesplinter Geomancers|r, |cRXP_ENEMY_Stonesplinter Diggers|r and |cRXP_ENEMY_Berserk Troggs|r. Loot them for |cRXP_LOOT_Carved Stone Idol|r
    .complete 297,1 --Carved Stone Idol (8)
    .mob Stonesplinter Geomancer
    .mob Stonesplinter Digger
    .mob Berserk Trogg
step
    .goto 1432/0,-4248.14,-5667.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vyrin Swiftwind|r
    .accept 271 >>Accept Vyrin's Revenge
    .target Vyrin Swiftwind
step
    .goto 1432/0,-3783.91,-5713.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magmar Fellhew|r
    .turnin 297 >>Turn in Gathering Idols
    .target Magmar Fellhew
step
    .goto 1432/0,-2948.13,-5305.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Bluntnose|r
    .accept 255 >>Accept Mercenaries
    .target Magistrate Bluntnose
step
    .goto 1432/0,-3263.96,-4737.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Hinderweir VII|r
    .accept 250 >>Accept A Dark Threat Looms
    .target Chief Engineer Hinderweir VII
step
    .goto 1432/0,-3263.96,-4737.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Hinderweir VII|r
    .accept 278 >>Accept A Dark Threat Looms
    .target Chief Engineer Hinderweir VII
    .isQuestTurnedIn 274 --any of: A Dark Threat Looms
    .xp <16,1
step
    .goto 1432/0,-3539.80,-4731.06
    >>Click the |cRXP_PICK_Suspicious Barrel|r
    .turnin 250 >>Turn in A Dark Threat Looms
    .accept 199 >>Accept A Dark Threat Looms
step
    #completewith Along9
    >>As you go: Kill |cRXP_ENEMY_Mo'grosh Enforcers|r. |cRXP_WARN_Anything left is finished later|r
    .complete 255,3 --Mo'grosh Enforcer slain (4)
    .mob Mo'grosh Enforcer
step
    #loop
    .goto 1432/0,-4064.98,-4781.47,0
    .goto 1432/0,-4064.98,-4781.47,40,0
    .goto 1432/0,-4085.67,-4809.61,40,0
    .goto 1432/0,-4079.88,-4826.35,40,0
    .goto 1432/0,-4194.62,-4767.12,40,0
    .goto 1432/0,-4130.63,-4743.39,40,0
    .goto 1432/0,-4125.67,-4740.99,40,0
    >>Kill |cRXP_ENEMY_Mo'grosh Brutes|r
    .complete 255,2 --Mo'grosh Brute slain (4)
    .mob Mo'grosh Brute
step
    #label Along9
    #loop
    .goto 1432/0,-4125.67,-4740.99,0
    .goto 1432/0,-4125.67,-4740.99,40,0
    .goto 1432/0,-4111.32,-4750.56,40,0
    .goto 1432/0,-4066.09,-4795.08,40,0
    .goto 1432/0,-4034.92,-4850.08,40,0
    .goto 1432/0,-4085.67,-4809.61,40,0
    .goto 1432/0,-4104.98,-4819.91,40,0
    .goto 1432/0,-4130.91,-4811.08,40,0
    .goto 1432/0,-4178.07,-4770.98,40,0
    .goto 1432/0,-4194.62,-4767.12,40,0
    >>Kill |cRXP_ENEMY_Mo'grosh Ogres|r, |cRXP_ENEMY_Mo'grosh Enforcers|r, |cRXP_ENEMY_Mo'grosh Brutes|r and |cRXP_ENEMY_Mo'grosh Shamans|r. Loot them for |cRXP_LOOT_Mo'grosh Crystal|r
    .complete 278,2 --Mo'grosh Crystal (1)
    .mob Mo'grosh Ogre
    .mob Mo'grosh Enforcer
    .mob Mo'grosh Brute
    .mob Mo'grosh Shaman
    .isOnQuest 278
step
    #loop
    .goto 1432/0,-3980.58,-4851.37,0
    .goto 1432/0,-3980.58,-4851.37,40,0
    .goto 1432/0,-3906.10,-4874.73,40,0
    .goto 1432/0,-3813.70,-4884.67,40,0
    .goto 1432/0,-3747.50,-4880.80,40,0
    .goto 1432/0,-3748.60,-4948.50,40,0
    .goto 1432/0,-3845.42,-5110.93,40,0
    .goto 1432/0,-3890.10,-5009.39,40,0
    .goto 1432/0,-3895.07,-4938.93,40,0
    .goto 1432/0,-4032.99,-4941.88,40,0
    >>Kill |cRXP_ENEMY_Mo'grosh Enforcers|r
    >>Kill |cRXP_ENEMY_Mo'grosh Ogres|r
    .complete 255,3 --Mo'grosh Enforcer slain (4)
    .complete 255,1 --Mo'grosh Ogre slain (4)
    .mob Mo'grosh Enforcer
    .mob Mo'grosh Ogre
step
    #loop
    .goto 1432/0,-3618.41,-5059.06,0
    .goto 1432/0,-3618.41,-5059.06,40,0
    .goto 1432/0,-3602.96,-5114.25,40,0
    .goto 1432/0,-3618.96,-5180.65,40,0
    .goto 1432/0,-3657.02,-5215.79,40,0
    .goto 1432/0,-3693.43,-5256.81,40,0
    .goto 1432/0,-3476.63,-5230.88,40,0
    .goto 1432/0,-3471.39,-5175.87,40,0
    .goto 1432/0,-3546.42,-5178.45,40,0
    .goto 1432/0,-3524.90,-5110.01,40,0
    >>Kill |cRXP_ENEMY_Loch Crocolisks|r, |cRXP_ENEMY_Large Loch Crocolisks|r and |cRXP_ENEMY_Daggerfangs|r. Loot them for |cRXP_LOOT_Crocolisk Tear|r
    .complete 278,3 --Crocolisk Tear (1)
    .mob Loch Crocolisk
    .mob Large Loch Crocolisk
    .mob Daggerfang
    .isOnQuest 278
step
    #loop
    .goto 1432/0,-3056.54,-5068.26,0
    .goto 1432/0,-3056.54,-5068.26,40,0
    .goto 1432/0,-3004.13,-5054.09,40,0
    .goto 1432/0,-3002.20,-5060.16,40,0
    .goto 1432/0,-2985.37,-5121.05,40,0
    >>Kill |cRXP_ENEMY_Cliff Lurkers|r, |cRXP_ENEMY_Wood Lurkers|r, |cRXP_ENEMY_Forest Lurkers|r and |cRXP_ENEMY_Shanda the Spinners|r. Loot them for |cRXP_LOOT_Lurker Venom|r
    .complete 278,1 --Lurker Venom (1)
    .mob Cliff Lurker
    .mob Wood Lurker
    .mob Forest Lurker
    .mob Shanda the Spinner
    .isOnQuest 278
step
    .goto 1432/0,-3263.96,-4737.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Hinderweir VII|r
    .turnin 199 >>Turn in A Dark Threat Looms
    .accept 161 >>Accept A Dark Threat Looms
    .target Chief Engineer Hinderweir VII
step
    .goto 1432/0,-3263.96,-4737.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Hinderweir VII|r
    .turnin 278 >>Turn in A Dark Threat Looms
    .target Chief Engineer Hinderweir VII
    .isOnQuest 278
step
    .goto 1432/0,-3263.96,-4737.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Hinderweir VII|r
    .accept 280 >>Accept A Dark Threat Looms
    .target Chief Engineer Hinderweir VII
    .isQuestTurnedIn 278 --any of: A Dark Threat Looms
    .xp <16,1
step
    .goto 1432/0,-3388.91,-4750.56
    >>Click the |cRXP_PICK_Explosive Charge|r
    .turnin 280 >>Turn in A Dark Threat Looms
    .isOnQuest 280
step
    .goto 1432/0,-3388.91,-4750.56
    >>Click the |cRXP_PICK_Explosive Charge|r
    .accept 283 >>Accept A Dark Threat Looms
    .isQuestTurnedIn 280 --any of: A Dark Threat Looms
    .xp <16,1
step
    .goto 1432/0,-3263.96,-4737.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chief Engineer Hinderweir VII|r
    .turnin 283 >>Turn in A Dark Threat Looms
    .target Chief Engineer Hinderweir VII
    .isOnQuest 283
step
    .goto 1432/0,-2948.13,-5305.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Bluntnose|r
    .turnin 255 >>Turn in Mercenaries
    .target Magistrate Bluntnose
step
    .goto 1432/0,-2932.13,-5343.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Morhan Coppertongue|r
    .accept 86776 >>Accept Ingredients for the Forge
    .target Morhan Coppertongue
step
    .goto 1432/0,-2932.13,-5343.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Morhan Coppertongue|r
    .turnin 86776 >>Turn in Ingredients for the Forge
    .target Morhan Coppertongue
    .isQuestComplete 86776
step
    .goto 1432/0,-3039.71,-5653.43
    >>Kill |cRXP_ENEMY_Ol' Sooty|r and loot |cRXP_LOOT_Ol' Sooty's Head|r
    .complete 271,1 --Ol' Sooty's Head (1)
    .mob Ol' Sooty
step
    .goto 1432/0,-4296.13,-5691.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Daryl the Youngling|r
    .turnin 271 >>Turn in Vyrin's Revenge
    .accept 531 >>Accept Vyrin's Revenge
    .target Daryl the Youngling
step
    .goto 1432/0,-4248.14,-5667.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vyrin Swiftwind|r
    .turnin 531 >>Turn in Vyrin's Revenge
    .target Vyrin Swiftwind
step
    +|cRXP_WARN_That is all of Loch Modan for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Wetlands|r: A Dark Threat Looms
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Ingredients for the Forge
step
    .xp 21 >>|cRXP_WARN_The rest of Loch Modan is planned from level 21.|r Come back to this guide then
step
    .goto 1432/0,-2932.13,-5343.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Morhan Coppertongue|r
    .turnin 86776 >>Turn in Ingredients for the Forge
    .target Morhan Coppertongue
    .isQuestComplete 86776
step
    .goto 1432/0,-3022.61,-5343.27
    >>Click the |cRXP_PICK_WANTED|r
    .accept 256 >>Accept WANTED: Chok'sul
step << Shaman
    .goto 1432/0,-3148.39,-4837.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Norric Lochthane|r
    .accept 94495 >>Accept Call of Water
    .accept 94502 >>Accept Call of Water
    .accept 94616 >>Accept Water Sapta
    .target Norric Lochthane
step << Shaman
    .goto 1432/0,-3148.39,-4837.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Norric Lochthane|r
    >>|cRXP_WARN_The database has no objectives for Water Sapta. Skip this step if the quest is not finished|r
    .turnin 94616 >>Turn in Water Sapta
    .target Norric Lochthane
    .isOnQuest 94616
step
    .goto 1432/0,-4189.11,-4757.92
    >>Kill |cRXP_ENEMY_Chok'sul|r and loot |cRXP_LOOT_Chok'sul's Head|r
    .complete 256,1 --Chok'sul's Head (1)
    .mob Chok'sul
step
    #loop
    .goto 1432/0,-3024.26,-5305.93,0
    .goto 1432/0,-3024.26,-5305.93,40,0
    .goto 1432/0,-2977.92,-5346.03,40,0
    .goto 1432/0,-2937.65,-5366.08,40,0
    .goto 1432/0,-2922.76,-5381.54,40,0
    .goto 1432/0,-2893.79,-5402.51,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Kadrell|r. |cRXP_WARN_This NPC walks a patrol route|r
    .accept 467 >>Accept Stonegear's Search
    .accept 468 >>Accept Report to Mountaineer Rockgar
    .unitscan Mountaineer Kadrell
step
    .goto 1432/0,-2948.13,-5305.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Bluntnose|r
    .turnin 256 >>Turn in WANTED: Chok'sul
    .target Magistrate Bluntnose
step
    .goto 1432/0,-2695.47,-4678.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mountaineer Rockgar|r
    .turnin 468 >>Turn in Report to Mountaineer Rockgar
    .accept 455 >>Accept The Algaz Gauntlet
    .target Mountaineer Rockgar
step
    +|cRXP_WARN_End of the Loch Modan route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Dun Morogh|r: Stonegear's Search
    >>|cRXP_FRIENDLY_Westfall|r: Call of Water << Shaman
    >>|cRXP_FRIENDLY_Wetlands|r: The Algaz Gauntlet
    >>|cRXP_FRIENDLY_Wetlands|r: Call of Water << Shaman
]])
