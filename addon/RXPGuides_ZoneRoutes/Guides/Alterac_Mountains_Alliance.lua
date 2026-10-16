-- 14-60 Alterac Mountains: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 8 parts with a level check between them (from level 14, 17, 20, 25, 28, 31, 51, 54).
-- Sections (the guide starts at the one for your level): start from 14; part 2 from 17; part 3 from 20; part 4 from 25; part 5 from 28; part 6 from 31; part 7 from 51; part 8 from 54.
-- Edit zones/Alterac Mountains.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#name 14-60 Alterac Mountains

step
    .xp <17,1,RBSection1_1
    .xp 17 >>Finding the place in this guide for your level
step
    .xp <20,1,RBSection2_1
    .xp 20 >>Finding the place in this guide for your level
step
    .xp <25,1,RBSection3_1
    .xp 25 >>Finding the place in this guide for your level
step
    .xp <28,1,RBSection4_1
    .xp 28 >>Finding the place in this guide for your level
step
    .xp <31,1,RBSection5_1
    .xp 31 >>Finding the place in this guide for your level
step
    .xp <51,1,RBSection6_1
    .xp 51 >>Finding the place in this guide for your level
step
    .xp <54,1,RBSection7_1
    .xp 54 >>Finding the place in this guide for your level
step
    .xp <61,1,RBSection8_1
step
    #label RBSection1_1
    #completewith next
    +|cRXP_WARN_Alterac Mountains: start|r (planned from level 14)
step
    .goto 1416/0,437.25,448.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Denaaris Stargale|r
    .turnin 94946 >>Turn in The Magical City of Dalaran
    .target Denaaris Stargale
    .isOnQuest 94946
step
    .goto 1416/0,457.13,422.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Belanaa Windveil|r
    .accept 99191 >>Accept A Donation of Wool
    .target Belanaa Windveil
step << Skyborne
    .goto 1416/0,437.25,448.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Denaaris Stargale|r
    .accept 94947 >>Accept Welcome to Azeroth
    .target Denaaris Stargale
step << Skyborne Druid
    .goto 1416/0,255.81,34.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Ansirem Runeweaver|r
    .accept 94912 >>Accept Child of Nature
    .target Archmage Ansirem Runeweaver
step << Skyborne
    .goto 1416/0,446.21,450.75
    >>Click the |cRXP_PICK_Skyborne Portal to Stormwind|r
    .complete 94947,1 --Skyborne Portal to Stormwind
step
    .goto 1416/0,383.77,378.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Celindra|r
    .turnin 92459 >>Turn in Friend of the Kirin Tor
    .target Archmage Celindra
    .isOnQuest 92459
step << Warrior
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .turnin 1791 >>Turn in The Windwatcher
    .target Bath'rah the Windwatcher
    .isOnQuest 1791
step
    .goto 1416/0,255.81,34.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Ansirem Runeweaver|r
    .turnin 602 >>Turn in Magical Analysis
    .target Archmage Ansirem Runeweaver
    .isOnQuest 602
step << Rogue
    .goto 1416/0,-1625.23,27.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lord Jorach Ravenholdt|r
    .turnin 8236 >>Turn in The Azure Key
    .target Lord Jorach Ravenholdt
    .isQuestComplete 8236
step << Rogue
    .goto 1416/0,-1625.23,27.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lord Jorach Ravenholdt|r
    .turnin 8233 >>Turn in A Simple Request
    .target Lord Jorach Ravenholdt
    .isOnQuest 8233
step << Shaman
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .turnin 96016 >>Turn in The Tempest's Weapons
    .target Bath'rah the Windwatcher
    .isOnQuest 96016
step
    +|cRXP_WARN_That is all of Alterac Mountains for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Stormwind City|r: Child of Nature << Skyborne Druid
    >>|cRXP_FRIENDLY_Stormwind City|r: Welcome to Azeroth << Skyborne
    >>|cRXP_FRIENDLY_another zone|r: A Donation of Wool
