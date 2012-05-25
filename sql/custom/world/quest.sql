-- Drop It then Rock It!
UPDATE `creature_template` SET `ScriptName`='npc_alliance_banner' WHERE `entry`=24640;

-- It Rolls Downhill
UPDATE `creature_template` SET `spell1`=52245 WHERE `entry`=28750;

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_q12673_harvest_blight_crystal';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(52245,'spell_q12673_harvest_blight_crystal');
