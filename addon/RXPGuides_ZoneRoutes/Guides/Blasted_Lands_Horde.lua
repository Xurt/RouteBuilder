-- 46-55 Blasted Lands: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 2 parts (from level 46, 49).
-- Split into 2 guides, listed under "46 - 50 Blasted Lands" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Blasted Lands.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 46 - 50 Blasted Lands
#subweight -46
#name 46-47 Blasted Lands

step
    .goto 1419/0,-3097.57,-11285.80
    >>Click the |cRXP_PICK_Book|r
    .accept 81956 >>Accept Conjurer's Codex
step
    .goto 1419/0,-3100.92,-11285.80
    >>Open the |cRXP_PICK_Book|r. Loot it for |cRXP_LOOT_Conjurer's Codex|r
    .complete 81956,1 --Conjurer's Codex (1)
step
    .goto 1419/0,-2938.11,-10886.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bloodmage Lynnore|r
    .accept 2603 >>Accept Vulture's Vigor
    .target Bloodmage Lynnore
step
    #loop
    .goto 1419/0,-2859.72,-10965.09,0
    .goto 1419/0,-2859.72,-10965.09,40,0
    .goto 1419/0,-2841.96,-11007.08,40,0
    .goto 1419/0,-2870.44,-11114.28,40,0
    .goto 1419/0,-2841.96,-11092.17,40,0
    .goto 1419/0,-2764.91,-11043.93,40,0
    .goto 1419/0,-2796.07,-11013.33,40,0
    .goto 1419/0,-2809.47,-11004.40,40,0
    >>Kill |cRXP_ENEMY_Black Slayers|r and |cRXP_ENEMY_Bonepickers|r. Loot them for |cRXP_LOOT_Vulture Gizzard|r
    >>Kill |cRXP_ENEMY_Starving Snickerfangs|r, |cRXP_ENEMY_Snickerfang Hyenas|r and |cRXP_ENEMY_Ravages|r. Loot them for |cRXP_LOOT_Snickerfang Jowl|r
    .complete 2603,1 --Vulture Gizzard (10)
    .complete 2603,2 --Snickerfang Jowl (2)
    .mob Black Slayer
    .mob Bonepicker
    .mob Starving Snickerfang
    .mob Snickerfang Hyena
    .mob Ravage
step
    .goto 1419/0,-2938.11,-10886.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bloodmage Lynnore|r
    .turnin 2603 >>Turn in Vulture's Vigor
    .target Bloodmage Lynnore
step
    .goto 1419/0,-2983.00,-11362.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kum'isha the Collector|r
    .accept 3501 >>Accept Everything Counts In Large Amounts
    .target Kum'isha the Collector
step
    #loop
    .goto 1419/0,-3051.67,-10864.59,0
    .goto 1419/0,-3051.67,-10864.59,40,0
    .goto 1419/0,-3197.73,-10893.18,40,0
    .goto 1419/0,-3252.00,-10746.00,40,0
    .goto 1419/0,-3353.51,-10762.75,40,0
    .goto 1419/0,-3301.58,-10637.24,40,0
    .goto 1419/0,-3209.46,-10641.93,40,0
    .goto 1419/0,-3166.91,-10704.02,40,0
    .goto 1419/0,-3081.49,-10653.77,40,0
    .goto 1419/0,-3111.30,-10786.87,40,0
    >>Kill |cRXP_ENEMY_Dreadmaul Ogres|r, |cRXP_ENEMY_Dreadmaul Ogre Mages|r, |cRXP_ENEMY_Dreadmaul Brutes|r and |cRXP_ENEMY_Dreadmaul Maulers|r. Loot them for |cRXP_LOOT_Imperfect Draenethyst Fragment|r
    .complete 3501,1 --Imperfect Draenethyst Fragment (1)
    .mob Dreadmaul Ogre
    .mob Dreadmaul Ogre Mage
    .mob Dreadmaul Brute
    .mob Dreadmaul Mauler
step
    .goto 1419/0,-2983.00,-11362.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kum'isha the Collector|r
    .turnin 3501 >>Turn in Everything Counts In Large Amounts
    .accept 2521 >>Accept To Serve Kum'isha
    .target Kum'isha the Collector
