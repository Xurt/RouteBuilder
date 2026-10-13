-- 45-50 Searing Gorge: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 2 parts with a level check between them (from level 45, 48).
-- Edit zones/Searing Gorge.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#name 45-50 Searing Gorge

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
    .turnin 4449 >>Turn in Caught! while you are here
    .isQuestComplete 4449
step
    .goto 1427/0,-1194.44,-6679.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kalaran Windblade|r
    .accept 3442 >>Accept The Flawless Flame
    .target Kalaran Windblade
    .isQuestTurnedIn 3441 --any of: Divine Retribution
    .xp <40,1
step
    .goto 1427/0,-1100.28,-6559.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grisha|r
    .fp Thorium >>Get the Searing Gorge Flight Path
    .target Grisha
    .subzoneskip 1446,1
step
    #loop
    .goto 1427/0,-1337.91,-6811.17,0
    .goto 1427/0,-1337.91,-6811.17,40,0
    .goto 1427/0,-1394.59,-6835.42,40,0
    .goto 1427/0,-1431.40,-6864.72,40,0
    .goto 1427/0,-1237.06,-6949.81,40,0
    .goto 1427/0,-1005.90,-7060.33,40,0
    .goto 1427/0,-993.41,-6988.04,40,0
    .goto 1427/0,-1197.57,-6931.81,40,0
    >>Kill |cRXP_ENEMY_Blazing Elementals|r, |cRXP_ENEMY_Inferno Elementals|r and |cRXP_ENEMY_Magma Elementals|r. Loot them for |cRXP_LOOT_Heart of Flame|r
    .complete 3442,1 --Heart of Flame (4)
    .mob Blazing Elemental
    .mob Inferno Elemental
    .mob Magma Elemental
    .isOnQuest 3442
step
    #loop
    .goto 1427/0,-1176.82,-6813.55,0
    .goto 1427/0,-1176.82,-6813.55,40,0
    .goto 1427/0,-1153.61,-6771.61,40,0
    .goto 1427/0,-1106.75,-6772.94,40,0
    .goto 1427/0,-1079.53,-6812.66,40,0
    .goto 1427/0,-1048.07,-6782.32,40,0
    .goto 1427/0,-1109.21,-6708.54,40,0
    .goto 1427/0,-1110.55,-6691.88,40,0
    .goto 1427/0,-1185.74,-6715.68,40,0
    .goto 1427/0,-1212.29,-6757.03,40,0
    >>Kill |cRXP_ENEMY_Tempered War Golems|r, |cRXP_ENEMY_Heavy War Golems|r and |cRXP_ENEMY_Magma Elementals|r. Loot them for |cRXP_LOOT_Golem Oil|r
    .complete 3442,2 --Golem Oil (1)
    .mob Tempered War Golem
    .mob Heavy War Golem
    .mob Magma Elemental
    .isOnQuest 3442
step
    .goto 1427/0,-1194.44,-6679.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kalaran Windblade|r
    .turnin 3442 >>Turn in The Flawless Flame
    .target Kalaran Windblade
    .isOnQuest 3442
step
    .goto 1427/0,-1194.44,-6679.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kalaran Windblade|r
    .accept 3443 >>Accept Forging the Shaft
    .target Kalaran Windblade
    .isQuestTurnedIn 3442 --any of: The Flawless Flame
    .xp <40,1
step
    .goto 1427/0,-1471.79,-6643.68,40,0
    .goto 1427/0,-1468.89,-6579.57,0
    .goto 1427/0,-1468.89,-6579.57,50,0
    .goto 1427/0,-1446.35,-6460.57,50,0
    .goto 1427/0,-1366.25,-6411.04,50,0
    .goto 1427/0,-1305.56,-6477.97,50,0
    .goto 1427/0,-1408.20,-6507.87,50,0
    .goto 1427/0,-1431.40,-6570.50,50,0
    >>Descend to the cave's lower level, then kill |cRXP_ENEMY_Incendosaurs|r
    .train 427076,3 << Warrior sod
step
    .goto 1427/0,-1225.46,-6631.78
    >>Exit the cave again and re-enter through its right side
    >>Kill |cRXP_ENEMY_Overseer Maltorius|r. Loot him for his |cRXP_LOOT_Head|r and loot the |cRXP_PICK_Secret Plans: Fiery Flux|r
    >>|cRXP_WARN_This is a challenging fight. Make a path for kiting or escape by clearing the entire room before getting the plans|r
    .isOnQuest 7701
    .train 427076,3 << Warrior sod