step << NightElf Druid/Skyborne Druid
    +|cRXP_WARN_Until level 17, suggested zones|r: |cRXP_FRIENDLY_Darkshore|r (about 1.9 levels of quests, starting around Thundris Windweaver), |cRXP_FRIENDLY_Zephras Isle|r (about 1.1 levels of quests, starting around Elegael Thornpaw), |cRXP_FRIENDLY_Loch Modan|r (about 0.9 levels of quests, starting around Daryl the Youngling). Then come back to this Alterac Mountains guide --RouteBuilder:next
step << NightElf Druid/Skyborne Druid
    .xp 17 >>|cRXP_WARN_The rest of Alterac Mountains is planned from level 17.|r Come back to this guide then
step
    #label RBSection2_1
    #completewith next
    +|cRXP_WARN_Alterac Mountains: part 2|r (planned from level 17)
step << NightElf Druid/Skyborne Druid
    .goto 1416/0,453.21,443.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alfina Nightgaze|r
    .accept 6121 >>Accept Lessons Anew
    .target Alfina Nightgaze
step
    +|cRXP_WARN_That is all of Alterac Mountains for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Moonglade|r: Lessons Anew << NightElf Druid/Skyborne Druid
step
    +|cRXP_WARN_Until level 20, suggested zones|r: |cRXP_FRIENDLY_Darkshore|r (about 0.9 levels of quests, starting around Archaeologist Hollee), |cRXP_FRIENDLY_Zephras Isle|r (about 0.7 levels of quests, starting around Elegael Thornpaw), |cRXP_FRIENDLY_Loch Modan|r (about 0.6 levels of quests, starting around Daryl the Youngling). Then come back to this Alterac Mountains guide --RouteBuilder:next
step
    .xp 20 >>|cRXP_WARN_The rest of Alterac Mountains is planned from level 20.|r Come back to this guide then
step
    #label RBSection3_1
    #completewith next
    +|cRXP_WARN_Alterac Mountains: part 3|r (planned from level 20)
step
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .accept 96137 >>Accept Ira's Dagger
    .target Bath'rah the Windwatcher
step
    +|cRXP_WARN_That is all of Alterac Mountains for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Duskwood|r: Ira's Dagger
step << Rogue
    +|cRXP_WARN_Until level 25, suggested zones|r: |cRXP_FRIENDLY_Wetlands|r (about 1.0 levels of quests, starting around Karl Boran), |cRXP_FRIENDLY_Darkshore|r (about 0.7 levels of quests, starting around Archaeologist Hollee), |cRXP_FRIENDLY_Duskwood|r (about 0.5 levels of quests, starting around Madame Eva). Then come back to this Alterac Mountains guide --RouteBuilder:next
step << Rogue
    .xp 25 >>|cRXP_WARN_The rest of Alterac Mountains is planned from level 25.|r Come back to this guide then
step
    #label RBSection4_1
    #completewith next
    +|cRXP_WARN_Alterac Mountains: part 4|r (planned from level 25)
step << Rogue
    .goto 1416/0,-1594.71,-0.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Myrokos Silentform|r
    .accept 96781 >>Accept What's the Big Idea?
    .accept 96783 >>Accept A Way In
    .accept 96779 >>Accept Syndicate Sabotage
    .target Myrokos Silentform
step << Rogue
    .goto 1416/0,-1594.71,-0.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Myrokos Silentform|r
    .turnin 96779 >>Turn in Syndicate Sabotage
    .target Myrokos Silentform
    .isQuestComplete 96779
step << Rogue
    .goto 1416/0,-1594.71,-0.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Myrokos Silentform|r
    .turnin 96781 >>Turn in What's the Big Idea?
    .target Myrokos Silentform
    .isQuestComplete 96781
step
    +|cRXP_WARN_That is all of Alterac Mountains for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_another zone|r: A Way In << Rogue
    >>|cRXP_FRIENDLY_Hillsbrad Foothills and back here|r: Syndicate Sabotage << Rogue
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: What's the Big Idea? << Rogue
step
    .xp 28 >>|cRXP_WARN_The rest of Alterac Mountains is planned from level 28.|r Come back to this guide then
step
    #label RBSection5_1
    #completewith next
    +|cRXP_WARN_Alterac Mountains: part 5|r (planned from level 28)
step
    .goto 1416/0,-849.63,232.16
    >>Click the |cRXP_PICK_Syndicate Documents|r
    .accept 510 >>Accept Foreboding Plans
