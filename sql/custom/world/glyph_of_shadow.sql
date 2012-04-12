DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_pri_shadowform';
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=61792;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`Comment`) VALUES
(17,61792,1,15473,'Glyph of Shadow triggered only in Shadowform');
