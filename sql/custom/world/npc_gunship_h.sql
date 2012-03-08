DELETE FROM `creature_template` WHERE (`entry`=77782);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (77782, 0, 0, 0, 0, 0, 30481, 30481, 30481, 30481, 'Lohnar Runetotem (1)', 'Kok\'ron Lieutenant General', '', 0, 99, 99, 0, 35, 35, 131, 31.25, 100, 1, 2, 700, 1000, 0, 5000, 1, 2, 2, 1, 2, 8, 0, 0, 0, 0, 0, 700, 1000, 5000, 10, 2, 0, 0, 0, 510, 510, 510, 510, 510, 510, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 3, 1, 500, 500, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 2, '', -1);

DELETE FROM `creature_template` WHERE (`entry`=77783);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (77783, 0, 0, 0, 0, 0, 30490, 30490, 30490, 30490, 'Lumine Eversong (3)', 'Kok\'ron Commander General', '', 0, 99, 99, 0, 35, 35, 131, 31.25, 100, 1, 2, 700, 1000, 0, 5000, 1, 2, 2, 1, 2, 8, 0, 0, 0, 0, 0, 700, 1000, 5000, 10, 2, 0, 0, 0, 510, 510, 510, 510, 510, 510, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 3, 1, 500, 500, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 2, '', -1);