step
    #loop
    .goto 1419/0,-3051.67,-10864.59,0
    .goto 1419/0,-3051.67,-10864.59,40,0
    .goto 1419/0,-3197.73,-10893.18,40,0
    .goto 1419/0,-3252.00,-10746.00,40,0
    .goto 1419/0,-3353.51,-10762.75,40,0
    .goto 1419/0,-3301.58,-10637.24,40,0
    .goto 1419/0,-3209.46,-10641.93,40,0
    .goto 1419/0,-3166.91,-10704.02,40,0
    .goto 1419/0,-3081.49,-10653.77,40,0
    .goto 1419/0,-3111.30,-10786.87,40,0
    >>Kill |cRXP_ENEMY_Dreadmaul Ogres|r, |cRXP_ENEMY_Dreadmaul Ogre Mages|r, |cRXP_ENEMY_Dreadmaul Brutes|r and |cRXP_ENEMY_Dreadmaul Maulers|r. Loot them for |cRXP_LOOT_Flawless Draenethyst Sphere|r
    .complete 2521,1 --Flawless Draenethyst Sphere (1)
    .mob Dreadmaul Ogre
    .mob Dreadmaul Ogre Mage
    .mob Dreadmaul Brute
    .mob Dreadmaul Mauler
step
    .goto 1419/0,-2983.00,-11362.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kum'isha the Collector|r
    .turnin 2521 >>Turn in To Serve Kum'isha
    .target Kum'isha the Collector
step
    .goto 1419/0,-3546.47,-11260.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spirit of Kirith|r
    .turnin 2721 >>Turn in Kirith
    .target Spirit of Kirith
    .isOnQuest 2721
step
    .goto 1419/0,-3546.47,-11260.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spirit of Kirith|r
    .accept 2743 >>Accept The Cover of Darkness
    .target Spirit of Kirith
    .isQuestTurnedIn 2721 --any of: Kirith
    .xp <45,1
step
    +|cRXP_WARN_That is all of Blasted Lands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Swamp of Sorrows|r: The Cover of Darkness
    >>|cRXP_FRIENDLY_Undercity|r: Conjurer's Codex
step
    +|cRXP_WARN_The rest of Blasted Lands is planned from level 49.|r Load its guide for level 49 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 46 - 50 Blasted Lands
#subweight -46
#name 49-50 Blasted Lands: around Bloodmage Drazial

step
    .goto 1419/0,-2935.09,-10883.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bloodmage Drazial|r
    .accept 2585 >>Accept The Decisive Striker
    .target Bloodmage Drazial
step
    #loop
    .goto 1419/0,-2916.67,-10910.60,0
    .goto 1419/0,-2916.67,-10910.60,40,0
    .goto 1419/0,-2916.67,-10982.07,40,0
    .goto 1419/0,-2903.27,-11098.20,40,0
    .goto 1419/0,-2842.97,-11089.27,40,0
    .goto 1419/0,-2796.07,-11066.93,40,0
    .goto 1419/0,-2722.37,-11008.87,40,0
    .goto 1419/0,-2775.97,-10964.20,40,0
    .goto 1419/0,-2816.17,-10937.40,40,0
    .goto 1419/0,-2849.67,-10986.53,40,0
    >>Kill |cRXP_ENEMY_Black Slayers|r and |cRXP_ENEMY_Bonepickers|r. Loot them for |cRXP_LOOT_Vulture Gizzard|r
    >>Kill |cRXP_ENEMY_Scorpok Stingers|r and |cRXP_ENEMY_Clack the Reavers|r. Loot them for |cRXP_LOOT_Scorpok Pincer|r
    .complete 2585,2 --Vulture Gizzard (2)
    .complete 2585,1 --Scorpok Pincer (3)
    .mob Black Slayer
    .mob Bonepicker
    .mob Scorpok Stinger
    .mob Clack the Reaver
step
    #loop
    .goto 1419/0,-2992.71,-11178.38,0
    .goto 1419/0,-2992.71,-11178.38,40,0
    .goto 1419/0,-3079.81,-11247.61,40,0
    .goto 1419/0,-3119.01,-11332.25,40,0
    .goto 1419/0,-3192.04,-11244.71,40,0
    .goto 1419/0,-3297.90,-11196.24,40,0
    .goto 1419/0,-3361.21,-11194.46,40,0
    .goto 1419/0,-3268.75,-11148.00,40,0
    .goto 1419/0,-3227.21,-11204.51,40,0
    .goto 1419/0,-3174.62,-11183.29,40,0
    >>Kill |cRXP_ENEMY_Ashmane Boars|r, |cRXP_ENEMY_Helboars|r and |cRXP_ENEMY_Grunters|r. Loot them for |cRXP_LOOT_Blasted Boar Lung|r
    .complete 2585,3 --Blasted Boar Lung (1)
    .mob Ashmane Boar
    .mob Helboar
    .mob Grunter
