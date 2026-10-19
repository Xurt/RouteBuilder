-- 26-40 Dustwallow Marsh: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 4 parts (from level 26, 31, 34, 37).
-- Split into 4 guides, listed under "26 - 38 Dustwallow Marsh" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Dustwallow Marsh.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 26 - 38 Dustwallow Marsh
#subweight -26
#name 26-27 Dustwallow Marsh

step
    .goto 1445/1,-4464.15,-3613.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fiora Longears|r
    .turnin 1132 >>Turn in Fiora Longears
    .target Fiora Longears
    .isOnQuest 1132
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baldruc|r
    .goto 1445/1,-4517.49,-3828.83
    .fp Theramore >> Get the Theramore Flight Path
    .target Baldruc
step << Hunter
    .goto 1445/1,-4534.50,-3776.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jensen Farran|r
    .vendor >> |cRXP_BUY_Restock on|r |T132382:0|t[Razor Arrows] |cRXP_BUY_if needed|r
    .target Jensen Farran
step
    .goto 1445/1,-4538.70,-3721.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Clerk Lendry|r
    .turnin 1302 >>Turn in James Hyal
    .target Clerk Lendry
    .isOnQuest 1302
step
    .goto 1445/1,-4546.05,-3738.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Samaul|r
    .turnin 1264 >>Turn in The Missing Diplomat
    .target Commander Samaul
    .isOnQuest 1264
step << Paladin sod
    .trainer >>Train your spells
    .train 19752 >>Train |T136106:0|t[|cRXP_FRIENDLY_Divine Intervention|r]. You will need it for a rune later << sod
step
    .goto 1445/1,-4464.15,-3613.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fiora Longears|r
    .accept 1133 >>Accept Journey to Astranaar
    .accept 1135 >>Accept Highperch Venom
    .target Fiora Longears
step
    .goto 1445/1,-4464.15,-3613.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fiora Longears|r
    .turnin 1135 >>Turn in Highperch Venom
    .target Fiora Longears
    .isQuestComplete 1135
step << Hunter
    .goto 1445/1,-4534.50,-3776.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jensen Farran|r
    .vendor >> |cRXP_BUY_Delete all|r |T132382:0|t[Razor Arrows] |cRXP_BUY_you have and fill your quiver with|r |T135661:0|t[Jagged Arrows] |cRXP_BUY_instead|r
    .target Jensen Farran
    .xp <40,1
step << Hunter
    .goto 1445/1,-4534.50,-3776.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jensen Farran|r
    .vendor >> |cRXP_BUY_Restock on|r |T132382:0|t[Razor Arrows] |cRXP_BUY_if needed. Buy a couple stacks of|r |T135661:0|t[Jagged Arrows] |cRXP_BUY_if you're close to level 40|r
    .target Jensen Farran
    .xp >40,1
step
    .goto 1445/1,-4457.85,-3624.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Morgan Stern|r
    .turnin 1260 >>Turn in Morgan Stern
    .target Morgan Stern
    .isOnQuest 1260
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 1953 >>Turn in Return to the Marsh
    .target Tabetha
    .isOnQuest 1953
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 1951 >>Turn in Rituals of Power
    .target Tabetha
    .isQuestComplete 1951
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 1947 >>Turn in Journey to the Marsh
    .target Tabetha
    .isOnQuest 1947
step << Warlock
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 1799 >>Turn in Fragments of the Orb of Orahil
    .target Tabetha
    .isQuestComplete 1799
step
    +|cRXP_WARN_That is all of Dustwallow Marsh for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Ashenvale|r: Journey to Astranaar
    >>|cRXP_FRIENDLY_Thousand Needles and back here|r: Highperch Venom
step
    +|cRXP_WARN_The rest of Dustwallow Marsh is planned from level 31.|r Load its guide for level 31 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 26 - 38 Dustwallow Marsh
#subweight -26
#name 31-32 Dustwallow Marsh: around Captain Garran Vimes

step
    .goto 1445/1,-4447.87,-3645.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Guard Byron|r
    .accept 1282 >>Accept They Call Him Smiling Jim
    .target Guard Byron
step
    .goto 1445/1,-3885.60,-2940.53
    >>Click the |cRXP_PICK_Loose Dirt|r
    .accept 1219 >>Accept The Orc Report
