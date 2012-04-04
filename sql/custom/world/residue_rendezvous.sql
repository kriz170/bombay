-- Add linked spell to Gas Spore and Slime Spray
DELETE FROM `spell_linked_spell` WHERE `spell_effect` IN (72144,72145);
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES 
(69291, 72144, 1, 'Festergut: Apply Orange Blight Residue'),
(72101, 72144, 1, 'Festergut: Apply Orange Blight Residue'),
(72102, 72144, 1, 'Festergut: Apply Orange Blight Residue'),
(72103, 72144, 1, 'Festergut: Apply Orange Blight Residue'),
(69507, 72145, 1, 'Rotface: Apply Green Blight Residue'),
(71213, 72145, 1, 'Rotface: Apply Green Blight Residue'),
(73189, 72145, 1, 'Rotface: Apply Green Blight Residue'),
(73190, 72145, 1, 'Rotface: Apply Green Blight Residue');