step
    .goto 1419/0,-2935.09,-10883.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bloodmage Drazial|r
    .turnin 2585 >>Turn in The Decisive Striker
    .accept 2581 >>Accept Snickerfang Jowls
    .target Bloodmage Drazial
step
    #loop
    .goto 1419/0,-2916.67,-10910.60,0
    .goto 1419/0,-2916.67,-10910.60,40,0
    .goto 1419/0,-2903.27,-10991.00,40,0
    .goto 1419/0,-2903.27,-11098.20,40,0
    .goto 1419/0,-2842.97,-11089.27,40,0
    .goto 1419/0,-2796.07,-11330.24,40,0
    .goto 1419/0,-2722.37,-11008.87,40,0
    .goto 1419/0,-2802.77,-11026.73,40,0
    .goto 1419/0,-2849.67,-10986.53,40,0
    .goto 1419/0,-2816.17,-10937.40,40,0
    >>Kill |cRXP_ENEMY_Scorpok Stingers|r and |cRXP_ENEMY_Clack the Reavers|r. Loot them for |cRXP_LOOT_Scorpok Pincer|r
    >>Kill |cRXP_ENEMY_Starving Snickerfangs|r, |cRXP_ENEMY_Snickerfang Hyenas|r and |cRXP_ENEMY_Ravages|r. Loot them for |cRXP_LOOT_Snickerfang Jowl|r
    .complete 2581,3 --Scorpok Pincer (1)
    .complete 2581,1 --Snickerfang Jowl (3)
    .mob Scorpok Stinger
    .mob Clack the Reaver
    .mob Starving Snickerfang
    .mob Snickerfang Hyena
    .mob Ravage
step
    #loop
    .goto 1419/0,-2992.71,-11178.38,0
    .goto 1419/0,-2992.71,-11178.38,40,0
    .goto 1419/0,-3079.81,-11247.61,40,0
    .goto 1419/0,-3119.01,-11332.25,40,0
    .goto 1419/0,-3192.04,-11244.71,40,0
    .goto 1419/0,-3297.90,-11196.24,40,0
    .goto 1419/0,-3361.21,-11194.46,40,0
    .goto 1419/0,-3268.75,-11148.00,40,0
    .goto 1419/0,-3227.21,-11204.51,40,0
    .goto 1419/0,-3174.62,-11183.29,40,0
    >>Kill |cRXP_ENEMY_Ashmane Boars|r, |cRXP_ENEMY_Helboars|r and |cRXP_ENEMY_Grunters|r. Loot them for |cRXP_LOOT_Blasted Boar Lung|r
    .complete 2581,2 --Blasted Boar Lung (2)
    .mob Ashmane Boar
    .mob Helboar
    .mob Grunter
step
    .goto 1419/0,-2935.09,-10883.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bloodmage Drazial|r
    .turnin 2581 >>Turn in Snickerfang Jowls
    .target Bloodmage Drazial
step
    .goto 1419/0,-2938.11,-10886.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bloodmage Lynnore|r
    .accept 2601 >>Accept The Basilisk's Bite
    .target Bloodmage Lynnore
step
    #loop
    .goto 1419/0,-2922.36,-11029.41,0
    .goto 1419/0,-2922.36,-11029.41,40,0
    .goto 1419/0,-2865.08,-11020.93,40,0
    .goto 1419/0,-2809.47,-11004.40,40,0
    .goto 1419/0,-2755.53,-10974.70,40,0
    .goto 1419/0,-2717.01,-11125.22,40,0
    .goto 1419/0,-2698.25,-11189.54,40,0
    .goto 1419/0,-2733.42,-11241.36,40,0
    .goto 1419/0,-2754.86,-11195.35,40,0
    .goto 1419/0,-2817.17,-11059.56,40,0
    >>Kill |cRXP_ENEMY_Black Slayers|r and |cRXP_ENEMY_Bonepickers|r. Loot them for |cRXP_LOOT_Vulture Gizzard|r
    >>Kill |cRXP_ENEMY_Redstone Basilisks|r, |cRXP_ENEMY_Redstone Crystalhides|r and |cRXP_ENEMY_Deatheyes|r. Loot them for |cRXP_LOOT_Basilisk Brain|r
    .complete 2601,2 --Vulture Gizzard (2)
    .complete 2601,1 --Basilisk Brain (10)
    .mob Black Slayer
    .mob Bonepicker
    .mob Redstone Basilisk
    .mob Redstone Crystalhide
    .mob Deatheye
