-- 14-60 Alterac Mountains: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 8 parts (from level 14, 17, 20, 25, 28, 31, 34, 51).
-- Split into 8 guides, listed under "14 - 52 Alterac Mountains" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Alterac Mountains.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 14 - 52 Alterac Mountains
#subweight -14
#name 14-15 Alterac Mountains
--RouteBuilder:next
#next Zone Routes (Alliance)\10-15 Darkshore: around Thundris Windweaver;Zone Routes (Alliance)\11-15 Zephras Isle: around Elegael Thornpaw;Zone Routes (Alliance)\9-12 Teldrassil: around Priestess A'moora

step
    .goto 1416/0,438.93,449.07
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
    .goto 1416/0,438.93,449.07
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
    .goto 1416/0,387.13,379.07
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
step
    +|cRXP_WARN_Suggested next zones at level 14|r: |cRXP_FRIENDLY_Darkshore|r (about 1.9 levels of quests, starting around Thundris Windweaver), |cRXP_FRIENDLY_Zephras Isle|r (about 1.1 levels of quests, starting around Elegael Thornpaw), |cRXP_FRIENDLY_Teldrassil|r (about 1.0 levels of quests, starting around Priestess A'moora). Completing this step loads the guide for Darkshore --RouteBuilder:next
step << NightElf Druid/Skyborne Druid
    +|cRXP_WARN_The rest of Alterac Mountains is planned from level 17.|r Load its guide for level 17 then
]])

RXPGuides.RegisterGuide([[
#classic
<< NightElf Druid/Skyborne Druid
#version 1
#group Zone Routes (Alliance)
#subgroup 14 - 52 Alterac Mountains
#subweight -14
#name 17-18 Alterac Mountains
--RouteBuilder:next
#next Zone Routes (Alliance)\17-19 Darkshore: around Archaeologist Hollee;Zone Routes (Alliance)\11-15 Zephras Isle: around Elegael Thornpaw;Zone Routes (Alliance)\14-16 Loch Modan: around Marek Ironheart

step << NightElf Druid/Skyborne Druid
    .goto 1416/0,453.21,443.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alfina Nightgaze|r
    .accept 6121 >>Accept Lessons Anew
    .target Alfina Nightgaze
step
    +|cRXP_WARN_That is all of Alterac Mountains for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Moonglade|r: Lessons Anew << NightElf Druid/Skyborne Druid
step
    +|cRXP_WARN_Suggested next zones at level 17|r: |cRXP_FRIENDLY_Darkshore|r (about 0.9 levels of quests, starting around Archaeologist Hollee), |cRXP_FRIENDLY_Zephras Isle|r (about 0.7 levels of quests, starting around Elegael Thornpaw), |cRXP_FRIENDLY_Loch Modan|r (about 0.6 levels of quests, starting around Marek Ironheart). Completing this step loads the guide for Darkshore --RouteBuilder:next
step
    +|cRXP_WARN_The rest of Alterac Mountains is planned from level 20.|r Load its guide for level 20 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 14 - 52 Alterac Mountains
#subweight -14
#name 20-21 Alterac Mountains
--RouteBuilder:next
#next Zone Routes (Alliance)\17-19 Darkshore: around Archaeologist Hollee;Zone Routes (Alliance)\20-21 Wetlands: around Karl Boran;Zone Routes (Alliance)\20-21 Duskwood: around Madame Eva

step
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .accept 96137 >>Accept Ira's Dagger
    .target Bath'rah the Windwatcher
step
    +|cRXP_WARN_That is all of Alterac Mountains for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Duskwood|r: Ira's Dagger
step
    +|cRXP_WARN_Suggested next zones at level 20|r: |cRXP_FRIENDLY_Darkshore|r (about 0.7 levels of quests, starting around Archaeologist Hollee), |cRXP_FRIENDLY_Wetlands|r (about 0.6 levels of quests, starting around Karl Boran), |cRXP_FRIENDLY_Duskwood|r (about 0.5 levels of quests, starting around Madame Eva). Completing this step loads the guide for Darkshore --RouteBuilder:next
step << Rogue
    +|cRXP_WARN_The rest of Alterac Mountains is planned from level 25.|r Load its guide for level 25 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue
#version 1
#group Zone Routes (Alliance)
#subgroup 14 - 52 Alterac Mountains
#subweight -14
#name 25-26 Alterac Mountains
--RouteBuilder:next
#next Zone Routes (Alliance)\23-24 Wetlands: around Captain Stoutfist

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
    +|cRXP_WARN_Suggested next zones at level 25|r: |cRXP_FRIENDLY_Wetlands|r (about 0.6 levels of quests, starting around Captain Stoutfist). Completing this step loads the guide for Wetlands --RouteBuilder:next
step
    +|cRXP_WARN_The rest of Alterac Mountains is planned from level 28.|r Load its guide for level 28 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 14 - 52 Alterac Mountains
#subweight -14
#name 28-29 Alterac Mountains

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
    +|cRXP_WARN_The rest of Alterac Mountains is planned from level 31.|r Load its guide for level 31 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 14 - 52 Alterac Mountains
#subweight -14
#name 31-32 Alterac Mountains

step << Mage
    .goto 1416/0,-1428.95,928.24
    .fp Chillwind Camp >> Get the Chillwind Camp flight path
step
    .goto 1416/0,-849.63,232.16
    >>Click the |cRXP_PICK_Syndicate Documents|r
    .accept 511 >>Accept Encrypted Letter
step << Mage
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
step
    +|cRXP_WARN_The rest of Alterac Mountains is planned from level 34.|r Load its guide for level 34 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 14 - 52 Alterac Mountains
#subweight -14
#name 34-35 Alterac Mountains

step
    .goto 1416/0,-571.87,424.80
    >>Click the |cRXP_PICK_Manual|r
    .accept 79948 >>Accept Defensive Magics 101
step
    .goto 1416/0,-574.67,422.93
    >>Open the |cRXP_PICK_Manual|r. Loot it for |cRXP_LOOT_Defensive Magics 101|r
    .complete 79948,1 --Defensive Magics 101 (1)
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
    .goto 1416/0,255.81,34.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Ansirem Runeweaver|r
    .accept 603 >>Accept Ansirem's Key
    .target Archmage Ansirem Runeweaver
    .isQuestTurnedIn 602 --any of: Magical Analysis
    .xp <32,1
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
    >>|cRXP_FRIENDLY_Stranglethorn Vale|r: Ansirem's Key
    >>|cRXP_FRIENDLY_Undercity|r: Defensive Magics 101
step << Rogue
    +|cRXP_WARN_The rest of Alterac Mountains is planned from level 51.|r Load its guide for level 51 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue
#version 1
#group Zone Routes (Alliance)
#subgroup 14 - 52 Alterac Mountains
#subweight -14
#name 51-52 Alterac Mountains

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
    +|cRXP_WARN_End of the Alterac Mountains route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Azshara|r: Sealed Azure Bag << Rogue
]])
