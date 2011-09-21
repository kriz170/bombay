ALTER TABLE `characters` ADD COLUMN `grantableLevels` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `actionBars`;
ALTER TABLE `account` CHANGE `mutetime` `mutetime` bigint(40) NOT NULL DEFAULT 0;
