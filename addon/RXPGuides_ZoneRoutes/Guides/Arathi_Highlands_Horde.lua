-- 32-42 Arathi Highlands: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 5 parts (from level 32, 35, 38, 41, 44).
-- Split into 5 guides, listed under "32 - 45 Arathi Highlands" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Arathi Highlands.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 32 - 45 Arathi Highlands
#subweight -32
#name 32-33 Arathi Highlands: around Tor'gan

step
    .goto 1417/0,-3516.27,-1698.13
    >>Click the |cRXP_PICK_Scrolls|r
    .accept 79949 >>Accept A Web of Lies: Debunking Myths and Legends
step
    .goto 1417/0,-3509.43,-1018.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doctor Gregory Victor|r
    .accept 97539 >>Accept Silky Sutures
    .target Doctor Gregory Victor
step
    #completewith Drop635x1
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Witherbark Troll|r, |cRXP_ENEMY_Witherbark Shadowcaster|r, |cRXP_ENEMY_Witherbark Axe Thrower|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #loop
    .goto 1417/0,-2221.71,-1241.89,0
    .goto 1417/0,-2221.71,-1241.89,40,0
    .goto 1417/0,-2205.15,-1179.73,40,0
    .goto 1417/0,-2148.63,-1124.29,40,0
    .goto 1417/0,-2115.51,-1164.61,40,0
    .goto 1417/0,-1982.31,-1220.29,40,0
    .goto 1417/0,-1988.43,-1286.53,40,0
    .goto 1417/0,-2050.35,-1281.25,40,0
    .goto 1417/0,-2091.03,-1321.09,40,0
    .goto 1417/0,-2151.87,-1219.81,40,0
    >>Kill |cRXP_ENEMY_Boulderfist Ogres|r
    .complete 676,1 --Boulderfist Ogre slain (8)
    .mob Boulderfist Ogre
    .isOnQuest 676
step
    #label Drop635x1
    #loop
    .goto 1417/0,-2109.39,-1194.13,0
    .goto 1417/0,-2109.39,-1194.13,40,0
    .goto 1417/0,-2075.55,-1203.49,40,0
    .goto 1417/0,-2048.19,-1168.69,40,0
    .goto 1417/0,-1985.55,-1166.77,40,0
    .goto 1417/0,-2005.71,-1194.13,40,0
    .goto 1417/0,-2038.11,-1186.45,40,0
    .goto 1417/0,-2047.47,-1223.89,40,0
    .goto 1417/0,-2055.03,-1251.97,40,0
    .goto 1417/0,-2076.99,-1236.85,40,0
    >>Kill |cRXP_ENEMY_Boulderfist Enforcers|r
    .complete 676,2 --Boulderfist Enforcer slain (10)
    .mob Boulderfist Enforcer
    .isOnQuest 676
step
    .goto 1417/0,-3498.27,-918.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Urda|r
    .fp Hammerfall >> Get the Hammerfall flight path
    .target Urda
step
    .goto 1417/0,-2028.75,-2086.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shakes O'Breen|r
    .turnin 670 >>Turn in Sunken Treasure
    .target Shakes O'Breen
    .isOnQuest 670
step
    .goto 1417/0,-3539.31,-947.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drum Fel|r
    .turnin 676 >>Turn in The Hammer May Fall
    .target Drum Fel
    .isOnQuest 676
step
    .goto 1417/0,-3539.31,-947.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drum Fel|r
    .accept 677 >>Accept Call to Arms
    .target Drum Fel
step
    .goto 1417/0,-3524.91,-912.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Adegwa|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Adegwa
step
    .goto 1417/0,-3481.71,-947.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gor'mul|r
    .accept 655 >>Accept Hammerfall
    .target Gor'mul
step
    .goto 1417/0,-3556.59,-1004.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tor'gan|r
    .turnin 655 >>Turn in Hammerfall
    .accept 672 >>Accept Raising Spirits
    .accept 671 >>Accept Foul Magics
    .target Tor'gan
step << Hunter
    .goto 1417/0,-3360.75,-1034.05,0
    .goto 1417/0,-3101.91,-1068.13,0
    .goto 1417/0,-3334.47,-1372.69,0
    .goto 1417/0,-3360.75,-1034.05,40,0
    .goto 1417/0,-3101.91,-1068.13,40,0
    .goto 1417/0,-3334.47,-1372.69,40,0
    >>|cRXP_WARN_Cast|r |T132172:0|t[Eagle Eye] |cRXP_WARN_to try and find a |cRXP_ENEMY_Plains Creeper|r. Some of their locations are marked on your map|r
    >>|cRXP_WARN_Cast|r |T132164:0|t[Tame Beast] |cRXP_WARN_on a |cRXP_ENEMY_Plains Creeper|r to tame it|r
    .train 17265 >>|cRXP_WARN_Attack mobs with it to learn|r |T132278:0|t[Bite (Rank 5)]
    .zoneskip Arathi Highlands,1
step << Hunter
    .goto 1417/0,-3527.79,-928.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tharlidun|r
    .target Tharlidun
    .train 17265,3
    .zoneskip Arathi Highlands,1
step << Shaman
    .goto 1417/0,-3020.91,-795.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veyric Thunderhame|r
    .accept 79358 >>Accept Storm, Earth, and Fire
    .target Veyric Thunderhame
step << Shaman
    .goto 1417/0,-3020.91,-795.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veyric Thunderhame|r
    .turnin 79358 >>Turn in Storm, Earth, and Fire
    .target Veyric Thunderhame
    .isQuestComplete 79358
