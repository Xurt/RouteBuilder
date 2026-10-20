-- 42-52 Feralas: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 3 parts (from level 42, 45, 48).
-- Split into 3 guides, listed under "42 - 49 Feralas" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Feralas.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 42 - 49 Feralas
#subweight -42
#name 42-43 Feralas: around Hadoken Swiftstrider

step
    .goto 1444/1,1924.97,-3094.10
    >>Click the |cRXP_PICK_Book|r
    .accept 81951 >>Accept The Liminal and the Arcane
step
    .goto 1444/1,173.57,-4385.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rok Orhan|r
    .turnin 2981 >>Turn in A Threat in Feralas
    .target Rok Orhan
    .isOnQuest 2981
step
    .goto 1444/1,173.57,-4385.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rok Orhan|r
    .accept 2975 >>Accept The Ogres of Feralas
    .target Rok Orhan
step
    .goto 1444/1,180.52,-4419.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Orwin Gizzmick|r
    .accept 2987 >>Accept Gordunni Cobalt
    .target Orwin Gizzmick
step
    .goto 1444/1,155.50,-4371.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bronk|r
    .vendor >> |cRXP_BUY_Buy|r |T134833:0|t[Superior Healing Potions] |cRXP_BUY_from him if they're up|r
    .target Bronk
    .subzoneskip 1099,1
step
    .goto 1444/1,163.84,-4346.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krueg Skullsplitter|r
    .accept 2973 >>Accept A New Cloak's Sheen
    .target Krueg Skullsplitter
step
    .goto 1444/1,235.42,-4333.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hadoken Swiftstrider|r
    .accept 2862 >>Accept War on the Woodpaw
    .target Hadoken Swiftstrider
step
    .goto 1444/1,268.78,-4354.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jangdor Swiftstrider|r
    .accept 2822 >>Accept The Mark of Quality
    .target Jangdor Swiftstrider
step
    .goto 1444/1,269.48,-4375.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Uzer'i|r
    .turnin 3122 >>Turn in Return to Witch Doctor Uzer'i
    .target Witch Doctor Uzer'i
    .isOnQuest 3122
step
    .goto 1444/1,243.07,-4460.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Greul|r
    .target Innkeeper Greul
    .home >>Set your Hearthstone to Innkeeper Greul's inn
step
    .goto 1444/1,242.37,-4460.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Greul|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .collect 4537,5 >>Buy a couple |T133980:0|t|cRXP_LOOT_Tel'Abim Bananas|r. |cRXP_WARN_You will need at least one to unlock a rune later|r << Hunter sod
    .target Innkeeper Greul
    .train 416083,1 << Hunter SoD
step << Hunter SoD
    .goto 1444/1,242.37,-4460.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Greul|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Greul
    .train 416083,3
step << Hunter
    .goto 1444/1,425.16,-4396.99,0
    .goto 1444/1,534.27,-4290.43,0
    .goto 1444/1,425.16,-4396.99,60,0
    .goto 1444/1,534.27,-4290.43,60,0
    >>|cRXP_WARN_Cast|r |T132164:0|t[Tame Beast] |cRXP_WARN_on a |cRXP_ENEMY_Longtooth Runner|r to tame it|r
    .train 17266 >>|cRXP_WARN_Attack mobs with it to learn|r |T132278:0|t[Bite (Rank 6)]
step << Hunter
    .goto 1444/1,264.61,-4371.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shyrka Wolfrunner|r
    .target Shyrka Wolfrunner
    .train 17266,3
    .zoneskip Feralas,1
step
    #completewith Drop2766x1
    >>|cRXP_LOOT_OOX-22/FE Distress Beacon|r can drop from |cRXP_ENEMY_Gordunni Ogre|r, |cRXP_ENEMY_Gordunni Brute|r, |cRXP_ENEMY_Gordunni Mauler|r. Use it to start the quest if you get one
    .collect 8705,1,2766 --OOX-22/FE Distress Beacon (1)
    .accept 2766 >>Accept Find OOX-22/FE!
    .use 8705
step
    #label Drop2766x1
    #loop
    .goto 1444/1,389.02,-4190.35,0
    .goto 1444/1,389.02,-4190.35,40,0
    .goto 1444/1,411.95,-4089.34,40,0
    >>Kill |cRXP_ENEMY_Woodpaw Mongrels|r, |cRXP_ENEMY_Woodpaw Trappers|r, |cRXP_ENEMY_Woodpaw Brutes|r and |cRXP_ENEMY_Woodpaw Mystics|r. Loot them for |cRXP_LOOT_Woodpaw Gnoll Mane|r
    .complete 2862,1 --Woodpaw Gnoll Mane (10)
    .mob Woodpaw Mongrel
    .mob Woodpaw Trapper
    .mob Woodpaw Brute
    .mob Woodpaw Mystic
