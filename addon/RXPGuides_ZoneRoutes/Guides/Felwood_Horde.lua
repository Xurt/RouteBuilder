-- 48-60 Felwood: Zone Routes (Horde).
-- Made by RouteBuilder from QuestieDB's Forever data (commit e9a67d1, 2026-10-17; QuestieDB is GPL-3.0).
-- One route for the whole faction. Steps marked << Class or << Race only show for those characters.
-- Steps that depend on quests from other zones hide themselves unless you have those quests.
-- The zone covers more levels than one visit gives, so it is planned in 4 parts (from level 48, 51, 54, 57).
-- Split into 4 guides, listed under "48 - 58 Felwood" in RestedXP. Each leads on to the next; start at any of them: a step that needs a quest from an earlier one hides itself unless you did that quest.
-- Edit zones/Felwood.json and re-run rather than editing this file, or your changes are lost on the next build.

if UnitFactionGroup("player") == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 48 - 58 Felwood
#subweight -48
#name 48-49 Felwood

step
    .goto 1448/1,-1286.81,3874.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grazle|r
    .accept 8460 >>Accept Timbermaw Ally
    .target Grazle
step
    .goto 1448/1,-336.33,5067.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brakkar|r
    .fp Felwood >>Get the Felwood Flight Path
    .target Brakkar
    .subzoneskip 1997,1
step
    #completewith Along1
    >>As you go: Kill |cRXP_ENEMY_Deadwood Gardeners|r. |cRXP_WARN_Anything left is finished later|r
    .complete 8460,3 --Deadwood Gardener slain (6)
    .mob Deadwood Gardener
step
    #label Along1
    #loop
    .goto 1448/1,-1217.81,3753.10,0
    .goto 1448/1,-1217.81,3753.10,40,0
    .goto 1448/1,-1162.03,3724.73,40,0
    .goto 1448/1,-1113.73,3710.55,40,0
    .goto 1448/1,-1167.21,3664.55,40,0
    .goto 1448/1,-1140.76,3629.67,40,0
    .goto 1448/1,-1159.73,3583.28,40,0
    .goto 1448/1,-1128.11,3570.25,40,0
    .goto 1448/1,-1152.26,3531.53,40,0
    .goto 1448/1,-1214.36,3621.23,40,0
    >>Kill |cRXP_ENEMY_Deadwood Warriors|r
    .complete 8460,1 --Deadwood Warrior slain (6)
    .mob Deadwood Warrior
step
    #loop
    .goto 1448/1,-1133.28,3627.75,0
    .goto 1448/1,-1133.28,3627.75,40,0
    .goto 1448/1,-1082.68,3582.90,40,0
    .goto 1448/1,-1011.38,3688.32,40,0
    .goto 1448/1,-1047.03,3748.12,40,0
    .goto 1448/1,-1099.93,3730.87,40,0
    .goto 1448/1,-1171.81,3718.60,40,0
    .goto 1448/1,-1142.48,3689.47,40,0
    .goto 1448/1,-1189.06,3628.13,40,0
    .goto 1448/1,-1175.26,3584.82,40,0
    >>Kill |cRXP_ENEMY_Deadwood Pathfinders|r
    >>Kill |cRXP_ENEMY_Deadwood Gardeners|r
    .complete 8460,2 --Deadwood Pathfinder slain (6)
    .complete 8460,3 --Deadwood Gardener slain (6)
    .mob Deadwood Pathfinder
    .mob Deadwood Gardener
step << !Warrior !Hunter !Rogue !Druid !Shaman
    .goto 1448/1,-1129.83,3518.50,50,0
    .goto 1448/1,-1049.33,3614.33,50,0
    .goto 1448/1,-1037.83,3668.00,50,0
    .goto 1448/1,-1037.83,3737.00,50,0
    .goto 1448/1,-1152.83,3706.33,50,0
    .goto 1448/1,-1187.33,3622.00,50,0
    .xp 53+95000 >> Grind to level 53 130000+/167100
step
    .goto 1448/1,-1286.81,3874.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grazle|r
    .turnin 8460 >>Turn in Timbermaw Ally
    .accept 8462 >>Accept Speak to Nafien
    .target Grazle
step << Warlock
    #loop
    .goto 1448/1,-550.23,4470.70,0
    .goto 1448/1,-550.23,4470.70,40,0
    .goto 1448/1,-523.78,4504.43,40,0
    .goto 1448/1,-515.16,4558.10,40,0
    .goto 1448/1,-519.18,4583.02,40,0
    .goto 1448/1,-507.11,4599.50,40,0
    .goto 1448/1,-493.31,4553.88,40,0
    .goto 1448/1,-488.13,4521.68,40,0
    .goto 1448/1,-482.96,4484.50,40,0
    .goto 1448/1,-494.46,4454.98,40,0
    >>Kill |cRXP_ENEMY_Jadefire Rogues|r, |cRXP_ENEMY_Jadefire Tricksters|r, |cRXP_ENEMY_Jadefire Betrayers|r and |cRXP_ENEMY_Jadefire Felsworns|r. Loot them for |cRXP_LOOT_Felcloth|r
    .complete 8419,1 --Felcloth (1)
    .mob Jadefire Rogue
    .mob Jadefire Trickster
    .mob Jadefire Betrayer
    .mob Jadefire Felsworn
    .isOnQuest 8419
