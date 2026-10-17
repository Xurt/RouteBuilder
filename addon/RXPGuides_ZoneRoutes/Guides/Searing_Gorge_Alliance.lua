-- 45-52 Searing Gorge: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 3 parts (from level 45, 48, 51).
-- Split into 3 guides, listed under "45 - 52 Searing Gorge" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Searing Gorge.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 45 - 52 Searing Gorge
#subweight -45
#name 45-46 Searing Gorge

step
    .goto 1427/0,-1166.33,-6833.34
    >>Click the |cRXP_PICK_Book|r
    .accept 81955 >>Accept A Mind of Metal
step
    .goto 1427/0,-1168.56,-6837.80
    >>Open the |cRXP_PICK_Book|r. Loot it for |cRXP_LOOT_A Mind of Metal|r
    .complete 81955,1 --A Mind of Metal (1)
step
    .goto 1427/0,-1162.98,-6493.74
    >>Click the |cRXP_PICK_Wanted/Missing/Lost & Found|r
    .accept 7728 >>Accept STOLEN: Smithing Tuyere and Lookout's Spyglass
    .accept 7729 >>Accept JOB OPPORTUNITY: Culling the Competition
step
    >>Talk to |cRXP_FRIENDLY_Hansel|r and |cRXP_FRIENDLY_Burninate|r
    .target +Hansel Heavyhands
    .goto 1427/0,-1183.73,-6513.67
    .vendor 14624 >> Vendor Trash. Repair
    >>|cRXP_BUY_Buy some|r |T134712:0|t[Morning Glory Dew] |cRXP_BUY_and|r |T133971:0|t[Roasted Quail] |cRXP_BUY_from him|r
    .collect 8766,160,82,1
    .collect 8952,160,82,1
    .goto 1427/0,-1188.64,-6523.94
    .target +Master Smith Burninate
step
    .goto 1427/0,-1169.45,-6559.19
    >>Talk to |cRXP_FRIENDLY_Lanie|r
    .fp Thorium Point >> Get the Thorium Point flight path
    .target Lanie Reed
step
    .goto 1427/0,-1194.44,-6679.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kalaran Windblade|r
    .accept 3441 >>Accept Divine Retribution
    .target Kalaran Windblade
step
    .goto 1427/0,-1194.44,-6679.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kalaran Windblade|r
    .complete 3441,1 --Kalaran Windblade (10)
    .target Kalaran Windblade
step
    .goto 1427/0,-1194.44,-6679.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kalaran Windblade|r
    .turnin 3441 >>Turn in Divine Retribution
    .accept 3442 >>Accept The Flawless Flame
    .target Kalaran Windblade
step
    #loop
    .goto 1427/0,-1230.81,-6646.36,0
    .goto 1427/0,-1230.81,-6646.36,40,0
    .goto 1427/0,-1270.97,-6674.32,40,0
    .goto 1427/0,-1359.33,-6665.40,40,0
    .goto 1427/0,-1458.62,-6675.81,40,0
    .goto 1427/0,-1394.59,-6835.42,40,0
    .goto 1427/0,-1337.91,-6811.17,40,0
    .goto 1427/0,-1344.83,-6718.95,40,0
    .goto 1427/0,-1288.16,-6754.80,40,0
    .goto 1427/0,-1252.46,-6715.68,40,0
    >>Kill |cRXP_ENEMY_Blazing Elementals|r, |cRXP_ENEMY_Inferno Elementals|r and |cRXP_ENEMY_Magma Elementals|r. Loot them for |cRXP_LOOT_Heart of Flame|r
    >>Kill |cRXP_ENEMY_Tempered War Golems|r, |cRXP_ENEMY_Heavy War Golems|r and |cRXP_ENEMY_Magma Elementals|r. Loot them for |cRXP_LOOT_Golem Oil|r
    .complete 3442,1 --Heart of Flame (4)
    .complete 3442,2 --Golem Oil (1)
    .mob Blazing Elemental
    .mob Inferno Elemental
    .mob Magma Elemental
    .mob Tempered War Golem
    .mob Heavy War Golem
