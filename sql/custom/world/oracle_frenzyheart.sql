-- Chicken Escapee
SET @CreGuid := 250120; -- custom butuh 20
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

-- Hand of the Oracles
DELETE FROM `creature_involvedrelation` WHERE `quest`=12689;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (28667, 12689);
DELETE FROM `creature_questrelation` WHERE `quest`=12689;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (28667, 12689);

-- Frenzyheart Champion
DELETE FROM `creature_involvedrelation` WHERE `quest`=12582;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (28668, 12582);
DELETE FROM `creature_questrelation` WHERE `quest`=12582;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (28668, 12582);

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

-- Elder Harkek
-- creature_ai_scripts
/*
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES 
(2813802, 28138, 4, 0, 100, 0, 0, 0, 0, 0, 11, 33643, 1, 0, 23, 1, 0, 0, 0, 0, 0, 0, 'Elder Harkek - Cast Chain Lightning and Set Phase 1 on Aggro'),
(2813803, 28138, 9, 5, 100, 1, 0, 40, 6000, 9000, 11, 33643, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Elder Harkek - Cast Chain Lightning (Phase 1)'),
(2813804, 28138, 3, 5, 100, 0, 7, 0, 0, 0, 21, 1, 0, 0, 23, 1, 0, 0, 0, 0, 0, 0, 'Elder Harkek - Start Combat Movement and Set Phase 2 when Mana is at 7% (Phase 1)'),
(2813805, 28138, 9, 5, 100, 0, 35, 80, 0, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Elder Harkek - Start Combat Movement at 35 Yards (Phase 1)'),
(2813806, 28138, 9, 5, 100, 0, 5, 15, 0, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Elder Harkek - Prevent Combat Movement at 15 Yards (Phase 1)'),
(2813807, 28138, 9, 5, 100, 0, 0, 5, 0, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Elder Harkek - Start Combat Movement Below 5 Yards (Phase 1)'),
(2813808, 28138, 3, 3, 100, 1, 100, 15, 100, 100, 23, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Elder Harkek - Set Phase 1 when Mana is above 15% (Phase 2)'),
(2813809, 28138, 0, 0, 100, 1, 13000, 18000, 13000, 18000, 11, 52905, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Elder Harkek - Cast Thunderbolt'),
(2813810, 28138, 7, 0, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Elder Harkek - Set Phase to 0 on Evade');
*/
SET @HERKEK := 28138;
SET @GOSSIP := 9741;
SET @GOREGEK := 38619;
SET @DAJIK := 38621;
SET @ZEPIK := 38512;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@HERKEK;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id` IN (2,3);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES 
(@GOSSIP, 2, 0, 'I need to find Dajik, do you have his worn chalk?', 1, 1, 0, 0, 0, 0, ''),
(@GOSSIP, 3, 0, 'I need to find Zepik, do you have his hunting horn?', 1, 1, 0, 0, 0, 0, '');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@HERKEK;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@HERKEK AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@HERKEK, 0, 0, 0, 62, 0, 100, 0, @GOSSIP, 1, 0, 0, 56, @GOREGEK, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Elder Herkek - On Gossip Select - Give item'),
(@HERKEK, 0, 1, 0, 62, 0, 100, 0, @GOSSIP, 2, 0, 0, 56, @DAJIK, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Elder Herkek - On Gossip Select - Give item'),
(@HERKEK, 0, 2, 0, 62, 0, 100, 0, @GOSSIP, 3, 0, 0, 56, @ZEPIK, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Elder Herkek - On Gossip Select - Give item'),
(@HERKEK, 0, 3, 0, 62, 0, 100, 0, @GOSSIP, 1, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Elder Herkek - On Gossip Select - Close Gossip'),
(@HERKEK, 0, 4, 0, 62, 0, 100, 0, @GOSSIP, 2, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Elder Herkek - On Gossip Select - Close Gossip'),
(@HERKEK, 0, 5, 0, 62, 0, 100, 0, @GOSSIP, 3, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Elder Herkek - On Gossip Select - Close Gossip');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,1,0,2,@GOREGEK,1,0,1,0,'','Only show first gossip if player doesn''t have item'),
(15,@GOSSIP,2,0,2,@DAJIK,1,0,1,0,'','Only show second gossip if player doesn''t have item'),
(15,@GOSSIP,3,0,2,@ZEPIK,1,0,1,0,'','Only show third gossip if player doesn''t have item');

-- High-Oracle Soo-Say
SET @SOOSAY := 28027;
SET @GOSSIP := 9742;
SET @LAFOO := 38622;
SET @JALOOT := 38623;
SET @MOODLE := 38624;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@SOOSAY;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id` IN (1,3);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES 
(@GOSSIP, 1, 0, 'I need to find Lafoo, do you have his bug bag?', 1, 1, 0, 0, 0, 0, ''),
(@GOSSIP, 3, 0, 'I need to find Moodle, do you have his stress ball?', 1, 1, 0, 0, 0, 0, '');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@SOOSAY;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@SOOSAY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@SOOSAY, 0, 0, 0, 62, 0, 100, 0, @GOSSIP, 1, 0, 0, 56, @LAFOO, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'High-Oracle Soo-Say - On Gossip Select - Give item'),
(@SOOSAY, 0, 1, 0, 62, 0, 100, 0, @GOSSIP, 2, 0, 0, 56, @JALOOT, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'High-Oracle Soo-Say - On Gossip Select - Give item'),
(@SOOSAY, 0, 2, 0, 62, 0, 100, 0, @GOSSIP, 3, 0, 0, 56, @MOODLE, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'High-Oracle Soo-Say - On Gossip Select - Give item'),
(@SOOSAY, 0, 3, 0, 62, 0, 100, 0, @GOSSIP, 1, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High-Oracle Soo-Say - On Gossip Select - Close Gossip'),
(@SOOSAY, 0, 4, 1, 62, 0, 100, 0, @GOSSIP, 2, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High-Oracle Soo-Say - On Gossip Select - Close Gossip'),
(@SOOSAY, 0, 5, 2, 62, 0, 100, 0, @GOSSIP, 3, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High-Oracle Soo-Say - On Gossip Select - Close Gossip'),
(@SOOSAY, 0, 6, 0, 1, 0, 100, 0, 5000, 10000, 12000, 16000, 11, 53071, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'High-Oracle Soo-Say - On Gossip Select - Close Gossip');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,1,0,2,@LAFOO,1,0,1,0,'','Only show first gossip if player doesn''t have item'),
(15,@GOSSIP,2,0,2,@JALOOT,1,0,1,0,'','Only show second gossip if player doesn''t have item'),
(15,@GOSSIP,3,0,2,@MOODLE,1,0,1,0,'','Only show third gossip if player doesn''t have item');

-- Gods Like Shiny Things
SET @GUID := 199011; -- 16
DELETE FROM `gameobject` WHERE `id` IN (190558,190560,190561,190562,190563);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(@GUID, 190558, 571, 1, 1, 5839.37, 4677.29, -134.094, 5.51972, 0, 0, 0.372531, -0.92802, 300, 0, 1),
(@GUID+1, 190558, 571, 1, 1, 5655.36, 4642.14, -135.815, 5.02099, 0, 0, 0.590032, -0.80738, 300, 0, 1),
(@GUID+2, 190558, 571, 1, 1, 5704.73, 4433.04, -141.367, 5.64617, 0, 0, 0.313151, -0.949703, 300, 0, 1),
(@GUID+3, 190558, 571, 1, 1, 5652.39, 4494.46, -136.81, 1.70975, 0, 0, 0.754489, 0.656312, 300, 0, 1),
(@GUID+4, 190560, 571, 1, 1, 5867.36, 4498.38, -132.999, 5.57391, 0, 0, 0.34725, -0.937773, 300, 0, 1),
(@GUID+5, 190560, 571, 1, 1, 5427.44, 4322.03, -139.269, 5.3218, 0, 0, 0.462393, -0.886675, 300, 0, 1),
(@GUID+6, 190560, 571, 1, 1, 5522.49, 4547.63, -139.578, 0.945564, 0, 0, 0.455365, 0.890305, 300, 0, 1),
(@GUID+7, 190560, 571, 1, 1, 5745.39, 4642.14, -134.911, 0.945564, 0, 0, 0.455365, 0.890305, 300, 0, 1),
(@GUID+8, 190561, 571, 1, 1, 5791.17, 4567.29, -134.07, 3.5955, 0, 0, 0.974357, -0.225009, 300, 0, 1),
(@GUID+9, 190561, 571, 1, 1, 5696.02, 4629.07, -138.104, 3.46434, 0, 0, 0.987008, -0.160674, 300, 0, 1),
(@GUID+10, 190561, 571, 1, 1, 5725.06, 4367.69, -138.174, 5.70901, 0, 0, 0.283161, -0.959072, 300, 0, 1),
(@GUID+11, 190562, 571, 1, 1, 5565.33, 4607.29, -140.032, 5.74357, 0, 0, 0.266548, -0.963822, 300, 0, 1),
(@GUID+12, 190562, 571, 1, 1, 5805.82, 4527.46, -134.765, 6.02081, 0, 0, 0.13081, -0.991407, 300, 0, 1),
(@GUID+13, 190562, 571, 1, 1, 5677.5, 4727.92, -135.982, 0.215935, 0, 0, 0.107758, 0.994177, 300, 0, 1),
(@GUID+14, 190563, 571, 1, 1, 5907.15, 4609.28, -132.131, 4.77046, 0, 0, 0.686281, -0.727337, 300, 0, 1),
(@GUID+15, 190563, 571, 1, 1, 5489.01, 4600.46, -139.151, 3.18474, 0, 0, 0.999767, -0.0215726, 300, 0, 1);

-- Mistcaller Soo-Gan
DELETE FROM `creature` WHERE `id`=28114;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(250841, 28114, 571, 1, 1, 0, 0, 6166.91, 5093.86, -97.3677, 0.312533, 300, 0, 0, 117700, 3809, 0, 0, 0, 0);

-- The Lost Mistweaver Treasure
UPDATE `gameobject_template` SET AIName='SmartGameObjectAI' WHERE entry=190578;
DELETE FROM `smart_scripts` WHERE entryorguid=190578;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(190578,1,0,0,70,0,100,0,2,0,0,0,12,28105,1,90000,0,0,0,7,0,0,0,0,0,0,0,'Mistweaver Treasure -  Activated - Summon Warlord Tartek');
UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14 WHERE `entry`=28105;

-- The Angry Gorloc
DELETE FROM `spell_area` WHERE `spell`=54057;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES
(54057, 4297, 12578, 1, 12578, 0, 0, 2, 1);

-- Shaman Jakjek
DELETE FROM `creature` WHERE `id`=28106;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(250842, 28106, 571, 1, 1, 0, 0, 4871.15, 5910.37, -40.5266, 4.78312, 300, 0, 0, 117700, 3809, 0, 0, 0, 0);

-- Lightningcaller Soo-met
DELETE FROM `creature` WHERE `id`=28107;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(250843, 28107, 571, 1, 1, 0, 0, 5115.24, 5473.78, -92.0593, 1.71394, 300, 0, 0, 117700, 3809, 0, 0, 0, 0);

-- Song of Wind and Water
SET @HAIPHOON_W     :=28999; -- WATER
SET @HAIPHOON_A     :=28985; -- AIR
SET @STORM          :=28858; -- Storm Revenant
SET @AQUEOUS        :=28862; -- Aqueous Spirit
-- WATER SPELLS
SET @SPELL_W_1      :=61375; -- Water Bolt
SET @SPELL_W_2      :=61376; -- Frost Nova
SET @SPELL_W_3      :=52862; -- Devour Wind
SET @SPELL_W_4      :=52869; -- Evocation
-- AIR SPELLS
SET @SPELL_A_1      :=61374; -- Lightning Bolt
SET @SPELL_A_2      :=52870; -- Windshear
SET @SPELL_A_3      :=52864; -- Devour Water

UPDATE `creature_template` SET
`spell1`=@SPELL_W_1,
`spell2`=@SPELL_W_2,
`spell3`=@SPELL_W_3,
`spell4`=@SPELL_W_4,
`npcflag`=`npcflag`|16777216,
`unit_flags`=`unit_flags`|16777216,
`type_flags`=`type_flags`|2048,
`VehicleId`=257,
`AIName`='',
`exp`=2,
`minlevel`=80,
`maxlevel`=80,
`mindmg`=417,
`maxdmg`=582,
`attackpower`=608,
`minrangedmg`=341,
`maxrangedmg`=506,
`rangedattackpower`=80,
`ScriptName`='vehicle_haiphoon'
WHERE `entry`=@HAIPHOON_W;

UPDATE `creature_template` SET
`spell1`=@SPELL_A_1,
`spell2`=@SPELL_A_2,
`spell3`=@SPELL_A_3,
`spell4`=@SPELL_W_4,
`npcflag`=`npcflag`|16777216,
`unit_class`=2,
`unit_flags`=`unit_flags`|16777216,
`type_flags`=`type_flags`|2048,
`VehicleId`=257,
`AIName`='',
`exp`=2,
`minlevel`=80,
`maxlevel`=80,
`mindmg`=417,
`maxdmg`=582,
`attackpower`=608,
`minrangedmg`=341,
`maxrangedmg`=506,
`rangedattackpower`=80,
`ScriptName`='vehicle_haiphoon'
WHERE `entry`=@HAIPHOON_A;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (@HAIPHOON_W,@HAIPHOON_A);
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES
(@HAIPHOON_W,46598,12726,1,12726,1,0,0,0),
(@HAIPHOON_A,46598,12726,1,12726,1,0,0,0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry` IN (@SPELL_W_3,@SPELL_A_3);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(17,0,@SPELL_W_3,0,0,31,1,3,@STORM,0,0,63,'','Spell only target Storm Revenant'),
(17,0,@SPELL_A_3,0,0,31,1,3,@AQUEOUS,0,0,63,'','Spell only target Aqueous Spirit');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=16 AND `SourceEntry` IN (@HAIPHOON_W,@HAIPHOON_A);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(16,0,@HAIPHOON_W,0,23,4392,0,0,0,'','Ride Vehicle only in Area'),
(16,0,@HAIPHOON_A,0,23,4392,0,0,0,'','Ride Vehicle only in Area');

UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry` IN (@STORM,@AQUEOUS);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (@STORM,@AQUEOUS);
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (@STORM,@AQUEOUS);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@STORM,0,0,0,0,0,100,0,2000,4000,5000,7000,11,32018,1,0,0,0,0,2,0,0,0,0,0,0,0,'Storm Revenant - IC - Cast Call Lightning'),
(@AQUEOUS,0,0,0,0,0,100,0,6000,9000,7000,10000,11,55087,1,0,0,0,0,2,0,0,0,0,0,0,0,'Aqueous Spirit - IC - Cast Typhoon');

-- A Hero's Headgear
SET @STORMWATCHER := 28877;
SET @EXPLOSIVE := 53145;
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE `entry`=@STORMWATCHER;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@STORMWATCHER;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@STORMWATCHER;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@STORMWATCHER,0,0,0,0,0,100,0,3000,3000,5000,5000,11,32018,1,0,0,0,0,2,0,0,0,0,0,0,0,'Stormwatcher - IC - Cast Call Lightning'),
(@STORMWATCHER,0,1,0,8,0,100,1,@EXPLOSIVE,0,0,0,11,53162,2,0,0,0,0,1,0,0,0,0,0,0,0,'Stormwatcher - On Spellhit - Cast Summon Stormwatcher Head');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=@EXPLOSIVE;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(17, 0, @EXPLOSIVE, 0, 0, 36, 1, 0, 0, 0, 1, 0, '', 'Item Venture Co. Explosive can only target dead unit');

-- A Cleansing Song
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_item_chime_of_cleansing';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(52941, 'spell_item_chime_of_cleansing');

-- Rejek: First Blood
SET @SPELL := 52992;
SET @WASP := 28086;
SET @HARDKNUCKLE := 28096;
SET @WARRIOR := 28109;
SET @ORACLE := 28110;
SET @CREDIT1 := 28040;
SET @CREDIT2 := 36189;
SET @CREDIT3 := 29043;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@WASP;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@WASP;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@WASP;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@WASP,0,0,0,2,0,100,0,0,30,7000,9000,11,34392,1,0,0,0,0,1,0,0,0,0,0,0,0,'Sapphire Hive Wasp - On HP 30% - Cast Stinger Rage'),
(@WASP,0,1,0,8,0,100,1,@SPELL,0,0,0,33,@CREDIT1,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sapphire Hive Wasp - On Spellhit - Give Quest Credit');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@HARDKNUCKLE;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@HARDKNUCKLE;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@HARDKNUCKLE;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@HARDKNUCKLE,0,0,0,9,0,100,0,10,30,0,0,11,49758,1,0,0,0,0,2,0,0,0,0,0,0,0,'Hardknuckle Charger - On range - Cast Charge'),
(@HARDKNUCKLE,0,1,0,8,0,100,1,@SPELL,0,0,0,33,@CREDIT2,0,0,0,0,0,7,0,0,0,0,0,0,0,'Hardknuckle Charger - On Spellhit - Give Quest Credit');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@WARRIOR;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@WARRIOR;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@WARRIOR;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@WARRIOR,0,0,0,0,0,100,0,2000,6000,4000,7000,11,50533,1,0,0,0,0,2,0,0,0,0,0,0,0,'Mistwhisper Warrior - IC - Cast Flip Arrack'),
(@WARRIOR,0,1,0,8,0,100,1,@SPELL,0,0,0,33,@CREDIT3,0,0,0,0,0,7,0,0,0,0,0,0,0,'Mistwhisper Warrior - On Spellhit - Give Quest Credit');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ORACLE;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ORACLE;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ORACLE;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ORACLE,0,0,0,0,0,100,0,0,0,60000,60000,11,54921,1,0,0,0,0,1,0,0,0,0,0,0,0,'Mistwhisper Oracle - IC - Cast Lightning Cloud'),
(@ORACLE,0,1,0,8,0,100,1,@SPELL,0,0,0,33,@CREDIT3,0,0,0,0,0,7,0,0,0,0,0,0,0,'Mistwhisper Oracle - On Spellhit - Give Quest Credit');
