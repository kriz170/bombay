/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2006-2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

/* ScriptData
SDName: Eastern_Plaguelands
SD%Complete: 100
SDComment: Quest support: 5211, 5742. Special vendor Augustus the Touched
SDCategory: Eastern Plaguelands
EndScriptData */

/* ContentData
mobs_ghoul_flayer
npc_augustus_the_touched
npc_darrowshire_spirit
npc_tirion_fordring
EndContentData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "Player.h"

class mobs_ghoul_flayer : public CreatureScript
{
public:
    mobs_ghoul_flayer() : CreatureScript("mobs_ghoul_flayer") { }

    struct mobs_ghoul_flayerAI : public ScriptedAI
    {
        mobs_ghoul_flayerAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset() {}

        void EnterCombat(Unit* /*who*/) {}

        void JustDied(Unit* killer)
        {
            if (killer->GetTypeId() == TYPEID_PLAYER)
                me->SummonCreature(11064, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN, 60000);
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mobs_ghoul_flayerAI (creature);
    }
};

/*######
## npc_augustus_the_touched
######*/

class npc_augustus_the_touched : public CreatureScript
{
public:
    npc_augustus_the_touched() : CreatureScript("npc_augustus_the_touched") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        if (action == GOSSIP_ACTION_TRADE)
            player->GetSession()->SendListInventory(creature->GetGUID());
        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (creature->isVendor() && player->GetQuestRewardStatus(6164))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_TEXT_BROWSE_GOODS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);

        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }
};

/*######
## npc_darrowshire_spirit
######*/

#define SPELL_SPIRIT_SPAWNIN    17321

class npc_darrowshire_spirit : public CreatureScript
{
public:
    npc_darrowshire_spirit() : CreatureScript("npc_darrowshire_spirit") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        player->SEND_GOSSIP_MENU(3873, creature->GetGUID());
        player->TalkedToCreature(creature->GetEntry(), creature->GetGUID());
        creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        return true;
    }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_darrowshire_spiritAI (creature);
    }

    struct npc_darrowshire_spiritAI : public ScriptedAI
    {
        npc_darrowshire_spiritAI(Creature* creature) : ScriptedAI(creature) {}

        void Reset()
        {
            DoCast(me, SPELL_SPIRIT_SPAWNIN);
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        }

        void EnterCombat(Unit* /*who*/) {}
    };
};

/*######
## npc_tirion_fordring
######*/

#define GOSSIP_HELLO    "I am ready to hear your tale, Tirion."
#define GOSSIP_SELECT1  "Thank you, Tirion.  What of your identity?"
#define GOSSIP_SELECT2  "That is terrible."
#define GOSSIP_SELECT3  "I will, Tirion."

class npc_tirion_fordring : public CreatureScript
{
public:
    npc_tirion_fordring() : CreatureScript("npc_tirion_fordring") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        switch (action)
        {
            case GOSSIP_ACTION_INFO_DEF+1:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SELECT1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
                player->SEND_GOSSIP_MENU(4493, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+2:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SELECT2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
                player->SEND_GOSSIP_MENU(4494, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+3:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SELECT3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
                player->SEND_GOSSIP_MENU(4495, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+4:
                player->CLOSE_GOSSIP_MENU();
                player->AreaExploredOrEventHappens(5742);
                break;
        }
        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (player->GetQuestStatus(5742) == QUEST_STATUS_INCOMPLETE && player->getStandState() == UNIT_STAND_STATE_SIT)
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());

        return true;
    }
};

/*######
## npc_eris_heavenfire
######*/

enum BalanceOfLightAndShadow
{
    SPELL_BLESSING_OF_NORDRASSIL        = 23108,
    SPELL_DEATH_DOOR                    = 23127,
    SPELL_EYE_OF_DIVINITY               = 23101,

    NPC_ERIS_HAVENFIRE                  = 14494, 
    NPC_INJURED_PEASANT                 = 14484,
    // NPC_PLAGUED_PEASANT               = 14485,
    NPC_SCOURGE_ARCHER                  = 14489,
    NPC_SCOURGE_FOOTSOLDIER             = 14486,

    QUEST_BALANCE_OF_LIGHT_AND_SHADOW   = 7622
};

enum BalanceOfLightAndShadowText
{
    SAY_PEASANT_SPAWN                   = 0,    // "The Scourge is upon us! Run! Run for your lives!"
                                                // "Please help us! The Prince has gone mad!"
                                                // "Seek sanctuary in Hearthglen! It is our only hope!"