step << Warlock
    .goto 1448/1,-736.53,5407.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Impsy|r
    .turnin 8419 >>Turn in An Imp's Request
    .target Impsy
    .isOnQuest 8419
step
    .goto 1448/1,-2082.61,6821.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nafien|r
    .turnin 8462 >>Turn in Speak to Nafien
    .target Nafien
step
    .hs >>Hearth to Orgrimmar
    .zoneskip Orgrimmar
step << Mage
    .zoneskip Orgrimmar
    .train 3567,3
step << Priest
    .goto 1448/1,-1302.91,3985.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Greta Mosshoof|r
    .turnin 8257 >>Turn in Blood of Morphaz
    .target Greta Mosshoof
    .isQuestComplete 8257
step
    .goto 1448/1,-1302.91,3985.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Greta Mosshoof|r
    .turnin 5159 >>Turn in Cleansed Water Returns to Felwood
    .target Greta Mosshoof
    .isOnQuest 5159
step
    .goto 1448/1,-325.41,5126.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Winna Hazzard|r
    .turnin 6605 >>Turn in A Strange One
    .target Winna Hazzard
    .isOnQuest 6605
step << Warlock
    .goto 1448/1,-424.31,5430.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lord Banehollow|r
    .turnin 7623 >>Turn in Lord Banehollow
    .target Lord Banehollow
    .isOnQuest 7623
step
    .goto 1448/1,-1819.83,6909.47
    >>Click the |cRXP_PICK_Deadwood Cauldron|r
    .turnin 5084 >>Turn in Falling to Corruption
    .isOnQuest 5084
step
    .goto 1448/1,-1310.96,4008.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eridan Bluewind|r
    .turnin 3942 >>Turn in Linken's Memory
    .target Eridan Bluewind
    .isOnQuest 3942
step
    .hs >>Hearth to Everlook
    .subzoneskip 255
    .zoneskip Winterspring
step
    .goto 1448/1,-1298.88,3999.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kelek Skykeeper|r
    .turnin 5128 >>Turn in Words of the High Chief
    .target Kelek Skykeeper
    .isOnQuest 5128
step
    +|cRXP_WARN_The rest of Felwood is planned from level 51.|r Load its guide for level 51 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 48 - 58 Felwood
#subweight -48
#name 51-52 Felwood: around Greta Mosshoof

step << Warlock
    .goto 1448/1,-737.68,5414.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Niby the Almighty|r
    .accept 7601 >>Accept What Niby Commands
    .target Niby the Almighty
step << Warlock
    .goto 1448/1,-736.53,5407.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Impsy|r
    .turnin 7601 >>Turn in What Niby Commands
    .accept 8420 >>Accept Hot and Itchy
    .target Impsy
step
    .goto 1448/1,-1302.91,3985.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Greta Mosshoof|r
    .accept 5155 >>Accept Forces of Jaedenar
    .target Greta Mosshoof
step
    .goto 1448/1,-1284.51,4004.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Taronn Redfeather|r
    .accept 5156 >>Accept Verifying the Corruption
    .target Taronn Redfeather
step
    .goto 1448/1,-1046.46,3946.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maybess Riverbreeze|r
    .accept 4102 >>Accept Cleansing Felwood
    .target Maybess Riverbreeze
step << Warlock
    #loop
    .goto 1448/1,-550.23,4470.70,0
    .goto 1448/1,-550.23,4470.70,40,0
    .goto 1448/1,-523.78,4504.43,40,0
    .goto 1448/1,-515.16,4558.10,40,0
    .goto 1448/1,-519.18,4583.02,40,0
    .goto 1448/1,-507.11,4599.50,40,0
    .goto 1448/1,-493.31,4553.88,40,0
    .goto 1448/1,-488.13,4521.68,40,0
    .goto 1448/1,-482.96,4484.50,40,0
    .goto 1448/1,-494.46,4454.98,40,0
    >>Kill |cRXP_ENEMY_Jadefire Rogues|r, |cRXP_ENEMY_Jadefire Tricksters|r, |cRXP_ENEMY_Jadefire Betrayers|r and |cRXP_ENEMY_Jadefire Felsworns|r. Loot them for |cRXP_LOOT_Felcloth|r
    .complete 8420,1 --Felcloth (1)
    .mob Jadefire Rogue
    .mob Jadefire Trickster
    .mob Jadefire Betrayer
    .mob Jadefire Felsworn
