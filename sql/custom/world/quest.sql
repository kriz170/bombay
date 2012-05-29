-- Drop It then Rock It!
UPDATE `creature_template` SET `ScriptName`='npc_alliance_banner' WHERE `entry`=24640;

-- It Rolls Downhill
UPDATE `creature_template` SET `spell1`=52245 WHERE `entry`=28750;

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_q12673_harvest_blight_crystal';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(52245,'spell_q12673_harvest_blight_crystal');


-- Dun-da-Dun-tah!
SET @JONES := 26814;
UPDATE `creature_template` SET `movementId` = 1, `ScriptName` = 'npc_harrison_jones_grizzly' WHERE `entry` = @JONES;

-- Set cage default state to closed 
UPDATE `gameobject` SET `state`=1 WHERE `guid`=56996;

-- Set Firewall default state to open
UPDATE `gameobject` SET `state`=0 WHERE `guid`=57572;

DELETE FROM `script_waypoint` WHERE `entry` = @JONES;
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) VALUES 
(@JONES, 0, 4905.26, -4758.71, 27.2164, 1000, 'attacks cage'),
(@JONES, 1, 4905.26, -4758.71, 27.2164, 1000, 'cage opens, SAY_START'),
(@JONES, 2, 4890.98, -4757.92, 27.2335, 0, ''),
(@JONES, 3, 4877.41, -4774.58, 32.637, 0, ''),
(@JONES, 4, 4875.63, -4791.3, 32.5217, 0, ''),
(@JONES, 5, 4878.52, -4793.99, 32.5499, 2000, 'stops in doorway, SAY_PROGRESS1'),
(@JONES, 6, 4878.52, -4793.99, 32.5499, 1000, 'same place in doorway, SAY_PROGRESS2'),
(@JONES, 7, 4900.44, -4797.86, 32.03, 0, ''),
(@JONES, 8, 4909.79, -4797.88, 32.5042, 1000, 'starts to open cage'),
(@JONES, 9, 4909.79, -4797.88, 32.5042, 3000, 'opens cage and frees Adarrah, SAY_PROGRESS3'),
(@JONES, 10, 4906.8, -4807.83, 32.0298, 0, ''),
(@JONES, 11, 4913.22, -4819.77, 32.5437, 0, ''),
(@JONES, 12, 4914.76, -4823.18, 32.6616, 0, ''),
(@JONES, 13, 4915.02, -4823.18, 32.6652, 3000, 'faces skulls, gets skull mace'),
(@JONES, 14, 4915.02, -4823.18, 32.6652, 1000, 'gets skull mace'),
(@JONES, 15, 4914.76, -4823.18, 32.6616, 0, ''),
(@JONES, 16, 4914.65, -4823.63, 32.6671, 3000, 'hit gong #1 (shake effect w sound)'),
(@JONES, 17, 4914.65, -4823.63, 32.6671, 3000, 'hit gong #2 (shake effect w sound)'),
(@JONES, 18, 4909.02, -4821.31, 32.5451, 2000, 'SAY_PROGRESS4'),
(@JONES, 19, 4909.02, -4821.31, 32.5451, 0, 'SAY_PROGRESS5'),
(@JONES, 20, 4892.89, -4813.42, 32.03, 0, ''),
(@JONES, 21, 4887.82, -4806.41, 32.03, 0, 'trigger firewall'),
(@JONES, 22, 4882.28, -4797.32, 32.5667, 0, 'run to next point, SAY_PROGRESS6'),
(@JONES, 23, 4898.74, -4805.55, 32.03, 0, ''),
(@JONES, 24, 4898.89, -4805.58, 32.03, 2000, 'SAY_PROGRESS7'),
(@JONES, 25, 4898.89, -4805.58, 32.03, 2000, 'SAY_PROGRESS8'),
(@JONES, 26, 4901.92, -4811.97, 32.03, 1000, 'fight starts'),
(@JONES, 27, 4898.74, -4805.55, 32.03, 0, 'trigger firewall off, run'),
(@JONES, 28, 4898.89, -4805.58, 32.03, 1000, 'turn around, run'),
(@JONES, 29, 4882.28, -4797.32, 32.5667, 0, 'run'),
(@JONES, 30, 4878.52, -4793.99, 32.5499, 0, 'doorway, run'),
(@JONES, 31, 4853.52, -4773.15, 32.6154, 0, 'run'),
(@JONES, 32, 4831.21, -4775.22, 32.5801, 0, 'run'),
(@JONES, 33, 4815.01, -4793.45, 25.4664, 0, 'run'),
(@JONES, 34, 4827.08, -4833.01, 25.4769, 0, 'run'),
(@JONES, 35, 4826.14, -4842.38, 25.4626, 0, 'run'),
(@JONES, 36, 4820.56, -4850.16, 25.5829, 0, 'run'),
(@JONES, 37, 4803.6, -4851.59, 25.5179, 0, 'run'),
(@JONES, 38, 4769.98, -4847.95, 25.435, 0, 'run'),
(@JONES, 39, 4759.69, -4857.29, 25.6366, 0, 'run'),
(@JONES, 40, 4717.45, -4857.82, 25.5643, 0, 'run'),
(@JONES, 41, 4714.35, -4858.35, 24.4264, 0, 'run'),
(@JONES, 42, 4673.73, -4862.99, 35.4791, 0, 'run'),
(@JONES, 43, 4659.69, -4886.81, 35.4792, 0, 'run'),
(@JONES, 44, 4658.12, -4907.92, 38.943, 0, 'run'),
(@JONES, 45, 4651, -4918.92, 45.4803, 0, 'run'),
(@JONES, 46, 4655.67, -4924.23, 46.6822, 0, 'run'),
(@JONES, 47, 4668.25, -4946.23, 47.9926, 0, 'run'),
(@JONES, 48, 4673.43, -4964.86, 47.8694, 3000, 'SAY_END1'),
(@JONES, 49, 4678.11, -4970.68, 47.2748, 0, 'fadeout');