step
    .goto 1419/0,-2938.11,-10886.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bloodmage Lynnore|r
    .turnin 2601 >>Turn in The Basilisk's Bite
    .target Bloodmage Lynnore
step
    .goto 1419/0,-2935.09,-10883.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bloodmage Drazial|r
    .accept 2583 >>Accept A Boar's Vitality
    .target Bloodmage Drazial
step
    #completewith Along11
    >>As you go: Kill |cRXP_ENEMY_Redstone Basilisks|r, |cRXP_ENEMY_Redstone Crystalhides|r and |cRXP_ENEMY_Deatheyes|r. Loot them for |cRXP_LOOT_Basilisk Brain|r. |cRXP_WARN_Anything left is finished later|r
    .complete 2583,3 --Basilisk Brain (1)
    .mob Redstone Basilisk
    .mob Redstone Crystalhide
    .mob Deatheye
step
    #label Along11
    #loop
    .goto 1419/0,-2916.67,-10910.60,0
    .goto 1419/0,-2916.67,-10910.60,40,0
    .goto 1419/0,-2903.27,-10964.20,40,0
    .goto 1419/0,-2903.27,-11026.73,40,0
    .goto 1419/0,-2903.27,-11098.20,40,0
    .goto 1419/0,-2842.97,-11089.27,40,0
    .goto 1419/0,-2796.07,-11066.93,40,0
    .goto 1419/0,-2722.37,-11008.87,40,0
    .goto 1419/0,-2775.97,-10964.20,40,0
    .goto 1419/0,-2849.67,-10986.53,40,0
    >>Kill |cRXP_ENEMY_Scorpok Stingers|r and |cRXP_ENEMY_Clack the Reavers|r. Loot them for |cRXP_LOOT_Scorpok Pincer|r
    .complete 2583,2 --Scorpok Pincer (2)
    .mob Scorpok Stinger
    .mob Clack the Reaver
step
    #loop
    .goto 1419/0,-2992.71,-11178.38,0
    .goto 1419/0,-2992.71,-11178.38,40,0
    .goto 1419/0,-3103.93,-11200.71,40,0
    .goto 1419/0,-3193.04,-11175.92,40,0
    .goto 1419/0,-3268.75,-11148.00,40,0
    .goto 1419/0,-3361.21,-11194.46,40,0
    .goto 1419/0,-3289.86,-11245.15,40,0
    .goto 1419/0,-3192.04,-11244.71,40,0
    .goto 1419/0,-3119.01,-11332.25,40,0
    .goto 1419/0,-3120.35,-11261.90,40,0
    >>Kill |cRXP_ENEMY_Ashmane Boars|r, |cRXP_ENEMY_Helboars|r and |cRXP_ENEMY_Grunters|r. Loot them for |cRXP_LOOT_Blasted Boar Lung|r
    >>Kill |cRXP_ENEMY_Redstone Basilisks|r, |cRXP_ENEMY_Redstone Crystalhides|r and |cRXP_ENEMY_Deatheyes|r. Loot them for |cRXP_LOOT_Basilisk Brain|r
    .complete 2583,1 --Blasted Boar Lung (3)
    .complete 2583,3 --Basilisk Brain (1)
    .mob Ashmane Boar
    .mob Helboar
    .mob Grunter
    .mob Redstone Basilisk
    .mob Redstone Crystalhide
    .mob Deatheye
step
    .goto 1419/0,-2935.09,-10883.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bloodmage Drazial|r
    .turnin 2583 >>Turn in A Boar's Vitality
    .target Bloodmage Drazial
step
    +|cRXP_WARN_End of the Blasted Lands route.|r
]])
