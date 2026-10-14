-- 35-43 Badlands: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 3 parts with a level check between them (from level 35, 38, 41).
-- Edit zones/Badlands.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#name 35-43 Badlands

step
    .goto 1418/0,-2240.61,-6672.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Neeka Bloodscar|r
    .turnin 1418 >>Turn in Neeka Bloodscar
    .target Neeka Bloodscar
    .isOnQuest 1418
step
    .goto 1418/0,-2178.42,-6632.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gorrik|r
    .fp Kargath >> Get the Kargath Flight Path
    .target Gorrik
step
    .goto 1418/0,-2151.30,-6672.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sranda|r
    .vendor >>|cRXP_BUY_Sell your junk and repair, if necessary|r
    .target Sranda
step
    .goto 1418/0,-2240.61,-6672.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Neeka Bloodscar|r
    .accept 1419 >>Accept Coyote Thieves
    .target Neeka Bloodscar
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .accept 713 >>Accept Coolant Heads Prevail
    .target Lotwil Veriatus
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .turnin 713 >>Turn in Coolant Heads Prevail
    .target Lotwil Veriatus
    .isQuestComplete 713
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .accept 714 >>Accept Gyro... What?
    .target Lotwil Veriatus
    .isQuestTurnedIn 713 --any of: Coolant Heads Prevail
    .xp <35,1
step
    .goto 1418/0,-2721.44,-6623.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lucien Tosselwrench|r
    .accept 715 >>Accept Liquid Stone
    .target Lucien Tosselwrench
    .isQuestTurnedIn 714 --any of: Gyro... What?
    .xp <35,1
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .turnin 714 >>Turn in Gyro... What?
    .target Lotwil Veriatus
    .isQuestComplete 714
step
    .goto 1418/0,-2721.44,-6623.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lucien Tosselwrench|r
    .turnin 715 >>Turn in Liquid Stone
    .target Lucien Tosselwrench
    .isQuestComplete 715
step
    .goto 1418/0,-3133.62,-6767.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rigglefuzz|r
    .accept 705 >>Accept Pearl Diving
    .accept 703 >>Accept Barbecued Buzzard Wings
    .accept 2418 >>Accept Power Stones
    .target Rigglefuzz
step
    #completewith Drop635x1
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Dustbelcher Ogre|r, |cRXP_ENEMY_Dustbelcher Brute|r, |cRXP_ENEMY_Dustbelcher Wyrmhunter|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #label Drop635x1
    #loop
    .goto 1418/0,-3359.48,-6458.39,0
    .goto 1418/0,-3359.48,-6458.39,40,0
    .goto 1418/0,-3387.34,-6448.28,40,0
    .goto 1418/0,-3411.97,-6404.99,40,0
    .goto 1418/0,-3416.45,-6425.39,40,0
    .goto 1418/0,-3404.76,-6458.56,40,0
    >>Kill |cRXP_ENEMY_Dustbelcher Ogres|r, |cRXP_ENEMY_Dustbelcher Brutes|r, |cRXP_ENEMY_Dustbelcher Maulers|r and |cRXP_ENEMY_Dustbelcher Shamans|r. Loot them for |cRXP_LOOT_Healing Potion|r
    .complete 715,1 --Healing Potion (1)
    .mob Dustbelcher Ogre
    .mob Dustbelcher Brute
    .mob Dustbelcher Mauler
    .mob Dustbelcher Shaman
    .isOnQuest 715
step
    .goto 1418/0,-3576.89,-6388.74
    >>Kill |cRXP_ENEMY_Starving Buzzards|r, |cRXP_ENEMY_Buzzards|r, |cRXP_ENEMY_Giant Buzzards|r and |cRXP_ENEMY_Zaricotls|r. Loot them for |cRXP_LOOT_Buzzard Wing|r
    .complete 703,1 --Buzzard Wing (4)
    .mob Starving Buzzard
    .mob Buzzard
    .mob Giant Buzzard
    .mob Zaricotl
