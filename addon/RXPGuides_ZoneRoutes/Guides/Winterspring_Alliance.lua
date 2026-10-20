-- 52-60 Winterspring: Zone Routes (Alliance).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 3 parts (from level 52, 55, 58).
-- Split into 3 guides, listed under "52 - 59 Winterspring" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Winterspring.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 52 - 59 Winterspring
#subweight -52
#name 52-53 Winterspring

step
    .goto 1452/1,-4302.61,6433.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Remorseful Highborne|r
    .turnin 5248 >>Turn in Tormented By the Past
    .target Remorseful Highborne
    .isOnQuest 5248
step
    .goto 1452/1,-4189.72,6109.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Haleh|r
    .turnin 6501 >>Turn in The Dragon's Eye
    .target Haleh
    .isOnQuest 6501
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .turnin 3908 >>Turn in It's a Secret to Everybody
    .target Donova Snowden
    .isOnQuest 3908
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .accept 3909 >>Accept The Videre Elixir
    .target Donova Snowden
    .isQuestTurnedIn 3908 --any of: It's a Secret to Everybody
    .xp <47,1
step
    .goto 1452/1,-4742.38,6800.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maethrya|r
    .fp Winterspring >> Get the Winterspring Flight Path
    .fly Felwood >> Fly to Felwood
    .target Maethrya
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .turnin 980 >>Turn in The New Springs
    .target Donova Snowden
    .isOnQuest 980
step
    .goto 1452/1,-2285.50,6900.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Salfa|r
    .turnin 8465 >>Turn in Speak to Salfa
    .target Salfa
    .isOnQuest 8465
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .turnin 5085 >>Turn in Mystery Goo
    .target Donova Snowden
    .isOnQuest 5085
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .accept 3912 >>Accept Meet at the Grave
    .target Donova Snowden
    .isQuestTurnedIn 3909 --any of: The Videre Elixir
    .xp <47,1
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .turnin 3909 >>Turn in The Videre Elixir
    .target Donova Snowden
    .isQuestComplete 3909
step
    .goto 1452/1,-4006.54,7094.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wynd Nightchaser|r
    .turnin 5249 >>Turn in To Winterspring!
    .target Wynd Nightchaser
    .isOnQuest 5249
step
    .goto 1452/1,-4006.54,7094.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wynd Nightchaser|r
    .turnin 5250 >>Turn in Starfall
    .target Wynd Nightchaser
    .isOnQuest 5250
step
    .goto 1452/1,-4672.52,6688.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gregor Greystone|r
    .accept 6028 >>Accept The Everlook Report
    .accept 6030 >>Accept Duke Nicholas Zverenhoff
    .target Gregor Greystone
step
    .goto 1452/1,-4667.55,6688.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jessica Redpath|r
    .accept 5601 >>Accept Sister Pamela
    .target Jessica Redpath
step
    .goto 1452/1,-4794.64,5717.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ranshalla|r
    .turnin 979 >>Turn in Find Ranshalla
    .target Ranshalla
    .isOnQuest 979
step << Hunter
    .goto 1452/1,-4420.47,7283.73,70,0
    .goto 1452/1,-4548.27,7681.33
    >>|cRXP_WARN_Cast|r |T132164:0|t[Tame Beast] |cRXP_WARN_on a |cRXP_ENEMY_Winterspring Screecher|r to tame it|r
    .train 3666 >>|cRXP_WARN_Attack mobs with it to learn|r |T132140:0|t[Claw (Rank 8)]
    .zoneskip Winterspring,1
step
    .goto 1452/1,-4692.40,6705.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Felnok Steelspring|r
    .turnin 4808 >>Turn in Felnok Steelspring
    .target Felnok Steelspring
    .isOnQuest 4808
step
    .goto 1452/1,-5131.18,7234.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Umbranse the Spiritspeaker|r
    .turnin 3512 >>Turn in In Eranikus' Own Words
    .target Umbranse the Spiritspeaker
    .isOnQuest 3512
