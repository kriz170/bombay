-- Chicken Escapee
SET @CreGuid := 262120; -- custom butuh 20
SET @ENTRY := 28161;
SET @LIFE := 900000;
SET @PARTY := 12702;
SET @COOP := 12532;
DELETE FROM `creature` WHERE id=@ENTRY;
INSERT INTO `creature` VALUES 
(@CreGuid,@ENTRY,571,1,1,0,0, '5163.8', '4393.75', '-95.4105', '2.5767',60,0.0,0,42,0,0,0,0,0),
(@CreGuid+1,@ENTRY,571,1,1,0,0, '5221.38', '4323.37', '-96.9265', '1.8502',60,0.0,0,42,0,0,0,0,0),
(@CreGuid+2,@ENTRY,571,1,1,0,0, '5228.56', '4448.21', '-96.869', '4.81902',60,0.0,0,42,0,0,0,0,0),
(@CreGuid+3,@ENTRY,571,1,1,0,0, '5214.53', '4627.71', '-131.786', '4.37448',60,0.0,0,42,0,0,0,0,0),
(@CreGuid+4,@ENTRY,571,1,1,0,0, '5216.78', '4584.31', '-103.654', '0.877885',60,0.0,0,42,0,0,0,0,0),
(@CreGuid+5,@ENTRY,571,1,1,0,0, '5258.21', '4446.61', '-89.6398', '3.61107',60,0.0,0,42,0,0,0,0,0),
(@CreGuid+6,@ENTRY,571,1,1,0,0, '5283.34', '4454.62', '-95.912', '4.44359',60,0.0,0,42,0,0,0,0,0),
(@CreGuid+7,@ENTRY,571,1,1,0,0, '5239.56', '4529.82', '-85.7337', '5.58242',60,0.0,0,42,0,0,0,0,0),
(@CreGuid+8,@ENTRY,571,1,1,0,0, '5237.91', '4548.49', '-89.346', '0.528376',60,0.0,0,42,0,0,0,0,0),
(@CreGuid+9,@ENTRY,571,1,1,0,0, '5219.39', '4539.67', '-90.8103', '0.387005',60,0.0,0,42,0,0,0,0,0),
(@CreGuid+10,@ENTRY,571,1,1,0,0, '5195.31', '4523.06', '-89.8844', '1.51012',60,0.0,0,42,0,0,0,0,0),
(@CreGuid+11,@ENTRY,571,1,1,0,0, '5199.51', '4500.45', '-90.0671', '1.64757',60,0.0,0,42,0,0,0,0,0),
(@CreGuid+12,@ENTRY,571,1,1,0,0, '5252.57', '4483.53', '-84.0754', '2.57827',60,0.0,0,42,0,0,0,0,0),
(@CreGuid+13,@ENTRY,571,1,1,0,0, '5294.33', '4482.28', '-93.2836', '3.96843',60,0.0,0,42,0,0,0,0,0),
(@CreGuid+14,@ENTRY,571,1,1,0,0, '5318.23', '4532.05', '-97.8817', '5.13865',60,0.0,0,42,0,0,0,0,0),
(@CreGuid+15,@ENTRY,571,1,1,0,0, '5289.54', '4547.26', '-78.9633', '0.367355',60,0.0,0,42,0,0,0,0,0),
(@CreGuid+16,@ENTRY,571,1,1,0,0, '5268.93', '4551.49', '-85.0375', '5.1308',60,0.0,0,42,0,0,0,0,0),
(@CreGuid+17,@ENTRY,571,1,1,0,0, '5262.45', '4588.19', '-99.4172', '6.02222',60,0.0,0,42,0,0,0,0,0),
(@CreGuid+18,@ENTRY,571,1,1,0,0, '5242.83', '4582.27', '-98.3819', '5.20147',60,0.0,0,42,0,0,0,0,0),
(@CreGuid+19,@ENTRY,571,1,1,0,0, '5173.58', '4539.49', '-97.6117', '4.3195',60,0.0,0,42,0,0,0,0,0);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=@ENTRY;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES 
-- quest 12702 chicken party!
(@ENTRY,39996,@PARTY,1,@PARTY,1,0,0,0), -- cover spell (dummy)
(@ENTRY,51037,@PARTY,1,@PARTY,2,0,0,0), -- creates item in players back pack
-- quest 12532 flown the coop!
(@ENTRY,51037,@COOP,1,@COOP,2,0,0,0), -- creates item in players back pack
(@ENTRY,39996,@COOP,1,@COOP,1,0,0,0); -- cover spell (dummy)

-- The Mosswalker Savior
SET @ENTRY := 28113;
SET @SCRIPT1 := 2811301;
SET @SCRIPT2 := 2811302;
SET @SOURCETYPE := 0;
SET @SOURCETYPE2 := 9;
SET @GOSSIP := 9728;
SET @QUEST  := 12580;

