-- 10-24 Silverpine Forest: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 4 parts with a level check between them (from level 10, 15, 18, 21).
-- Edit zones/Silverpine Forest.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#name 10-24 Silverpine Forest

step
    .xp 10 >>Grind to level 10 (Lost Deathstalkers needs it)
step
    .goto 1421/0,1626.36,522.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Hadrec|r
    .accept 428 >>Accept Lost Deathstalkers
    .target High Executor Hadrec
step << Undead Paladin
    .goto 1421/0,1629.72,518.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trevan Rol|r
    .turnin 91858 >>Turn in Diplomatic Incident
    .target Trevan Rol
    .isOnQuest 91858
step << Undead
    .goto 1421/0,1626.36,499.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Podrig|r
    .turnin 6324 >>Turn in Return to Podrig
    .target Deathguard Podrig
    .isOnQuest 6324
step
    .goto 1421/0,1636.44,510.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Bates|r
    .target Innkeeper Bates
    .home >>Set your Hearthstone to Innkeeper Bates's inn
step
    .goto 1421/0,1652.40,522.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Renferrel|r
    .turnin 446 >>Turn in Thule Ravenclaw
    .target Apothecary Renferrel
    .isOnQuest 446
step << Undead
    .goto 1421/0,1626.36,499.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Podrig|r
    .accept 6321 >>Accept Supplying the Sepulcher
    .target Deathguard Podrig
    .xp <10,1
step
    .goto 1421/0,1204.68,1290.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rane Yorick|r
    .turnin 428 >>Turn in Lost Deathstalkers
    .target Rane Yorick
step
    .goto 1421/0,1204.68,1290.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rane Yorick|r
    .accept 429 >>Accept Wild Hearts
    .target Rane Yorick
    .xp <10,1
step
    .goto 1421/0,1090.44,1409.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathstalker Erland|r
    .accept 435 >>Accept Escorting Erland
    .target Deathstalker Erland
step
    .goto 1421/0,1166.46,1292.03
    >>Erland must reach Rane Yorick
    .complete 435,1 --Erland must reach Rane Yorick
step
    .goto 1421/0,1204.68,1290.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rane Yorick|r
    .turnin 435 >>Turn in Escorting Erland
    .accept 429 >>Accept Wild Hearts
    .target Rane Yorick
step
    .goto 1421/0,1204.68,1290.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rane Yorick|r
    .accept 449 >>Accept The Deathstalkers' Report
    .target Rane Yorick
    .xp <10,1
step
    #loop
    .goto 1421/0,1145.04,1285.59,0
    .goto 1421/0,1145.04,1285.59,40,0
    .goto 1421/0,1090.44,1317.23,40,0
    .goto 1421/0,940.50,1376.03,40,0
    .goto 1421/0,887.58,1413.55,40,0
    .goto 1421/0,949.74,1452.75,40,0
    .goto 1421/0,994.26,1476.27,40,0
    .goto 1421/0,1019.88,1390.59,40,0
    .goto 1421/0,1080.78,1442.95,40,0
    .goto 1421/0,1091.28,1380.23,40,0
    >>Kill |cRXP_ENEMY_Worgs|r, |cRXP_ENEMY_Mottled Worgs|r, |cRXP_ENEMY_Bloodsnout Worgs|r and |cRXP_ENEMY_Gorefangs|r. Loot them for |cRXP_LOOT_Discolored Worg Heart|r
    .complete 429,1 --Discolored Worg Heart (6)
    .mob Worg
    .mob Mottled Worg
    .mob Bloodsnout Worg
    .mob Gorefang
step
    .goto 1421/0,1204.68,1290.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rane Yorick|r
    .accept 449 >>Accept The Deathstalkers' Report
    .target Rane Yorick
step
    #completewith next
    .hs >>Hearth to Innkeeper Bates's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1421/0,1652.40,522.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Renferrel|r
    .turnin 429 >>Turn in Wild Hearts
    .target Apothecary Renferrel
step
    .goto 1421/0,1593.60,551.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dalar Dawnweaver|r
    .accept 421 >>Accept Prove Your Worth
    .target Dalar Dawnweaver
step << !Mage !Priest
    .goto 1421/0,1599.90,552.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gwyn|r
    .vendor >> |cRXP_BUY_Buy|r |T134532:0|t[Red-speckled Mushroom] |cRXP_BUY_from him|r
    >>|cRXP_WARN_Do NOT sell your|r |T133884:0|t[|cRXP_LOOT_Murloc Eyes|r]
    .collect 4605,20,421,1
    .target Gwyn Farrow
    .money <0.05
step
    .goto 1421/0,1602.84,549.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Edwin|r
    >>|cRXP_BUY_Buy|r |T132815:0|t[Ice Cold Milk] |cRXP_BUY_from him|r << Mage/Warlock/Priest/Shaman/Druid
    .vendor >> |cRXP_BUY_Buy|r |T134830:0|t[Lesser Healing Potions] |cRXP_BUY_from him if they're up|r
    >>|cRXP_WARN_Do NOT sell your|r |T133884:0|t[|cRXP_LOOT_Murloc Eyes|r]
    .collect 1179,20,421,1 << Mage/Warlock/Priest/Shaman/Druid
    .target Edwin Harly
    .money <0.05 << Mage/Warlock/Priest/Shaman/Druid
step
    .goto 1421/0,1602.84,520.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shadow Priest Allister|r
    .accept 477 >>Accept Border Crossings
    .target Shadow Priest Allister