step
    #completewith Along10
    >>As you go: Kill |cRXP_ENEMY_Gordunni Ogres|r. Kill |cRXP_ENEMY_Gordunni Brutes|r. |cRXP_WARN_Anything left is finished later|r
    .complete 2975,1 --Gordunni Ogre slain (10)
    .complete 2975,3 --Gordunni Brute slain (5)
    .mob Gordunni Ogre
    .mob Gordunni Brute
step
    #label Along10
    #loop
    .goto 1444/1,194.42,-3775.20,0
    .goto 1444/1,194.42,-3775.20,40,0
    .goto 1444/1,277.82,-3710.33,40,0
    >>Open the |cRXP_PICK_Gordunni Dirt Mound|r. Loot it for |cRXP_LOOT_Gordunni Cobalt|r
    .complete 2987,1 --Gordunni Cobalt (1)
step
    #completewith Drop2766x2
    >>|cRXP_LOOT_OOX-22/FE Distress Beacon|r can drop from |cRXP_ENEMY_Gordunni Ogre|r, |cRXP_ENEMY_Gordunni Brute|r, |cRXP_ENEMY_Gordunni Mauler|r. Use it to start the quest if you get one
    .collect 8705,1,2766 --OOX-22/FE Distress Beacon (1)
    .accept 2766 >>Accept Find OOX-22/FE!
    .use 8705
step
    #label Drop2766x2
    #loop
    .goto 1444/1,214.57,-3739.06,0
    .goto 1444/1,214.57,-3739.06,40,0
    .goto 1444/1,202.06,-3894.74,40,0
    .goto 1444/1,186.77,-3976.75,40,0
    >>Kill |cRXP_ENEMY_Gordunni Ogres|r
    >>Kill |cRXP_ENEMY_Gordunni Ogre Mages|r
    >>Kill |cRXP_ENEMY_Gordunni Brutes|r
    .complete 2975,1 --Gordunni Ogre slain (10)
    .complete 2975,2 --Gordunni Ogre Mage slain (8)
    .complete 2975,3 --Gordunni Brute slain (5)
    .mob Gordunni Ogre
    .mob Gordunni Ogre Mage
    .mob Gordunni Brute
step
    .goto 1444/1,235.42,-4333.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hadoken Swiftstrider|r
    .turnin 2862 >>Turn in War on the Woodpaw
    .accept 2863 >>Accept Alpha Strike
    .target Hadoken Swiftstrider
step
    .goto 1444/1,180.52,-4419.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Orwin Gizzmick|r
    .turnin 2987 >>Turn in Gordunni Cobalt
    .target Orwin Gizzmick
step
    .goto 1444/1,173.57,-4385.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rok Orhan|r
    .turnin 2975 >>Turn in The Ogres of Feralas
    .accept 2980 >>Accept The Ogres of Feralas
    .target Rok Orhan
step
    #completewith Drop2766x3
    >>|cRXP_LOOT_OOX-22/FE Distress Beacon|r can drop from |cRXP_ENEMY_Gordunni Ogre|r, |cRXP_ENEMY_Gordunni Brute|r, |cRXP_ENEMY_Gordunni Mauler|r. Use it to start the quest if you get one
    .collect 8705,1,2766 --OOX-22/FE Distress Beacon (1)
    .accept 2766 >>Accept Find OOX-22/FE!
    .use 8705
step
    #loop
    .goto 1444/1,577.36,-4542.48,0
    .goto 1444/1,577.36,-4542.48,40,0
    .goto 1444/1,814.36,-4543.41,40,0
    .goto 1444/1,888.72,-4562.40,40,0
    >>Kill |cRXP_ENEMY_Sprite Darters|r and |cRXP_ENEMY_Captured Sprite Darters|r. Loot them for |cRXP_LOOT_Iridescent Sprite Darter Wing|r
    .complete 2973,1 --Iridescent Sprite Darter Wing (10)
    .mob Sprite Darter
    .mob Captured Sprite Darter
step
    #label Drop2766x3
    #loop
    .goto 1444/1,477.98,-4957.16,0
    .goto 1444/1,477.98,-4957.16,40,0
    .goto 1444/1,349.40,-4969.21,40,0
    >>Kill |cRXP_ENEMY_Woodpaw Alphas|r
    .complete 2863,1 --Woodpaw Alpha slain (5)
    .mob Woodpaw Alpha
step
    #completewith next
    .hs >>Hearth to Innkeeper Greul's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1444/1,163.84,-4346.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krueg Skullsplitter|r
    .turnin 2973 >>Turn in A New Cloak's Sheen
    .accept 2974 >>Accept A Grim Discovery
    .target Krueg Skullsplitter
step
    .goto 1444/1,235.42,-4333.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hadoken Swiftstrider|r
    .turnin 2863 >>Turn in Alpha Strike
    .accept 2902 >>Accept Woodpaw Investigation
    .target Hadoken Swiftstrider