step
    #loop
    .goto 1448/1,-597.96,4756.28,0
    .goto 1448/1,-597.96,4756.28,40,0
    .goto 1448/1,-481.23,4784.27,40,0
    .goto 1448/1,-433.51,4752.83,40,0
    .goto 1448/1,-340.36,4817.23,40,0
    .goto 1448/1,-401.88,4875.88,40,0
    .goto 1448/1,-415.68,4812.25,40,0
    .goto 1448/1,-556.56,4818.00,40,0
    .goto 1448/1,-569.78,4921.12,40,0
    .goto 1448/1,-615.21,4861.32,40,0
    >>Kill |cRXP_ENEMY_Jaedenar Hounds|r
    >>Kill |cRXP_ENEMY_Jaedenar Guardians|r
    >>Kill |cRXP_ENEMY_Jaedenar Adepts|r
    >>Kill |cRXP_ENEMY_Jaedenar Cultists|r
    .complete 5155,1 --Jaedenar Hound slain (4)
    .complete 5155,2 --Jaedenar Guardian slain (8)
    .complete 5155,3 --Jaedenar Adept slain (6)
    .complete 5155,4 --Jaedenar Cultist slain (6)
    .mob Jaedenar Hound
    .mob Jaedenar Guardian
    .mob Jaedenar Adept
    .mob Jaedenar Cultist
step
    .goto 1448/1,-359.33,5112.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dreka'Sur|r
    .accept 6162 >>Accept A Husband's Last Battle
    .target Dreka'Sur
step
    .goto 1448/1,-325.41,5126.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Winna Hazzard|r
    .accept 4505 >>Accept Well of Corruption
    .target Winna Hazzard
step
    .goto 1448/1,-216.73,4581.87
    >>Open the |cRXP_PICK_Corrupted Moonwell Spell Focus (DND)|r. Loot it for |cRXP_LOOT_Filled Flasket|r
    .complete 4505,1 --Filled Flasket (1)
step
    .goto 1448/1,-1131.56,3519.27
    >>Kill |cRXP_ENEMY_Overlord Ror|r and loot |cRXP_LOOT_Overlord Ror's Claw|r
    .complete 6162,1 --Overlord Ror's Claw (1)
    .mob Overlord Ror
step
    .goto 1448/1,-1302.91,3985.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Greta Mosshoof|r
    .turnin 5155 >>Turn in Forces of Jaedenar
    .accept 5157 >>Accept Collection of the Corrupt Water
    .target Greta Mosshoof
step
    .goto 1448/1,-380.61,4841.38
    >>Open the |cRXP_PICK_Corrupt Jaedenar Moonwell|r. Loot it for |cRXP_LOOT_Corrupt Moonwell Water|r
    .complete 5157,1 --Corrupt Moonwell Water (1)
step << Warlock
    .goto 1448/1,-736.53,5407.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Impsy|r
    .turnin 8420 >>Turn in Hot and Itchy
    .accept 8421 >>Accept The Wrong Stuff
    .target Impsy
step << Warlock
    #loop
    .goto 1448/1,-684.21,5057.97,0
    .goto 1448/1,-684.21,5057.97,40,0
    .goto 1448/1,-631.88,5061.80,40,0
    .goto 1448/1,-608.88,5040.72,40,0
    .goto 1448/1,-642.23,5029.60,40,0
    .goto 1448/1,-657.76,4985.13,40,0
    .goto 1448/1,-675.58,4874.35,40,0
    .goto 1448/1,-699.73,4843.30,40,0
    .goto 1448/1,-709.51,4870.52,40,0
    .goto 1448/1,-687.08,4997.78,40,0
    >>Kill |cRXP_ENEMY_Tainted Oozes|r. Loot them for |cRXP_LOOT_Bloodvenom Essence|r
    .complete 8421,2 --Bloodvenom Essence (4)
    .mob Tainted Ooze
step
    #loop
    .goto 1448/1,-856.71,5585.43,0
    .goto 1448/1,-856.71,5585.43,40,0
    .goto 1448/1,-883.16,5568.95,40,0
    .goto 1448/1,-914.21,5585.05,40,0
    .goto 1448/1,-925.13,5562.43,40,0
    .goto 1448/1,-952.16,5562.82,40,0
    .goto 1448/1,-986.08,5653.67,40,0
    .goto 1448/1,-914.78,5653.67,40,0
    .goto 1448/1,-850.96,5647.92,40,0
    >>Kill |cRXP_ENEMY_Entropic Beasts|r
    >>Kill |cRXP_ENEMY_Entropic Horrors|r
    .complete 5156,1 --Entropic Beast slain (2)
    .complete 5156,2 --Entropic Horror slain (2)
    .mob Entropic Beast
    .mob Entropic Horror
step
    .goto 1448/1,-717.56,5524.87
    >>Explore the craters in Shatter Scar Vale
    .complete 5156,3 --Explore the craters in Shatter Scar Vale