step
    #completewith Drop635x2
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Witherbark Troll|r, |cRXP_ENEMY_Witherbark Shadowcaster|r, |cRXP_ENEMY_Witherbark Axe Thrower|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #label Drop635x2
    #loop
    .goto 1417/0,-2115.87,-781.33,0
    .goto 1417/0,-2115.87,-781.33,40,0
    .goto 1417/0,-2078.43,-848.53,40,0
    .goto 1417/0,-2114.43,-893.89,40,0
    .goto 1417/0,-2010.75,-924.85,40,0
    .goto 1417/0,-2028.39,-812.53,40,0
    .goto 1417/0,-1970.79,-813.97,40,0
    .goto 1417/0,-1912.47,-814.45,40,0
    .goto 1417/0,-1957.47,-717.25,40,0
    .goto 1417/0,-2022.63,-741.73,40,0
    >>Kill |cRXP_ENEMY_Syndicate Highwaymans|r, |cRXP_ENEMY_Syndicate Pathstalkers|r and |cRXP_ENEMY_Syndicate Mercenaries|r. Loot them for |cRXP_LOOT_Bloodstone Amulet|r
    .complete 671,1 --Bloodstone Amulet (10)
    .mob Syndicate Highwayman
    .mob Syndicate Pathstalker
    .mob Syndicate Mercenary
step
    .goto 1417/0,-2093.19,-813.73,50,0
    .goto 1417/0,-2067.63,-767.17,50,0
    .goto 1417/0,-2011.11,-768.61,50,0
    .goto 1417/0,-1976.55,-793.09,50,0
    .goto 1417/0,-1983.03,-843.25,50,0
    .goto 1417/0,-2030.19,-874.21,50,0
    .goto 1417/0,-2067.63,-870.61,50,0
    .xp 32>> Grind to level 32
step
    .goto 1417/0,-1675.23,-714.37
    >>Click the |cRXP_PICK_Messenger Bag|r
    .turnin 79975 >>Turn in Eagle's Fist
    .isOnQuest 79975
step
    .goto 1417/0,-1675.23,-714.37
    >>Click the |cRXP_PICK_Messenger Bag|r
    .accept 79976 >>Accept This Must Be The Place
step
    .goto 1417/0,-1674.87,-714.37
    >>Click the |cRXP_PICK_Hastily Rolled-Up Satchel|r
    .turnin 79976 >>Turn in This Must Be The Place
step
    #loop
    .goto 1417/0,-2403.15,-841.09,0
    .goto 1417/0,-2403.15,-841.09,40,0
    .goto 1417/0,-2470.83,-892.69,40,0
    .goto 1417/0,-2592.15,-974.05,40,0
    .goto 1417/0,-2664.51,-987.25,40,0
    .goto 1417/0,-2748.39,-985.09,40,0
    .goto 1417/0,-2686.47,-1044.85,40,0
    .goto 1417/0,-2604.39,-1045.09,40,0
    .goto 1417/0,-2382.99,-1025.65,40,0
    .goto 1417/0,-2377.59,-952.45,40,0
    >>Kill |cRXP_ENEMY_Plains Creepers|r and |cRXP_ENEMY_Giant Plains Creepers|r. Loot them for |cRXP_LOOT_Surgical Spidersilk|r
    .complete 97539,1 --Surgical Spidersilk (12)
    .mob Plains Creeper
    .mob Giant Plains Creeper
step
    #loop
    .goto 1417/0,-2980.95,-1181.41,0
    .goto 1417/0,-2980.95,-1181.41,40,0
    .goto 1417/0,-3083.91,-1147.33,40,0
    .goto 1417/0,-3238.71,-975.97,40,0
    .goto 1417/0,-3380.91,-992.77,40,0
    .goto 1417/0,-3333.75,-1121.41,40,0
    .goto 1417/0,-3275.07,-1071.73,40,0
    .goto 1417/0,-3184.71,-1115.41,40,0
    .goto 1417/0,-3216.75,-1218.61,40,0
    .goto 1417/0,-3117.03,-1249.09,40,0
    >>Kill |cRXP_ENEMY_Highland Striders|r and |cRXP_ENEMY_Highland Thrashers|r. Loot them for |cRXP_LOOT_Highland Raptor Eye|r
    .complete 672,1 --Highland Raptor Eye (10)
    .mob Highland Strider
    .mob Highland Thrasher
step
    #completewith Drop635x3
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Witherbark Troll|r, |cRXP_ENEMY_Witherbark Shadowcaster|r, |cRXP_ENEMY_Witherbark Axe Thrower|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #completewith Along17
    >>As you go: Kill |cRXP_ENEMY_Witherbark Axe Throwers|r. |cRXP_WARN_Anything left is finished later|r
    .complete 677,1 --Witherbark Axe Thrower slain (10)
    .mob Witherbark Axe Thrower
step
    #label Along17
    #loop
    .goto 1417/0,-3215.67,-1787.65,0
    .goto 1417/0,-3215.67,-1787.65,40,0
    .goto 1417/0,-3196.95,-1852.69,40,0
    .goto 1417/0,-3188.67,-1886.29,40,0
    .goto 1417/0,-3207.39,-1894.69,40,0
    .goto 1417/0,-3312.51,-1978.45,40,0
    .goto 1417/0,-3284.07,-1897.81,40,0
    .goto 1417/0,-3252.39,-1856.29,40,0
    >>Kill |cRXP_ENEMY_Witherbark Witch Doctors|r
    .complete 677,3 --Witherbark Witch Doctor slain (8)
    .mob Witherbark Witch Doctor