SET @QuestID := 80023;
SET @Reward := 50345;
SET @Judul := 'Muradin\'s Spyglass';
SET @ItemReq := 50340;
SET @eof := 200;
SET @Entry := 77782;
SET @Nama := 'Return to Lohnar Runetotem';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80027;
SET @Reward := 51916;
SET @Judul := 'Frost Giant\'s Cleaver';
SET @ItemReq := 50787;
SET @eof := 150;
SET @Entry := 77782;
SET @Nama := 'Return to Lohnar Runetotem';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80028;
SET @Reward := 51915;
SET @Judul := 'Bone Drake\'s Enameled Boots';
SET @ItemReq := 50788;
SET @eof := 125;
SET @Entry := 77782;
SET @Nama := 'Return to Lohnar Runetotem';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80029;
SET @Reward := 51914;
SET @Judul := 'Icecrown Rampart Bracers';
SET @ItemReq := 50789;
SET @eof := 100;
SET @Entry := 77782;
SET @Nama := 'Return to Lohnar Runetotem';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80030;
SET @Reward := 51913;
SET @Judul := 'Abomination\'s Bloody Ring';
SET @ItemReq := 50790;
SET @eof := 100;
SET @Entry := 77782;
SET @Nama := 'Return to Lohnar Runetotem';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80031;
SET @Reward := 51912;
SET @Judul := 'Saronite Gargoyle Cloak.';
SET @ItemReq := 50791;
SET @eof := 100;
SET @Entry := 77782;
SET @Nama := 'Return to Lohnar Runetotem';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80032;
SET @Reward := 51911;
SET @Judul := 'Pauldrons of Lost Hope';
SET @ItemReq := 50792;
SET @eof := 125;
SET @Entry := 77782;
SET @Nama := 'Return to Lohnar Runetotem';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80033;
SET @Reward := 51910;
SET @Judul := 'Midnight Sun';
SET @ItemReq := 50793;
SET @eof := 150;
SET @Entry := 77782;
SET @Nama := 'Return to Lohnar Runetotem';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80034;
SET @Reward := 51909;
SET @Judul := 'Neverending Winter';
SET @ItemReq := 50794;
SET @eof := 150;
SET @Entry := 77782;
SET @Nama := 'Return to Lohnar Runetotem';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80035;
SET @Reward := 51908;
SET @Judul := 'Cord of Dark Suffering';
SET @ItemReq := 50795;
SET @eof := 125;
SET @Entry := 77782;
SET @Nama := 'Return to Lohnar Runetotem';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80036;
SET @Reward := 51907;
SET @Judul := 'Bracers of Pale Illumination';
SET @ItemReq := 50796;
SET @eof := 100;
SET @Entry := 77782;
SET @Nama := 'Return to Lohnar Runetotem';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80037;
SET @Reward := 51906;
SET @Judul := 'Ice-Reinforced Vrykul Helm';
SET @ItemReq := 50797;
SET @eof := 125;
SET @Entry := 77782;
SET @Nama := 'Return to Lohnar Runetotem';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80011;
SET @Reward := 50653;
SET @Judul := 'Shadowvault Slayer\'s Cloak';
SET @ItemReq := 49998;
SET @eof := 100;
SET @Entry := 77783;
SET @Nama := 'Return to Lumine Eversong';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80012;
SET @Reward := 50657;
SET @Judul := 'Skeleton Lord\'s Circle';
SET @ItemReq := 49999;
SET @eof := 100;
SET @Entry := 77783;
SET @Nama := 'Return to Lumine Eversong';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80013;
SET @Reward := 50655;
SET @Judul := 'Scourge Hunter\'s Vambraces';
SET @ItemReq := 50000;
SET @eof := 100;
SET @Entry := 77783;
SET @Nama := 'Return to Lumine Eversong';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80014;
SET @Reward := 50656;
SET @Judul := 'Ikfirus\'s Sack of Wonder';
SET @ItemReq := 50001;
SET @eof := 125;
SET @Entry := 77783;
SET @Nama := 'Return to Lumine Eversong';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80015;
SET @Reward := 50659;
SET @Judul := 'Polar Bear Claw Bracers';
SET @ItemReq := 50002;
SET @eof := 100;
SET @Entry := 77783;
SET @Nama := 'Return to Lumine Eversong';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80016;
SET @Reward := 50660;
SET @Judul := 'Boneguard Commander\'s Pauldrons';
SET @ItemReq := 50003;
SET @eof := 125;
SET @Entry := 77783;
SET @Nama := 'Return to Lumine Eversong';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80017;
SET @Reward := 50658;
SET @Judul := 'Amulet of the Silent Eulogy';
SET @ItemReq := 50005;
SET @eof := 100;
SET @Entry := 77783;
SET @Nama := 'Return to Lumine Eversong';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80018;
SET @Reward := 50661;
SET @Judul := 'Corp\'rethar Ceremonial Crown';
SET @ItemReq := 50006;
SET @eof := 125;
SET @Entry := 77783;
SET @Nama := 'Return to Lumine Eversong';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80019;
SET @Reward := 50664;
SET @Judul := 'Ring of Rapid Ascent';
SET @ItemReq := 50008;
SET @eof := 100;
SET @Entry := 77783;
SET @Nama := 'Return to Lumine Eversong';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80020;
SET @Reward := 50665;
SET @Judul := 'Boots of Unnatural Growth';
SET @ItemReq := 50009;
SET @eof := 125;
SET @Entry := 77783;
SET @Nama := 'Return to Lumine Eversong';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80021;
SET @Reward := 50667;
SET @Judul := 'Waistband of Righteous Fury';
SET @ItemReq := 50010;
SET @eof := 125;
SET @Entry := 77783;
SET @Nama := 'Return to Lumine Eversong';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80022;
SET @Reward := 50663;
SET @Judul := 'Gunship Captain\'s Mittens';
SET @ItemReq := 50011;
SET @eof := 125;
SET @Entry := 77783;
SET @Nama := 'Return to Lumine Eversong';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80024;
SET @Reward := 50349;
SET @Judul := 'Corpse Tongue Coin';
SET @ItemReq := 50352;
SET @eof := 200;
SET @Entry := 77783;
SET @Nama := 'Return to Lumine Eversong';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80025;
SET @Reward := 50366;
SET @Judul := 'Althor\'s Abacus';
SET @ItemReq := 50359;
SET @eof := 200;
SET @Entry := 77783;
SET @Nama := 'Return to Lumine Eversong';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID); 

