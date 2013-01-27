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
