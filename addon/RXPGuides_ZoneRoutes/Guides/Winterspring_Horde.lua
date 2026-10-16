-- 52-60 Winterspring: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit 79451da, 2026-10-13; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so the guide has 3 parts with a level check between them (from level 52, 55, 58).
-- Sections (the guide starts at the one for your level): around Gregor Greystone from 52; around Umi Rumplesnicker from 55; around Storm Shadowhoof from 58.
-- Edit zones/Winterspring.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#name 52-60 Winterspring

step
    .xp <55,1,RBSection1_1
    .xp 55 >>Finding the place in this guide for your level
step
    .xp <58,1,RBSection2_1
    .xp 58 >>Finding the place in this guide for your level
step
    .xp <61,1,RBSection3_1
step
    #label RBSection1_1
    #completewith next
    +|cRXP_WARN_Winterspring: around Gregor Greystone|r (planned from level 52)
step
    .goto 1452/1,-4656.19,6714.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Harlo Wigglesworth|r
    .accept 6605 >>Accept A Strange One
    .target Harlo Wigglesworth
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
    .goto 1452/1,-4692.40,6705.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Felnok Steelspring|r
    .turnin 4808 >>Turn in Felnok Steelspring
    .target Felnok Steelspring
    .isOnQuest 4808
step << Hunter
    .goto 1452/1,-4098.84,6767.80,0
    .goto 1452/1,-3983.11,6693.49,0
    .goto 1452/1,-3545.04,6763.07,0
    .goto 1452/1,-4098.84,6767.80,70,0
    .goto 1452/1,-3983.11,6693.49,70,0
    .goto 1452/1,-3545.04,6763.07,70,0
    >>|cRXP_WARN_Cast|r |T132164:0|t[Tame Beast] |cRXP_WARN_on a |cRXP_ENEMY_Shardtooth Bear|r or |cRXP_ENEMY_Winterspring Owl|r to tame it|r
    .train 2977 >>|cRXP_WARN_Attack mobs with it to learn|r |T132140:0|t[Claw (Rank 7)]
    .zoneskip Winterspring,1
step << Hunter
    .goto 1452/1,-4604.29,6738.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Azzleby|r
    .target Azzleby
    .train 2977,3
    .zoneskip Winterspring,1
step
    .goto 1452/1,-4610.04,6815.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yugrek|r
    .fp Everlook >>Get the Everlook Flight Path
    .fly Felwood >>Fly to Felwood
    .target Yugrek
    .zoneskip Felwood
step
    .goto 1452/1,-2285.50,6900.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Salfa|r
    .turnin 8465 >>Turn in Speak to Salfa
    .target Salfa
    .isOnQuest 8465
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .turnin 980 >>Turn in The New Springs
    .target Donova Snowden
    .isOnQuest 980
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
    .goto 1452/1,-4673.23,6695.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vizzie|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Vizzie
step << Shaman
    .goto 1452/1,-4673.23,6695.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vizzie|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Vizzie
    .subzoneskip 2255,1
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .turnin 3909 >>Turn in The Videre Elixir
    .target Donova Snowden
    .isQuestComplete 3909
step << !Shaman
    .goto 1452/1,-4673.23,6695.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vizzie|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Vizzie
    .subzoneskip 2255,1
step
    .goto 1452/1,-4673.23,6695.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vizzie|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Vizzie
    .subzoneskip 2255,1
step
    .goto 1452/1,-4672.52,6688.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gregor Greystone|r
    .accept 6029 >>Accept The Everlook Report
    .accept 6030 >>Accept Duke Nicholas Zverenhoff
    .target Gregor Greystone
step
    .goto 1452/1,-4667.55,6688.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jessica Redpath|r
    .accept 5601 >>Accept Sister Pamela
    .target Jessica Redpath
step
    .goto 1452/1,-4673.23,6695.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vizzie|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Vizzie
    .isQuestComplete 5055,4741,4842
step
    .hs >>Hearth to Everlook
    .subzoneskip 255
    .zoneskip Winterspring
step
    .goto 1452/1,-5131.18,7234.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Umbranse the Spiritspeaker|r
    .turnin 3512 >>Turn in In Eranikus' Own Words
    .target Umbranse the Spiritspeaker
    .isOnQuest 3512