step << Warlock
    #loop
    .goto 1448/1,-1290.83,6177.68,0
    .goto 1448/1,-1290.83,6177.68,40,0
    .goto 1448/1,-1334.53,6156.98,40,0
    .goto 1448/1,-1378.81,6191.48,40,0
    .goto 1448/1,-1428.26,6247.83,40,0
    .goto 1448/1,-1381.68,6319.52,40,0
    .goto 1448/1,-1319.58,6302.65,40,0
    .goto 1448/1,-1291.41,6393.12,40,0
    .goto 1448/1,-1190.78,6426.08,40,0
    .goto 1448/1,-1158.58,6351.33,40,0
    >>Kill |cRXP_ENEMY_Irontree Wanderers|r, |cRXP_ENEMY_Irontree Stompers|r and |cRXP_ENEMY_Withered Protectors|r. Loot them for |cRXP_LOOT_Rotting Wood|r
    .complete 8421,1 --Rotting Wood (10)
    .mob Irontree Wanderer
    .mob Irontree Stomper
    .mob Withered Protector
step << Warlock
    .goto 1448/1,-736.53,5407.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Impsy|r
    .turnin 8421 >>Turn in The Wrong Stuff
    .accept 8422 >>Accept Trolls of a Feather
    .target Impsy
step << Warlock
    .goto 1448/1,-736.53,5407.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Impsy|r
    .turnin 8422 >>Turn in Trolls of a Feather
    .target Impsy
    .isQuestComplete 8422
step
    #loop
    .goto 1448/1,-1658.26,6299.97,0
    .goto 1448/1,-1658.26,6299.97,40,0
    .goto 1448/1,-1645.61,6328.33,40,0
    .goto 1448/1,-1651.93,6379.32,40,0
    .goto 1448/1,-1688.16,6403.08,40,0
    .goto 1448/1,-1714.61,6427.62,40,0
    .goto 1448/1,-1779.58,6377.40,40,0
    .goto 1448/1,-1785.33,6311.47,40,0
    .goto 1448/1,-1696.78,6353.25,40,0
    .goto 1448/1,-1692.76,6273.13,40,0
    >>Kill |cRXP_ENEMY_Warpwood Moss Flayers|r, |cRXP_ENEMY_Warpwood Shredders|r and |cRXP_ENEMY_Dessecus|r. Loot them for |cRXP_LOOT_Blood Amber|r
    .complete 4102,1 --Blood Amber (15)
    .mob Warpwood Moss Flayer
    .mob Warpwood Shredder
    .mob Dessecus
step
    .goto 1448/1,-325.41,5126.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Winna Hazzard|r
    .turnin 4505 >>Turn in Well of Corruption
    .target Winna Hazzard
step
    .goto 1448/1,-359.33,5112.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dreka'Sur|r
    .turnin 6162 >>Turn in A Husband's Last Battle
    .target Dreka'Sur
step
    .goto 1448/1,-1046.46,3946.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maybess Riverbreeze|r
    .turnin 4102 >>Turn in Cleansing Felwood
    .target Maybess Riverbreeze
step
    .goto 1448/1,-1302.91,3985.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Greta Mosshoof|r
    .turnin 5157 >>Turn in Collection of the Corrupt Water
    .accept 5158 >>Accept Seeking Spiritual Aid
    .target Greta Mosshoof
step
    .goto 1448/1,-1284.51,4004.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Taronn Redfeather|r
    .turnin 5156 >>Turn in Verifying the Corruption
    .target Taronn Redfeather
step
    .goto 1448/1,-325.41,5126.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Winna Hazzard|r
    .accept 4506 >>Accept Corrupted Sabers
    .target Winna Hazzard
step
    .goto 1448/1,-1046.46,3946.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maybess Riverbreeze|r
    .accept 5887 >>Accept Salve via Hunting
    .target Maybess Riverbreeze
step
    #completewith Drop5202x1
    >>|cRXP_LOOT_Blood Red Key|r can drop from |cRXP_ENEMY_Jaedenar Enforcer|r, |cRXP_ENEMY_Jaedenar Darkweaver|r, |cRXP_ENEMY_Jaedenar Warlock|r. Use it to start the quest if you get one
    .collect 13140,1,5202 --Blood Red Key (1)
    .accept 5202 >>Accept A Strange Red Key
    .use 13140
step
    #completewith Drop5202x1
    >>|cRXP_LOOT_Deadwood Ritual Totem|r can drop from |cRXP_ENEMY_Deadwood Den Watcher|r, |cRXP_ENEMY_Deadwood Avenger|r, |cRXP_ENEMY_Deadwood Shaman|r. Use it to start the quest if you get one
    .collect 20741,1,8470 --Deadwood Ritual Totem (1)
    .accept 8470 >>Accept Deadwood Ritual Totem
    .use 20741
step
    #label Drop5202x1
    #loop
    .goto 1448/1,-977.46,3988.47,0
    .goto 1448/1,-977.46,3988.47,40,0
    .goto 1448/1,-919.96,4046.35,40,0
    .goto 1448/1,-849.81,4050.18,40,0
    .goto 1448/1,-811.28,3941.70,40,0
    .goto 1448/1,-750.91,3848.93,40,0
    .goto 1448/1,-845.78,3724.73,40,0
    .goto 1448/1,-902.71,3838.20,40,0
    .goto 1448/1,-1019.43,3817.12,40,0
    .goto 1448/1,-915.36,3917.55,40,0
    >>Kill |cRXP_ENEMY_Cursed Oozes|r, |cRXP_ENEMY_Tainted Oozes|r, |cRXP_ENEMY_Vile Oozes|r and |cRXP_ENEMY_Ironbeak Owls|r. Loot them for |cRXP_LOOT_Corrupted Soul Shard|r
    .complete 5887,1 --Corrupted Soul Shard (1)
    .mob Cursed Ooze
    .mob Tainted Ooze
    .mob Vile Ooze
    .mob Ironbeak Owl