step
    +|cRXP_WARN_That is all of Winterspring for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Eastern Plaguelands|r: Duke Nicholas Zverenhoff, Sister Pamela
    >>|cRXP_FRIENDLY_Tanaris|r: Meet at the Grave
    >>|cRXP_FRIENDLY_Western Plaguelands|r: The Everlook Report
step
    +|cRXP_WARN_The rest of Winterspring is planned from level 55.|r Load its guide for level 55 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 52 - 59 Winterspring
#subweight -52
#name 55-56 Winterspring: around Umi Rumplesnicker

step
    .goto 1452/1,-4302.61,6433.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Remorseful Highborne|r
    .accept 5252 >>Accept Remorseful Highborne
    .target Remorseful Highborne
    .isQuestTurnedIn 5248 --any of: Tormented By the Past
    .xp <53,1
step
    .goto 1452/1,-4623.53,6726.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Meggi Peppinrocker|r
    .accept 6603 >>Accept Trouble in Winterspring!
    .target Meggi Peppinrocker
step
    .goto 1452/1,-4673.23,6695.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Vizzie|r
    .target Innkeeper Vizzie
    .home >>Set your Hearthstone to Innkeeper Vizzie's inn
step
    .goto 1452/1,-4006.54,7094.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wynd Nightchaser|r
    .turnin 5252 >>Turn in Remorseful Highborne
    .target Wynd Nightchaser
    .isOnQuest 5252
step
    .goto 1452/1,-4006.54,7094.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wynd Nightchaser|r
    .accept 5253 >>Accept The Crystal of Zin-Malor
    .target Wynd Nightchaser
    .isQuestTurnedIn 5252 --any of: Remorseful Highborne
    .xp <53,1
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .turnin 6603 >>Turn in Trouble in Winterspring!
    .accept 5082 >>Accept Threat of the Winterfall
    .target Donova Snowden
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .accept 5086 >>Accept Toxic Horrors
    .target Donova Snowden
    .isQuestTurnedIn 5085 --any of: Mystery Goo
    .xp <52,1
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .accept 4842 >>Accept Strange Sources
    .target Donova Snowden
    .isQuestTurnedIn 980 --any of: The New Springs
    .xp <51,1
step
    #completewith Drop5083x1
    >>|cRXP_LOOT_Empty Firewater Flask|r can drop from |cRXP_ENEMY_Winterfall Ursa|r, |cRXP_ENEMY_Winterfall Shaman|r, |cRXP_ENEMY_Winterfall Den Watcher|r. Use it to start the quest if you get one
    .collect 12771,1,5083 --Empty Firewater Flask (1)
    .accept 5083 >>Accept Winterfall Firewater
    .use 12771
step
    #completewith Drop5083x1
    >>|cRXP_LOOT_Winterfall Ritual Totem|r can drop from |cRXP_ENEMY_Winterfall Ursa|r, |cRXP_ENEMY_Winterfall Shaman|r, |cRXP_ENEMY_Winterfall Den Watcher|r. Use it to start the quest if you get one
    .collect 20742,1,8471 --Winterfall Ritual Totem (1)
    .accept 8471 >>Accept Winterfall Ritual Totem
    .use 20742
step
    #label Drop5083x1
    #loop
    .goto 1452/1,-3217.02,6520.72,0
    .goto 1452/1,-3217.02,6520.72,40,0
    .goto 1452/1,-3337.72,6496.11,40,0
    >>Kill |cRXP_ENEMY_Winterfall Pathfinders|r
    .complete 5082,1 --Winterfall Pathfinder slain (8)
    .mob Winterfall Pathfinder
step
    #completewith next
    .hs >>Hearth to Innkeeper Vizzie's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1452/1,-4656.19,6714.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Harlo Wigglesworth|r
    .accept 6604 >>Accept Enraged Wildkin
    .target Harlo Wigglesworth
