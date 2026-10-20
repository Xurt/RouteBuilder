-- 15-60 Redridge Mountains: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- Edit zones/Redridge Mountains.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#name 15-60 Redridge Mountains
--RouteBuilder:next
#next Zone Routes (Horde)\11-15 Zephras Isle: around Elegael Thornpaw;Zone Routes (Horde)\12-15 The Barrens: around Gazlowe;Zone Routes (Horde)\10-13 Tirisfal Glades: around Bethor Iceshard

step
    .goto 1433/0,-1892.04,-9600.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marcy Baker|r
    .accept 91900 >>Accept A Sealed Crate
    .accept 91904 >>Accept A Sealed Crate
    .accept 91899 >>Accept A Sealed Crate
    .accept 91905 >>Accept A Sealed Crate
    .target Marcy Baker
step
    .goto 1433/0,-1892.04,-9600.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marcy Baker|r
    .turnin 91899 >>Turn in A Sealed Crate
    .target Marcy Baker
    .isQuestComplete 91899
step
    .goto 1433/0,-1892.04,-9600.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marcy Baker|r
    .turnin 91900 >>Turn in A Sealed Crate
    .target Marcy Baker
    .isQuestComplete 91900
step
    .goto 1433/0,-1892.04,-9600.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marcy Baker|r
    .turnin 91904 >>Turn in A Sealed Crate
    .target Marcy Baker
    .isQuestComplete 91904
step
    .goto 1433/0,-1892.04,-9600.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marcy Baker|r
    .turnin 91905 >>Turn in A Sealed Crate
    .target Marcy Baker
    .isQuestComplete 91905
step
    .goto 1433/0,-2207.24,-9351.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shawn|r
    .accept 3741 >>Accept Hilary's Necklace
    .target Shawn
step
    #loop
    .goto 1433/0,-2211.58,-9352.82,0
    .goto 1433/0,-2211.58,-9352.82,40,0
    .goto 1433/0,-2369.62,-9361.22,40,0
    >>Open the |cRXP_PICK_Glinting Mud|r. Loot it for |cRXP_LOOT_Hilary's Necklace|r
    .complete 3741,1 --Hilary's Necklace (1)
step
    .goto 1433/0,-2205.51,-9351.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hilary|r
    .turnin 3741 >>Turn in Hilary's Necklace
    .target Hilary
step
    +|cRXP_WARN_End of the Redridge Mountains route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: A Sealed Crate, A Sealed Crate, A Sealed Crate, A Sealed Crate
step
    +|cRXP_WARN_Suggested next zones at level 15|r: |cRXP_FRIENDLY_Zephras Isle|r (about 1.3 levels of quests, starting around Elegael Thornpaw), |cRXP_FRIENDLY_The Barrens|r (about 1.2 levels of quests, starting around Gazlowe), |cRXP_FRIENDLY_Tirisfal Glades|r (about 0.7 levels of quests, starting around Bethor Iceshard). Completing this step loads the guide for Zephras Isle --RouteBuilder:next
]])