step
    .goto 1448/1,-1046.46,3946.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maybess Riverbreeze|r
    .turnin 5887 >>Turn in Salve via Hunting
    .target Maybess Riverbreeze
step
    .goto 1448/1,-440.41,5006.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captured Arko'narin|r
    .turnin 5202 >>Turn in A Strange Red Key
    .target Captured Arko'narin
    .isOnQuest 5202
step
    .goto 1448/1,-328.28,5127.73
    >>Return the corrupted cat to Winna Hazzard
    .complete 4506,1 --Return the corrupted cat to Winna Hazzard
step
    .goto 1448/1,-325.41,5126.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Winna Hazzard|r
    .turnin 4506 >>Turn in Corrupted Sabers
    .target Winna Hazzard
step
    .goto 1448/1,-1821.56,6912.92
    >>Kill |cRXP_ENEMY_Winterfall Runner|r and loot |cRXP_LOOT_Winterfall Ritual Totem|r. Use it to start the quest
    .collect 20742,1,8471 --Winterfall Ritual Totem (1)
    .accept 8471 >>Accept Winterfall Ritual Totem
    .use 20742
    .mob Winterfall Runner
step
    .goto 1448/1,-2124.58,6998.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kernda|r
    .turnin 8471 >>Turn in Winterfall Ritual Totem
    .target Kernda
step
    .goto 1448/1,-1310.96,4008.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eridan Bluewind|r
    .accept 4084 >>Accept Silver Heart
    .target Eridan Bluewind
    .isQuestTurnedIn 3942 --any of: Linken's Memory
    .xp <47,1
step
    #loop
    .goto 1448/1,-1334.53,6156.98,0
    .goto 1448/1,-1334.53,6156.98,40,0
    .goto 1448/1,-1290.83,6177.68,40,0
    .goto 1448/1,-1319.58,6302.65,40,0
    .goto 1448/1,-1381.68,6319.52,40,0
    .goto 1448/1,-1419.06,6285.78,40,0
    .goto 1448/1,-1428.26,6247.83,40,0
    .goto 1448/1,-1411.01,6228.67,40,0
    .goto 1448/1,-1378.81,6191.48,40,0
    .goto 1448/1,-1335.11,6206.82,40,0
    >>Kill |cRXP_ENEMY_Irontree Wanderers|r and |cRXP_ENEMY_Irontree Stompers|r. Loot them for |cRXP_LOOT_Irontree Heart|r
    .complete 4084,2 --Irontree Heart (1)
    .mob Irontree Wanderer
    .mob Irontree Stomper
    .isOnQuest 4084
step
    #loop
    .goto 1448/1,-1346.03,5989.47,0
    .goto 1448/1,-1346.03,5989.47,40,0
    .goto 1448/1,-1365.01,5960.72,40,0
    .goto 1448/1,-1342.58,5912.80,40,0
    .goto 1448/1,-1201.71,5774.42,40,0
    .goto 1448/1,-1181.01,5755.25,40,0
    .goto 1448/1,-1210.33,5844.57,40,0
    .goto 1448/1,-1191.93,5885.20,40,0
    .goto 1448/1,-1250.01,5882.90,40,0
    .goto 1448/1,-1308.66,5923.92,40,0
    >>Kill |cRXP_ENEMY_Angerclaw Bears|r, |cRXP_ENEMY_Angerclaw Grizzlies|r, |cRXP_ENEMY_Angerclaw Maulers|r and |cRXP_ENEMY_Felpaw Wolfs|r. Loot them for |cRXP_LOOT_Silvery Claws|r
    .complete 4084,1 --Silvery Claws (11)
    .mob Angerclaw Bear
    .mob Angerclaw Grizzly
    .mob Angerclaw Mauler
    .mob Felpaw Wolf
    .isOnQuest 4084
step
    .goto 1448/1,-2124.58,6998.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kernda|r
    .turnin 8470 >>Turn in Deadwood Ritual Totem
    .target Kernda
    .isOnQuest 8470
step
    .goto 1448/1,-1310.96,4008.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eridan Bluewind|r
    .turnin 4084 >>Turn in Silver Heart
    .target Eridan Bluewind
    .isOnQuest 4084
step
    .goto 1448/1,-1310.96,4008.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eridan Bluewind|r
    .accept 4005 >>Accept Aquementas
    .target Eridan Bluewind
    .isQuestTurnedIn 4084 --any of: Silver Heart
    .xp <47,1