step << !Shaman !Druid
    .goto 1427/0,-1225.46,-6631.78
    >>Exit the cave again and re-enter through its right side. Clear the entire room before looting the |cRXP_PICK_Secret Plans: Fiery Flux|r to make an escape path
    >>|cRXP_WARN_Be careful as this quest can be VERY hard and risky. Don't be ashamed to skip it|r << Warrior/Priest/Rogue
    >>|cRXP_WARN_Pull all 3 mobs with your pet and go loot the plans|r << Hunter
    >>|cRXP_WARN_Pull all 3 mobs with your Voidwalker and go loot the plans|r << Warlock
    >>|cRXP_WARN_Build up 25+ rage, then fear all 3 mobs at the same time and click to loot the plans|r << Warrior
    >>|cRXP_WARN_Go pull all 3 mobs and use your AOE fear to loot the plans|r << Priest
    >>|cRXP_WARN_With improved gouge this is possible. Use Sap on one target, then prepare yourself near the plans. Use blind on a second target, gouge the third target and instantly start looting the plans (5 sec)|r << Rogue
    >>|cRXP_WARN_Use Polymorph on Maltorius then frostnova the other 2 elites and blink to the plans and loot them|r << Mage
    .train 427076,3 << Warrior sod
step
    #completewith Drop4451x1
    >>|cRXP_LOOT_Grimesilt Outhouse Key|r can drop from |cRXP_ENEMY_Dark Iron Steamsmith|r, |cRXP_ENEMY_Dark Iron Slaver|r, |cRXP_ENEMY_Dark Iron Taskmaster|r. Use it to start the quest if you get one
    .collect 11818,1,4451 --Grimesilt Outhouse Key (1)
    .accept 4451 >>Accept The Key to Freedom
    .use 11818
step
    #label Drop4451x1
    #loop
    .goto 1427/0,-1216.98,-6715.97,0
    .goto 1427/0,-1216.98,-6715.97,40,0
    .goto 1427/0,-1278.11,-6703.03,40,0
    .goto 1427/0,-1365.36,-6755.09,40,0
    .goto 1427/0,-1422.03,-6685.18,40,0
    .goto 1427/0,-1345.50,-6682.65,40,0
    .goto 1427/0,-1282.13,-6641.90,40,0
    .goto 1427/0,-1145.80,-6590.43,40,0
    .goto 1427/0,-1135.76,-6700.21,40,0
    .goto 1427/0,-1090.02,-6749.59,40,0
    >>Kill |cRXP_ENEMY_Dark Iron Geologists|r, |cRXP_ENEMY_Dark Iron Steamsmiths|r, |cRXP_ENEMY_Slave Workers|r and |cRXP_ENEMY_Dark Iron Slavers|r. Loot them for |cRXP_LOOT_Thorium Plated Dagger|r
    .complete 3443,1 --Thorium Plated Dagger (8)
    .mob Dark Iron Geologist
    .mob Dark Iron Steamsmith
    .mob Slave Worker
    .mob Dark Iron Slaver
    .isOnQuest 3443
step
    .goto 1427/0,-1357.32,-6901.91,0
    .goto 1427/0,-1357.32,-6901.91,50,0
    .goto 1427/0,-1276.78,-6916.79,50,0
    .goto 1427/0,-1245.54,-6894.92,50,0
    .goto 1427/0,-1170.12,-6831.40,50,0
    .goto 1427/0,-1200.24,-6762.68,50,0
    .goto 1427/0,-1170.12,-6831.40,50,0
    .goto 1427/0,-1122.82,-6726.53,50,0
    .goto 1427/0,-1174.36,-6670.46,50,0
    .goto 1427/0,-1198.46,-6588.49,50,0
    .goto 1427/0,-1251.12,-6500.88,50,0
    .goto 1427/0,-1295.52,-6439.89,50,0
    .goto 1427/0,-1292.62,-6522.15,50,0
    .goto 1427/0,-1350.18,-6479.16,50,0
    .goto 1427/0,-1337.47,-6553.09,50,0
    .goto 1427/0,-1285.25,-6583.44,50,0
    .goto 1427/0,-1291.50,-6630.14,50,0
    .goto 1427/0,-1399.94,-6745.28,50,0
    .goto 1427/0,-1435.86,-6785.74,50,0
    .goto 1427/0,-1400.16,-6855.50,50,0
    >>Keep killing |cRXP_ENEMY_Dark Iron Dwarves|r until you loot the |T134246:0|t[|cRXP_LOOT_Grimesilt Outhouse Key|r]
    >>|cRXP_WARN_Do not accept the quest yet! This may cause questlog issues|r
    .collect 11818,1,4451
    .train 427076,3 << Warrior sod