step
    #loop
    .goto 1417/0,-3341.31,-1895.65,0
    .goto 1417/0,-3341.31,-1895.65,40,0
    .goto 1417/0,-3351.75,-1860.85,40,0
    .goto 1417/0,-3385.59,-1780.93,40,0
    .goto 1417/0,-3409.71,-1804.69,40,0
    .goto 1417/0,-3431.67,-1811.41,40,0
    .goto 1417/0,-3387.39,-1855.33,40,0
    .goto 1417/0,-3334.47,-1967.17,40,0
    .goto 1417/0,-3305.31,-1982.77,40,0
    >>Kill |cRXP_ENEMY_Witherbark Headhunters|r
    .complete 677,2 --Witherbark Headhunter slain (10)
    .mob Witherbark Headhunter
step
    #label Drop635x3
    #loop
    .goto 1417/0,-3215.67,-1755.49,0
    .goto 1417/0,-3215.67,-1755.49,40,0
    .goto 1417/0,-3151.59,-1742.77,40,0
    .goto 1417/0,-3226.83,-1681.09,40,0
    .goto 1417/0,-3254.19,-1687.09,40,0
    .goto 1417/0,-3270.75,-1661.89,40,0
    .goto 1417/0,-3274.35,-1614.13,40,0
    .goto 1417/0,-3321.87,-1590.13,40,0
    .goto 1417/0,-3414.39,-1585.57,40,0
    .goto 1417/0,-3417.99,-1613.17,40,0
    >>Kill |cRXP_ENEMY_Witherbark Axe Throwers|r
    .complete 677,1 --Witherbark Axe Thrower slain (10)
    .mob Witherbark Axe Thrower
step
    .goto 1417/0,-3556.59,-1004.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tor'gan|r
    .turnin 671 >>Turn in Foul Magics
    .turnin 672 >>Turn in Raising Spirits
    .accept 674 >>Accept Raising Spirits
    .target Tor'gan
step
    .goto 1417/0,-3481.71,-947.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gor'mul|r
    .turnin 674 >>Turn in Raising Spirits
    .accept 675 >>Accept Raising Spirits
    .target Gor'mul
step
    .goto 1417/0,-3556.59,-1004.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tor'gan|r
    .turnin 675 >>Turn in Raising Spirits
    .target Tor'gan
step
    .goto 1417/0,-3539.31,-947.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drum Fel|r
    .turnin 677 >>Turn in Call to Arms
    .target Drum Fel
step
    .goto 1417/0,-3524.91,-912.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Adegwa|r
    .target Innkeeper Adegwa
    .home >>Set your Hearthstone to Innkeeper Adegwa's inn
step
    .goto 1417/0,-3495.39,-918.13
    .fp Hammerfall >> Get the Hammerfall Flight Path
step
    .xp 32 >> AoE the Dabyrie Farmstead to 32
    >>Start saving the Wool Cloth and Silk Cloth you get. You need 12 stacks for later
step
    .xp 34 >> AoE the Dabyrie Farmstead to 34
    >>Start saving the Wool Cloth and Silk Cloth you get. You need 12 stacks for later
step
    .goto 1417/0,-3512.67,-832.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Horde Warbringer|r
    .accept 98887 >>Accept Conflict at Darkspear Islands
    .accept 98888 >>Accept Conflict at Darkspear Islands
    .target Horde Warbringer
step
    .goto 1417/0,-3512.67,-832.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Horde Warbringer|r
    .turnin 98887 >>Turn in Conflict at Darkspear Islands
    .target Horde Warbringer
    .isQuestComplete 98887
step
    .goto 1417/0,-3512.67,-832.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Horde Warbringer|r
    .turnin 98888 >>Turn in Conflict at Darkspear Islands
    .target Horde Warbringer
    .isQuestComplete 98888
step
    .goto 1417/0,-3116.67,-942.85
    >>Click the |cRXP_PICK_Shards of Myzrael|r
    .turnin 635 >>Turn in Crystal in the Mountains
    .isOnQuest 635
step
    .goto 1417/0,-3516.27,-1698.13
    >>Open the |cRXP_PICK_Scrolls|r. Loot it for |cRXP_LOOT_A Web of Lies: Debunking Myths and Legends|r
    .complete 79949,1 --A Web of Lies: Debunking Myths and Legends (1)
step
    #completewith next
    .hs >>Hearth to Innkeeper Adegwa's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1417/0,-3523.47,-948.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zengu|r
    .turnin 638 >>Turn in Trollbane
    .target Zengu
    .isOnQuest 638
step
    +|cRXP_WARN_That is all of Arathi Highlands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Undercity|r: A Web of Lies: Debunking Myths and Legends
    >>|cRXP_FRIENDLY_another zone|r: Silky Sutures
    >>|cRXP_FRIENDLY_Dustwallow Marsh, Swamp of Sorrows, Badlands, Desolace and back here|r: Storm, Earth, and Fire << Shaman
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Conflict at Darkspear Islands, Conflict at Darkspear Islands
step
    +|cRXP_WARN_The rest of Arathi Highlands is planned from level 35.|r Load its guide for level 35 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 32 - 45 Arathi Highlands
#subweight -32
#name 35-36 Arathi Highlands: around Tor'gan

step
    .goto 1417/0,-3116.67,-942.85
    >>Click the |cRXP_PICK_Shards of Myzrael|r
    .accept 642 >>Accept The Princess Trapped
step
    .goto 1417/0,-3539.31,-947.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drum Fel|r
    .accept 678 >>Accept Call to Arms
    .target Drum Fel
    .isQuestTurnedIn 677 --any of: Call to Arms