step
    #loop
    .goto 1448/1,-1181.01,5755.25,0
    .goto 1448/1,-1181.01,5755.25,40,0
    .goto 1448/1,-1201.71,5774.42,40,0
    .goto 1448/1,-1342.58,5912.80,40,0
    .goto 1448/1,-1365.01,5960.72,40,0
    .goto 1448/1,-1346.03,5989.47,40,0
    .goto 1448/1,-1308.66,5923.92,40,0
    .goto 1448/1,-1250.01,5882.90,40,0
    .goto 1448/1,-1191.93,5885.20,40,0
    .goto 1448/1,-1210.33,5844.57,40,0
    >>Kill |cRXP_ENEMY_Angerclaw Bears|r, |cRXP_ENEMY_Angerclaw Grizzlies|r, |cRXP_ENEMY_Angerclaw Maulers|r and |cRXP_ENEMY_Felpaw Wolfs|r. Loot them for |cRXP_LOOT_Silvery Claws|r
    .collect 11172,1,4005,1 --Silvery Claws (1)
    .mob Angerclaw Bear
    .mob Angerclaw Grizzly
    .mob Angerclaw Mauler
    .mob Felpaw Wolf
    .isOnQuest 4005
step
    #loop
    .goto 1448/1,-1147.66,5989.47,0
    .goto 1448/1,-1147.66,5989.47,40,0
    .goto 1448/1,-1143.06,6015.53,40,0
    .goto 1448/1,-1109.13,6119.42,40,0
    .goto 1448/1,-1117.76,6060.77,40,0
    >>Kill |cRXP_ENEMY_Irontree Wanderers|r and |cRXP_ENEMY_Irontree Stompers|r. Loot them for |cRXP_LOOT_Irontree Heart|r
    .collect 11173,1,4005,1 --Irontree Heart (1)
    .mob Irontree Wanderer
    .mob Irontree Stomper
    .isOnQuest 4005
step
    +|cRXP_WARN_That is all of Felwood for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_The Barrens|r: Seeking Spiritual Aid
    >>|cRXP_FRIENDLY_Un'Goro Crater|r: Aquementas
    >>|cRXP_FRIENDLY_Elsewhere and back here|r: Trolls of a Feather << Warlock
step
    +|cRXP_WARN_The rest of Felwood is planned from level 54.|r Load its guide for level 54 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 48 - 58 Felwood
#subweight -48
#name 54-55 Felwood

step
    .goto 1448/1,-1821.56,6912.92
    >>Kill |cRXP_ENEMY_Winterfall Runner|r and loot |cRXP_LOOT_Empty Firewater Flask|r. Use it to start the quest
    .collect 12771,1,5083 --Empty Firewater Flask (1)
    .accept 5083 >>Accept Winterfall Firewater
    .use 12771
    .mob Winterfall Runner
step << Warlock
    .goto 1448/1,-736.53,5407.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Impsy|r
    .accept 7602 >>Accept Flawless Fel Essence
    .target Impsy
    .isQuestTurnedIn 7601 --any of: What Niby Commands
step << Warlock
    .goto 1448/1,-736.53,5407.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Impsy|r
    .turnin 7602 >>Turn in Flawless Fel Essence
    .target Impsy
    .isQuestComplete 7602
step << Warlock
    .goto 1448/1,-736.53,5407.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Impsy|r
    .accept 7603 >>Accept Kroshius' Infernal Core
    .target Impsy
    .isQuestTurnedIn 7602 --any of: Flawless Fel Essence
    .xp <50,1
step
    .goto 1448/1,-355.31,5109.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trull Failbane|r
    .accept 4521 >>Accept Wild Guardians
    .target Trull Failbane
step << Warlock
    .goto 1448/1,-736.53,5407.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Impsy|r
    .turnin 8422 >>Turn in Trolls of a Feather
    .target Impsy
    .isQuestComplete 8422
step
    .goto 1448/1,-1302.91,3985.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Greta Mosshoof|r
    .accept 5165 >>Accept Dousing the Flames of Protection
    .target Greta Mosshoof
    .isQuestTurnedIn 5159 --any of: Cleansed Water Returns to Felwood
    .xp <48,1
step
    .goto 1448/1,-440.41,5006.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Captured Arko'narin|r
    .accept 5203 >>Accept Rescue From Jaedenar
    .target Captured Arko'narin
    .isQuestTurnedIn 5202 --any of: A Strange Red Key
    .xp <49,1
step
    .goto 1448/1,-396.71,4869.37
    >>Protect Arko'narin out of Shadow Hold
    .complete 5203,1 --Protect Arko'narin out of Shadow Hold
    .isOnQuest 5203
step
    .goto 1448/1,-443.86,4975.17
    >>Click the |cRXP_PICK_Brazier of Pain|r
    .complete 5165,1 --Extinguish the Brazier of Pain
    .isOnQuest 5165
step
    .goto 1448/1,-455.93,5017.72
    >>Click the |cRXP_PICK_Brazier of Hatred|r
    .complete 5165,4 --Extinguish the Brazier of Hatred
    .isOnQuest 5165
