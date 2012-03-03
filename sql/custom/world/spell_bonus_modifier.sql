DELETE FROM `spell_bonus_data` WHERE `entry` IN (16614, 28715, 13897, 61840);
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES 
(16614, 0, 0, 0, 0, 'Storm Gauntlets Proc'),
(28715, 0, 0, 0, 0, 'Flame Cap Fire'),
(13897, 0, 0, 0, 0, 'Enchant Weapon - Fiery Weapon'),
(61840, 0, 0, 0, 0, 'Paladin - Righteous Vengeance');