SET @QuestID := 80026;
SET @Reward := 50654;
SET @Judul := 'Scourgeborne Waraxe';
SET @ItemReq := 50411;
SET @eof := 150;
SET @Entry := 77783;
SET @Nama := 'Return to Lumine Eversong';

DELETE FROM `quest_template` WHERE `id` = @QuestID;
INSERT INTO `quest_template` (
`id`, `method`, `level`, `minlevel`, `maxlevel`, `ZoneOrSort`, `RewardHonorMultiplier`, `RewardOrRequiredMoney`,`flags`,`specialflags`,
`RewardItemId1`, `RewardItemCount1`, `Title`, `Details`, `OfferRewardText`, `RequestItemsText`, `RequiredItemId1`,`RequiredItemCount1`, `RequiredItemId2`, `RequiredItemCount2`,
`Objectives`, `ObjectiveText1`, `CompletedText`, `WDBVerified`) VALUES
(@QuestID, 2, 80, 80, 80, 4522, 0, 0, 0, 1, @Reward, 1, @Judul, 'Greetings $C!$BLooks like your journey to defeat The Lich King in His Strongest form is near. I can help you upgrade some of your equipment. Just give me the item and some Emblem to show your dedication.$BNow go $N, may your journey be safe!', 'Here is your upgraded item, good luck on your journey', 'Where\'s the item $C', @ItemReq, 1, 49426, @eof, 
'Bring me the item and some Emblem of Frost', 'Bring me the item and some Emblem of Frost', @Nama, -1);

DELETE FROM `creature_questrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);
DELETE FROM `creature_involvedrelation` WHERE `quest` = @QuestID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@Entry, @QuestID);




-- add condition to quest
SET @QuestID := 80011;
SET @FT10 := 4530;
SET @FT25 := 4597;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) AND `ConditionTypeOrReference` = 17 AND `ConditionValue1` IN (@FT10, @FT25);
-- show quest
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`COMMENT`) VALUES
(19,0,@QuestID,0,17,@FT25,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+1,0,17,@FT25,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+2,0,17,@FT25,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+3,0,17,@FT25,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+4,0,17,@FT25,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+5,0,17,@FT25,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+6,0,17,@FT25,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+7,0,17,@FT25,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+8,0,17,@FT25,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+9,0,17,@FT25,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+10,0,17,@FT25,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+11,0,17,@FT25,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+12,0,17,@FT10,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+13,0,17,@FT25,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+14,0,17,@FT25,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+15,0,17,@FT25,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+16,0,17,@FT10,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+17,0,17,@FT10,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+18,0,17,@FT10,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+19,0,17,@FT10,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+20,0,17,@FT10,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+21,0,17,@FT10,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+22,0,17,@FT10,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+23,0,17,@FT10,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+24,0,17,@FT10,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+25,0,17,@FT10,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement"),
(19,0,@QuestID+26,0,17,@FT10,0,0,0,'',"Quest can only be taken if player has The Frozen Throne Achievement");

-- Showing quest mark
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`COMMENT`) VALUES
(20,0,@QuestID,0,17,@FT25,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+1,0,17,@FT25,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+2,0,17,@FT25,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+3,0,17,@FT25,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+4,0,17,@FT25,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+5,0,17,@FT25,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+6,0,17,@FT25,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+7,0,17,@FT25,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+8,0,17,@FT25,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+9,0,17,@FT25,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+10,0,17,@FT25,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+11,0,17,@FT25,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+12,0,17,@FT10,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+13,0,17,@FT25,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+14,0,17,@FT25,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+15,0,17,@FT25,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+16,0,17,@FT10,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+17,0,17,@FT10,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+18,0,17,@FT10,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+19,0,17,@FT10,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+20,0,17,@FT10,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+21,0,17,@FT10,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+22,0,17,@FT10,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+23,0,17,@FT10,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+24,0,17,@FT10,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+25,0,17,@FT10,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement"),
(20,0,@QuestID+26,0,17,@FT10,0,0,0,'',"Quest mark can only be seen if player has The Frozen Throne Achievement");