step
    #completewith Drop635x2
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Dustbelcher Ogre|r, |cRXP_ENEMY_Dustbelcher Brute|r, |cRXP_ENEMY_Dustbelcher Wyrmhunter|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #label Drop635x2
    #loop
    .goto 1418/0,-3432.37,-6241.15,0
    .goto 1418/0,-3432.37,-6241.15,40,0
    .goto 1418/0,-3382.62,-6247.78,40,0
    .goto 1418/0,-3367.69,-6201.35,40,0
    .goto 1418/0,-3337.84,-6135.02,40,0
    .goto 1418/0,-3337.84,-6065.37,40,0
    .goto 1418/0,-3352.77,-6095.22,40,0
    .goto 1418/0,-3372.67,-6154.92,40,0
    .goto 1418/0,-3402.52,-6191.40,40,0
    .goto 1418/0,-3447.29,-6171.50,40,0
    >>Kill |cRXP_ENEMY_Shadowforge Surveyors|r, |cRXP_ENEMY_Shadowforge Ruffians|r and |cRXP_ENEMY_Shadowforge Diggers|r. Loot them for |cRXP_LOOT_An'Alleum Power Stone|r
    >>Kill |cRXP_ENEMY_Shadowforge Surveyors|r, |cRXP_ENEMY_Shadowforge Ruffians|r and |cRXP_ENEMY_Shadowforge Diggers|r. Loot them for |cRXP_LOOT_Dentrium Power Stone|r
    .complete 2418,2 --An'Alleum Power Stone (8)
    .complete 2418,1 --Dentrium Power Stone (8)
    .mob Shadowforge Surveyor
    .mob Shadowforge Ruffian
    .mob Shadowforge Digger
step
    .goto 1418/0,-3133.62,-6767.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rigglefuzz|r
    .turnin 2418 >>Turn in Power Stones
    .turnin 703 >>Turn in Barbecued Buzzard Wings
    .target Rigglefuzz
step
    .goto 1418/0,-3133.62,-6767.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rigglefuzz|r
    .turnin 705 >>Turn in Pearl Diving
    .target Rigglefuzz
    .isQuestComplete 705
step
    .goto 1418/0,-3129.39,-6763.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Martek the Exiled|r
    .turnin 1106 >>Turn in Martek the Exiled
    .target Martek the Exiled
    .isOnQuest 1106
step
    .goto 1418/0,-2656.27,-6669.00
    .xp 40 >> Grind to 40
step
    .goto 1418/0,-3357.49,-7164.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Theldurin the Lost|r
    .turnin 737 >>Turn in Forbidden Knowledge
    .target Theldurin the Lost
    .isOnQuest 737
step
    .goto 1418/0,-3357.49,-7164.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Theldurin the Lost|r
    .turnin 687 >>Turn in Theldurin the Lost
    .target Theldurin the Lost
    .isOnQuest 687
step
    #loop
    .goto 1418/0,-3382.87,-6895.20,0
    .goto 1418/0,-3382.87,-6895.20,40,0
    .goto 1418/0,-3461.22,-6782.26,40,0
    .goto 1418/0,-3524.16,-6660.54,40,0
    .goto 1418/0,-3391.32,-6540.31,40,0
    .goto 1418/0,-3285.36,-6461.71,40,0
    .goto 1418/0,-3268.94,-6549.10,40,0
    .goto 1418/0,-3245.06,-6691.06,40,0
    .goto 1418/0,-3317.20,-6656.40,40,0
    .goto 1418/0,-3415.20,-6685.42,40,0
    >>Kill |cRXP_ENEMY_Crag Coyotes|r, |cRXP_ENEMY_Feral Crag Coyotes|r, |cRXP_ENEMY_Elder Crag Coyotes|r and |cRXP_ENEMY_Rabid Crag Coyotes|r. Loot them for |cRXP_LOOT_Coyote Jawbone|r
    .complete 1419,1 --Coyote Jawbone (30)
    .mob Crag Coyote
    .mob Feral Crag Coyote
    .mob Elder Crag Coyote
    .mob Rabid Crag Coyote