step
    #completewith Drop5083x2
    >>|cRXP_LOOT_Empty Firewater Flask|r can drop from |cRXP_ENEMY_Winterfall Ursa|r, |cRXP_ENEMY_Winterfall Shaman|r, |cRXP_ENEMY_Winterfall Den Watcher|r. Use it to start the quest if you get one
    .collect 12771,1,5083 --Empty Firewater Flask (1)
    .accept 5083 >>Accept Winterfall Firewater
    .use 12771
step
    #completewith Drop5083x2
    >>|cRXP_LOOT_Winterfall Ritual Totem|r can drop from |cRXP_ENEMY_Winterfall Ursa|r, |cRXP_ENEMY_Winterfall Shaman|r, |cRXP_ENEMY_Winterfall Den Watcher|r. Use it to start the quest if you get one
    .collect 20742,1,8471 --Winterfall Ritual Totem (1)
    .accept 8471 >>Accept Winterfall Ritual Totem
    .use 20742
step
    #loop
    .goto 1452/1,-5012.61,6853.95,0
    .goto 1452/1,-5012.61,6853.95,40,0
    .goto 1452/1,-5153.90,6845.43,40,0
    >>Kill |cRXP_ENEMY_Winterfall Den Watchers|r
    .complete 5082,2 --Winterfall Den Watcher slain (8)
    .mob Winterfall Den Watcher
step
    #label Drop5083x2
    .goto 1452/1,-3161.64,6478.59
    >>Kill |cRXP_ENEMY_Winterfall Totemics|r
    .complete 5082,3 --Winterfall Totemic slain (8)
    .mob Winterfall Totemic
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .turnin 5082 >>Turn in Threat of the Winterfall
    .target Donova Snowden
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .accept 5087 >>Accept Winterfall Runners
    .target Donova Snowden
    .isQuestTurnedIn 5086 --any of: Toxic Horrors
    .xp <52,1
step
    .goto 1452/1,-4006.54,7094.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wynd Nightchaser|r
    .accept 5244 >>Accept The Ruins of Kel'Theril
    .target Wynd Nightchaser
step
    .goto 1452/1,-4018.61,7092.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jaron Stoneshaper|r
    .turnin 6604 >>Turn in Enraged Wildkin
    .turnin 5244 >>Turn in The Ruins of Kel'Theril
    .accept 5245 >>Accept Troubled Spirits of Kel'Theril
    .accept 4861 >>Accept Enraged Wildkin
    .target Jaron Stoneshaper
step
    .goto 1452/1,-3929.15,6559.06
    >>Loot the |cRXP_PICK_Highborne Relic Fragments|r for |cRXP_LOOT_Second Relic Fragment|r
    >>Loot the |cRXP_PICK_Highborne Relic Fragments|r for |cRXP_LOOT_Fourth Relic Fragment|r
    .complete 5245,2 --Second Relic Fragment (4)
    .complete 5245,4 --Fourth Relic Fragment (4)
step
    .goto 1452/1,-4101.68,6477.17
    >>Loot the |cRXP_PICK_Highborne Relic Fragments|r for |cRXP_LOOT_Third Relic Fragment|r
    >>Loot the |cRXP_PICK_Highborne Relic Fragments|r for |cRXP_LOOT_First Relic Fragment|r
    .complete 5245,3 --Third Relic Fragment (4)
    .complete 5245,1 --First Relic Fragment (4)
step
    .goto 1452/1,-4504.96,5703.27
    >>Click the |cRXP_PICK_Damaged Crate|r
    .turnin 4861 >>Turn in Enraged Wildkin
    .accept 4863 >>Accept Enraged Wildkin
step
    .goto 1452/1,-4678.91,5661.15
    >>Click the |cRXP_PICK_Jaron's Wagon|r
    .turnin 4863 >>Turn in Enraged Wildkin
step
    .goto 1452/1,-4563.89,5018.83
    >>Discover Darkwhisper Gorge
    .complete 4842,1 --Discover Darkwhisper Gorge
    .isOnQuest 4842
