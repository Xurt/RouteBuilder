-- 15-60 Redridge Mountains: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
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
#next Zone Routes (Horde)\8-29 The Barrens

step
    #label RBSection1_1
    #completewith next
    +|cRXP_WARN_Redridge Mountains: around Marcy Baker|r (planned from level 15)
step
    .goto 1433/0,-1892.26,-9603.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marcy Baker|r
    .accept 91900 >>Accept A Sealed Crate
    .accept 91904 >>Accept A Sealed Crate
    .accept 91899 >>Accept A Sealed Crate
    .accept 91905 >>Accept A Sealed Crate
    .target Marcy Baker
step
    .goto 1433/0,-1892.26,-9603.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marcy Baker|r
    .turnin 91899 >>Turn in A Sealed Crate
    .target Marcy Baker
    .isQuestComplete 91899
step
    .goto 1433/0,-1892.26,-9603.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marcy Baker|r
    .turnin 91900 >>Turn in A Sealed Crate
    .target Marcy Baker
    .isQuestComplete 91900
step
    .goto 1433/0,-1892.26,-9603.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marcy Baker|r
    .turnin 91904 >>Turn in A Sealed Crate
    .target Marcy Baker
    .isQuestComplete 91904
step
    .goto 1433/0,-1892.26,-9603.02
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
    .goto 1433/0,-2239.37,-9361.22,40,0
    .goto 1433/0,-2300.15,-9374.25,40,0
    .goto 1433/0,-2393.50,-9364.11,40,0
    .goto 1433/0,-2369.62,-9361.22,40,0
    .goto 1433/0,-2311.66,-9347.75,40,0
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
    +|cRXP_WARN_Suggested next zones at level 15|r: |cRXP_FRIENDLY_The Barrens|r (about 0.5 levels of quests, starting around Sergra Darkthorn). Completing this step loads the guide for The Barrens --RouteBuilder:next
]])