step
    .goto 1418/0,-2240.61,-6672.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Neeka Bloodscar|r
    .turnin 1419 >>Turn in Coyote Thieves
    .accept 1420 >>Accept Report to Helgrum
    .target Neeka Bloodscar
step
    .goto 1418/0,-2139.36,-6653.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jarkal Mossmeld|r
    .turnin 2341 >>Turn in Necklace Recovery, Take 3
    .target Jarkal Mossmeld
    .isOnQuest 2341
step
    +|cRXP_WARN_That is all of Badlands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Arathi Highlands|r: Crystal in the Mountains
    >>|cRXP_FRIENDLY_Swamp of Sorrows|r: Report to Helgrum
    >>|cRXP_FRIENDLY_Stranglethorn Vale and back here|r: Pearl Diving
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Coolant Heads Prevail
step
    .xp 38 >>|cRXP_WARN_The rest of Badlands is planned from level 38.|r Come back to this guide then
step
    .goto 1418/0,-3357.49,-7164.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Theldurin the Lost|r
    .accept 709 >>Accept Solution to Doom
    .target Theldurin the Lost
step
    .goto 1418/0,-3057.75,-6201.68
    >>Open the |cRXP_PICK_Ancient Chest|r. Loot it for |cRXP_LOOT_Tablet of Ryun'eh|r
    .complete 709,1 --Tablet of Ryun'eh (1)
step
    .goto 1418/0,-2139.36,-6653.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jarkal Mossmeld|r
    .accept 2258 >>Accept Badlands Reagent Run
    .target Jarkal Mossmeld
step
    #completewith Along4
    >>As you go: Kill |cRXP_ENEMY_Rock Elementals|r, |cRXP_ENEMY_Lesser Rock Elementals|r, |cRXP_ENEMY_Greater Rock Elementals|r and |cRXP_ENEMY_Ambassador Infernus|r. Loot them for |cRXP_LOOT_Rock Elemental Shard|r. |cRXP_WARN_Anything left is finished later|r
    .complete 2258,3 --Rock Elemental Shard (5)
    .mob Rock Elemental
    .mob Lesser Rock Elemental
    .mob Greater Rock Elemental
    .mob Ambassador Infernus
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .turnin 713 >>Turn in Coolant Heads Prevail
    .target Lotwil Veriatus
    .isQuestComplete 713
step
    #label Along4
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .accept 710 >>Accept Study of the Elements: Rock
    .target Lotwil Veriatus
step
    #loop
    .goto 1418/0,-2726.17,-6648.77,0
    .goto 1418/0,-2726.17,-6648.77,40,0
    .goto 1418/0,-2636.86,-6613.61,40,0
    .goto 1418/0,-2491.10,-6489.07,40,0
    .goto 1418/0,-2410.50,-6519.25,40,0
    .goto 1418/0,-2445.82,-6582.77,40,0
    .goto 1418/0,-2497.07,-6598.35,40,0
    .goto 1418/0,-2547.07,-6602.50,40,0
    .goto 1418/0,-2554.03,-6648.27,40,0
    .goto 1418/0,-2616.47,-6683.26,40,0
    >>Kill |cRXP_ENEMY_Lesser Rock Elementals|r. Loot them for |cRXP_LOOT_Small Stone Shard|r
    >>Kill |cRXP_ENEMY_Rock Elementals|r, |cRXP_ENEMY_Lesser Rock Elementals|r, |cRXP_ENEMY_Greater Rock Elementals|r and |cRXP_ENEMY_Ambassador Infernus|r. Loot them for |cRXP_LOOT_Rock Elemental Shard|r
    .complete 710,1 --Small Stone Shard (10)
    .complete 2258,3 --Rock Elemental Shard (5)
    .mob Lesser Rock Elemental
    .mob Rock Elemental
    .mob Greater Rock Elemental
    .mob Ambassador Infernus
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .turnin 710 >>Turn in Study of the Elements: Rock
    .accept 711 >>Accept Study of the Elements: Rock
    .target Lotwil Veriatus