step
    .goto 1445/1,-4464.15,-3613.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fiora Longears|r
    .turnin 1135 >>Turn in Highperch Venom
    .target Fiora Longears
    .isQuestComplete 1135
step
    #loop
    .goto 1445/1,-4387.50,-3678.33,0
    .goto 1445/1,-4387.50,-3678.33,40,0
    .goto 1445/1,-4545.00,-3713.33,40,0
    .goto 1445/1,-4503.00,-3818.33,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Theramore Lieutenant|r. |cRXP_WARN_This NPC walks a patrol route|r
    .turnin 1219 >>Turn in The Orc Report
    .accept 1220 >>Accept Captain Vimes
    .unitscan Theramore Lieutenant
step
    .goto 1445/1,-4556.02,-3735.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Garran Vimes|r
    .turnin 1220 >>Turn in Captain Vimes
    .turnin 1282 >>Turn in They Call Him Smiling Jim
    .target Captain Garran Vimes
step
    .goto 1445/1,-2534.25,-3700.73
    >>Click the |cRXP_PICK_Hoofprints|r
    .accept 1284 >>Accept Suspicious Hoofprints
step
    .goto 1445/1,-2541.07,-3721.73
    >>Click the |cRXP_PICK_Theramore Guard Badge|r
    .accept 1252 >>Accept Lieutenant Paval Reethe
step
    .goto 1445/1,-2530.57,-3735.03
    >>Click the |cRXP_PICK_Black Shield|r
    .accept 1253 >>Accept The Black Shield
step
    .goto 1445/1,-4556.02,-3735.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Garran Vimes|r
    .turnin 1252 >>Turn in Lieutenant Paval Reethe
    .turnin 1253 >>Turn in The Black Shield
    .turnin 1284 >>Turn in Suspicious Hoofprints
    .accept 1259 >>Accept Lieutenant Paval Reethe
    .accept 1319 >>Accept The Black Shield
    .target Captain Garran Vimes
step
    .goto 1445/1,-4547.62,-3717.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Adjutant Tesoran|r
    .turnin 1259 >>Turn in Lieutenant Paval Reethe
    .accept 1285 >>Accept Daelin's Men
    .target Adjutant Tesoran
step
    .goto 1445/1,-4374.37,-3798.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Caz Twosprocket|r
    .turnin 1319 >>Turn in The Black Shield
    .accept 1320 >>Accept The Black Shield
    .target Caz Twosprocket
step
    .goto 1445/1,-4556.02,-3735.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Garran Vimes|r
    .turnin 1285 >>Turn in Daelin's Men
    .turnin 1320 >>Turn in The Black Shield
    .accept 1286 >>Accept The Deserters
    .target Captain Garran Vimes
step
    .goto 1445/1,-2869.72,-3934.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Balos Jacken|r
    .turnin 1286 >>Turn in The Deserters
    .accept 1287 >>Accept The Deserters
    .target Balos Jacken
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .accept 1949 >>Accept Hidden Secrets
    .target Tabetha
    .isQuestTurnedIn 1947 --any of: Journey to the Marsh
    .xp <30,1
step
    .goto 1445/1,-4556.02,-3735.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captain Garran Vimes|r
    .turnin 1287 >>Turn in The Deserters
    .target Captain Garran Vimes
step
    +|cRXP_WARN_That is all of Dustwallow Marsh for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Thousand Needles|r: Hidden Secrets << Mage
step
    +|cRXP_WARN_The rest of Dustwallow Marsh is planned from level 34.|r Load its guide for level 34 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 26 - 38 Dustwallow Marsh
#subweight -26
#name 34-35 Dustwallow Marsh

step
    .goto 1445/1,-3978.00,-2761.33
    >>Click the |cRXP_PICK_Waterlogged Book|r
    .accept 79952 >>Accept RwlRwlRwlRwl!
step
    .goto 1445/1,-3978.00,-2761.33
    >>Open the |cRXP_PICK_Waterlogged Book|r. Loot it for |cRXP_LOOT_RwlRwlRwlRwl!|r
    .complete 79952,1 --RwlRwlRwlRwl! (1)
step
    .goto 1445/1,-4546.05,-3738.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Samaul|r
    .accept 1265 >>Accept The Missing Diplomat
    .target Commander Samaul
    .isQuestTurnedIn 1264 --any of: The Missing Diplomat
    .xp <28,1
