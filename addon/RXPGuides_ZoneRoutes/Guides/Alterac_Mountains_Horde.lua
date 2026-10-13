-- 25-38 Alterac Mountains: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 3 parts with a level check between them (from level 25, 28, 31).
-- Edit zones/Alterac Mountains.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#name 25-38 Alterac Mountains

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
step << Shaman
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .turnin 79360 >>Turn in Elemental Aid
    .target Bath'rah the Windwatcher
    .isQuestComplete 79360
step
    .goto 1416/0,383.77,378.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Celindra|r
    .turnin 97287 >>Turn in Shrewd Negotiations
    .target Archmage Celindra
    .isOnQuest 97287
step << Warrior
    .goto 1416/0,-1470.67,250.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bath'rah the Windwatcher|r
    .turnin 1791 >>Turn in The Windwatcher
    .target Bath'rah the Windwatcher
    .isOnQuest 1791
step
    +|cRXP_WARN_That is all of Alterac Mountains for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Duskwood and back here|r: Grant's Shield, Silvia's Sword << Orc Shaman/Tauren Shaman/Troll Shaman
step << Rogue
    .xp 28 >>|cRXP_WARN_The rest of Alterac Mountains is planned from level 28.|r Come back to this guide then
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
    .xp 31 >>|cRXP_WARN_The rest of Alterac Mountains is planned from level 31.|r Come back to this guide then
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
    .vendor >> Buy level 35 drink if needed
step
    +|cRXP_WARN_End of the Alterac Mountains route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Hillsbrad Foothills|r: Blackmoore's Legacy
    >>|cRXP_FRIENDLY_Dustwallow Marsh, Swamp of Sorrows, Badlands, Desolace and back here|r: Storm, Earth, and Fire << Orc Shaman/Tauren Shaman/Troll Shaman
]])