step
    #completewith Drop2766x4
    >>|cRXP_LOOT_OOX-22/FE Distress Beacon|r can drop from |cRXP_ENEMY_Gordunni Ogre|r, |cRXP_ENEMY_Gordunni Brute|r, |cRXP_ENEMY_Gordunni Mauler|r. Use it to start the quest if you get one
    .collect 8705,1,2766 --OOX-22/FE Distress Beacon (1)
    .accept 2766 >>Accept Find OOX-22/FE!
    .use 8705
step
    #label Drop2766x4
    #loop
    .goto 1444/1,623.23,-4171.35,0
    .goto 1444/1,623.23,-4171.35,40,0
    .goto 1444/1,784.47,-4182.47,40,0
    >>Kill |cRXP_ENEMY_Grimtotem Raiders|r, |cRXP_ENEMY_Grimtotem Naturalists|r and |cRXP_ENEMY_Grimtotem Shamans|r. Loot them for |cRXP_LOOT_Grimtotem Horn|r
    .complete 2974,1 --Grimtotem Horn (20)
    .mob Grimtotem Raider
    .mob Grimtotem Naturalist
    .mob Grimtotem Shaman
step
    .goto 1444/1,463.38,-4957.63
    >>Click the |cRXP_PICK_Woodpaw Battle Map|r
    .turnin 2902 >>Turn in Woodpaw Investigation
    .accept 2903 >>Accept The Battle Plans
step
    .goto 1444/1,163.84,-4346.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krueg Skullsplitter|r
    .turnin 2974 >>Turn in A Grim Discovery
    .accept 2976 >>Accept A Grim Discovery
    .target Krueg Skullsplitter
step
    .goto 1444/1,235.42,-4333.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hadoken Swiftstrider|r
    .turnin 2903 >>Turn in The Battle Plans
    .accept 7730 >>Accept Zukk'ash Infestation
    .target Hadoken Swiftstrider
step << !Mage
    .goto 1444/1,242.37,-4460.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Greul|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food|r << Rogue/Warrior
    >>|cRXP_WARN_Make sure to buy 5 stacks or more. A LONG grind section is coming up|r
    .target Innkeeper Greul
step
    #completewith Drop2766x5
    >>|cRXP_LOOT_OOX-22/FE Distress Beacon|r can drop from |cRXP_ENEMY_Gordunni Ogre|r, |cRXP_ENEMY_Gordunni Brute|r, |cRXP_ENEMY_Gordunni Mauler|r. Use it to start the quest if you get one
    .collect 8705,1,2766 --OOX-22/FE Distress Beacon (1)
    .accept 2766 >>Accept Find OOX-22/FE!
    .use 8705
step
    #loop
    .goto 1444/1,284.07,-5251.38,0
    .goto 1444/1,284.07,-5251.38,40,0
    .goto 1444/1,410.56,-5314.39,40,0
    >>Kill |cRXP_ENEMY_Zukk'ash Stingers|r, |cRXP_ENEMY_Zukk'ash Wasps|r, |cRXP_ENEMY_Zukk'ash Workers|r and |cRXP_ENEMY_Zukk'ash Tunnelers|r. Loot them for |cRXP_LOOT_Zukk'ash Carapace|r
    .complete 7730,1 --Zukk'ash Carapace (20)
    .mob Zukk'ash Stinger
    .mob Zukk'ash Wasp
    .mob Zukk'ash Worker
    .mob Zukk'ash Tunneler
step
    .goto 1444/1,1269.58,-5442.27
    >>Kill |cRXP_ENEMY_Gordunni Shamans|r
    .complete 2980,1 --Gordunni Shaman slain (10)
    .mob Gordunni Shaman
step
    #loop
    .goto 1444/1,1209.81,-5055.39,0
    .goto 1444/1,1209.81,-5055.39,40,0
    .goto 1444/1,1197.30,-4940.02,40,0
    >>Kill |cRXP_ENEMY_Gordunni Warlocks|r
    >>Kill |cRXP_ENEMY_Gordunni Maulers|r
    .complete 2980,2 --Gordunni Warlock slain (10)
    .complete 2980,3 --Gordunni Mauler slain (5)
    .mob Gordunni Warlock
    .mob Gordunni Mauler
step
    #label Drop2766x5
    #loop
    .goto 1444/1,1809.60,-5050.76,0
    .goto 1444/1,1809.60,-5050.76,40,0
    .goto 1444/1,1810.99,-5149.91,40,0
    >>Kill |cRXP_ENEMY_Feral Scar Yetis|r, |cRXP_ENEMY_Hulking Feral Scars|r, |cRXP_ENEMY_Enraged Feral Scars|r and |cRXP_ENEMY_Bloodroar the Stalkers|r. Loot them for |cRXP_LOOT_Thick Yeti Hide|r
    .complete 2822,1 --Thick Yeti Hide (10)
    .mob Feral Scar Yeti
    .mob Hulking Feral Scar
    .mob Enraged Feral Scar
    .mob Bloodroar the Stalker