step
    .goto 1448/1,-470.31,5091.32
    >>Click the |cRXP_PICK_Brazier of Suffering|r
    .complete 5165,3 --Extinguish the Brazier of Suffering
    .isOnQuest 5165
step
    .goto 1448/1,-524.93,5113.55
    >>Click the |cRXP_PICK_Brazier of Malice|r
    .complete 5165,2 --Extinguish the Brazier of Malice
    .isOnQuest 5165
step
    .goto 1448/1,-1819.83,6909.47
    >>Click the |cRXP_PICK_Deadwood Cauldron|r
    .accept 5085 >>Accept Mystery Goo
    .isQuestTurnedIn 5084 --any of: Falling to Corruption
    .xp <52,1
step
    .goto 1448/1,-355.31,5109.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trull Failbane|r
    .turnin 4521 >>Turn in Wild Guardians
    .target Trull Failbane
    .isQuestComplete 4521
step << Warlock
    .goto 1448/1,-441.56,5374.98
    >>Kill |cRXP_ENEMY_Jaedenar Legionnaire|r and loot |cRXP_LOOT_Flawless Fel Essence (Jaedenar)|r
    .complete 7602,2 --Flawless Fel Essence (Jaedenar) (1)
    .mob Jaedenar Legionnaire
    .isOnQuest 7602
step << Warlock
    .goto 1448/1,-986.08,5800.87
    >>Kill |cRXP_ENEMY_Kroshius|r and loot |cRXP_LOOT_Kroshius' Infernal Core|r
    .complete 7603,2 --Kroshius' Infernal Core (1)
    .mob Kroshius
    .isOnQuest 7603
step << Warlock
    .goto 1448/1,-986.08,5800.87
    >>Kill |cRXP_ENEMY_Kroshius|r
    .complete 7603,1 --Kroshius slain (1)
    .mob Kroshius
    .isOnQuest 7603
step
    .goto 1448/1,-2082.61,6821.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nafien|r
    .accept 8461 >>Accept Deadwood of the North
    .target Nafien
step
    #loop
    .goto 1448/1,-2019.36,6820.15,0
    .goto 1448/1,-2019.36,6820.15,40,0
    .goto 1448/1,-1961.86,6752.30,40,0
    .goto 1448/1,-1996.36,6636.92,40,0
    .goto 1448/1,-1952.66,6681.00,40,0
    .goto 1448/1,-1892.28,6705.92,40,0
    .goto 1448/1,-1812.36,6820.92,40,0
    .goto 1448/1,-1814.66,6911.38,40,0
    .goto 1448/1,-1873.88,6909.47,40,0
    .goto 1448/1,-1927.93,6860.40,40,0
    >>Kill |cRXP_ENEMY_Deadwood Den Watchers|r
    >>Kill |cRXP_ENEMY_Deadwood Avengers|r
    >>Kill |cRXP_ENEMY_Deadwood Shamans|r
    .complete 8461,1 --Deadwood Den Watcher slain (6)
    .complete 8461,2 --Deadwood Avenger slain (6)
    .complete 8461,3 --Deadwood Shaman slain (6)
    .mob Deadwood Den Watcher
    .mob Deadwood Avenger
    .mob Deadwood Shaman
step
    .goto 1448/1,-2082.61,6821.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nafien|r
    .turnin 8461 >>Turn in Deadwood of the North
    .accept 8465 >>Accept Speak to Salfa
    .target Nafien
step << Warlock
    .goto 1448/1,-737.68,5414.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Niby the Almighty|r
    .turnin 7603 >>Turn in Kroshius' Infernal Core
    .target Niby the Almighty
    .isOnQuest 7603
step
    .goto 1448/1,-355.31,5109.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trull Failbane|r
    .accept 4741 >>Accept Wild Guardians
    .target Trull Failbane
    .isQuestTurnedIn 4521 --any of: Wild Guardians
    .xp <52,1
step
    .goto 1448/1,-355.31,5109.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trull Failbane|r
    .accept 4721 >>Accept Wild Guardians
    .target Trull Failbane
    .isQuestTurnedIn 4741 --any of: Wild Guardians
    .xp <52,1
step
    .goto 1448/1,-1302.91,3985.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Greta Mosshoof|r
    .turnin 5165 >>Turn in Dousing the Flames of Protection
    .target Greta Mosshoof
    .isOnQuest 5165
step
    .goto 1448/1,-1310.96,3989.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jessir Moonbow|r
    .turnin 5203 >>Turn in Rescue From Jaedenar
    .target Jessir Moonbow
    .isOnQuest 5203
step
    .goto 1448/1,-1310.96,3989.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jessir Moonbow|r
    .accept 5204 >>Accept Retribution of the Light
    .target Jessir Moonbow
    .isQuestTurnedIn 5203 --any of: Rescue From Jaedenar
    .xp <49,1
step
    .goto 1448/1,-560.58,5197.12
    >>Kill |cRXP_ENEMY_Rakaiah|r
    .complete 5204,1 --Rakaiah slain (1)
    .mob Rakaiah
    .isOnQuest 5204
