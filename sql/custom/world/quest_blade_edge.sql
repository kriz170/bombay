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
/* INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES 
(2074800, 20748, 11, 0, 100, 0, 0, 0, 0, 0, 11, 37691, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Thunderlord Dire Wolf - Stealth Detection');
*/
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
INSERT INTO `smart_scripts` VALUES
(184729,1,0,0,70,0,100,0,2,0,0,0,12,21319,1,90000,0,0,0,8,0,0,0,1316.748,6695.007,-18.810,5.052,'The Thunderspike -  Activated - Summon Grimgut');
UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14 WHERE `entry`=21319;
