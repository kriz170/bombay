Set @ChanceN := 25; -- default -38, klo ada negative berarti cmn yg punya quest yg bisa liat
Set @ChanceH := 35; -- default -68

UPDATE FROM creature_loot_template set `ChanceOrQuestChance`=@ChanceN WHERE `entry` IN (38106, 37957, 37504, 38390, 38431, 38401, 38434, 38265, 39166);
UPDATE FROM gameobject_loot_template set `ChanceOrQuestChance`=@ChanceN WHERE `entry` IN (28074, 28082);

UPDATE FROM creature_loot_template set `ChanceOrQuestChance`=@ChanceH WHERE `entry` IN (38297, 37959, 37506, 38550, 38586, 38785, 38436, 38267, 39168);
UPDATE FROM gameobject_loot_template set `ChanceOrQuestChance`=@ChanceH WHERE `entry` IN (28088, 28096);