    SAY_PEASANT_SAVED                   = 1,    // "The power of the light is truly great and merciful."
                                                // "We shall be reunited once more, my love..."
                                                // "At last, it ends..."
                                                // "Stranger, find the fallen Prince Menethil and end his reign of terror."

    SAY_PEASANT_DEATH                   = 2,    // "Death take me! I cannot go on! I have nothing left..."
                                                // "I won't make it... go... go on without me..."

    SAY_PEASANT_WALK                    = 3,    // "Should I live through this, I shall make it my live's sole ambition to destroy Arthas..."
                                                // "The pain is unbearable!"

    SAY_ERIS_EMPOWER                    = 0,    // "Be healed!"
    SAY_ERIS_COMPLETE                   = 1,    // "We are saved! The peasants have escaped the Scourge!"
    SAY_ERIS_FAIL_1                     = 2,    // "I have failed once more..."
    SAY_ERIS_FAIL_2                     = 3,    // "I now return to whence I came, only to find myself here once more to relive the same epic tragedy."
};

float bolas_coords[13][4] =
{
    // Peasant Spawn Rectangle UpperLeft
    {3350.240234f, -3049.189941f, 164.775314f, 2.03f},
    // Peasant Spawn Rectangle LowerRight
    {3368.810059f, -3053.790039f, 166.264008f, 0.0f},
    // Peasant Destination Area Center
    {3330.746826f, -2974.629150f, 160.388611f, 0.0f},
    // Footsoldiers
    {3347.603271f, -3045.536377f, 164.029877f, 1.814429f},
    {3363.609131f, -3037.187256f, 163.541885f, 2.277649f},
    {3349.105469f, -3056.500977f, 168.079468f, 1.857460f},
    // Archer
    {3347.865234f, -3070.707275f, 177.881882f, 1.645396f},
    {3357.144287f, -3063.327637f, 172.499222f, 1.841747f},
    {3371.682373f, -3067.965332f, 175.233582f, 2.144123f},
    {3379.904053f, -3059.370117f, 181.981873f, 2.646778f},
    {3334.646973f, -3053.084717f, 174.101074f, 0.400536f},
    {3368.005371f, -3022.475830f, 171.617966f, 4.268625f},
    {3327.000244f, -3021.307861f, 170.578796f, 5.584163f}
};

class npc_eris_havenfire : public CreatureScript
{
public:
    npc_eris_havenfire() : CreatureScript("npc_eris_havenfire") { }

    struct npc_eris_havenfireAI : public ScriptedAI
    {
    public:
        npc_eris_havenfireAI(Creature *c) : ScriptedAI(c), _summons(me) {}

        void Reset()
        {
            me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
            me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
            _player = NULL;
            _eventActive = false;
            _soldierTimer[0] = 0;
            _soldierTimer[1] = 0;
            _soldierTimer[2] = 0;
            _waveTimer = 0;
            _waveSize  = 0;
            _waveCount = 0;
            _saveCount = 0;
            _killCount = 0;
            _archerCount = 0;
            _summons.DespawnAll();
        }

        void DoAction(const int32 action)
        {
            if (!_eventActive || !_player || !_player->IsInWorld())
            {
                _player = NULL;
                _eventActive = false;
                return;
            }

            switch (action)
            {
                case 0: _saveCount++; 
                    if (!_player->HasAuraEffect(SPELL_BLESSING_OF_NORDRASSIL, EFFECT_0))
                    {
                        me->CastSpell(me, SPELL_BLESSING_OF_NORDRASSIL, true);
                        Talk(SAY_ERIS_EMPOWER);
                    }
                    break;
                case 1: 
                    _killCount++; 
                    break;
                default:             
                    break;
            }

            if (_killCount >= 15)
            {
                // FailQuest
                Talk(SAY_ERIS_FAIL_1);
                Talk(SAY_ERIS_FAIL_2);
                _player->FailQuest(QUEST_BALANCE_OF_LIGHT_AND_SHADOW);
                _eventActive = false;
                _player = NULL;
                _summons.DespawnAll();
                me->DespawnOrUnsummon(5000);
            }
            else if (_saveCount >= 50)
            {
                // award Quest
                Talk(SAY_ERIS_COMPLETE);
                _player->CompleteQuest(QUEST_BALANCE_OF_LIGHT_AND_SHADOW);
                _eventActive = false;
                _player = NULL;
                _summons.DespawnAll();
                me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
            }
        }