step << Undead
    .goto 1421/0,1626.36,499.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Podrig|r
    .accept 6321 >>Accept Supplying the Sepulcher
    .target Deathguard Podrig
step
    .goto 1421/0,1626.36,522.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Hadrec|r
    .turnin 449 >>Turn in The Deathstalkers' Report
    .accept 3221 >>Accept Speak with Renferrel
    .accept 437 >>Accept The Dead Fields
    .target High Executor Hadrec
step
    .goto 1421/0,1652.40,522.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Renferrel|r
    .turnin 445 >>Turn in Delivery to Silverpine Forest
    .target Apothecary Renferrel
    .isOnQuest 445
step
    .goto 1421/0,1652.40,522.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Renferrel|r
    .turnin 3221 >>Turn in Speak with Renferrel
    .accept 1359 >>Accept Zinge's Delivery
    .accept 447 >>Accept A Recipe For Death
    .accept 430 >>Accept Return to Quinn
    .target Apothecary Renferrel
step
    #loop
    .goto 1421/0,1287.42,460.15,0
    .goto 1421/0,1287.42,460.15,40,0
    .goto 1421/0,1257.60,497.67,40,0
    .goto 1421/0,1274.82,408.63,40,0
    .goto 1421/0,1275.24,362.99,40,0
    .goto 1421/0,1318.92,328.83,40,0
    >>Kill |cRXP_ENEMY_Moonrage Whitescalps|r
    .complete 421,1 --Moonrage Whitescalp slain (5)
    .mob Moonrage Whitescalp
step
    .goto 1421/0,1593.60,551.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dalar Dawnweaver|r
    .turnin 421 >>Turn in Prove Your Worth
    .accept 422 >>Accept Arugal's Folly
    .target Dalar Dawnweaver
step
    .goto 1421/0,1231.14,866.43
    >>Open the |cRXP_PICK_Dusty Spellbooks|r. Loot it for |cRXP_LOOT_Remedy of Arugal|r
    .complete 422,1 --Remedy of Arugal (1)
step
    .goto 1421/0,1205.94,1314.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quinn Yorick|r
    .turnin 430 >>Turn in Return to Quinn
    .accept 91920 >>Accept Wild Eyes
    .target Quinn Yorick
step
    #loop
    .goto 1421/0,1025.34,1073.07,0
    .goto 1421/0,1025.34,1073.07,40,0
    .goto 1421/0,1050.54,1049.83,40,0
    .goto 1421/0,1055.16,1000.27,40,0
    .goto 1421/0,1077.84,940.07,40,0
    .goto 1421/0,1111.86,877.63,40,0
    .goto 1421/0,1037.94,943.43,40,0
    .goto 1421/0,1020.30,976.75,40,0
    .goto 1421/0,1024.92,1008.95,40,0
    .goto 1421/0,1031.22,1037.51,40,0
    >>Kill |cRXP_ENEMY_Vile Fin Tidecallers|r and |cRXP_ENEMY_Vile Fin Shredders|r. Loot them for |cRXP_LOOT_Murloc Eye|r
    .complete 91920,1 --Murloc Eye (3)
    .mob Vile Fin Tidecaller
    .mob Vile Fin Shredder
step
    .goto 1421/0,1521.78,1071.11
    >>Enter the Dead Fields
    .complete 437,1 --Enter the Dead Fields
step
    #loop
    .goto 1421/0,1560.00,1078.67,0
    .goto 1421/0,1560.00,1078.67,40,0
    .goto 1421/0,1560.00,1106.67,40,0
    .goto 1421/0,1602.00,1078.67,40,0
    >>Kill |cRXP_ENEMY_Nightlash|r and loot |cRXP_LOOT_Essence of Nightlash|r
    .complete 437,2 --Essence of Nightlash (1)
    .mob Nightlash
step
    .goto 1421/0,2064.0,1167.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Killian|r
    .vendor >> Vendor trash
    .target Killian Sanatha
    .isOnQuest 447
step
    #loop
    .goto 1421/0,1887.60,1221.19,0
    .goto 1421/0,1887.60,1221.19,40,0
    .goto 1421/0,1951.02,1216.99,40,0
    .goto 1421/0,2015.28,1181.43,40,0
    .goto 1421/0,2014.86,1240.51,40,0
    .goto 1421/0,1956.90,1300.43,40,0
    .goto 1421/0,1957.74,1372.11,40,0
    .goto 1421/0,2000.16,1388.35,40,0
    .goto 1421/0,1990.08,1446.87,40,0
    .goto 1421/0,1942.62,1425.31,40,0
    >>Kill |cRXP_ENEMY_Moss Stalkers|r, |cRXP_ENEMY_Mist Creepers|r and |cRXP_ENEMY_Krethis Shadowspinners|r. Loot them for |cRXP_LOOT_Skittering Blood|r
    .complete 447,2 --Skittering Blood (6)
    .mob Moss Stalker
    .mob Mist Creeper
    .mob Krethis Shadowspinner
