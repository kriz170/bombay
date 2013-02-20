-- 20271 - Judgement
DELETE FROM `spell_script_names` WHERE `spell_id`=20271;
INSERT INTO `spell_script_names` VALUES
(20271,'spell_pal_judgement');

-- Remove Judgement of the Wise proc
DELETE FROM `spell_proc_event` WHERE `entry`=31878;

-- Judgement of the Bold proc
DELETE FROM `spell_proc_event` WHERE `entry`=89901;
INSERT INTO `spell_proc_event` VALUES
(89901,0,10,8388608,0,0,0,262144,0,0,0);

-- 89906 - Judgements of the Bold 
DELETE FROM `spell_script_names` WHERE `spell_id`=89906;
INSERT INTO `spell_script_names` VALUES
(89906,'spell_pal_judgements_of_the_bold');

-- 53600 - Shield of the Righteous
-- Delete old (wotlk) scaling
DELETE FROM `spell_bonus_data` WHERE `entry`=53600;

DELETE FROM `spell_script_names` WHERE `spell_id`=53600;
INSERT INTO `spell_script_names` VALUES
(53600,'spell_pal_shield_of_the_righteous');

-- Grand Crusader
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_pal_grand_crusader';
INSERT INTO `spell_script_names` VALUES
(85416,'spell_pal_grand_crusader');

-- Grand Crusader can only be activated by Crusader Strike or Hammer of the Righteous
DELETE FROM `spell_proc_event` WHERE `entry` IN (75806, 85043);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES 
(75806, 0, 10, 0, 294912, 0, 16, 0, 0, 0, 0),
(85043, 0, 10, 0, 294912, 0, 16, 0, 0, 0, 0);

-- Infusion of Light proc
DELETE FROM `spell_proc_event` WHERE `entry` IN (53569, 53576);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES 
(53569, 0, 10, 2097152, 65536, 0, 0, 2, 0, 0, 0),
(53576, 0, 10, 2097152, 65536, 0, 0, 2, 0, 0, 0);

-- Daybreak proc
DELETE FROM `spell_proc_event` WHERE `entry` IN (88820,88821);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES 
(88820, 0, 10, 3221225472, 0, 1024, 0, 0, 0, 0, 0),
(88821, 0, 10, 3221225472, 0, 1024, 0, 0, 0, 0, 0);

-- 84963 - Inquisiton
DELETE FROM `spell_script_names` WHERE `spell_id`=84963;
INSERT INTO `spell_script_names` VALUES
(84963,'spell_pal_inquisiton');

-- Enlightened Judgement proc
DELETE FROM `spell_proc_event` WHERE `entry` IN (53556,53557);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES 
(53556, 0, 10, 8388608, 0, 0, 0, 0, 0, 0, 0),
(53557, 0, 10, 8388608, 0, 0, 0, 0, 0, 0, 0);

-- 85495 - Speed of Light
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_pal_speed_of_light';
INSERT INTO `spell_script_names` VALUES
(85495,'spell_pal_speed_of_light'),
(85498,'spell_pal_speed_of_light'),
(85499,'spell_pal_speed_of_light');
-- Proc
DELETE FROM `spell_proc_event` WHERE `entry` IN (85495,85498,85499);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES 
(85495, 0, 10, 0x00400000, 0, 0, 0, 0x10000, 0, 0, 0),
(85498, 0, 10, 0x00400000, 0, 0, 0, 0x10000, 0, 0, 0),
(85499, 0, 10, 0x00400000, 0, 0, 0, 0x10000, 0, 0, 0);
