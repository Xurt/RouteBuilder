-- 25-38 Alterac Mountains: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 4 parts (from level 25, 28, 31, 34).
-- Split into 4 guides, listed under "25 - 35 Alterac Mountains" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Alterac Mountains.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 25 - 35 Alterac Mountains
#subweight -25
#name 25-26 Alterac Mountains

step << Orc Shaman/Tauren Shaman/Troll Shaman
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .accept 79363 >>Accept Silvia's Sword
    .accept 79362 >>Accept Grant's Shield
    .target Bath'rah the Windwatcher
step << Orc Shaman/Tauren Shaman/Troll Shaman
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .turnin 79362 >>Turn in Grant's Shield
    .target Bath'rah the Windwatcher
    .isQuestComplete 79362
step << Orc Shaman/Tauren Shaman/Troll Shaman
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .turnin 79363 >>Turn in Silvia's Sword
    .target Bath'rah the Windwatcher
    .isQuestComplete 79363
step << Warrior
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .turnin 1791 >>Turn in The Windwatcher
    .target Bath'rah the Windwatcher
    .isOnQuest 1791
step << Shaman
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .turnin 79360 >>Turn in Elemental Aid
    .target Bath'rah the Windwatcher
    .isQuestComplete 79360
step
    .goto 1416/0,-710.75,501.89,120,0
    .goto 1416/0,-602.39,452.80,120,0
    .goto 1416/0,-536.03,363.01,120,0
    .goto 1416/0,-851.59,232.35,120,0
    .goto 1416/0,-710.75,501.89,120,0
    .goto 1416/0,-602.39,452.80,120,0
    .goto 1416/0,-536.03,363.01,120,0
    .goto 1416/0,-851.59,232.35,120,0
    .xp 34+56000 >> AoE Ogres and Syndicate to 34 & 56000+/62800xp
    >>Keep grinding until your hearth cooldown is <8 minutes
step
    .goto 1416/0,-710.75,501.89,120,0
    .goto 1416/0,-602.39,452.80,120,0
    .goto 1416/0,-536.03,363.01,120,0
    .goto 1416/0,-851.59,232.35,120,0
    .goto 1416/0,-710.75,501.89,120,0
    .goto 1416/0,-602.39,452.80,120,0
    .goto 1416/0,-536.03,363.01,120,0
    .goto 1416/0,-851.59,232.35,120,0
    .xp 36 >> AoE Cats/Syndicates/Ogre mobs to level 36
    >>Start saving the Silk Cloth you get. You need 12 stacks for later
step
    #loop
    .goto 1416/0,-986.27,682.40,0
    .goto 1416/0,-986.27,682.40,40,0
    .goto 1416/0,-980.67,689.87,40,0
    .goto 1416/0,-969.47,749.60,40,0
    .goto 1416/0,-947.07,742.13,40,0
    .goto 1416/0,-907.87,682.40,40,0
    .goto 1416/0,-924.67,689.87,40,0
    >>Kill |cRXP_ENEMY_Jailor Borhuin|r and loot |cRXP_LOOT_Rusted Iron Key|r
    .complete 503,2 --Rusted Iron Key (1)
    .mob Jailor Borhuin
    .isOnQuest 503
step
    .goto 1416/0,-710.75,501.89,120,0
    .goto 1416/0,-602.39,452.80,120,0
    .goto 1416/0,-536.03,363.01,120,0
    .goto 1416/0,-851.59,232.35,120,0
    .goto 1416/0,-710.75,501.89,120,0
    .goto 1416/0,-602.39,452.80,120,0
    .goto 1416/0,-536.03,363.01,120,0
    .goto 1416/0,-851.59,232.35,120,0
    .xp 36+60000 >> Grind the Ogres and Syndicate to 36 & 60000+/71600xp
    >>Keep grinding until your hearth cooldown is <8 minutes
step
    .vendor >> Buy level 35 drink if needed
step
    .goto 1416/0,-912.07,683.71
    >>Find where Gol'dir is being held
    .complete 503,3 --Find where Gol'dir is being held
    .isOnQuest 503
step
    .goto 1416/0,-895.55,683.52
    >>Free Gol'dir then return to Krusk in Tarren Mill.
    .complete 503,1 --Gol'dir
    .target Gol'dir
    .isOnQuest 503
step
    .goto 1416/0,-895.55,683.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gol'dir|r
    .turnin 503 >>Turn in Gol'dir
    .target Gol'dir
    .isOnQuest 503
step
    .goto 1416/0,387.13,379.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Celindra|r
    .turnin 97287 >>Turn in Shrewd Negotiations
    .target Archmage Celindra
    .isOnQuest 97287
step
    +|cRXP_WARN_That is all of Alterac Mountains for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Duskwood and back here|r: Grant's Shield, Silvia's Sword << Orc Shaman/Tauren Shaman/Troll Shaman