-- Correct unit-flag
UPDATE `creature_template` SET `unit_flags`=33024 WHERE `entry`=@ENTRY;
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=@ENTRY;

-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@ENTRY, 0, 0, 'Please take... my shinies. All done...', 12, 0, 100, 0, 0, 0, 'Mosswalker Victim - Dead1'),
(@ENTRY, 0, 1, 'We not do anything... to them... I no understand.', 12, 0, 100, 0, 0, 0, 'Mosswalker Victim - Dead2'),
(@ENTRY, 0, 2, 'Use my shinies... make weather good again... make undead things go away.', 12, 0, 100, 0, 0, 0, 'Mosswalker Victim - Dead3'),
(@ENTRY, 0, 3, 'We gave shinies to shrine... we not greedy... why this happen?', 12, 0, 100, 0, 0, 0, 'Mosswalker Victim - Dead4'),
(@ENTRY, 0, 4, 'I do something bad? I sorry...', 12, 0, 100, 0, 0, 0, 'Mosswalker Victim - Dead5'),
(@ENTRY, 1, 0, 'We saved. You nice, dryskin.', 12, 0, 100, 0, 0, 0, 'Mosswalker Victim - Saved1'),
(@ENTRY, 1, 1, 'Maybe you make weather better too?', 12, 0, 100, 0, 0, 0, 'Mosswalker Victim - Saved2'),
(@ENTRY, 1, 2, 'You save us! Yay for you!', 12, 0, 100, 0, 0, 0, 'Mosswalker Victim - Saved3'),
(@ENTRY, 1, 3, 'Thank you! You good!', 12, 0, 100, 0, 0, 0, 'Mosswalker Victim - Saved4');

-- Condition