step
    #completewith Drop5083x3
    >>|cRXP_LOOT_Empty Firewater Flask|r can drop from |cRXP_ENEMY_Winterfall Ursa|r, |cRXP_ENEMY_Winterfall Shaman|r, |cRXP_ENEMY_Winterfall Den Watcher|r. Use it to start the quest if you get one
    .collect 12771,1,5083 --Empty Firewater Flask (1)
    .accept 5083 >>Accept Winterfall Firewater
    .use 12771
step
    #completewith Drop5083x3
    >>|cRXP_LOOT_Winterfall Ritual Totem|r can drop from |cRXP_ENEMY_Winterfall Ursa|r, |cRXP_ENEMY_Winterfall Shaman|r, |cRXP_ENEMY_Winterfall Den Watcher|r. Use it to start the quest if you get one
    .collect 20742,1,8471 --Winterfall Ritual Totem (1)
    .accept 8471 >>Accept Winterfall Ritual Totem
    .use 20742
step
    #label Drop5083x3
    .goto 1452/1,-2301.83,6899.39
    >>Kill |cRXP_ENEMY_Winterfall Runner|r and loot |cRXP_LOOT_Winterfall Crate|r
    .complete 5087,1 --Winterfall Crate (1)
    .mob Winterfall Runner
    .isOnQuest 5087
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .turnin 4842 >>Turn in Strange Sources
    .target Donova Snowden
    .isOnQuest 4842
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .turnin 5087 >>Turn in Winterfall Runners
    .target Donova Snowden
    .isOnQuest 5087
step
    .goto 1452/1,-2285.50,6900.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Salfa|r
    .accept 8464 >>Accept Winterfall Activity
    .target Salfa
step
    .goto 1452/1,-4692.40,6705.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Felnok Steelspring|r
    .accept 4809 >>Accept Chillwind Horns
    .target Felnok Steelspring
    .isQuestTurnedIn 4808 --any of: Felnok Steelspring
    .xp <50,1
step
    .goto 1452/1,-4639.15,6752.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Umi Rumplesnicker|r
    .accept 3783 >>Accept Are We There, Yeti?
    .target Umi Rumplesnicker
step
    #loop
    .goto 1452/1,-4544.01,7418.16,0
    .goto 1452/1,-4544.01,7418.16,40,0
    .goto 1452/1,-4602.23,7500.52,40,0
    .goto 1452/1,-4380.71,7452.24,40,0
    >>Kill |cRXP_ENEMY_Fledgling Chillwinds|r, |cRXP_ENEMY_Chillwind Chimaeras|r and |cRXP_ENEMY_Chillwind Ravagers|r. Loot them for |cRXP_LOOT_Uncracked Chillwind Horn|r
    .complete 4809,1 --Uncracked Chillwind Horn (8)
    .mob Fledgling Chillwind
    .mob Chillwind Chimaera
    .mob Chillwind Ravager
    .isOnQuest 4809
step
    #loop
    .goto 1452/1,-5016.87,6588.88,0
    .goto 1452/1,-5016.87,6588.88,40,0
    .goto 1452/1,-5033.20,6377.30,40,0
    .goto 1452/1,-5079.35,6479.54,40,0
    .goto 1452/1,-5233.42,6642.84,40,0
    >>Kill |cRXP_ENEMY_Rogue Ice Thistles|r and |cRXP_ENEMY_Ice Thistle Yetis|r. Loot them for |cRXP_LOOT_Thick Yeti Fur|r
    .complete 3783,1 --Thick Yeti Fur (10)
    .mob Rogue Ice Thistle
    .mob Ice Thistle Yeti
step
    .goto 1452/1,-4639.15,6752.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Umi Rumplesnicker|r
    .turnin 3783 >>Turn in Are We There, Yeti?
    .accept 977 >>Accept Are We There, Yeti?
    .target Umi Rumplesnicker