step
    #loop
    .goto 1421/0,1702.80,1162.95,0
    .goto 1421/0,1702.80,1162.95,40,0
    .goto 1421/0,1665.84,1158.75,40,0
    .goto 1421/0,1585.62,1189.83,40,0
    .goto 1421/0,1548.24,1214.75,40,0
    .goto 1421/0,1519.26,1155.39,40,0
    .goto 1421/0,1619.22,1140.55,40,0
    .goto 1421/0,1664.58,1120.95,40,0
    .goto 1421/0,1682.22,1058.23,40,0
    >>Kill |cRXP_ENEMY_Ferocious Grizzled Bears|r, |cRXP_ENEMY_Giant Grizzled Bears|r and |cRXP_ENEMY_Old Vicejaws|r. Loot them for |cRXP_LOOT_Grizzled Bear Heart|r
    .complete 447,1 --Grizzled Bear Heart (6)
    .mob Ferocious Grizzled Bear
    .mob Giant Grizzled Bear
    .mob Old Vicejaw
step
    .goto 1421/0,1593.60,551.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dalar Dawnweaver|r
    .turnin 422 >>Turn in Arugal's Folly
    .accept 423 >>Accept Arugal's Folly
    .target Dalar Dawnweaver
step
    .goto 1421/0,1626.36,522.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Hadrec|r
    .turnin 437 >>Turn in The Dead Fields
    .accept 438 >>Accept The Decrepit Ferry
    .target High Executor Hadrec
step
    .goto 1421/0,1652.40,522.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Renferrel|r
    .turnin 91920 >>Turn in Wild Eyes
    .accept 91921 >>Accept Return to Quinn (Again)
    .target Apothecary Renferrel
step << !Mage !Priest
    .goto 1421/0,1599.90,552.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gwyn|r
    >>|cRXP_BUY_Buy|r |T134532:0|t[Red-speckled Mushrooms] |cRXP_BUY_from her|r
    .vendor >> Vendor trash
    .collect 4605,20,423,1
    .target Gwyn Farrow
step
    .goto 1421/0,1602.84,549.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Edwin|r
    >>|cRXP_BUY_Buy|r |T132815:0|t[Ice Cold Milk] |cRXP_BUY_from him|r << Warlock/Priest/Shaman/Druid
    .vendor >> |cRXP_BUY_Buy|r |T134830:0|t[Lesser Healing Potions] |cRXP_BUY_from him if they're up|r
    .collect 1179,20,423,1 << Warlock/Priest/Shaman/Druid
    .target Edwin Harly
