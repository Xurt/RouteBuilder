-- 24-38 Hillsbrad Foothills: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 4 parts with a level check between them (from level 24, 27, 30, 33).
-- Edit zones/Hillsbrad Foothills.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#name 24-38 Hillsbrad Foothills

step
    .goto 1424/0,-571.41,-1015.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tom "Half-fish" Wilson|r
    .accept 98459 >>Accept A Lack of Virtue
    .target Tom "Half-fish" Wilson
step
    .goto 1424/0,-601.49,-853.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brewmeister Bilger|r
    .accept 98071 >>Accept Brewer's Trade
    .target Brewmeister Bilger
step
    .goto 1424/0,-601.49,-853.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brewmeister Bilger|r
    .turnin 98071 >>Turn in Brewer's Trade
    .target Brewmeister Bilger
    .isQuestComplete 98071
step
    .goto 1424/0,-580.05,-845.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lieutenant Farren Orinelle|r
    .turnin 98219 >>Turn in The Shamed Lieutenant
    .target Lieutenant Farren Orinelle
    .isOnQuest 98219
step
    .goto 1424/0,-420.37,-669.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain McManus|r
    .accept 98059 >>Accept Hillsbrad's Hoard
    .target Captain McManus
step
    .goto 1424/0,-420.37,-669.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain McManus|r
    >>|cRXP_WARN_The database has no objectives for Hillsbrad's Hoard. Skip this step if the quest is not finished|r
    .turnin 98059 >>Turn in Hillsbrad's Hoard
    .target Captain McManus
    .isOnQuest 98059
step
    .goto 1424/0,-601.49,-853.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brewmeister Bilger|r
    .turnin 647 >>Turn in MacKreel's Moonshine
    .target Brewmeister Bilger
    .isOnQuest 647
step
    .goto 1424/0,-551.57,-817.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loremaster Dibbs|r
    .turnin 538 >>Turn in Southshore
    .target Loremaster Dibbs
    .isOnQuest 538
step
    .goto 1424/0,-551.57,-817.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loremaster Dibbs|r
    .accept 540 >>Accept Preserving Knowledge
    .target Loremaster Dibbs
    .isQuestTurnedIn 538 --any of: Southshore
    .xp <20,1
step
    .goto 1424/0,-512.21,-715.09
    >>Talk to |cRXP_FRIENDLY_Darla|r
    .fp Southshore >> Get the Southshore flight path
    .fly Menethil >> Fly to Menethil
    .target Darla Harris
    .zoneskip Wetlands
step
    .goto 1424/0,-610.77,-793.81
    >>Talk to |cRXP_FRIENDLY_Robert|r
    .vendor 3543 >> Vendor Trash. Repair
    .target Robert Aebischer
    .isOnQuest 511
step
    .goto 1424/0,-551.57,-817.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loremaster Dibbs|r
    .turnin 511 >>Turn in Encrypted Letter
    .target Loremaster Dibbs
    .isOnQuest 511
step
    .goto 1424/0,-473.81,-861.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Henry Maleb|r
    .turnin 510 >>Turn in Foreboding Plans
    .target Magistrate Henry Maleb
    .isOnQuest 510
step
    .goto 1424/0,-544.53,-859.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Phin Odelic|r
    .turnin 661 >>Turn in Hints of a New Plague?
    .target Phin Odelic
    .isOnQuest 661
step
    .goto 1424/0,-473.81,-861.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Henry Maleb|r
    .turnin 525 >>Turn in Further Mysteries
    .target Magistrate Henry Maleb
    .isOnQuest 525
step
    .goto 1424/0,-551.57,-817.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loremaster Dibbs|r
    .accept 542 >>Accept Return to Milton
    .target Loremaster Dibbs
    .isQuestTurnedIn 540 --any of: Preserving Knowledge
    .xp <20,1
step
    .goto 1424/0,-551.57,-817.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loremaster Dibbs|r
    .turnin 540 >>Turn in Preserving Knowledge
    .target Loremaster Dibbs
    .isQuestComplete 540