step
    .goto 1427/0,-1194.44,-6679.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kalaran Windblade|r
    .turnin 3442 >>Turn in The Flawless Flame
    .accept 3443 >>Accept Forging the Shaft
    .target Kalaran Windblade
step
    #completewith Drop4451x1
    >>|cRXP_LOOT_Grimesilt Outhouse Key|r can drop from |cRXP_ENEMY_Dark Iron Steamsmith|r, |cRXP_ENEMY_Dark Iron Slaver|r, |cRXP_ENEMY_Dark Iron Taskmaster|r. Use it to start the quest if you get one
    .collect 11818,1,4451 --Grimesilt Outhouse Key (1)
    .accept 4451 >>Accept The Key to Freedom
    .use 11818
step
    #completewith Along13
    >>As you go: Kill |cRXP_ENEMY_Dark Iron Geologists|r, |cRXP_ENEMY_Dark Iron Steamsmiths|r, |cRXP_ENEMY_Slave Workers|r and |cRXP_ENEMY_Dark Iron Slavers|r. Loot them for |cRXP_LOOT_Thorium Plated Dagger|r. |cRXP_WARN_Anything left is finished later|r
    .complete 3443,1 --Thorium Plated Dagger (8)
    .mob Dark Iron Geologist
    .mob Dark Iron Steamsmith
    .mob Slave Worker
    .mob Dark Iron Slaver
step
    #label Drop4451x1
    #loop
    .goto 1427/0,-1276.55,-6641.00,0
    .goto 1427/0,-1276.55,-6641.00,40,0
    .goto 1427/0,-1285.03,-6700.50,40,0
    .goto 1427/0,-1345.50,-6682.65,40,0
    .goto 1427/0,-1422.03,-6685.18,40,0
    .goto 1427/0,-1347.73,-6527.80,40,0
    .goto 1427/0,-1363.35,-6478.72,40,0
    .goto 1427/0,-1288.82,-6520.07,40,0
    .goto 1427/0,-1220.99,-6576.59,40,0
    .goto 1427/0,-1303.77,-6600.69,40,0
    >>Kill |cRXP_ENEMY_Dark Iron Taskmasters|r
    >>Kill |cRXP_ENEMY_Dark Iron Slavers|r
    .complete 7729,1 --Dark Iron Taskmaster slain (15)
    .complete 7729,2 --Dark Iron Slaver slain (15)
    .mob Dark Iron Taskmaster
    .mob Dark Iron Slaver
step
    .goto 1427/0,-1963.33,-7324.36
    >>Kill |cRXP_ENEMY_Margol the Rager|r and loot |cRXP_LOOT_Margol's Horn|r. Use it to start the quest
    .collect 10000,1,3181 --Margol's Horn (1)
    .accept 3181 >>Accept The Horn of the Beast
    .use 10000
    .mob Margol the Rager
step
    .goto 1427/0,-1786.39,-7024.78
    >>Click the |cRXP_PICK_Wooden Outhouse|r
    .accept 4449 >>Accept Caught!
step
    #loop
    .goto 1427/0,-1748.69,-6998.30,0
    .goto 1427/0,-1748.69,-6998.30,40,0
    .goto 1427/0,-1743.33,-6981.49,40,0
    .goto 1427/0,-1412.88,-6918.87,40,0
    .goto 1427/0,-1723.25,-7026.27,40,0
    .goto 1427/0,-1731.73,-7012.43,40,0
    >>Kill |cRXP_ENEMY_Dark Iron Geologists|r
    >>Open the |cRXP_PICK_Solid Chest|r. Loot it for |cRXP_LOOT_Silk Cloth|r
    .complete 4449,1 --Dark Iron Geologist slain (8)
    .complete 4449,2 --Silk Cloth (1)
    .mob Dark Iron Geologist