step
    .goto 1444/1,1824.19,-5072.53,0
    .goto 1444/1,1609.44,-4977.55,70,0
    .goto 1444/1,1749.83,-4973.84,70,0
    .goto 1444/1,1824.19,-5072.53,70,0
    >>Kill |cRXP_ENEMY_Yetis|r. Loot them for their |cRXP_LOOT_Hides|r
    .train 416083,3 << Hunter sod
step
    .goto 1444/1,1733.84,-4947.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Homing Robot OOX-22/FE|r
    .turnin 2766 >>Turn in Find OOX-22/FE!
    .target Homing Robot OOX-22/FE
    .isOnQuest 2766
step
    .goto 1444/1,1733.84,-4947.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Homing Robot OOX-22/FE|r
    .accept 2767 >>Accept Rescue OOX-22/FE!
    .target Homing Robot OOX-22/FE
    .isQuestTurnedIn 2766 --any of: Find OOX-22/FE!
    .xp <40,1
step
    .goto 1444/1,2270.38,-4377.07
    >>Escort OOX-22/FE to the dock along the Forgotten Coast
    .complete 2767,1 --Escort OOX-22/FE to the dock along the Forgotten Coast
    .isOnQuest 2767
step
    .goto 1444/1,3621.46,-5494.63
    >>Kill |cRXP_ENEMY_Hatecrest Nagas|r
    .xp 44+40000 >> Grind to level 44 40000/111800 or higher
step
    .goto 1444/1,242.37,-4460.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Greul|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    >>|cRXP_WARN_Make sure you DO NOT sell any|r |T135992:0|t[Long Elegant Feather]
    .target Innkeeper Greul
    .subzoneskip 1099,1
step
    #completewith next
    .hs >>Hearth to Innkeeper Greul's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1444/1,173.57,-4385.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rok Orhan|r
    .turnin 2980 >>Turn in The Ogres of Feralas
    .target Rok Orhan
step
    .goto 1444/1,235.42,-4333.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hadoken Swiftstrider|r
    .turnin 7730 >>Turn in Zukk'ash Infestation
    .target Hadoken Swiftstrider
step
    .goto 1444/1,269.48,-4375.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Uzer'i|r
    .accept 3123 >>Accept Testing the Vessel
    .target Witch Doctor Uzer'i
    .isQuestTurnedIn 3122 --any of: Return to Witch Doctor Uzer'i
    .xp <40,1
step
    .goto 1444/1,269.48,-4375.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Uzer'i|r
    .accept 3121 >>Accept A Strange Request
    .target Witch Doctor Uzer'i
step
    .goto 1444/1,268.78,-4354.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jangdor Swiftstrider|r
    .turnin 2822 >>Turn in The Mark of Quality
    .target Jangdor Swiftstrider
step << Druid
    .goto 1444/1,159.67,-4326.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jannos|r
    .train 1824 >>Train your class spells
    .target Jannos Lighthoof
    .xp <44,1
    .xp >46,1
step << Druid
    .goto 1444/1,159.67,-4326.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jannos|r
    .train 9821 >>Train your class spells
    .target Jannos Lighthoof
    .xp <46,1
step
    .goto 1444/1,1924.97,-3094.10
    >>Open the |cRXP_PICK_Book|r. Loot it for |cRXP_LOOT_The Liminal and the Arcane|r
    .complete 81951,1 --The Liminal and the Arcane (1)
step
    .goto 1444/1,269.48,-4375.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Uzer'i|r
    .accept 3124 >>Accept Hippogryph Muisek
    .target Witch Doctor Uzer'i
    .isQuestTurnedIn 3123 --any of: Testing the Vessel
    .xp <40,1
step
    #completewith Drop2766x6
    >>|cRXP_LOOT_OOX-22/FE Distress Beacon|r can drop from |cRXP_ENEMY_Gordunni Ogre|r, |cRXP_ENEMY_Gordunni Brute|r, |cRXP_ENEMY_Gordunni Mauler|r. Use it to start the quest if you get one
    .collect 8705,1,2766 --OOX-22/FE Distress Beacon (1)
    .accept 2766 >>Accept Find OOX-22/FE!
    .use 8705
step
    #label Drop2766x6
    #loop
    .goto 1444/1,1605.27,-5640.12,0
    .goto 1444/1,1605.27,-5640.12,40,0
    .goto 1444/1,1651.83,-5670.70,40,0
    .goto 1444/1,1715.08,-5516.41,40,0
    >>Kill |cRXP_ENEMY_Frayfeather Hippogryphs|r, |cRXP_ENEMY_Frayfeather Stagwings|r, |cRXP_ENEMY_Frayfeather Skystormers|r and |cRXP_ENEMY_Frayfeather Patriarches|r. Loot them for |cRXP_LOOT_Hippogryph Muisek|r
    .complete 3124,1 --Hippogryph Muisek (1)
    .mob Frayfeather Hippogryph
    .mob Frayfeather Stagwing
    .mob Frayfeather Skystormer
    .mob Frayfeather Patriarch
    .isOnQuest 3124