step
    +|cRXP_WARN_That is all of Hillsbrad Foothills for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Stormwind City|r: Return to Milton
    >>|cRXP_FRIENDLY_Wetlands|r: A Lack of Virtue
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Brewer's Trade
step
    .xp 27 >>|cRXP_WARN_The rest of Hillsbrad Foothills is planned from level 27.|r Come back to this guide then
step
    .goto 1424/0,-473.81,-861.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Henry Maleb|r
    .accept 505 >>Accept Syndicate Assassins
    .target Magistrate Henry Maleb
step
    .goto 1424/0,-473.81,-861.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Henry Maleb|r
    .turnin 505 >>Turn in Syndicate Assassins
    .target Magistrate Henry Maleb
    .isQuestComplete 505
step
    .goto 1424/0,-473.81,-861.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Henry Maleb|r
    .accept 512 >>Accept Noble Deaths
    .target Magistrate Henry Maleb
    .isQuestTurnedIn 510 --any of: Foreboding Plans
    .xp <26,1
step
    .goto 1424/0,-473.81,-861.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Henry Maleb|r
    .turnin 512 >>Turn in Noble Deaths
    .target Magistrate Henry Maleb
    .isQuestComplete 512
step
    .goto 1424/0,-601.49,-853.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brewmeister Bilger|r
    .turnin 98071 >>Turn in Brewer's Trade
    .target Brewmeister Bilger
    .isQuestComplete 98071
step
    .goto 1424/0,-420.37,-669.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain McManus|r
    .turnin 98059 >>Turn in Hillsbrad's Hoard
    .target Captain McManus
    .isOnQuest 98059
step
    +|cRXP_WARN_That is all of Hillsbrad Foothills for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Alterac Mountains and back here|r: Syndicate Assassins
step
    .xp 30 >>|cRXP_WARN_The rest of Hillsbrad Foothills is planned from level 30.|r Come back to this guide then
step
    .goto 1424/0,-583.57,-849.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Barkeep Kelly|r
    .accept 98463 >>Accept Talk of the Town
    .target Barkeep Kelly
step
    .goto 1424/0,-601.49,-853.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brewmeister Bilger|r
    .turnin 98071 >>Turn in Brewer's Trade
    .target Brewmeister Bilger
    .isQuestComplete 98071
step
    .goto 1424/0,-570.77,-857.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Anderson|r
    .target Innkeeper Anderson
    .home >>Set your Hearthstone to Innkeeper Anderson's inn
step
    .goto 1424/0,-544.53,-859.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Phin Odelic|r
    .accept 659 >>Accept Hints of a New Plague?
    .target Phin Odelic
step
    .goto 1424/0,-479.57,-880.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Emissary Jacques|r
    .accept 92432 >>Accept An Alarming Request
    .target Emissary Jacques
    .xp <30,1
step
    .goto 1424/0,-535.25,-835.41
    >>Kill |cRXP_ENEMY_Shadowy Assassin|r and loot |cRXP_LOOT_Assassin's Contract|r. Use it to start the quest
    .collect 3668,1,522 --Assassin's Contract (1)
    .accept 522 >>Accept Assassin's Contract
    .use 3668
    .mob Shadowy Assassin
step
    .goto 1424/0,-473.81,-861.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Henry Maleb|r
    .turnin 522 >>Turn in Assassin's Contract while you are here
    .isQuestComplete 522
    .target Magistrate Henry Maleb
step
    .goto 1424/0,-516.37,-852.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Redpath|r
    .accept 500 >>Accept Crushridge Bounty
    .target Marshal Redpath
step
    .goto 1424/0,-512.21,-715.09
    .fp Southshore >> Get the Southshore flight path
    .fly Menethil >> Fly to Menethil
step
    .goto 1424/0,-473.81,-861.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Henry Maleb|r
    .turnin 522 >>Turn in Assassin's Contract
    .target Magistrate Henry Maleb
step
    .goto 1424/0,-479.57,-880.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Emissary Jacques|r
    .accept 92432 >>Accept An Alarming Request
    .target Emissary Jacques
    .xp <30,1
step
    .goto 1424/0,-610.77,-793.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Darren Malvew|r
    .accept 564 >>Accept Costly Menace
    .target Darren Malvew