step
    .goto 1418/0,-3133.62,-6767.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rigglefuzz|r
    .turnin 705 >>Turn in Pearl Diving
    .target Rigglefuzz
    .isQuestComplete 705
step
    .goto 1418/0,-3129.39,-6763.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Martek the Exiled|r
    .accept 1108 >>Accept Indurium
    .target Martek the Exiled
    .isQuestTurnedIn 1106 --any of: Martek the Exiled
    .xp <28,1
step
    #loop
    .goto 1418/0,-3035.86,-7108.62,0
    .goto 1418/0,-3035.86,-7108.62,40,0
    .goto 1418/0,-3085.11,-7145.94,40,0
    .goto 1418/0,-3225.90,-7177.11,40,0
    .goto 1418/0,-3186.35,-7253.56,40,0
    .goto 1418/0,-3179.39,-7312.76,40,0
    .goto 1418/0,-3143.57,-7352.07,40,0
    .goto 1418/0,-3118.94,-7276.78,40,0
    .goto 1418/0,-3098.30,-7204.48,40,0
    .goto 1418/0,-2951.78,-7140.30,40,0
    >>Kill |cRXP_ENEMY_Rock Elementals|r. Loot them for |cRXP_LOOT_Large Stone Slab|r
    .complete 711,1 --Large Stone Slab (3)
    .mob Rock Elemental
step
    .goto 1418/0,-3357.49,-7164.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Theldurin the Lost|r
    .turnin 709 >>Turn in Solution to Doom
    .accept 728 >>Accept To the Undercity for Yagyin's Digest
    .target Theldurin the Lost
step
    #loop
    .goto 1418/0,-3352.27,-7077.78,0
    .goto 1418/0,-3352.27,-7077.78,40,0
    .goto 1418/0,-3384.61,-7043.95,40,0
    .goto 1418/0,-3384.11,-6983.42,40,0
    .goto 1418/0,-3348.04,-6985.58,40,0
    .goto 1418/0,-3345.80,-6956.89,40,0
    .goto 1418/0,-3314.46,-6956.06,40,0
    .goto 1418/0,-3320.18,-7023.55,40,0
    .goto 1418/0,-3255.75,-7048.59,40,0
    .goto 1418/0,-3291.08,-7082.42,40,0
    >>Kill |cRXP_ENEMY_Stonevault Bashers|r, |cRXP_ENEMY_Stonevault Shamans|r, |cRXP_ENEMY_Stonevault Bonesnappers|r and |cRXP_ENEMY_Stonevault Seers|r. Loot them for |cRXP_LOOT_Indurium Flake|r
    .complete 1108,1 --Indurium Flake (10)
    .mob Stonevault Basher
    .mob Stonevault Shaman
    .mob Stonevault Bonesnapper
    .mob Stonevault Seer
    .isOnQuest 1108
step
    .goto 1418/0,-3129.39,-6763.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Martek the Exiled|r
    .turnin 1108 >>Turn in Indurium
    .target Martek the Exiled
    .isOnQuest 1108
step
    .goto 1418/0,-3129.39,-6763.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Martek the Exiled|r
    .accept 1137 >>Accept News for Fizzle
    .target Martek the Exiled
    .isQuestTurnedIn 1108 --any of: Indurium
    .xp <28,1