DELETE FROM `creature_text` WHERE `entry`=@JONES;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@JONES,0,0, 'Alright kid. Stay behind me and you''ll be fine.',12,0,100,0,0,0, 'Harrison Jones - Dun-da-Dun-tah! Escort - Start'),
(@JONES,1,0, 'Their ceremonial chamber, where I was to be sacrified...',12,0,100,0,0,0, 'Harrison Jones - Dun-da-Dun-tah! Escort - Progress 1'),
(@JONES,2,0, 'Time to put and end to all this!',12,0,100,0,0,0, 'Harrison Jones - Dun-da-Dun-tah! Escort - Progress 2'),
(@JONES,3,0, 'You''re free to go, miss.',12,0,100,0,0,0, 'Harrison Jones - Dun-da-Dun-tah! Escort - Progress 3'),
(@JONES,4,0, 'Odd. That usually does it.',12,0,100,0,0,0, 'Harrison Jones - Dun-da-Dun-tah! Escort - Progress 4'),
(@JONES,5,0, 'Just as well. I''ve had enough of this place.',12,0,100,0,0,0, 'Harrison Jones - Dun-da-Dun-tah! Escort - Progress 5'),
(@JONES,6,0, 'What''s this?!',12,0,100,0,0,0, 'Harrison Jones - Dun-da-Dun-tah! Escort - Progress 6'),
(@JONES,7,0, 'Aww, not a snake!',12,0,100,0,0,0, 'Harrison Jones - Dun-da-Dun-tah! Escort - Progress 7'),
(@JONES,8,0, 'Listen, kid. I can handle this thing. You just watch my back!',12,0,100,0,0,0, 'Harrison Jones - Dun-da-Dun-tah! Escort - Progress 8'),
(@JONES,9,0, 'See ya ''round, kid!',12,0,100,0,0,0, 'Harrison Jones - Dun-da-Dun-tah! Escort - End');

SET @ADARRAH := 24405;
UPDATE `creature_template` SET `movementId`=1, `AIName`='SmartAI' WHERE entry=@ADARRAH;
DELETE FROM `waypoints` WHERE `entry` = @ADARRAH;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@ADARRAH, 1, 4912.77, -4797.77, 32.6449, 'cheers'),
(@ADARRAH, 2, 4910.22, -4799.89, 32.5134, 'SAY_START, emote Kiss,run'),
(@ADARRAH, 3, 4894.57, -4799.14, 32.0299, 'run'),
(@ADARRAH, 4, 4878.59, -4794.06, 32.5528, 'run'),
(@ADARRAH, 5, 4843.63, -4778.44, 32.6107, 'fadeout');