step
    .goto 1427/0,-1194.44,-6679.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kalaran Windblade|r
    .turnin 3443 >>Turn in Forging the Shaft
    .target Kalaran Windblade
    .isOnQuest 3443
step
    .goto 1427/0,-1194.44,-6679.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kalaran Windblade|r
    .accept 3454 >>Accept The Torch of Retribution
    .target Kalaran Windblade
    .isQuestTurnedIn 3453 --any of: The Torch of Retribution
    .xp <40,1
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
    .xp <40,1
step
    .goto 1427/0,-1196.90,-6680.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Squire Maltrake|r
    .turnin 3462 >>Turn in Squire Maltrake
    .target Squire Maltrake
    .isOnQuest 3462
step
    .goto 1427/0,-1786.39,-7024.78
    >>Click the |cRXP_PICK_Wooden Outhouse|r
    .turnin 4449 >>Turn in Caught!
    .accept 4450 >>Accept Ledger from Tanaris
step
    #completewith Along14
    >>As you go: Pick up |cRXP_PICK_Goodsteel Ledger|r from the ground. |cRXP_WARN_Anything left is finished later|r
    .complete 4450,1 --Goodsteel Ledger (1)
step
    #label Along14
    .goto 1427/0,-1786.39,-7024.78
    >>Click the |cRXP_PICK_Wooden Outhouse|r
    .turnin 4451 >>Turn in The Key to Freedom
    .isOnQuest 4451
step
    #loop
    .goto 1427/0,-1784.39,-7025.08,0
    .goto 1427/0,-1784.39,-7025.08,40,0
    .goto 1427/0,-1751.14,-7111.20,40,0
    .goto 1427/0,-1837.27,-7119.98,40,0
    >>Pick up |cRXP_PICK_Goodsteel Ledger|r from the ground
    >>Kill |cRXP_ENEMY_Glassweb Spider|r and loot |cRXP_LOOT_Solid Crystal Leg Shaft|r
    .complete 4450,1 --Goodsteel Ledger (1)
    .complete 4450,2 --Solid Crystal Leg Shaft (1)
    .mob Glassweb Spider
step
    +|cRXP_WARN_That is all of Searing Gorge for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Tanaris|r: Ledger from Tanaris
step
    .xp 48 >>|cRXP_WARN_The rest of Searing Gorge is planned from level 48.|r Come back to this guide then
step
    .goto 1427/0,-1183.73,-6513.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hansel Heavyhands|r
    .accept 7723 >>Accept Curse These Fat Fingers
    .accept 7724 >>Accept Fiery Menace!
    .accept 7727 >>Accept Incendosaurs? Whateverosaur is More Like It
    .target Hansel Heavyhands
step
    .goto 1427/0,-1162.98,-6493.74
    >>Click the |cRXP_PICK_Wanted/Missing/Lost & Found|r
    .accept 7728 >>Accept STOLEN: Smithing Tuyere and Lookout's Spyglass
    .accept 7729 >>Accept JOB OPPORTUNITY: Culling the Competition
    .accept 7701 >>Accept WANTED: Overseer Maltorius
step
    .goto 1427/0,-1188.64,-6524.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Smith Burninate|r
    .accept 7722 >>Accept What the Flux?
    .target Master Smith Burninate
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
    #completewith Along5
    >>As you go: Kill |cRXP_ENEMY_Dark Iron Taskmasters|r. Kill |cRXP_ENEMY_Dark Iron Slavers|r. |cRXP_WARN_Anything left is finished later|r
    .complete 7729,1 --Dark Iron Taskmaster slain (15)
    .complete 7729,2 --Dark Iron Slaver slain (15)
    .mob Dark Iron Taskmaster
    .mob Dark Iron Slaver
step
    #label Along5
    .goto 1427/0,-1225.46,-6631.63
    >>Pick up |cRXP_PICK_Secret Plans: Fiery Flux|r from the ground
    >>Kill |cRXP_ENEMY_Overseer Maltorius|r and loot |cRXP_LOOT_Head of Overseer Maltorius|r
    .complete 7722,1 --Secret Plans: Fiery Flux (1)
    .complete 7701,1 --Head of Overseer Maltorius (1)
    .mob Overseer Maltorius
step
    .goto 1427/0,-1194.44,-6679.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kalaran Windblade|r
    .accept 3452 >>Accept The Flame's Casing
    .target Kalaran Windblade
    .isQuestTurnedIn 3443 --any of: Forging the Shaft
    .xp <40,1
