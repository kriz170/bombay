-- Fix quest Death's Door - ID 10910
-- Evergrove Druid SAI
UPDATE `creature_template` SET `inhabittype`=5,`AIName`= 'SmartAI' WHERE `entry`=22423;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=22423;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(22423,0,1,0,8,0,100,1,38782,0,0,0,11,38776,0,0,0,0,0,1,0,0,0,0,0,0,0,'On hit by signal transform to crow'),
(22423,0,2,0,8,0,100,1,38782,0,0,0,19,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0,'Remove field flag'),
(22423,0,3,0,8,0,100,1,38782,0,0,0,29,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Follow player invoker'),
(22423,0,4,0,64,0,100,1,0,0,0,0,11,39158,0,0,0,0,0,1,0,0,0,0,0,0,0,'On gossip hello transform to druid, since end point for follow can"t be player'),
(22423,0,5,0,64,0,100,1,0,0,0,0,46,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Moves 1 yard forward to break the follow on hello'),
(22423,0,6,0,19,0,100,1,10904,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,'On target accepted next quest despawn'),
(22423,0,7,0,19,0,100,1,10911,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,'On target accepted next quest despawn'),
(22423,0,8,0,19,0,100,1,10912,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,'On target accepted next quest despawn');

-- Grim(oire) Business
SET @GUID :=265321; -- need 1

DELETE FROM creature WHERE id=22911;
INSERT INTO creature (guid,id,map,spawnMask,phaseMask,modelid,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,spawndist,currentwaypoint,curhealth,curmana,MovementType,npcflag,unit_flags,dynamicflags) VALUES
(@GUID,22911,530,1,1,0,0,3279.73,4640.09,216.526,4.08274,300,0,0,97800,7196,0,0,0,0);

-- Spawn Vim'gol's Vile Grimoire wen NPC killed by nelegalno
UPDATE creature_template SET AIName='SmartAI' WHERE entry=22911;
DELETE FROM smart_scripts WHERE (entryorguid=22911 AND source_type=0);
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,COMMENT) VALUES 
(22911,0,0,0,6,0,100,0,0,0,0,0,11,39862,2,0,0,0,0,1,0,0,0,0,0,0,0,"Vim'gol - Summon Vim'gol's Vile Grimoire Chest on Death");

-- Protecting Our Own (H)
SET @QUEST := 10488;
SET @WOLF := 20748;
SET @DETECT := 37691;
SET @CREDIT := 21142;
SET @OINTMENT := 32578;
UPDATE `quest_template` SET `RequiredSpellCast1`=0 WHERE `Id`=10488;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@WOLF;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@WOLF;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@WOLF AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@WOLF, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 11, @DETECT, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Thunderlord Dire Wolf - On Spawn - cast Stealth Detection on self'),
(@WOLF, 0, 1, 0, 8, 0, 100, 0, @OINTMENT, 0, 0, 0, 33, @CREDIT, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Thunderlord Dire Wolf - On Spellhit - Give Quest Credit');

-- Vision Guide hack fix autocomplete
UPDATE `quest_template` SET `Method`=0, `RequiredItemId1`=0, `RequiredItemCount1`=0 WHERE `Id`=10525;

-- The Thunderspike 
UPDATE `gameobject_template` SET AIName='SmartGameObjectAI', ScriptName='', data2=0, data3=90000 WHERE entry=184729;
DELETE FROM `smart_scripts` WHERE entryorguid=184729;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(184729,1,0,0,70,0,100,0,2,0,0,0,12,21319,1,90000,0,0,0,8,0,0,0,1316.748,6695.007,-18.810,5.052,'The Thunderspike -  Activated - Summon Grimgut');
UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14 WHERE `entry`=21319;

-- Spirit Calling
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=21004;
UPDATE `creature_loot_template` SET `groupid`=2 WHERE `entry`=21004 AND `item`=31656;

-- Whispers of the Raven God
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (19988,19989,19990);
DELETE FROM `smart_scripts` WHERE (`entryorguid` IN (19988,19989,19990) AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(19988, 0, 0, 0, 6, 0, 40, 0, 0, 0, 0, 0, 85, 37466, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grishna Falconwing - Cast Understanding Ravenspeech on Death'),
(19989, 0, 0, 0, 6, 0, 40, 0, 0, 0, 0, 0, 85, 37466, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grishna Harbinger - Cast Understanding Ravenspeech on Death'),
(19990, 0, 0, 0, 6, 0, 40, 0, 0, 0, 0, 0, 85, 37466, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grishna Scorncrow - Cast Understanding Ravenspeech on Death');

UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry` IN (184950,184967,184968,184969);
DELETE FROM `smart_scripts` WHERE (`entryorguid` IN (184950,184967,184968,184969) AND `source_type`=1);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(184950, 1, 0, 0, 70, 0, 100, 0, 2, 0, 0, 0, 33, 22798, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'First Prophecy - On Activate - Give Quest Credit'),
(184967, 1, 0, 0, 70, 0, 100, 0, 2, 0, 0, 0, 33, 22799, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Second Prophecy - On Activate - Give Quest Credit'),
(184968, 1, 0, 0, 70, 0, 100, 0, 2, 0, 0, 0, 33, 22800, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Third Prophecy - On Activate - Give Quest Credit'),
(184969, 1, 0, 0, 70, 0, 100, 0, 2, 0, 0, 0, 33, 22801, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Fourth Prophecy - On Activate - Give Quest Credit');

DELETE FROM `creature` WHERE `id` IN (22798,22799,22800,22801);

-- Meeting at Blackwing Coven
-- Variables
SET @QUEST := 10722;
SET @ENTRY := 22019;
SET @SPELL1:= 37704; -- Whirlwind
SET @SPELL2:= 8599; -- Enrage

-- Update Kolphis Darkscale, enable SmartAI and add gossipflag
UPDATE `creature_template` SET `AIName`='SmartAI',`gossip_menu_id`=8436,`npcflag`=npcflag |1 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY; 
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,8439,1,0,0,15,@QUEST,0,0,0,0,0,7,0,0,0,0,0,0,0,'Kolphis Darkscale - script - give Quest credit to player'),
(@ENTRY,0,1,0,0,0,50,0,3000,3000,8000,8000,11,@SPELL1,0,0,0,0,0,2,0,0,0,0,0,0,0,'Kolphis Darkscale - Combat - Whirlwind'),
(@ENTRY,0,2,0,2,0,100,1,0,25,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kolphis Darkscale - On Health level - Emote when below 25% HP'),
(@ENTRY,0,3,0,2,0,100,1,0,25,0,0,11,@SPELL2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kolphis Darkscale - On Health level - Cast Enrage when below 25% HP');

-- add missing text to Kolphis Darkscale from sniff
DELETE FROM `npc_text` WHERE `ID`=10540;
INSERT INTO `npc_text` (`ID`,`prob0`,`text0_0`,`text0_1`,`WDBVerified`) VALUES
(10540,1,'Begone, overseer!  We''ve already spoken.$B$BStop dragging your feet and execute your orders at Ruuan Weald!','',1);

-- Kolphis Darkscale emote
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'%s becomes enraged!',16,0,100,0,0,0,'Kolphis Darkscale');

-- Gossip menu insert from sniff
DELETE FROM `gossip_menu` WHERE `entry`=8436 AND `text_id`=10539;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8436,10539);
DELETE FROM `gossip_menu` WHERE `entry`=8436 AND `text_id`=10540;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8436,10540);
DELETE FROM `gossip_menu` WHERE `entry`=8435 AND `text_id`=10541;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8435,10541);
DELETE FROM `gossip_menu` WHERE `entry`=8437 AND `text_id`=10542;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8437,10542);
DELETE FROM `gossip_menu` WHERE `entry`=8438 AND `text_id`=10543;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8438,10543);
DELETE FROM `gossip_menu` WHERE `entry`=8439 AND `text_id`=10544;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8439,10544);
DELETE FROM `gossip_menu` WHERE `entry`=8440 AND `text_id`=10545;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8440,10545);

-- Creature Gossip_menu_option insert from sniff
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (8435,8436,8437,8438,8439) AND `id`=1;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(8436,1,0,'I''m fine, thank you. You asked for me?',1,1,8435,0,0,0,''),
(8435,1,0,'Oh, it''s not my fault, I can assure you.',1,1,8437,0,0,0,''),
(8437,1,0,'Um, no... No, I don''t want that at all.',1,1,8438,0,0,0,''),
(8438,1,0,'Impressive. When do we attack?',1,1,8439,0,0,0,''),
(8439,1,0,'Absolutely!',1,1,8440,0,0,0,'');

-- Add gossip_menu condition  
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=8436;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`Comment`) VALUES
(15,8436,1,0,9,10722,0,0,0,'Show gossip option 1 if player has quest 10722'),
(14,8436,10540,0,28,10722,0,0,0,'Show text 8436/10540 if player has quest 10722 completed already');

-- A Dire Situation
DELETE FROM `event_scripts` WHERE `id`=13584;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES 
(13584, 0, 8, 21176, 1, 0, 0, 0, 0, 0);

-- What Came First, the Drake or the Egg?
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=184958;
DELETE FROM `smart_scripts` WHERE `entryorguid`=184958 AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(184958, 1, 0, 0, 70, 0, 100, 0, 2, 0, 0, 0, 12, 21817, 1, 60000, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Nether Drake Egg - On Activate - Summon Adolescent Nether Drake');

-- Ride the lightning
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=20749;
DELETE FROM `smart_scripts` WHERE `entryorguid`=20749 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(20749, 0, 0, 0, 0, 0, 70, 0, 5000, 5000, 10000, 12000, 11, 37841, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Cast Lightning Strike on victim'),
(20749, 0, 1, 0, 31, 0, 100, 0, 37841, 0, 0, 0, 33, 21910, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Scalewing Serpent - On Spellhit Target - Give Credit');

-- Fire At Will! - Auto complete
UPDATE `quest_template` SET `Method`=0 WHERE `Id`=10911;

-- On Spirit's Wings - Auto Complete
UPDATE `quest_template` SET `Method`=0, `RequiredItemId2`=0, `RequiredItemCount2`=0 WHERE `Id`=10714;

-- Gather the Orbs
UPDATE `quest_template` SET `RequiredSpellCast1`=0 WHERE `Id`=10859;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=22333;
DELETE FROM `smart_scripts` WHERE `entryorguid`=22333 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(22333, 0, 0, 0, 1, 0, 100, 0, 5000, 6000, 12000, 15000, 12, 20635, 1, 60000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Orb Collecting Totem - Every couple seconds - Summon Light'),
(22333, 0, 1, 0, 17, 0, 100, 0, 0, 0, 0, 0, 33, 21929, 0, 0, 0, 0, 0, 18, 20, 0, 0, 0, 0, 0, 0, 'Orb Collecting Totem - On Summon Light -  Give Credit');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=20635;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=20635;
DELETE FROM `smart_scripts` WHERE `entryorguid`=20635 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(20635, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 11, 32566, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Razaani Light Orb - Purple Banish State'),
(20635, 0, 1, 0, 25, 0, 100, 0, 0, 0, 0, 0, 89, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Razaani Light Orb - Random movement distance 4 yd');

-- Wrangle Some Aether Rays!
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=22181;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=22181;
DELETE FROM `smart_scripts` WHERE `entryorguid`=22181 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=2218100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(22181, 0, 0, 0, 1, 0, 100, 0, 7900, 13000, 28000, 36000, 11, 35333, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Aether Ray - Cast Tail Swipe'),
(22181, 0, 1, 0, 2, 0, 100, 1, 0, 40, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Aether Ray - At HP 40% - Say'),
(22181, 0, 2, 0, 8, 0, 100, 0, 40856, 0, 0, 0, 80, 2218100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Aether Ray - On Spell Hit - Run Script'),
(2218100, 9, 0, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 33, 23343, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Aether Ray - After 5 Seconds - Give Credit'),
(2218100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Aether Ray - Despawn');

DELETE FROM `creature_text` WHERE `entry`=22181;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(22181,0,0, 'The Aether Ray appears ready to be wrangled.',16,0,100,18,0,6941, 'Aether Ray');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=40856;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(17, 0, 40856, 0, 0, 38, 1, 40, 4, 0, 0, 0, '', 'Wrangling Rope can only be used under 40% hp');

-- Wildlord Antelarion
SET @ANTELARION := 22127;
SET @GOSSIP := 53105;
SET @SPELL := 39101;
SET @ITEM := 31366;
UPDATE `creature_template` SET `gossip_menu_id`=@GOSSIP,`AIname`='SmartAI' WHERE `entry`=@ANTELARION;

DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`) VALUES
(@GOSSIP,0,0,'I lost my mask',1,1);

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ANTELARION AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ANTELARION, 0, 0, 0, 62, 0, 100, 0, @GOSSIP, 0, 0, 0, 11, @SPELL, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Wildlord Antelarion - On Gossip Select - Cast Create Felsword Gas Mask');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,0,0,2,@ITEM,1,0,1,0,'','Only show gossip if player doesn''t have item');

-- Bladespire Kegger
UPDATE `quest_template` SET `RequiredSpellCast1`=0 WHERE `Id`=10545;

-- The Smallest Creatures
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry` IN (185206,185213,185214);

DELETE FROM `smart_scripts` WHERE `source_type`=1 AND `entryorguid` IN (185206,185213,185214);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(185206, 1, 0, 0, 70, 0, 100, 0, 2, 0, 0, 0, 33, 22356, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Green Spot Grog Keg - On Activate - Give Credit'),
(185213, 1, 0, 0, 70, 0, 100, 0, 2, 0, 0, 0, 33, 22367, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Ripe Moonshine Keg - On Activate - Give Credit'),
(185214, 1, 0, 0, 70, 0, 100, 0, 2, 0, 0, 0, 33, 22368, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Fermented Seed Beer Keg - On Activate - Give Credit');

-- Banish the Demon
SET @BUNNY1 := 23322;
SET @BUNNY2 := 23327;
SET @BANISH := 40825;
SET @BEAM := 40830;
SET @ABYSSAL := 19973;
SET @WHISPERER := 22201;
SET @IMP := 22202;
SET @FIEND := 22204;
SET @SPEAKER := 22195;
SET @GUARDIAN := 22327;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@BUNNY1,@ABYSSAL,@WHISPERER,@IMP,@FIEND,@SPEAKER,@GUARDIAN);

DELETE FROM `creature_ai_scripts` WHERE `id`=@SPEAKER;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (@BUNNY1,@ABYSSAL,@WHISPERER,@IMP,@FIEND,@SPEAKER,@GUARDIAN);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@BUNNY1, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 11, 40849, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Banishing Crystal Bunny - On Summoned - Cast Banish the Demons: Banishment Periodic Aura'),
(@BUNNY1, 0, 1, 0, 54, 0, 100, 0, 0, 0, 0, 0, 11, 40857, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Banishing Crystal Bunny - On Spellhit Target - Cast Banish the Demons: Banishment Beam Periodic Aura'),
(@ABYSSAL, 0, 0, 0, 8, 0, 100, 0, @BANISH, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Abyssal Flamebringer - On Spellhit - Set Phase 1'),
(@ABYSSAL, 0, 1, 0, 6, 1, 100, 0, 0, 0, 0, 0, 33, @BUNNY2, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Abyssal Flamebringer - On Death - Give Credit'),
(@ABYSSAL, 0, 2, 0, 6, 1, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Abyssal Flamebringer - On Death - Set Phase 0'),
(@WHISPERER, 0, 0, 0, 8, 0, 100, 0, @BANISH, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fear Whisperer - On Spellhit - Set Phase 1'),
(@WHISPERER, 0, 1, 0, 6, 1, 100, 0, 0, 0, 0, 0, 33, @BUNNY2, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Fear Whisperer - On Death - Give Credit'),
(@WHISPERER, 0, 2, 0, 6, 1, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fear Whisperer - On Spellhit - Set Phase 0'),
(@IMP, 0, 0, 0, 8, 0, 100, 0, @BANISH, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Nightmare Imp - On Spellhit - Set Phase 1'),
(@IMP, 0, 1, 0, 6, 1, 100, 0, 0, 0, 0, 0, 33, @BUNNY2, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Nightmare Imp - On Death - Give Credit'),
(@IMP, 0, 2, 0, 6, 1, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Nightmare Imp - On Death - Set Phase 0'),
(@FIEND, 0, 0, 0, 8, 0, 100, 0, @BANISH, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fear Fiend - On Spellhit - Set Phase 1'),
(@FIEND, 0, 1, 0, 6, 1, 100, 0, 0, 0, 0, 0, 33, @BUNNY2, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Fear Fiend - On Death - Give Credit'),
(@FIEND, 0, 2, 0, 6, 1, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fear Fiend - On Death - Set Phase 0'),
(@SPEAKER, 0, 0, 0, 0, 0, 75, 0, 2500, 7500, 14000, 18000, 11, 34017, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Wrath Speaker - In Combat - Cast Rain of Chaos'),
(@SPEAKER, 0, 1, 0, 0, 0, 100, 0, 10100, 14100, 122000, 130000, 11, 11980, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Wrath Speaker - In Combat - Cast Curse of Weakness'),
(@SPEAKER, 0, 2, 0, 8, 0, 100, 0, @BANISH, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Wrath Speaker - On Spellhit - Set Phase 1'),
(@SPEAKER, 0, 3, 0, 6, 1, 100, 0, 0, 0, 0, 0, 33, @BUNNY2, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Wrath Speaker - On Death - Give Credit'),
(@SPEAKER, 0, 4, 0, 6, 1, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Wrath Speaker - On Death - Set Phase 0'),
(@GUARDIAN, 0, 0, 0, 8, 0, 100, 0, @BANISH, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Terror Fire Guardian - On Spellhit - Set Phase 1'),
(@GUARDIAN, 0, 1, 0, 6, 1, 100, 0, 0, 0, 0, 0, 33, @BUNNY2, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Terror Fire Guardian - On Death - Give Credit'),
(@GUARDIAN, 0, 2, 0, 6, 1, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Terror Fire Guardian - On Death - Set Phase 0');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=@BANISH;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 1, @BANISH, 0, 0, 31, 0, 3, @ABYSSAL, 0, 0, 0, '', 'Banishment - Target Abyssal Flamebringer'),
(13, 1, @BANISH, 0, 1, 31, 0, 3, @WHISPERER, 0, 0, 0, '', 'Banishment - Target Fear Whisperer'),
(13, 1, @BANISH, 0, 2, 31, 0, 3, @IMP, 0, 0, 0, '', 'Banishment - Target Nightmare Imp'),
(13, 1, @BANISH, 0, 3, 31, 0, 3, @FIEND, 0, 0, 0, '', 'Banishment - Target Fear Fiend'),
(13, 1, @BANISH, 0, 4, 31, 0, 3, @SPEAKER, 0, 0, 0, '', 'Banishment - Target Wrath Speaker'),
(13, 1, @BANISH, 0, 5, 31, 0, 3, @GUARDIAN, 0, 0, 0, '', 'Banishment - Target Terror Fire Guardian');

-- There Can Be Only One Response
SET @RAZAAN := 21057;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@RAZAAN;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@RAZAAN;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@RAZAAN, 0, 0, 0, 0, 0, 100, 0, 7000, 10000, 20000, 25000, 11, 35924, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Nexus-Prince Razaan - On Reset - Cast Arcana Flux'),
(@RAZAAN, 0, 1, 0, 6, 0, 100, 0, 0, 0, 0, 0, 50, 185033, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Nexus-Prince Razaan - On Death - Spawn GO');

-- To Rule The Skies
SET @SHARD := 32569;

DELETE FROM `gossip_menu` WHERE `entry` IN (8685,8690,8691);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES 
(8685, 10931),
(8690, 10931),
(8691, 10931);

DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (8685,8690,8691);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES 
(8685, 0, 0, 'Place 35 Apexis Shards near the dragon egg to crack it open.', 1, 1, 0, 0, 0, 0, ''),
(8690, 0, 0, 'Place 35 Apexis Shards near the dragon egg to crack it open.', 1, 1, 0, 0, 0, 0, ''),
(8691, 0, 0, 'Place 35 Apexis Shards near the dragon egg to crack it open.', 1, 1, 0, 0, 0, 0, '');

UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry` IN (185932,185936,185937,185938);

DELETE FROM `smart_scripts` WHERE  `source_type`=1 AND `entryorguid` IN (185932,185936,185937,185938);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(185932, 1, 0, 0, 62, 0, 100, 0, 8685, 0, 0, 0, 12, 23282, 4, 90000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Obsidia''s Egg - On Gossip Select - Spawn Obsidia'),
(185932, 1, 1, 0, 62, 0, 100, 0, 8685, 0, 0, 0, 57, @SHARD, 35, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Obsidia''s Egg - On Gossip Select - Remove 35 Apexis Shard from inventory'),
(185936, 1, 0, 0, 62, 0, 100, 0, 8689, 0, 0, 0, 12, 23061, 4, 90000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rivendark''s Egg - On Gossip Select - Spawn Rivendark'),
(185936, 1, 1, 0, 62, 0, 100, 0, 8689, 0, 0, 0, 57, @SHARD, 35, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Rivendark''s Egg - On Gossip Select - Remove 35 Apexis Shard from inventory'),
(185937, 1, 0, 0, 62, 0, 100, 0, 8690, 0, 0, 0, 12, 23261, 4, 90000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Furywing''s Egg - On Gossip Select - Spawn Furywing'),
(185937, 1, 1, 0, 62, 0, 100, 0, 8690, 0, 0, 0, 57, @SHARD, 35, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Furywing''s Egg - On Gossip Select - Remove 35 Apexis Shard from inventory'),
(185938, 1, 0, 0, 62, 0, 100, 0, 8691, 0, 0, 0, 12, 23281, 4, 90000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Insidion''s Egg - On Gossip Select - Spawn Insidion'),
(185938, 1, 1, 0, 62, 0, 100, 0, 8691, 0, 0, 0, 57, @SHARD, 35, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Insidion''s Egg - On Gossip Select - Remove 35 Apexis Shard from inventory');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup` IN (8685,8690,8691);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,8685,0,0,2,@SHARD,35,0,0,'','Only show gossip if player has 35 Apexis Shard'),
(15,8690,0,0,2,@SHARD,35,0,0,'','Only show gossip if player has 35 Apexis Shard'),
(15,8691,0,0,2,@SHARD,35,0,0,'','Only show gossip if player has 35 Apexis Shard');

-- Bombing Run
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_item_skyguard_bombs';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(40160, 'spell_item_skyguard_bombs');

UPDATE `gameobject_template` SET `data3`=15000 WHERE `entry`=185861;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=22451;

DELETE FROM `smart_scripts` WHERE  `source_type`=0 AND `entryorguid`=22451;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(22451, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fel Cannon - On Aggro - Stop Combat Movement'),
(22451, 0, 1, 0, 10, 0, 100, 0, 0, 50, 0, 0, 11, 36238, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Fel Cannon - On OOC LOS - Cast Fel Cannon Blast');

-- A Curse Upon Both of Your Clans!
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_item_wicked_strong_fetish';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(32580,'spell_item_wicked_strong_fetish');

DELETE FROM `gameobject` WHERE `id`=300104 AND `guid`>210000;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(211201, 300104, 530, 1, 1, 1585.84, 6282.59, 4.20008, 1.38596, 0, 0, 0.638833, 0.769345, 300, 0, 1),
(211202, 300104, 530, 1, 1, 1535.3, 6315.93, 3.61296, 0.577006, 0, 0, 0.284517, 0.958671, 300, 0, 1);

-- Gorgrom the Dragon-Eater
UPDATE `quest_template` SET `RequiredSpellCast1`=0 WHERE `Id`=10802;

-- Trapping the Light Fantastic
SET @BUNNY := 21926;
SET @TRAP := 185011;
SET @LIGHT := 20771;
SET @CREDIT := 21929;

UPDATE `creature` SET `spawndist`=5, `MovementType`=1 WHERE `id`=@LIGHT;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@BUNNY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@BUNNY;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@BUNNY,0,0,0,54,0,100,0,0,0,0,0,50,@TRAP,60000,0,0,0,0,1,0,0,0,0,0,0,0, 'Multi-Spectrum Light Trap Bunny - On Create - Spawn GO'),
(@BUNNY,0,1,0,54,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Multi-Spectrum Light Trap Bunny - On Create - Hide');

UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=@TRAP;
DELETE FROM `smart_scripts` WHERE  `source_type`=1 AND `entryorguid`=@TRAP;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@TRAP,1,0,0,1,0,100,1,1000,1000,0,0,9,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Multi-Spectrum Light Trap - On Create - Activate');

UPDATE `creature_template` SET `speed_walk`=0.3, `speed_run`=0.3, `AIName`='SmartAI' WHERE `entry`=@LIGHT;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@LIGHT;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@LIGHT;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@LIGHT,0,0,0,25,0,100,0,0,0,0,0,11,32566,2,0,0,0,0,1,0,0,0,0,0,0,0,'Razaani Light Orb - Mini - Purple Banish State'),
(@LIGHT,0,1,3,1,0,100,0,10000,10000,10000,10000,29,0,0,@BUNNY,1,1,0,19,@BUNNY,75,0,0,0,0,0,'Razaani Light Orb - Mini - Find Target - Follow'),
(@LIGHT,0,2,0,65,0,100,0,0,0,0,0,33,@CREDIT,0,0,0,0,0,18,20,0,0,0,0,0,0,'Razaani Light Orb - Mini - Reach Target - Give Credit'),
(@LIGHT,0,3,0,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Razaani Light Orb - Mini - On Find Target - Set Phase 1'),
(@LIGHT,0,4,0,1,1,100,0,25000,25000,25000,25000,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Razaani Light Orb - Mini - Idle on Ground(Phase 1) - Despawn');