step
    .goto 1424/0,-420.37,-669.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain McManus|r
    .turnin 98059 >>Turn in Hillsbrad's Hoard
    .target Captain McManus
    .isOnQuest 98059
step
    .goto 1424/0,-174.93,-125.23
    >>Kill |cRXP_ENEMY_Mountain Lions|r
    .complete 564,1 --Mountain Lion slain (8)
    .mob Mountain Lion
step
    #completewith next
    .hs >>Hearth to Innkeeper Anderson's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1424/0,-551.57,-817.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Loremaster Dibbs|r
    .accept 514 >>Accept Letter to Stormpike
    .target Loremaster Dibbs
    .isQuestTurnedIn 511 --any of: Encrypted Letter
    .xp <30,1
step
    .goto 1424/0,-473.81,-861.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Henry Maleb|r
    .turnin 505 >>Turn in Syndicate Assassins
    .target Magistrate Henry Maleb
    .isQuestComplete 505
step
    .goto 1424/0,-479.57,-880.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Emissary Jacques|r
    .accept 92432 >>Accept An Alarming Request
    .target Emissary Jacques
    .xp <30,1
step
    #completewith next
    .hs >>Hearth to Innkeeper Anderson's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1424/0,-580.05,-845.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lieutenant Farren Orinelle|r
    .accept 536 >>Accept Down the Coast
    .target Lieutenant Farren Orinelle
step
    #loop
    .goto 1424/0,-489.17,-974.08,0
    .goto 1424/0,-489.17,-974.08,40,0
    .goto 1424/0,-514.13,-1042.77,40,0
    .goto 1424/0,-442.13,-1057.92,40,0
    .goto 1424/0,-373.65,-1062.61,40,0
    .goto 1424/0,-346.13,-1117.01,40,0
    .goto 1424/0,-226.13,-1119.57,40,0
    .goto 1424/0,-241.49,-1067.95,40,0
    .goto 1424/0,-300.69,-1076.48,40,0
    .goto 1424/0,-406.29,-964.48,40,0
    >>Kill |cRXP_ENEMY_Torn Fin Tidehunters|r
    >>Kill |cRXP_ENEMY_Torn Fin Oracles|r
    .complete 536,1 --Torn Fin Tidehunter slain (10)
    .complete 536,2 --Torn Fin Oracle slain (10)
    .mob Torn Fin Tidehunter
    .mob Torn Fin Oracle
step
    .goto 1424/0,-580.05,-845.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lieutenant Farren Orinelle|r
    .turnin 536 >>Turn in Down the Coast
    .accept 559 >>Accept Farren's Proof
    .target Lieutenant Farren Orinelle
step
    #loop
    .goto 1424/0,-129.81,-1011.84,0
    .goto 1424/0,-129.81,-1011.84,40,0
    .goto 1424/0,-75.09,-1016.53,40,0
    .goto 1424/0,-39.25,-1108.69,40,0
    .goto 1424/0,21.23,-1142.19,40,0
    .goto 1424/0,44.91,-1227.31,40,0
    .goto 1424/0,-54.93,-1178.24,40,0
    .goto 1424/0,-149.97,-1153.71,40,0
    .goto 1424/0,-211.73,-1153.49,40,0
    .goto 1424/0,-127.89,-1099.09,40,0
    >>Kill |cRXP_ENEMY_Torn Fin Muckdwellers|r, |cRXP_ENEMY_Torn Fin Coastrunners|r, |cRXP_ENEMY_Torn Fin Oracles|r and |cRXP_ENEMY_Torn Fin Tidehunters|r. Loot them for |cRXP_LOOT_Murloc Head|r
    .complete 559,1 --Murloc Head (10)
    .mob Torn Fin Muckdweller
    .mob Torn Fin Coastrunner
    .mob Torn Fin Oracle
    .mob Torn Fin Tidehunter
step
    .goto 1424/0,-580.05,-845.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lieutenant Farren Orinelle|r
    .turnin 559 >>Turn in Farren's Proof
    .accept 560 >>Accept Farren's Proof
    .target Lieutenant Farren Orinelle