step
    +|cRXP_WARN_That is all of Winterspring for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Eastern Plaguelands|r: Duke Nicholas Zverenhoff, Sister Pamela
    >>|cRXP_FRIENDLY_Felwood|r: A Strange One
    >>|cRXP_FRIENDLY_Tanaris|r: Meet at the Grave
    >>|cRXP_FRIENDLY_Tirisfal Glades|r: The Everlook Report
step
    .xp 55 >>|cRXP_WARN_The rest of Winterspring is planned from level 55.|r Come back to this guide then
step
    #label RBSection2_1
    #completewith next
    +|cRXP_WARN_Winterspring: around Umi Rumplesnicker|r (planned from level 55)
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
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .turnin 6603 >>Turn in Trouble in Winterspring!
    .accept 5082 >>Accept Threat of the Winterfall
    .target Donova Snowden
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
    #completewith Along3
    >>As you go: Kill |cRXP_ENEMY_Winterfall Totemics|r. |cRXP_WARN_Anything left is finished later|r
    .complete 5082,3 --Winterfall Totemic slain (8)
    .mob Winterfall Totemic
step
    #label Along3
    #loop
    .goto 1452/1,-2685.23,6747.92,0
    .goto 1452/1,-2685.23,6747.92,40,0
    .goto 1452/1,-2715.76,6783.42,40,0
    .goto 1452/1,-2714.34,6821.76,40,0
    .goto 1452/1,-2548.91,6875.25,40,0
    .goto 1452/1,-2513.41,6882.35,40,0
    .goto 1452/1,-2450.22,6848.27,40,0
    .goto 1452/1,-2509.15,6794.78,40,0
    .goto 1452/1,-2548.20,6815.13,40,0
    >>Kill |cRXP_ENEMY_Winterfall Pathfinders|r
    .complete 5082,1 --Winterfall Pathfinder slain (8)
    .mob Winterfall Pathfinder
step
    #loop
    .goto 1452/1,-5012.61,6853.95,0
    .goto 1452/1,-5012.61,6853.95,40,0
    .goto 1452/1,-5041.01,6833.12,40,0
    .goto 1452/1,-5082.90,6817.97,40,0
    .goto 1452/1,-5109.88,6833.59,40,0
    .goto 1452/1,-5153.90,6845.43,40,0
    .goto 1452/1,-5183.01,6872.41,40,0
    .goto 1452/1,-5144.67,6906.49,40,0
    .goto 1452/1,-5071.54,6900.81,40,0
    .goto 1452/1,-5019.00,6909.80,40,0
    >>Kill |cRXP_ENEMY_Winterfall Den Watchers|r
    .complete 5082,2 --Winterfall Den Watcher slain (8)
    .mob Winterfall Den Watcher
step
    #label Drop5083x1
    #loop
    .goto 1452/1,-2684.52,6809.45,0
    .goto 1452/1,-2684.52,6809.45,40,0
    .goto 1452/1,-2672.45,6790.52,40,0
    .goto 1452/1,-2617.78,6751.23,40,0
    >>Kill |cRXP_ENEMY_Winterfall Totemics|r
    .complete 5082,3 --Winterfall Totemic slain (8)
    .mob Winterfall Totemic
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .turnin 5082 >>Turn in Threat of the Winterfall
    .target Donova Snowden
step
    .goto 1452/1,-2285.50,6900.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Salfa|r
    .accept 8464 >>Accept Winterfall Activity
    .target Salfa
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .accept 4842 >>Accept Strange Sources
    .target Donova Snowden
    .isQuestTurnedIn 980 --any of: The New Springs
    .xp <51,1
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .accept 5086 >>Accept Toxic Horrors
    .target Donova Snowden
    .isQuestTurnedIn 5085 --any of: Mystery Goo
    .xp <52,1
step
    #completewith next
    .hs >>Hearth to Innkeeper Vizzie's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
step
    .goto 1452/1,-4639.15,6752.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Umi Rumplesnicker|r
    .accept 3783 >>Accept Are We There, Yeti?
    .target Umi Rumplesnicker