step
    .goto 1444/1,269.48,-4375.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Uzer'i|r
    .turnin 3124 >>Turn in Hippogryph Muisek
    .target Witch Doctor Uzer'i
    .isOnQuest 3124
step
    .goto 1444/1,269.48,-4375.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Uzer'i|r
    .accept 3125 >>Accept Faerie Dragon Muisek
    .target Witch Doctor Uzer'i
    .isQuestTurnedIn 3124 --any of: Hippogryph Muisek
    .xp <40,1
step
    #completewith Drop2766x7
    >>|cRXP_LOOT_OOX-22/FE Distress Beacon|r can drop from |cRXP_ENEMY_Gordunni Ogre|r, |cRXP_ENEMY_Gordunni Brute|r, |cRXP_ENEMY_Gordunni Mauler|r. Use it to start the quest if you get one
    .collect 8705,1,2766 --OOX-22/FE Distress Beacon (1)
    .accept 2766 >>Accept Find OOX-22/FE!
    .use 8705
step
    #label Drop2766x7
    #loop
    .goto 1444/1,577.36,-4542.48,0
    .goto 1444/1,577.36,-4542.48,40,0
    .goto 1444/1,655.90,-4623.56,40,0
    >>Kill |cRXP_ENEMY_Sprite Dragons|r and |cRXP_ENEMY_Sprite Darters|r. Loot them for |cRXP_LOOT_Faerie Dragon Muisek|r
    .complete 3125,1 --Faerie Dragon Muisek (1)
    .mob Sprite Dragon
    .mob Sprite Darter
    .isOnQuest 3125
step
    .goto 1444/1,269.48,-4375.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Uzer'i|r
    .turnin 3125 >>Turn in Faerie Dragon Muisek
    .target Witch Doctor Uzer'i
    .isOnQuest 3125
step
    .goto 1444/1,269.48,-4375.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Uzer'i|r
    .turnin 3123 >>Turn in Testing the Vessel
    .target Witch Doctor Uzer'i
    .isQuestComplete 3123
step
    +|cRXP_WARN_That is all of Feralas for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Orgrimmar|r: A Grim Discovery, A Strange Request
    >>|cRXP_FRIENDLY_Stranglethorn Vale|r: Rescue OOX-22/FE!
    >>|cRXP_FRIENDLY_another zone|r: The Liminal and the Arcane
step
    +|cRXP_WARN_The rest of Feralas is planned from level 45.|r Load its guide for level 45 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 42 - 49 Feralas
#subweight -42
#name 45-46 Feralas

step
    .goto 1444/1,173.57,-4385.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rok Orhan|r
    .accept 2979 >>Accept Dark Ceremony
    .target Rok Orhan
    .isQuestTurnedIn 2978 --any of: The Gordunni Scroll
    .xp <38,1
step
    .goto 1444/1,235.42,-4333.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hadoken Swiftstrider|r
    .accept 7731 >>Accept Stinglasher
    .target Hadoken Swiftstrider
    .isQuestTurnedIn 2903 --any of: The Battle Plans
step
    .goto 1444/1,188.86,-5186.05
    >>Kill |cRXP_ENEMY_Stinglasher|r and loot |cRXP_LOOT_Stinglasher's Glands|r
    .complete 7731,1 --Stinglasher's Glands (1)
    .mob Stinglasher
    .isOnQuest 7731
step
    .goto 1444/1,1286.26,-5523.36
    >>Kill |cRXP_ENEMY_Gordunni Mage-Lord|r and loot |cRXP_LOOT_Gordunni Orb|r
    .complete 2979,1 --Gordunni Orb (1)
    .mob Gordunni Mage-Lord
    .isOnQuest 2979
step
    .goto 1444/1,173.57,-4385.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rok Orhan|r
    .turnin 2979 >>Turn in Dark Ceremony
    .target Rok Orhan
    .isOnQuest 2979
step
    .goto 1444/1,173.57,-4385.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rok Orhan|r
    .accept 3002 >>Accept The Gordunni Orb
    .target Rok Orhan
    .isQuestTurnedIn 2979 --any of: Dark Ceremony
    .xp <38,1
step
    .goto 1444/1,235.42,-4333.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hadoken Swiftstrider|r
    .turnin 7731 >>Turn in Stinglasher
    .target Hadoken Swiftstrider
    .isOnQuest 7731
step
    .goto 1444/1,235.42,-4333.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hadoken Swiftstrider|r
    .accept 7732 >>Accept Zukk'ash Report
    .target Hadoken Swiftstrider
    .isQuestTurnedIn 7730 --Zukk'ash Infestation
    .isQuestTurnedIn 7731 --Stinglasher