step
    #completewith Drop5083x4
    >>|cRXP_LOOT_Empty Firewater Flask|r can drop from |cRXP_ENEMY_Winterfall Ursa|r, |cRXP_ENEMY_Winterfall Shaman|r, |cRXP_ENEMY_Winterfall Den Watcher|r. Use it to start the quest if you get one
    .collect 12771,1,5083 --Empty Firewater Flask (1)
    .accept 5083 >>Accept Winterfall Firewater
    .use 12771
step
    #completewith Drop5083x4
    >>|cRXP_LOOT_Winterfall Ritual Totem|r can drop from |cRXP_ENEMY_Winterfall Ursa|r, |cRXP_ENEMY_Winterfall Shaman|r, |cRXP_ENEMY_Winterfall Den Watcher|r. Use it to start the quest if you get one
    .collect 20742,1,8471 --Winterfall Ritual Totem (1)
    .accept 8471 >>Accept Winterfall Ritual Totem
    .use 20742
step
    #label Drop5083x4
    #loop
    .goto 1452/1,-4987.76,6751.71,0
    .goto 1452/1,-4987.76,6751.71,40,0
    .goto 1452/1,-5134.73,6731.83,40,0
    .goto 1452/1,-5115.56,6845.43,40,0
    >>Kill |cRXP_ENEMY_Winterfall Shamans|r
    >>Kill |cRXP_ENEMY_Winterfall Den Watchers|r
    >>Kill |cRXP_ENEMY_Winterfall Ursas|r
    .complete 8464,1 --Winterfall Shaman slain (8)
    .complete 8464,2 --Winterfall Den Watcher slain (8)
    .complete 8464,3 --Winterfall Ursa slain (8)
    .mob Winterfall Shaman
    .mob Winterfall Den Watcher
    .mob Winterfall Ursa
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .turnin 5083 >>Turn in Winterfall Firewater
    .target Donova Snowden
    .isOnQuest 5083
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .accept 5084 >>Accept Falling to Corruption
    .target Donova Snowden
    .isQuestTurnedIn 5083 --any of: Winterfall Firewater
    .xp <52,1
step
    .goto 1452/1,-2285.50,6900.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Salfa|r
    .turnin 8464 >>Turn in Winterfall Activity
    .target Salfa
step
    #completewith next
    .hs >>Hearth to Innkeeper Vizzie's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .xp 55 >>Grind to level 55 (A Little Luck needs it)
step
    .goto 1452/1,-4656.19,6714.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Harlo Wigglesworth|r
    .accept 6606 >>Accept A Little Luck
    .target Harlo Wigglesworth
step
    .goto 1452/1,-4712.99,6720.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Mau'ari|r
    .turnin 6606 >>Turn in A Little Luck
    .target Witch Doctor Mau'ari
step
    #loop
    .goto 1452/1,-5209.28,6594.09,0
    .goto 1452/1,-5209.28,6594.09,40,0
    .goto 1452/1,-5287.38,6581.31,40,0
    .goto 1452/1,-5327.14,6720.47,40,0
    >>Kill |cRXP_ENEMY_Ice Thistle Matriarches|r and |cRXP_ENEMY_Ice Thistle Patriarches|r. Loot them for |cRXP_LOOT_Pristine Yeti Horn|r
    .complete 977,1 --Pristine Yeti Horn (2)
    .mob Ice Thistle Matriarch
    .mob Ice Thistle Patriarch
step
    .goto 1452/1,-5255.43,6719.99
    >>Kill |cRXP_ENEMY_High Chief Winterfall|r and loot |cRXP_LOOT_Crudely-written Log|r. Use it to start the quest
    .collect 12842,1,5123 --Crudely-written Log (1)
    .accept 5123 >>Accept The Final Piece
    .use 12842
    .mob High Chief Winterfall
    .isQuestTurnedIn 5087 --any of: Winterfall Runners
    .xp <52,1
step
    .goto 1452/1,-4639.15,6752.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Umi Rumplesnicker|r
    .turnin 977 >>Turn in Are We There, Yeti?
    .accept 5163 >>Accept Are We There, Yeti?
    .target Umi Rumplesnicker
