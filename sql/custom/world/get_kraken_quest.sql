DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=66588;
INSERT INTO spell_linked_spell (spell_trigger, spell_effect, type, comment) VALUES
(66588, 75314, 0, 'Flaming Spear');

UPDATE `creature_template` SET AIName='SmartAI' WHERE entry='34925';
DELETE FROM `creature_ai_scripts`where creature_id='34925';
DELETE FROM `smart_scripts` WHERE entryorguid='34925';
INSERT INTO `smart_scripts` VALUES
(34925,0,0,0,0,0,100,0,6000,9000,7000,9000,11,66514,0,0,0,0,0,2,0,0,0,0,0,0,0, 'North Sea Kraken - Cast Frost Breath'),
(34925,0,1,0,8,0,100,0x1,75314,0,0,0,11,66717,2,0,0,0,0,7,0,0,0,0,0,0,0, 'North Sea Kraken - On Spell Hit - Kil Credit'),
(34925,0,2,0,8,0,100,0x1,75314,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'North Sea Kraken - On Spell Hit - Invisible'),
(34925,0,3,0,8,0,100,0x1,75314,0,0,0,41,500,0,0,0,0,0,1,0,0,0,0,0,0,0, 'North Sea Kraken - On Spell Hit - Despawn');