step
    .goto 1444/1,268.78,-4354.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jangdor Swiftstrider|r
    .accept 7734 >>Accept Improved Quality
    .target Jangdor Swiftstrider
    .isQuestTurnedIn 2822 --any of: The Mark of Quality
step
    .goto 1444/1,269.48,-4375.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Uzer'i|r
    .accept 3128 >>Accept Natural Materials
    .target Witch Doctor Uzer'i
    .isQuestTurnedIn 3122 --any of: Return to Witch Doctor Uzer'i
    .xp <40,1
step
    #loop
    .goto 1444/1,1551.75,-5314.86,0
    .goto 1444/1,1551.75,-5314.86,40,0
    .goto 1444/1,1619.17,-5348.22,40,0
    .goto 1444/1,1715.08,-5516.41,40,0
    .goto 1444/1,1651.83,-5670.70,40,0
    .goto 1444/1,1583.72,-5446.44,40,0
    >>Kill |cRXP_ENEMY_Frayfeather Hippogryphs|r, |cRXP_ENEMY_Frayfeather Stagwings|r, |cRXP_ENEMY_Frayfeather Skystormers|r and |cRXP_ENEMY_Frayfeather Patriarches|r. Loot them for |cRXP_LOOT_Metallic Fragments|r
    .complete 3128,4 --Metallic Fragments (40)
    .mob Frayfeather Hippogryph
    .mob Frayfeather Stagwing
    .mob Frayfeather Skystormer
    .mob Frayfeather Patriarch
    .isOnQuest 3128
step
    #loop
    .goto 1444/1,1651.83,-5670.70,0
    .goto 1444/1,1651.83,-5670.70,40,0
    .goto 1444/1,1605.27,-5640.12,40,0
    .goto 1444/1,1715.08,-5516.41,40,0
    >>Kill |cRXP_ENEMY_Frayfeather Hippogryphs|r, |cRXP_ENEMY_Frayfeather Stagwings|r, |cRXP_ENEMY_Frayfeather Skystormers|r and |cRXP_ENEMY_Frayfeather Patriarches|r. Loot them for |cRXP_LOOT_Resilient Sinew|r
    .complete 3128,3 --Resilient Sinew (1)
    .mob Frayfeather Hippogryph
    .mob Frayfeather Stagwing
    .mob Frayfeather Skystormer
    .mob Frayfeather Patriarch
    .isOnQuest 3128
step
    #loop
    .goto 1444/1,655.90,-4623.56,0
    .goto 1444/1,655.90,-4623.56,40,0
    .goto 1444/1,614.89,-4449.35,40,0
    >>Kill |cRXP_ENEMY_Sprite Dragons|r, |cRXP_ENEMY_Sprite Darters|r, |cRXP_ENEMY_Land Walkers|r and |cRXP_ENEMY_Cliff Giants|r. Loot them for |cRXP_LOOT_Encrusted Minerals|r
    .complete 3128,2 --Encrusted Minerals (6)
    .mob Sprite Dragon
    .mob Sprite Darter
    .mob Land Walker
    .mob Cliff Giant
    .isOnQuest 3128
step
    .goto 1444/1,269.48,-4375.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Uzer'i|r
    .accept 3126 >>Accept Treant Muisek
    .target Witch Doctor Uzer'i
    .isQuestTurnedIn 3125 --any of: Faerie Dragon Muisek
    .xp <40,1
step
    .goto 1444/1,305.62,-4166.25
    >>Kill |cRXP_ENEMY_Wandering Forest Walker|r and loot |cRXP_LOOT_Treant Muisek|r
    .complete 3126,1 --Treant Muisek (1)
    .mob Wandering Forest Walker
    .isOnQuest 3126
step
    .goto 1444/1,269.48,-4375.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Uzer'i|r
    .turnin 3126 >>Turn in Treant Muisek
    .target Witch Doctor Uzer'i
    .isOnQuest 3126
step
    .goto 1444/1,305.62,-4166.25
    >>Kill |cRXP_ENEMY_Wandering Forest Walkers|r. Loot them for |cRXP_LOOT_Splintered Log|r
    .complete 3128,1 --Splintered Log (2)
    .mob Wandering Forest Walker
    .isOnQuest 3128
step
    #loop
    .goto 1444/1,1630.98,-3897.98,0
    .goto 1444/1,1630.98,-3897.98,40,0
    .goto 1444/1,1738.71,-3842.38,40,0
    .goto 1444/1,1762.34,-3775.20,40,0
    >>Kill |cRXP_ENEMY_Rage Scar Yetis|r, |cRXP_ENEMY_Elder Rage Scars|r, |cRXP_ENEMY_Ferocious Rage Scars|r and |cRXP_ENEMY_Lurking Feral Scars|r. Loot them for |cRXP_LOOT_Rage Scar Yeti Hide|r
    .complete 7734,1 --Rage Scar Yeti Hide (10)
    .mob Rage Scar Yeti
    .mob Elder Rage Scar
    .mob Ferocious Rage Scar
    .mob Lurking Feral Scar
    .isOnQuest 7734