step << Rogue
    .goto 1416/0,-1594.71,-0.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Myrokos Silentform|r
    .turnin 96781 >>Turn in What's the Big Idea?
    .target Myrokos Silentform
    .isQuestComplete 96781
step << Rogue
    .goto 1416/0,-1594.71,-0.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Myrokos Silentform|r
    .turnin 96779 >>Turn in Syndicate Sabotage
    .target Myrokos Silentform
    .isQuestComplete 96779
step
    +|cRXP_WARN_That is all of Alterac Mountains for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Hillsbrad Foothills|r: Foreboding Plans
step
    +|cRXP_WARN_Until level 31, suggested zones|r: |cRXP_FRIENDLY_Wetlands|r (about 0.6 levels of quests, starting around Glorin Steelbrow). Then come back to this Alterac Mountains guide --RouteBuilder:next
step
    .xp 31 >>|cRXP_WARN_The rest of Alterac Mountains is planned from level 31.|r Come back to this guide then
step
    #label RBSection6_1
    #completewith next
    +|cRXP_WARN_Alterac Mountains: part 6|r (planned from level 31)
step
    .goto 1416/0,-1428.95,928.24
    .fp Chillwind Camp >> Get the Chillwind Camp flight path
step
    .goto 1416/0,-849.63,232.16
    >>Click the |cRXP_PICK_Syndicate Documents|r
    .accept 511 >>Accept Encrypted Letter
step
    .vendor >> Buy up to 120 level 35 drink from the Innkeeper
step
    .goto 1416/0,-316.79,-36.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alliance Brigadier General|r
    .accept 98896 >>Accept Darkspear Islands Clash
    .accept 98895 >>Accept Darkspear Islands Clash
    .target Alliance Brigadier General
step
    .goto 1416/0,-316.79,-36.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alliance Brigadier General|r
    .turnin 98895 >>Turn in Darkspear Islands Clash
    .target Alliance Brigadier General
    .isQuestComplete 98895
step
    .goto 1416/0,-316.79,-36.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alliance Brigadier General|r
    .turnin 98896 >>Turn in Darkspear Islands Clash
    .target Alliance Brigadier General
    .isQuestComplete 98896
step << Rogue
    .goto 1416/0,-1594.71,-0.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Myrokos Silentform|r
    .turnin 96781 >>Turn in What's the Big Idea?
    .target Myrokos Silentform
    .isQuestComplete 96781
step << Rogue
    .goto 1416/0,-1594.71,-0.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Myrokos Silentform|r
    .turnin 96779 >>Turn in Syndicate Sabotage
    .target Myrokos Silentform
    .isQuestComplete 96779
step
    +|cRXP_WARN_That is all of Alterac Mountains for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Hillsbrad Foothills|r: Encrypted Letter
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Darkspear Islands Clash, Darkspear Islands Clash
step << Rogue
    .xp 51 >>|cRXP_WARN_The rest of Alterac Mountains is planned from level 51.|r Come back to this guide then
step
    #label RBSection7_1
    #completewith next
    +|cRXP_WARN_Alterac Mountains: part 7|r (planned from level 51)
step << Rogue
    .goto 1416/0,-1625.23,27.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lord Jorach Ravenholdt|r
    .accept 8234 >>Accept Sealed Azure Bag
    .target Lord Jorach Ravenholdt
step << Rogue
    .goto 1416/0,-1594.71,-0.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Myrokos Silentform|r
    .turnin 96781 >>Turn in What's the Big Idea?
    .target Myrokos Silentform
    .isQuestComplete 96781
step << Rogue
    .goto 1416/0,-1594.71,-0.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Myrokos Silentform|r
    .turnin 96779 >>Turn in Syndicate Sabotage
    .target Myrokos Silentform
    .isQuestComplete 96779
step
    .goto 1416/0,-316.79,-36.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alliance Brigadier General|r
    .turnin 98896 >>Turn in Darkspear Islands Clash
    .target Alliance Brigadier General
    .isQuestComplete 98896
step
    .goto 1416/0,-316.79,-36.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alliance Brigadier General|r
    .turnin 98895 >>Turn in Darkspear Islands Clash
    .target Alliance Brigadier General
    .isQuestComplete 98895