step
    .goto 1417/0,-3556.59,-1004.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tor'gan|r
    .accept 701 >>Accept Guile of the Raptor
    .target Tor'gan
    .isQuestTurnedIn 675 --any of: Raising Spirits
step
    #loop
    .goto 1417/0,-3812.19,-993.73,0
    .goto 1417/0,-3812.19,-993.73,40,0
    .goto 1417/0,-3840.27,-1044.13,40,0
    .goto 1417/0,-3887.07,-952.69,40,0
    .goto 1417/0,-3949.71,-928.45,40,0
    .goto 1417/0,-3999.75,-892.45,40,0
    .goto 1417/0,-3964.11,-859.09,40,0
    .goto 1417/0,-3934.23,-882.61,40,0
    .goto 1417/0,-3899.31,-827.17,40,0
    .goto 1417/0,-3869.79,-902.77,40,0
    >>Kill |cRXP_ENEMY_Drywhisker Kobolds|r, |cRXP_ENEMY_Drywhisker Surveyors|r and |cRXP_ENEMY_Drywhisker Diggers|r. Loot them for |cRXP_LOOT_Mote of Myzrael|r
    .complete 642,1 --Mote of Myzrael (12)
    .mob Drywhisker Kobold
    .mob Drywhisker Surveyor
    .mob Drywhisker Digger
step
    .goto 1417/0,-3901.83,-876.13
    >>Click the |cRXP_PICK_Iridescent Shards|r
    .turnin 642 >>Turn in The Princess Trapped
    .accept 651 >>Accept Stones of Binding
step
    .goto 1417/0,-3512.67,-832.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Horde Warbringer|r
    .turnin 98888 >>Turn in Conflict at Darkspear Islands
    .target Horde Warbringer
    .isQuestComplete 98888
step
    .goto 1417/0,-3512.67,-832.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Horde Warbringer|r
    .turnin 98887 >>Turn in Conflict at Darkspear Islands
    .target Horde Warbringer
    .isQuestComplete 98887
step
    .goto 1417/0,-3267.87,-846.61
    >>Open the |cRXP_PICK_Stone of East Binding|r. Loot it for |cRXP_LOOT_Cresting Key|r
    .complete 651,2 --Cresting Key (1)
step << Shaman
    .goto 1417/0,-3020.91,-795.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veyric Thunderhame|r
    .turnin 79358 >>Turn in Storm, Earth, and Fire
    .target Veyric Thunderhame
    .isQuestComplete 79358
step
    .goto 1417/0,-2740.11,-1350.85
    >>Open the |cRXP_PICK_Stone of Outer Binding|r. Loot it for |cRXP_LOOT_Thundering Key|r
    .complete 651,3 --Thundering Key (1)
step
    .goto 1417/0,-1783.23,-855.97
    >>Open the |cRXP_PICK_Stone of West Binding|r. Loot it for |cRXP_LOOT_Burning Key|r
    .complete 651,1 --Burning Key (1)
step
    .goto 1417/0,-2170.95,-1510.45
    >>Click the |cRXP_PICK_Stone of Inner Binding|r
    .turnin 651 >>Turn in Stones of Binding
step
    #loop
    .goto 1417/0,-2652.63,-1945.57,0
    .goto 1417/0,-2652.63,-1945.57,40,0
    .goto 1417/0,-2649.75,-2018.77,40,0
    .goto 1417/0,-2836.23,-2063.41,40,0
    .goto 1417/0,-2778.27,-1955.65,40,0
    .goto 1417/0,-2852.07,-1879.09,40,0
    .goto 1417/0,-2790.87,-1882.69,40,0
    .goto 1417/0,-2748.03,-1848.85,40,0
    .goto 1417/0,-2735.43,-1908.85,40,0
    .goto 1417/0,-2696.55,-1970.77,40,0
    >>Kill |cRXP_ENEMY_Boulderfist Brutes|r
    .complete 678,1 --Boulderfist Brute slain (10)
    .mob Boulderfist Brute
    .isOnQuest 678
step
    #loop
    .goto 1417/0,-2753.07,-1947.73,0
    .goto 1417/0,-2753.07,-1947.73,40,0
    .goto 1417/0,-2716.71,-2001.01,40,0
    .goto 1417/0,-2798.43,-2053.33,40,0
    .goto 1417/0,-2832.63,-2085.01,40,0
    .goto 1417/0,-2819.31,-1999.09,40,0
    .goto 1417/0,-2773.23,-1981.81,40,0
    .goto 1417/0,-2786.19,-1918.69,40,0
    .goto 1417/0,-2812.47,-1855.57,40,0
    >>Kill |cRXP_ENEMY_Boulderfist Magus|r
    .complete 678,2 --Boulderfist Magus slain (8)
    .mob Boulderfist Magus
    .isOnQuest 678
step
    #loop
    .goto 1417/0,-2668.47,-1823.41,0
    .goto 1417/0,-2668.47,-1823.41,40,0
    .goto 1417/0,-2705.55,-1783.33,40,0
    .goto 1417/0,-2680.35,-1753.33,40,0
    .goto 1417/0,-2510.43,-1972.93,40,0
    .goto 1417/0,-2507.91,-2041.33,40,0
    .goto 1417/0,-2595.03,-2111.89,40,0
    .goto 1417/0,-2576.31,-2069.17,40,0
    .goto 1417/0,-2552.91,-2022.85,40,0
    .goto 1417/0,-2580.27,-1938.37,40,0
    >>Kill |cRXP_ENEMY_Highland Fleshstalkers|r. Loot them for |cRXP_LOOT_Raptor Heart|r
    .complete 701,1 --Raptor Heart (12)
    .mob Highland Fleshstalker
    .isOnQuest 701