step
    #loop
    .goto 1418/0,-3008.25,-6847.44,0
    .goto 1418/0,-3008.25,-6847.44,40,0
    .goto 1418/0,-3013.97,-6934.17,40,0
    .goto 1418/0,-3022.68,-6997.02,40,0
    .goto 1418/0,-2885.12,-6987.07,40,0
    .goto 1418/0,-2827.66,-6948.26,40,0
    .goto 1418/0,-2852.53,-6887.07,40,0
    .goto 1418/0,-2940.84,-6911.61,40,0
    .goto 1418/0,-2887.60,-6848.76,40,0
    .goto 1418/0,-2910.99,-6793.04,40,0
    >>Kill |cRXP_ENEMY_Crag Coyotes|r, |cRXP_ENEMY_Feral Crag Coyotes|r, |cRXP_ENEMY_Elder Crag Coyotes|r and |cRXP_ENEMY_Rabid Crag Coyotes|r. Loot them for |cRXP_LOOT_Crag Coyote Fang|r
    .complete 2258,2 --Crag Coyote Fang (10)
    .mob Crag Coyote
    .mob Feral Crag Coyote
    .mob Elder Crag Coyote
    .mob Rabid Crag Coyote
step
    #loop
    .goto 1418/0,-2506.52,-6884.91,0
    .goto 1418/0,-2506.52,-6884.91,40,0
    .goto 1418/0,-2504.53,-6857.22,40,0
    .goto 1418/0,-2477.66,-6862.53,40,0
    .goto 1418/0,-2464.73,-6860.04,40,0
    .goto 1418/0,-2453.04,-6886.24,40,0
    .goto 1418/0,-2453.29,-6914.76,40,0
    .goto 1418/0,-2481.40,-6912.77,40,0
    >>Kill |cRXP_ENEMY_Starving Buzzards|r, |cRXP_ENEMY_Buzzards|r and |cRXP_ENEMY_Giant Buzzards|r. Loot them for |cRXP_LOOT_Buzzard Gizzard|r
    .complete 2258,1 --Buzzard Gizzard (5)
    .mob Starving Buzzard
    .mob Buzzard
    .mob Giant Buzzard
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .turnin 711 >>Turn in Study of the Elements: Rock
    .target Lotwil Veriatus
step
    .goto 1418/0,-2139.36,-6653.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jarkal Mossmeld|r
    .turnin 2258 >>Turn in Badlands Reagent Run
    .target Jarkal Mossmeld
step
    .goto 1418/0,-2139.36,-6653.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jarkal Mossmeld|r
    .accept 2340 >>Accept Deliver the Gems
    .target Jarkal Mossmeld
    .isQuestTurnedIn 2339 --any of: Find the Gems and Power Source
    .xp <37,1
step
    .goto 1418/0,-2139.36,-6653.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jarkal Mossmeld|r
    .accept 2338 >>Accept Translating the Journal
    .target Jarkal Mossmeld
    .isQuestTurnedIn 2318 --any of: Translating the Journal
    .xp <37,1
step
    .goto 1418/0,-2139.36,-6653.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jarkal Mossmeld|r
    .turnin 2338 >>Turn in Translating the Journal
    .target Jarkal Mossmeld
    .isOnQuest 2338
step
    .goto 1418/0,-2139.36,-6653.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jarkal Mossmeld|r
    .accept 2339 >>Accept Find the Gems and Power Source
    .target Jarkal Mossmeld
    .isQuestTurnedIn 2338 --any of: Translating the Journal
    .xp <37,1
step
    .goto 1418/0,-2139.36,-6653.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jarkal Mossmeld|r
    .turnin 2339 >>Turn in Find the Gems and Power Source
    .target Jarkal Mossmeld
    .isQuestComplete 2339
step
    +|cRXP_WARN_That is all of Badlands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Orgrimmar|r: Deliver the Gems
    >>|cRXP_FRIENDLY_Thousand Needles|r: News for Fizzle
    >>|cRXP_FRIENDLY_Undercity|r: To the Undercity for Yagyin's Digest
step
    .xp 41 >>|cRXP_WARN_The rest of Badlands is planned from level 41.|r Come back to this guide then
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .turnin 713 >>Turn in Coolant Heads Prevail
    .target Lotwil Veriatus
    .isQuestComplete 713