step << Rogue
    +|cRXP_WARN_The rest of Alterac Mountains is planned from level 28.|r Load its guide for level 28 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue
#version 1
#group Zone Routes (Horde)
#subgroup 25 - 35 Alterac Mountains
#subweight -25
#name 28-29 Alterac Mountains

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
step << Orc Shaman/Tauren Shaman/Troll Shaman
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .turnin 79363 >>Turn in Silvia's Sword
    .target Bath'rah the Windwatcher
    .isQuestComplete 79363
step << Orc Shaman/Tauren Shaman/Troll Shaman
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .turnin 79362 >>Turn in Grant's Shield
    .target Bath'rah the Windwatcher
    .isQuestComplete 79362
step
    +|cRXP_WARN_That is all of Alterac Mountains for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_another zone|r: A Way In << Rogue
    >>|cRXP_FRIENDLY_Hillsbrad Foothills and back here|r: Syndicate Sabotage << Rogue
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: What's the Big Idea? << Rogue
step << Orc Shaman/Tauren Shaman/Troll Shaman/Shaman
    +|cRXP_WARN_The rest of Alterac Mountains is planned from level 31.|r Load its guide for level 31 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Orc Shaman/Tauren Shaman/Troll Shaman/Shaman
#version 1
#group Zone Routes (Horde)
#subgroup 25 - 35 Alterac Mountains
#subweight -25
#name 31-32 Alterac Mountains

step << Orc Shaman/Tauren Shaman/Troll Shaman
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .turnin 79363 >>Turn in Silvia's Sword
    .target Bath'rah the Windwatcher
    .isQuestComplete 79363
step << Orc Shaman/Tauren Shaman/Troll Shaman
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .turnin 79362 >>Turn in Grant's Shield
    .target Bath'rah the Windwatcher
    .isQuestComplete 79362
step
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .accept 79361 >>Accept Storm, Earth, and Fire << Orc Shaman/Tauren Shaman/Troll Shaman
    .accept 79364 >>Accept Eyes on the Sky << Shaman
    .target Bath'rah the Windwatcher
step << Shaman
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    >>|cRXP_WARN_The database has no objectives for Eyes on the Sky. Skip this step if the quest is not finished|r
    .turnin 79364 >>Turn in Eyes on the Sky
    .target Bath'rah the Windwatcher
    .isOnQuest 79364
step << Orc Shaman/Tauren Shaman/Troll Shaman
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .turnin 79361 >>Turn in Storm, Earth, and Fire
    .target Bath'rah the Windwatcher
    .isQuestComplete 79361
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
    .goto 1416/0,-895.55,683.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gol'dir|r
    .accept 506 >>Accept Blackmoore's Legacy
    .target Gol'dir
    .isQuestTurnedIn 503 --any of: Gol'dir
    .xp <29,1
step
    +|cRXP_WARN_That is all of Alterac Mountains for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Hillsbrad Foothills|r: Blackmoore's Legacy
    >>|cRXP_FRIENDLY_Dustwallow Marsh, Swamp of Sorrows, Badlands, Desolace and back here|r: Storm, Earth, and Fire << Orc Shaman/Tauren Shaman/Troll Shaman
step
    +|cRXP_WARN_The rest of Alterac Mountains is planned from level 34.|r Load its guide for level 34 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 25 - 35 Alterac Mountains
#subweight -25
#name 34-35 Alterac Mountains

step
    .goto 1416/0,-571.87,424.80
    >>Click the |cRXP_PICK_Manual|r
    .accept 79948 >>Accept Defensive Magics 101
step
    .goto 1416/0,-574.67,422.93
    >>Open the |cRXP_PICK_Manual|r. Loot it for |cRXP_LOOT_Defensive Magics 101|r
    .complete 79948,1 --Defensive Magics 101 (1)
step << Orc Shaman/Tauren Shaman/Troll Shaman
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .turnin 79361 >>Turn in Storm, Earth, and Fire
    .target Bath'rah the Windwatcher
    .isQuestComplete 79361
step << Orc Shaman/Tauren Shaman/Troll Shaman
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .turnin 79363 >>Turn in Silvia's Sword
    .target Bath'rah the Windwatcher
    .isQuestComplete 79363
step << Orc Shaman/Tauren Shaman/Troll Shaman
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .turnin 79362 >>Turn in Grant's Shield
    .target Bath'rah the Windwatcher
    .isQuestComplete 79362
step << Shaman
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .turnin 79364 >>Turn in Eyes on the Sky
    .target Bath'rah the Windwatcher
    .isOnQuest 79364
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
    >>|cRXP_FRIENDLY_Undercity|r: Defensive Magics 101
]])