step
    .goto 1444/1,269.48,-4375.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Uzer'i|r
    .turnin 3128 >>Turn in Natural Materials
    .target Witch Doctor Uzer'i
    .isOnQuest 3128
step
    .goto 1444/1,268.78,-4354.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jangdor Swiftstrider|r
    .turnin 7734 >>Turn in Improved Quality
    .target Jangdor Swiftstrider
    .isOnQuest 7734
step << Druid
    .goto 1444/1,159.67,-4326.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jannos|r
    .train 9884 >>Train your class spells
    .target Jannos Lighthoof
    .xp <50,1
    .xp >52,1
    .subzoneskip 1099,1
step << Druid
    .goto 1444/1,159.67,-4326.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jannos|r
    .train 9894 >>Train your class spells
    .target Jannos Lighthoof
    .xp <52,1
    .subzoneskip 1099,1
step
    +|cRXP_WARN_That is all of Feralas for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Orgrimmar|r: The Gordunni Orb, Zukk'ash Report
step
    +|cRXP_WARN_The rest of Feralas is planned from level 48.|r Load its guide for level 48 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 42 - 49 Feralas
#subweight -42
#name 48-49 Feralas

step
    .goto 1444/1,147.16,-4397.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Talo Thornhoof|r
    .accept 3063 >>Accept Vengeance on the Northspring
    .accept 3062 >>Accept Dark Heart
    .target Talo Thornhoof
step
    .goto 1444/1,269.48,-4375.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Uzer'i|r
    .accept 3380 >>Accept The Sunken Temple
    .target Witch Doctor Uzer'i
step
    .goto 1444/1,269.48,-4375.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Uzer'i|r
    .accept 3127 >>Accept Mountain Giant Muisek
    .target Witch Doctor Uzer'i
    .isQuestTurnedIn 3126 --any of: Treant Muisek
    .xp <40,1
step
    .goto 1444/1,2327.37,-4378.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zorbin Fandazzle|r
    .accept 7003 >>Accept Zapped Giants
    .accept 7721 >>Accept Fuel for the Zapping
    .target Zorbin Fandazzle
step
    #loop
    .goto 1444/1,2586.61,-4123.16,0
    .goto 1444/1,2586.61,-4123.16,40,0
    .goto 1444/1,2680.43,-4075.90,40,0
    >>Kill |cRXP_ENEMY_Sea Elementals|r and |cRXP_ENEMY_Sea Sprays|r. Loot them for |cRXP_LOOT_Water Elemental Core|r
    .complete 7721,1 --Water Elemental Core (10)
    .mob Sea Elemental
    .mob Sea Spray
step
    #completewith Along5
    >>As you go: Kill |cRXP_ENEMY_Land Walkers|r, |cRXP_ENEMY_Cliff Giants|r, |cRXP_ENEMY_Shore Striders|r and |cRXP_ENEMY_Deep Striders|r. Loot them for |cRXP_LOOT_Miniaturization Residue|r. |cRXP_WARN_Anything left is finished later|r
    .complete 7003,1 --Miniaturization Residue (15)
    .mob Land Walker
    .mob Cliff Giant
    .mob Shore Strider
    .mob Deep Strider
step
    #label Along5
    #loop
    .goto 1444/1,2668.62,-3381.37,0
    .goto 1444/1,2668.62,-3381.37,40,0
    .goto 1444/1,2788.85,-3358.20,40,0
    >>Kill |cRXP_ENEMY_Land Walkers|r, |cRXP_ENEMY_Cliff Giants|r, |cRXP_ENEMY_Zapped Land Walkers|r and |cRXP_ENEMY_Zapped Cliff Giants|r. Loot them for |cRXP_LOOT_Mountain Giant Muisek|r
    .complete 3127,1 --Mountain Giant Muisek (1)
    .mob Land Walker
    .mob Cliff Giant
    .mob Zapped Land Walker
    .mob Zapped Cliff Giant
    .isOnQuest 3127
step
    #loop
    .goto 1444/1,2668.62,-3381.37,0
    .goto 1444/1,2668.62,-3381.37,40,0
    .goto 1444/1,2788.85,-3358.20,40,0
    >>Kill |cRXP_ENEMY_Land Walkers|r, |cRXP_ENEMY_Cliff Giants|r, |cRXP_ENEMY_Shore Striders|r and |cRXP_ENEMY_Deep Striders|r. Loot them for |cRXP_LOOT_Miniaturization Residue|r
    .complete 7003,1 --Miniaturization Residue (15)
    .mob Land Walker
    .mob Cliff Giant
    .mob Shore Strider
    .mob Deep Strider