step
    .goto 1424/0,-516.37,-852.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Redpath|r
    .turnin 560 >>Turn in Farren's Proof
    .accept 561 >>Accept Farren's Proof
    .target Marshal Redpath
step
    .xp 30 >>Grind to level 30 (An Alarming Request needs it)
step
    .goto 1424/0,-479.57,-880.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Emissary Jacques|r
    .accept 92432 >>Accept An Alarming Request
    .target Emissary Jacques
step
    .goto 1424/0,-580.05,-845.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lieutenant Farren Orinelle|r
    .turnin 561 >>Turn in Farren's Proof
    .accept 562 >>Accept Stormwind Ho!
    .target Lieutenant Farren Orinelle
step
    #loop
    .goto 1424/0,-676.69,-973.23,0
    .goto 1424/0,-676.69,-973.23,40,0
    .goto 1424/0,-786.45,-987.73,40,0
    .goto 1424/0,-857.81,-1163.31,40,0
    .goto 1424/0,-754.45,-1173.76,40,0
    .goto 1424/0,-753.81,-1117.01,40,0
    .goto 1424/0,-765.01,-1058.13,40,0
    .goto 1424/0,-721.17,-1020.59,40,0
    .goto 1424/0,-683.09,-1060.05,40,0
    .goto 1424/0,-587.73,-1011.20,40,0
    >>Kill |cRXP_ENEMY_Daggerspine Shorehunters|r
    >>Kill |cRXP_ENEMY_Daggerspine Sirens|r
    .complete 562,1 --Daggerspine Shorehunter slain (10)
    .complete 562,2 --Daggerspine Siren slain (10)
    .mob Daggerspine Shorehunter
    .mob Daggerspine Siren
step
    .goto 1424/0,-580.05,-845.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lieutenant Farren Orinelle|r
    .turnin 562 >>Turn in Stormwind Ho!
    .accept 563 >>Accept Reassignment
    .target Lieutenant Farren Orinelle
step << Hunter
    .goto 1424/0,-501.33,-777.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sarah Raycroft|r upstairs
    .vendor >> |cRXP_BUY_Restock on|r |T132382:0|t[Razor Arrows] |cRXP_BUY_if necessary|
    .target Sarah Raycroft
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Darla Harris|r
    .goto 1424/0,-512.15,-715.14
    .fp Southshore >>Get the Southshore Flight Path
    .target Darla Harris
step
    .goto 1424/0,-593.81,-851.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chef Jessen|r
    .accept 555 >>Accept Soothing Turtle Bisque
    .target Chef Jessen
step
    .goto 1424/0,-499.41,-773.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy |cRXP_LOOT_Soothing Spices|r from |cRXP_FRIENDLY_Micha Yance|r
    .complete 555,2 --Soothing Spices (1)
    .target Micha Yance
step
    #loop
    .goto 1424/0,-723.41,-750.93,0
    .goto 1424/0,-723.41,-750.93,40,0
    .goto 1424/0,-722.45,-817.71,40,0
    .goto 1424/0,-751.89,-607.36,40,0
    .goto 1424/0,-737.81,-679.25,40,0
    >>Kill |cRXP_ENEMY_Snapjaw|r and loot |cRXP_LOOT_Turtle Meat|r
    .complete 555,1 --Turtle Meat (1)
    .mob Snapjaw
step
    .goto 1424/0,-593.81,-851.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chef Jessen|r
    .turnin 555 >>Turn in Soothing Turtle Bisque
    .target Chef Jessen
step
    .goto 1424/0,-516.37,-852.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Redpath|r
    .turnin 500 >>Turn in Crushridge Bounty
    .target Marshal Redpath
    .isQuestComplete 500
step
    .goto 1424/0,-610.77,-793.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Darren Malvew|r
    .turnin 564 >>Turn in Costly Menace
    .target Darren Malvew
    .isQuestComplete 564
