export P_DamageFeedback
code
proc P_DamageFeedback 36 12
file "../g_active.c"
line 37
;1:/*
;2:===========================================================================
;3:Copyright (C) 1999-2005 Id Software, Inc.
;4:
;5:This file is part of Quake III Arena source code.
;6:
;7:Quake III Arena source code is free software; you can redistribute it
;8:and/or modify it under the terms of the GNU General Public License as
;9:published by the Free Software Foundation; either version 2 of the License,
;10:or (at your option) any later version.
;11:
;12:Quake III Arena source code is distributed in the hope that it will be
;13:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;14:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;15:GNU General Public License for more details.
;16:
;17:You should have received a copy of the GNU General Public License
;18:along with Foobar; if not, write to the Free Software
;19:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;20:===========================================================================
;21:*/
;22://
;23:
;24:#include "g_local.h"
;25:
;26:
;27:/*
;28:===============
;29:G_DamageFeedback
;30:
;31:Called just before a snapshot is sent to the given player.
;32:Totals up all damage and generates both the player_state_t
;33:damage values to that client for pain blends and kicks, and
;34:global pain sound events for all clients.
;35:===============
;36:*/
;37:void P_DamageFeedback( gentity_t *player ) {
line 42
;38:	gclient_t	*client;
;39:	float	count;
;40:	vec3_t	angles;
;41:
;42:	client = player->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 43
;43:	if ( client->ps.pm_type == PM_DEAD ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $53
line 44
;44:		return;
ADDRGP4 $52
JUMPV
LABELV $53
line 48
;45:	}
;46:
;47:	// total points of damage shot at the player this frame
;48:	count = client->damage_blood + client->damage_armor;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 49
;49:	if ( count == 0 ) {
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $55
line 50
;50:		return;		// didn't take any damage
ADDRGP4 $52
JUMPV
LABELV $55
line 53
;51:	}
;52:
;53:	if ( count > 255 ) {
ADDRLP4 4
INDIRF4
CNSTF4 1132396544
LEF4 $57
line 54
;54:		count = 255;
ADDRLP4 4
CNSTF4 1132396544
ASGNF4
line 55
;55:	}
LABELV $57
line 61
;56:
;57:	// send the information to the client
;58:
;59:	// world damage (falling, slime, etc) uses a special code
;60:	// to make the blend blob centered instead of positional
;61:	if ( client->damage_fromWorld ) {
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
EQI4 $59
line 62
;62:		client->ps.damagePitch = 255;
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
CNSTI4 255
ASGNI4
line 63
;63:		client->ps.damageYaw = 255;
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
CNSTI4 255
ASGNI4
line 65
;64:
;65:		client->damage_fromWorld = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
CNSTI4 0
ASGNI4
line 66
;66:	} else {
ADDRGP4 $60
JUMPV
LABELV $59
line 67
;67:		vectoangles( client->damage_from, angles );
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 68
;68:		client->ps.damagePitch = angles[PITCH]/360.0 * 256;
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
CNSTF4 1132462080
ADDRLP4 8
INDIRF4
CNSTF4 1135869952
DIVF4
MULF4
CVFI4 4
ASGNI4
line 69
;69:		client->ps.damageYaw = angles[YAW]/360.0 * 256;
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
CNSTF4 1132462080
ADDRLP4 8+4
INDIRF4
CNSTF4 1135869952
DIVF4
MULF4
CVFI4 4
ASGNI4
line 70
;70:	}
LABELV $60
line 73
;71:
;72:	// play an apropriate pain sound
;73:	if ( (level.time > player->pain_debounce_time) && !(player->flags & FL_GODMODE) ) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 720
ADDP4
INDIRI4
LEI4 $62
ADDRLP4 24
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $62
line 74
;74:		player->pain_debounce_time = level.time + 700;
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 700
ADDI4
ASGNI4
line 75
;75:		G_AddEvent( player, EV_PAIN, player->health );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 56
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 76
;76:		client->ps.damageEvent++;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 77
;77:	}
LABELV $62
line 80
;78:
;79:
;80:	client->ps.damageCount = count;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 85
;81:
;82:	//
;83:	// clear totals
;84:	//
;85:	client->damage_blood = 0;
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
CNSTI4 0
ASGNI4
line 86
;86:	client->damage_armor = 0;
ADDRLP4 0
INDIRP4
CNSTI4 788
ADDP4
CNSTI4 0
ASGNI4
line 87
;87:	client->damage_knockback = 0;
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
CNSTI4 0
ASGNI4
line 88
;88:}
LABELV $52
endproc P_DamageFeedback 36 12
export P_WorldEffects
proc P_WorldEffects 40 32
line 99
;89:
;90:
;91:
;92:/*
;93:=============
;94:P_WorldEffects
;95:
;96:Check for lava / slime contents and drowning
;97:=============
;98:*/
;99:void P_WorldEffects( gentity_t *ent ) {
line 103
;100:	qboolean	envirosuit;
;101:	int			waterlevel;
;102:
;103:	if ( ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
EQI4 $67
line 104
;104:		ent->client->airOutTime = level.time + 12000;	// don't need air
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 856
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 105
;105:		return;
ADDRGP4 $66
JUMPV
LABELV $67
line 108
;106:	}
;107:
;108:	waterlevel = ent->waterlevel;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRI4
ASGNI4
line 110
;109:
;110:	envirosuit = ent->client->ps.powerups[PW_BATTLESUIT] > level.time;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 320
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $72
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $73
JUMPV
LABELV $72
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $73
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 115
;111:
;112:	//
;113:	// check for drowning
;114:	//
;115:	if ( waterlevel == 3 ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $74
line 117
;116:		// envirosuit give air
;117:		if ( envirosuit ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $76
line 118
;118:			ent->client->airOutTime = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 856
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 119
;119:		}
LABELV $76
line 122
;120:
;121:		// if out of air, start drowning
;122:		if ( ent->client->airOutTime < level.time) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $75
line 124
;123:			// drown!
;124:			ent->client->airOutTime += 1000;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 856
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 125
;125:			if ( ent->health > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
LEI4 $75
line 127
;126:				// take more damage the longer underwater
;127:				ent->damage += 2;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 128
;128:				if (ent->damage > 15)
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 15
LEI4 $84
line 129
;129:					ent->damage = 15;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 15
ASGNI4
LABELV $84
line 132
;130:
;131:				// play a gurp sound instead of a normal pain sound
;132:				if (ent->health <= ent->damage) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
GTI4 $86
line 133
;133:					G_Sound(ent, CHAN_VOICE, G_SoundIndex("*drown.wav"));
ADDRGP4 $88
ARGP4
ADDRLP4 24
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 134
;134:				} else if (rand()&1) {
ADDRGP4 $87
JUMPV
LABELV $86
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $89
line 135
;135:					G_Sound(ent, CHAN_VOICE, G_SoundIndex("sound/player/gurp1.wav"));
ADDRGP4 $91
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 136
;136:				} else {
ADDRGP4 $90
JUMPV
LABELV $89
line 137
;137:					G_Sound(ent, CHAN_VOICE, G_SoundIndex("sound/player/gurp2.wav"));
ADDRGP4 $92
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 138
;138:				}
LABELV $90
LABELV $87
line 141
;139:
;140:				// don't play a normal pain sound
;141:				ent->pain_debounce_time = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 143
;142:
;143:				G_Damage (ent, NULL, NULL, NULL, NULL, 
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
CNSTP4 0
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
CNSTP4 0
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 14
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 145
;144:					ent->damage, DAMAGE_NO_ARMOR, MOD_WATER);
;145:			}
line 146
;146:		}
line 147
;147:	} else {
ADDRGP4 $75
JUMPV
LABELV $74
line 148
;148:		ent->client->airOutTime = level.time + 12000;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 856
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 149
;149:		ent->damage = 2;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 2
ASGNI4
line 150
;150:	}
LABELV $75
line 155
;151:
;152:	//
;153:	// check for sizzle damage (move to pmove?)
;154:	//
;155:	if (waterlevel && 
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $95
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 24
BANDI4
ADDRLP4 12
INDIRI4
EQI4 $95
line 156
;156:		(ent->watertype&(CONTENTS_LAVA|CONTENTS_SLIME)) ) {
line 157
;157:		if (ent->health > 0
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
LEI4 $97
ADDRLP4 16
INDIRP4
CNSTI4 720
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GTI4 $97
line 158
;158:			&& ent->pain_debounce_time <= level.time	) {
line 160
;159:
;160:			if ( envirosuit ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $100
line 161
;161:				G_AddEvent( ent, EV_POWERUP_BATTLESUIT, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 62
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 162
;162:			} else {
ADDRGP4 $101
JUMPV
LABELV $100
line 163
;163:				if (ent->watertype & CONTENTS_LAVA) {
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $102
line 164
;164:					G_Damage (ent, NULL, NULL, NULL, NULL, 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
CNSTP4 0
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
CNSTP4 0
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 30
ADDRLP4 0
INDIRI4
MULI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 166
;165:						30*waterlevel, 0, MOD_LAVA);
;166:				}
LABELV $102
line 168
;167:
;168:				if (ent->watertype & CONTENTS_SLIME) {
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $104
line 169
;169:					G_Damage (ent, NULL, NULL, NULL, NULL, 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
CNSTP4 0
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
CNSTP4 0
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 10
ADDRLP4 0
INDIRI4
MULI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 15
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 171
;170:						10*waterlevel, 0, MOD_SLIME);
;171:				}
LABELV $104
line 172
;172:			}
LABELV $101
line 173
;173:		}
LABELV $97
line 174
;174:	}
LABELV $95
line 175
;175:}
LABELV $66
endproc P_WorldEffects 40 32
export G_SetClientSound
proc G_SetClientSound 8 0
line 184
;176:
;177:
;178:
;179:/*
;180:===============
;181:G_SetClientSound
;182:===============
;183:*/
;184:void G_SetClientSound( gentity_t *ent ) {
line 191
;185:#ifdef MISSIONPACK
;186:	if( ent->s.eFlags & EF_TICKING ) {
;187:		ent->client->ps.loopSound = G_SoundIndex( "sound/weapons/proxmine/wstbtick.wav");
;188:	}
;189:	else
;190:#endif
;191:	if (ent->waterlevel && (ent->watertype&(CONTENTS_LAVA|CONTENTS_SLIME)) ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $107
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 24
BANDI4
ADDRLP4 4
INDIRI4
EQI4 $107
line 192
;192:		ent->client->ps.loopSound = level.snd_fry;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 level+348
INDIRI4
ASGNI4
line 193
;193:	} else {
ADDRGP4 $108
JUMPV
LABELV $107
line 194
;194:		ent->client->ps.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 444
ADDP4
CNSTI4 0
ASGNI4
line 195
;195:	}
LABELV $108
line 196
;196:}
LABELV $106
endproc G_SetClientSound 8 0
export ClientImpacts
proc ClientImpacts 76 12
line 207
;197:
;198:
;199:
;200://==============================================================
;201:
;202:/*
;203:==============
;204:ClientImpacts
;205:==============
;206:*/
;207:void ClientImpacts( gentity_t *ent, pmove_t *pm ) {
line 212
;208:	int		i, j;
;209:	trace_t	trace;
;210:	gentity_t	*other;
;211:
;212:	memset( &trace, 0, sizeof( trace ) );
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 213
;213:	for (i=0 ; i<pm->numtouch ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $114
JUMPV
LABELV $111
line 214
;214:		for (j=0 ; j<i ; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $118
JUMPV
LABELV $115
line 215
;215:			if (pm->touchents[j] == pm->touchents[i] ) {
ADDRLP4 68
CNSTI4 2
ASGNI4
ADDRLP4 72
ADDRFP4 4
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
LSHI4
ADDRLP4 72
INDIRP4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDRLP4 68
INDIRI4
LSHI4
ADDRLP4 72
INDIRP4
ADDP4
INDIRI4
NEI4 $119
line 216
;216:				break;
ADDRGP4 $117
JUMPV
LABELV $119
line 218
;217:			}
;218:		}
LABELV $116
line 214
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $118
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $115
LABELV $117
line 219
;219:		if (j != i) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $121
line 220
;220:			continue;	// duplicated
ADDRGP4 $112
JUMPV
LABELV $121
line 222
;221:		}
;222:		other = &g_entities[ pm->touchents[i] ];
ADDRLP4 8
CNSTI4 808
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 52
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 224
;223:
;224:		if ( ( ent->r.svFlags & SVF_BOT ) && ( ent->touch ) ) {
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $123
ADDRLP4 68
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $123
line 225
;225:			ent->touch( ent, other, &trace );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CALLV
pop
line 226
;226:		}
LABELV $123
line 228
;227:
;228:		if ( !other->touch ) {
ADDRLP4 8
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $125
line 229
;229:			continue;
ADDRGP4 $112
JUMPV
LABELV $125
line 232
;230:		}
;231:
;232:		other->touch( other, ent, &trace );
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CALLV
pop
line 233
;233:	}
LABELV $112
line 213
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $114
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
LTI4 $111
line 235
;234:
;235:}
LABELV $110
endproc ClientImpacts 76 12
data
align 4
LABELV $128
byte 4 1109393408
byte 4 1109393408
byte 4 1112539136
export G_TouchTriggers
code
proc G_TouchTriggers 4240 16
line 245
;236:
;237:/*
;238:============
;239:G_TouchTriggers
;240:
;241:Find all trigger entities that ent's current position touches.
;242:Spectators will only interact with teleporters.
;243:============
;244:*/
;245:void	G_TouchTriggers( gentity_t *ent ) {
line 253
;246:	int			i, num;
;247:	int			touch[MAX_GENTITIES];
;248:	gentity_t	*hit;
;249:	trace_t		trace;
;250:	vec3_t		mins, maxs;
;251:	static vec3_t	range = { 40, 40, 52 };
;252:
;253:	if ( !ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $129
line 254
;254:		return;
ADDRGP4 $127
JUMPV
LABELV $129
line 258
;255:	}
;256:
;257:	// dead clients don't activate triggers!
;258:	if ( ent->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $131
line 259
;259:		return;
ADDRGP4 $127
JUMPV
LABELV $131
line 262
;260:	}
;261:
;262:	VectorSubtract( ent->client->ps.origin, range, mins );
ADDRLP4 4188
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 64
ADDRLP4 4188
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRGP4 $128
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 4188
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRGP4 $128+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 $128+8
INDIRF4
SUBF4
ASGNF4
line 263
;263:	VectorAdd( ent->client->ps.origin, range, maxs );
ADDRLP4 4192
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 76
ADDRLP4 4192
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRGP4 $128
INDIRF4
ADDF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 4192
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRGP4 $128+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 76+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 $128+8
INDIRF4
ADDF4
ASGNF4
line 265
;264:
;265:	num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );
ADDRLP4 64
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 92
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4196
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 88
ADDRLP4 4196
INDIRI4
ASGNI4
line 268
;266:
;267:	// can't use ent->absmin, because that has a one unit pad
;268:	VectorAdd( ent->client->ps.origin, ent->r.mins, mins );
ADDRLP4 4200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4204
ADDRLP4 4200
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 64
ADDRLP4 4204
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4200
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 4204
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4200
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64+8
ADDRLP4 4208
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4208
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDF4
ASGNF4
line 269
;269:	VectorAdd( ent->client->ps.origin, ent->r.maxs, maxs );
ADDRLP4 4212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4216
ADDRLP4 4212
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 76
ADDRLP4 4216
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4212
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 4216
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4212
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76+8
ADDRLP4 4220
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4220
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
ASGNF4
line 271
;270:
;271:	for ( i=0 ; i<num ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $148
JUMPV
LABELV $145
line 272
;272:		hit = &g_entities[touch[i]];
ADDRLP4 0
CNSTI4 808
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 92
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 274
;273:
;274:		if ( !hit->touch && !ent->touch ) {
ADDRLP4 4224
CNSTI4 704
ASGNI4
ADDRLP4 4228
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
ADDRLP4 4224
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4228
INDIRU4
NEU4 $149
ADDRFP4 0
INDIRP4
ADDRLP4 4224
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4228
INDIRU4
NEU4 $149
line 275
;275:			continue;
ADDRGP4 $146
JUMPV
LABELV $149
line 277
;276:		}
;277:		if ( !( hit->r.contents & CONTENTS_TRIGGER ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
CNSTI4 1073741824
BANDI4
CNSTI4 0
NEI4 $151
line 278
;278:			continue;
ADDRGP4 $146
JUMPV
LABELV $151
line 282
;279:		}
;280:
;281:		// ignore most entities if a spectator
;282:		if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
CNSTI4 3
NEI4 $153
line 283
;283:			if ( hit->s.eType != ET_TELEPORT_TRIGGER &&
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 9
EQI4 $155
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 Touch_DoorTrigger
CVPU4 4
EQU4 $155
line 286
;284:				// this is ugly but adding a new ET_? type will
;285:				// most likely cause network incompatibilities
;286:				hit->touch != Touch_DoorTrigger) {
line 287
;287:				continue;
ADDRGP4 $146
JUMPV
LABELV $155
line 289
;288:			}
;289:		}
LABELV $153
line 293
;290:
;291:		// use seperate code for determining if an item is picked up
;292:		// so you don't have to actually contact its bounding box
;293:		if ( hit->s.eType == ET_ITEM ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $157
line 294
;294:			if ( !BG_PlayerTouchesItem( &ent->client->ps, &hit->s, level.time ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 4232
ADDRGP4 BG_PlayerTouchesItem
CALLI4
ASGNI4
ADDRLP4 4232
INDIRI4
CNSTI4 0
NEI4 $158
line 295
;295:				continue;
ADDRGP4 $146
JUMPV
line 297
;296:			}
;297:		} else {
LABELV $157
line 298
;298:			if ( !trap_EntityContact( mins, maxs, hit ) ) {
ADDRLP4 64
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4232
ADDRGP4 trap_EntityContact
CALLI4
ASGNI4
ADDRLP4 4232
INDIRI4
CNSTI4 0
NEI4 $162
line 299
;299:				continue;
ADDRGP4 $146
JUMPV
LABELV $162
line 301
;300:			}
;301:		}
LABELV $158
line 303
;302:
;303:		memset( &trace, 0, sizeof(trace) );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 305
;304:
;305:		if ( hit->touch ) {
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $164
line 306
;306:			hit->touch (hit, ent, &trace);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CALLV
pop
line 307
;307:		}
LABELV $164
line 309
;308:
;309:		if ( ( ent->r.svFlags & SVF_BOT ) && ( ent->touch ) ) {
ADDRLP4 4232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4232
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $166
ADDRLP4 4232
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $166
line 310
;310:			ent->touch( ent, hit, &trace );
ADDRLP4 4236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4236
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 4236
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CALLV
pop
line 311
;311:		}
LABELV $166
line 312
;312:	}
LABELV $146
line 271
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $148
ADDRLP4 4
INDIRI4
ADDRLP4 88
INDIRI4
LTI4 $145
line 315
;313:
;314:	// if we didn't touch a jump pad this pmove frame
;315:	if ( ent->client->ps.jumppad_frame != ent->client->ps.pmove_framecount ) {
ADDRLP4 4224
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4224
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
ADDRLP4 4224
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
EQI4 $168
line 316
;316:		ent->client->ps.jumppad_frame = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 317
;317:		ent->client->ps.jumppad_ent = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 448
ADDP4
CNSTI4 0
ASGNI4
line 318
;318:	}
LABELV $168
line 319
;319:}
LABELV $127
endproc G_TouchTriggers 4240 16
export SpectatorThink
proc SpectatorThink 252 12
line 326
;320:
;321:/*
;322:=================
;323:SpectatorThink
;324:=================
;325:*/
;326:void SpectatorThink( gentity_t *ent, usercmd_t *ucmd ) {
line 330
;327:	pmove_t	pm;
;328:	gclient_t	*client;
;329:
;330:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 332
;331:
;332:	if ( client->sess.spectatorState != SPECTATOR_FOLLOW ) {
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 2
EQI4 $171
line 333
;333:		client->ps.pm_type = PM_SPECTATOR;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 334
;334:		client->ps.speed = 400;	// faster than normal
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 400
ASGNI4
line 337
;335:
;336:		// set up for pmove
;337:		memset (&pm, 0, sizeof(pm));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 232
ARGI4
ADDRGP4 memset
CALLP4
pop
line 338
;338:		pm.ps = &client->ps;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 339
;339:		pm.cmd = *ucmd;
ADDRLP4 4+4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 24
line 340
;340:		pm.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;	// spectators can fly through bodies
ADDRLP4 4+28
CNSTI4 65537
ASGNI4
line 341
;341:		pm.trace = trap_Trace;
ADDRLP4 4+224
ADDRGP4 trap_Trace
ASGNP4
line 342
;342:		pm.pointcontents = trap_PointContents;
ADDRLP4 4+228
ADDRGP4 trap_PointContents
ASGNP4
line 345
;343:
;344:		// perform a pmove
;345:		Pmove (&pm);
ADDRLP4 4
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 347
;346:		// save results of pmove
;347:		VectorCopy( client->ps.origin, ent->s.origin );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 349
;348:
;349:		G_TouchTriggers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_TouchTriggers
CALLV
pop
line 350
;350:		trap_UnlinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 351
;351:	}
LABELV $171
line 353
;352:
;353:	client->oldbuttons = client->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ASGNI4
line 354
;354:	client->buttons = ucmd->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 357
;355:
;356:	// attack button cycles through spectators
;357:	if ( ( client->buttons & BUTTON_ATTACK ) && ! ( client->oldbuttons & BUTTON_ATTACK ) ) {
ADDRLP4 244
CNSTI4 1
ASGNI4
ADDRLP4 248
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDRLP4 244
INDIRI4
BANDI4
ADDRLP4 248
INDIRI4
EQI4 $177
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
ADDRLP4 244
INDIRI4
BANDI4
ADDRLP4 248
INDIRI4
NEI4 $177
line 358
;358:		Cmd_FollowCycle_f( ent, 1 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
line 359
;359:	}
LABELV $177
line 360
;360:}
LABELV $170
endproc SpectatorThink 252 12
export ClientInactivityTimer
proc ClientInactivityTimer 12 8
line 371
;361:
;362:
;363:
;364:/*
;365:=================
;366:ClientInactivityTimer
;367:
;368:Returns qfalse if the client is dropped
;369:=================
;370:*/
;371:qboolean ClientInactivityTimer( gclient_t *client ) {
line 372
;372:	if ( ! g_inactivity.integer ) {
ADDRGP4 g_inactivity+12
INDIRI4
CNSTI4 0
NEI4 $180
line 375
;373:		// give everyone some time, so if the operator sets g_inactivity during
;374:		// gameplay, everyone isn't kicked
;375:		client->inactivityTime = level.time + 60 * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 60000
ADDI4
ASGNI4
line 376
;376:		client->inactivityWarning = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
CNSTI4 0
ASGNI4
line 377
;377:	} else if ( client->pers.cmd.forwardmove || 
ADDRGP4 $181
JUMPV
LABELV $180
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 493
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $188
ADDRLP4 0
INDIRP4
CNSTI4 494
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $188
ADDRLP4 0
INDIRP4
CNSTI4 495
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $188
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 4
INDIRI4
EQI4 $184
LABELV $188
line 380
;378:		client->pers.cmd.rightmove || 
;379:		client->pers.cmd.upmove ||
;380:		(client->pers.cmd.buttons & BUTTON_ATTACK) ) {
line 381
;381:		client->inactivityTime = level.time + g_inactivity.integer * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRGP4 g_inactivity+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 382
;382:		client->inactivityWarning = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
CNSTI4 0
ASGNI4
line 383
;383:	} else if ( !client->pers.localClient ) {
ADDRGP4 $185
JUMPV
LABELV $184
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 0
NEI4 $191
line 384
;384:		if ( level.time > client->inactivityTime ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
LEI4 $193
line 385
;385:			trap_DropClient( client - level.clients, "Dropped due to inactivity" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $196
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 386
;386:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $179
JUMPV
LABELV $193
line 388
;387:		}
;388:		if ( level.time > client->inactivityTime - 10000 && !client->inactivityWarning ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $197
ADDRLP4 8
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 0
NEI4 $197
line 389
;389:			client->inactivityWarning = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
CNSTI4 1
ASGNI4
line 390
;390:			trap_SendServerCommand( client - level.clients, "cp \"Ten seconds until inactivity drop!\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $200
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 391
;391:		}
LABELV $197
line 392
;392:	}
LABELV $191
LABELV $185
LABELV $181
line 393
;393:	return qtrue;
CNSTI4 1
RETI4
LABELV $179
endproc ClientInactivityTimer 12 8
export printRewardZones
proc printRewardZones 20 20
line 398
;394:}
;395:
;396:// [ERGO MOD START]
;397:void printRewardZones(gentity_t *ent)
;398:{
line 403
;399:	gclient_t	*client;
;400:	char		*hrZone;
;401:	char		*brZone;
;402:
;403:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 404
;404:	hrZone = "none";
ADDRLP4 4
ADDRGP4 $202
ASGNP4
line 405
;405:	brZone = "none";
ADDRLP4 8
ADDRGP4 $202
ASGNP4
line 408
;406:
;407:	// br
;408:	if (client->performanceFlags & BR_ZONE_LOW)
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $203
line 409
;409:	{
line 410
;410:		brZone = "low";
ADDRLP4 8
ADDRGP4 $205
ASGNP4
line 411
;411:	}
ADDRGP4 $204
JUMPV
LABELV $203
line 412
;412:	else if (client->performanceFlags & BR_ZONE_POOR)
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $206
line 413
;413:	{
line 414
;414:		brZone = "poor";
ADDRLP4 8
ADDRGP4 $208
ASGNP4
line 415
;415:	}
ADDRGP4 $207
JUMPV
LABELV $206
line 416
;416:	else if (client->performanceFlags & BR_ZONE_NORMAL)
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $209
line 417
;417:	{
line 418
;418:		brZone = "normal";
ADDRLP4 8
ADDRGP4 $211
ASGNP4
line 419
;419:	}
ADDRGP4 $210
JUMPV
LABELV $209
line 420
;420:	else if (client->performanceFlags & BR_ZONE_HIGH)
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $212
line 421
;421:	{
line 422
;422:		brZone = "high";
ADDRLP4 8
ADDRGP4 $214
ASGNP4
line 423
;423:	}
LABELV $212
LABELV $210
LABELV $207
LABELV $204
line 426
;424:	
;425:	// hr
;426:	if (client->performanceFlags & HR_ZONE_LOW)
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $215
line 427
;427:	{
line 428
;428:		hrZone = "low";
ADDRLP4 4
ADDRGP4 $205
ASGNP4
line 429
;429:	}
ADDRGP4 $216
JUMPV
LABELV $215
line 430
;430:	else if (client->performanceFlags & HR_ZONE_RECOVERY)
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $217
line 431
;431:	{
line 432
;432:		hrZone = "recovery";
ADDRLP4 4
ADDRGP4 $219
ASGNP4
line 433
;433:	}
ADDRGP4 $218
JUMPV
LABELV $217
line 434
;434:	else if (client->performanceFlags & HR_ZONE_AEROBIC)
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $220
line 435
;435:	{
line 436
;436:		hrZone = "aerobic";
ADDRLP4 4
ADDRGP4 $222
ASGNP4
line 437
;437:	}
ADDRGP4 $221
JUMPV
LABELV $220
line 438
;438:	else if (client->performanceFlags & HR_ZONE_ANAEROBIC)
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $223
line 439
;439:	{
line 440
;440:		hrZone = "anaerobic";
ADDRLP4 4
ADDRGP4 $225
ASGNP4
line 441
;441:	}
ADDRGP4 $224
JUMPV
LABELV $223
line 442
;442:	else if (client->performanceFlags & HR_ZONE_HIGH)
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $226
line 443
;443:	{
line 444
;444:		hrZone = "high";
ADDRLP4 4
ADDRGP4 $214
ASGNP4
line 445
;445:	}
LABELV $226
LABELV $224
LABELV $221
LABELV $218
LABELV $216
line 447
;446:
;447:	debugPrint(ent, va("print \"BR ZONE: %s (%.1f rpm), HR ZONE: %s (%.1f bpm)\n\"", brZone, client->pers.currentCycleRate, hrZone, client->pers.currentHeartRate));
ADDRGP4 $228
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 debugPrint
CALLV
pop
line 449
;448:	//trap_SendServerCommand(ent - g_entities, va("print \"BR ZONE: %s (%.1f rpm), HR ZONE: %s (%.1f bpm)\n\"", brZone, client->pers.currentCycleRate, hrZone, client->pers.currentHeartRate));
;449:}
LABELV $201
endproc printRewardZones 20 20
export ClientTimerActions
proc ClientTimerActions 20 12
line 459
;450:// [ERGO MOD END]
;451:
;452:/*
;453:==================
;454:ClientTimerActions
;455:
;456:Actions that happen once a second
;457:==================
;458:*/
;459:void ClientTimerActions( gentity_t *ent, int msec ) {
line 465
;460:	gclient_t	*client;
;461:#ifdef MISSIONPACK
;462:	int			maxHealth;
;463:#endif
;464:
;465:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 466
;466:	client->timeResidual += msec;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 876
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $231
JUMPV
LABELV $230
line 468
;467:
;468:	while ( client->timeResidual >= 1000 ) {
line 469
;469:		client->timeResidual -= 1000;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 876
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 475
;470:
;471:		// [ERGO MOD START]
;472:		// once a second print user feedback	
;473:		//trap_SendServerCommand(ent - g_entities, va("print \"Cycle Rate: %.3f, Heart Rate: %.3f bpm\n\"", client->pers.currentCycleRate, client->pers.currentHeartRate));	
;474:		//trap_SendServerCommand(ent - g_entities, va("print \"Level Time: %d, Server Time: %d, PS Command Time: %d \n\"", level.time, client->pers.cmd.serverTime, client->ps.commandTime));
;475:		printRewardZones(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 printRewardZones
CALLV
pop
line 506
;476:		//TODO visuals for client dont work like expected
;477:		//G_AddEvent(ent, EV_MOD_HR_INFO, (int)client->pers.currentHeartRate);
;478:		// [ERGO MOD END]
;479:
;480:		// regenerate
;481:#ifdef MISSIONPACK
;482:		if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;483:			maxHealth = client->ps.stats[STAT_MAX_HEALTH] / 2;
;484:		}
;485:		else if ( client->ps.powerups[PW_REGEN] ) {
;486:			maxHealth = client->ps.stats[STAT_MAX_HEALTH];
;487:		}
;488:		else {
;489:			maxHealth = 0;
;490:		}
;491:		if( maxHealth ) {
;492:			if ( ent->health < maxHealth ) {
;493:				ent->health += 15;
;494:				if ( ent->health > maxHealth * 1.1 ) {
;495:					ent->health = maxHealth * 1.1;
;496:				}
;497:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
;498:			} else if ( ent->health < maxHealth * 2) {
;499:				ent->health += 5;
;500:				if ( ent->health > maxHealth * 2 ) {
;501:					ent->health = maxHealth * 2;
;502:				}
;503:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
;504:			}
;505:#else
;506:		if ( client->ps.powerups[PW_REGEN] ) {
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRI4
CNSTI4 0
EQI4 $233
line 507
;507:			if ( ent->health < client->ps.stats[STAT_MAX_HEALTH]) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
GEI4 $235
line 508
;508:				ent->health += 15;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 15
ADDI4
ASGNI4
line 509
;509:				if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] * 1.1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1066192077
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CVIF4 4
MULF4
LEF4 $237
line 510
;510:					ent->health = client->ps.stats[STAT_MAX_HEALTH] * 1.1;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTF4 1066192077
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 511
;511:				}
LABELV $237
line 512
;512:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 63
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 513
;513:			} else if ( ent->health < client->ps.stats[STAT_MAX_HEALTH] * 2) {
ADDRGP4 $234
JUMPV
LABELV $235
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
GEI4 $234
line 514
;514:				ent->health += 5;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 515
;515:				if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] * 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
LEI4 $241
line 516
;516:					ent->health = client->ps.stats[STAT_MAX_HEALTH] * 2;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 517
;517:				}
LABELV $241
line 518
;518:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 63
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 519
;519:			}
line 521
;520:#endif
;521:		} else {
ADDRGP4 $234
JUMPV
LABELV $233
line 523
;522:			// count down health when over max
;523:			if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
LEI4 $243
line 524
;524:				ent->health--;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 525
;525:			}
LABELV $243
line 526
;526:		}
LABELV $234
line 529
;527:
;528:		// count down armor when over max
;529:		if ( client->ps.stats[STAT_ARMOR] > client->ps.stats[STAT_MAX_HEALTH] ) {
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
LEI4 $245
line 530
;530:			client->ps.stats[STAT_ARMOR]--;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 531
;531:		}
LABELV $245
line 532
;532:	}
LABELV $231
line 468
ADDRLP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRI4
CNSTI4 1000
GEI4 $230
line 571
;533:#ifdef MISSIONPACK
;534:	if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN ) {
;535:		int w, max, inc, t, i;
;536:    int weapList[]={WP_MACHINEGUN,WP_SHOTGUN,WP_GRENADE_LAUNCHER,WP_ROCKET_LAUNCHER,WP_LIGHTNING,WP_RAILGUN,WP_PLASMAGUN,WP_BFG,WP_NAILGUN,WP_PROX_LAUNCHER,WP_CHAINGUN};
;537:    int weapCount = sizeof(weapList) / sizeof(int);
;538:		//
;539:    for (i = 0; i < weapCount; i++) {
;540:		  w = weapList[i];
;541:
;542:		  switch(w) {
;543:			  case WP_MACHINEGUN: max = 50; inc = 4; t = 1000; break;
;544:			  case WP_SHOTGUN: max = 10; inc = 1; t = 1500; break;
;545:			  case WP_GRENADE_LAUNCHER: max = 10; inc = 1; t = 2000; break;
;546:			  case WP_ROCKET_LAUNCHER: max = 10; inc = 1; t = 1750; break;
;547:			  case WP_LIGHTNING: max = 50; inc = 5; t = 1500; break;
;548:			  case WP_RAILGUN: max = 10; inc = 1; t = 1750; break;
;549:			  case WP_PLASMAGUN: max = 50; inc = 5; t = 1500; break;
;550:			  case WP_BFG: max = 10; inc = 1; t = 4000; break;
;551:			  case WP_NAILGUN: max = 10; inc = 1; t = 1250; break;
;552:			  case WP_PROX_LAUNCHER: max = 5; inc = 1; t = 2000; break;
;553:			  case WP_CHAINGUN: max = 100; inc = 5; t = 1000; break;
;554:			  default: max = 0; inc = 0; t = 1000; break;
;555:		  }
;556:		  client->ammoTimes[w] += msec;
;557:		  if ( client->ps.ammo[w] >= max ) {
;558:			  client->ammoTimes[w] = 0;
;559:		  }
;560:		  if ( client->ammoTimes[w] >= t ) {
;561:			  while ( client->ammoTimes[w] >= t )
;562:				  client->ammoTimes[w] -= t;
;563:			  client->ps.ammo[w] += inc;
;564:			  if ( client->ps.ammo[w] > max ) {
;565:				  client->ps.ammo[w] = max;
;566:			  }
;567:		  }
;568:    }
;569:	}
;570:#endif
;571:}
LABELV $229
endproc ClientTimerActions 20 12
export ClientIntermissionThink
proc ClientIntermissionThink 24 0
line 578
;572:
;573:/*
;574:====================
;575:ClientIntermissionThink
;576:====================
;577:*/
;578:void ClientIntermissionThink( gclient_t *client ) {
line 579
;579:	client->ps.eFlags &= ~EF_TALK;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 580
;580:	client->ps.eFlags &= ~EF_FIRING;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 585
;581:
;582:	// the level will exit when everyone wants to or after timeouts
;583:
;584:	// swap and latch button actions
;585:	client->oldbuttons = client->buttons;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 768
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ASGNI4
line 586
;586:	client->buttons = client->pers.cmd.buttons;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 764
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
ASGNI4
line 587
;587:	if ( client->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) & ( client->oldbuttons ^ client->buttons ) ) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 5
BANDI4
ADDRLP4 16
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
BXORI4
BANDI4
CNSTI4 0
EQI4 $248
line 589
;588:		// this used to be an ^1 but once a player says ready, it should stick
;589:		client->readyToExit = 1;
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 1
ASGNI4
line 590
;590:	}
LABELV $248
line 591
;591:}
LABELV $247
endproc ClientIntermissionThink 24 0
export ClientEvents
proc ClientEvents 92 32
line 602
;592:
;593:
;594:/*
;595:================
;596:ClientEvents
;597:
;598:Events will be passed on to the clients for presentation,
;599:but any server game effects are handled here
;600:================
;601:*/
;602:void ClientEvents( gentity_t *ent, int oldEventSequence ) {
line 613
;603:	int		i, j;
;604:	int		event;
;605:	gclient_t *client;
;606:	int		damage;
;607:	vec3_t	dir;
;608:	vec3_t	origin, angles;
;609://	qboolean	fired;
;610:	gitem_t *item;
;611:	gentity_t *drop;
;612:
;613:	client = ent->client;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 615
;614:
;615:	if ( oldEventSequence < client->ps.eventSequence - MAX_PS_EVENTS ) {
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
GEI4 $251
line 616
;616:		oldEventSequence = client->ps.eventSequence - MAX_PS_EVENTS;
ADDRFP4 4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 617
;617:	}
LABELV $251
line 618
;618:	for ( i = oldEventSequence ; i < client->ps.eventSequence ; i++ ) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $256
JUMPV
LABELV $253
line 619
;619:		event = client->ps.events[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ASGNI4
line 621
;620:
;621:		switch ( event ) {
ADDRLP4 68
CNSTI4 11
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $259
ADDRLP4 4
INDIRI4
CNSTI4 12
EQI4 $259
ADDRLP4 4
INDIRI4
ADDRLP4 68
INDIRI4
LTI4 $258
LABELV $284
ADDRLP4 4
INDIRI4
CNSTI4 23
EQI4 $270
ADDRLP4 4
INDIRI4
CNSTI4 25
EQI4 $271
ADDRLP4 4
INDIRI4
CNSTI4 26
EQI4 $283
ADDRGP4 $258
JUMPV
LABELV $259
line 624
;622:		case EV_FALL_MEDIUM:
;623:		case EV_FALL_FAR:
;624:			if ( ent->s.eType != ET_PLAYER ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $260
line 625
;625:				break;		// not in the player model
ADDRGP4 $258
JUMPV
LABELV $260
line 627
;626:			}
;627:			if ( g_dmflags.integer & DF_NO_FALLING ) {
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $262
line 628
;628:				break;
ADDRGP4 $258
JUMPV
LABELV $262
line 630
;629:			}
;630:			if ( event == EV_FALL_FAR ) {
ADDRLP4 4
INDIRI4
CNSTI4 12
NEI4 $265
line 631
;631:				damage = 10;
ADDRLP4 32
CNSTI4 10
ASGNI4
line 632
;632:			} else {
ADDRGP4 $266
JUMPV
LABELV $265
line 633
;633:				damage = 5;
ADDRLP4 32
CNSTI4 5
ASGNI4
line 634
;634:			}
LABELV $266
line 635
;635:			VectorSet (dir, 0, 0, 1);
ADDRLP4 76
CNSTF4 0
ASGNF4
ADDRLP4 16
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 16+8
CNSTF4 1065353216
ASGNF4
line 636
;636:			ent->pain_debounce_time = level.time + 200;	// no normal pain sound
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 637
;637:			G_Damage (ent, NULL, NULL, NULL, NULL, damage, 0, MOD_FALLING);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 80
CNSTP4 0
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 84
CNSTP4 0
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 19
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 638
;638:			break;
ADDRGP4 $258
JUMPV
LABELV $270
line 641
;639:
;640:		case EV_FIRE_WEAPON:
;641:			FireWeapon( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 FireWeapon
CALLV
pop
line 642
;642:			break;
ADDRGP4 $258
JUMPV
LABELV $271
line 646
;643:
;644:		case EV_USE_ITEM1:		// teleporter
;645:			// drop flags in CTF
;646:			item = NULL;
ADDRLP4 12
CNSTP4 0
ASGNP4
line 647
;647:			j = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 649
;648:
;649:			if ( ent->client->ps.powerups[ PW_REDFLAG ] ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $272
line 650
;650:				item = BG_FindItemForPowerup( PW_REDFLAG );
CNSTI4 7
ARGI4
ADDRLP4 88
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 88
INDIRP4
ASGNP4
line 651
;651:				j = PW_REDFLAG;
ADDRLP4 28
CNSTI4 7
ASGNI4
line 652
;652:			} else if ( ent->client->ps.powerups[ PW_BLUEFLAG ] ) {
ADDRGP4 $273
JUMPV
LABELV $272
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $274
line 653
;653:				item = BG_FindItemForPowerup( PW_BLUEFLAG );
CNSTI4 8
ARGI4
ADDRLP4 88
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 88
INDIRP4
ASGNP4
line 654
;654:				j = PW_BLUEFLAG;
ADDRLP4 28
CNSTI4 8
ASGNI4
line 655
;655:			} else if ( ent->client->ps.powerups[ PW_NEUTRALFLAG ] ) {
ADDRGP4 $275
JUMPV
LABELV $274
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $276
line 656
;656:				item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
CNSTI4 9
ARGI4
ADDRLP4 88
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 88
INDIRP4
ASGNP4
line 657
;657:				j = PW_NEUTRALFLAG;
ADDRLP4 28
CNSTI4 9
ASGNI4
line 658
;658:			}
LABELV $276
LABELV $275
LABELV $273
line 660
;659:
;660:			if ( item ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $278
line 661
;661:				drop = Drop_Item( ent, item, 0 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 88
ADDRGP4 Drop_Item
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 88
INDIRP4
ASGNP4
line 663
;662:				// decide how many seconds it has left
;663:				drop->count = ( ent->client->ps.powerups[ j ] - level.time ) / 1000;
ADDRLP4 60
INDIRP4
CNSTI4 760
ADDP4
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 664
;664:				if ( drop->count < 1 ) {
ADDRLP4 60
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 1
GEI4 $281
line 665
;665:					drop->count = 1;
ADDRLP4 60
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 666
;666:				}
LABELV $281
line 668
;667:
;668:				ent->client->ps.powerups[ j ] = 0;
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 669
;669:			}
LABELV $278
line 693
;670:
;671:#ifdef MISSIONPACK
;672:			if ( g_gametype.integer == GT_HARVESTER ) {
;673:				if ( ent->client->ps.generic1 > 0 ) {
;674:					if ( ent->client->sess.sessionTeam == TEAM_RED ) {
;675:						item = BG_FindItem( "Blue Cube" );
;676:					} else {
;677:						item = BG_FindItem( "Red Cube" );
;678:					}
;679:					if ( item ) {
;680:						for ( j = 0; j < ent->client->ps.generic1; j++ ) {
;681:							drop = Drop_Item( ent, item, 0 );
;682:							if ( ent->client->sess.sessionTeam == TEAM_RED ) {
;683:								drop->spawnflags = TEAM_BLUE;
;684:							} else {
;685:								drop->spawnflags = TEAM_RED;
;686:							}
;687:						}
;688:					}
;689:					ent->client->ps.generic1 = 0;
;690:				}
;691:			}
;692:#endif
;693:			SelectSpawnPoint( ent->client->ps.origin, origin, angles );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 SelectSpawnPoint
CALLP4
pop
line 694
;694:			TeleportPlayer( ent, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 695
;695:			break;
ADDRGP4 $258
JUMPV
LABELV $283
line 698
;696:
;697:		case EV_USE_ITEM2:		// medkit
;698:			ent->health = ent->client->ps.stats[STAT_MAX_HEALTH] + 25;
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 25
ADDI4
ASGNI4
line 700
;699:
;700:			break;
line 724
;701:
;702:#ifdef MISSIONPACK
;703:		case EV_USE_ITEM3:		// kamikaze
;704:			// make sure the invulnerability is off
;705:			ent->client->invulnerabilityTime = 0;
;706:			// start the kamikze
;707:			G_StartKamikaze( ent );
;708:			break;
;709:
;710:		case EV_USE_ITEM4:		// portal
;711:			if( ent->client->portalID ) {
;712:				DropPortalSource( ent );
;713:			}
;714:			else {
;715:				DropPortalDestination( ent );
;716:			}
;717:			break;
;718:		case EV_USE_ITEM5:		// invulnerability
;719:			ent->client->invulnerabilityTime = level.time + 10000;
;720:			break;
;721:#endif
;722:
;723:		default:
;724:			break;
LABELV $258
line 726
;725:		}
;726:	}
LABELV $254
line 618
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $256
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LTI4 $253
line 728
;727:
;728:}
LABELV $250
endproc ClientEvents 92 32
export SendPendingPredictableEvents
proc SendPendingPredictableEvents 44 12
line 780
;729:
;730:#ifdef MISSIONPACK
;731:/*
;732:==============
;733:StuckInOtherClient
;734:==============
;735:*/
;736:static int StuckInOtherClient(gentity_t *ent) {
;737:	int i;
;738:	gentity_t	*ent2;
;739:
;740:	ent2 = &g_entities[0];
;741:	for ( i = 0; i < MAX_CLIENTS; i++, ent2++ ) {
;742:		if ( ent2 == ent ) {
;743:			continue;
;744:		}
;745:		if ( !ent2->inuse ) {
;746:			continue;
;747:		}
;748:		if ( !ent2->client ) {
;749:			continue;
;750:		}
;751:		if ( ent2->health <= 0 ) {
;752:			continue;
;753:		}
;754:		//
;755:		if (ent2->r.absmin[0] > ent->r.absmax[0])
;756:			continue;
;757:		if (ent2->r.absmin[1] > ent->r.absmax[1])
;758:			continue;
;759:		if (ent2->r.absmin[2] > ent->r.absmax[2])
;760:			continue;
;761:		if (ent2->r.absmax[0] < ent->r.absmin[0])
;762:			continue;
;763:		if (ent2->r.absmax[1] < ent->r.absmin[1])
;764:			continue;
;765:		if (ent2->r.absmax[2] < ent->r.absmin[2])
;766:			continue;
;767:		return qtrue;
;768:	}
;769:	return qfalse;
;770:}
;771:#endif
;772:
;773:void BotTestSolid(vec3_t origin);
;774:
;775:/*
;776:==============
;777:SendPendingPredictableEvents
;778:==============
;779:*/
;780:void SendPendingPredictableEvents( playerState_t *ps ) {
line 786
;781:	gentity_t *t;
;782:	int event, seq;
;783:	int extEvent, number;
;784:
;785:	// if there are still events pending
;786:	if ( ps->entityEventSequence < ps->eventSequence ) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
GEI4 $286
line 789
;787:		// create a temporary entity for this event which is sent to everyone
;788:		// except the client who generated the event
;789:		seq = ps->entityEventSequence & (MAX_PS_EVENTS-1);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 790
;790:		event = ps->events[ seq ] | ( ( ps->entityEventSequence & 3 ) << 8 );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 8
LSHI4
BORI4
ASGNI4
line 792
;791:		// set external event to zero before calling BG_PlayerStateToEntityState
;792:		extEvent = ps->externalEvent;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ASGNI4
line 793
;793:		ps->externalEvent = 0;
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
CNSTI4 0
ASGNI4
line 795
;794:		// create temporary entity for event
;795:		t = G_TempEntity( ps->origin, event );
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 796
;796:		number = t->s.number;
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 797
;797:		BG_PlayerStateToEntityState( ps, &t->s, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 798
;798:		t->s.number = number;
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ASGNI4
line 799
;799:		t->s.eType = ET_EVENTS + event;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 13
ADDI4
ASGNI4
line 800
;800:		t->s.eFlags |= EF_PLAYER_EVENT;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 801
;801:		t->s.otherEntityNum = ps->clientNum;
ADDRLP4 36
CNSTI4 140
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 803
;802:		// send to everyone except the client who generated the event
;803:		t->r.svFlags |= SVF_NOTSINGLECLIENT;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 804
;804:		t->r.singleClient = ps->clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 428
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 806
;805:		// set back external event
;806:		ps->externalEvent = extEvent;
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 807
;807:	}
LABELV $286
line 808
;808:}
LABELV $285
endproc SendPendingPredictableEvents 44 12
export randomPickFromPercentages
proc randomPickFromPercentages 24 4
line 813
;809:
;810:// [ERGO MOD START]
;811:// randomly picks an index, but is based on percentages in array 
;812:int randomPickFromPercentages(const float *percentageArray, int size)
;813:{
line 819
;814:	int			rndSeed;
;815:	int			counter;
;816:	float		rnd;
;817:	int			pickedIndex;
;818:	
;819:	rndSeed = rand() % INT_MAX;
ADDRLP4 16
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 16
INDIRI4
CNSTI4 2147483647
MODI4
ASGNI4
line 820
;820:	rnd = Q_random(&rndSeed);
ADDRLP4 12
ARGP4
ADDRLP4 20
ADDRGP4 Q_random
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 20
INDIRF4
ASGNF4
line 822
;821:	//trap_SendServerCommand(ent - g_entities, va("print \"RND Nr: %0.3f\n\"", rnd));
;822:	pickedIndex = -1.0;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 827
;823:
;824:	//trap_SendServerCommand(ent - g_entities, va("print \"Interval: %d, RESIDUAL : %d\n\""
;825:
;826:	// pick random category based on percentages
;827:	for (counter = 0; counter < size; counter = counter + 1)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $292
JUMPV
LABELV $289
line 828
;828:	{
line 829
;829:		if (rnd < percentageArray[counter])
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
GEF4 $293
line 830
;830:		{
line 831
;831:			pickedIndex = counter;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 832
;832:			break;
ADDRGP4 $291
JUMPV
LABELV $293
line 834
;833:		}
;834:		rnd -= percentageArray[counter];
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 835
;835:	}
LABELV $290
line 827
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $292
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $289
LABELV $291
line 837
;836:	
;837:	return pickedIndex;
ADDRLP4 8
INDIRI4
RETI4
LABELV $288
endproc randomPickFromPercentages 24 4
export giveItemTo
proc giveItemTo 64 12
line 846
;838:
;839:}
;840:
;841:// [ERGO MOD END]
;842:
;843:// [ERGO MOD START]
;844:// gives a specific item to entity (player & bots) - "give ..." only rewards player
;845:void giveItemTo(gentity_t *ent, gitem_t *item)
;846:{
line 851
;847:	gentity_t	*it_ent;
;848:	trace_t		trace;
;849:
;850:	// spawn item directly above entity
;851:	it_ent = G_Spawn();
ADDRLP4 60
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 60
INDIRP4
ASGNP4
line 852
;852:	VectorCopy(ent->r.currentOrigin, it_ent->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 853
;853:	it_ent->classname = item->classname;
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRFP4 4
INDIRP4
INDIRP4
ASGNP4
line 854
;854:	G_SpawnItem(it_ent, item);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 855
;855:	FinishSpawningItem(it_ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 FinishSpawningItem
CALLV
pop
line 856
;856:	memset(&trace, 0, sizeof(trace));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 857
;857:	Touch_Item(it_ent, ent, &trace);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Touch_Item
CALLV
pop
line 858
;858:	if (it_ent->inuse) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $296
line 859
;859:		G_FreeEntity(it_ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 860
;860:	}
LABELV $296
line 861
;861:}
LABELV $295
endproc giveItemTo 64 12
export rewardItems
proc rewardItems 48 12
line 867
;862:// [ERGO MOD END]
;863:
;864:// [ERGO MOD START]
;865://reward items randomly, regarding drop rates
;866:void rewardItems(gentity_t *ent)
;867:{
line 877
;868:	gitem_t		*item;
;869:	int			qDropChanceArraySize;
;870:	int			pickedItem;
;871:	const char	**qualityPool;
;872:	int			qualityPoolSize;
;873:	int			rndIndex;
;874:	char		*quality;
;875:	char		*itemName;
;876:
;877:	quality = "UNKNOWN";
ADDRLP4 4
ADDRGP4 $299
ASGNP4
line 880
;878:	
;879:	// choose quality based on quality drop percentages
;880:	qDropChanceArraySize = REWARD_NUM_QUALITIES;
ADDRLP4 12
CNSTI4 3
ASGNI4
line 881
;881:	pickedItem = randomPickFromPercentages(g_qualityDropPercentages, qDropChanceArraySize);
ADDRGP4 g_qualityDropPercentages
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 randomPickFromPercentages
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 32
INDIRI4
ASGNI4
line 883
;882:
;883:	if (pickedItem == REWARD_DROPRATE_INDEX_LQ)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $300
line 884
;884:	{
line 885
;885:		qualityPool = g_rewardItemsLQ; 
ADDRLP4 20
ADDRGP4 g_rewardItemsLQ
ASGNP4
line 886
;886:		qualityPoolSize = REWARD_NUM_LQ_ITEMS;
ADDRLP4 24
CNSTI4 4
ASGNI4
line 887
;887:		quality = "LQ";
ADDRLP4 4
ADDRGP4 $302
ASGNP4
line 888
;888:	}
ADDRGP4 $301
JUMPV
LABELV $300
line 889
;889:	else if (pickedItem == REWARD_DROPRATE_INDEX_MQ)
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $303
line 890
;890:	{
line 891
;891:		qualityPool = g_rewardItemsMQ; 
ADDRLP4 20
ADDRGP4 g_rewardItemsMQ
ASGNP4
line 892
;892:		qualityPoolSize = REWARD_NUM_MQ_ITEMS;
ADDRLP4 24
CNSTI4 6
ASGNI4
line 893
;893:		quality = "MQ";
ADDRLP4 4
ADDRGP4 $305
ASGNP4
line 894
;894:	}
ADDRGP4 $304
JUMPV
LABELV $303
line 895
;895:	else if (pickedItem == REWARD_DROPRATE_INDEX_HQ)
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $306
line 896
;896:	{
line 897
;897:		qualityPool = g_rewardItemsHQ; 
ADDRLP4 20
ADDRGP4 g_rewardItemsHQ
ASGNP4
line 898
;898:		qualityPoolSize = REWARD_NUM_HQ_ITEMS;
ADDRLP4 24
CNSTI4 6
ASGNI4
line 899
;899:		quality = "HQ";
ADDRLP4 4
ADDRGP4 $308
ASGNP4
line 900
;900:	}
LABELV $306
LABELV $304
LABELV $301
line 903
;901:
;902:	// choose rnd item from pool
;903:	rndIndex = rand() % qualityPoolSize;
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 36
INDIRI4
ADDRLP4 24
INDIRI4
MODI4
ASGNI4
line 904
;904:	item = BG_FindItem(qualityPool[rndIndex]);
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 40
INDIRP4
ASGNP4
line 908
;905:
;906:	// debug output
;907:	//trap_SendServerCommand(ent - g_entities, va("print \"REWARDING %s ITEM: %s \n\"", quality, item->pickup_name));
;908:	debugPrint(ent, va("print \"REWARDING %s ITEM: %s \n\"", quality, item->pickup_name));
ADDRGP4 $309
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 debugPrint
CALLV
pop
line 914
;909:
;910:	// console commands dont work for bots	
;911:	//trap_SendConsoleCommand(EXEC_INSERT, va("give %s\n", item->pickup_name));
;912:
;913:	// give item to player / bot 
;914:	giveItemTo(ent, item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 giveItemTo
CALLV
pop
line 915
;915:}
LABELV $298
endproc rewardItems 48 12
export rewardWeapons
proc rewardWeapons 48 12
line 921
;916:// [ERGO MOD END]
;917:
;918:// [ERGO MOD START]
;919://reward weapons randomly, regarding drop rates
;920:void rewardWeapons(gentity_t *ent)
;921:{
line 931
;922:	gitem_t		*item;
;923:	int			qDropChanceArraySize;
;924:	int			pickedItem;
;925:	const char	**qualityPool;
;926:	int			qualityPoolSize;
;927:	int			rndIndex;
;928:	char		*quality;
;929:	char		*itemName;
;930:
;931:	quality = "UNKNOWN";
ADDRLP4 4
ADDRGP4 $299
ASGNP4
line 934
;932:
;933:	// choose quality based on quality drop percentages	
;934:	qDropChanceArraySize = REWARD_NUM_QUALITIES;
ADDRLP4 12
CNSTI4 3
ASGNI4
line 935
;935:	pickedItem = randomPickFromPercentages(g_qualityDropPercentages, qDropChanceArraySize);
ADDRGP4 g_qualityDropPercentages
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 randomPickFromPercentages
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 32
INDIRI4
ASGNI4
line 937
;936:
;937:	if (pickedItem == REWARD_DROPRATE_INDEX_LQ)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $311
line 938
;938:	{
line 939
;939:		qualityPool = g_rewardWeaponsLQ;
ADDRLP4 20
ADDRGP4 g_rewardWeaponsLQ
ASGNP4
line 940
;940:		qualityPoolSize = REWARD_NUM_LQ_WEAPONS;
ADDRLP4 24
CNSTI4 2
ASGNI4
line 941
;941:		quality = "LQ";
ADDRLP4 4
ADDRGP4 $302
ASGNP4
line 942
;942:	}
ADDRGP4 $312
JUMPV
LABELV $311
line 943
;943:	else if (pickedItem == REWARD_DROPRATE_INDEX_MQ)
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $313
line 944
;944:	{
line 945
;945:		qualityPool = g_rewardWeaponsMQ;
ADDRLP4 20
ADDRGP4 g_rewardWeaponsMQ
ASGNP4
line 946
;946:		qualityPoolSize = REWARD_NUM_MQ_WEAPONS;
ADDRLP4 24
CNSTI4 3
ASGNI4
line 947
;947:		quality = "MQ";
ADDRLP4 4
ADDRGP4 $305
ASGNP4
line 948
;948:	}
ADDRGP4 $314
JUMPV
LABELV $313
line 949
;949:	else if (pickedItem == REWARD_DROPRATE_INDEX_HQ)
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $315
line 950
;950:	{
line 951
;951:		qualityPool = g_rewardWeaponsHQ;
ADDRLP4 20
ADDRGP4 g_rewardWeaponsHQ
ASGNP4
line 952
;952:		qualityPoolSize = REWARD_NUM_HQ_WEAPONS;
ADDRLP4 24
CNSTI4 3
ASGNI4
line 953
;953:		quality = "HQ";
ADDRLP4 4
ADDRGP4 $308
ASGNP4
line 954
;954:	}
LABELV $315
LABELV $314
LABELV $312
line 957
;955:
;956:	// choose rnd item from pool
;957:	rndIndex = rand() % qualityPoolSize;
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 36
INDIRI4
ADDRLP4 24
INDIRI4
MODI4
ASGNI4
line 958
;958:	item = BG_FindItem(qualityPool[rndIndex]);
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 40
INDIRP4
ASGNP4
line 962
;959:
;960:	// debug output
;961:	//trap_SendServerCommand(ent - g_entities, va("print \"REWARDING %s WEAPON: %s\n\"", quality, item->pickup_name));
;962:	debugPrint(ent, va("print \"REWARDING %s WEAPON: %s\n\"", quality, item->pickup_name));
ADDRGP4 $317
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 debugPrint
CALLV
pop
line 965
;963:
;964:	// give item to player / bot 
;965:	giveItemTo(ent, item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 giveItemTo
CALLV
pop
line 969
;966:	
;967:	// console commands dont work for bots
;968:	//trap_SendConsoleCommand(EXEC_INSERT, va("give %s\n", item->pickup_name));
;969:}
LABELV $310
endproc rewardWeapons 48 12
export rewardPowerups
proc rewardPowerups 48 12
line 975
;970:// [ERGO MOD END]
;971:
;972:// [ERGO MOD START]
;973://reward powerups randomly, regarding drop rates
;974:void rewardPowerups(gentity_t *ent)
;975:{
line 985
;976:	gitem_t		*item;
;977:	int			qDropChanceArraySize;
;978:	int			pickedItem;
;979:	const char	**qualityPool;
;980:	int			qualityPoolSize;
;981:	int			rndIndex;
;982:	char		*quality;
;983:	char		*itemName;
;984:
;985:	quality = "UNKNOWN";
ADDRLP4 4
ADDRGP4 $299
ASGNP4
line 988
;986:
;987:	// choose quality based on quality drop percentages	
;988:	qDropChanceArraySize = REWARD_NUM_QUALITIES;
ADDRLP4 12
CNSTI4 3
ASGNI4
line 989
;989:	pickedItem = randomPickFromPercentages(g_qualityDropPercentages, qDropChanceArraySize);
ADDRGP4 g_qualityDropPercentages
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 randomPickFromPercentages
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 32
INDIRI4
ASGNI4
line 991
;990:
;991:	if (pickedItem == REWARD_DROPRATE_INDEX_LQ)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $319
line 992
;992:	{
line 993
;993:		qualityPool = g_rewardPowerupsLQ;
ADDRLP4 20
ADDRGP4 g_rewardPowerupsLQ
ASGNP4
line 994
;994:		qualityPoolSize = REWARD_NUM_LQ_POWERUPS;
ADDRLP4 24
CNSTI4 2
ASGNI4
line 995
;995:		quality = "LQ";
ADDRLP4 4
ADDRGP4 $302
ASGNP4
line 996
;996:	}
ADDRGP4 $320
JUMPV
LABELV $319
line 997
;997:	else if (pickedItem == REWARD_DROPRATE_INDEX_MQ)
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $321
line 998
;998:	{
line 999
;999:		qualityPool = g_rewardPowerupsMQ;
ADDRLP4 20
ADDRGP4 g_rewardPowerupsMQ
ASGNP4
line 1000
;1000:		qualityPoolSize = REWARD_NUM_MQ_POWERUPS;
ADDRLP4 24
CNSTI4 2
ASGNI4
line 1001
;1001:		quality = "MQ";
ADDRLP4 4
ADDRGP4 $305
ASGNP4
line 1002
;1002:	}
ADDRGP4 $322
JUMPV
LABELV $321
line 1003
;1003:	else if (pickedItem == REWARD_DROPRATE_INDEX_HQ)
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $323
line 1004
;1004:	{
line 1005
;1005:		qualityPool = g_rewardPowerupsHQ;
ADDRLP4 20
ADDRGP4 g_rewardPowerupsHQ
ASGNP4
line 1006
;1006:		qualityPoolSize = REWARD_NUM_HQ_POWERUPS;
ADDRLP4 24
CNSTI4 3
ASGNI4
line 1007
;1007:		quality = "HQ";
ADDRLP4 4
ADDRGP4 $308
ASGNP4
line 1008
;1008:	}
LABELV $323
LABELV $322
LABELV $320
line 1011
;1009:
;1010:	// choose rnd item from pool
;1011:	rndIndex = rand() % qualityPoolSize;
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 36
INDIRI4
ADDRLP4 24
INDIRI4
MODI4
ASGNI4
line 1012
;1012:	item = BG_FindItem(qualityPool[rndIndex]);
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 40
INDIRP4
ASGNP4
line 1016
;1013:
;1014:	// debug output
;1015:	//trap_SendServerCommand(ent - g_entities, va("print \"REWARDING %s POWERUP: %s\n\"", quality, item->pickup_name));
;1016:	debugPrint(ent, va("print \"REWARDING %s POWERUP: %s\n\"", quality, item->pickup_name));
ADDRGP4 $325
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 debugPrint
CALLV
pop
line 1019
;1017:
;1018:	// give item to player / bot 
;1019:	giveItemTo(ent, item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 giveItemTo
CALLV
pop
line 1023
;1020:
;1021:	// console commands dont work for bots
;1022:	//trap_SendConsoleCommand(EXEC_INSERT, va("give %s\n", item->pickup_name));
;1023:}
LABELV $318
endproc rewardPowerups 48 12
export handleRewards
proc handleRewards 40 8
line 1028
;1024:// [ERGO MOD END]
;1025:
;1026:// [ERGO MOD START]
;1027:void handleRewards(gentity_t *ent, float rate, int msec)
;1028:{
line 1037
;1029:	gclient_t	*client;	
;1030:	float		rnd;			// for picking random item category
;1031:	int			pickedItem;     // final choice (index of dropItems) 
;1032:	int			arrayLength;
;1033:	int			hrMode;
;1034:	int			*residualTime;
;1035:	int			*interval;
;1036:	
;1037:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 1039
;1038:	
;1039:	if (ent->client->sess.ergoFlags & E_FL_HRMODE) hrMode = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $327
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $328
JUMPV
LABELV $327
line 1040
;1040:	else hrMode = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $328
line 1042
;1041:	
;1042:	if (hrMode)
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $329
line 1043
;1043:	{
line 1044
;1044:		residualTime = &client->hrRewardTimeResidual;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 880
ADDP4
ASGNP4
line 1045
;1045:		interval = &client->hrRewardInterval;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 884
ADDP4
ASGNP4
line 1046
;1046:	}
ADDRGP4 $330
JUMPV
LABELV $329
line 1048
;1047:	else
;1048:	{
line 1049
;1049:		residualTime = &client->brRewardTimeResidual;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 892
ADDP4
ASGNP4
line 1050
;1050:		interval = &client->brRewardInterval;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 888
ADDP4
ASGNP4
line 1051
;1051:	}
LABELV $330
line 1053
;1052:
;1053:	*residualTime += msec;
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ASGNI4
line 1055
;1054:
;1055:	if (rate == 0) return;
ADDRFP4 4
INDIRF4
CNSTF4 0
NEF4 $331
ADDRGP4 $326
JUMPV
LABELV $331
line 1058
;1056:
;1057:	// calc timeInterval (reward frequency in ms)
;1058:	if (!(*interval > 0))
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 0
GTI4 $336
line 1059
;1059:	{		
line 1060
;1060:		*interval = (int)((1.0 / rate) * 1000.0); // ms
ADDRLP4 8
INDIRP4
CNSTF4 1148846080
CNSTF4 1065353216
ADDRFP4 4
INDIRF4
DIVF4
MULF4
CVFI4 4
ASGNI4
line 1061
;1061:	}
ADDRGP4 $336
JUMPV
LABELV $335
line 1066
;1062:
;1063:	//trap_SendServerCommand(ent - g_entities, va("print \"Interval: %d, RESIDUAL : %d\n\"", client->hrRewardInterval, client->hrRewardTimeResidual));
;1064:
;1065:	// periodically choose rewards for current reward zone
;1066:	while (*residualTime >= *interval) {
line 1068
;1067:		
;1068:		*residualTime -= *interval;
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 8
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 1073
;1069:		
;1070:		//trap_SendServerCommand(ent - g_entities, va("print \"REWARD DUE - INTERVAL: %d\n\"", client->hrRewardInterval));
;1071:
;1072:		//reward stuff randomly & regarding drop rates
;1073:		arrayLength = sizeof(client->pers.rewardDropPercentages) / sizeof(client->pers.rewardDropPercentages[0]);
ADDRLP4 16
CNSTI4 3
ASGNI4
line 1074
;1074:		pickedItem = randomPickFromPercentages((const float*) client->pers.rewardDropPercentages, arrayLength);
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 randomPickFromPercentages
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 36
INDIRI4
ASGNI4
line 1076
;1075:
;1076:		if (pickedItem == REWARD_DROPRATE_INDEX_ITEMS) rewardItems(ent);
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $338
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 rewardItems
CALLV
pop
ADDRGP4 $339
JUMPV
LABELV $338
line 1077
;1077:		else if (pickedItem == REWARD_DROPRATE_INDEX_WEAPONS) rewardWeapons(ent);
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $340
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 rewardWeapons
CALLV
pop
ADDRGP4 $341
JUMPV
LABELV $340
line 1078
;1078:		else if (pickedItem == REWARD_DROPRATE_INDEX_POWERUPS) rewardPowerups(ent);
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $342
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 rewardPowerups
CALLV
pop
LABELV $342
LABELV $341
LABELV $339
line 1079
;1079:	}
LABELV $336
line 1066
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 8
INDIRP4
INDIRI4
GEI4 $335
line 1080
;1080:}
LABELV $326
endproc handleRewards 40 8
export setPerformanceZone
proc setPerformanceZone 28 0
line 1086
;1081:// [ERGO MOD END]
;1082:
;1083:// [ERGO MOD START]
;1084:// sets clients reward zone (hr speed) and resets interval if need be
;1085:void setPerformanceZone(gentity_t *ent, int zone)
;1086:{
line 1089
;1087:	gclient_t	*client;
;1088:
;1089:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 1092
;1090:
;1091:	// br
;1092:	if (zone < HR_ZONE_LOW)
ADDRFP4 4
INDIRI4
CNSTI4 16
GEI4 $345
line 1093
;1093:	{
line 1095
;1094:		// check if already in zone
;1095:		if (!(client->performanceFlags & zone))
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
BANDI4
CNSTI4 0
NEI4 $346
line 1096
;1096:		{
line 1098
;1097:			// clear all br flags
;1098:			client->performanceFlags &= ~BR_ZONE_LOW;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 1099
;1099:			client->performanceFlags &= ~BR_ZONE_POOR;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 1100
;1100:			client->performanceFlags &= ~BR_ZONE_NORMAL;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 1101
;1101:			client->performanceFlags &= ~BR_ZONE_HIGH;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 1104
;1102:
;1103:			// set new zone & reset interval
;1104:			client->performanceFlags |= zone;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
BORI4
ASGNI4
line 1105
;1105:			client->brRewardInterval = 0;
ADDRLP4 0
INDIRP4
CNSTI4 888
ADDP4
CNSTI4 0
ASGNI4
line 1106
;1106:			client->brRewardTimeResidual = 0;
ADDRLP4 0
INDIRP4
CNSTI4 892
ADDP4
CNSTI4 0
ASGNI4
line 1110
;1107:
;1108:			//TODO: show status & its update visually (print changes for now) 
;1109:			//printRewardZones(ent);
;1110:		}			
line 1111
;1111:	}
ADDRGP4 $346
JUMPV
LABELV $345
line 1114
;1112:	// hr
;1113:	else
;1114:	{
line 1116
;1115:		// check if already in zone
;1116:		if (!(client->performanceFlags & zone))
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
BANDI4
CNSTI4 0
NEI4 $349
line 1117
;1117:		{
line 1119
;1118:			// clear all hr flags
;1119:			client->performanceFlags &= ~HR_ZONE_LOW;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 1120
;1120:			client->performanceFlags &= ~HR_ZONE_RECOVERY;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -33
BANDI4
ASGNI4
line 1121
;1121:			client->performanceFlags &= ~HR_ZONE_AEROBIC;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -65
BANDI4
ASGNI4
line 1122
;1122:			client->performanceFlags &= ~HR_ZONE_ANAEROBIC;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1123
;1123:			client->performanceFlags &= ~HR_ZONE_HIGH;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 1126
;1124:
;1125:			// set new zone & reset interval
;1126:			client->performanceFlags |= zone;
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
BORI4
ASGNI4
line 1127
;1127:			client->hrRewardInterval = 0;
ADDRLP4 0
INDIRP4
CNSTI4 884
ADDP4
CNSTI4 0
ASGNI4
line 1128
;1128:			client->hrRewardTimeResidual = 0;
ADDRLP4 0
INDIRP4
CNSTI4 880
ADDP4
CNSTI4 0
ASGNI4
line 1131
;1129:
;1130:			// punishments
;1131:			if (zone == HR_ZONE_HIGH)
ADDRFP4 4
INDIRI4
CNSTI4 256
NEI4 $351
line 1132
;1132:			{
line 1133
;1133:				client->punishmentIncreaseInterval = 0;
ADDRLP4 0
INDIRP4
CNSTI4 904
ADDP4
CNSTI4 0
ASGNI4
line 1134
;1134:				client->punishmentIntervalIndex = 0;
ADDRLP4 0
INDIRP4
CNSTI4 896
ADDP4
CNSTI4 0
ASGNI4
line 1135
;1135:				client->punishmentTimeResidual = 0;
ADDRLP4 0
INDIRP4
CNSTI4 900
ADDP4
CNSTI4 0
ASGNI4
line 1136
;1136:			}
LABELV $351
line 1140
;1137:
;1138:			//TODO: show status & its update visually (print changes for now) 
;1139:			//printRewardZones(ent);			
;1140:		}		
LABELV $349
line 1141
;1141:	}
LABELV $346
line 1143
;1142:
;1143:}
LABELV $344
endproc setPerformanceZone 28 0
export handlePunishments
proc handlePunishments 56 32
line 1148
;1144:// [ERGO MOD END]
;1145:
;1146:// [ERGO MOD START]
;1147:void handlePunishments(gentity_t *ent, int msec)
;1148:{
line 1155
;1149:	
;1150:	gclient_t	*client;
;1151:	int			rndNum;
;1152:	int			dmg;
;1153:
;1154:
;1155:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 1157
;1156:
;1157:	client->punishmentTimeResidual += msec;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 900
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 1160
;1158:
;1159:	// choose greater interval after 30 secs
;1160:	if (client->punishmentIntervalIndex < (NUM_PUNISHMENT_INTERVALS-1))
ADDRLP4 0
INDIRP4
CNSTI4 896
ADDP4
INDIRI4
CNSTI4 2
GEI4 $359
line 1161
;1161:	{
line 1162
;1162:		client->punishmentIncreaseInterval += msec;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 904
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 1163
;1163:		if (client->punishmentIncreaseInterval >= PUNISHMENT_INCREASE_TIME)
ADDRLP4 0
INDIRP4
CNSTI4 904
ADDP4
INDIRI4
CNSTI4 15000
LTI4 $359
line 1164
;1164:		{
line 1165
;1165:			client->punishmentIncreaseInterval -= PUNISHMENT_INCREASE_TIME;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 904
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 15000
SUBI4
ASGNI4
line 1166
;1166:			client->punishmentIntervalIndex++;
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 896
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1167
;1167:		}
line 1168
;1168:	}
ADDRGP4 $359
JUMPV
LABELV $358
line 1171
;1169:	
;1170:	// periodically punish player according to interval
;1171:	while (client->punishmentTimeResidual >= client->pers.punishmentIntervals[client->punishmentIntervalIndex]) {
line 1173
;1172:
;1173:		client->punishmentTimeResidual -= client->pers.punishmentIntervals[client->punishmentIntervalIndex];
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 900
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 896
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1176
;1174:
;1175:		// choose rnd (50:50 loose health or armor
;1176:		rndNum = rand() % 2;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
CNSTI4 2
MODI4
ASGNI4
line 1179
;1177:
;1178:		// armor decrease
;1179:		if (rndNum < 1)
ADDRLP4 8
INDIRI4
CNSTI4 1
GEI4 $361
line 1180
;1180:		{
line 1181
;1181:			dmg = PUNISHMENT_ARMOR_DECREASE * (client->punishmentIntervalIndex + 1);
ADDRLP4 28
CNSTI4 5
ASGNI4
ADDRLP4 4
ADDRLP4 28
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 896
ADDP4
INDIRI4
MULI4
ADDRLP4 28
INDIRI4
ADDI4
ASGNI4
line 1182
;1182:			ent->damage += dmg;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1183
;1183:			G_Damage(ent, NULL, NULL, NULL, NULL,
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
CNSTP4 0
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
CNSTP4 0
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 23
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1186
;1184:				ent->damage, DAMAGE_NO_KNOCKBACK, MOD_HIGH_PULSE);
;1185:			//trap_SendServerCommand(ent - g_entities, va("print \"Punishment Armor - %d, Interval: %d ms\n\"", dmg, client->pers.punishmentIntervals[client->punishmentIntervalIndex]));
;1186:			debugPrint(ent, va("print \"Punishment Armor - %d, Interval: %d ms\n\"", dmg, client->pers.punishmentIntervals[client->punishmentIntervalIndex]));
ADDRGP4 $363
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 896
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 debugPrint
CALLV
pop
line 1187
;1187:		}
ADDRGP4 $362
JUMPV
LABELV $361
line 1190
;1188:		// health decrease
;1189:		else
;1190:		{
line 1191
;1191:			dmg = PUNISHMENT_HP_DECREASE * (client->punishmentIntervalIndex + 1);
ADDRLP4 28
CNSTI4 5
ASGNI4
ADDRLP4 4
ADDRLP4 28
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 896
ADDP4
INDIRI4
MULI4
ADDRLP4 28
INDIRI4
ADDI4
ASGNI4
line 1192
;1192:			ent->damage += dmg;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1193
;1193:			G_Damage(ent, NULL, NULL, NULL, NULL,
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
CNSTP4 0
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
CNSTP4 0
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 23
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1196
;1194:				ent->damage, DAMAGE_NO_ARMOR, MOD_HIGH_PULSE);
;1195:			//trap_SendServerCommand(ent - g_entities, va("print \"Punishing Health - %d, Interval: %d ms\n\"", dmg, client->pers.punishmentIntervals[client->punishmentIntervalIndex]));
;1196:			debugPrint(ent, va("print \"Punishing Health - %d, Interval: %d ms\n\"", dmg, client->pers.punishmentIntervals[client->punishmentIntervalIndex]));
ADDRGP4 $364
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 896
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 debugPrint
CALLV
pop
line 1197
;1197:		}	
LABELV $362
line 1198
;1198:	}	
LABELV $359
line 1171
ADDRLP4 0
INDIRP4
CNSTI4 900
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 896
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDP4
INDIRI4
GEI4 $358
line 1200
;1199:
;1200:}
LABELV $353
endproc handlePunishments 56 32
export handleErgometerSpeeds
proc handleErgometerSpeeds 20 12
line 1205
;1201:// [ERGO MOD END]
;1202:
;1203:// [ERGO MOD START]
;1204:void handleErgometerSpeeds(gentity_t *ent, int msec)
;1205:{
line 1209
;1206:	gclient_t	*client;	
;1207:	int			hrMode; 	
;1208:
;1209:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 1211
;1210:
;1211:	if (ent->client->sess.ergoFlags & E_FL_HRMODE) hrMode = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $366
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $367
JUMPV
LABELV $366
line 1212
;1212:	else hrMode = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $367
line 1214
;1213:		
;1214:	if (client->pers.currentCycleRate < MIN_BIKE_RPM)
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
CNSTF4 1112014848
GEF4 $368
line 1215
;1215:	{
line 1218
;1216:
;1217:		// cycle speed too low
;1218:		client->ps.speed *= 0.3;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTF4 1050253722
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1220
;1219:
;1220:		setPerformanceZone(ent, BR_ZONE_LOW);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 setPerformanceZone
CALLV
pop
line 1222
;1221:
;1222:		if (hrMode < 1)
ADDRLP4 4
INDIRI4
CNSTI4 1
GEI4 $369
line 1223
;1223:		{
line 1225
;1224:			//TODO
;1225:		}
line 1226
;1226:	}
ADDRGP4 $369
JUMPV
LABELV $368
line 1227
;1227:	else if ((client->pers.currentCycleRate >= MIN_BIKE_RPM) && (client->pers.currentCycleRate < MED_BIKE_RPM))
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ASGNF4
ADDRLP4 8
INDIRF4
CNSTF4 1112014848
LTF4 $372
ADDRLP4 8
INDIRF4
CNSTF4 1116471296
GEF4 $372
line 1228
;1228:	{
line 1230
;1229:		// cycle speed barely acceptable
;1230:		client->ps.speed *= 0.6;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTF4 1058642330
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1232
;1231:
;1232:		setPerformanceZone(ent, BR_ZONE_POOR);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 setPerformanceZone
CALLV
pop
line 1234
;1233:
;1234:		if (hrMode < 1)
ADDRLP4 4
INDIRI4
CNSTI4 1
GEI4 $373
line 1235
;1235:		{
line 1237
;1236:			// reward items with medium frequency
;1237:			handleRewards(ent, REWARD_MED_FREQUENCY, msec);
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1045220557
ARGF4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 handleRewards
CALLV
pop
line 1238
;1238:		}
line 1239
;1239:	}
ADDRGP4 $373
JUMPV
LABELV $372
line 1240
;1240:	else if ((client->pers.currentCycleRate >= MED_BIKE_RPM) && (client->pers.currentCycleRate <= MAX_BIKE_RPM))
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ASGNF4
ADDRLP4 12
INDIRF4
CNSTF4 1116471296
LTF4 $376
ADDRLP4 12
INDIRF4
CNSTF4 1120403456
GTF4 $376
line 1241
;1241:	{
line 1243
;1242:		// cycle speed just right
;1243:		client->ps.speed *= 1.0;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTF4 1065353216
ADDRLP4 16
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1245
;1244:				
;1245:		setPerformanceZone(ent, BR_ZONE_NORMAL);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 setPerformanceZone
CALLV
pop
line 1247
;1246:			
;1247:		if (hrMode < 1)
ADDRLP4 4
INDIRI4
CNSTI4 1
GEI4 $377
line 1248
;1248:		{
line 1250
;1249:			// reward items with max frequency
;1250:			handleRewards(ent, REWARD_MAX_FREQUENCY, msec);
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1050253722
ARGF4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 handleRewards
CALLV
pop
line 1251
;1251:		}
line 1252
;1252:	}
ADDRGP4 $377
JUMPV
LABELV $376
line 1254
;1253:	else
;1254:	{
line 1256
;1255:		// cycle speed too high, but boost player anyway (heart rate too high really gives penalty)
;1256:		client->ps.speed *= 1.3;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTF4 1067869798
ADDRLP4 16
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1258
;1257:
;1258:		setPerformanceZone(ent, BR_ZONE_HIGH);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 setPerformanceZone
CALLV
pop
line 1260
;1259:
;1260:		if (hrMode < 1)
ADDRLP4 4
INDIRI4
CNSTI4 1
GEI4 $380
line 1261
;1261:		{
line 1263
;1262:			// Speed boost comes with a cost :)
;1263:			handlePunishments(ent, msec);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 handlePunishments
CALLV
pop
line 1264
;1264:		}
LABELV $380
line 1265
;1265:	}
LABELV $377
LABELV $373
LABELV $369
line 1266
;1266:}
LABELV $365
endproc handleErgometerSpeeds 20 12
export handleHeartRate
proc handleHeartRate 20 12
line 1271
;1267:// [ERGO MOD END]
;1268:
;1269:// [ERGO MOD START]
;1270:void handleHeartRate(gentity_t *ent, int msec)
;1271:{
line 1274
;1272:	gclient_t	*client;
;1273:	
;1274:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 1277
;1275:
;1276:	// HR too low
;1277:	if (client->pers.currentHeartRate < client->pers.minRecoveryHR)
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRF4
GEF4 $383
line 1278
;1278:	{
line 1279
;1279:		setPerformanceZone(ent, HR_ZONE_LOW);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 setPerformanceZone
CALLV
pop
line 1282
;1280:		//TODO penalty
;1281:		//handleRewards(ent, client->pers.rewardFrequencyAerobic, msec); 	 // DEBUG: temp allow rewards
;1282:	}
ADDRGP4 $384
JUMPV
LABELV $383
line 1284
;1283:	// recovery training
;1284:	else if (client->pers.currentHeartRate < client->pers.minAerobicHR)
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRF4
GEF4 $385
line 1285
;1285:	{
line 1286
;1286:		setPerformanceZone(ent, HR_ZONE_RECOVERY);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 setPerformanceZone
CALLV
pop
line 1287
;1287:		handleRewards(ent, client->pers.rewardFrequencyRecovery, msec);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 handleRewards
CALLV
pop
line 1288
;1288:	}
ADDRGP4 $386
JUMPV
LABELV $385
line 1290
;1289:	// aerobic training
;1290:	else if (client->pers.currentHeartRate < client->pers.minAnaerobicHR)
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 660
ADDP4
INDIRF4
GEF4 $387
line 1291
;1291:	{
line 1292
;1292:		setPerformanceZone(ent, HR_ZONE_AEROBIC);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 setPerformanceZone
CALLV
pop
line 1293
;1293:		handleRewards(ent, client->pers.rewardFrequencyAerobic, msec);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 handleRewards
CALLV
pop
line 1294
;1294:	}
ADDRGP4 $388
JUMPV
LABELV $387
line 1296
;1295:	// anaerobic training
;1296:	else if (client->pers.currentHeartRate < client->pers.maxAnaerobicHR)
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRF4
GEF4 $389
line 1297
;1297:	{
line 1298
;1298:		setPerformanceZone(ent, HR_ZONE_ANAEROBIC);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 setPerformanceZone
CALLV
pop
line 1299
;1299:		handleRewards(ent, client->pers.powerupFrequencyAnaerobic, msec);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 handleRewards
CALLV
pop
line 1300
;1300:	}
ADDRGP4 $390
JUMPV
LABELV $389
line 1303
;1301:	// HR too high
;1302:	else
;1303:	{
line 1305
;1304:		// penalty
;1305:		handlePunishments(ent, msec);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 handlePunishments
CALLV
pop
line 1306
;1306:		setPerformanceZone(ent, HR_ZONE_HIGH);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 setPerformanceZone
CALLV
pop
line 1308
;1307:		
;1308:	}
LABELV $390
LABELV $388
LABELV $386
LABELV $384
line 1310
;1309:
;1310:}
LABELV $382
endproc handleHeartRate 20 12
export ClientThink_real
proc ClientThink_real 328 16
line 1325
;1311:// [ERGO MOD END]
;1312:
;1313:
;1314:/*
;1315:==============
;1316:ClientThink
;1317:
;1318:This will be called once for each client frame, which will
;1319:usually be a couple times for each server frame on fast clients.
;1320:
;1321:If "g_synchronousClients 1" is set, this will be called exactly
;1322:once for each server frame, which makes for smooth demo recording.
;1323:==============
;1324:*/
;1325:void ClientThink_real( gentity_t *ent ) {
line 1335
;1326:	gclient_t	*client;
;1327:	pmove_t		pm;
;1328:	int			oldEventSequence;
;1329:	int			msec;
;1330:	usercmd_t	*ucmd;
;1331:	// [ERGO MOD START]
;1332:	float		rate;
;1333:	// [ERGO MOD END]
;1334:
;1335:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 1338
;1336:
;1337:	// don't think if the client is not yet connected (and thus not yet spawned in)
;1338:	if (client->pers.connected != CON_CONNECTED) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $392
line 1339
;1339:		return;
ADDRGP4 $391
JUMPV
LABELV $392
line 1342
;1340:	}
;1341:	// mark the time, so the connection sprite can be removed
;1342:	ucmd = &ent->client->pers.cmd;
ADDRLP4 236
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
line 1345
;1343:
;1344:	// sanity check the command time to prevent speedup cheating
;1345:	if ( ucmd->serverTime > level.time + 200 ) {
ADDRLP4 236
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
LEI4 $394
line 1346
;1346:		ucmd->serverTime = level.time + 200;
ADDRLP4 236
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 1348
;1347://		G_Printf("serverTime <<<<<\n" );
;1348:	}
LABELV $394
line 1349
;1349:	if ( ucmd->serverTime < level.time - 1000 ) {
ADDRLP4 236
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
SUBI4
GEI4 $398
line 1350
;1350:		ucmd->serverTime = level.time - 1000;
ADDRLP4 236
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 1352
;1351://		G_Printf("serverTime >>>>>\n" );
;1352:	} 
LABELV $398
line 1354
;1353:
;1354:	msec = ucmd->serverTime - client->ps.commandTime;
ADDRLP4 240
ADDRLP4 236
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 1357
;1355:	// following others may result in bad times, but we still want
;1356:	// to check for follow toggles
;1357:	if ( msec < 1 && client->sess.spectatorState != SPECTATOR_FOLLOW ) {
ADDRLP4 240
INDIRI4
CNSTI4 1
GEI4 $402
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 2
EQI4 $402
line 1358
;1358:		return;
ADDRGP4 $391
JUMPV
LABELV $402
line 1360
;1359:	}
;1360:	if ( msec > 200 ) {
ADDRLP4 240
INDIRI4
CNSTI4 200
LEI4 $404
line 1361
;1361:		msec = 200;
ADDRLP4 240
CNSTI4 200
ASGNI4
line 1362
;1362:	}
LABELV $404
line 1364
;1363:
;1364:	if ( pmove_msec.integer < 8 ) {
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 8
GEI4 $406
line 1365
;1365:		trap_Cvar_Set("pmove_msec", "8");
ADDRGP4 $409
ARGP4
ADDRGP4 $410
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1366
;1366:	}
ADDRGP4 $407
JUMPV
LABELV $406
line 1367
;1367:	else if (pmove_msec.integer > 33) {
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 33
LEI4 $411
line 1368
;1368:		trap_Cvar_Set("pmove_msec", "33");
ADDRGP4 $409
ARGP4
ADDRGP4 $414
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1369
;1369:	}
LABELV $411
LABELV $407
line 1371
;1370:
;1371:	if ( pmove_fixed.integer || client->pers.pmoveFixed ) {
ADDRLP4 252
CNSTI4 0
ASGNI4
ADDRGP4 pmove_fixed+12
INDIRI4
ADDRLP4 252
INDIRI4
NEI4 $418
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ADDRLP4 252
INDIRI4
EQI4 $415
LABELV $418
line 1372
;1372:		ucmd->serverTime = ((ucmd->serverTime + pmove_msec.integer-1) / pmove_msec.integer) * pmove_msec.integer;
ADDRLP4 236
INDIRP4
ADDRLP4 236
INDIRP4
INDIRI4
ADDRGP4 pmove_msec+12
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRGP4 pmove_msec+12
INDIRI4
DIVI4
ADDRGP4 pmove_msec+12
INDIRI4
MULI4
ASGNI4
line 1375
;1373:		//if (ucmd->serverTime - client->ps.commandTime <= 0)
;1374:		//	return;
;1375:	}
LABELV $415
line 1380
;1376:
;1377:	//
;1378:	// check for exiting intermission
;1379:	//
;1380:	if ( level.intermissiontime ) {
ADDRGP4 level+9128
INDIRI4
CNSTI4 0
EQI4 $422
line 1381
;1381:		ClientIntermissionThink( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientIntermissionThink
CALLV
pop
line 1382
;1382:		return;
ADDRGP4 $391
JUMPV
LABELV $422
line 1386
;1383:	}
;1384:
;1385:	// spectators don't do much
;1386:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
CNSTI4 3
NEI4 $425
line 1387
;1387:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 3
NEI4 $427
line 1388
;1388:			return;
ADDRGP4 $391
JUMPV
LABELV $427
line 1390
;1389:		}
;1390:		SpectatorThink( ent, ucmd );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 236
INDIRP4
ARGP4
ADDRGP4 SpectatorThink
CALLV
pop
line 1391
;1391:		return;
ADDRGP4 $391
JUMPV
LABELV $425
line 1395
;1392:	}
;1393:
;1394:	// check for inactivity timer, but never drop the local client of a non-dedicated server
;1395:	if ( !ClientInactivityTimer( client ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 256
ADDRGP4 ClientInactivityTimer
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
NEI4 $429
line 1396
;1396:		return;
ADDRGP4 $391
JUMPV
LABELV $429
line 1400
;1397:	}
;1398:
;1399:	// clear the rewards if time
;1400:	if ( level.time > client->rewardTime ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
LEI4 $431
line 1401
;1401:		client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 260
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 260
INDIRP4
ADDRLP4 260
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 1402
;1402:	}
LABELV $431
line 1404
;1403:
;1404:	if ( client->noclip ) {
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
EQI4 $434
line 1405
;1405:		client->ps.pm_type = PM_NOCLIP;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 1406
;1406:	} else if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 $435
JUMPV
LABELV $434
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $436
line 1407
;1407:		client->ps.pm_type = PM_DEAD;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1408
;1408:	} else {
ADDRGP4 $437
JUMPV
LABELV $436
line 1409
;1409:		client->ps.pm_type = PM_NORMAL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1410
;1410:	}
LABELV $437
LABELV $435
line 1412
;1411:
;1412:	client->ps.gravity = g_gravity.value;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRGP4 g_gravity+8
INDIRF4
CVFI4 4
ASGNI4
line 1415
;1413:
;1414:	// set speed
;1415:	client->ps.speed = g_speed.value;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 g_speed+8
INDIRF4
CVFI4 4
ASGNI4
line 1419
;1416:
;1417:	// [ERGO MOD START]	
;1418:	// heart & cycle calculations (only for human players: check if bot flag is set)
;1419:	if(!(ent->r.svFlags & SVF_BOT))
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $440
line 1420
;1420:	{	
line 1422
;1421:		// handle received bike cmd		
;1422:		if (client->buttons & BUTTON_BIKE_CYCLE)
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $442
line 1423
;1423:		{
line 1426
;1424:			// for now do not sample bike rate (more responsive behavior ingame)
;1425:			//client->pers.brSampleCount++;			
;1426:			rate = getRatePerMinute(ucmd->serverTime, client->pers.lastBikeCycleTime);
ADDRLP4 236
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ADDRGP4 getRatePerMinute
CALLF4
ASGNF4
ADDRLP4 248
ADDRLP4 260
INDIRF4
ASGNF4
line 1427
;1427:			if (rate >= 0.0) client->pers.currentCycleRate = rate;
ADDRLP4 248
INDIRF4
CNSTF4 0
LTF4 $444
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
ADDRLP4 248
INDIRF4
ASGNF4
LABELV $444
line 1428
;1428:			client->pers.lastBikeCycleTime = ucmd->serverTime;
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
ADDRLP4 236
INDIRP4
INDIRI4
ASGNI4
line 1429
;1429:			client->buttons ^= BUTTON_BIKE_CYCLE; // toggle bike cycle button
ADDRLP4 264
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
ASGNP4
ADDRLP4 264
INDIRP4
ADDRLP4 264
INDIRP4
INDIRI4
CNSTI4 4096
BXORI4
ASGNI4
line 1431
;1430:			//trap_SendServerCommand(ent - g_entities, va("print \"Bike Cycle completed: %.3f rpm\n\"", client->pers.currentCycleRate));
;1431:		}
LABELV $442
line 1433
;1432:		// auto adjusts bike rate after decay time
;1433:		if ((ucmd->serverTime - client->pers.lastBikeCycleTime) >= BR_DECAY_TIME && client->pers.currentCycleRate > 0)
ADDRLP4 236
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
SUBI4
CNSTI4 2000
LTI4 $446
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
CNSTF4 0
LEF4 $446
line 1434
;1434:		{
line 1435
;1435:			rate = getRatePerMinute(ucmd->serverTime, client->pers.lastBikeCycleTime);
ADDRLP4 236
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 264
ADDRGP4 getRatePerMinute
CALLF4
ASGNF4
ADDRLP4 248
ADDRLP4 264
INDIRF4
ASGNF4
line 1436
;1436:			if (rate > BR_RESET_RATE) client->pers.currentCycleRate = rate;
ADDRLP4 248
INDIRF4
CNSTF4 1084227584
LEF4 $448
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
ADDRLP4 248
INDIRF4
ASGNF4
ADDRGP4 $449
JUMPV
LABELV $448
line 1437
;1437:			else client->pers.currentCycleRate = 0.0;
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
CNSTF4 0
ASGNF4
LABELV $449
line 1438
;1438:		}
LABELV $446
line 1441
;1439:				
;1440:		// handle received heart cmd
;1441:		if (client->buttons & BUTTON_HEART_BEAT)
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $450
line 1442
;1442:		{
line 1444
;1443:			
;1444:			rate = getRatePerMinute(ucmd->serverTime, client->pers.lastHeartBeatTime);
ADDRLP4 236
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
ARGI4
ADDRLP4 264
ADDRGP4 getRatePerMinute
CALLF4
ASGNF4
ADDRLP4 248
ADDRLP4 264
INDIRF4
ASGNF4
line 1447
;1445:			
;1446:			// collect samples until HR_DEFAULT_NUM_SAMPLES is reached
;1447:			if (rate >= 0.0) {
ADDRLP4 248
INDIRF4
CNSTF4 0
LTF4 $452
line 1448
;1448:				client->pers.hrSampleCount++;
ADDRLP4 268
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ASGNP4
ADDRLP4 268
INDIRP4
ADDRLP4 268
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1449
;1449:				client->pers.hrSampleSum += rate;
ADDRLP4 272
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ASGNP4
ADDRLP4 272
INDIRP4
ADDRLP4 272
INDIRP4
INDIRF4
ADDRLP4 248
INDIRF4
ADDF4
ASGNF4
line 1450
;1450:			}
LABELV $452
line 1453
;1451:			
;1452:			// after # samples calculate average hr
;1453:			if (client->pers.hrSampleCount >= client->pers.hrNumSamples)
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRI4
LTI4 $454
line 1454
;1454:			{
line 1455
;1455:				client->pers.currentHeartRate = client->pers.hrSampleSum / (float) client->pers.hrSampleCount;
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 1457
;1456:				// reset counters
;1457:				client->pers.hrSampleCount = 0;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
CNSTI4 0
ASGNI4
line 1458
;1458:				client->pers.hrSampleSum = 0.0;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
CNSTF4 0
ASGNF4
line 1460
;1459:
;1460:			}
LABELV $454
line 1462
;1461:				
;1462:			client->pers.lastHeartBeatTime = ucmd->serverTime;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRLP4 236
INDIRP4
INDIRI4
ASGNI4
line 1463
;1463:			client->buttons ^= BUTTON_HEART_BEAT; // toggle heart beat button
ADDRLP4 272
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
ASGNP4
ADDRLP4 272
INDIRP4
ADDRLP4 272
INDIRP4
INDIRI4
CNSTI4 8192
BXORI4
ASGNI4
line 1464
;1464:		}
LABELV $450
line 1466
;1465:		// auto adjusts heart rate after decay time
;1466:		if ((ucmd->serverTime - client->pers.lastHeartBeatTime) >= HR_DECAY_TIME && client->pers.currentHeartRate > 0)
ADDRLP4 236
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
SUBI4
CNSTI4 2000
LTI4 $456
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRF4
CNSTF4 0
LEF4 $456
line 1467
;1467:		{
line 1468
;1468:			rate = getRatePerMinute(ucmd->serverTime, client->pers.lastHeartBeatTime);
ADDRLP4 236
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
ARGI4
ADDRLP4 268
ADDRGP4 getRatePerMinute
CALLF4
ASGNF4
ADDRLP4 248
ADDRLP4 268
INDIRF4
ASGNF4
line 1469
;1469:			if (rate > HR_RESET_RATE) client->pers.currentHeartRate = rate;
ADDRLP4 248
INDIRF4
CNSTF4 1084227584
LEF4 $458
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRLP4 248
INDIRF4
ASGNF4
ADDRGP4 $459
JUMPV
LABELV $458
line 1470
;1470:			else client->pers.currentHeartRate = 0.0;
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
CNSTF4 0
ASGNF4
LABELV $459
line 1472
;1471:			// reset counters due to inactivity
;1472:			client->pers.hrSampleCount = 0;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
CNSTI4 0
ASGNI4
line 1473
;1473:			client->pers.hrSampleSum = 0.0;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
CNSTF4 0
ASGNF4
line 1474
;1474:		}
LABELV $456
line 1478
;1475:		
;1476:		//trap_SendServerCommand(ent - g_entities, va("print \"Cycle Rate: %.3f, Heart Rate: %.3f bpm (Zone: %d)\n\"", client->pers.currentCycleRate, client->pers.currentHeartRate, client->currentRewardZone));
;1477:				
;1478:	}	
LABELV $440
line 1486
;1479:	// [ERGO MOD END]	
;1480:#ifdef MISSIONPACK
;1481:	if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT ) {
;1482:		client->ps.speed *= 1.5;
;1483:	}
;1484:	else
;1485:#endif
;1486:	if ( client->ps.powerups[PW_HASTE] ) {
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
CNSTI4 0
EQI4 $460
line 1487
;1487:		client->ps.speed *= 1.5; // [ERGO MOD] changed from 1.3 to 1.5	
ADDRLP4 260
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
ADDRLP4 260
INDIRP4
CNSTF4 1069547520
ADDRLP4 260
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1488
;1488:	}
LABELV $460
line 1491
;1489:	// [ERGO MOD START]	
;1490:	//  check cycle speed an react accordingly
;1491:	if (!(ent->r.svFlags & SVF_BOT) && !client->ps.powerups[PW_HASTE]) // humans only, skip if haste is active
ADDRLP4 260
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 260
INDIRI4
NEI4 $462
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
ADDRLP4 260
INDIRI4
NEI4 $462
line 1492
;1492:	{
line 1494
;1493:		// TODO handle powerups during haste (when HRMode = off)
;1494:		handleErgometerSpeeds(ent, msec);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 240
INDIRI4
ARGI4
ADDRGP4 handleErgometerSpeeds
CALLV
pop
line 1495
;1495:	}
LABELV $462
line 1497
;1496:	// hr stuff for humans
;1497:	if ((ent->client->sess.ergoFlags & E_FL_HRMODE) && !(ent->r.svFlags & SVF_BOT))
ADDRLP4 264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 268
CNSTI4 0
ASGNI4
ADDRLP4 264
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 268
INDIRI4
EQI4 $464
ADDRLP4 264
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 268
INDIRI4
NEI4 $464
line 1498
;1498:	{
line 1499
;1499:		handleHeartRate(ent, msec);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 240
INDIRI4
ARGI4
ADDRGP4 handleHeartRate
CALLV
pop
line 1500
;1500:	}
LABELV $464
line 1502
;1501:	// reward bot if worlddrops are disabled
;1502:	if (!(ent->client->sess.ergoFlags & E_FL_WORLDDROPS) && (ent->r.svFlags & SVF_BOT))
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 276
CNSTI4 0
ASGNI4
ADDRLP4 272
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 276
INDIRI4
NEI4 $466
ADDRLP4 272
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 276
INDIRI4
EQI4 $466
line 1503
;1503:	{
line 1504
;1504:		handleRewards(ent,REWARD_BOT_FREQUENCY, msec);
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1036831949
ARGF4
ADDRLP4 240
INDIRI4
ARGI4
ADDRGP4 handleRewards
CALLV
pop
line 1505
;1505:	}
LABELV $466
line 1509
;1506:	// [ERGO MOD END]
;1507:
;1508:	// Let go of the hook if we aren't firing
;1509:	if ( client->ps.weapon == WP_GRAPPLING_HOOK &&
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 10
NEI4 $468
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $468
ADDRLP4 236
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $468
line 1510
;1510:		client->hook && !( ucmd->buttons & BUTTON_ATTACK ) ) {
line 1511
;1511:		Weapon_HookFree(client->hook);
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
ARGP4
ADDRGP4 Weapon_HookFree
CALLV
pop
line 1512
;1512:	}
LABELV $468
line 1515
;1513:
;1514:	// set up for pmove
;1515:	oldEventSequence = client->ps.eventSequence;
ADDRLP4 244
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 1517
;1516:
;1517:	memset (&pm, 0, sizeof(pm));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 232
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1521
;1518:
;1519:	// check for the hit-scan gauntlet, don't let the action
;1520:	// go through as an attack unless it actually hits something
;1521:	if ( client->ps.weapon == WP_GAUNTLET && !( ucmd->buttons & BUTTON_TALK ) &&
ADDRLP4 288
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ADDRLP4 288
INDIRI4
NEI4 $470
ADDRLP4 292
ADDRLP4 236
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 296
CNSTI4 0
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 296
INDIRI4
NEI4 $470
ADDRLP4 292
INDIRI4
ADDRLP4 288
INDIRI4
BANDI4
ADDRLP4 296
INDIRI4
EQI4 $470
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 296
INDIRI4
GTI4 $470
line 1522
;1522:		( ucmd->buttons & BUTTON_ATTACK ) && client->ps.weaponTime <= 0 ) {
line 1523
;1523:		pm.gauntletHit = CheckGauntletAttack( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 300
ADDRGP4 CheckGauntletAttack
CALLI4
ASGNI4
ADDRLP4 4+40
ADDRLP4 300
INDIRI4
ASGNI4
line 1524
;1524:	}
LABELV $470
line 1526
;1525:
;1526:	if ( ent->flags & FL_FORCE_GESTURE ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $473
line 1527
;1527:		ent->flags &= ~FL_FORCE_GESTURE;
ADDRLP4 300
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 300
INDIRP4
ADDRLP4 300
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 1528
;1528:		ent->client->pers.cmd.buttons |= BUTTON_GESTURE;
ADDRLP4 304
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 488
ADDP4
ASGNP4
ADDRLP4 304
INDIRP4
ADDRLP4 304
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1529
;1529:	}
LABELV $473
line 1558
;1530:
;1531:#ifdef MISSIONPACK
;1532:	// check for invulnerability expansion before doing the Pmove
;1533:	if (client->ps.powerups[PW_INVULNERABILITY] ) {
;1534:		if ( !(client->ps.pm_flags & PMF_INVULEXPAND) ) {
;1535:			vec3_t mins = { -42, -42, -42 };
;1536:			vec3_t maxs = { 42, 42, 42 };
;1537:			vec3_t oldmins, oldmaxs;
;1538:
;1539:			VectorCopy (ent->r.mins, oldmins);
;1540:			VectorCopy (ent->r.maxs, oldmaxs);
;1541:			// expand
;1542:			VectorCopy (mins, ent->r.mins);
;1543:			VectorCopy (maxs, ent->r.maxs);
;1544:			trap_LinkEntity(ent);
;1545:			// check if this would get anyone stuck in this player
;1546:			if ( !StuckInOtherClient(ent) ) {
;1547:				// set flag so the expanded size will be set in PM_CheckDuck
;1548:				client->ps.pm_flags |= PMF_INVULEXPAND;
;1549:			}
;1550:			// set back
;1551:			VectorCopy (oldmins, ent->r.mins);
;1552:			VectorCopy (oldmaxs, ent->r.maxs);
;1553:			trap_LinkEntity(ent);
;1554:		}
;1555:	}
;1556:#endif
;1557:
;1558:	pm.ps = &client->ps;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 1559
;1559:	pm.cmd = *ucmd;
ADDRLP4 4+4
ADDRLP4 236
INDIRP4
INDIRB
ASGNB 24
line 1560
;1560:	if ( pm.ps->pm_type == PM_DEAD ) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $476
line 1561
;1561:		pm.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;
ADDRLP4 4+28
CNSTI4 65537
ASGNI4
line 1562
;1562:	}
ADDRGP4 $477
JUMPV
LABELV $476
line 1563
;1563:	else if ( ent->r.svFlags & SVF_BOT ) {
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $479
line 1564
;1564:		pm.tracemask = MASK_PLAYERSOLID | CONTENTS_BOTCLIP;
ADDRLP4 4+28
CNSTI4 37814273
ASGNI4
line 1565
;1565:	}
ADDRGP4 $480
JUMPV
LABELV $479
line 1566
;1566:	else {
line 1567
;1567:		pm.tracemask = MASK_PLAYERSOLID;
ADDRLP4 4+28
CNSTI4 33619969
ASGNI4
line 1568
;1568:	}
LABELV $480
LABELV $477
line 1569
;1569:	pm.trace = trap_Trace;
ADDRLP4 4+224
ADDRGP4 trap_Trace
ASGNP4
line 1570
;1570:	pm.pointcontents = trap_PointContents;
ADDRLP4 4+228
ADDRGP4 trap_PointContents
ASGNP4
line 1571
;1571:	pm.debugLevel = g_debugMove.integer;
ADDRLP4 4+32
ADDRGP4 g_debugMove+12
INDIRI4
ASGNI4
line 1572
;1572:	pm.noFootsteps = ( g_dmflags.integer & DF_NO_FOOTSTEPS ) > 0;
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
LEI4 $490
ADDRLP4 300
CNSTI4 1
ASGNI4
ADDRGP4 $491
JUMPV
LABELV $490
ADDRLP4 300
CNSTI4 0
ASGNI4
LABELV $491
ADDRLP4 4+36
ADDRLP4 300
INDIRI4
ASGNI4
line 1574
;1573:
;1574:	pm.pmove_fixed = pmove_fixed.integer | client->pers.pmoveFixed;
ADDRLP4 4+216
ADDRGP4 pmove_fixed+12
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
BORI4
ASGNI4
line 1575
;1575:	pm.pmove_msec = pmove_msec.integer;
ADDRLP4 4+220
ADDRGP4 pmove_msec+12
INDIRI4
ASGNI4
line 1577
;1576:
;1577:	VectorCopy( client->ps.origin, client->oldOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1594
;1578:
;1579:#ifdef MISSIONPACK
;1580:		if (level.intermissionQueued != 0 && g_singlePlayer.integer) {
;1581:			if ( level.time - level.intermissionQueued >= 1000  ) {
;1582:				pm.cmd.buttons = 0;
;1583:				pm.cmd.forwardmove = 0;
;1584:				pm.cmd.rightmove = 0;
;1585:				pm.cmd.upmove = 0;
;1586:				if ( level.time - level.intermissionQueued >= 2000 && level.time - level.intermissionQueued <= 2500 ) {
;1587:					trap_SendConsoleCommand( EXEC_APPEND, "centerview\n");
;1588:				}
;1589:				ent->client->ps.pm_type = PM_SPINTERMISSION;
;1590:			}
;1591:		}
;1592:		Pmove (&pm);
;1593:#else
;1594:		Pmove (&pm);
ADDRLP4 4
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 1598
;1595:#endif
;1596:
;1597:	// save results of pmove
;1598:	if ( ent->client->ps.eventSequence != oldEventSequence ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRLP4 244
INDIRI4
EQI4 $496
line 1599
;1599:		ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1600
;1600:	}
LABELV $496
line 1601
;1601:	if (g_smoothClients.integer) {
ADDRGP4 g_smoothClients+12
INDIRI4
CNSTI4 0
EQI4 $499
line 1602
;1602:		BG_PlayerStateToEntityStateExtraPolate( &ent->client->ps, &ent->s, ent->client->ps.commandTime, qtrue );
ADDRLP4 308
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 312
ADDRLP4 308
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 312
INDIRP4
ARGP4
ADDRLP4 308
INDIRP4
ARGP4
ADDRLP4 312
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityStateExtraPolate
CALLV
pop
line 1603
;1603:	}
ADDRGP4 $500
JUMPV
LABELV $499
line 1604
;1604:	else {
line 1605
;1605:		BG_PlayerStateToEntityState( &ent->client->ps, &ent->s, qtrue );
ADDRLP4 308
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 308
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 308
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1606
;1606:	}
LABELV $500
line 1607
;1607:	SendPendingPredictableEvents( &ent->client->ps );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRGP4 SendPendingPredictableEvents
CALLV
pop
line 1609
;1608:
;1609:	if ( !( ent->client->ps.eFlags & EF_FIRING ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
NEI4 $502
line 1610
;1610:		client->fireHeld = qfalse;		// for grapple
ADDRLP4 0
INDIRP4
CNSTI4 864
ADDP4
CNSTI4 0
ASGNI4
line 1611
;1611:	}
LABELV $502
line 1614
;1612:
;1613:	// use the snapped origin for linking so it matches client predicted versions
;1614:	VectorCopy( ent->s.pos.trBase, ent->r.currentOrigin );
ADDRLP4 308
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 308
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 308
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1616
;1615:
;1616:	VectorCopy (pm.mins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 4+180
INDIRB
ASGNB 12
line 1617
;1617:	VectorCopy (pm.maxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRLP4 4+192
INDIRB
ASGNB 12
line 1619
;1618:
;1619:	ent->waterlevel = pm.waterlevel;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRLP4 4+208
INDIRI4
ASGNI4
line 1620
;1620:	ent->watertype = pm.watertype;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRLP4 4+204
INDIRI4
ASGNI4
line 1623
;1621:
;1622:	// execute client events
;1623:	ClientEvents( ent, oldEventSequence );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 244
INDIRI4
ARGI4
ADDRGP4 ClientEvents
CALLV
pop
line 1626
;1624:
;1625:	// link entity now, after any personal teleporters have been used
;1626:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1627
;1627:	if ( !ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
NEI4 $508
line 1628
;1628:		G_TouchTriggers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_TouchTriggers
CALLV
pop
line 1629
;1629:	}
LABELV $508
line 1632
;1630:
;1631:	// NOTE: now copy the exact origin over otherwise clients can be snapped into solid
;1632:	VectorCopy( ent->client->ps.origin, ent->r.currentOrigin );
ADDRLP4 312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 312
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 312
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1635
;1633:
;1634:	//test for solid areas in the AAS file
;1635:	BotTestAAS(ent->r.currentOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRGP4 BotTestAAS
CALLV
pop
line 1638
;1636:
;1637:	// touch other objects
;1638:	ClientImpacts( ent, &pm );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 ClientImpacts
CALLV
pop
line 1641
;1639:
;1640:	// save results of triggers and client events
;1641:	if (ent->client->ps.eventSequence != oldEventSequence) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRLP4 244
INDIRI4
EQI4 $510
line 1642
;1642:		ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1643
;1643:	}
LABELV $510
line 1646
;1644:
;1645:	// swap and latch button actions
;1646:	client->oldbuttons = client->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ASGNI4
line 1647
;1647:	client->buttons = ucmd->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
ADDRLP4 236
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 1648
;1648:	client->latched_buttons |= client->buttons & ~client->oldbuttons;
ADDRLP4 324
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ASGNP4
ADDRLP4 324
INDIRP4
ADDRLP4 324
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
BCOMI4
BANDI4
BORI4
ASGNI4
line 1651
;1649:
;1650:	// check for respawning
;1651:	if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $513
line 1653
;1652:		// wait for the attack button to be pressed
;1653:		if ( level.time > client->respawnTime ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 840
ADDP4
INDIRI4
LEI4 $391
line 1655
;1654:			// forcerespawn is to prevent users from waiting out powerups
;1655:			if ( g_forcerespawn.integer > 0 && 
ADDRGP4 g_forcerespawn+12
INDIRI4
CNSTI4 0
LEI4 $518
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 840
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
ADDRGP4 g_forcerespawn+12
INDIRI4
MULI4
LEI4 $518
line 1656
;1656:				( level.time - client->respawnTime ) > g_forcerespawn.integer * 1000 ) {
line 1657
;1657:				respawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1658
;1658:				return;
ADDRGP4 $391
JUMPV
LABELV $518
line 1662
;1659:			}
;1660:		
;1661:			// pressing attack or use is the normal respawn method
;1662:			if ( ucmd->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) ) {
ADDRLP4 236
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 5
BANDI4
CNSTI4 0
EQI4 $391
line 1663
;1663:				respawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1664
;1664:			}
line 1665
;1665:		}
line 1666
;1666:		return;
ADDRGP4 $391
JUMPV
LABELV $513
line 1670
;1667:	}
;1668:
;1669:	// perform once-a-second actions
;1670:	ClientTimerActions( ent, msec );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 240
INDIRI4
ARGI4
ADDRGP4 ClientTimerActions
CALLV
pop
line 1671
;1671:}
LABELV $391
endproc ClientThink_real 328 16
export ClientThink
proc ClientThink 8 8
line 1680
;1672:
;1673:/*
;1674:==================
;1675:ClientThink
;1676:
;1677:A new command has arrived from the client
;1678:==================
;1679:*/
;1680:void ClientThink( int clientNum ) {
line 1683
;1681:	gentity_t *ent;
;1682:
;1683:	ent = g_entities + clientNum;
ADDRLP4 0
CNSTI4 808
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1684
;1684:	trap_GetUsercmd( clientNum, &ent->client->pers.cmd );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ARGP4
ADDRGP4 trap_GetUsercmd
CALLV
pop
line 1688
;1685:
;1686:	// mark the time we got info, so we can display the
;1687:	// phone jack if they don't get any for a while
;1688:	ent->client->lastCmdTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1690
;1689:
;1690:	if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 4
INDIRI4
NEI4 $527
ADDRGP4 g_synchronousClients+12
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $527
line 1691
;1691:		ClientThink_real( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 1692
;1692:	}
LABELV $527
line 1693
;1693:}
LABELV $525
endproc ClientThink 8 8
export G_RunClient
proc G_RunClient 4 4
line 1696
;1694:
;1695:
;1696:void G_RunClient( gentity_t *ent ) {
line 1697
;1697:	if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 0
INDIRI4
NEI4 $531
ADDRGP4 g_synchronousClients+12
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $531
line 1698
;1698:		return;
ADDRGP4 $530
JUMPV
LABELV $531
line 1700
;1699:	}
;1700:	ent->client->pers.cmd.serverTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1701
;1701:	ClientThink_real( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 1702
;1702:}
LABELV $530
endproc G_RunClient 4 4
export SpectatorClientEndFrame
proc SpectatorClientEndFrame 24 4
line 1711
;1703:
;1704:
;1705:/*
;1706:==================
;1707:SpectatorClientEndFrame
;1708:
;1709:==================
;1710:*/
;1711:void SpectatorClientEndFrame( gentity_t *ent ) {
line 1715
;1712:	gclient_t	*cl;
;1713:
;1714:	// if we are doing a chase cam or a remote view, grab the latest info
;1715:	if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 2
NEI4 $536
line 1718
;1716:		int		clientNum, flags;
;1717:
;1718:		clientNum = ent->client->sess.spectatorClient;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ASGNI4
line 1721
;1719:
;1720:		// team follow1 and team follow2 go to whatever clients are playing
;1721:		if ( clientNum == -1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
NEI4 $538
line 1722
;1722:			clientNum = level.follow1;
ADDRLP4 4
ADDRGP4 level+340
INDIRI4
ASGNI4
line 1723
;1723:		} else if ( clientNum == -2 ) {
ADDRGP4 $539
JUMPV
LABELV $538
ADDRLP4 4
INDIRI4
CNSTI4 -2
NEI4 $541
line 1724
;1724:			clientNum = level.follow2;
ADDRLP4 4
ADDRGP4 level+344
INDIRI4
ASGNI4
line 1725
;1725:		}
LABELV $541
LABELV $539
line 1726
;1726:		if ( clientNum >= 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $544
line 1727
;1727:			cl = &level.clients[ clientNum ];
ADDRLP4 0
CNSTI4 916
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1728
;1728:			if ( cl->pers.connected == CON_CONNECTED && cl->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $546
ADDRLP4 12
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
CNSTI4 3
EQI4 $546
line 1729
;1729:				flags = (cl->ps.eFlags & ~(EF_VOTED | EF_TEAMVOTED)) | (ent->client->ps.eFlags & (EF_VOTED | EF_TEAMVOTED));
ADDRLP4 16
CNSTI4 104
ASGNI4
ADDRLP4 8
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
CNSTI4 -540673
BANDI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
CNSTI4 540672
BANDI4
BORI4
ASGNI4
line 1730
;1730:				ent->client->ps = cl->ps;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ADDRLP4 0
INDIRP4
INDIRB
ASGNB 468
line 1731
;1731:				ent->client->ps.pm_flags |= PMF_FOLLOW;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 1732
;1732:				ent->client->ps.eFlags = flags;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1733
;1733:				return;
ADDRGP4 $535
JUMPV
LABELV $546
line 1734
;1734:			} else {
line 1736
;1735:				// drop them to free spectators unless they are dedicated camera followers
;1736:				if ( ent->client->sess.spectatorClient >= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
CNSTI4 0
LTI4 $548
line 1737
;1737:					ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 1
ASGNI4
line 1738
;1738:					ClientBegin( ent->client - level.clients );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 1739
;1739:				}
LABELV $548
line 1740
;1740:			}
line 1741
;1741:		}
LABELV $544
line 1742
;1742:	}
LABELV $536
line 1744
;1743:
;1744:	if ( ent->client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 3
NEI4 $550
line 1745
;1745:		ent->client->ps.pm_flags |= PMF_SCOREBOARD;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 1746
;1746:	} else {
ADDRGP4 $551
JUMPV
LABELV $550
line 1747
;1747:		ent->client->ps.pm_flags &= ~PMF_SCOREBOARD;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
line 1748
;1748:	}
LABELV $551
line 1749
;1749:}
LABELV $535
endproc SpectatorClientEndFrame 24 4
export ClientEndFrame
proc ClientEndFrame 20 16
line 1760
;1750:
;1751:/*
;1752:==============
;1753:ClientEndFrame
;1754:
;1755:Called at the end of each server frame for each connected client
;1756:A fast client will have multiple ClientThink for each ClientEdFrame,
;1757:while a slow client may have multiple ClientEndFrame between ClientThink.
;1758:==============
;1759:*/
;1760:void ClientEndFrame( gentity_t *ent ) {
line 1764
;1761:	int			i;
;1762:	clientPersistant_t	*pers;
;1763:
;1764:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
CNSTI4 3
NEI4 $553
line 1765
;1765:		SpectatorClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SpectatorClientEndFrame
CALLV
pop
line 1766
;1766:		return;
ADDRGP4 $552
JUMPV
LABELV $553
line 1769
;1767:	}
;1768:
;1769:	pers = &ent->client->pers;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
ASGNP4
line 1772
;1770:
;1771:	// turn off any expired powerups
;1772:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $555
line 1773
;1773:		if ( ent->client->ps.powerups[ i ] < level.time ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $559
line 1774
;1774:			ent->client->ps.powerups[ i ] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 1775
;1775:		}
LABELV $559
line 1776
;1776:	}
LABELV $556
line 1772
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $555
line 1809
;1777:
;1778:#ifdef MISSIONPACK
;1779:	// set powerup for player animation
;1780:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;1781:		ent->client->ps.powerups[PW_GUARD] = level.time;
;1782:	}
;1783:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT ) {
;1784:		ent->client->ps.powerups[PW_SCOUT] = level.time;
;1785:	}
;1786:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_DOUBLER ) {
;1787:		ent->client->ps.powerups[PW_DOUBLER] = level.time;
;1788:	}
;1789:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN ) {
;1790:		ent->client->ps.powerups[PW_AMMOREGEN] = level.time;
;1791:	}
;1792:	if ( ent->client->invulnerabilityTime > level.time ) {
;1793:		ent->client->ps.powerups[PW_INVULNERABILITY] = level.time;
;1794:	}
;1795:#endif
;1796:
;1797:	// save network bandwidth
;1798:#if 0
;1799:	if ( !g_synchronousClients->integer && ent->client->ps.pm_type == PM_NORMAL ) {
;1800:		// FIXME: this must change eventually for non-sync demo recording
;1801:		VectorClear( ent->client->ps.viewangles );
;1802:	}
;1803:#endif
;1804:
;1805:	//
;1806:	// If the end of unit layout is displayed, don't give
;1807:	// the player any normal movement attributes
;1808:	//
;1809:	if ( level.intermissiontime ) {
ADDRGP4 level+9128
INDIRI4
CNSTI4 0
EQI4 $562
line 1810
;1810:		return;
ADDRGP4 $552
JUMPV
LABELV $562
line 1814
;1811:	}
;1812:
;1813:	// burn from lava, etc
;1814:	P_WorldEffects (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 P_WorldEffects
CALLV
pop
line 1817
;1815:
;1816:	// apply all the damage taken this frame
;1817:	P_DamageFeedback (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 P_DamageFeedback
CALLV
pop
line 1820
;1818:
;1819:	// add the EF_CONNECTION flag if we haven't gotten commands recently
;1820:	if ( level.time - ent->client->lastCmdTime > 1000 ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
LEI4 $565
line 1821
;1821:		ent->s.eFlags |= EF_CONNECTION;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 1822
;1822:	} else {
ADDRGP4 $566
JUMPV
LABELV $565
line 1823
;1823:		ent->s.eFlags &= ~EF_CONNECTION;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
line 1824
;1824:	}
LABELV $566
line 1826
;1825:
;1826:	ent->client->ps.stats[STAT_HEALTH] = ent->health;	// FIXME: get rid of ent->health...
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ASGNI4
line 1828
;1827:
;1828:	G_SetClientSound (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_SetClientSound
CALLV
pop
line 1831
;1829:
;1830:	// set the latest infor
;1831:	if (g_smoothClients.integer) {
ADDRGP4 g_smoothClients+12
INDIRI4
CNSTI4 0
EQI4 $568
line 1832
;1832:		BG_PlayerStateToEntityStateExtraPolate( &ent->client->ps, &ent->s, ent->client->ps.commandTime, qtrue );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityStateExtraPolate
CALLV
pop
line 1833
;1833:	}
ADDRGP4 $569
JUMPV
LABELV $568
line 1834
;1834:	else {
line 1835
;1835:		BG_PlayerStateToEntityState( &ent->client->ps, &ent->s, qtrue );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1836
;1836:	}
LABELV $569
line 1837
;1837:	SendPendingPredictableEvents( &ent->client->ps );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRGP4 SendPendingPredictableEvents
CALLV
pop
line 1842
;1838:
;1839:	// set the bit for the reachability area the client is currently in
;1840://	i = trap_AAS_PointReachabilityAreaIndex( ent->client->ps.origin );
;1841://	ent->client->areabits[i >> 3] |= 1 << (i & 7);
;1842:}
LABELV $552
endproc ClientEndFrame 20 16
import BotTestSolid
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Milliseconds
import trap_Error
import trap_Printf
import g_proxMineTimeout
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_rankings
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_blueteam
import g_redteam
import g_cubeTimeout
import g_obeliskRespawnDelay
import g_obeliskRegenAmount
import g_obeliskRegenPeriod
import g_obeliskHealth
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_teamAutoJoin
import g_allowVote
import g_blood
import g_doWarmup
import g_warmup
import g_motd
import g_synchronousClients
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlyFire
import g_capturelimit
import g_timelimit
import g_fraglimit
import g_dmflags
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_gametype
import g_entities
import level
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import AddTeamScore
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import BotTestAAS
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import Svcmd_AbortPodium_f
import SpawnModelsOnVictoryPads
import UpdateTournamentInfo
import G_WriteSessionData
import G_InitWorldSession
import G_InitSessionData
import G_ReadSessionData
import Svcmd_GameMem_f
import G_InitMemory
import G_Alloc
import CheckObeliskAttack
import Team_CheckDroppedItem
import OnSameTeam
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_Error
import G_Printf
import SendScoreboardMessageToAllClients
import G_LogPrintf
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import DeathmatchScoreboardMessage
import G_SetStats
import MoveClientToIntermission
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import InitClientResp
import InitClientPersistant
import BeginIntermission
import respawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import TeamCount
import Weapon_HookThink
import Weapon_HookFree
import CheckGauntletAttack
import SnapVectorTowards
import CalcMuzzlePoint
import LogAccuracyHit
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import fire_grapple
import fire_bfg
import fire_rocket
import fire_grenade
import fire_plasma
import fire_blaster
import G_RunMissile
import TossClientCubes
import TossClientItems
import body_die
import G_InvulnerabilityEffect
import G_RadiusDamage
import G_Damage
import CanDamage
import debugPrint
import getRatePerMinute
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vectoyaw
import vtos
import tv
import G_TouchSolids
import G_EntitiesFree
import G_FreeEntity
import G_Sound
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_Find
import G_KillBox
import G_TeamCommand
import G_SoundIndex
import G_ModelIndex
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item
import Add_Ammo
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
import g_rewardPowerupsHQ
import g_rewardPowerupsMQ
import g_rewardPowerupsLQ
import g_rewardWeaponsHQ
import g_rewardWeaponsMQ
import g_rewardWeaponsLQ
import g_rewardItemsHQ
import g_rewardItemsMQ
import g_rewardItemsLQ
import g_qualityDropPercentages
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_CanItemBeGrabbed
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindItem
import bg_numItems
import bg_itemlist
import Pmove
import PM_UpdateViewAngles
import Com_Printf
import Com_Error
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_ValueForKey
import va
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_SkipPath
import Com_Clamp
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import bytedirs
import Com_Memcpy
import Com_Memset
import Hunk_Alloc
import FloatSwap
import LongSwap
import ShortSwap
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import sscanf
import vsprintf
import _atoi
import atoi
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $414
byte 1 51
byte 1 51
byte 1 0
align 1
LABELV $410
byte 1 56
byte 1 0
align 1
LABELV $409
byte 1 112
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $364
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 80
byte 1 117
byte 1 110
byte 1 105
byte 1 115
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 32
byte 1 45
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 73
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 118
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $363
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 80
byte 1 117
byte 1 110
byte 1 105
byte 1 115
byte 1 104
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 32
byte 1 45
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 73
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 118
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $325
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 82
byte 1 69
byte 1 87
byte 1 65
byte 1 82
byte 1 68
byte 1 73
byte 1 78
byte 1 71
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 80
byte 1 79
byte 1 87
byte 1 69
byte 1 82
byte 1 85
byte 1 80
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $317
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 82
byte 1 69
byte 1 87
byte 1 65
byte 1 82
byte 1 68
byte 1 73
byte 1 78
byte 1 71
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $309
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 82
byte 1 69
byte 1 87
byte 1 65
byte 1 82
byte 1 68
byte 1 73
byte 1 78
byte 1 71
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $308
byte 1 72
byte 1 81
byte 1 0
align 1
LABELV $305
byte 1 77
byte 1 81
byte 1 0
align 1
LABELV $302
byte 1 76
byte 1 81
byte 1 0
align 1
LABELV $299
byte 1 85
byte 1 78
byte 1 75
byte 1 78
byte 1 79
byte 1 87
byte 1 78
byte 1 0
align 1
LABELV $228
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 66
byte 1 82
byte 1 32
byte 1 90
byte 1 79
byte 1 78
byte 1 69
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 114
byte 1 112
byte 1 109
byte 1 41
byte 1 44
byte 1 32
byte 1 72
byte 1 82
byte 1 32
byte 1 90
byte 1 79
byte 1 78
byte 1 69
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 98
byte 1 112
byte 1 109
byte 1 41
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $225
byte 1 97
byte 1 110
byte 1 97
byte 1 101
byte 1 114
byte 1 111
byte 1 98
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $222
byte 1 97
byte 1 101
byte 1 114
byte 1 111
byte 1 98
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $219
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $214
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 0
align 1
LABELV $211
byte 1 110
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $208
byte 1 112
byte 1 111
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $205
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $202
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $200
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 110
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 117
byte 1 110
byte 1 116
byte 1 105
byte 1 108
byte 1 32
byte 1 105
byte 1 110
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $196
byte 1 68
byte 1 114
byte 1 111
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 105
byte 1 110
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $92
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 103
byte 1 117
byte 1 114
byte 1 112
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $91
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 103
byte 1 117
byte 1 114
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $88
byte 1 42
byte 1 100
byte 1 114
byte 1 111
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