step
    .goto 1427/0,-1786.39,-7024.78
    >>Click the |cRXP_PICK_Wooden Outhouse|r
    .turnin 4449 >>Turn in Caught!
    .accept 4450 >>Accept Ledger from Tanaris
step
    #completewith Along13
    >>As you go: Pick up |cRXP_PICK_Goodsteel Ledger|r from the ground. |cRXP_WARN_Anything left is finished later|r
    .complete 4450,1 --Goodsteel Ledger (1)
step
    #label Along13
    .goto 1427/0,-1749.13,-7007.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dorius Stonetender|r
    .accept 3367 >>Accept Suntara Stones
    .target Dorius Stonetender
step
    #completewith Along15
    >>As you go: Kill |cRXP_ENEMY_Glassweb Spider|r and loot |cRXP_LOOT_Solid Crystal Leg Shaft|r. |cRXP_WARN_Anything left is finished later|r
    .complete 4450,2 --Solid Crystal Leg Shaft (1)
    .mob Glassweb Spider
step
    .goto 1427/0,-1984.53,-6389.17
    >>Dorius Escort
    .complete 3367,1 --Dorius Escort
step
    #label Along15
    .goto 1427/0,-1984.08,-6386.94
    >>Click the |cRXP_PICK_Singed Letter|r
    .turnin 3367 >>Turn in Suntara Stones
    .accept 3368 >>Accept Suntara Stones
step
    #loop
    .goto 1427/0,-1795.76,-6612.59,0
    .goto 1427/0,-1795.76,-6612.59,40,0
    .goto 1427/0,-1772.78,-6669.12,40,0
    .goto 1427/0,-1839.05,-6674.62,40,0
    >>Kill |cRXP_ENEMY_Glassweb Spider|r and loot |cRXP_LOOT_Solid Crystal Leg Shaft|r
    .complete 4450,2 --Solid Crystal Leg Shaft (1)
    .mob Glassweb Spider
step
    #completewith Drop4451x2
    >>|cRXP_LOOT_Grimesilt Outhouse Key|r can drop from |cRXP_ENEMY_Dark Iron Steamsmith|r, |cRXP_ENEMY_Dark Iron Slaver|r, |cRXP_ENEMY_Dark Iron Taskmaster|r. Use it to start the quest if you get one
    .collect 11818,1,4451 --Grimesilt Outhouse Key (1)
    .accept 4451 >>Accept The Key to Freedom
    .use 11818
step
    #completewith Along19
    >>As you go: Kill |cRXP_ENEMY_Dark Iron Geologists|r, |cRXP_ENEMY_Dark Iron Steamsmiths|r, |cRXP_ENEMY_Slave Workers|r and |cRXP_ENEMY_Dark Iron Slavers|r. Loot them for |cRXP_LOOT_Thorium Plated Dagger|r. |cRXP_WARN_Anything left is finished later|r
    .complete 3443,1 --Thorium Plated Dagger (8)
    .mob Dark Iron Geologist
    .mob Dark Iron Steamsmith
    .mob Slave Worker
    .mob Dark Iron Slaver
step
    #loop
    .goto 1427/0,-1151.16,-7004.40,0
    .goto 1427/0,-1151.16,-7004.40,40,0
    .goto 1427/0,-1107.20,-7024.03,40,0
    .goto 1427/0,-1050.97,-6925.86,40,0
    >>Kill |cRXP_ENEMY_Dark Iron Lookout|r and loot |cRXP_LOOT_Lookout's Spyglass|r
    .complete 7728,2 --Lookout's Spyglass (1)
    .mob Dark Iron Lookout