        void JustSummoned(Creature* summon)
        {
            _summons.Summon(summon);
        }

        void SummonedCreatureDespawn(Creature* summon)
        {
            _summons.Despawn(summon);
        }

        void StartEvent(Player* player)
        {
            if (_eventActive)
                return;

            // init vars
            _eventActive = true;
            _soldierTimer[0] = 72000;
            _soldierTimer[1] = 72000;
            _soldierTimer[2] = 72000;
            _waveTimer = 10000;
            _waveSize  = 7;
            _waveCount = 0;
            _saveCount = 0;
            _killCount = 0;
            _archerCount = 0;
            _player = player;
            me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
            me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);

            // spawn archer
            for (uint8 i = 6; i < 13; i++)
            {
                Position pos;
                pos.m_positionX = bolas_coords[i][0];
                pos.m_positionY = bolas_coords[i][1];
                pos.m_positionZ = bolas_coords[i][2];
                pos.m_orientation = bolas_coords[i][3];
                if (_archer[_archerCount] = me->SummonCreature(NPC_SCOURGE_ARCHER, pos, TEMPSUMMON_TIMED_DESPAWN, 5*MINUTE*IN_MILLISECONDS))
                {
                    _archer[_archerCount]->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_DISABLE_MOVE);
                    _archer[_archerCount]->SetReactState(REACT_AGGRESSIVE);
                    _archer[_archerCount]->AddAura(SPELL_EYE_OF_DIVINITY, _archer[_archerCount]);  // add aura to allow it see peasant
                    _archerCount++;
                }
            }
        }

        void UpdateAI(const uint32 diff)
        {
            if (!_eventActive || !_player || !_player->IsInWorld())
            {
                _player = NULL;
                _eventActive = false;
                _summons.DespawnAll();
                return;
            }

            if (_soldierTimer[0] <= diff)
            {
                Position pos;
                pos.m_positionX = bolas_coords[3][0];
                pos.m_positionY = bolas_coords[3][1];
                pos.m_positionZ = bolas_coords[3][2];
                pos.m_orientation = bolas_coords[3][3];

                for (uint8 i = 0; (_waveCount - 1) >= i; i++)
                    if (Creature* s = me->SummonCreature(NPC_SCOURGE_FOOTSOLDIER, pos, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 70000))
                    {
                        s->getThreatManager().addThreat(_player, 10.0f);
                        s->AddAura(SPELL_EYE_OF_DIVINITY, s);
                    }

                _soldierTimer[0] = 20000 + urand(0, 20000);
            }
            else
                _soldierTimer[0] -= diff;

            if (_soldierTimer[1] <= diff)
            {
                Position pos;
                pos.m_positionX = bolas_coords[4][0];
                pos.m_positionY = bolas_coords[4][1];
                pos.m_positionZ = bolas_coords[4][2];
                pos.m_orientation = bolas_coords[4][3];

                for (uint8 i = 0; (_waveCount - 1) >= i; i++)
                    if (Creature* s = me->SummonCreature(NPC_SCOURGE_FOOTSOLDIER, pos, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 70000))
                    {
                        s->getThreatManager().addThreat(_player, 10.0f);
                        s->AddAura(SPELL_EYE_OF_DIVINITY, s);
                    }

                _soldierTimer[1] = 20000 + urand(0, 20000);
            }
            else
                _soldierTimer[1] -= diff;

            if (_soldierTimer[2] <= diff)
            {
                Position pos;
                pos.m_positionX = bolas_coords[5][0];
                pos.m_positionY = bolas_coords[5][1];
                pos.m_positionZ = bolas_coords[5][2];
                pos.m_orientation = bolas_coords[5][3];

                for (uint8 i = 0; (_waveCount - 1) >= i; i++)
                    if (Creature* s = me->SummonCreature(NPC_SCOURGE_FOOTSOLDIER, pos, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 70000))
                    {
                        s->getThreatManager().addThreat(_player, 10.0f);
                        s->AddAura(SPELL_EYE_OF_DIVINITY, s);
                    }

                _soldierTimer[2] = 20000 + urand(0, 20000);
            }
            else
                _soldierTimer[2] -= diff;

            if (_waveTimer <= diff)
            {
                // 5 wave, first wave 7 peasant, increased by 3 each wave, so total = 7+10+13+16+19 = 65
                if (_waveCount >= 5)
                    return;

                for (uint8 i = 0; i < _waveSize; ++i)
                {
                    Position pos;
                    pos.m_positionX = bolas_coords[0][0] + (bolas_coords[1][0] - bolas_coords[0][0]) * urand(0, 100) / 100.0f;
                    pos.m_positionY = bolas_coords[0][1] + (bolas_coords[1][1] - bolas_coords[0][1]) * urand(0, 100) / 100.0f;
                    pos.m_positionZ = bolas_coords[0][2];
                    pos.m_orientation = bolas_coords[0][3];
                    if (Creature* p = me->SummonCreature(NPC_INJURED_PEASANT, pos, TEMPSUMMON_MANUAL_DESPAWN, 0))
                    {
                        p->setFaction(_player->getFaction());
                        for (uint8 j = 0; j < _archerCount; j++)
                        {
                            // set threat to all archer by 100k, and randomly add more so this peasant have more threat then other
                            _archer[j]->getThreatManager().addThreat(p, 100000.0f + urand(0,20));
                        }

                        if (i == 0)
                            p->AI()->Talk(SAY_PEASANT_SPAWN);

                        if (!urand(0, 3))
                            p->CastSpell(p, SPELL_DEATH_DOOR, true);
                    }
                }
                _waveCount++;
                _waveSize+=3;
                _waveTimer = 70000;
            }
            else
                _waveTimer -= diff;
        }

