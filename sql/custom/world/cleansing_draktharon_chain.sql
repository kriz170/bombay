
-- Cleansing Drak'tharon Chain Quest

-- Truce?
SET @ENTRY := 26423; -- Drakuru
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 1, 62, 0, 100, 0, 9615, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Drakuru - On Gossip Select - Close Gossip'),
(@ENTRY, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 85, 50016, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Drakuru - On Gossip Select - Give kill credit');

-- Summon Drakuru script
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_item_drakuru_s_elixir';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(47110,'spell_item_drakuru_s_elixir');

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_item_drakuru_s_elixir_enduring';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(50440,'spell_item_drakuru_s_elixir_enduring');

-- Set Item to drop without player having quest (seems items didn't drop at all if item has negative chance)
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`= ABS(`ChanceOrQuestChance`) WHERE `item` IN (35799,35836,36743,36758,38303);

-- Set npcflag to Questgiver and Inhabit to 4 so Image of Drakuru appear hovering
UPDATE `creature_template` SET `npcflag`=2, `InhabitType`=4 WHERE `entry` IN (26500,26543,26701,26787);

-- Spawn Image of Drakuru in respective place
SET @GUID := 251151;
DELETE FROM `creature` WHERE `id` IN (26500,26543,26701,26787,28016);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(@GUID, 26500, 571, 1, 1, 0, 0, 3386.06, -1804.76, 115.708, 4.92044, 300, 0, 0, 42, 0, 0, 0, 0, 0),
(@GUID+1, 26543, 571, 1, 1, 0, 0, 4243.92, -2025.03, 238.718, 1.41495, 300, 0, 0, 6986, 0, 0, 0, 0, 0),
(@GUID+2, 26701, 571, 1, 1, 0, 0, 4523.85, -3472.94, 229.432, 0.752238, 300, 0, 0, 6986, 0, 0, 0, 0, 0),
(@GUID+3, 26787, 571, 1, 1, 0, 0, 4599.71, -4876.96, 49.5228, 0.682949, 300, 0, 0, 6986, 0, 0, 0, 0, 0);

-- Add invisibility aura
DELETE FROM `creature_addon` WHERE `guid` BETWEEN @GUID AND @GUID+3;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(@GUID, 0, 0, 0, 0, 0, '47119'),
(@GUID+1, 0, 0, 0, 0, 0, '47119'),
(@GUID+2, 0, 0, 0, 0, 0, '47119'),
(@GUID+3, 0, 0, 0, 0, 0, '47119');

-- Summon Spellfocus for Drakuru's Elixir in Drak'tharon Keep
SET @GOGUID := 199331;
DELETE FROM `gameobject` WHERE `guid` > 190000 AND `id`=300188;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(@GOGUID, 300188, 600, 3, 1, -236.766, -614.774, 116.487, 1.5708, 0, 0, 0, 1, 180, 0, 1);

-- Fix quest start
DELETE FROM `creature_questrelation` WHERE `id` IN (26500,26543,26701,26787);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES 
(26500, 12007), -- Sacrifice Must be Made
(26543, 12042), -- Heart of the Ancients
(26701, 12068), -- Voices From the Dust
(26787, 12238); -- Cleansing Drak'Tharon

-- Fix quest end
DELETE FROM `creature_involvedrelation` WHERE `id` IN (26500,26543,26701,26787);
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES 
(26500, 11991), -- Subject to Interpretation
(26543, 12007), -- Sacrifice Must be Made
(26701, 12802), -- My Heart is in Your Hands
(26787, 12068); -- Voices From the Dust

-- Remove Envision Drakuru buff at each quest start
UPDATE `quest_template` SET `StartScript`=12007 WHERE `Id`=12007;
UPDATE `quest_template` SET `StartScript`=12042 WHERE `Id`=12042;
UPDATE `quest_template` SET `StartScript`=12068 WHERE `Id`=12068;
UPDATE `quest_template` SET `StartScript`=12238 WHERE `Id`=12238;

DELETE FROM `quest_start_scripts` WHERE `id` In (12007,12042,12068,12238);
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES 
(12007, 0, 14, 47118, 0, 0, 0, 0, 0, 0),
(12042, 0, 14, 47150, 0, 0, 0, 0, 0, 0),
(12068, 0, 14, 47317, 0, 0, 0, 0, 0, 0),
(12238, 0, 14, 47406, 0, 0, 0, 0, 0, 0);

-- Drakuru's Elixir Recovery
SET @ELIXIR := 35797;
SET @SPELL := 50021;
SET @DRAKURU := 26423;
SET @GOSSIP := 9615;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@DRAKURU;

DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=1;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES 
(@GOSSIP, 1, 0, 'I''ve lost your Elixir, can you give me another one?', 1, 1, 0, 0, 0, 0, '');

DELETE FROM `smart_scripts` WHERE `entryorguid`=@DRAKURU AND `source_type`=0 AND `id` IN (2,3);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@DRAKURU, 0, 2, 3, 62, 0, 100, 0, @GOSSIP, 1, 0, 0, 11, @SPELL, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Drakuru - On Gossip Select - Cast Spell Replace Drakuru''s Elixir'),
(@DRAKURU, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Drakuru - On Gossip Select - Close Gossip');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP AND `SourceEntry`=1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,1,0,2,@ELIXIR,1,1,1,0,'','Only show gossip if player doesn''t have Drakuru''s Elixir'),
(15,@GOSSIP,1,0,8,11991,0,0,0,0,'','Only show gossip if player already finished quest Subject to Interpretation'),
(15,@GOSSIP,1,0,8,12238,0,0,1,0,'','Only show gossip if player hasn''t finished quest Cleansing Drak''Tharon');

-- Seer of Zeb'Halak SAI
SET @ENTRY := 188458;
SET @GOSSIP := 9426;
SET @SPELL := 47293;
SET @EYE := 35806;
UPDATE `gameobject_template` SET AIName='SmartGameObjectAI' WHERE entry=@ENTRY;

DELETE FROM `smart_scripts` WHERE entryorguid=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 1, 0, 1, 62, 0, 100, 0, @GOSSIP, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Seer of Zeb''Halak - On Gossip Select - Close Gossip'),
(@ENTRY, 1, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 86, @SPELL, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Seer of Zeb''Halak - On Gossip Select - Invoker selfcast Create Eye of the Prophets');

DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES 
(@GOSSIP, 0, 0, 'Remove the Eye of the Prophets from the idol''s face', 1, 1, 0, 0, 0, 0, '');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,0,0,2,@EYE,1,1,1,0,'','Only show gossip if player doesn''t have Eye of the Prophets'),
(15,@GOSSIP,0,0,9,12007,0,0,0,0,'','Only show gossip if player has quest Sacrifices Must be Made'),
(15,@GOSSIP,0,0,29,27615,30,0,1,0,'','Only show gossip if not near Scourge Deathspeaker');


-- Drak'Tharon Event
SET @DRAKURU := 28016;
DELETE FROM `creature_text` WHERE `entry`=@DRAKURU;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@DRAKURU,0,0, 'Ahh, back in Drak''Tharon at last!',12,0,100,4,0,14006, 'Drakuru - Drak''Tharon Keep Event'),
(@DRAKURU,1,0, '%s casts his gaze down on Drak''Tharon Keep.',16,0,100,0,0,0, 'Drakuru - Drak''Tharon Keep Event'),
(@DRAKURU,2,0, 'You done well, mon...',12,0,100,0,0,14007, 'Drakuru - Drak''Tharon Keep Event'),
(@DRAKURU,3,0, 'You surpassed my greatest hopes.',12,0,100,0,0,14008, 'Drakuru - Drak''Tharon Keep Event'),
(@DRAKURU,4,0, 'For your efforts, you be getting da greatest rewards....',12,0,100,0,0,14009, 'Drakuru - Drak''Tharon Keep Event'),
(@DRAKURU,5,0, 'Revelation!',12,0,100,0,0,14010, 'Drakuru - Drak''Tharon Keep Event'),
(@DRAKURU,6,0, 'Be still, friend, and behold da truth of things!',12,0,100,0,0,14011, 'Drakuru - Drak''Tharon Keep Event'),
(@DRAKURU,7,0, 'Master, my mission be complete.',12,0,100,0,0,14012, 'Drakuru - Drak''Tharon Keep Event'),
(@DRAKURU,8,0, 'With da help of these mortals, dis region been cleansed of all who oppose us.',12,0,100,0,0,14013, 'Drakuru - Drak''Tharon Keep Event'),
(@DRAKURU,9,0, 'As you wish, master.',12,0,100,0,0,14014, 'Drakuru - Drak''Tharon Keep Event'),
(@DRAKURU,10,0, 'Forgive my deception, mon. It all been for your own good.',12,0,100,0,0,14015, 'Drakuru - Drak''Tharon Keep Event'),
(@DRAKURU,11,0, 'Ya needed ta prove yer worthiness....',12,0,100,0,0,14016, 'Drakuru - Drak''Tharon Keep Event'),
(@DRAKURU,12,0, 'I be needin'' worthy underlings in Zul''Drak, mon. Ones ready to wield real power.',12,0,100,0,0,14017, 'Drakuru - Drak''Tharon Keep Event'),
(@DRAKURU,13,0, 'You see for yourself now. Da Lich King be generous to dem who obey.',12,0,100,0,0,14018, 'Drakuru - Drak''Tharon Keep Event'),
(@DRAKURU,14,0, 'Follow dis path, mon, and soon you be tastin'' immortality!',12,0,100,0,0,14019, 'Drakuru - Drak''Tharon Keep Event');

SET @LICHKING := 28498;
DELETE FROM `creature_text` WHERE `entry`=@LICHKING;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@LICHKING,0,0, 'You have done well, Drakuru.',12,0,100,4,0,14749, 'The Lich King - Drak''Tharon Keep Event'),
(@LICHKING,1,0, 'Your betrayal of the Drakkari Empire has borne me a new army.',12,0,100,0,0,14750, 'The Lich King - Drak''Tharon Keep Event'),
(@LICHKING,2,0, 'Your army....',12,0,100,0,0,14751, 'The Lich King - Drak''Tharon Keep Event'),
(@LICHKING,3,0, 'Arise, and accept my gift.',12,0,100,0,0,14752, 'The Lich King - Drak''Tharon Keep Event'),
(@LICHKING,4,0, 'I charge you now with the cleansing of Zul''Drak, Drakuru.',12,0,100,0,0,14753, 'The Lich King - Drak''Tharon Keep Event'),
(@LICHKING,5,0, 'Fail me and it shall be your undoing...',12,0,100,0,0,14754, 'The Lich King - Drak''Tharon Keep Event'),
(@LICHKING,6,0, 'Succeed and even greater power shall be yours!',12,0,100,0,0,14755, 'The Lich King - Drak''Tharon Keep Event');

SET @GOSSIP := 53107;
UPDATE `creature_template` SET `gossip_menu_id`=@GOSSIP, `npcflag`=`npcflag`|1, `ScriptName`='npc_drakuru_draktharon' WHERE `entry`=28016;
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=13265;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES 
(@GOSSIP, 13265);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=51825;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 1, 51825, 0, 0, 31, 0, 3, @DRAKURU, 0, 0, 0, '', 'Arthas Scourge Drakuru Only target Drakuru');