step
    #label Drop4451x2
    #loop
    .goto 1427/0,-1174.14,-6863.98,0
    .goto 1427/0,-1174.14,-6863.98,40,0
    .goto 1427/0,-1163.87,-6838.54,40,0
    .goto 1427/0,-1228.36,-6836.01,40,0
    .goto 1427/0,-1281.91,-6868.74,40,0
    >>Kill |cRXP_ENEMY_Dark Iron Steamsmith|r and loot |cRXP_LOOT_Smithing Tuyere|r
    .complete 7728,1 --Smithing Tuyere (1)
    .mob Dark Iron Steamsmith
step
    #label Along19
    .goto 1427/0,-1192.43,-6509.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Taskmaster Scrange|r
    .turnin 7728 >>Turn in STOLEN: Smithing Tuyere and Lookout's Spyglass
    .turnin 7729 >>Turn in JOB OPPORTUNITY: Culling the Competition
    .target Taskmaster Scrange
step
    >>Talk to |cRXP_FRIENDLY_Hansel|r, |cRXP_FRIENDLY_Scrange|r, and |cRXP_FRIENDLY_Burninate|r
    .target +Hansel Heavyhands
    .goto 1427/0,-1183.73,-6513.67
    .target +Taskmaster Scrange
    .goto 1427/0,-1192.66,-6509.06
    .vendor 14624 >> Vendor Trash. Repair
    >>|cRXP_BUY_Buy some|r |T134712:0|t[Morning Glory Dew] |cRXP_BUY_from him|r
    .collect 8766,160,82,1
    .goto 1427/0,-1188.64,-6523.94
    .isQuestComplete 7728
step
    >>Talk to |cRXP_FRIENDLY_Hansel|r, |cRXP_FRIENDLY_Scrange|r, and |cRXP_FRIENDLY_Burninate|r
    .target +Hansel Heavyhands
    .goto 1427/0,-1183.73,-6513.67
    .target +Taskmaster Scrange
    .goto 1427/0,-1192.66,-6509.06
    .vendor 14624 >> Vendor Trash. Repair
    >>|cRXP_BUY_Buy some|r |T134712:0|t[Morning Glory Dew] |cRXP_BUY_from him|r
    .collect 8766,160,82,1
    .goto 1427/0,-1188.64,-6523.94
    .target +Master Smith Burninate
step
    .hs >> Hearth to Gadgetzan
step
    #completewith Drop4451x3
    >>|cRXP_LOOT_Grimesilt Outhouse Key|r can drop from |cRXP_ENEMY_Dark Iron Steamsmith|r, |cRXP_ENEMY_Dark Iron Slaver|r, |cRXP_ENEMY_Dark Iron Taskmaster|r. Use it to start the quest if you get one
    .collect 11818,1,4451 --Grimesilt Outhouse Key (1)
    .accept 4451 >>Accept The Key to Freedom
    .use 11818
step
    #label Drop4451x3
    #loop
    .goto 1427/0,-1145.80,-6590.43,0
    .goto 1427/0,-1145.80,-6590.43,40,0
    .goto 1427/0,-1135.76,-6700.21,40,0
    .goto 1427/0,-1090.02,-6749.59,40,0
    .goto 1427/0,-1216.98,-6715.97,40,0
    .goto 1427/0,-1278.11,-6703.03,40,0
    .goto 1427/0,-1365.36,-6755.09,40,0
    .goto 1427/0,-1422.03,-6685.18,40,0
    .goto 1427/0,-1345.50,-6682.65,40,0
    .goto 1427/0,-1282.13,-6641.90,40,0
    >>Kill |cRXP_ENEMY_Dark Iron Geologists|r, |cRXP_ENEMY_Dark Iron Steamsmiths|r, |cRXP_ENEMY_Slave Workers|r and |cRXP_ENEMY_Dark Iron Slavers|r. Loot them for |cRXP_LOOT_Thorium Plated Dagger|r
    .complete 3443,1 --Thorium Plated Dagger (8)
    .mob Dark Iron Geologist
    .mob Dark Iron Steamsmith
    .mob Slave Worker
    .mob Dark Iron Slaver
