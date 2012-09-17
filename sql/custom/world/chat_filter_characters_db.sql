DROP TABLE IF EXISTS `chat_filter`;
CREATE TABLE `chat_filter`
(
    `id` int(2) NOT NULL,
    `word` CHAR(64) NOT NULL,
    `punishment` int(10) UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
);

-- These columns are used when a player logs out while being frozen or stuned.
ALTER TABLE `characters`.`characters`
    ADD COLUMN `FreezeTimer` int(10) UNSIGNED NOT NULL DEFAULT 0 AFTER `deleteDate`,
    ADD COLUMN `StunTimer` int(10) UNSIGNED NOT NULL DEFAULT 0 AFTER `FreezeTimer`;

DELETE FROM `chat_filter`;
INSERT INTO `chat_filter` (`id`,`word`,`punishment`) VALUES 
    (1 ,'anjing', 256),
    (2 ,'babi', 256), 
    (3 ,'goblok', 256),
    (4 ,'goblog', 256),
    (5 ,'kunyuk', 256), 
    (6 ,'koplok', 256), 
    (7 ,'bangsat', 256),
    (8 ,'dungu', 256), 
    (9 ,'tolol', 256), 
    (10 ,'anjink', 256), 
    (11 ,'anjenk', 256), 
    (12 ,'anjeng', 256), 
    (13 ,'babik', 256), 
    (14 ,'ndlogok', 256), 
    (15 ,'ngentot', 256), 
    (16 ,'peler', 256), 
    (17 ,'pelir', 256), 
    (18 ,'pler', 256),
    (19 ,'plir', 256), 
    (20 ,'kuontol', 256), 
    (21 ,'kwontol', 256), 
    (22 ,'kontol', 256), 
    (23 ,'kontil', 256), 
    (24 ,'jembut', 256), 
    (25 ,'gamblis', 256), 
    (26 ,'asu', 256), 
    (27 ,'bajing', 256), 
    (28 ,'bajingan', 256), 
    (29 ,'lonte', 256), 
    (30 ,'perek', 256), 
    (31 ,'penis', 256), 
    (32 ,'memek', 256), 
    (33 ,'meki', 256), 
    (34 ,'jancok', 256), 
    (35 ,'cuki', 256), 
    (36 ,'cukimai', 256), 
    (37 ,'cukimay', 256), 
    (38 ,'puki', 256), 
    (39 ,'pukimai', 256), 
    (40 ,'pukimay', 256), 
    (41 ,'pukimak', 256), 
    (42 ,'pentil', 256), 
    (43 ,'toket', 256), 
    (44 ,'toked', 256), 
    (45 ,'tempek', 256), 
    (46 ,'tempik', 256), 
    (47 ,'bawok', 256), 
    (48 ,'bawuk', 256), 
    (49 ,'itil', 256);
