SET @ArcherEntry  := 14489;
SET @ErisEntry    := 14494;
SET @PeasantEntry := 14484;
SET @ErisGUID     := 251010;

-- spawn Eris
DELETE FROM `creature` WHERE `id` = @ErisEntry;
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES 
(@ErisGUID, @ErisEntry, 0, 3325.712646, -2995.190918, 164.270721, 0.121896);

-- stealth Eris and peasant (can only be seen if wearing eye of divinity)
DELETE FROM `creature_template_addon` WHERE `entry`= @ErisEntry;
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES (@ErisEntry, '32648');
DELETE FROM `creature_template_addon` WHERE `entry`= @PeasantEntry;
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES (@PeasantEntry, '32648');

-- update involved creatures
UPDATE `creature_template` SET `ScriptName` = 'npc_fleeing_peasant', `RegenHealth` = 0 WHERE `entry` = @PeasantEntry;
UPDATE `creature_template` SET `ScriptName` = 'npc_eris_havenfire', `AIName` = '' WHERE `entry` = @ErisEntry;
UPDATE `creature_template` SET `AIName` = 'ArcherAI', `equipment_id` = 14489 WHERE `entry` = @ArcherEntry;

-- hand out weapons
DELETE FROM `creature_equip_template` WHERE `entry` = @ArcherEntry;
INSERT INTO `creature_equip_template` VALUES (@ArcherEntry, 0, 0, 11304);

-- texts
DELETE FROM `creature_text` WHERE `entry` IN (@PeasantEntry, @ErisEntry);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(@PeasantEntry, 0, 0, 'The Scourge is upon us! Run! Run for your lives!', 14, 0, 100, 0, 0, 0, 'Injured Peasant in Quest Balance of Light and Shadow'),
(@PeasantEntry, 0, 1, 'Please help us! The Prince has gone mad!', 14, 0, 100, 0, 0, 0, 'Injured Peasant in Quest Balance of Light and Shadow'),
(@PeasantEntry, 0, 2, 'Seek sanctuary in Hearthglen! It is our only hope!', 14, 0, 100, 0, 0, 0, 'Injured Peasant in Quest Balance of Light and Shadow'),
(@PeasantEntry, 1, 0, 'The power of the light is truly great and merciful.', 12, 0, 100, 4, 0, 0, 'Injured Peasant in Quest Balance of Light and Shadow'),
(@PeasantEntry, 1, 1, 'We shall be reunited once more, my love...', 12, 0, 100, 4, 0, 0, 'Injured Peasant in Quest Balance of Light and Shadow'),
(@PeasantEntry, 1, 2, 'At last, it ends...', 12, 0, 100, 4, 0, 0, 'Injured Peasant in Quest Balance of Light and Shadow'),
(@PeasantEntry, 1, 3, 'Stranger, find the fallen Prince Menethil and end his reign of terror.', 12, 0, 100, 4, 0, 0, 'Injured Peasant in Quest Balance of Light and Shadow'),
(@PeasantEntry, 2, 0, 'Death take me! I cannot go on! I have nothing left...', 12, 0, 100, 0, 0, 0, 'Injured Peasant in Quest Balance of Light and Shadow'),
(@PeasantEntry, 2, 1, 'I won''t make it... go... go on without me...', 12, 0, 100, 0, 0, 0, 'Injured Peasant in Quest Balance of Light and Shadow'),
(@PeasantEntry, 3, 0, 'Should I live through this, I shall make it my live''s sole ambition to destroy Arthas...', 12, 0, 100, 0, 0, 0, 'Injured Peasant in Quest Balance of Light and Shadow'),
(@PeasantEntry, 3, 1, 'The pain is unbearable!', 12, 0, 100, 0, 0, 0, 'Injured Peasant in Quest Balance of Light and Shadow'),
(@ErisEntry, 0, 0, 'Be healed!', 14, 0, 100, 0, 0, 0, 'Eris Havenfire in Quest Balance of Light and Shadow'),
(@ErisEntry, 1, 0, 'We are saved! The peasants have escaped the Scourge!', 14, 0, 100, 0, 0, 0, 'Eris Havenfire in Quest Balance of Light and Shadow'),
(@ErisEntry, 2, 0, 'I have failed once more...', 14, 0, 100, 0, 0, 0, 'Eris Havenfire in Quest Balance of Light and Shadow'),
(@ErisEntry, 3, 0, 'I now return to whence I came, only to find myself here once more to relive the same epic tragedy.', 12, 0, 100, 18, 0, 0, 'Eris Havenfire in Quest Balance of Light and Shadow');