step << Warlock/Mage/Priest
    .goto 1421/0,1568.4,567.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Andrea|r
    .vendor >> Buy |T132491:0|t[|cRXP_FRIENDLY_Wise Man's Belt|r] from her if it's up
    .target Andrea Boynton
    .money <0.1400
step << Rogue
    .goto 1421/0,1576.38,571.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alexandre|r
    .vendor >> Buy |T132539:0|t[|cRXP_FRIENDLY_Agile Boots|r] from her if it's up
    .target Alexandre Lefevre
    .money <0.2633
step
    #loop
    .goto 1421/0,1720.44,820.79,0
    .goto 1421/0,1720.44,820.79,40,0
    .goto 1421/0,1818.72,844.59,40,0
    .goto 1421/0,1840.56,907.03,40,0
    .goto 1421/0,1870.80,980.39,40,0
    .goto 1421/0,1824.60,1051.51,40,0
    .goto 1421/0,1784.70,1011.19,40,0
    .goto 1421/0,1712.46,1020.71,40,0
    .goto 1421/0,1722.54,951.55,40,0
    .goto 1421/0,1785.54,943.15,40,0
    >>Kill |cRXP_ENEMY_Moonrage Gluttons|r. Loot them for |cRXP_LOOT_Glutton Shackle|r
    >>Kill |cRXP_ENEMY_Moonrage Darksouls|r. Loot them for |cRXP_LOOT_Darksoul Shackle|r
    .complete 423,1 --Glutton Shackle (6)
    .complete 423,2 --Darksoul Shackle (3)
    .mob Moonrage Glutton
    .mob Moonrage Darksoul
step
    .goto 1421/0,1205.94,1314.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quinn Yorick|r
    .turnin 91921 >>Turn in Return to Quinn (Again)
    .target Quinn Yorick
step
    .goto 1421/0,1204.68,1290.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rane Yorick|r
    .accept 425 >>Accept Ivar the Foul
    .target Rane Yorick
step
    .goto 1421/0,1286.16,1277.47
    >>Kill |cRXP_ENEMY_Ivar the Foul|r and loot |cRXP_LOOT_Ivar's Head|r
    .complete 425,1 --Ivar's Head (1)
    .mob Ivar the Foul
step
    .goto 1421/0,1204.68,1290.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rane Yorick|r
    .turnin 425 >>Turn in Ivar the Foul
    .target Rane Yorick
step
    .goto 1421/0,995.52,689.47
    >>Click the |cRXP_PICK_Corpse Laden Boat|r
    .turnin 438 >>Turn in The Decrepit Ferry
    .accept 439 >>Accept Rot Hide Clues
step
    .goto 1421/0,1593.60,551.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dalar Dawnweaver|r
    .turnin 423 >>Turn in Arugal's Folly
    .target Dalar Dawnweaver
step
    .goto 1421/0,1626.36,522.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Hadrec|r
    .turnin 439 >>Turn in Rot Hide Clues
    .target High Executor Hadrec
step
    .goto 1421/0,1354.62,-22.57
    >>Click the |cRXP_PICK_Dalaran Crate|r
    .turnin 477 >>Turn in Border Crossings
    .accept 478 >>Accept Maps and Runes
step
    .goto 1421/0,1602.84,520.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shadow Priest Allister|r
    .turnin 478 >>Turn in Maps and Runes
    .accept 481 >>Accept Dalar's Analysis
    .target Shadow Priest Allister
step << Undead
    .goto 1421/0,1533.96,473.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Karos Razok|r
    .turnin 6321 >>Turn in Supplying the Sepulcher while you are here
    .isQuestComplete 6321
    .target Karos Razok
step
    .goto 1421/0,1593.60,551.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dalar Dawnweaver|r
    .turnin 481 >>Turn in Dalar's Analysis
    .accept 482 >>Accept Dalaran's Intentions
    .target Dalar Dawnweaver
step
    .goto 1421/0,1602.84,520.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shadow Priest Allister|r
    .turnin 482 >>Turn in Dalaran's Intentions
    .accept 479 >>Accept Ambermill Investigations
    .target Shadow Priest Allister
step
    #loop
    .goto 1421/0,1012.32,-65.41,0
    .goto 1421/0,1012.32,-65.41,40,0
    .goto 1421/0,935.46,-80.25,40,0
    .goto 1421/0,875.40,-85.01,40,0
    .goto 1421/0,893.04,-153.61,40,0
    .goto 1421/0,912.78,-200.09,40,0
    .goto 1421/0,970.32,-211.85,40,0
    .goto 1421/0,1032.48,-223.05,40,0
    .goto 1421/0,944.70,-159.77,40,0
    .goto 1421/0,1014.42,-135.69,40,0
    >>Kill |cRXP_ENEMY_Dalaran Protectors|r, |cRXP_ENEMY_Dalaran Mages|r and |cRXP_ENEMY_Dalaran Conjurors|r. Loot them for |cRXP_LOOT_Dalaran Pendant|r
    .complete 479,1 --Dalaran Pendant (8)
    .mob Dalaran Protector
    .mob Dalaran Mage
    .mob Dalaran Conjuror
step
    #completewith next
    .hs >>Hearth to Innkeeper Bates's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1421/0,1602.84,520.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shadow Priest Allister|r
    .turnin 479 >>Turn in Ambermill Investigations
    .target Shadow Priest Allister
step
    .goto 1421/0,1626.36,522.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Hadrec|r
    .accept 440 >>Accept The Engraved Ring
    .target High Executor Hadrec
step
    .xp 12 >>Grind to level 12 (Pyrewood Ambush needs it)
step
    .goto 1421/0,1497.00,-416.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathstalker Faerleia|r
    .accept 452 >>Accept Pyrewood Ambush
    .target Deathstalker Faerleia
step
    .goto 1421/0,1496.58,-406.73
    >>Kill |cRXP_ENEMY_Councilman Smithers|r, |cRXP_ENEMY_Councilman Thatchers|r, |cRXP_ENEMY_Councilman Hendricks|r and |cRXP_ENEMY_Councilman Wilhelms|r
    .complete 452,1 --Councilman Smithers (8)
    .mob Councilman Smithers
    .mob Councilman Thatcher
    .mob Councilman Hendricks
    .mob Councilman Wilhelm
step
    .goto 1421/0,1497.00,-416.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathstalker Faerleia|r
    .turnin 452 >>Turn in Pyrewood Ambush
    .target Deathstalker Faerleia
step << Undead
    .goto 1421/0,1533.96,473.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Karos Razok|r
    .turnin 6321 >>Turn in Supplying the Sepulcher
    .accept 6323 >>Accept Ride to the Undercity
    .target Karos Razok
step
    .goto 1421/0,1533.96,474.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Karos|r
    .fp Sepulcher >> Get the Sepulcher flight path << !Undead
    .fly Undercity >> Fly to the Undercity << !Undead
    .target Karos Razok
    .zoneskip Undercity
step << Undead
    .hs >> Hearth to the Undercity
    .zoneskip Undercity
step
    .goto 1421/0,1644.84,-382.37
    >>Open the |cRXP_PICK_Berard's Bookshelf|r. Loot it for |cRXP_LOOT_Berard's Journal|r
    .complete 450,1 --Berard's Journal (1)
    .isOnQuest 450
step << Shaman
    .goto 1421/0,1821.24,427.39
    >>Kill |cRXP_ENEMY_Corrupt Minor Manifestation of Water|r and loot |cRXP_LOOT_Corrupt Manifestation's Bracers|r
    .complete 63,1 --Corrupt Manifestation's Bracers (1)
    .mob Corrupt Minor Manifestation of Water
    .isOnQuest 63
step << Shaman
    .goto 1421/0,1843.08,418.99
    >>Click the |cRXP_PICK_Brazier of Everfount|r
    .turnin 63 >>Turn in Call of Water
    .isOnQuest 63
step
    .goto 1421/0,1647.78,490.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mura Runetotem|r
    .turnin 3301 >>Turn in Mura Runetotem
    .target Mura Runetotem
    .isOnQuest 3301
step
    .goto 1421/0,1652.40,522.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Renferrel|r
    .turnin 450 >>Turn in A Recipe For Death
    .target Apothecary Renferrel
    .isOnQuest 450
step
    .goto 1421/0,1652.40,522.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Renferrel|r
    .accept 448 >>Accept Report to Hadrec
    .target Apothecary Renferrel
    .isQuestTurnedIn 446 --any of: Thule Ravenclaw
    .xp <10,1
step
    .goto 1421/0,1626.36,522.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Hadrec|r
    .turnin 448 >>Turn in Report to Hadrec
    .target High Executor Hadrec
    .isOnQuest 448
step
    .goto 1421/0,1594.02,471.91
    >>Click the |cRXP_PICK_Yuriv's Tombstone|r
    .turnin 264 >>Turn in Until Death Do Us Part
    .isOnQuest 264
step
    .goto 1421/0,1513.80,-734.33
    .xp 22 >> Run south to The Greymane Wall. AoE here until 22
step
    +|cRXP_WARN_That is all of Silverpine Forest for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Tirisfal Glades|r: The Engraved Ring
    >>|cRXP_FRIENDLY_Undercity|r: Ride to the Undercity << Undead
    >>|cRXP_FRIENDLY_Undercity|r: A Recipe For Death, Zinge's Delivery
step
    .xp 15 >>|cRXP_WARN_The rest of Silverpine Forest is planned from level 15.|r Come back to this guide then
step
    .goto 1421/0,1593.60,551.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dalar Dawnweaver|r
    .accept 98298 >>Accept Arugal's Folly
    .accept 424 >>Accept Arugal's Folly
    .target Dalar Dawnweaver
step
    .goto 1421/0,1626.36,522.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Hadrec|r
    .accept 443 >>Accept Rot Hide Ichor
    .target High Executor Hadrec
step
    .goto 1421/0,989.64,410.59
    >>Kill |cRXP_ENEMY_Grimson the Pale|r and loot |cRXP_LOOT_Head of Grimson|r
    .complete 424,1 --Head of Grimson (1)
    .mob Grimson the Pale
step
    .goto 1421/0,1593.60,551.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dalar Dawnweaver|r
    .turnin 424 >>Turn in Arugal's Folly
    .accept 99 >>Accept Arugal's Folly
    .target Dalar Dawnweaver
step
    #loop
    .goto 1421/0,1545.72,-329.45,0
    .goto 1421/0,1545.72,-329.45,40,0
    .goto 1421/0,1602.00,-345.13,40,0
    .goto 1421/0,1633.08,-385.73,40,0
    .goto 1421/0,1564.20,-433.33,40,0
    .goto 1421/0,1543.62,-397.49,40,0
    .goto 1421/0,1518.00,-439.49,40,0
    .goto 1421/0,1453.32,-410.93,40,0
    .goto 1421/0,1421.82,-354.37,40,0
    .goto 1421/0,1487.76,-361.65,40,0
    >>Kill |cRXP_ENEMY_Pyrewood Watchers|r, |cRXP_ENEMY_Moonrage Watchers|r, |cRXP_ENEMY_Moonrage Sentries|r and |cRXP_ENEMY_Pyrewood Sentries|r. Loot them for |cRXP_LOOT_Pyrewood Shackle|r
    .complete 99,1 --Pyrewood Shackle (6)
    .mob Pyrewood Watcher
    .mob Moonrage Watcher
    .mob Moonrage Sentry
    .mob Pyrewood Sentry
step
    #loop
    .goto 1421/0,1429.38,-452.65,0
    .goto 1421/0,1429.38,-452.65,40,0
    .goto 1421/0,1317.66,-488.21,40,0
    .goto 1421/0,1316.40,-562.41,40,0
    .goto 1421/0,1356.30,-588.73,40,0
    .goto 1421/0,1387.38,-545.33,40,0
    .goto 1421/0,1431.48,-525.17,40,0
    .goto 1421/0,1485.24,-558.77,40,0
    .goto 1421/0,1552.44,-587.05,40,0
    .goto 1421/0,1581.42,-549.81,40,0
    >>Kill |cRXP_ENEMY_Moonrage Bloodhowlers|r. Loot them for |cRXP_LOOT_Worgen Bits|r
    .complete 98298,1 --Worgen Bits (6)
    .mob Moonrage Bloodhowler
step
    .goto 1421/0,1593.60,551.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dalar Dawnweaver|r
    .turnin 98298 >>Turn in Arugal's Folly
    .turnin 99 >>Turn in Arugal's Folly
    .target Dalar Dawnweaver
step
    #completewith Drop460x1
    >>|cRXP_LOOT_A Talking Head|r can drop from |cRXP_ENEMY_Rot Hide Brute|r, |cRXP_ENEMY_Rot Hide Plague Weaver|r, |cRXP_ENEMY_Rot Hide Savage|r. Use it to start the quest if you get one
    .collect 3317,1,460 --A Talking Head (1)
    .accept 460 >>Accept Resting in Pieces
    .use 3317
step
    #label Drop460x1
    #loop
    .goto 1421/0,715.80,770.67,0
    .goto 1421/0,715.80,770.67,40,0
    .goto 1421/0,610.80,798.67,40,0
    .goto 1421/0,581.40,739.03,40,0
    .goto 1421/0,547.80,689.47,40,0
    .goto 1421/0,519.66,628.15,40,0
    .goto 1421/0,584.34,686.11,40,0
    .goto 1421/0,620.04,649.99,40,0
    .goto 1421/0,636.00,695.07,40,0
    .goto 1421/0,659.10,687.23,40,0
    >>Kill |cRXP_ENEMY_Rot Hide Brutes|r, |cRXP_ENEMY_Rot Hide Plague Weavers|r, |cRXP_ENEMY_Rot Hide Savages|r and |cRXP_ENEMY_Raging Rot Hides|r. Loot them for |cRXP_LOOT_Rot Hide Ichor|r
    .complete 443,1 --Rot Hide Ichor (1)
    .mob Rot Hide Brute
    .mob Rot Hide Plague Weaver
    .mob Rot Hide Savage
    .mob Raging Rot Hide
step
    .goto 1421/0,599.46,970.87
    >>Click the |cRXP_PICK_Shallow Grave|r
    .turnin 460 >>Turn in Resting in Pieces
    .isOnQuest 460
step
    .goto 1421/0,599.46,970.87
    >>Click the |cRXP_PICK_Shallow Grave|r
    .accept 461 >>Accept The Hidden Niche
    .isQuestTurnedIn 460 --any of: Resting in Pieces
    .xp <12,1
step
    .goto 1421/0,704.88,971.99
    >>Click the |cRXP_PICK_Dusty Shelf|r
    .turnin 461 >>Turn in The Hidden Niche
    .isOnQuest 461
step
    .goto 1421/0,704.88,971.99
    >>Click the |cRXP_PICK_Dusty Shelf|r
    .accept 491 >>Accept Wand to Bethor
    .isQuestTurnedIn 461 --any of: The Hidden Niche
    .xp <12,1
step
    .goto 1421/0,1652.40,522.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Renferrel|r
    .turnin 443 >>Turn in Rot Hide Ichor
    .accept 444 >>Accept Rot Hide Origins
    .target Apothecary Renferrel
step
    +|cRXP_WARN_That is all of Silverpine Forest for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Undercity|r: Rot Hide Origins, Wand to Bethor
step
    .xp 18 >>|cRXP_WARN_The rest of Silverpine Forest is planned from level 18.|r Come back to this guide then
step
    .goto 1421/0,1593.60,551.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dalar Dawnweaver|r
    .accept 98299 >>Accept Stop the Spread
    .target Dalar Dawnweaver
step
    .goto 1421/0,1652.40,522.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Renferrel|r
    .accept 451 >>Accept A Recipe For Death
    .target Apothecary Renferrel
    .isQuestTurnedIn 450 --any of: A Recipe For Death
    .xp <9,1
step
    .goto 1421/0,1636.44,510.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Bates|r
    .target Innkeeper Bates
    .home >>Set your Hearthstone to Innkeeper Bates's inn
step
    .goto 1421/0,1602.84,520.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shadow Priest Allister|r
    .accept 95981 >>Accept Watching the Roads
    .accept 516 >>Accept Beren's Peril
    .target Shadow Priest Allister
step
    #loop
    .goto 1421/0,760.74,75.71,0
    .goto 1421/0,760.74,75.71,40,0
    .goto 1421/0,712.86,89.71,40,0
    .goto 1421/0,687.24,51.63,40,0
    .goto 1421/0,665.40,12.43,40,0
    .goto 1421/0,734.28,-65.69,40,0
    .goto 1421/0,736.80,-115.53,40,0
    .goto 1421/0,803.16,-40.21,40,0
    .goto 1421/0,767.46,21.95,40,0
    .goto 1421/0,719.58,28.95,40,0
    >>Kill |cRXP_ENEMY_Dalaran Wizards|r
    >>Kill |cRXP_ENEMY_Dalaran Watchers|r
    .complete 95981,2 --Dalaran Wizard slain (8)
    .complete 95981,1 --Dalaran Watcher slain (8)
    .mob Dalaran Wizard
    .mob Dalaran Watcher
step
    #loop
    .goto 1421/0,944.28,-289.97,0
    .goto 1421/0,944.28,-289.97,40,0
    .goto 1421/0,902.28,-366.13,40,0
    .goto 1421/0,915.72,-405.61,40,0
    .goto 1421/0,929.58,-351.85,40,0
    .goto 1421/0,982.08,-342.33,40,0
    .goto 1421/0,1037.52,-316.01,40,0
    .goto 1421/0,1044.24,-290.25,40,0
    .goto 1421/0,1011.48,-290.25,40,0
    .goto 1421/0,966.12,-307.33,40,0
    >>Kill |cRXP_ENEMY_Ravenclaw Drudgers|r
    >>Kill |cRXP_ENEMY_Ravenclaw Guardians|r
    .complete 516,1 --Ravenclaw Drudger slain (6)
    .complete 516,2 --Ravenclaw Guardian slain (6)
    .mob Ravenclaw Drudger
    .mob Ravenclaw Guardian
step
    #loop
    .goto 1421/0,1449.54,-743.85,0
    .goto 1421/0,1449.54,-743.85,40,0
    .goto 1421/0,1496.16,-727.05,40,0
    .goto 1421/0,1520.52,-686.73,40,0
    .goto 1421/0,1560.84,-651.45,40,0
    .goto 1421/0,1593.60,-671.89,40,0
    .goto 1421/0,1585.20,-698.77,40,0
    .goto 1421/0,1547.40,-706.61,40,0
    .goto 1421/0,1533.54,-742.17,40,0
    .goto 1421/0,1501.62,-758.97,40,0
    >>Kill |cRXP_ENEMY_Haggard Refugees|r
    >>Kill |cRXP_ENEMY_Sickly Refugees|r
    .complete 98299,1 --Haggard Refugee slain (5)
    .complete 98299,2 --Sickly Refugee slain (5)
    .mob Haggard Refugee
    .mob Sickly Refugee
step
    #completewith next
    .hs >>Hearth to Innkeeper Bates's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1421/0,1602.84,520.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shadow Priest Allister|r
    .turnin 516 >>Turn in Beren's Peril
    .turnin 95981 >>Turn in Watching the Roads
    .target Shadow Priest Allister
step
    .goto 1421/0,1593.60,551.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dalar Dawnweaver|r
    .turnin 98299 >>Turn in Stop the Spread
    .target Dalar Dawnweaver
step << Undead Paladin
    .xp 18 >>Grind to level 18 (A Curious Pair needs it)
step << Undead Paladin
    .goto 1421/0,1629.72,518.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trevan Rol|r
    .accept 91859 >>Accept A Curious Pair
    .target Trevan Rol
step << Undead Paladin
    .goto 1421/0,1528.50,495.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathguard Baldren|r
    .turnin 91859 >>Turn in A Curious Pair
    .accept 91860 >>Accept A Grim Fate
    .target Deathguard Baldren
step << Undead Paladin
    .goto 1421/0,722.94,705.15
    >>Click the |cRXP_PICK_Charred Remains|r
    .turnin 91860 >>Turn in A Grim Fate
    .accept 91861 >>Accept Into Fenris Keep
step << Undead Paladin
    .goto 1421/0,696.06,1011.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lumina Windsinger|r
    .turnin 91861 >>Turn in Into Fenris Keep
    .accept 91862 >>Accept Lumina Windsinger
    .target Lumina Windsinger
step << Undead Paladin
    #loop
    .goto 1421/0,682.62,998.59,0
    .goto 1421/0,682.62,998.59,40,0
    .goto 1421/0,662.46,1015.95,40,0
    .goto 1421/0,660.36,964.71,40,0
    .goto 1421/0,684.30,965.55,40,0
    .goto 1421/0,733.86,1021.27,40,0
    >>Kill |cRXP_ENEMY_Rot Hide Savages|r, |cRXP_ENEMY_Raging Rot Hides|r, |cRXP_ENEMY_Rot Hide Bruisers|r and |cRXP_ENEMY_Snarlmanes|r. Loot them for |cRXP_LOOT_Fenris Isle Key|r
    .complete 91862,1 --Fenris Isle Key (1)
    .mob Rot Hide Savage
    .mob Raging Rot Hide
    .mob Rot Hide Bruiser
    .mob Snarlmane
step << Undead Paladin
    .goto 1421/0,696.06,1011.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lumina Windsinger|r
    .turnin 91862 >>Turn in Lumina Windsinger
    .accept 96204 >>Accept The Windshaper's Wrath
    .target Lumina Windsinger
step << Undead Paladin
    .goto 1421/0,1630.14,519.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lumina Windsinger|r
    .turnin 96204 >>Turn in The Windshaper's Wrath
    .accept 95034 >>Accept The Debt
    .target Lumina Windsinger
step << Undead Paladin
    .goto 1421/0,1630.14,519.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lumina Windsinger|r
    >>|cRXP_WARN_The database has no objectives for The Debt. Skip this step if the quest is not finished|r
    .turnin 95034 >>Turn in The Debt
    .target Lumina Windsinger
    .isOnQuest 95034
step
    #loop
    .goto 1421/0,741.42,456.23,0
    .goto 1421/0,741.42,456.23,40,0
    .goto 1421/0,738.48,511.11,40,0
    .goto 1421/0,682.62,485.07,40,0
    .goto 1421/0,649.44,450.63,40,0
    .goto 1421/0,620.04,399.39,40,0
    .goto 1421/0,610.38,283.75,40,0
    .goto 1421/0,645.24,343.95,40,0
    .goto 1421/0,688.92,349.27,40,0
    .goto 1421/0,696.06,408.91,40,0
    >>Kill |cRXP_ENEMY_Vile Fin Shredders|r, |cRXP_ENEMY_Vile Fin Tidehunters|r, |cRXP_ENEMY_Vile Fin Oracles|r and |cRXP_ENEMY_Vile Fin Lakestalkers|r. Loot them for |cRXP_LOOT_Hardened Tumor|r
    .complete 451,3 --Hardened Tumor (1)
    .mob Vile Fin Shredder
    .mob Vile Fin Tidehunter
    .mob Vile Fin Oracle
    .mob Vile Fin Lakestalker
    .isOnQuest 451
step
    #loop
    .goto 1421/0,567.96,619.19,0
    .goto 1421/0,567.96,619.19,40,0
    .goto 1421/0,520.92,594.27,40,0
    .goto 1421/0,486.06,621.71,40,0
    .goto 1421/0,445.74,658.67,40,0
    .goto 1421/0,486.48,679.11,40,0
    .goto 1421/0,457.92,710.47,40,0
    .goto 1421/0,510.00,726.99,40,0
    >>Kill |cRXP_ENEMY_Lake Skulkers|r and |cRXP_ENEMY_Elder Lake Skulkers|r. Loot them for |cRXP_LOOT_Lake Skulker Moss|r
    .complete 451,1 --Lake Skulker Moss (1)
    .mob Lake Skulker
    .mob Elder Lake Skulker
    .isOnQuest 451
step
    #loop
    .goto 1421/0,192.06,851.03,0
    .goto 1421/0,192.06,851.03,40,0
    .goto 1421/0,173.16,910.11,40,0
    .goto 1421/0,131.16,997.75,40,0
    .goto 1421/0,176.10,1018.47,40,0
    .goto 1421/0,241.20,1124.59,40,0
    .goto 1421/0,339.48,1096.59,40,0
    .goto 1421/0,281.94,1019.03,40,0
    .goto 1421/0,228.60,1011.19,40,0
    .goto 1421/0,235.32,935.87,40,0
    >>Kill |cRXP_ENEMY_Lake Creepers|r and |cRXP_ENEMY_Elder Lake Creepers|r. Loot them for |cRXP_LOOT_Lake Creeper Moss|r
    .complete 451,2 --Lake Creeper Moss (1)
    .mob Lake Creeper
    .mob Elder Lake Creeper
    .isOnQuest 451
step
    +|cRXP_WARN_That is all of Silverpine Forest for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Undercity|r: A Recipe For Death
step
    .xp 21 >>|cRXP_WARN_The rest of Silverpine Forest is planned from level 21.|r Come back to this guide then
step << Undead Paladin
    .goto 1421/0,1630.14,519.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lumina Windsinger|r
    .turnin 95034 >>Turn in The Debt
    .target Lumina Windsinger
    .isOnQuest 95034
step << !Undead !Mage !Priest !Rogue !Warlock
    .goto 1421/0,1533.96,474.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Karos|r
    .fp Sepulcher >> Get the Sepulcher flight path
    .target Karos Razok
step
    .goto 1421/0,1652.40,522.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Renferrel|r
    .accept 493 >>Accept Journey to Hillsbrad Foothills
    .target Apothecary Renferrel
step
    .goto 1421/0,1602.84,520.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shadow Priest Allister|r
    .accept 480 >>Accept The Weaver
    .target Shadow Priest Allister
step
    .goto 1421/0,787.20,-132.89
    >>Kill |cRXP_ENEMY_Archmage Ataeric|r and loot |cRXP_LOOT_Ataeric's Staff|r
    .complete 480,1 --Ataeric's Staff (1)
    .mob Archmage Ataeric
step
    .goto 1421/0,1010.22,-288.85
    >>Click the |cRXP_PICK_Offering Stone|r
    .accept 95885 >>Accept The Offering of Blood
    .accept 95883 >>Accept The Tortured Soul
step
    #completewith Drop95884x1
    >>|cRXP_LOOT_Note Scrap|r can drop from |cRXP_ENEMY_Ravenclaw Guardian|r, |cRXP_ENEMY_Ravenclaw Drudger|r. Use it to start the quest if you get one
    .collect 271343,1,95884 --Note Scrap (1)
    .accept 95884 >>Accept The Offering Stone
    .use 271343
step
    #label Drop95884x1
    #loop
    .goto 1421/0,1006.86,-294.45,0
    .goto 1421/0,1006.86,-294.45,40,0
    .goto 1421/0,1044.24,-290.25,40,0
    .goto 1421/0,982.08,-342.33,40,0
    .goto 1421/0,915.72,-405.61,40,0
    .goto 1421/0,902.28,-366.13,40,0
    .goto 1421/0,929.58,-351.85,40,0
    .goto 1421/0,928.74,-324.41,40,0
    .goto 1421/0,944.28,-289.97,40,0
    .goto 1421/0,966.12,-307.33,40,0
    >>Kill |cRXP_ENEMY_Tortured Souls|r
    >>Kill |cRXP_ENEMY_Ravenclaw Guardians|r and |cRXP_ENEMY_Ravenclaw Drudgers|r. Loot them for |cRXP_LOOT_Tortured Soul|r
    >>Kill |cRXP_ENEMY_Ravenclaw Guardians|r and |cRXP_ENEMY_Ravenclaw Drudgers|r. Loot them for |cRXP_LOOT_Note Scrap|r
    .complete 95885,1 --Tortured Soul slain (8)
    .complete 95883,1 --Tortured Soul (1)
    .complete 95884,1 --Note Scrap (1)
    .mob Tortured Soul
    .mob Ravenclaw Guardian
    .mob Ravenclaw Drudger
step
    .goto 1421/0,1010.22,-288.85
    >>Click the |cRXP_PICK_Offering Stone|r
    .turnin 95884 >>Turn in The Offering Stone while you are here
    .isQuestComplete 95884
step
    .goto 1421/0,1010.22,-288.85
    >>Click the |cRXP_PICK_Offering Stone|r
    .turnin 95883 >>Turn in The Tortured Soul
    .turnin 95885 >>Turn in The Offering of Blood
step
    .goto 1421/0,1010.22,-288.85
    >>Click the |cRXP_PICK_Offering Stone|r
    .turnin 95884 >>Turn in The Offering Stone
    .isOnQuest 95884
step
    .goto 1421/0,1602.84,520.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shadow Priest Allister|r
    .turnin 480 >>Turn in The Weaver
    .target Shadow Priest Allister
step << Shaman
    .goto 1421/0,1843.08,418.99
    >>Click the |cRXP_PICK_Brazier of Everfount|r
    .accept 100 >>Accept Call of Water
    .isQuestTurnedIn 63 --any of: Call of Water
    .xp <20,1
step << Shaman
    .goto 1421/0,1826.70,418.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Minor Manifestation of Water|r
    .turnin 100 >>Turn in Call of Water
    .target Minor Manifestation of Water
    .isOnQuest 100
step << Shaman
    .goto 1421/0,1826.70,418.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Minor Manifestation of Water|r
    .accept 96 >>Accept Call of Water
    .target Minor Manifestation of Water
    .isQuestTurnedIn 100 --any of: Call of Water
    .xp <20,1
step
    +|cRXP_WARN_End of the Silverpine Forest route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Hillsbrad Foothills|r: Journey to Hillsbrad Foothills
    >>|cRXP_FRIENDLY_The Barrens|r: Call of Water << Shaman
]])