step
    .goto 1448/1,-572.08,5200.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Remains of Trey Lightforge|r
    .turnin 5204 >>Turn in Retribution of the Light
    .target Remains of Trey Lightforge
    .isOnQuest 5204
step
    .goto 1448/1,-572.08,5200.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Remains of Trey Lightforge|r
    .accept 5385 >>Accept The Remains of Trey Lightforge
    .target Remains of Trey Lightforge
    .isQuestTurnedIn 5204 --any of: Retribution of the Light
    .xp <49,1
step
    .goto 1448/1,-1310.96,3989.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jessir Moonbow|r
    .turnin 5385 >>Turn in The Remains of Trey Lightforge
    .target Jessir Moonbow
    .isOnQuest 5385
step
    .goto 1448/1,-355.31,5109.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trull Failbane|r
    .accept 4883 >>Accept Guarding Secrets
    .target Trull Failbane
    .isQuestTurnedIn 4882 --any of: Guarding Secrets
    .xp <52,1
step
    .goto 1448/1,-355.31,5109.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trull Failbane|r
    .turnin 4741 >>Turn in Wild Guardians
    .target Trull Failbane
    .isQuestComplete 4741
step
    .goto 1448/1,-355.31,5109.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trull Failbane|r
    .turnin 4721 >>Turn in Wild Guardians
    .target Trull Failbane
    .isQuestComplete 4721
step
    +|cRXP_WARN_That is all of Felwood for now.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Thunder Bluff|r: Guarding Secrets
    >>|cRXP_FRIENDLY_Winterspring|r: Speak to Salfa, Winterfall Firewater, Mystery Goo
    >>|cRXP_FRIENDLY_Azshara, Blasted Lands and back here|r: Flawless Fel Essence << Warlock
    >>|cRXP_FRIENDLY_Winterspring and back here|r: Wild Guardians
step
    +|cRXP_WARN_The rest of Felwood is planned from level 57.|r Load its guide for level 57 then
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde
#version 1
#group Zone Routes (Horde)
#subgroup 48 - 58 Felwood
#subweight -48
#name 57-58 Felwood

step
    .goto 1448/1,-2107.33,7006.83
    >>Click the |cRXP_PICK_Book|r
    .accept 84397 >>Accept Northern Kalimdor - A Comprehensive Guide
step
    .goto 1448/1,-2107.33,7006.83
    >>Open the |cRXP_PICK_Book|r. Loot it for |cRXP_LOOT_Northern Kalimdor - A Comprehensive Guide|r
    .complete 84397,1 --Northern Kalimdor - A Comprehensive Guide (1)
step << Warlock
    .goto 1448/1,-736.53,5407.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Impsy|r
    .turnin 8422 >>Turn in Trolls of a Feather
    .target Impsy
    .isQuestComplete 8422
step
    .goto 1448/1,-355.31,5109.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Trull Failbane|r
    .turnin 4521 >>Turn in Wild Guardians
    .target Trull Failbane
    .isQuestComplete 4521
step
    .goto 1448/1,-1302.91,3985.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Greta Mosshoof|r
    .accept 5242 >>Accept A Final Blow
    .target Greta Mosshoof
    .isQuestTurnedIn 5165 --any of: Dousing the Flames of Protection
    .xp <48,1
step << Warlock
    .goto 1448/1,-577.83,5182.93
    >>Kill |cRXP_ENEMY_Jaedenar Legionnaire|r and loot |cRXP_LOOT_Flawless Fel Essence (Jaedenar)|r
    .complete 7602,2 --Flawless Fel Essence (Jaedenar) (1)
    .mob Jaedenar Legionnaire
    .isOnQuest 7602
step
    .goto 1448/1,-589.91,5336.65
    >>Kill |cRXP_ENEMY_Moora|r
    .complete 5242,1 --Moora slain (1)
    .mob Moora
    .isOnQuest 5242
step
    .goto 1448/1,-588.76,5343.17
    >>Kill |cRXP_ENEMY_Salia|r
    .complete 5242,2 --Salia slain (1)
    .mob Salia
    .isOnQuest 5242
step
    .goto 1448/1,-590.48,5340.10
    >>Kill |cRXP_ENEMY_Shadow Lord Fel'dan|r and loot |cRXP_LOOT_Shadow Lord Fel'dan's Head|r
    .complete 5242,3 --Shadow Lord Fel'dan's Head (1)
    .mob Shadow Lord Fel'dan
    .isOnQuest 5242
step << Warlock
    .goto 1448/1,-736.53,5407.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Impsy|r
    .turnin 7602 >>Turn in Flawless Fel Essence
    .target Impsy
    .isQuestComplete 7602
step
    .goto 1448/1,-1302.91,3985.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Greta Mosshoof|r
    .turnin 5242 >>Turn in A Final Blow
    .target Greta Mosshoof
    .isOnQuest 5242
step
    +|cRXP_WARN_End of the Felwood route.|r Quests still in your log lead on from here; pick your next zone by them
    >>|cRXP_FRIENDLY_Stormwind City|r: Northern Kalimdor - A Comprehensive Guide
]])