step
    #completewith Along9
    >>As you go: Kill |cRXP_ENEMY_Northspring Windcallers|r. |cRXP_WARN_Anything left is finished later|r
    .complete 3063,4 --Northspring Windcaller slain (4)
    .mob Northspring Windcaller
step
    #completewith Along7
    >>As you go: Kill |cRXP_ENEMY_Northspring Harpies|r. |cRXP_WARN_Anything left is finished later|r
    .complete 3063,1 --Northspring Harpy slain (4)
    .mob Northspring Harpy
step
    #completewith Along7
    >>As you go: Kill |cRXP_ENEMY_Northspring Roguefeathers|r. Kill |cRXP_ENEMY_Northspring Slayers|r. |cRXP_WARN_Anything left is finished later|r
    .complete 3063,2 --Northspring Roguefeather slain (4)
    .complete 3063,3 --Northspring Slayer slain (4)
    .mob Northspring Roguefeather
    .mob Northspring Slayer
step
    #label Along7
    #loop
    .goto 1444/1,2784.68,-3049.16,0
    .goto 1444/1,2784.68,-3049.16,40,0
    .goto 1444/1,2753.41,-2944.44,40,0
    .goto 1444/1,2679.74,-3014.87,40,0
    >>Kill |cRXP_ENEMY_Northspring Harpies|r, |cRXP_ENEMY_Northspring Roguefeathers|r, |cRXP_ENEMY_Northspring Slayers|r and |cRXP_ENEMY_Northspring Windcallers|r. Loot them for |cRXP_LOOT_Horn of Hatetalon|r
    .collect 9530,1,3062,1 --Horn of Hatetalon (1)
    .mob Northspring Harpy
    .mob Northspring Roguefeather
    .mob Northspring Slayer
    .mob Northspring Windcaller
step
    .goto 1444/1,2623.44,-2765.13
    >>Kill |cRXP_ENEMY_Edana Hatetalon|r and loot |cRXP_LOOT_Edana's Dark Heart|r
    .complete 3062,1 --Edana's Dark Heart (1)
    .mob Edana Hatetalon
step
    #label Along9
    .goto 1444/1,2660.28,-3031.09
    >>Kill |cRXP_ENEMY_Northspring Harpies|r
    .complete 3063,1 --Northspring Harpy slain (4)
    .mob Northspring Harpy
step
    #loop
    .goto 1444/1,2764.53,-2971.32,0
    .goto 1444/1,2764.53,-2971.32,40,0
    .goto 1444/1,2784.68,-3049.16,40,0
    .goto 1444/1,2706.84,-2904.13,40,0
    >>Kill |cRXP_ENEMY_Northspring Roguefeathers|r
    >>Kill |cRXP_ENEMY_Northspring Slayers|r
    >>Kill |cRXP_ENEMY_Northspring Windcallers|r
    .complete 3063,2 --Northspring Roguefeather slain (4)
    .complete 3063,3 --Northspring Slayer slain (4)
    .complete 3063,4 --Northspring Windcaller slain (4)
    .mob Northspring Roguefeather
    .mob Northspring Slayer
    .mob Northspring Windcaller
step
    .goto 1444/1,2327.37,-4378.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zorbin Fandazzle|r
    .turnin 7003 >>Turn in Zapped Giants
    .turnin 7721 >>Turn in Fuel for the Zapping
    .target Zorbin Fandazzle
step
    .goto 1444/1,269.48,-4375.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Uzer'i|r
    .turnin 3127 >>Turn in Mountain Giant Muisek
    .target Witch Doctor Uzer'i
    .isOnQuest 3127
step
    .goto 1444/1,269.48,-4375.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Uzer'i|r
    .accept 3129 >>Accept Weapons of Spirit
    .target Witch Doctor Uzer'i
    .isQuestTurnedIn 3127 --Mountain Giant Muisek
    .isQuestTurnedIn 3128 --Natural Materials
    .xp <40,1
step
    .goto 1444/1,147.16,-4397.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Talo Thornhoof|r
    .turnin 3063 >>Turn in Vengeance on the Northspring
    .turnin 3062 >>Turn in Dark Heart
    .accept 4120 >>Accept The Strength of Corruption
    .target Talo Thornhoof
step
    .goto 1444/1,147.16,-4397.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Talo Thornhoof|r
    .turnin 4120 >>Turn in The Strength of Corruption
    .target Talo Thornhoof
    .isQuestComplete 4120
step
    .goto 1444/1,269.48,-4375.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Uzer'i|r
    .turnin 3129 >>Turn in Weapons of Spirit
    .target Witch Doctor Uzer'i
    .isOnQuest 3129
step
    +|cRXP_WARN_End of the Feralas route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Tanaris|r: The Sunken Temple
    >>|cRXP_FRIENDLY_Felwood and back here|r: The Strength of Corruption
]])
