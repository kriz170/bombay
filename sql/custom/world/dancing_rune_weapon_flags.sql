-- Set Rune Weapon falg and immunity
UPDATE `creature_template` SET 
`unit_flags`=
0x00000002|                 -- UNIT_FLAG_NON_ATTACKABLE
0x00020000|                 -- UNIT_FLAG_PACIFIED / Creature will not attack
0x02000000,                 -- UNIT_FLAG_NOT_SELECTABLE / Can't be selected by mouse or with /target {name} command
`mechanic_immune_mask` =    -- not sure if need this, already untargetable and unattackable
0x00000001|                 -- charm
0x00000002|                 -- disorient
0x00000004|                 -- disarm
0x00000008|                 -- distract
0x00000010|                 -- fear
0x00000020|                 -- grip
0x00000040|                 -- root
0x00000100|                 -- silence
0x00000200|                 -- sleep
0x00000400|                 -- snare
0x00000800|                 -- stun
0x00001000|                 -- freeze
0x00002000|                 -- knockout
0x00010000|                 -- polymorph
0x00020000|                 -- banish
0x00080000|                 -- shackle
0x00400000|                 -- turn
0x00800000|                 -- horror
0x02000000|                 -- interrupt
0x04000000|                 -- daze
0x20000000                  -- sapped 
WHERE `entry`=27893;        -- Rune Weapon

-- Change ProcFlags of Dancing Rune Weapon Dummy Aura to include melee attack
DELETE FROM `spell_proc_event` WHERE `entry` = 49028;
INSERT INTO `spell_proc_event` (`entry`, `procFlags`) VALUES
(49028, 86288               -- DBC ProcFlags
| 0x4);                     -- Successful melee attack