DELETE FROM `creature_text` WHERE `entry`=@ADARRAH;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ADARRAH,0,0, 'Thank you!',12,0,100,0,0,0, 'Adarrah - Dun-da-Dun-tah! Escort');

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ADARRAH AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@ADARRAH, 0, 0, 1, 38, 0, 100, 0, 1, 1, 0, 0, 53, 0, @ADARRAH, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Adarrah - On Data 1 1 - Start Waypoint'),
(@ADARRAH, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 5, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Adarrah - On Data 1 1 - Play Emote Cheer'),
(@ADARRAH, 0, 2, 0, 40, 0, 100, 0, 1, @ADARRAH, 0, 0, 54, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Adarrah - On Waypoint 1 Reached - Pause 1 second'),
(@ADARRAH, 0, 3, 4, 40, 0, 100, 0, 2, @ADARRAH, 0, 0, 54, 2000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Adarrah - On Waypoint 2 Reached - Pause 2 second'),
(@ADARRAH, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Adarrah - On Waypoint 2 Reached - Play Emote Kiss'),
(@ADARRAH, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 5, 17, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Adarrah - On Waypoint 2 Reached - Say text 0'),
(@ADARRAH, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 59, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Adarrah - On Waypoint 2 Reached - Set Run'),
(@ADARRAH, 0, 7, 0, 40, 0, 100, 0, 5, @ADARRAH, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Adarrah - On Waypoint 5 Reached - Despawn after 1 second');

SET @TECAHUNA := 26865;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@TECAHUNA;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@TECAHUNA;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@TECAHUNA AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@TECAHUNA, 0, 0, 1, 63, 0, 100, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tecahuna - On created - Prevent Combat Movement'),
(@TECAHUNA, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tecahuna - On created - Set Phase 0'),
(@TECAHUNA, 0, 2, 3, 4, 0, 100, 0, 0, 0, 0, 0, 11, 47629, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Tecahuna - On Aggro - Cast Tecahuna Venom Spit'),
(@TECAHUNA, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tecahuna - On Aggro - Set Phase 1'),
(@TECAHUNA, 0, 4, 0, 9, 1, 100, 0, 0, 45, 5000, 7000, 11, 47629, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Tecahuna - On Phase 1 Invoker in range 45 yard - Cast Tecahuna Venom Spit'),
(@TECAHUNA, 0, 5, 5, 3, 1, 100, 0, 0, 7, 0, 0, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tecahuna - On Phase 1 mana below 7% - Start Combat Movement'),
(@TECAHUNA, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tecahuna - On Phase 1 mana below 7% - Set Phase 2'),
(@TECAHUNA, 0, 7, 0, 9, 1, 100, 0, 40, 80, 0, 0, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tecahuna - On Phase 1 Invoker range between 40 and 80 yards - Start Combat Movement'),
(@TECAHUNA, 0, 8, 0, 9, 1, 100, 0, 5, 15, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tecahuna - On Phase 1 Invoker range between 5 and 15 yards - Stop Combat Movement'),
(@TECAHUNA, 0, 9, 0, 9, 1, 100, 0, 0, 5, 0, 0, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tecahuna - On Phase 1 Invoker range below 5 yards - Start Combat Movement'),
(@TECAHUNA, 0, 10, 0, 3, 2, 100, 0, 15, 100, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tecahuna - On Phase 2 mana above 15% - Set Phase 1'),
(@TECAHUNA, 0, 11, 0, 7, 0, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tecahuna - On Evade - Set Phase 0'),
(@TECAHUNA, 0, 12, 13, 0, 0, 100, 0, 10000, 15000, 10000, 15000, 11, 47602, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tecahuna - In Combat - Cast Summon Ancient Drakkari King'),
(@TECAHUNA, 0, 13, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 47602, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tecahuna - In Combat - Cast Summon Ancient Drakkari King again');

SET @ANCIENTKING := 26871;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ANCIENTKING;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ANCIENTKING;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ANCIENTKING AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@ANCIENTKING, 0, 0, 0, 63, 0, 100, 0, 0, 0, 0, 0, 2, 16, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ancient Drakkari King - On Created - Set Faction 16'),
(@ANCIENTKING, 0, 1, 0, 0, 0, 100, 0, 3000, 5000, 5000, 7000, 11, 52466, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Ancient Drakkari King - In Combat - Cast Drakkari Curse');



-- Sabotage
SET @BUNNY := 28780;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry`=@BUNNY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@BUNNY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@BUNNY,0,0,1,54,0,100,0,0,0,0,0,11,52324,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Explosive Charges Bunny - On Summoned - Cast Scourgewagon Explosion'),
(@BUNNY,0,1,2,61,0,100,0,0,0,0,0,11,52325,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Explosive Charges Bunny - On Summoned - Cast Explode Scourgewagon:Roller'),
(@BUNNY,0,2,3,61,0,100,0,0,0,0,0,11,52330,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Explosive Charges Bunny - On Summoned - Cast Explode Scourgewagon:Grill'),
(@BUNNY,0,3,4,61,0,100,0,0,0,0,0,11,52329,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Explosive Charges Bunny - On Summoned - Cast Explode Scourgewagon:Frame'),
(@BUNNY,0,4,5,61,0,100,0,0,0,0,0,11,52332,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Explosive Charges Bunny - On Summoned - Cast Explode Scourgewagon:Wheel'),
(@BUNNY,0,5,0,61,0,100,0,0,0,0,0,33,28777,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Explosive Charges Bunny - On Summoned - Give Kill Credit');

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_q12676_scourgewagon_explosion';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(52324,'spell_q12676_scourgewagon_explosion');