step
    +|cRXP_WARN_That is all of Hillsbrad Foothills for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Arathi Highlands|r: Hints of a New Plague?
    >>|cRXP_FRIENDLY_Ironforge|r: Letter to Stormpike
    >>|cRXP_FRIENDLY_Silverpine Forest|r: An Alarming Request
    >>|cRXP_FRIENDLY_Stormwind City|r: Reassignment
    >>|cRXP_FRIENDLY_Stranglethorn Vale|r: Talk of the Town
    >>|cRXP_FRIENDLY_Alterac Mountains and back here|r: Costly Menace, Crushridge Bounty
step
    .xp 33 >>|cRXP_WARN_The rest of Hillsbrad Foothills is planned from level 33.|r Come back to this guide then
step
    .goto 1424/0,-420.37,-669.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain McManus|r
    .turnin 98059 >>Turn in Hillsbrad's Hoard
    .target Captain McManus
    .isOnQuest 98059
step
    .goto 1424/0,-174.93,-125.23
    >>Kill |cRXP_ENEMY_Mountain Lions|r
    .complete 564,1 --Mountain Lion slain (8)
    .mob Mountain Lion
    .isOnQuest 564
step
    .goto 1424/0,-610.77,-793.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Darren Malvew|r
    .turnin 564 >>Turn in Costly Menace
    .target Darren Malvew
    .isQuestComplete 564
step
    .goto 1424/0,-601.49,-853.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brewmeister Bilger|r
    .turnin 98071 >>Turn in Brewer's Trade
    .target Brewmeister Bilger
    .isQuestComplete 98071
step
    .goto 1424/0,-516.37,-852.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Redpath|r
    .turnin 500 >>Turn in Crushridge Bounty
    .target Marshal Redpath
    .isQuestComplete 500
step
    .goto 1424/0,-473.81,-861.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Henry Maleb|r
    .turnin 505 >>Turn in Syndicate Assassins
    .target Magistrate Henry Maleb
    .isQuestComplete 505
step
    .goto 1424/0,-515.09,-784.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bartolo Ginsetti|r
    .accept 565 >>Accept Bartolo's Yeti Fur Cloak
    .target Bartolo Ginsetti
step
    #completewith Drop635x1
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Cave Yeti|r, |cRXP_ENEMY_Ferocious Yeti|r, |cRXP_ENEMY_Captain Ironhill|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #label Drop635x1
    .goto 1424/0,-499.41,-773.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy |cRXP_LOOT_Fine Thread|r from |cRXP_FRIENDLY_Micha Yance|r
    .complete 565,2 --Fine Thread (1)
    .target Micha Yance
step
    .goto 1424/0,-515.09,-784.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bartolo Ginsetti|r
    .turnin 565 >>Turn in Bartolo's Yeti Fur Cloak
    .target Bartolo Ginsetti
    .isQuestComplete 565
step
    #completewith Drop635x2
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Cave Yeti|r, |cRXP_ENEMY_Ferocious Yeti|r, |cRXP_ENEMY_Captain Ironhill|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #label Drop635x2
    #loop
    .goto 1424/0,-417.17,-325.55,0
    .goto 1424/0,-417.17,-325.55,40,0
    .goto 1424/0,-279.25,-307.84,40,0
    .goto 1424/0,-285.97,-251.31,40,0
    .goto 1424/0,-321.49,-192.85,40,0
    .goto 1424/0,-353.49,-133.97,40,0
    .goto 1424/0,-377.81,-179.84,40,0
    .goto 1424/0,-358.93,-226.35,40,0
    .goto 1424/0,-382.29,-266.45,40,0
    .goto 1424/0,-450.13,-258.77,40,0
    >>Kill |cRXP_ENEMY_Cave Yetis|r and |cRXP_ENEMY_Ferocious Yetis|r. Loot them for |cRXP_LOOT_Yeti Fur|r
    >>Open the |cRXP_PICK_Solid Chest|r. Loot it for |cRXP_LOOT_Bolt of Woolen Cloth|r
    .complete 565,4 --Yeti Fur (1)
    .complete 565,1 --Bolt of Woolen Cloth (1)
    .mob Cave Yeti
    .mob Ferocious Yeti
step
    +|cRXP_WARN_End of the Hillsbrad Foothills route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Arathi Highlands|r: Crystal in the Mountains
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Bartolo's Yeti Fur Cloak
]])