step
    .goto 1427/0,-1194.44,-6679.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kalaran Windblade|r
    .turnin 3443 >>Turn in Forging the Shaft
    .target Kalaran Windblade
step
    .goto 1427/0,-1784.39,-7025.08
    >>Pick up |cRXP_PICK_Goodsteel Ledger|r from the ground
    .complete 4450,1 --Goodsteel Ledger (1)
step
    .goto 1427/0,-1786.39,-7024.78
    >>Click the |cRXP_PICK_Wooden Outhouse|r
    .turnin 4451 >>Turn in The Key to Freedom
    .isOnQuest 4451
step
    +|cRXP_WARN_That is all of Searing Gorge for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Ironforge|r: Suntara Stones
    >>|cRXP_FRIENDLY_Loch Modan|r: The Horn of the Beast
    >>|cRXP_FRIENDLY_Tanaris|r: Ledger from Tanaris
    >>|cRXP_FRIENDLY_Undercity|r: A Mind of Metal
step
    +|cRXP_WARN_The rest of Searing Gorge is planned from level 48.|r Load its guide for level 48 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 45 - 52 Searing Gorge
#subweight -45
#name 48-49 Searing Gorge: around Hansel Heavyhands

step
    .goto 1427/0,-982.70,-6491.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zamael Lunthistle|r
    .accept 3377 >>Accept Prayer to Elune
    .target Zamael Lunthistle
step
    .goto 1427/0,-982.70,-6491.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zamael Lunthistle|r
    .complete 3377,1 --Zamael Lunthistle
    .target Zamael Lunthistle
step
    .goto 1427/0,-982.70,-6491.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zamael Lunthistle|r
    .turnin 3377 >>Turn in Prayer to Elune
    .accept 3378 >>Accept Prayer to Elune
    .target Zamael Lunthistle
step
    .goto 1427/0,-1183.73,-6513.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hansel Heavyhands|r
    .accept 7723 >>Accept Curse These Fat Fingers
    .accept 7724 >>Accept Fiery Menace!
    .accept 7727 >>Accept Incendosaurs? Whateverosaur is More Like It
    .target Hansel Heavyhands
step
    .goto 1427/0,-1188.64,-6524.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Smith Burninate|r
    .accept 7722 >>Accept What the Flux?
    .target Master Smith Burninate
step
    .goto 1427/0,-1225.46,-6631.63
    >>Pick up |cRXP_PICK_Secret Plans: Fiery Flux|r from the ground
    .complete 7722,1 --Secret Plans: Fiery Flux (1)
step
    #loop
    .goto 1427/0,-1290.83,-6520.37,0
    .goto 1427/0,-1290.83,-6520.37,40,0
    .goto 1427/0,-1317.38,-6469.64,40,0
    .goto 1427/0,-1356.43,-6398.54,40,0
    .goto 1427/0,-1427.16,-6448.07,40,0
    .goto 1427/0,-1404.18,-6493.89,40,0
    .goto 1427/0,-1464.20,-6535.09,40,0
    .goto 1427/0,-1441.67,-6586.71,40,0
    .goto 1427/0,-1474.69,-6656.18,40,0
    .goto 1427/0,-1435.86,-6680.27,40,0
    >>Kill |cRXP_ENEMY_Incendosaurs|r
    .complete 7727,1 --Incendosaur slain (20)
    .mob Incendosaur
step
    .goto 1427/0,-1194.44,-6679.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kalaran Windblade|r
    .accept 3452 >>Accept The Flame's Casing
    .target Kalaran Windblade
    .isQuestTurnedIn 3443 --any of: Forging the Shaft
