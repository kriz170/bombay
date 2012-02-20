-- Lord Marrowgar           36612, 37957, 37958, 37959
-- Lady Deathwhisper        36855, 38106, 38296, 38297
-- Deathbringer Saurfang    37813, 38402, 38582, 38583
-- Festergut                36626, 37504, 37505, 37506
-- Rotface                  36627, 38390, 38549, 38550
-- Professor Putricide      36678, 38431, 38585, 38586
-- Blood Prince Valanar     37970, 38401, 38784, 38785
-- Blood Prince Taldaram    37973, 38400, 38771, 38772
-- Blood Prince Keleseth    37972, 38399, 38769, 38770
-- Blood Queen Lana'thel    37955, 38434, 38435, 38436
-- Sindragosa               36853, 38265, 38266, 38267
-- The Lich King            36597, 39166, 39167, 39168      modifier dari Trinity   150, 180, 180, 225


-- Lord Marrowgar
UPDATE `creature_template` SET `dmg_multiplier`=55 WHERE `entry`=36612;
UPDATE `creature_template` SET `dmg_multiplier`=85 WHERE `entry`=37957;
UPDATE `creature_template` SET `dmg_multiplier`=76 WHERE `entry`=37958;
UPDATE `creature_template` SET `dmg_multiplier`=100 WHERE `entry`=37959;

-- Lady Deathwhisper
UPDATE `creature_template` SET `dmg_multiplier`=45 WHERE `entry`=36855;
UPDATE `creature_template` SET `dmg_multiplier`=67 WHERE `entry`=38106;
UPDATE `creature_template` SET `dmg_multiplier`=82 WHERE `entry`=38296;
UPDATE `creature_template` SET `dmg_multiplier`=98 WHERE `entry`=38297;

-- Deathbringer Saurfang
UPDATE `creature_template` SET `dmg_multiplier`=61 WHERE `entry`=37813;
UPDATE `creature_template` SET `dmg_multiplier`=91 WHERE `entry`=38402;
UPDATE `creature_template` SET `dmg_multiplier`=91 WHERE `entry`=38582;
UPDATE `creature_template` SET `dmg_multiplier`=121 WHERE `entry`=38583;

-- Festergut
UPDATE `creature_template` SET `dmg_multiplier`=76 WHERE `entry`=36626;
UPDATE `creature_template` SET `dmg_multiplier`=115 WHERE `entry`=37504;
UPDATE `creature_template` SET `dmg_multiplier`=115 WHERE `entry`=37505;
UPDATE `creature_template` SET `dmg_multiplier`=152 WHERE `entry`=37506;

-- Rotface
UPDATE `creature_template` SET `dmg_multiplier`=68 WHERE `entry`=36627;
UPDATE `creature_template` SET `dmg_multiplier`=103 WHERE `entry`=38390;
UPDATE `creature_template` SET `dmg_multiplier`=103 WHERE `entry`=38549;
UPDATE `creature_template` SET `dmg_multiplier`=137 WHERE `entry`=38550;

-- Professor Putricide
UPDATE `creature_template` SET `dmg_multiplier`=61 WHERE `entry`=36678;
UPDATE `creature_template` SET `dmg_multiplier`=91 WHERE `entry`=38431;
UPDATE `creature_template` SET `dmg_multiplier`=91 WHERE `entry`=38585;
UPDATE `creature_template` SET `dmg_multiplier`=121 WHERE `entry`=38586;

-- Blood Prince Council
UPDATE `creature_template` SET `dmg_multiplier`=64 WHERE `entry` IN (37970, 37973, 37972);
UPDATE `creature_template` SET `dmg_multiplier`=96 WHERE `entry` IN (38401, 38400, 38399);
UPDATE `creature_template` SET `dmg_multiplier`=96 WHERE `entry` IN (38784, 38771, 38769);
UPDATE `creature_template` SET `dmg_multiplier`=128 WHERE `entry` IN (38785, 38772, 38770);

-- Blood Queen Lana'thel
UPDATE `creature_template` SET `dmg_multiplier`=61 WHERE `entry`=37955;
UPDATE `creature_template` SET `dmg_multiplier`=91 WHERE `entry`=38434;
UPDATE `creature_template` SET `dmg_multiplier`=91 WHERE `entry`=38435;
UPDATE `creature_template` SET `dmg_multiplier`=121 WHERE `entry`=38436;

-- Sindragosa
UPDATE `creature_template` SET `dmg_multiplier`=61 WHERE `entry`=36853;
UPDATE `creature_template` SET `dmg_multiplier`=91 WHERE `entry`=38265;
UPDATE `creature_template` SET `dmg_multiplier`=91 WHERE `entry`=38266;
UPDATE `creature_template` SET `dmg_multiplier`=121 WHERE `entry`=38267;
-- fix damage for sindra 10
UPDATE `creature_template` SET `mindmg`=509, `maxdmg`=683, `attackpower`=805 WHERE `entry`=36853;