step << Paladin
    .trainer >>Train your spells
    .train 19752 >>Train |T136106:0|t[|cRXP_FRIENDLY_Divine Intervention|r]. You will need it for a rune later << sod
step
    .goto 1445/1,-4120.80,-3464.83
    >>Sentry Point explored
    .complete 1265,1 --Sentry Point explored
    .isOnQuest 1265
step
    .goto 1445/1,-4462.05,-3757.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Tervosh|r
    .turnin 1265 >>Turn in The Missing Diplomat
    .target Archmage Tervosh
    .isOnQuest 1265
step
    .goto 1445/1,-4462.05,-3757.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Tervosh|r
    .accept 1266 >>Accept The Missing Diplomat
    .target Archmage Tervosh
    .isQuestTurnedIn 1265 --any of: The Missing Diplomat
    .xp <28,1
step
    .goto 1445/1,-3885.60,-2952.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Swamp Eye" Jarl|r
    .accept 1218 >>Accept Soothing Spices
    .target "Swamp Eye" Jarl
step
    .goto 1445/1,-4463.10,-3834.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy |cRXP_LOOT_Soothing Spices|r from |cRXP_FRIENDLY_Helenia Olden|r
    .complete 1218,1 --Soothing Spices (3)
    .target Helenia Olden
step
    .goto 1445/1,-3885.60,-2952.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Swamp Eye" Jarl|r
    .turnin 1218 >>Turn in Soothing Spices
    .target "Swamp Eye" Jarl
step << Mage
    .trainer >> Teleport to Stormwind or Ironforge. Train your level 38 spells
    >>Start being very careful with your money too, as it's very nice to have your mount at level 40
step
    .goto 1445/1,-3350.10,-2896.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Private Hendel|r
    .turnin 1266 >>Turn in The Missing Diplomat
    .target Private Hendel
    .isOnQuest 1266
step
    .goto 1445/1,-3350.10,-2896.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Private Hendel|r
    .accept 1324 >>Accept The Missing Diplomat
    .target Private Hendel
    .isQuestTurnedIn 1266 --any of: The Missing Diplomat
    .xp <28,1
step
    .goto 1445/1,-3350.10,-2896.08
    >>Kill |cRXP_ENEMY_Private Hendel|r
    .complete 1324,1 --Private Hendel slain (1)
    .mob Private Hendel
    .isOnQuest 1324
step
    .goto 1445/1,-4462.05,-3757.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Tervosh|r
    .turnin 1324 >>Turn in The Missing Diplomat
    .target Archmage Tervosh
    .isOnQuest 1324
step
    .goto 1445/1,-4454.17,-3749.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lady Jaina Proudmoore|r
    .accept 1267 >>Accept The Missing Diplomat
    .target Lady Jaina Proudmoore
    .isQuestTurnedIn 1324 --any of: The Missing Diplomat
    .xp <28,1
step
    .goto 1445/1,-4454.17,-3749.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lady Jaina Proudmoore|r
    .turnin 1267 >>Turn in The Missing Diplomat
    .target Lady Jaina Proudmoore
    .isOnQuest 1267
step
    .goto 1445/1,-2820.37,-3372.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mudcrush Durtfeet|r
    .accept 1177 >>Accept Hungry!
    .target Mudcrush Durtfeet
step
    .goto 1445/1,-4464.15,-3613.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fiora Longears|r
    .turnin 1135 >>Turn in Highperch Venom
    .target Fiora Longears
    .isQuestComplete 1135
step << Mage
    .goto 1445/1,-4517.17,-3828.83
    .fp Theramore >> Get the Theramore Flight Path
step
    .goto 1445/1,-4457.85,-3624.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Morgan Stern|r
    .accept 1204 >>Accept Mudrock Soup and Bugs
    .target Morgan Stern
step << Mage
    .goto 1445/1,-4470.97,-3616.03
    .vendor >> Buy up to 180 level 35 drink
step
    #completewith Drop635x1
    >>|cRXP_LOOT_Pendant of Myzrael|r can drop from |cRXP_ENEMY_Mirefin Puddlejumper|r, |cRXP_ENEMY_Mirefin Murloc|r, |cRXP_ENEMY_Mirefin Warrior|r. Use it to start the quest if you get one
    .collect 4614,1,635 --Pendant of Myzrael (1)
    .accept 635 >>Accept Crystal in the Mountains
    .use 4614