step
    .goto 1418/0,-3133.62,-6767.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rigglefuzz|r
    .turnin 705 >>Turn in Pearl Diving
    .target Rigglefuzz
    .isQuestComplete 705
step
    .goto 1418/0,-3357.49,-7164.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Theldurin the Lost|r
    .accept 692 >>Accept The Lost Fragments
    .target Theldurin the Lost
    .isQuestTurnedIn 687 --any of: Theldurin the Lost
    .xp <30,1
step
    #loop
    .goto 1418/0,-3435.35,-7248.59,0
    .goto 1418/0,-3435.35,-7248.59,40,0
    .goto 1418/0,-3473.41,-7262.02,40,0
    .goto 1418/0,-3485.85,-7276.61,40,0
    .goto 1418/0,-3473.41,-7283.08,40,0
    .goto 1418/0,-3454.51,-7309.28,40,0
    .goto 1418/0,-3461.47,-7335.82,40,0
    .goto 1418/0,-3427.89,-7308.62,40,0
    .goto 1418/0,-3387.34,-7308.29,40,0
    .goto 1418/0,-3419.18,-7281.09,40,0
    >>Kill |cRXP_ENEMY_Enraged Rock Elemental|r and loot |cRXP_LOOT_Singed Scroll Fragment|r
    .complete 692,3 --Singed Scroll Fragment (1)
    .mob Enraged Rock Elemental
    .isOnQuest 692
step
    #loop
    .goto 1418/0,-3419.18,-7281.09,0
    .goto 1418/0,-3419.18,-7281.09,40,0
    .goto 1418/0,-3435.35,-7248.59,40,0
    .goto 1418/0,-3473.41,-7262.02,40,0
    .goto 1418/0,-3485.85,-7276.61,40,0
    .goto 1418/0,-3473.41,-7283.08,40,0
    .goto 1418/0,-3454.51,-7309.28,40,0
    .goto 1418/0,-3461.47,-7335.82,40,0
    .goto 1418/0,-3427.89,-7308.62,40,0
    .goto 1418/0,-3387.34,-7308.29,40,0
    >>Kill |cRXP_ENEMY_Enraged Rock Elemental|r and loot |cRXP_LOOT_Crumpled Scroll Fragment|r
    .complete 692,2 --Crumpled Scroll Fragment (1)
    .mob Enraged Rock Elemental
    .isOnQuest 692
step
    #loop
    .goto 1418/0,-3419.18,-7281.09,0
    .goto 1418/0,-3419.18,-7281.09,40,0
    .goto 1418/0,-3435.35,-7248.59,40,0
    .goto 1418/0,-3473.41,-7262.02,40,0
    .goto 1418/0,-3485.85,-7276.61,40,0
    .goto 1418/0,-3473.41,-7283.08,40,0
    .goto 1418/0,-3454.51,-7309.28,40,0
    .goto 1418/0,-3461.47,-7335.82,40,0
    .goto 1418/0,-3427.89,-7308.62,40,0
    .goto 1418/0,-3387.34,-7308.29,40,0
    >>Kill |cRXP_ENEMY_Enraged Rock Elemental|r and loot |cRXP_LOOT_Torn Scroll Fragment|r
    .complete 692,1 --Torn Scroll Fragment (1)
    .mob Enraged Rock Elemental
    .isOnQuest 692
step
    .goto 1418/0,-3357.49,-7164.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Theldurin the Lost|r
    .turnin 692 >>Turn in The Lost Fragments
    .target Theldurin the Lost
    .isOnQuest 692
step
    .goto 1418/0,-2151.55,-6645.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gorn|r
    .accept 782 >>Accept Broken Alliances
    .target Gorn
step
    .goto 1418/0,-2139.36,-6653.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jarkal Mossmeld|r
    .accept 2202 >>Accept Uldaman Reagent Run
    .target Jarkal Mossmeld