step
    #completewith Along8
    >>As you go: Kill |cRXP_ENEMY_Twilight Dark Shamans|r, |cRXP_ENEMY_Twilight Fire Guards|r, |cRXP_ENEMY_Twilight Geomancers|r and |cRXP_ENEMY_Twilight Idolaters|r. Loot them for |cRXP_LOOT_Prayer to Elune|r. |cRXP_WARN_Anything left is finished later|r
    .complete 3378,1 --Prayer to Elune (1)
    .mob Twilight Dark Shaman
    .mob Twilight Fire Guard
    .mob Twilight Geomancer
    .mob Twilight Idolater
step
    #label Along8
    #loop
    .goto 1427/0,-1009.03,-6490.91,0
    .goto 1427/0,-1009.03,-6490.91,40,0
    .goto 1427/0,-981.80,-6497.61,40,0
    .goto 1427/0,-847.93,-6512.19,40,0
    .goto 1427/0,-819.37,-6489.72,40,0
    .goto 1427/0,-873.81,-6490.32,40,0
    .goto 1427/0,-920.22,-6479.01,40,0
    .goto 1427/0,-937.40,-6454.17,40,0
    .goto 1427/0,-962.17,-6477.97,40,0
    .goto 1427/0,-985.15,-6482.14,40,0
    >>Kill |cRXP_ENEMY_Twilight Dark Shamans|r, |cRXP_ENEMY_Twilight Fire Guards|r, |cRXP_ENEMY_Twilight Geomancers|r and |cRXP_ENEMY_Twilight Idolaters|r. Loot them for |cRXP_LOOT_Symbol of Ragnaros|r
    .complete 3452,1 --Symbol of Ragnaros (1)
    .mob Twilight Dark Shaman
    .mob Twilight Fire Guard
    .mob Twilight Geomancer
    .mob Twilight Idolater
    .isOnQuest 3452
step
    #loop
    .goto 1427/0,-885.64,-6613.04,0
    .goto 1427/0,-885.64,-6613.04,40,0
    .goto 1427/0,-805.54,-6639.96,40,0
    .goto 1427/0,-761.36,-6674.17,40,0
    .goto 1427/0,-748.86,-6632.08,40,0
    .goto 1427/0,-679.92,-6596.68,40,0
    .goto 1427/0,-648.90,-6648.89,40,0
    .goto 1427/0,-619.45,-6731.29,40,0
    .goto 1427/0,-714.28,-6752.12,40,0
    .goto 1427/0,-844.58,-6711.66,40,0
    >>Kill |cRXP_ENEMY_Twilight Dark Shamans|r, |cRXP_ENEMY_Twilight Fire Guards|r, |cRXP_ENEMY_Twilight Geomancers|r and |cRXP_ENEMY_Twilight Idolaters|r. Loot them for |cRXP_LOOT_Prayer to Elune|r
    .complete 3378,1 --Prayer to Elune (1)
    .mob Twilight Dark Shaman
    .mob Twilight Fire Guard
    .mob Twilight Geomancer
    .mob Twilight Idolater
step
    .goto 1427/0,-1194.44,-6679.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kalaran Windblade|r
    .turnin 3452 >>Turn in The Flame's Casing
    .target Kalaran Windblade
    .isOnQuest 3452
step
    .goto 1427/0,-1194.44,-6679.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kalaran Windblade|r
    .accept 3453 >>Accept The Torch of Retribution
    .target Kalaran Windblade
    .isQuestTurnedIn 3452 --any of: The Flame's Casing
step
    .goto 1427/0,-1194.44,-6679.98
    >>Wait for Kalaran Windblade to complete the Torch of Retribution.
    .complete 3453,1 --Kalaran Windblade
    .target Kalaran Windblade
    .isOnQuest 3453
step
    .goto 1427/0,-1194.44,-6679.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kalaran Windblade|r
    .turnin 3453 >>Turn in The Torch of Retribution
    .target Kalaran Windblade
    .isOnQuest 3453