step
    .goto 1417/0,-3556.59,-1004.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tor'gan|r
    .turnin 701 >>Turn in Guile of the Raptor
    .target Tor'gan
    .isOnQuest 701
step
    .goto 1417/0,-3556.59,-1004.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tor'gan|r
    .accept 702 >>Accept Guile of the Raptor
    .target Tor'gan
    .isQuestTurnedIn 701 --any of: Guile of the Raptor
step
    .goto 1417/0,-3481.71,-947.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gor'mul|r
    .turnin 702 >>Turn in Guile of the Raptor
    .target Gor'mul
    .isOnQuest 702
step
    .goto 1417/0,-3539.31,-947.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drum Fel|r
    .turnin 678 >>Turn in Call to Arms
    .target Drum Fel
    .isOnQuest 678
step
    .goto 1417/0,-3524.91,-912.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Adegwa|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Adegwa
    .subzoneskip 321,1
step
    .goto 1417/0,-3481.71,-947.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gor'mul|r
    .accept 847 >>Accept Guile of the Raptor
    .target Gor'mul
    .isQuestTurnedIn 702 --any of: Guile of the Raptor
step
    .goto 1417/0,-3556.59,-1004.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tor'gan|r
    .turnin 847 >>Turn in Guile of the Raptor
    .target Tor'gan
    .isOnQuest 847
step
    .goto 1417/0,-3523.47,-948.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zengu|r
    .accept 639 >>Accept Sigil of Strom
    .target Zengu
step
    #loop
    .goto 1417/0,-1918.95,-1605.49,0
    .goto 1417/0,-1918.95,-1605.49,40,0
    .goto 1417/0,-1919.67,-1645.81,40,0
    .goto 1417/0,-1908.87,-1715.41,40,0
    .goto 1417/0,-1854.51,-1706.77,40,0
    .goto 1417/0,-1801.59,-1703.65,40,0
    .goto 1417/0,-1820.31,-1658.53,40,0
    .goto 1417/0,-1794.75,-1633.57,40,0
    .goto 1417/0,-1857.75,-1621.33,40,0
    .goto 1417/0,-1881.87,-1587.01,40,0
    >>Kill |cRXP_ENEMY_Syndicate Prowlers|r, |cRXP_ENEMY_Syndicate Conjurors|r and |cRXP_ENEMY_Syndicate Magus|r. Loot them for |cRXP_LOOT_Sigil of Strom|r
    .complete 639,1 --Sigil of Strom (1)
    .mob Syndicate Prowler
    .mob Syndicate Conjuror
    .mob Syndicate Magus
step
    .goto 1417/0,-3523.47,-948.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zengu|r
    .turnin 639 >>Turn in Sigil of Strom
    .target Zengu
step
    .goto 1417/0,-2010.75,-2117.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lolo the Lookout|r
    .accept 663 >>Accept Land Ho!
    .target Lolo the Lookout
step
    .goto 1417/0,-2028.75,-2086.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shakes O'Breen|r
    .turnin 663 >>Turn in Land Ho!
    .target Shakes O'Breen
step
    +|cRXP_WARN_The rest of Arathi Highlands is planned from level 38.|r Load its guide for level 38 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 32 - 45 Arathi Highlands
#subweight -32
#name 38-39 Arathi Highlands: around Zengu

step
    .goto 1417/0,-3512.67,-832.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Horde Warbringer|r
    .turnin 98888 >>Turn in Conflict at Darkspear Islands
    .target Horde Warbringer
    .isQuestComplete 98888
step
    .goto 1417/0,-3512.67,-832.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Horde Warbringer|r
    .turnin 98887 >>Turn in Conflict at Darkspear Islands
    .target Horde Warbringer
    .isQuestComplete 98887
step
    .goto 1417/0,-3524.91,-912.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Adegwa|r
    .target Innkeeper Adegwa
    .home >>Set your Hearthstone to Innkeeper Adegwa's inn
step
    .goto 1417/0,-3523.47,-948.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zengu|r
    .accept 640 >>Accept The Broken Sigil
    .target Zengu
    .isQuestTurnedIn 639 --any of: Sigil of Strom
step
    .goto 1417/0,-3556.59,-1004.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tor'gan|r
    .accept 673 >>Accept Foul Magics
    .target Tor'gan
    .isQuestTurnedIn 671 --any of: Foul Magics
step
    .goto 1417/0,-1932.99,-1644.61
    >>Kill |cRXP_ENEMY_Marez Cowl|r and loot |cRXP_LOOT_Befouled Bloodstone Orb|r
    .complete 673,1 --Befouled Bloodstone Orb (1)
    .mob Marez Cowl
    .isOnQuest 673
step
    #completewith next
    .hs >>Hearth to Innkeeper Adegwa's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1417/0,-3556.59,-1004.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tor'gan|r
    .turnin 673 >>Turn in Foul Magics
    .target Tor'gan
    .isOnQuest 673
step
    .goto 1417/0,-3539.31,-947.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drum Fel|r
    .accept 679 >>Accept Call to Arms
    .target Drum Fel
    .isQuestTurnedIn 678 --any of: Call to Arms
step
    .goto 1417/0,-3532.11,-927.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Korin Fel|r
    .accept 680 >>Accept The Real Threat
    .target Korin Fel
    .isQuestTurnedIn 678 --any of: Call to Arms
step << Shaman
    .goto 1417/0,-3020.91,-795.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veyric Thunderhame|r
    .turnin 79358 >>Turn in Storm, Earth, and Fire
    .target Veyric Thunderhame
    .isQuestComplete 79358