step
    .goto 1452/1,-4713.70,6716.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Storm Shadowhoof|r
    .accept 5054 >>Accept Ursius of the Shardtooth
    .target Storm Shadowhoof
step
    .goto 1452/1,-4641.99,6976.07
    >>Kill |cRXP_ENEMY_Ursius|r
    .complete 5054,1 --Ursius slain (1)
    .mob Ursius
step
    #loop
    .goto 1452/1,-5021.84,6586.99,0
    .goto 1452/1,-5021.84,6586.99,40,0
    .goto 1452/1,-5107.75,6553.85,40,0
    .goto 1452/1,-5183.72,6572.79,40,0
    .goto 1452/1,-5233.42,6642.84,40,0
    .goto 1452/1,-5357.67,6696.33,40,0
    .goto 1452/1,-5280.99,6632.90,40,0
    .goto 1452/1,-5280.28,6581.78,40,0
    .goto 1452/1,-5119.82,6447.83,40,0
    .goto 1452/1,-5079.35,6479.54,40,0
    >>Kill |cRXP_ENEMY_Rogue Ice Thistles|r and |cRXP_ENEMY_Ice Thistle Yetis|r. Loot them for |cRXP_LOOT_Thick Yeti Fur|r
    .complete 3783,1 --Thick Yeti Fur (10)
    .mob Rogue Ice Thistle
    .mob Ice Thistle Yeti
step
    .goto 1452/1,-4713.70,6716.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Storm Shadowhoof|r
    .turnin 5054 >>Turn in Ursius of the Shardtooth
    .target Storm Shadowhoof
step
    .goto 1452/1,-4639.15,6752.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Umi Rumplesnicker|r
    .turnin 3783 >>Turn in Are We There, Yeti?
    .target Umi Rumplesnicker
step
    .goto 1452/1,-4563.89,5018.83
    >>Discover Darkwhisper Gorge
    .complete 4842,1 --Discover Darkwhisper Gorge
    .isOnQuest 4842
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .turnin 4842 >>Turn in Strange Sources
    .target Donova Snowden
    .isOnQuest 4842
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .accept 5087 >>Accept Winterfall Runners
    .target Donova Snowden
    .isQuestTurnedIn 5086 --any of: Toxic Horrors
    .xp <52,1
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
    #label Drop5083x2
    .goto 1452/1,-2301.83,6899.39
    >>Kill |cRXP_ENEMY_Winterfall Runner|r and loot |cRXP_LOOT_Winterfall Crate|r
    .complete 5087,1 --Winterfall Crate (1)
    .mob Winterfall Runner
    .isOnQuest 5087
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .turnin 5087 >>Turn in Winterfall Runners
    .target Donova Snowden
    .isOnQuest 5087
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
    .accept 977 >>Accept Are We There, Yeti?
    .target Umi Rumplesnicker
