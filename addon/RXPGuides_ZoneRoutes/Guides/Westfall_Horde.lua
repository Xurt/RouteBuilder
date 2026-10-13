-- 16-20 Westfall: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 2 parts with a level check between them (from level 16, 19).
-- Edit zones/Westfall.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#name 16-20 Westfall

step
    .goto 1436/0,1966.32,-11407.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Grayson|r
    .accept 103 >>Accept Keeper of the Flame
    .accept 152 >>Accept The Coast Isn't Clear
    .target Captain Grayson
step
    #completewith Along1
    >>As you go: Kill |cRXP_ENEMY_Harvest Golems|r, |cRXP_ENEMY_Harvest Watchers|r, |cRXP_ENEMY_Harvest Reapers|r and |cRXP_ENEMY_Rusty Harvest Golems|r. Loot them for |cRXP_LOOT_Flask of Oil|r. |cRXP_WARN_Anything left is finished later|r
    .complete 103,1 --Flask of Oil (5)
    .mob Harvest Golem
    .mob Harvest Watcher
    .mob Harvest Reaper
    .mob Rusty Harvest Golem
step
    #label Along1
    .goto 1436/0,1708.02,-10580.20
    >>Click the |cRXP_PICK_Burned-Out Remains|r
    .turnin 79007 >>Turn in ... and that note you found
    .isOnQuest 79007
step
    #loop
    .goto 1436/0,1706.27,-10550.80,0
    .goto 1436/0,1706.27,-10550.80,40,0
    .goto 1436/0,1595.32,-10556.40,40,0
    .goto 1436/0,1590.07,-10617.77,40,0
    .goto 1436/0,1646.77,-10615.43,40,0
    .goto 1436/0,1652.02,-10678.90,40,0
    .goto 1436/0,1716.42,-10619.40,40,0
    .goto 1436/0,1853.27,-10634.10,40,0
    .goto 1436/0,1842.07,-10488.73,40,0
    .goto 1436/0,1763.32,-10471.00,40,0
    >>Kill |cRXP_ENEMY_Harvest Golems|r, |cRXP_ENEMY_Harvest Watchers|r, |cRXP_ENEMY_Harvest Reapers|r and |cRXP_ENEMY_Rusty Harvest Golems|r. Loot them for |cRXP_LOOT_Flask of Oil|r
    .complete 103,1 --Flask of Oil (5)
    .mob Harvest Golem
    .mob Harvest Watcher
    .mob Harvest Reaper
    .mob Rusty Harvest Golem
step
    #completewith Drop136x1
    >>|cRXP_LOOT_Captain Sander's Treasure Map|r can drop from |cRXP_ENEMY_Murloc Coastrunner|r, |cRXP_ENEMY_Murloc Tidehunter|r, |cRXP_ENEMY_Murloc Warrior|r. Use it to start the quest if you get one
    .collect 1357,1,136 --Captain Sander's Treasure Map (1)
    .accept 136 >>Accept Captain Sander's Hidden Treasure
    .use 1357
step
    #loop
    .goto 1436/0,1529.87,-9687.93,0
    .goto 1436/0,1529.87,-9687.93,40,0
    .goto 1436/0,1522.17,-9687.70,40,0
    .goto 1436/0,1428.72,-9591.57,40,0
    .goto 1436/0,1452.52,-9583.63,40,0
    .goto 1436/0,1503.62,-9589.93,40,0
    .goto 1436/0,1519.37,-9609.77,40,0
    .goto 1436/0,1547.72,-9626.57,40,0
    .goto 1436/0,1527.77,-9665.53,40,0
    >>Kill |cRXP_ENEMY_Murloc Coastrunners|r
    .complete 152,1 --Murloc Coastrunner slain (7)
    .mob Murloc Coastrunner
step
    #loop
    .goto 1436/0,1890.37,-10021.83,0
    .goto 1436/0,1890.37,-10021.83,40,0
    .goto 1436/0,1951.97,-10022.07,40,0
    .goto 1436/0,1988.72,-10036.30,40,0
    .goto 1436/0,1988.02,-10067.80,40,0
    .goto 1436/0,2027.57,-10057.77,40,0
    .goto 1436/0,2025.12,-10086.47,40,0
    .goto 1436/0,1996.07,-10143.40,40,0
    .goto 1436/0,2021.97,-10179.57,40,0
    .goto 1436/0,2002.37,-10229.97,40,0
    >>Kill |cRXP_ENEMY_Murloc Warriors|r
    .complete 152,2 --Murloc Warrior slain (7)
    .mob Murloc Warrior