DELETE FROM `conditions` WHERE `SourceGroup`=@GOSSIP AND `SourceTypeOrReferenceId`=15 ;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry` , `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3` , `ErrorTextId`, `ScriptName`, `Comment`)
VALUES (15, @GOSSIP, 0 , 0, 9, @QUEST, 0 , 0, 0 , 0, 'Only show gossip 9728 when quest 12580 is added');

-- SAI
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@SCRIPT1 AND `source_type`=@SOURCETYPE2;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@SCRIPT2 AND `source_type`=@SOURCETYPE2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Random Timed_Action
(@ENTRY,@SOURCETYPE,0,0,62,0,100,0,9728,0,0,0,87,@SCRIPT1,@SCRIPT2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Random Script Start"),
(@ENTRY,@SOURCETYPE,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Close Gossip"),
-- Death
(@SCRIPT1,@SOURCETYPE2,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Script 1 - Say"),
(@SCRIPT1,@SOURCETYPE2,1,0,0,0,100,0,2000,2000,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Script 1 - Die"),
-- Live
(@SCRIPT2,@SOURCETYPE2,0,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Script 2 - Say"),
(@SCRIPT2,@SOURCETYPE2,1,0,0,0,100,0,0,0,0,0,11,52157,0,0,0,0,0,7,0,0,0,0,0,0,0,"Script 1 - Credit"),
(@SCRIPT2,@SOURCETYPE2,2,0,0,0,100,0,5000,5000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Script 1 - Despawn");

-- A hero's burden
DELETE FROM `gameobject` WHERE `id`=190777;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(198570, 190777, 571, 1, 1, 5607.33, 3790.33, -90.7351, 5.86099, 0, 0, 0, 0, 300, 0, 1);
UPDATE `creature_template` SET `ScriptName` = 'npc_artruis_the_heartless' WHERE `entry` = 28659;
DELETE FROM `creature_ai_scripts` WHERE creature_id = 28659;
/* creature_ai_scripts yg lama
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES 
(2865901, 28659, 1, 0, 100, 0, 0, 0, 0, 0, 21, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 0, 'Artruis the Heartless - Prevent Combat Movement and Set Phase to 0 on Spawn'),
(2865902, 28659, 4, 0, 100, 0, 0, 0, 0, 0, 11, 15530, 1, 0, 23, 1, 0, 0, 0, 0, 0, 0, 'Artruis the Heartless - Cast Frostbolt and Set Phase 1 on Aggro'),
(2865903, 28659, 9, 13, 100, 1, 0, 40, 3400, 4800, 11, 15530, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Artruis the Heartless - Cast Frostbolt (Phase 1)'),
(2865904, 28659, 9, 13, 100, 1, 0, 35, 7000, 9000, 11, 54261, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Artruis the Heartless - Cast Ice Lance (Phase 1)'),
(2865905, 28659, 9, 13, 100, 1, 0, 10, 14000, 18000, 11, 11831, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Artruis the Heartless - Cast Frost Nova (Phase 1)'),
(2865906, 28659, 0, 13, 100, 1, 2000, 3000, 25000, 35000, 11, 54792, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Artruis the Heartless - Cast Icy Veins (Phase 1)'),
(2865907, 28659, 3, 13, 100, 0, 7, 0, 0, 0, 21, 1, 0, 0, 23, 1, 0, 0, 0, 0, 0, 0, 'Artruis the Heartless - Start Combat Movement and Set Phase 2 when Mana is at 7% (Phase 1)'),
(2865908, 28659, 9, 13, 100, 0, 35, 80, 0, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Artruis the Heartless - Start Combat Movement at 35 Yards (Phase 1)'),
(2865909, 28659, 9, 13, 100, 0, 5, 15, 0, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Artruis the Heartless - Prevent Combat Movement at 15 Yards (Phase 1)'),
(2865910, 28659, 9, 13, 100, 0, 0, 5, 0, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Artruis the Heartless - Start Combat Movement Below 5 Yards (Phase 1)'),
(2865911, 28659, 3, 11, 100, 1, 100, 15, 100, 100, 23, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Artruis the Heartless - Set Phase 1 when Mana is above 15% (Phase 2)'),
(2865912, 28659, 2, 0, 100, 0, 30, 0, 0, 0, 22, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Artruis the Heartless - Set Phase 3 at 30% HP'),
(2865913, 28659, 2, 7, 100, 0, 30, 0, 0, 0, 11, 52185, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Artruis the Heartless - Cast Bindings of Submission at 30% HP (Phase 3)'),
(2865914, 28659, 7, 0, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Artruis the Heartless - Set Phase to 0 on Evade');
*/

DELETE FROM `creature` WHERE `Id` IN (28667,28668);
/* creature yg lama
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(202969, 28667, 571, 1, 1, 0, 0, 5616.92, 3772.68, -94.258, 1.78024, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(202970, 28668, 571, 1, 1, 0, 0, 5631.63, 3794.36, -92.2367, 3.45575, 120, 0, 0, 1, 0, 0, 0, 0, 0);
*/

-- Daily quest
SET @POOL_ENTRY :=44120; -- custom butuh 4

DELETE FROM `pool_template` WHERE `entry` IN (@POOL_ENTRY+0,@POOL_ENTRY+1,@POOL_ENTRY+2,@POOL_ENTRY+3);
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES
(@POOL_ENTRY+0,1,'Oracle Soo-nee - Oracle Dailies'),
(@POOL_ENTRY+1,1,'Oracle Soo-dow - Oracle Dailies'),
(@POOL_ENTRY+2,1,'Rejek - Frenzyheart Tribe Dailies'),
(@POOL_ENTRY+3,1,'Vekgar - Frenzyheart Tribe Dailies');

DELETE FROM `pool_quest` WHERE `entry` IN (12735,12736,12737,12726,12761,12762,12705,12758,12734,12741,12732,12703,12760,12759);
INSERT INTO `pool_quest` (`entry`,`pool_entry`,`description`) VALUES
-- ORACLE
-- Oracle Soo-nee
(12735,@POOL_ENTRY+0,'A Cleansing Song / Oracle Daily / Oracle Soo-nee'),
(12736,@POOL_ENTRY+0,'Song of Fecundity / Oracle Daily / Oracle Soo-nee'),
(12737,@POOL_ENTRY+0,'Song of Reflection / Oracle Daily / Oracle Soo-nee'),
(12726,@POOL_ENTRY+0,'Song of Wind and Water / Oracle Daily / Oracle Soo-nee'),
-- Oracle Soo-dow
(12761,@POOL_ENTRY+1,'Mastery of the Crystals / Oracle Daily / Oracle Soo-dow'),
(12762,@POOL_ENTRY+1,'Power of the Great Ones / Oracle Daily / Oracle Soo-dow'),
(12705,@POOL_ENTRY+1,'Will of the Titans / Oracle Daily / Oracle Soo-dow'),
-- FRENZYHEART TRIBE
-- Rejek
(12758,@POOL_ENTRY+2,'A Heros''s Headgear / Frenzyheart Tribe Daily / Rejek'),
(12734,@POOL_ENTRY+2,'Rejek: First Blood / Frenzyheart Tribe Daily / Rejek'),
(12741,@POOL_ENTRY+2,'Strength of the Tempest / Frenzyheart Tribe Daily / Rejek'),
(12732,@POOL_ENTRY+2,'The Heartblood''s Strength / Frenzyheart Tribe Daily / Rejek'),
-- Vekgar
(12703,@POOL_ENTRY+3,'Kartak''s Rampage / Frenzyheart Tribe Daily / Vekgar'),
(12760,@POOL_ENTRY+3,'Secret Strength of the Frenzyheart / Frenzyheart Tribe Daily / Vekgar'),
(12759,@POOL_ENTRY+3,'Tools of War / Frenzyheart Tribe Daily / Vekgar');