step
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
    .goto 1427/0,-1194.44,-6679.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kalaran Windblade|r
    .turnin 3452 >>Turn in The Flame's Casing
    .target Kalaran Windblade
    .isOnQuest 3452
step
    #completewith Along9
    >>As you go: Kill |cRXP_ENEMY_Dark Iron Taskmasters|r. Kill |cRXP_ENEMY_Dark Iron Slavers|r. |cRXP_WARN_Anything left is finished later|r
    .complete 7729,1 --Dark Iron Taskmaster slain (15)
    .complete 7729,2 --Dark Iron Slaver slain (15)
    .mob Dark Iron Taskmaster
    .mob Dark Iron Slaver
step
    #label Along9
    #loop
    .goto 1427/0,-1212.29,-6757.03,0
    .goto 1427/0,-1212.29,-6757.03,40,0
    .goto 1427/0,-1288.16,-6754.80,40,0
    .goto 1427/0,-1321.62,-6675.96,40,0
    .goto 1427/0,-1386.33,-6687.26,40,0
    .goto 1427/0,-1458.62,-6675.81,40,0
    .goto 1427/0,-1281.91,-6868.74,40,0
    .goto 1427/0,-1174.14,-6863.98,40,0
    .goto 1427/0,-1048.07,-6782.32,40,0
    .goto 1427/0,-1109.21,-6708.54,40,0
    >>Kill |cRXP_ENEMY_Heavy War Golems|r
    >>Kill |cRXP_ENEMY_Dark Iron Steamsmith|r and loot |cRXP_LOOT_Smithing Tuyere|r
    .complete 7723,1 --Heavy War Golem slain (20)
    .complete 7728,1 --Smithing Tuyere (1)
    .mob Heavy War Golem
    .mob Dark Iron Steamsmith
step
    #loop
    .goto 1427/0,-1075.07,-6872.31,0
    .goto 1427/0,-1075.07,-6872.31,40,0
    .goto 1427/0,-1063.47,-6896.41,40,0
    .goto 1427/0,-1050.97,-6925.86,40,0
    >>Kill |cRXP_ENEMY_Dark Iron Lookout|r and loot |cRXP_LOOT_Lookout's Spyglass|r
    .complete 7728,2 --Lookout's Spyglass (1)
    .mob Dark Iron Lookout
step
    #loop
    .goto 1427/0,-1285.03,-6700.50,0
    .goto 1427/0,-1285.03,-6700.50,40,0
    .goto 1427/0,-1276.55,-6641.00,40,0
    .goto 1427/0,-1220.99,-6576.59,40,0
    .goto 1427/0,-1288.82,-6520.07,40,0
    .goto 1427/0,-1363.35,-6478.72,40,0
    .goto 1427/0,-1347.73,-6527.80,40,0
    .goto 1427/0,-1303.77,-6600.69,40,0
    .goto 1427/0,-1422.03,-6685.18,40,0
    .goto 1427/0,-1345.50,-6682.65,40,0
    >>Kill |cRXP_ENEMY_Dark Iron Taskmasters|r
    >>Kill |cRXP_ENEMY_Dark Iron Slavers|r
    .complete 7729,1 --Dark Iron Taskmaster slain (15)
    .complete 7729,2 --Dark Iron Slaver slain (15)
    .mob Dark Iron Taskmaster
    .mob Dark Iron Slaver
step
    .goto 1427/0,-1183.73,-6513.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hansel Heavyhands|r
    .turnin 7723 >>Turn in Curse These Fat Fingers
    .turnin 7724 >>Turn in Fiery Menace!
    .turnin 7727 >>Turn in Incendosaurs? Whateverosaur is More Like It
    .target Hansel Heavyhands
step
    .goto 1427/0,-1192.43,-6509.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Taskmaster Scrange|r
    .turnin 7728 >>Turn in STOLEN: Smithing Tuyere and Lookout's Spyglass
    .turnin 7729 >>Turn in JOB OPPORTUNITY: Culling the Competition
    .target Taskmaster Scrange
step
    .goto 1427/0,-1164.99,-6495.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lookout Captain Lolo Longstriker|r
    .turnin 7701 >>Turn in WANTED: Overseer Maltorius
    .target Lookout Captain Lolo Longstriker
step
    .goto 1427/0,-1188.64,-6524.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Master Smith Burninate|r
    .turnin 7722 >>Turn in What the Flux?
    .target Master Smith Burninate
step
    +|cRXP_WARN_End of the Searing Gorge route.|r
]])