    private:
        bool    _eventActive;
        uint32  _waveTimer;
        uint8   _waveCount;
        uint8   _waveSize;
        uint8   _saveCount;
        uint8   _killCount;
        uint32  _soldierTimer[3];
        Player* _player;
        SummonList _summons;
        Creature* _archer[8];
        uint8   _archerCount;
    };

    bool OnQuestAccept(Player* pPlayer, Creature* pCreature, Quest const *quest)
    {
        if (quest->GetQuestId() == QUEST_BALANCE_OF_LIGHT_AND_SHADOW)
        {
            CAST_AI(npc_eris_havenfire::npc_eris_havenfireAI, pCreature->AI())->StartEvent(pPlayer);
            
            return true;
        }
        return false;
    }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_eris_havenfireAI(pCreature);
    }
};

class npc_fleeing_peasant : public CreatureScript
{
public:
    npc_fleeing_peasant() : CreatureScript("npc_fleeing_peasant") { }

    struct npc_fleeing_peasantAI : public ScriptedAI
    {
    public:
        npc_fleeing_peasantAI(Creature *c) : ScriptedAI(c) {}

        void Reset()
        {
            _sayTimer = urand(0,60000);
            me->SetUnitMovementFlags(MOVEMENTFLAG_WALKING);
            me->SetSpeed(MOVE_WALK, 0.45f);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP_ATTACKABLE);
            me->SetReactState(REACT_PASSIVE);
            me->GetMotionMaster()->MovePoint(0, bolas_coords[2][0] + irand(-3, 3),  bolas_coords[2][1] + irand(-3, 3), bolas_coords[2][2]);
        }

        void UpdateAI(const uint32 diff)
        {
            if (_sayTimer > diff)
            {
                _sayTimer -= diff;
                return;
            }
            else
                _sayTimer = urand(40000,100000);

            Talk(SAY_PEASANT_WALK);
        }

        void MovementInform(uint32 type, uint32 point)
        {
            if (type != POINT_MOTION_TYPE && type != EFFECT_MOTION_TYPE)
                return;
            
            if (point != 0)
                return;
            
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            me->DespawnOrUnsummon(10000);
            if (!urand(0, 9))  // make it say saved with 10% chance
                Talk(SAY_PEASANT_SAVED);

            if (Creature* eris = me->FindNearestCreature(NPC_ERIS_HAVENFIRE, 100.0f))
                CAST_AI(npc_eris_havenfire::npc_eris_havenfireAI, eris->AI())->DoAction(0);
        }

        void DamageTaken(Unit* /*pKiller*/, uint32 &damage)
        {
            if (damage < me->GetHealth())
                return;

            Talk(SAY_PEASANT_DEATH);
            if (Creature* e = me->FindNearestCreature(NPC_ERIS_HAVENFIRE, 200.0f))
                e->AI()->DoAction(1);
        }

    private:
        uint16  _sayTimer;

    };

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_fleeing_peasantAI(pCreature);
    }
};

void AddSC_eastern_plaguelands()
{
    new mobs_ghoul_flayer();
    new npc_augustus_the_touched();
    new npc_darrowshire_spirit();
    new npc_tirion_fordring();
    new npc_eris_havenfire();
    new npc_fleeing_peasant();
}