step
    .goto 1452/1,-4686.01,6705.79
    >>Take Umi's Mechanical Yeti and scare her friends with it:
    .complete 5163,1 --Legacki
    .target Legacki
step
    .goto 1452/1,-4692.40,6705.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Felnok Steelspring|r
    .turnin 4809 >>Turn in Chillwind Horns
    .target Felnok Steelspring
    .isOnQuest 4809
step
    .goto 1452/1,-4692.40,6705.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Felnok Steelspring|r
    .accept 4810 >>Accept Return to Tinkee
    .target Felnok Steelspring
    .isQuestTurnedIn 4809 --any of: Chillwind Horns
    .xp <50,1
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .turnin 5123 >>Turn in The Final Piece
    .target Donova Snowden
    .isOnQuest 5123
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .accept 5128 >>Accept Words of the High Chief
    .target Donova Snowden
    .isQuestTurnedIn 5123 --any of: The Final Piece
    .xp <52,1
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .turnin 5086 >>Turn in Toxic Horrors
    .target Donova Snowden
    .isQuestComplete 5086
step
    .goto 1452/1,-4639.15,6752.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Umi Rumplesnicker|r
    .turnin 5163 >>Turn in Are We There, Yeti?
    .target Umi Rumplesnicker
    .isQuestComplete 5163
step
    +|cRXP_WARN_That is all of Winterspring for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Burning Steppes|r: Return to Tinkee
    >>|cRXP_FRIENDLY_Darnassus|r: The Crystal of Zin-Malor
    >>|cRXP_FRIENDLY_Eastern Plaguelands|r: Troubled Spirits of Kel'Theril
    >>|cRXP_FRIENDLY_Felwood|r: Falling to Corruption, Winterfall Ritual Totem, Words of the High Chief
    >>|cRXP_FRIENDLY_Tanaris, Un'Goro Crater and back here|r: Are We There, Yeti?
step
    +|cRXP_WARN_The rest of Winterspring is planned from level 58.|r Load its guide for level 58 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#version 1
#group Zone Routes (Alliance)
#subgroup 52 - 59 Winterspring
#subweight -52
#name 58-59 Winterspring

step
    .goto 1452/1,-4626.37,6748.87
    >>Click the |cRXP_PICK_Book|r
    .accept 84399 >>Accept Ka-Boom!
step
    .goto 1452/1,-4626.37,6748.87
    >>Open the |cRXP_PICK_Book|r. Loot it for |cRXP_LOOT_Ka-Boom!|r
    .complete 84399,1 --Ka-Boom! (1)
step
    .goto 1452/1,-4712.99,6720.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Mau'ari|r
    .accept 969 >>Accept Luck Be With You
    .target Witch Doctor Mau'ari
step
    .goto 1452/1,-4678.91,5661.15
    >>Click the |cRXP_PICK_Jaron's Wagon|r
    .accept 4864 >>Accept Enraged Wildkin
    .isQuestTurnedIn 4863 --any of: Enraged Wildkin
step
    .goto 1452/1,-4676.78,5658.78
    >>Pick up |cRXP_PICK_Jaron's Supplies|r from the ground
    .complete 4864,1 --Jaron's Supplies (1)
    .isOnQuest 4864
step
    .goto 1452/1,-4794.64,5717.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ranshalla|r
    .accept 4901 >>Accept Guardians of the Altar
    .target Ranshalla
    .isQuestTurnedIn 979 --any of: Find Ranshalla
    .xp <52,1
step
    .goto 1452/1,-4921.02,5516.78
    >>Discover the secret of the Altar of Elune
    .complete 4901,1 --Discover the secret of the Altar of Elune
    .isOnQuest 4901