step
    .goto 1417/0,-1537.35,-1716.37
    >>Kill |cRXP_ENEMY_Or'Kalar|r and loot |cRXP_LOOT_Or'Kalar's Head|r
    .complete 680,1 --Or'Kalar's Head (1)
    .mob Or'Kalar
    .isOnQuest 680
step
    #loop
    .goto 1417/0,-1539.15,-1730.29,0
    .goto 1417/0,-1539.15,-1730.29,40,0
    .goto 1417/0,-1518.27,-1774.45,40,0
    .goto 1417/0,-1594.95,-1792.69,40,0
    .goto 1417/0,-1642.47,-1773.97,40,0
    .goto 1417/0,-1643.19,-1740.37,40,0
    .goto 1417/0,-1619.79,-1751.89,40,0
    .goto 1417/0,-1585.59,-1753.57,40,0
    .goto 1417/0,-1617.99,-1709.65,40,0
    .goto 1417/0,-1568.31,-1684.21,40,0
    >>Kill |cRXP_ENEMY_Boulderfist Shamans|r
    .complete 679,1 --Boulderfist Shaman slain (7)
    .mob Boulderfist Shaman
    .isOnQuest 679
step
    #loop
    .goto 1417/0,-1558.59,-1757.17,0
    .goto 1417/0,-1558.59,-1757.17,40,0
    .goto 1417/0,-1584.15,-1710.61,40,0
    .goto 1417/0,-1548.51,-1715.65,40,0
    .goto 1417/0,-1522.95,-1750.69,40,0
    .goto 1417/0,-1509.27,-1765.57,40,0
    .goto 1417/0,-1515.39,-1790.29,40,0
    .goto 1417/0,-1537.35,-1795.09,40,0
    .goto 1417/0,-1569.03,-1790.77,40,0
    .goto 1417/0,-1609.35,-1772.05,40,0
    >>Kill |cRXP_ENEMY_Boulderfist Lords|r
    .complete 679,2 --Boulderfist Lord slain (3)
    .mob Boulderfist Lord
    .isOnQuest 679
step
    .goto 1417/0,-3539.31,-947.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drum Fel|r
    .turnin 679 >>Turn in Call to Arms
    .target Drum Fel
    .isOnQuest 679
step
    .goto 1417/0,-3532.11,-927.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Korin Fel|r
    .turnin 680 >>Turn in The Real Threat
    .target Korin Fel
    .isOnQuest 680
step
    #loop
    .goto 1417/0,-1907.07,-1546.69,0
    .goto 1417/0,-1907.07,-1546.69,40,0
    .goto 1417/0,-1831.11,-1533.01,40,0
    .goto 1417/0,-1761.99,-1504.93,40,0
    .goto 1417/0,-1722.75,-1503.97,40,0
    .goto 1417/0,-1689.63,-1528.21,40,0
    .goto 1417/0,-1628.79,-1586.05,40,0
    .goto 1417/0,-1660.83,-1645.09,40,0
    .goto 1417/0,-1708.71,-1633.09,40,0
    .goto 1417/0,-1726.71,-1587.01,40,0
    >>Kill |cRXP_ENEMY_Stromgarde Troll Hunters|r, |cRXP_ENEMY_Stromgarde Defenders|r and |cRXP_ENEMY_Stromgarde Vindicators|r. Loot them for |cRXP_LOOT_Sigil Fragment|r
    .complete 640,1 --Sigil Fragment (11)
    .mob Stromgarde Troll Hunter
    .mob Stromgarde Defender
    .mob Stromgarde Vindicator
    .isOnQuest 640
step
    .goto 1417/0,-2047.47,-2088.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_First Mate Nilzlix|r
    .accept 662 >>Accept Deep Sea Salvage
    .target First Mate Nilzlix
    .isQuestTurnedIn 663 --any of: Land Ho!
step
    .goto 1417/0,-2090.67,-2072.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Steelgut|r
    .accept 664 >>Accept Drowned Sorrows
    .target Captain Steelgut
    .isQuestTurnedIn 663 --any of: Land Ho!
step
    .goto 1417/0,-2085.99,-2066.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Professor Phizzlethorpe|r
    .accept 665 >>Accept Sunken Treasure
    .target Professor Phizzlethorpe
    .isQuestTurnedIn 663 --any of: Land Ho!
step
    .goto 1417/0,-2085.99,-2067.73
    >>Defend Professor Phizzlethorpe
    .complete 665,1 --Defend Professor Phizzlethorpe
    .isOnQuest 665
step
    .goto 1417/0,-2085.63,-2064.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doctor Draxlegauge|r
    .turnin 665 >>Turn in Sunken Treasure
    .target Doctor Draxlegauge
    .isOnQuest 665
step
    .goto 1417/0,-2085.63,-2064.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doctor Draxlegauge|r
    .accept 666 >>Accept Sunken Treasure
    .target Doctor Draxlegauge
    .isQuestTurnedIn 665 --any of: Sunken Treasure
step
    .goto 1417/0,-1708.71,-2175.49
    >>Pick up |cRXP_PICK_Maiden's Folly Log|r from the ground
    .complete 662,2 --Maiden's Folly Log (1)
    .isOnQuest 662
step
    .goto 1417/0,-1696.47,-2161.57
    >>Pick up |cRXP_PICK_Maiden's Folly Charts|r from the ground
    .complete 662,1 --Maiden's Folly Charts (1)
    .isOnQuest 662