step
    #loop
    .goto 1436/0,2045.77,-10634.10,0
    .goto 1436/0,2045.77,-10634.10,40,0
    .goto 1436/0,2053.12,-10651.60,40,0
    .goto 1436/0,2072.72,-10691.27,40,0
    .goto 1436/0,2082.52,-10757.53,40,0
    .goto 1436/0,2103.52,-10776.43,40,0
    .goto 1436/0,2039.12,-10799.77,40,0
    .goto 1436/0,2062.57,-10770.83,40,0
    >>Kill |cRXP_ENEMY_Murloc Oracles|r
    .complete 152,4 --Murloc Oracle slain (7)
    .mob Murloc Oracle
step
    #label Drop136x1
    #loop
    .goto 1436/0,2021.27,-11041.03,0
    .goto 1436/0,2021.27,-11041.03,40,0
    .goto 1436/0,2069.57,-11073.70,40,0
    .goto 1436/0,2086.02,-11079.77,40,0
    .goto 1436/0,2098.97,-11073.00,40,0
    .goto 1436/0,2123.82,-11127.60,40,0
    .goto 1436/0,2084.62,-11122.93,40,0
    .goto 1436/0,2076.92,-11107.30,40,0
    .goto 1436/0,2037.02,-11165.63,40,0
    .goto 1436/0,2039.12,-11139.27,40,0
    >>Kill |cRXP_ENEMY_Murloc Tidehunters|r
    .complete 152,3 --Murloc Tidehunter slain (7)
    .mob Murloc Tidehunter
step
    .goto 1436/0,1966.32,-11407.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Grayson|r
    .turnin 152 >>Turn in The Coast Isn't Clear
    .turnin 103 >>Turn in Keeper of the Flame
    .target Captain Grayson
step
    .goto 1436/0,2109.82,-10514.17
    >>Click the |cRXP_PICK_Captain's Footlocker|r
    .turnin 136 >>Turn in Captain Sander's Hidden Treasure
    .isOnQuest 136
step
    .goto 1436/0,2109.82,-10514.17
    >>Click the |cRXP_PICK_Captain's Footlocker|r
    .accept 138 >>Accept Captain Sander's Hidden Treasure
    .isQuestTurnedIn 136 --any of: Captain Sander's Hidden Treasure
    .xp <10,1
step
    .goto 1436/0,1598.47,-10515.10
    >>Click the |cRXP_PICK_Broken Barrel|r
    .turnin 138 >>Turn in Captain Sander's Hidden Treasure
    .isOnQuest 138
step
    .goto 1436/0,1598.47,-10515.10
    >>Click the |cRXP_PICK_Broken Barrel|r
    .accept 139 >>Accept Captain Sander's Hidden Treasure
    .isQuestTurnedIn 138 --any of: Captain Sander's Hidden Treasure
    .xp <10,1
step
    .goto 1436/0,1594.62,-9797.37
    >>Click the |cRXP_PICK_Old Jug|r
    .turnin 139 >>Turn in Captain Sander's Hidden Treasure
    .isOnQuest 139
step
    .goto 1436/0,1594.62,-9797.37
    >>Click the |cRXP_PICK_Old Jug|r
    .accept 140 >>Accept Captain Sander's Hidden Treasure
    .isQuestTurnedIn 139 --any of: Captain Sander's Hidden Treasure
    .xp <10,1
step
    .goto 1436/0,2107.72,-9794.57
    >>Click the |cRXP_PICK_Locked Chest|r
    .turnin 140 >>Turn in Captain Sander's Hidden Treasure
    .isOnQuest 140
step
    .xp 19 >>|cRXP_WARN_The rest of Westfall is planned from level 19.|r Come back to this guide then
step
    .goto 1436/0,1966.32,-11407.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Grayson|r
    .accept 104 >>Accept The Coastal Menace
    .target Captain Grayson
step
    .goto 1436/0,1992.22,-11172.17
    >>Kill |cRXP_ENEMY_Old Murk-Eye|r and loot |cRXP_LOOT_Scale of Old Murk-Eye|r
    .complete 104,1 --Scale of Old Murk-Eye (1)
    .mob Old Murk-Eye
step
    .goto 1436/0,1966.32,-11407.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Grayson|r
    .turnin 104 >>Turn in The Coastal Menace
    .target Captain Grayson
step
    +|cRXP_WARN_End of the Westfall route.|r
]])