step
    .goto 1427/0,-1194.44,-6679.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kalaran Windblade|r
    .accept 3454 >>Accept The Torch of Retribution
    .target Kalaran Windblade
    .isQuestTurnedIn 3453 --any of: The Torch of Retribution
step
    .goto 1427/0,-1194.44,-6681.17
    >>Click the |cRXP_PICK_Torch of Retribution|r
    .turnin 3454 >>Turn in The Torch of Retribution
    .isOnQuest 3454
step
    .goto 1427/0,-1194.44,-6679.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kalaran Windblade|r
    .accept 3462 >>Accept Squire Maltrake
    .target Kalaran Windblade
    .isQuestTurnedIn 3454 --any of: The Torch of Retribution
step
    .goto 1427/0,-1196.90,-6680.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Squire Maltrake|r
    .turnin 3462 >>Turn in Squire Maltrake
    .target Squire Maltrake
    .isOnQuest 3462
step
    #loop
    .goto 1427/0,-1042.94,-6692.17,0
    .goto 1427/0,-1042.94,-6692.17,40,0
    .goto 1427/0,-1015.05,-6707.20,40,0
    .goto 1427/0,-980.91,-6751.82,40,0
    .goto 1427/0,-951.01,-6765.80,40,0
    .goto 1427/0,-929.15,-6822.18,40,0
    .goto 1427/0,-947.22,-6849.25,40,0
    .goto 1427/0,-908.62,-6859.07,40,0
    .goto 1427/0,-953.91,-6920.95,40,0
    .goto 1427/0,-982.47,-6940.73,40,0
    >>Kill |cRXP_ENEMY_Greater Lava Spiders|r
    .complete 7724,1 --Greater Lava Spider slain (20)
    .mob Greater Lava Spider
step
    #loop
    .goto 1427/0,-1048.07,-6782.32,0
    .goto 1427/0,-1048.07,-6782.32,40,0
    .goto 1427/0,-1106.75,-6772.94,40,0
    .goto 1427/0,-1176.82,-6813.55,40,0
    .goto 1427/0,-1288.16,-6754.80,40,0
    .goto 1427/0,-1386.33,-6687.26,40,0
    .goto 1427/0,-1321.62,-6675.96,40,0
    .goto 1427/0,-1252.46,-6715.68,40,0
    .goto 1427/0,-1212.29,-6757.03,40,0
    .goto 1427/0,-1109.21,-6708.54,40,0
    >>Kill |cRXP_ENEMY_Heavy War Golems|r
    .complete 7723,1 --Heavy War Golem slain (20)
    .mob Heavy War Golem
step
    .goto 1427/0,-1183.73,-6513.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hansel Heavyhands|r
    .turnin 7723 >>Turn in Curse These Fat Fingers
    .turnin 7724 >>Turn in Fiery Menace!
    .turnin 7727 >>Turn in Incendosaurs? Whateverosaur is More Like It
    .target Hansel Heavyhands
step
    .goto 1427/0,-1188.64,-6524.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Smith Burninate|r
    .turnin 7722 >>Turn in What the Flux?
    .target Master Smith Burninate
step
    .goto 1427/0,-1162.98,-6493.74
    >>Click the |cRXP_PICK_Wanted/Missing/Lost & Found|r
    .accept 7701 >>Accept WANTED: Overseer Maltorius
step
    .goto 1427/0,-1232.60,-6633.86
    >>Kill |cRXP_ENEMY_Overseer Maltorius|r and loot |cRXP_LOOT_Head of Overseer Maltorius|r
    .complete 7701,1 --Head of Overseer Maltorius (1)
    .mob Overseer Maltorius
step
    .goto 1427/0,-1164.99,-6495.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lookout Captain Lolo Longstriker|r
    .turnin 7701 >>Turn in WANTED: Overseer Maltorius
    .target Lookout Captain Lolo Longstriker