step
    .goto 1417/0,-1603.23,-2187.97
    >>Pick up |cRXP_PICK_Spirit of Silverpine Charts|r from the ground
    .complete 662,3 --Spirit of Silverpine Charts (1)
    .isOnQuest 662
step
    .goto 1417/0,-1610.07,-2175.73
    >>Pick up |cRXP_PICK_Spirit of Silverpine Log|r from the ground
    .complete 662,4 --Spirit of Silverpine Log (1)
    .isOnQuest 662
step
    #loop
    .goto 1417/0,-1586.67,-2173.33,0
    .goto 1417/0,-1586.67,-2173.33,40,0
    .goto 1417/0,-1514.67,-2269.33,40,0
    .goto 1417/0,-1622.67,-2341.33,40,0
    .goto 1417/0,-1694.67,-2341.33,40,0
    .goto 1417/0,-1766.67,-2317.33,40,0
    .goto 1417/0,-1766.67,-2221.33,40,0
    .goto 1417/0,-1694.67,-2245.33,40,0
    .goto 1417/0,-1694.67,-2149.33,40,0
    .goto 1417/0,-1622.67,-2221.33,40,0
    >>Loot the |cRXP_PICK_Calcified Elven Gems|r for |cRXP_LOOT_Elven Gem|r
    .complete 666,1 --Elven Gem (10)
    .isOnQuest 666
step
    #loop
    .goto 1417/0,-1680.63,-2215.57,0
    .goto 1417/0,-1680.63,-2215.57,40,0
    .goto 1417/0,-1656.15,-2147.41,40,0
    .goto 1417/0,-1553.19,-2145.97,40,0
    .goto 1417/0,-1589.19,-2219.65,40,0
    .goto 1417/0,-1624.47,-2294.29,40,0
    .goto 1417/0,-1694.31,-2301.49,40,0
    .goto 1417/0,-1785.39,-2326.69,40,0
    .goto 1417/0,-1735.71,-2257.57,40,0
    .goto 1417/0,-1781.79,-2178.85,40,0
    >>Kill |cRXP_ENEMY_Daggerspine Raiders|r
    .complete 664,1 --Daggerspine Raider slain (10)
    .mob Daggerspine Raider
    .isOnQuest 664
step
    #loop
    .goto 1417/0,-1685.31,-2164.45,0
    .goto 1417/0,-1685.31,-2164.45,40,0
    .goto 1417/0,-1721.67,-2169.49,40,0
    .goto 1417/0,-1610.07,-2173.33,40,0
    .goto 1417/0,-1632.39,-2151.25,40,0
    >>Kill |cRXP_ENEMY_Daggerspine Sorceress|r
    .complete 664,2 --Daggerspine Sorceress slain (3)
    .mob Daggerspine Sorceress
    .isOnQuest 664
step
    .goto 1417/0,-2047.47,-2088.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_First Mate Nilzlix|r
    .turnin 662 >>Turn in Deep Sea Salvage
    .target First Mate Nilzlix
    .isOnQuest 662
step
    .goto 1417/0,-2085.63,-2064.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doctor Draxlegauge|r
    .turnin 666 >>Turn in Sunken Treasure
    .target Doctor Draxlegauge
    .isOnQuest 666
step
    .goto 1417/0,-2085.63,-2064.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doctor Draxlegauge|r
    .accept 668 >>Accept Sunken Treasure
    .target Doctor Draxlegauge
    .isQuestTurnedIn 666 --any of: Sunken Treasure
step
    .goto 1417/0,-2090.67,-2072.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Steelgut|r
    .turnin 664 >>Turn in Drowned Sorrows
    .target Captain Steelgut
    .isOnQuest 664
step
    .goto 1417/0,-2028.75,-2086.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shakes O'Breen|r
    .turnin 668 >>Turn in Sunken Treasure
    .target Shakes O'Breen
    .isOnQuest 668
step
    .goto 1417/0,-2028.75,-2086.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shakes O'Breen|r
    .accept 669 >>Accept Sunken Treasure
    .target Shakes O'Breen
    .isQuestTurnedIn 668 --any of: Sunken Treasure
step
    .goto 1417/0,-3556.59,-1004.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tor'gan|r
    .turnin 640 >>Turn in The Broken Sigil
    .target Tor'gan
    .isOnQuest 640
step
    .goto 1417/0,-3556.59,-1004.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tor'gan|r
    .accept 641 >>Accept Sigil of Thoradin
    .target Tor'gan
    .isQuestTurnedIn 640 --any of: The Broken Sigil
step
    .goto 1417/0,-3523.47,-948.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zengu|r
    .turnin 641 >>Turn in Sigil of Thoradin
    .target Zengu
    .isOnQuest 641
step
    .goto 1417/0,-3523.47,-948.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zengu|r
    .accept 643 >>Accept Sigil of Arathor
    .target Zengu
    .isQuestTurnedIn 641 --any of: Sigil of Thoradin
step
    .goto 1417/0,-2071.59,-1383.25
    >>Kill |cRXP_ENEMY_Lieutenant Valorcall|r and loot |cRXP_LOOT_Sigil of Arathor|r
    .complete 643,1 --Sigil of Arathor (1)
    .mob Lieutenant Valorcall
    .isOnQuest 643
step
    #completewith next
    .hs >>Hearth to Innkeeper Adegwa's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1417/0,-3523.47,-948.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zengu|r
    .turnin 643 >>Turn in Sigil of Arathor
    .target Zengu
    .isOnQuest 643
step
    +|cRXP_WARN_That is all of Arathi Highlands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Stranglethorn Vale|r: Sunken Treasure