step
    .goto 1418/0,-2393.09,-7141.46
    >>Kill |cRXP_ENEMY_Boss Tho'grun|r and loot |cRXP_LOOT_Sign of the Earth|r
    .complete 782,1 --Sign of the Earth (1)
    .mob Boss Tho'grun
step
    #loop
    .goto 1418/0,-2911.48,-6118.76,0
    .goto 1418/0,-2911.48,-6118.76,40,0
    .goto 1418/0,-2979.64,-6096.87,40,0
    .goto 1418/0,-3019.69,-6061.88,40,0
    .goto 1418/0,-3091.33,-6064.21,40,0
    .goto 1418/0,-3099.29,-6138.33,40,0
    .goto 1418/0,-3030.14,-6172.00,40,0
    .goto 1418/0,-3013.72,-6142.64,40,0
    >>Loot the |cRXP_PICK_Magenta Cap Clusters|r for |cRXP_LOOT_Magenta Fungus Cap|r
    .complete 2202,1 --Magenta Fungus Cap (12)
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .accept 712 >>Accept Study of the Elements: Rock
    .target Lotwil Veriatus
step
    #loop
    .goto 1418/0,-2244.59,-7114.26,0
    .goto 1418/0,-2244.59,-7114.26,40,0
    .goto 1418/0,-2215.48,-7165.67,40,0
    .goto 1418/0,-2181.40,-7214.76,40,0
    .goto 1418/0,-2148.07,-7186.73,40,0
    .goto 1418/0,-2114.99,-7219.23,40,0
    .goto 1418/0,-2118.22,-7291.04,40,0
    .goto 1418/0,-2150.81,-7252.40,40,0
    .goto 1418/0,-2201.80,-7277.94,40,0
    .goto 1418/0,-2251.80,-7218.74,40,0
    >>Kill |cRXP_ENEMY_Greater Rock Elementals|r. Loot them for |cRXP_LOOT_Bracers of Rock Binding|r
    .complete 712,1 --Bracers of Rock Binding (5)
    .mob Greater Rock Elemental
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .turnin 712 >>Turn in Study of the Elements: Rock
    .target Lotwil Veriatus
step
    .goto 1418/0,-2721.44,-6623.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lucien Tosselwrench|r
    .accept 716 >>Accept Stone Is Better than Cloth
    .target Lucien Tosselwrench
step
    .goto 1418/0,-2721.44,-6623.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lucien Tosselwrench|r
    .turnin 716 >>Turn in Stone Is Better than Cloth
    .target Lucien Tosselwrench
    .isQuestComplete 716
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .accept 734 >>Accept This Is Going to Be Hard
    .target Lotwil Veriatus
    .isQuestTurnedIn 714 --Gyro... What?
    .xp <35,1
step
    .goto 1418/0,-2721.44,-6623.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lucien Tosselwrench|r
    .turnin 734 >>Turn in This Is Going to Be Hard
    .target Lucien Tosselwrench
    .isOnQuest 734
step
    .goto 1418/0,-2721.44,-6623.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lucien Tosselwrench|r
    .accept 777 >>Accept This Is Going to Be Hard
    .target Lucien Tosselwrench
    .isQuestTurnedIn 734 --any of: This Is Going to Be Hard
    .xp <35,1
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .turnin 777 >>Turn in This Is Going to Be Hard
    .target Lotwil Veriatus
    .isOnQuest 777
step
    .goto 1418/0,-2151.55,-6645.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gorn|r
    .turnin 782 >>Turn in Broken Alliances
    .target Gorn
step
    .goto 1418/0,-2139.36,-6653.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jarkal Mossmeld|r
    .turnin 2202 >>Turn in Uldaman Reagent Run
    .target Jarkal Mossmeld
step
    +|cRXP_WARN_End of the Badlands route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Stone Is Better than Cloth
]])