step
    #label Drop635x1
    #loop
    .goto 1445/1,-3936.00,-2838.33,0
    .goto 1445/1,-3936.00,-2838.33,40,0
    .goto 1445/1,-3967.50,-2817.33,40,0
    .goto 1445/1,-3999.00,-2789.33,40,0
    .goto 1445/1,-4020.00,-2754.33,40,0
    .goto 1445/1,-4009.50,-2712.33,40,0
    .goto 1445/1,-4045.20,-2601.03,40,0
    .goto 1445/1,-3991.12,-2593.33,40,0
    .goto 1445/1,-3924.45,-2616.08,40,0
    .goto 1445/1,-3936.00,-2768.33,40,0
    >>Kill |cRXP_ENEMY_Mirefin Oracles|r, |cRXP_ENEMY_Mirefin Coastrunners|r, |cRXP_ENEMY_Mirefin Warriors|r and |cRXP_ENEMY_Mirefin Puddlejumpers|r. Loot them for |cRXP_LOOT_Mirefin Head|r
    .complete 1177,1 --Mirefin Head (12)
    .mob Mirefin Oracle
    .mob Mirefin Coastrunner
    .mob Mirefin Warrior
    .mob Mirefin Puddlejumper
step
    #loop
    .goto 1445/1,-4209.00,-2985.33,0
    .goto 1445/1,-4209.00,-2985.33,40,0
    .goto 1445/1,-4209.00,-3062.33,40,0
    .goto 1445/1,-4198.50,-3104.33,40,0
    .goto 1445/1,-4219.50,-3146.33,40,0
    .goto 1445/1,-4432.12,-3103.63,40,0
    .goto 1445/1,-4346.02,-3088.93,40,0
    .goto 1445/1,-4289.32,-3082.28,40,0
    .goto 1445/1,-4261.50,-3034.33,40,0
    .goto 1445/1,-4261.50,-2922.33,40,0
    >>Kill |cRXP_ENEMY_Mudrock Tortoises|r, |cRXP_ENEMY_Mudrock Spikeshells|r, |cRXP_ENEMY_Mudrock Burrowers|r and |cRXP_ENEMY_Mudrock Borers|r. Loot them for |cRXP_LOOT_Forked Mudrock Tongue|r
    .complete 1204,1 --Forked Mudrock Tongue (8)
    .mob Mudrock Tortoise
    .mob Mudrock Spikeshell
    .mob Mudrock Burrower
    .mob Mudrock Borer
step << Mage Gnome
    .trainer >> Train your class spells
step
    .goto 1445/1,-3436.20,-2646.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Stinky" Ignatz|r
    .accept 1222 >>Accept Stinky's Escape
    .target "Stinky" Ignatz
step
    .goto 1445/1,-3540.67,-2893.63
    >>Help Stinky find Bogbean Leaves
    .complete 1222,1 --Help Stinky find Bogbean Leaves
step
    .goto 1445/1,-2820.37,-3372.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mudcrush Durtfeet|r
    .turnin 1177 >>Turn in Hungry!
    .target Mudcrush Durtfeet
step
    .goto 1445/1,-4457.85,-3624.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Morgan Stern|r
    .turnin 1222 >>Turn in Stinky's Escape
    .turnin 1204 >>Turn in Mudrock Soup and Bugs
    .accept 1258 >>Accept ... and Bugs
    .target Morgan Stern
step << Mage
    .trainer >> Train your class spells
step
    .goto 1445/1,-4457.85,-3624.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Morgan Stern|r
    .turnin 1258 >>Turn in ... and Bugs
    .target Morgan Stern
    .isQuestComplete 1258
step
    +|cRXP_WARN_That is all of Dustwallow Marsh for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Arathi Highlands|r: Crystal in the Mountains
    >>|cRXP_FRIENDLY_Undercity|r: RwlRwlRwlRwl!
    >>|cRXP_FRIENDLY_Swamp of Sorrows and back here|r: ... and Bugs
step
    +|cRXP_WARN_The rest of Dustwallow Marsh is planned from level 37.|r Load its guide for level 37 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 26 - 38 Dustwallow Marsh
#subweight -26
#name 37-38 Dustwallow Marsh