step
    #loop
    .goto 1452/1,-4952.97,5604.35,0
    .goto 1452/1,-4952.97,5604.35,40,0
    .goto 1452/1,-4992.73,5760.55,40,0
    >>Kill |cRXP_ENEMY_Crazed Owlbeasts|r, |cRXP_ENEMY_Moontouched Owlbeasts|r and |cRXP_ENEMY_Berserk Owlbeasts|r. Loot them for |cRXP_LOOT_Blue-feathered Amulet|r
    .complete 4864,2 --Blue-feathered Amulet (1)
    .mob Crazed Owlbeast
    .mob Moontouched Owlbeast
    .mob Berserk Owlbeast
    .isOnQuest 4864
step
    #loop
    .goto 1452/1,-4606.49,5440.57,0
    .goto 1452/1,-4606.49,5440.57,40,0
    .goto 1452/1,-4508.51,5481.75,40,0
    .goto 1452/1,-4458.81,5344.01,40,0
    >>Kill |cRXP_ENEMY_Frostmaul Giants|r, |cRXP_ENEMY_Frostmaul Preservers|r and |cRXP_ENEMY_Kashoch the Reavers|r. Loot them for |cRXP_LOOT_Frostmaul Shards|r. It can also be picked up from |cRXP_PICK_Frostmaul Shards|r on the ground
    .complete 969,1 --Frostmaul Shards (4)
    .mob Frostmaul Giant
    .mob Frostmaul Preserver
    .mob Kashoch the Reaver
step
    .goto 1452/1,-4189.72,6109.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Haleh|r
    .accept 5161 >>Accept Wrath of the Blue Flight
    .target Haleh
    .isQuestTurnedIn 5160 --any of: The Matron Protectorate
    .xp <57,1
step
    .goto 1452/1,-4189.72,6109.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Haleh|r
    .turnin 5161 >>Turn in Wrath of the Blue Flight
    .target Haleh
    .isOnQuest 5161
step
    .goto 1452/1,-4189.72,6109.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Haleh|r
    .accept 5162 >>Accept Wrath of the Blue Flight
    .target Haleh
    .isQuestTurnedIn 5161 --any of: Wrath of the Blue Flight
    .xp <57,1
step
    .goto 1452/1,-4712.99,6720.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Mau'ari|r
    .turnin 969 >>Turn in Luck Be With You
    .accept 975 >>Accept Cache of Mau'ari
    .target Witch Doctor Mau'ari
step
    .goto 1452/1,-4712.99,6720.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Mau'ari|r
    >>|cRXP_WARN_The database has no objectives for Cache of Mau'ari. Skip this step if the quest is not finished|r
    .turnin 975 >>Turn in Cache of Mau'ari
    .target Witch Doctor Mau'ari
    .isOnQuest 975
step
    .goto 1452/1,-4018.61,7092.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jaron Stoneshaper|r
    .turnin 4864 >>Turn in Enraged Wildkin
    .target Jaron Stoneshaper
    .isOnQuest 4864
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .accept 5121 >>Accept High Chief Winterfall
    .target Donova Snowden
    .isQuestTurnedIn 5087 --any of: Winterfall Runners
    .xp <52,1
step
    .goto 1452/1,-5255.43,6719.99
    >>Kill |cRXP_ENEMY_High Chief Winterfall|r
    .complete 5121,1 --High Chief Winterfall slain (1)
    .mob High Chief Winterfall
    .isOnQuest 5121
step
    .goto 1452/1,-4686.01,6705.79
    >>Take Umi's Mechanical Yeti and scare her friends with it:
    .complete 5163,1 --Legacki
    .target Legacki
    .isOnQuest 5163
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .turnin 5121 >>Turn in High Chief Winterfall
    .target Donova Snowden
    .isOnQuest 5121
step
    .goto 1452/1,-4639.15,6752.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Umi Rumplesnicker|r
    .turnin 5163 >>Turn in Are We There, Yeti?
    .target Umi Rumplesnicker
    .isQuestComplete 5163
step
    +|cRXP_WARN_End of the Winterspring route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Stormwind City|r: Ka-Boom!
    >>|cRXP_FRIENDLY_Teldrassil|r: Guardians of the Altar
    >>|cRXP_FRIENDLY_Western Plaguelands|r: Wrath of the Blue Flight
]])
