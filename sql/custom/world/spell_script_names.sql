-- Generic
-- Blade's edge Apexis Buffs
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_gen_apexis_buff';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(40623, 'spell_gen_apexis_buff'),
(40625, 'spell_gen_apexis_buff'),
(40626, 'spell_gen_apexis_buff');

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_gen_apexis_swiftness';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(40624, 'spell_gen_apexis_swiftness'),
(40627, 'spell_gen_apexis_swiftness'),
(40628, 'spell_gen_apexis_swiftness');

-- Pet Scaling
DELETE FROM `spell_script_names` WHERE `spell_id` IN (19591,35695,61013,61017,61697,61783);
INSERT INTO `spell_script_names` (`spell_id` ,`ScriptName`) VALUES
(19591, 'spell_gen_pet_calculate'),
(35695, 'spell_gen_pet_calculate'),
(61013, 'spell_gen_pet_calculate'),
(61017, 'spell_gen_pet_calculate'),
(61697, 'spell_gen_pet_calculate'),
(61783, 'spell_gen_pet_calculate');

DELETE FROM `creature_template_addon` WHERE `entry` = 29264;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(29264,0,0,0,1,0,'61783'); -- Spirit Wolf

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` =54566;
INSERT INTO `spell_linked_spell` (`spell_trigger` ,`spell_effect` ,`type` ,`comment`) VALUES
(54566,61697,0,'Death Knight Pet Scaling 03'); -- Risen Ghoul


-- Death Knight
-- Improved Blood Presence
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_dk_improved_blood_presence';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(-50365, 'spell_dk_improved_blood_presence');

-- Improved Unholy Presence
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_dk_improved_unholy_presence';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(-50391, 'spell_dk_improved_unholy_presence');


-- Hunter
-- Aspect of the Beast
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_hun_pet_aspect_of_the_beast';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(61669, 'spell_hun_pet_aspect_of_the_beast');


-- Paladin
-- Blessing of Kings and Sanctuary
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_pal_blessing_of_kings';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(20217, 'spell_pal_blessing_of_kings'),
(25898, 'spell_pal_blessing_of_kings'),
(72586, 'spell_pal_blessing_of_kings');

-- Righteous Defense
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_pal_righteous_defense';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(31789, 'spell_pal_righteous_defense');


-- Shaman


-- Raid and Dungeon
-- Rotface: Slime Spray
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_rotface_slime_spray';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(69507, 'spell_rotface_slime_spray'),
(71213, 'spell_rotface_slime_spray'),
(73189, 'spell_rotface_slime_spray'),
(73190, 'spell_rotface_slime_spray');


