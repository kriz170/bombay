-- add script that handle reapply of glyph of shadow to spell shadowform
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_pri_shadowform';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(15473, 'spell_pri_shadowform');