step << Warrior
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .accept 1712 >>Accept Cyclonian
    .target Bath'rah the Windwatcher
    .isQuestTurnedIn 1791 --any of: The Windwatcher
    .xp <30,1
step << Warrior
    #loop
    .goto 1416/0,-257.99,1220.56,0
    .goto 1416/0,-257.99,1220.56,40,0
    .goto 1416/0,-257.99,1255.84,40,0
    .goto 1416/0,-189.95,1317.07,40,0
    .goto 1416/0,-158.87,1352.91,40,0
    .goto 1416/0,-107.07,1364.48,40,0
    .goto 1416/0,-84.11,1366.91,40,0
    .goto 1416/0,-112.11,1340.77,40,0
    .goto 1416/0,-151.03,1329.01,40,0
    >>Pick up |cRXP_PICK_Liferoot|r from the ground
    .complete 1712,1 --Liferoot (1)
    .isOnQuest 1712
step
    .goto 1416/0,255.81,34.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Ansirem Runeweaver|r
    .accept 603 >>Accept Ansirem's Key
    .target Archmage Ansirem Runeweaver
    .isQuestTurnedIn 602 --any of: Magical Analysis
    .xp <32,1
step << Warrior
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .accept 1713 >>Accept The Summoning
    .target Bath'rah the Windwatcher
    .isQuestTurnedIn 1712 --any of: Cyclonian
    .xp <30,1
step << Warrior
    .goto 1416/0,-1465.63,340.05
    >>Kill |cRXP_ENEMY_Cyclonian|r and loot |cRXP_LOOT_Whirlwind Heart|r
    .complete 1713,1 --Whirlwind Heart (1)
    .mob Cyclonian
    .isOnQuest 1713
step << Warrior
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .turnin 1713 >>Turn in The Summoning
    .target Bath'rah the Windwatcher
    .isOnQuest 1713
step << Warrior
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .accept 1792 >>Accept Whirlwind Weapon
    .target Bath'rah the Windwatcher
    .isQuestTurnedIn 1713 --any of: The Summoning
    .xp <30,1
step << Warrior
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .turnin 1792 >>Turn in Whirlwind Weapon
    .target Bath'rah the Windwatcher
    .isOnQuest 1792
step << Warrior
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .turnin 1712 >>Turn in Cyclonian
    .target Bath'rah the Windwatcher
    .isQuestComplete 1712
step
    +|cRXP_WARN_That is all of Alterac Mountains for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Azshara|r: Sealed Azure Bag << Rogue
    >>|cRXP_FRIENDLY_Stranglethorn Vale|r: Ansirem's Key
step
    .xp 54 >>|cRXP_WARN_The rest of Alterac Mountains is planned from level 54.|r Come back to this guide then
step
    #label RBSection8_1
    #completewith next
    +|cRXP_WARN_Alterac Mountains: part 8|r (planned from level 54)
step
    .goto 1416/0,-316.79,-36.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alliance Brigadier General|r
    .turnin 98896 >>Turn in Darkspear Islands Clash
    .target Alliance Brigadier General
    .isQuestComplete 98896
step
    .goto 1416/0,-316.79,-36.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alliance Brigadier General|r
    .turnin 98895 >>Turn in Darkspear Islands Clash
    .target Alliance Brigadier General
    .isQuestComplete 98895
step
    .goto 1416/0,-316.79,-36.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alliance Brigadier General|r
    .accept 8371 >>Accept Concerted Efforts
    .target Alliance Brigadier General
step
    .goto 1416/0,-316.79,-36.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alliance Brigadier General|r
    .turnin 8371 >>Turn in Concerted Efforts
    .target Alliance Brigadier General
    .isQuestComplete 8371
step << Rogue
    .goto 1416/0,-1594.71,-0.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Myrokos Silentform|r
    .turnin 96781 >>Turn in What's the Big Idea?
    .target Myrokos Silentform
    .isQuestComplete 96781
step << Rogue
    .goto 1416/0,-1594.71,-0.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Myrokos Silentform|r
    .turnin 96779 >>Turn in Syndicate Sabotage
    .target Myrokos Silentform
    .isQuestComplete 96779
step
    +|cRXP_WARN_End of the Alterac Mountains route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Concerted Efforts
]])