step
    +|cRXP_WARN_That is all of Searing Gorge for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Darnassus|r: Prayer to Elune
step
    +|cRXP_WARN_The rest of Searing Gorge is planned from level 51.|r Load its guide for level 51 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 45 - 52 Searing Gorge
#subweight -45
#name 51-52 Searing Gorge

step
    .goto 1427/0,-1196.90,-6680.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Squire Maltrake|r
    .accept 3463 >>Accept Set Them Ablaze!
    .target Squire Maltrake
    .isQuestTurnedIn 3462 --any of: Squire Maltrake
step
    .goto 1427/0,-1065.92,-6910.39
    >>Click the |cRXP_PICK_Sentry Brazier|r
    .complete 3463,4 --Northern Tower Ablaze
    .isOnQuest 3463
step
    .goto 1427/0,-1118.80,-7002.61
    >>Click the |cRXP_PICK_Sentry Brazier|r
    .complete 3463,1 --Western Tower Ablaze
    .isOnQuest 3463
step
    .goto 1427/0,-1305.34,-7006.04
    >>Click the |cRXP_PICK_Sentry Brazier|r
    .complete 3463,2 --Southern Tower Ablaze
    .isOnQuest 3463
step
    .goto 1427/0,-1440.10,-6914.26
    >>Click the |cRXP_PICK_Sentry Brazier|r
    .complete 3463,3 --Eastern Tower Ablaze
    .isOnQuest 3463
step
    .goto 1427/0,-1196.90,-6680.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Squire Maltrake|r
    .turnin 3463 >>Turn in Set Them Ablaze!
    .target Squire Maltrake
    .isOnQuest 3463
step
    .goto 1427/0,-1189.76,-6679.98
    >>Click the |cRXP_PICK_Hoard of the Black Dragonflight|r
    .accept 3481 >>Accept Trinkets...
    .isQuestTurnedIn 3463 --any of: Set Them Ablaze!
step
    .goto 1427/0,-1189.76,-6679.98
    >>Click the |cRXP_PICK_Hoard of the Black Dragonflight|r
    .turnin 3481 >>Turn in Trinkets...
    .isOnQuest 3481
step
    .goto 1427/0,-1240.85,-6480.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dying Archaeologist|r
    .accept 3372 >>Accept Release Them
    .target Dying Archaeologist
    .isQuestTurnedIn 3371 --any of: Dwarven Justice
    .xp <40,1
step
    .goto 1427/0,-973.10,-6484.82
    >>Open the |cRXP_PICK_Twilight Artifact|r. Loot it for |cRXP_LOOT_Mysterious Artifact|r
    .complete 3372,1 --Mysterious Artifact (1)
    .isOnQuest 3372
step
    .goto 1427/0,-1243.31,-6477.97
    >>Click the |cRXP_PICK_Altar of Suntara|r
    .turnin 3372 >>Turn in Release Them
    .isOnQuest 3372
step
    .goto 1427/0,-1240.85,-6480.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dying Archaeologist|r
    .accept 3566 >>Accept Rise, Obsidion!
    .target Dying Archaeologist
    .isQuestTurnedIn 3372 --any of: Release Them
    .xp <45,1
step
    .goto 1427/0,-1244.87,-6479.76
    >>Kill |cRXP_ENEMY_Lathoric the Black|r and loot |cRXP_LOOT_Head of Lathoric the Black|r
    .complete 3566,1 --Head of Lathoric the Black (1)
    .mob Lathoric the Black
    .isOnQuest 3566
step
    .goto 1427/0,-1254.69,-6461.91
    >>Kill |cRXP_ENEMY_Obsidion|r and loot |cRXP_LOOT_Heart of Obsidion|r
    .complete 3566,2 --Heart of Obsidion (1)
    .mob Obsidion
    .isOnQuest 3566
step
    +|cRXP_WARN_End of the Searing Gorge route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Ironforge|r: Rise, Obsidion!
]])
