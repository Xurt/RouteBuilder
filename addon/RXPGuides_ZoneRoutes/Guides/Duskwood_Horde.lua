-- 42-42 Duskwood: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- Edit zones/Duskwood.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#name 42-42 Duskwood

step
    #label RBSection1_1
    #completewith next
    +|cRXP_WARN_Duskwood: start|r (planned from level 42)
step
    .goto 1431/0,-1537.54,-10358.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathstalker Zraedus|r
    .accept 1372 >>Accept Nothing But The Truth
    .target Deathstalker Zraedus
step
    .goto 1431/0,-1527.82,-10351.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Faustin|r
    .turnin 1372 >>Turn in Nothing But The Truth
    .accept 1383 >>Accept Nothing But The Truth
    .target Apothecary Faustin
step
    .goto 1431/0,-1527.82,-10351.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Faustin|r
    .turnin 1383 >>Turn in Nothing But The Truth
    .target Apothecary Faustin
    .isQuestComplete 1383
step
    .goto 1431/0,-1527.82,-10351.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Faustin|r
    .accept 1388 >>Accept Nothing But The Truth
    .target Apothecary Faustin
    .isQuestTurnedIn 1383 --any of: Nothing But The Truth
    .xp <37,1
step
    .goto 1431/0,-1537.54,-10358.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathstalker Zraedus|r
    .turnin 1388 >>Turn in Nothing But The Truth
    .target Deathstalker Zraedus
    .isOnQuest 1388
step
    .goto 1431/0,-1537.54,-10358.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Deathstalker Zraedus|r
    .accept 1391 >>Accept Nothing But The Truth
    .target Deathstalker Zraedus
    .isQuestTurnedIn 1388 --any of: Nothing But The Truth
    .xp <37,1
step
    +|cRXP_WARN_End of the Duskwood route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Swamp of Sorrows|r: Nothing But The Truth
    >>|cRXP_FRIENDLY_Swamp of Sorrows, Desolace and back here|r: Nothing But The Truth
]])