step
    +|cRXP_WARN_The rest of Arathi Highlands is planned from level 41.|r Load its guide for level 41 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 32 - 45 Arathi Highlands
#subweight -32
#name 41-42 Arathi Highlands

step
    .goto 1417/0,-3512.67,-832.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Horde Warbringer|r
    .turnin 98887 >>Turn in Conflict at Darkspear Islands
    .target Horde Warbringer
    .isQuestComplete 98887
step
    .goto 1417/0,-3512.67,-832.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Horde Warbringer|r
    .turnin 98888 >>Turn in Conflict at Darkspear Islands
    .target Horde Warbringer
    .isQuestComplete 98888
step << Shaman
    .goto 1417/0,-3020.91,-795.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veyric Thunderhame|r
    .turnin 79358 >>Turn in Storm, Earth, and Fire
    .target Veyric Thunderhame
    .isQuestComplete 79358
step
    .goto 1417/0,-2170.95,-1510.45
    >>Click the |cRXP_PICK_Stone of Inner Binding|r
    .accept 652 >>Accept Breaking the Keystone
    .isQuestTurnedIn 651 --any of: Stones of Binding
step
    .goto 1417/0,-3167.07,-853.33
    >>Kill |cRXP_ENEMY_Fozruk|r and loot |cRXP_LOOT_Rod of Order|r
    .complete 652,1 --Rod of Order (1)
    .mob Fozruk
    .isOnQuest 652
step
    .goto 1417/0,-2165.55,-1527.49
    >>Click the |cRXP_PICK_Keystone|r
    .turnin 652 >>Turn in Breaking the Keystone
    .isOnQuest 652
step
    .goto 1417/0,-2165.55,-1527.49
    >>Click the |cRXP_PICK_Keystone|r
    .accept 688 >>Accept Myzrael's Allies
    .isQuestTurnedIn 652 --any of: Breaking the Keystone
step
    .goto 1417/0,-2028.75,-2086.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shakes O'Breen|r
    .accept 667 >>Accept Death From Below
    .target Shakes O'Breen
    .isQuestTurnedIn 670 --any of: Sunken Treasure
    .xp <35,1
step
    .goto 1417/0,-2016.15,-2097.01
    >>Defend Shakes O'Breen
    .complete 667,1 --Defend Shakes O'Breen
    .isOnQuest 667
step
    .goto 1417/0,-2028.75,-2086.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shakes O'Breen|r
    .turnin 667 >>Turn in Death From Below
    .target Shakes O'Breen
    .isOnQuest 667
step
    .goto 1417/0,-3550.11,-988.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zaruk|r
    .turnin 688 >>Turn in Myzrael's Allies
    .target Zaruk
    .isOnQuest 688
step
    .goto 1417/0,-3550.11,-988.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zaruk|r
    .accept 687 >>Accept Theldurin the Lost
    .target Zaruk
    .isQuestTurnedIn 653,688 --any of: Myzrael's Allies, Myzrael's Allies
step
    +|cRXP_WARN_That is all of Arathi Highlands for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Badlands|r: Theldurin the Lost
step
    +|cRXP_WARN_The rest of Arathi Highlands is planned from level 44.|r Load its guide for level 44 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 32 - 45 Arathi Highlands
#subweight -32
#name 44-45 Arathi Highlands

step
    .goto 1417/0,-3523.47,-948.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zengu|r
    .accept 644 >>Accept Sigil of Trollbane
    .target Zengu
    .isQuestTurnedIn 643 --any of: Sigil of Arathor
step
    .goto 1417/0,-3512.67,-832.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Horde Warbringer|r
    .turnin 98888 >>Turn in Conflict at Darkspear Islands
    .target Horde Warbringer
    .isQuestComplete 98888
step
    .goto 1417/0,-3512.67,-832.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Horde Warbringer|r
    .turnin 98887 >>Turn in Conflict at Darkspear Islands
    .target Horde Warbringer
    .isQuestComplete 98887
step << Shaman
    .goto 1417/0,-3020.91,-795.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veyric Thunderhame|r
    .turnin 79358 >>Turn in Storm, Earth, and Fire
    .target Veyric Thunderhame
    .isQuestComplete 79358
step
    .goto 1417/0,-1887.63,-1527.97
    >>Kill |cRXP_ENEMY_Prince Galen Trollbane|r and loot |cRXP_LOOT_Sigil of Trollbane|r
    .complete 644,1 --Sigil of Trollbane (1)
    .mob Prince Galen Trollbane
    .isOnQuest 644
step
    .goto 1417/0,-3523.47,-948.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zengu|r
    .turnin 644 >>Turn in Sigil of Trollbane
    .target Zengu
    .isOnQuest 644
step
    .goto 1417/0,-3523.47,-948.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zengu|r
    .accept 645 >>Accept Trol'kalar
    .target Zengu
    .isQuestTurnedIn 644 --any of: Sigil of Trollbane
step
    .goto 1417/0,-1905.63,-1564.21
    >>Click the |cRXP_PICK_Trollbane's Tomb|r
    .turnin 645 >>Turn in Trol'kalar
    .isOnQuest 645
step
    .goto 1417/0,-1905.63,-1564.21
    >>Click the |cRXP_PICK_Trollbane's Tomb|r
    .accept 646 >>Accept Trol'kalar
    .isQuestTurnedIn 645 --any of: Trol'kalar
step
    .goto 1417/0,-3523.47,-948.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zengu|r
    .turnin 646 >>Turn in Trol'kalar
    .target Zengu
    .isOnQuest 646
step
    +|cRXP_WARN_End of the Arathi Highlands route.|r
]])