step
    .goto 1445/1,-4464.15,-3613.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fiora Longears|r
    .turnin 1135 >>Turn in Highperch Venom
    .target Fiora Longears
    .isQuestComplete 1135
step
    .goto 1445/1,-4457.85,-3624.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Morgan Stern|r
    .turnin 1258 >>Turn in ... and Bugs
    .target Morgan Stern
    .isQuestComplete 1258
step
    .goto 1445/1,-3885.60,-2952.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Swamp Eye" Jarl|r
    .accept 1206 >>Accept Jarl Needs Eyes
    .target "Swamp Eye" Jarl
    .isQuestTurnedIn 1218 --any of: Soothing Spices
step
    #loop
    .goto 1445/1,-2850.82,-2770.08,0
    .goto 1445/1,-2850.82,-2770.08,40,0
    .goto 1445/1,-2776.80,-2842.88,40,0
    .goto 1445/1,-2818.80,-2884.53,40,0
    .goto 1445/1,-2778.90,-2928.98,40,0
    .goto 1445/1,-2686.50,-2817.33,40,0
    .goto 1445/1,-2606.70,-2821.18,40,0
    .goto 1445/1,-2562.07,-2777.78,40,0
    .goto 1445/1,-2610.37,-2747.33,40,0
    .goto 1445/1,-2736.37,-2753.28,40,0
    >>Kill |cRXP_ENEMY_Darkmist Spiders|r, |cRXP_ENEMY_Darkmist Lurkers|r, |cRXP_ENEMY_Darkmist Recluses|r and |cRXP_ENEMY_Darkmist Silkspinners|r. Loot them for |cRXP_LOOT_Unpopped Darkmist Eye|r
    .complete 1206,1 --Unpopped Darkmist Eye (40)
    .mob Darkmist Spider
    .mob Darkmist Lurker
    .mob Darkmist Recluse
    .mob Darkmist Silkspinner
    .isOnQuest 1206
step
    .goto 1445/1,-3885.60,-2952.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Swamp Eye" Jarl|r
    .turnin 1206 >>Turn in Jarl Needs Eyes
    .target "Swamp Eye" Jarl
    .isOnQuest 1206
step
    .goto 1445/1,-3885.60,-2952.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Swamp Eye" Jarl|r
    .accept 1203 >>Accept Jarl Needs a Blade
    .target "Swamp Eye" Jarl
    .isQuestTurnedIn 1206 --any of: Jarl Needs Eyes
step
    .goto 1445/1,-3885.60,-2952.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_"Swamp Eye" Jarl|r
    .turnin 1203 >>Turn in Jarl Needs a Blade
    .target "Swamp Eye" Jarl
    .isQuestComplete 1203
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .accept 1952 >>Accept Mage's Wand
    .target Tabetha
    .isQuestTurnedIn 1948 --Items of Power
    .isQuestTurnedIn 1951 --Rituals of Power
    .xp <30,1
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 1952 >>Turn in Mage's Wand
    .target Tabetha
    .isOnQuest 1952
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .accept 1948 >>Accept Items of Power
    .target Tabetha
    .isQuestTurnedIn 1947 --any of: Journey to the Marsh
    .xp <30,1
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .accept 1954 >>Accept The Infernal Orb
    .target Tabetha
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 1954 >>Turn in The Infernal Orb
    .target Tabetha
    .isQuestComplete 1954
step << Mage
    .goto 1445/1,-3393.15,-4031.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tabetha|r
    .turnin 1948 >>Turn in Items of Power
    .target Tabetha
    .isQuestComplete 1948
step << Mage
    #loop
    .goto 1445/1,-3289.72,-4306.23,0
    .goto 1445/1,-3289.72,-4306.23,40,0
    .goto 1445/1,-3336.97,-4323.03,40,0
    .goto 1445/1,-3330.15,-4374.48,40,0
    .goto 1445/1,-3228.82,-4333.18,40,0
    >>Open the |cRXP_PICK_Gold Vein|r. Loot it for |cRXP_LOOT_Jade|r
    .complete 1948,1 --Jade (1)
    .isOnQuest 1948
step
    +|cRXP_WARN_End of the Dustwallow Marsh route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Jarl Needs a Blade
    >>|cRXP_FRIENDLY_Desolace and back here|r: The Infernal Orb << Mage
]])
