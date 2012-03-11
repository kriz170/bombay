-- immunity valkyr shadowguard
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` | 
1|          -- charm
2|          -- disorient
4|          -- disarm
8|          -- distract
16|         -- fear
32|         -- grip
64|         -- root
256|        -- silence
512|        -- sleep
8192|       -- knockout
131072|     -- banish
524288|     -- shackle
4194304     -- turn
where `entry` IN (36609,39120,39121,39122);
