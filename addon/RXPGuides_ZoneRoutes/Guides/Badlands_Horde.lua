-- 35-43 Badlands: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 3 parts (from level 35, 38, 41).
-- Split into 3 guides, listed under "35 - 42 Badlands" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Badlands.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 35 - 42 Badlands
#subweight -35
#name 35-36 Badlands

step
    .goto 1418/0,-3489.58,-6551.26
    >>Click the |cRXP_PICK_Scrolls|r
    .accept 79951 >>Accept Mummies: A Guide to the Unsavory Undead
step
    .goto 1418/0,-3489.58,-6551.26
    >>Open the |cRXP_PICK_Scrolls|r. Loot it for |cRXP_LOOT_Mummies: A Guide to the Unsavory Undead|r
    .complete 79951,1 --Mummies: A Guide to the Unsavory Undead (1)
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
    .accept 2418 >>Accept Power Stones
    .accept 703 >>Accept Barbecued Buzzard Wings
    .target Rigglefuzz
step
    #completewith Drop635x1
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Dustbelcher Ogre|r, |cRXP_ENEMY_Dustbelcher Brute|r, |cRXP_ENEMY_Dustbelcher Wyrmhunter|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #label Drop635x1
    .goto 1418/0,-3387.34,-6448.28
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
    .goto 1418/0,-3402.52,-6191.40,0
    .goto 1418/0,-3402.52,-6191.40,40,0
    .goto 1418/0,-3342.82,-6108.48,40,0
    >>Kill |cRXP_ENEMY_Shadowforge Surveyors|r, |cRXP_ENEMY_Shadowforge Ruffians|r and |cRXP_ENEMY_Shadowforge Diggers|r. Loot them for |cRXP_LOOT_Dentrium Power Stone|r
    >>Kill |cRXP_ENEMY_Shadowforge Surveyors|r, |cRXP_ENEMY_Shadowforge Ruffians|r and |cRXP_ENEMY_Shadowforge Diggers|r. Loot them for |cRXP_LOOT_An'Alleum Power Stone|r
    .complete 2418,1 --Dentrium Power Stone (8)
    .complete 2418,2 --An'Alleum Power Stone (8)
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
    .goto 1418/0,-3409.48,-6854.24,0
    .goto 1418/0,-3409.48,-6854.24,40,0
    .goto 1418/0,-3447.79,-6752.25,40,0
    .goto 1418/0,-3329.38,-6553.08,40,0
    .goto 1418/0,-3314.21,-6654.57,40,0
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
    >>|cRXP_FRIENDLY_Undercity|r: Mummies: A Guide to the Unsavory Undead
    >>|cRXP_FRIENDLY_Stranglethorn Vale and back here|r: Pearl Diving
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Coolant Heads Prevail
step
    +|cRXP_WARN_The rest of Badlands is planned from level 38.|r Load its guide for level 38 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 35 - 42 Badlands
#subweight -35
#name 38-39 Badlands

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
    .goto 1418/0,-2606.52,-6650.43,0
    .goto 1418/0,-2606.52,-6650.43,40,0
    .goto 1418/0,-2547.07,-6602.50,40,0
    .goto 1418/0,-2454.03,-6512.62,40,0
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
    .goto 1418/0,-2990.59,-7118.08,0
    .goto 1418/0,-2990.59,-7118.08,40,0
    .goto 1418/0,-3118.94,-7167.49,40,0
    .goto 1418/0,-3156.75,-7285.90,40,0
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
    .goto 1418/0,-3311.23,-7047.10,0
    .goto 1418/0,-3311.23,-7047.10,40,0
    .goto 1418/0,-3348.04,-6985.58,40,0
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
    .goto 1418/0,-2971.93,-6902.49,0
    .goto 1418/0,-2971.93,-6902.49,40,0
    .goto 1418/0,-2852.53,-6887.07,40,0
    >>Kill |cRXP_ENEMY_Crag Coyotes|r, |cRXP_ENEMY_Feral Crag Coyotes|r, |cRXP_ENEMY_Elder Crag Coyotes|r and |cRXP_ENEMY_Rabid Crag Coyotes|r. Loot them for |cRXP_LOOT_Crag Coyote Fang|r
    .complete 2258,2 --Crag Coyote Fang (10)
    .mob Crag Coyote
    .mob Feral Crag Coyote
    .mob Elder Crag Coyote
    .mob Rabid Crag Coyote
step
    .goto 1418/0,-2477.66,-6862.53
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
    +|cRXP_WARN_The rest of Badlands is planned from level 41.|r Load its guide for level 41 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 35 - 42 Badlands
#subweight -35
#name 41-42 Badlands

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
    .goto 1418/0,-3419.18,-7281.09
    >>Kill |cRXP_ENEMY_Enraged Rock Elemental|r and loot |cRXP_LOOT_Singed Scroll Fragment|r
    .complete 692,3 --Singed Scroll Fragment (1)
    .mob Enraged Rock Elemental
    .isOnQuest 692
step
    .goto 1418/0,-3419.18,-7281.09
    >>Kill |cRXP_ENEMY_Enraged Rock Elemental|r and loot |cRXP_LOOT_Crumpled Scroll Fragment|r
    .complete 692,2 --Crumpled Scroll Fragment (1)
    .mob Enraged Rock Elemental
    .isOnQuest 692
step
    .goto 1418/0,-3419.18,-7281.09
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
    .isQuestTurnedIn 2258 --any of: Badlands Reagent Run
step
    .goto 1418/0,-2393.09,-7141.46
    >>Kill |cRXP_ENEMY_Boss Tho'grun|r and loot |cRXP_LOOT_Sign of the Earth|r
    .complete 782,1 --Sign of the Earth (1)
    .mob Boss Tho'grun
step
    #loop
    .goto 1418/0,-3013.72,-6142.64,0
    .goto 1418/0,-3013.72,-6142.64,40,0
    .goto 1418/0,-3091.33,-6064.21,40,0
    >>Loot the |cRXP_PICK_Magenta Cap Clusters|r for |cRXP_LOOT_Magenta Fungus Cap|r
    .complete 2202,1 --Magenta Fungus Cap (12)
    .isOnQuest 2202
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .accept 712 >>Accept Study of the Elements: Rock
    .target Lotwil Veriatus
    .isQuestTurnedIn 711 --any of: Study of the Elements: Rock
step
    #loop
    .goto 1418/0,-2215.48,-7165.67,0
    .goto 1418/0,-2215.48,-7165.67,40,0
    .goto 1418/0,-2153.79,-7213.10,40,0
    >>Kill |cRXP_ENEMY_Greater Rock Elementals|r. Loot them for |cRXP_LOOT_Bracers of Rock Binding|r
    .complete 712,1 --Bracers of Rock Binding (5)
    .mob Greater Rock Elemental
    .isOnQuest 712
step
    .goto 1418/0,-2724.67,-6633.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
    .turnin 712 >>Turn in Study of the Elements: Rock
    .target Lotwil Veriatus
    .isOnQuest 712
step
    .goto 1418/0,-2721.44,-6623.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lucien Tosselwrench|r
    .accept 716 >>Accept Stone Is Better than Cloth
    .target Lucien Tosselwrench
    .isQuestTurnedIn 712 --any of: Study of the Elements: Rock
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
    .isQuestTurnedIn 712 --Study of the Elements: Rock
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
    .isOnQuest 2202
step
    +|cRXP_WARN_End of the Badlands route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Stone Is Better than Cloth
]])