step << Hunter
    .goto 1452/1,-4420.47,7283.73,70,0
    .goto 1452/1,-4548.27,7681.33
    >>|cRXP_WARN_Cast|r |T132164:0|t[Tame Beast] |cRXP_WARN_on a |cRXP_ENEMY_Winterspring Screecher|r to tame it|r
    .train 3666 >>|cRXP_WARN_Attack mobs with it to learn|r |T132140:0|t[Claw (Rank 8)]
    .zoneskip Winterspring,1
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
    #loop
    .goto 1452/1,-4948.71,6743.66,0
    .goto 1452/1,-4948.71,6743.66,40,0
    .goto 1452/1,-5048.11,6693.96,40,0
    .goto 1452/1,-5094.26,6641.89,40,0
    .goto 1452/1,-5134.73,6731.83,40,0
    .goto 1452/1,-5200.76,6742.24,40,0
    .goto 1452/1,-5183.01,6872.41,40,0
    .goto 1452/1,-5082.90,6817.97,40,0
    .goto 1452/1,-5079.35,6921.16,40,0
    .goto 1452/1,-5019.00,6909.80,40,0
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
    #loop
    .goto 1452/1,-4910.37,6612.07,0
    .goto 1452/1,-4910.37,6612.07,40,0
    .goto 1452/1,-4923.15,6621.54,40,0
    .goto 1452/1,-5050.24,6552.91,40,0
    .goto 1452/1,-5061.60,6591.72,40,0
    .goto 1452/1,-5167.39,6589.35,40,0
    .goto 1452/1,-5209.28,6594.09,40,0
    .goto 1452/1,-5202.89,6561.90,40,0
    .goto 1452/1,-5063.02,6406.17,40,0
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
    #loop
    .goto 1452/1,-4583.06,7427.15,0
    .goto 1452/1,-4583.06,7427.15,40,0
    .goto 1452/1,-4467.33,7325.86,40,0
    .goto 1452/1,-4380.71,7452.24,40,0
    .goto 1452/1,-4438.22,7444.67,40,0
    .goto 1452/1,-4478.69,7421.95,40,0
    .goto 1452/1,-4541.88,7441.35,40,0
    .goto 1452/1,-4577.38,7520.87,40,0
    .goto 1452/1,-4644.83,7534.60,40,0
    .goto 1452/1,-4602.23,7500.52,40,0
    >>Kill |cRXP_ENEMY_Fledgling Chillwinds|r, |cRXP_ENEMY_Chillwind Chimaeras|r and |cRXP_ENEMY_Chillwind Ravagers|r. Loot them for |cRXP_LOOT_Uncracked Chillwind Horn|r
    .complete 4809,1 --Uncracked Chillwind Horn (8)
    .mob Fledgling Chillwind
    .mob Chillwind Chimaera
    .mob Chillwind Ravager
    .isOnQuest 4809
step << Shaman
    .hs >>Hearth or Astrall Recall to Everlook
    .subzoneskip 255
step << Shaman
    .goto 1452/1,-4673.23,6695.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vizzie|r
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food and water if necessary|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_Sell your junk, then restock on food if necessary|r << Rogue/Warrior
    .target Innkeeper Vizzie
    .isQuestComplete 4809
step
    .goto 1452/1,-4639.15,6752.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Umi Rumplesnicker|r
    .turnin 977 >>Turn in Are We There, Yeti? while you are here
    .isQuestComplete 977
    .target Umi Rumplesnicker
step
    #completewith next
    .hs >>Hearth to Innkeeper Vizzie's inn. |cRXP_WARN_Walk instead if you are already nearby|r
    .cooldown item,6948,>0,1
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
    .goto 1452/1,-2285.50,6900.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Salfa|r
    .turnin 8464 >>Turn in Winterfall Activity
    .target Salfa
step
    +|cRXP_WARN_That is all of Winterspring for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Burning Steppes|r: Return to Tinkee
    >>|cRXP_FRIENDLY_Felwood|r: Falling to Corruption, Winterfall Ritual Totem, Words of the High Chief
    >>|cRXP_FRIENDLY_Tanaris, Un'Goro Crater and back here|r: Are We There, Yeti?
step
    .xp 58 >>|cRXP_WARN_The rest of Winterspring is planned from level 58.|r Come back to this guide then
step
    #label RBSection3_1
    #completewith next
    +|cRXP_WARN_Winterspring: around Storm Shadowhoof|r (planned from level 58)
step
    .goto 1452/1,-4656.19,6714.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Harlo Wigglesworth|r
    .accept 6606 >>Accept A Little Luck
    .target Harlo Wigglesworth
step
    .goto 1452/1,-4713.70,6716.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Storm Shadowhoof|r
    .accept 5055 >>Accept Brumeran of the Chillwind
    .target Storm Shadowhoof
    .isQuestTurnedIn 5054 --any of: Ursius of the Shardtooth
step
    .goto 1452/1,-4712.99,6720.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Mau'ari|r
    .turnin 6606 >>Turn in A Little Luck
    .accept 969 >>Accept Luck Be With You
    .target Witch Doctor Mau'ari
step
    .goto 1452/1,-4757.01,5792.73
    >>Kill |cRXP_ENEMY_Brumeran|r
    .complete 5055,1 --Brumeran slain (1)
    .mob Brumeran
    .isOnQuest 5055
step
    #loop
    .goto 1452/1,-4619.98,5452.41,0
    .goto 1452/1,-4619.98,5452.41,40,0
    .goto 1452/1,-4551.11,5435.37,40,0
    .goto 1452/1,-4481.53,5523.88,40,0
    .goto 1452/1,-4461.65,5391.35,40,0
    .goto 1452/1,-4438.93,5281.53,40,0
    .goto 1452/1,-4543.30,5240.83,40,0
    .goto 1452/1,-4515.61,5362.00,40,0
    .goto 1452/1,-4564.60,5329.34,40,0
    .goto 1452/1,-4609.33,5366.26,40,0
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
    .goto 1452/1,-4713.70,6716.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Storm Shadowhoof|r
    .turnin 5055 >>Turn in Brumeran of the Chillwind
    .target Storm Shadowhoof
    .isOnQuest 5055
step
    .goto 1452/1,-2536.84,6395.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
    .accept 5121 >>Accept High Chief Winterfall
    .target Donova Snowden
    .isQuestTurnedIn 5087 --any of: Winterfall Runners
    .xp <52,1
step
    .goto 1452/1,-4713.70,6716.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Storm Shadowhoof|r
    .accept 5056 >>Accept Shy-Rotam
    .target Storm Shadowhoof
    .isQuestTurnedIn 5055 --any of: Brumeran of the Chillwind
step
    #loop
    .goto 1452/1,-4086.06,7738.61,0
    .goto 1452/1,-4086.06,7738.61,40,0
    .goto 1452/1,-3981.69,7783.10,40,0
    .goto 1452/1,-3951.87,7874.93,40,0
    .goto 1452/1,-3856.73,7793.99,40,0
    .goto 1452/1,-3747.39,7871.14,40,0
    .goto 1452/1,-3814.13,7949.24,40,0
    .goto 1452/1,-3983.82,7996.57,40,0
    .goto 1452/1,-4084.64,8013.14,40,0
    .goto 1452/1,-4078.96,7860.73,40,0
    >>Kill |cRXP_ENEMY_Frostsaber Pride Watchers|r, |cRXP_ENEMY_Frostsaber Huntress|r, |cRXP_ENEMY_Frostsaber Cubs|r and |cRXP_ENEMY_Frostsaber Stalkers|r. Loot them for |cRXP_LOOT_Sacred Frostsaber Meat|r
    .collect 12733,1,5056,1 --Sacred Frostsaber Meat (1)
    .mob Frostsaber Pride Watcher
    .mob Frostsaber Huntress
    .mob Frostsaber Cub
    .mob Frostsaber Stalker
    .isOnQuest 5056
step
    .goto 1452/1,-3853.18,8069.47
    >>Kill |cRXP_ENEMY_Shy-Rotam|r
    .complete 5056,1 --Shy-Rotam slain (1)
    .mob Shy-Rotam
    .isOnQuest 5056
step
    .goto 1452/1,-5255.43,6719.99
    >>Kill |cRXP_ENEMY_High Chief Winterfall|r
    .complete 5121,1 --High Chief Winterfall slain (1)
    .mob High Chief Winterfall
    .isOnQuest 5121
step
    .goto 1452/1,-4713.70,6716.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Storm Shadowhoof|r
    .turnin 5056 >>Turn in Shy-Rotam
    .target Storm Shadowhoof
    .isOnQuest 5056
step
    .goto 1452/1,-4713.70,6716.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Storm Shadowhoof|r
    .accept 5057 >>Accept Past Endeavors
    .target Storm Shadowhoof
    .isQuestTurnedIn 5056 --any of: Shy-Rotam
step
    .goto 1452/1,-4713.70,6716.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Storm Shadowhoof|r
    .turnin 5057 >>Turn in Past Endeavors
    .target Storm Shadowhoof
    .isOnQuest 5057
step
    .goto 1452/1,-4712.99,6720.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Witch Doctor Mau'ari|r
    >>|cRXP_WARN_The database has no objectives for Cache of Mau'ari. Skip this step if the quest is not finished|r
    .turnin 975 >>Turn in Cache of Mau'ari
    .target Witch Doctor Mau'ari
    .isOnQuest 975
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
    >>|cRXP_FRIENDLY_Western Plaguelands|r: Wrath of the Blue Flight
]])
