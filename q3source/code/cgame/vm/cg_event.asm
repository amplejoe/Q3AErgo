data
export cg_weaponHierarchy
align 4
LABELV cg_weaponHierarchy
byte 4 0
byte 4 10
byte 4 1
byte 4 2
byte 4 4
byte 4 3
byte 4 8
byte 4 6
byte 4 5
byte 4 7
byte 4 9
bss
align 1
LABELV $71
skip 64
export CG_PlaceString
code
proc CG_PlaceString 12 20
file "../cg_event.c"
line 45
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
;23:// cg_event.c -- handle entity events at snapshot or playerstate transitions
;24:
;25:#include "cg_local.h"
;26:
;27:// for the voice chats
;28:#ifdef MISSIONPACK // bk001205
;29:#include "../../ui/menudef.h"
;30:#endif
;31:
;32:// [ERGO MOD START]
;33:const weapon_t	cg_weaponHierarchy[] = { WP_NONE, WP_GRAPPLING_HOOK, WP_GAUNTLET, WP_MACHINEGUN, WP_GRENADE_LAUNCHER, WP_SHOTGUN, WP_PLASMAGUN, WP_LIGHTNING, WP_ROCKET_LAUNCHER, WP_RAILGUN, WP_BFG };
;34:// [ERGO MOD END]
;35:
;36://==========================================================================
;37:
;38:/*
;39:===================
;40:CG_PlaceString
;41:
;42:Also called by scoreboard drawing
;43:===================
;44:*/
;45:const char	*CG_PlaceString( int rank ) {
line 49
;46:	static char	str[64];
;47:	char	*s, *t;
;48:
;49:	if ( rank & RANK_TIED_FLAG ) {
ADDRFP4 0
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $72
line 50
;50:		rank &= ~RANK_TIED_FLAG;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 51
;51:		t = "Tied for ";
ADDRLP4 4
ADDRGP4 $74
ASGNP4
line 52
;52:	} else {
ADDRGP4 $73
JUMPV
LABELV $72
line 53
;53:		t = "";
ADDRLP4 4
ADDRGP4 $75
ASGNP4
line 54
;54:	}
LABELV $73
line 56
;55:
;56:	if ( rank == 1 ) {
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $76
line 57
;57:		s = S_COLOR_BLUE "1st" S_COLOR_WHITE;		// draw in blue
ADDRLP4 0
ADDRGP4 $78
ASGNP4
line 58
;58:	} else if ( rank == 2 ) {
ADDRGP4 $77
JUMPV
LABELV $76
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $79
line 59
;59:		s = S_COLOR_RED "2nd" S_COLOR_WHITE;		// draw in red
ADDRLP4 0
ADDRGP4 $81
ASGNP4
line 60
;60:	} else if ( rank == 3 ) {
ADDRGP4 $80
JUMPV
LABELV $79
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $82
line 61
;61:		s = S_COLOR_YELLOW "3rd" S_COLOR_WHITE;		// draw in yellow
ADDRLP4 0
ADDRGP4 $84
ASGNP4
line 62
;62:	} else if ( rank == 11 ) {
ADDRGP4 $83
JUMPV
LABELV $82
ADDRFP4 0
INDIRI4
CNSTI4 11
NEI4 $85
line 63
;63:		s = "11th";
ADDRLP4 0
ADDRGP4 $87
ASGNP4
line 64
;64:	} else if ( rank == 12 ) {
ADDRGP4 $86
JUMPV
LABELV $85
ADDRFP4 0
INDIRI4
CNSTI4 12
NEI4 $88
line 65
;65:		s = "12th";
ADDRLP4 0
ADDRGP4 $90
ASGNP4
line 66
;66:	} else if ( rank == 13 ) {
ADDRGP4 $89
JUMPV
LABELV $88
ADDRFP4 0
INDIRI4
CNSTI4 13
NEI4 $91
line 67
;67:		s = "13th";
ADDRLP4 0
ADDRGP4 $93
ASGNP4
line 68
;68:	} else if ( rank % 10 == 1 ) {
ADDRGP4 $92
JUMPV
LABELV $91
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 1
NEI4 $94
line 69
;69:		s = va("%ist", rank);
ADDRGP4 $96
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 70
;70:	} else if ( rank % 10 == 2 ) {
ADDRGP4 $95
JUMPV
LABELV $94
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 2
NEI4 $97
line 71
;71:		s = va("%ind", rank);
ADDRGP4 $99
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 72
;72:	} else if ( rank % 10 == 3 ) {
ADDRGP4 $98
JUMPV
LABELV $97
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 3
NEI4 $100
line 73
;73:		s = va("%ird", rank);
ADDRGP4 $102
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 74
;74:	} else {
ADDRGP4 $101
JUMPV
LABELV $100
line 75
;75:		s = va("%ith", rank);
ADDRGP4 $103
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 76
;76:	}
LABELV $101
LABELV $98
LABELV $95
LABELV $92
LABELV $89
LABELV $86
LABELV $83
LABELV $80
LABELV $77
line 78
;77:
;78:	Com_sprintf( str, sizeof( str ), "%s%s", t, s );
ADDRGP4 $71
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $104
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 79
;79:	return str;
ADDRGP4 $71
RETP4
LABELV $70
endproc CG_PlaceString 12 20
proc CG_Obituary 132 20
line 87
;80:}
;81:
;82:/*
;83:=============
;84:CG_Obituary
;85:=============
;86:*/
;87:static void CG_Obituary( entityState_t *ent ) {
line 99
;88:	int			mod;
;89:	int			target, attacker;
;90:	char		*message;
;91:	char		*message2;
;92:	const char	*targetInfo;
;93:	const char	*attackerInfo;
;94:	char		targetName[32];
;95:	char		attackerName[32];
;96:	gender_t	gender;
;97:	clientInfo_t	*ci;
;98:
;99:	target = ent->otherEntityNum;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 100
;100:	attacker = ent->otherEntityNum2;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 101
;101:	mod = ent->eventParm;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 103
;102:
;103:	if ( target < 0 || target >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $108
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $106
LABELV $108
line 104
;104:		CG_Error( "CG_Obituary: target out of range" );
ADDRGP4 $109
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 105
;105:	}
LABELV $106
line 106
;106:	ci = &cgs.clientinfo[target];
ADDRLP4 92
CNSTI4 1708
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 108
;107:
;108:	if ( attacker < 0 || attacker >= MAX_CLIENTS ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $113
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $111
LABELV $113
line 109
;109:		attacker = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 1022
ASGNI4
line 110
;110:		attackerInfo = NULL;
ADDRLP4 52
CNSTP4 0
ASGNP4
line 111
;111:	} else {
ADDRGP4 $112
JUMPV
LABELV $111
line 112
;112:		attackerInfo = CG_ConfigString( CS_PLAYERS + attacker );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 108
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 52
ADDRLP4 108
INDIRP4
ASGNP4
line 113
;113:	}
LABELV $112
line 115
;114:
;115:	targetInfo = CG_ConfigString( CS_PLAYERS + target );
ADDRLP4 4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 108
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 48
ADDRLP4 108
INDIRP4
ASGNP4
line 116
;116:	if ( !targetInfo ) {
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $114
line 117
;117:		return;
ADDRGP4 $105
JUMPV
LABELV $114
line 119
;118:	}
;119:	Q_strncpyz( targetName, Info_ValueForKey( targetInfo, "n" ), sizeof(targetName) - 2);
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 $116
ARGP4
ADDRLP4 112
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 112
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 120
;120:	strcat( targetName, S_COLOR_WHITE );
ADDRLP4 8
ARGP4
ADDRGP4 $117
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 122
;121:
;122:	message2 = "";
ADDRLP4 88
ADDRGP4 $75
ASGNP4
line 126
;123:
;124:	// check for single client messages
;125:
;126:	switch( mod ) {
ADDRLP4 44
INDIRI4
CNSTI4 14
LTI4 $118
ADDRLP4 44
INDIRI4
CNSTI4 23
GTI4 $118
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $138-56
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $138
address $126
address $130
address $132
address $124
address $118
address $122
address $120
address $134
address $136
address $128
code
LABELV $120
line 128
;127:	case MOD_SUICIDE:
;128:		message = "suicides";
ADDRLP4 40
ADDRGP4 $121
ASGNP4
line 129
;129:		break;
ADDRGP4 $119
JUMPV
LABELV $122
line 131
;130:	case MOD_FALLING:
;131:		message = "cratered";
ADDRLP4 40
ADDRGP4 $123
ASGNP4
line 132
;132:		break;
ADDRGP4 $119
JUMPV
LABELV $124
line 134
;133:	case MOD_CRUSH:
;134:		message = "was squished";
ADDRLP4 40
ADDRGP4 $125
ASGNP4
line 135
;135:		break;
ADDRGP4 $119
JUMPV
LABELV $126
line 137
;136:	case MOD_WATER:
;137:		message = "sank like a rock";
ADDRLP4 40
ADDRGP4 $127
ASGNP4
line 138
;138:		break;
ADDRGP4 $119
JUMPV
LABELV $128
line 141
;139:	// [ERGO MOD START]
;140:	case MOD_HIGH_PULSE:
;141:		message = "exercised too hard";
ADDRLP4 40
ADDRGP4 $129
ASGNP4
line 142
;142:		break;
ADDRGP4 $119
JUMPV
LABELV $130
line 145
;143:	// [ERGO MOD END]
;144:	case MOD_SLIME:
;145:		message = "melted";
ADDRLP4 40
ADDRGP4 $131
ASGNP4
line 146
;146:		break;
ADDRGP4 $119
JUMPV
LABELV $132
line 148
;147:	case MOD_LAVA:
;148:		message = "does a back flip into the lava";
ADDRLP4 40
ADDRGP4 $133
ASGNP4
line 149
;149:		break;
ADDRGP4 $119
JUMPV
LABELV $134
line 151
;150:	case MOD_TARGET_LASER:
;151:		message = "saw the light";
ADDRLP4 40
ADDRGP4 $135
ASGNP4
line 152
;152:		break;
ADDRGP4 $119
JUMPV
LABELV $136
line 154
;153:	case MOD_TRIGGER_HURT:
;154:		message = "was in the wrong place";
ADDRLP4 40
ADDRGP4 $137
ASGNP4
line 155
;155:		break;
ADDRGP4 $119
JUMPV
LABELV $118
line 157
;156:	default:
;157:		message = NULL;
ADDRLP4 40
CNSTP4 0
ASGNP4
line 158
;158:		break;
LABELV $119
line 161
;159:	}
;160:
;161:	if (attacker == target) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $140
line 162
;162:		gender = ci->gender;
ADDRLP4 96
ADDRLP4 92
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 163
;163:		switch (mod) {
ADDRLP4 124
CNSTI4 5
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 124
INDIRI4
EQI4 $144
ADDRLP4 44
INDIRI4
CNSTI4 7
EQI4 $152
ADDRLP4 44
INDIRI4
CNSTI4 9
EQI4 $160
ADDRLP4 44
INDIRI4
ADDRLP4 124
INDIRI4
LTI4 $142
LABELV $177
ADDRLP4 44
INDIRI4
CNSTI4 13
EQI4 $168
ADDRGP4 $142
JUMPV
LABELV $144
line 170
;164:#ifdef MISSIONPACK
;165:		case MOD_KAMIKAZE:
;166:			message = "goes out with a bang";
;167:			break;
;168:#endif
;169:		case MOD_GRENADE_SPLASH:
;170:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $145
line 171
;171:				message = "tripped on her own grenade";
ADDRLP4 40
ADDRGP4 $147
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $145
line 172
;172:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $148
line 173
;173:				message = "tripped on its own grenade";
ADDRLP4 40
ADDRGP4 $150
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $148
line 175
;174:			else
;175:				message = "tripped on his own grenade";
ADDRLP4 40
ADDRGP4 $151
ASGNP4
line 176
;176:			break;
ADDRGP4 $143
JUMPV
LABELV $152
line 178
;177:		case MOD_ROCKET_SPLASH:
;178:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $153
line 179
;179:				message = "blew herself up";
ADDRLP4 40
ADDRGP4 $155
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $153
line 180
;180:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $156
line 181
;181:				message = "blew itself up";
ADDRLP4 40
ADDRGP4 $158
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $156
line 183
;182:			else
;183:				message = "blew himself up";
ADDRLP4 40
ADDRGP4 $159
ASGNP4
line 184
;184:			break;
ADDRGP4 $143
JUMPV
LABELV $160
line 186
;185:		case MOD_PLASMA_SPLASH:
;186:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $161
line 187
;187:				message = "melted herself";
ADDRLP4 40
ADDRGP4 $163
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $161
line 188
;188:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $164
line 189
;189:				message = "melted itself";
ADDRLP4 40
ADDRGP4 $166
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $164
line 191
;190:			else
;191:				message = "melted himself";
ADDRLP4 40
ADDRGP4 $167
ASGNP4
line 192
;192:			break;
ADDRGP4 $143
JUMPV
LABELV $168
line 194
;193:		case MOD_BFG_SPLASH:
;194:			message = "should have used a smaller gun";
ADDRLP4 40
ADDRGP4 $169
ASGNP4
line 195
;195:			break;
ADDRGP4 $143
JUMPV
LABELV $142
line 208
;196:#ifdef MISSIONPACK
;197:		case MOD_PROXIMITY_MINE:
;198:			if( gender == GENDER_FEMALE ) {
;199:				message = "found her prox mine";
;200:			} else if ( gender == GENDER_NEUTER ) {
;201:				message = "found it's prox mine";
;202:			} else {
;203:				message = "found his prox mine";
;204:			}
;205:			break;
;206:#endif
;207:		default:
;208:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $170
line 209
;209:				message = "killed herself";
ADDRLP4 40
ADDRGP4 $172
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $170
line 210
;210:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $173
line 211
;211:				message = "killed itself";
ADDRLP4 40
ADDRGP4 $175
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $173
line 213
;212:			else
;213:				message = "killed himself";
ADDRLP4 40
ADDRGP4 $176
ASGNP4
line 214
;214:			break;
LABELV $143
line 216
;215:		}
;216:	}
LABELV $140
line 218
;217:
;218:	if (message) {
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $178
line 219
;219:		CG_Printf( "%s %s.\n", targetName, message);
ADDRGP4 $180
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 220
;220:		return;
ADDRGP4 $105
JUMPV
LABELV $178
line 224
;221:	}
;222:
;223:	// check for kill messages from the current clientNum
;224:	if ( attacker == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $181
line 227
;225:		char	*s;
;226:
;227:		if ( cgs.gametype < GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
GEI4 $184
line 228
;228:			s = va("You fragged %s\n%s place with %i", targetName, 
ADDRGP4 cg+36
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 124
ADDRGP4 CG_PlaceString
CALLP4
ASGNP4
ADDRGP4 $187
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRLP4 128
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 120
ADDRLP4 128
INDIRP4
ASGNP4
line 231
;229:				CG_PlaceString( cg.snap->ps.persistant[PERS_RANK] + 1 ),
;230:				cg.snap->ps.persistant[PERS_SCORE] );
;231:		} else {
ADDRGP4 $185
JUMPV
LABELV $184
line 232
;232:			s = va("You fragged %s", targetName );
ADDRGP4 $190
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 124
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 120
ADDRLP4 124
INDIRP4
ASGNP4
line 233
;233:		}
LABELV $185
line 239
;234:#ifdef MISSIONPACK
;235:		if (!(cg_singlePlayerActive.integer && cg_cameraOrbit.integer)) {
;236:			CG_CenterPrint( s, SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
;237:		} 
;238:#else
;239:		CG_CenterPrint( s, SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRLP4 120
INDIRP4
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 243
;240:#endif
;241:
;242:		// print the text message as well
;243:	}
LABELV $181
line 246
;244:
;245:	// check for double client messages
;246:	if ( !attackerInfo ) {
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $191
line 247
;247:		attacker = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 1022
ASGNI4
line 248
;248:		strcpy( attackerName, "noname" );
ADDRLP4 56
ARGP4
ADDRGP4 $193
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 249
;249:	} else {
ADDRGP4 $192
JUMPV
LABELV $191
line 250
;250:		Q_strncpyz( attackerName, Info_ValueForKey( attackerInfo, "n" ), sizeof(attackerName) - 2);
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 $116
ARGP4
ADDRLP4 120
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 56
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 251
;251:		strcat( attackerName, S_COLOR_WHITE );
ADDRLP4 56
ARGP4
ADDRGP4 $117
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 253
;252:		// check for kill messages about the current clientNum
;253:		if ( target == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $194
line 254
;254:			Q_strncpyz( cg.killerName, attackerName, sizeof( cg.killerName ) );
ADDRGP4 cg+114332
ARGP4
ADDRLP4 56
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 255
;255:		}
LABELV $194
line 256
;256:	}
LABELV $192
line 258
;257:
;258:	if ( attacker != ENTITYNUM_WORLD ) {
ADDRLP4 0
INDIRI4
CNSTI4 1022
EQI4 $199
line 259
;259:		switch (mod) {
ADDRLP4 44
INDIRI4
CNSTI4 1
LTI4 $201
ADDRLP4 44
INDIRI4
CNSTI4 24
GTI4 $201
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $236-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $236
address $209
address $205
address $207
address $211
address $214
address $217
address $219
address $221
address $224
address $225
address $227
address $229
address $229
address $201
address $201
address $201
address $201
address $232
address $201
address $201
address $201
address $201
address $201
address $203
code
LABELV $203
line 261
;260:		case MOD_GRAPPLE:
;261:			message = "was caught by";
ADDRLP4 40
ADDRGP4 $204
ASGNP4
line 262
;262:			break;
ADDRGP4 $202
JUMPV
LABELV $205
line 264
;263:		case MOD_GAUNTLET:
;264:			message = "was pummeled by";
ADDRLP4 40
ADDRGP4 $206
ASGNP4
line 265
;265:			break;
ADDRGP4 $202
JUMPV
LABELV $207
line 267
;266:		case MOD_MACHINEGUN:
;267:			message = "was machinegunned by";
ADDRLP4 40
ADDRGP4 $208
ASGNP4
line 268
;268:			break;
ADDRGP4 $202
JUMPV
LABELV $209
line 270
;269:		case MOD_SHOTGUN:
;270:			message = "was gunned down by";
ADDRLP4 40
ADDRGP4 $210
ASGNP4
line 271
;271:			break;
ADDRGP4 $202
JUMPV
LABELV $211
line 273
;272:		case MOD_GRENADE:
;273:			message = "ate";
ADDRLP4 40
ADDRGP4 $212
ASGNP4
line 274
;274:			message2 = "'s grenade";
ADDRLP4 88
ADDRGP4 $213
ASGNP4
line 275
;275:			break;
ADDRGP4 $202
JUMPV
LABELV $214
line 277
;276:		case MOD_GRENADE_SPLASH:
;277:			message = "was shredded by";
ADDRLP4 40
ADDRGP4 $215
ASGNP4
line 278
;278:			message2 = "'s shrapnel";
ADDRLP4 88
ADDRGP4 $216
ASGNP4
line 279
;279:			break;
ADDRGP4 $202
JUMPV
LABELV $217
line 281
;280:		case MOD_ROCKET:
;281:			message = "ate";
ADDRLP4 40
ADDRGP4 $212
ASGNP4
line 282
;282:			message2 = "'s rocket";
ADDRLP4 88
ADDRGP4 $218
ASGNP4
line 283
;283:			break;
ADDRGP4 $202
JUMPV
LABELV $219
line 285
;284:		case MOD_ROCKET_SPLASH:
;285:			message = "almost dodged";
ADDRLP4 40
ADDRGP4 $220
ASGNP4
line 286
;286:			message2 = "'s rocket";
ADDRLP4 88
ADDRGP4 $218
ASGNP4
line 287
;287:			break;
ADDRGP4 $202
JUMPV
LABELV $221
line 289
;288:		case MOD_PLASMA:
;289:			message = "was melted by";
ADDRLP4 40
ADDRGP4 $222
ASGNP4
line 290
;290:			message2 = "'s plasmagun";
ADDRLP4 88
ADDRGP4 $223
ASGNP4
line 291
;291:			break;
ADDRGP4 $202
JUMPV
LABELV $224
line 293
;292:		case MOD_PLASMA_SPLASH:
;293:			message = "was melted by";
ADDRLP4 40
ADDRGP4 $222
ASGNP4
line 294
;294:			message2 = "'s plasmagun";
ADDRLP4 88
ADDRGP4 $223
ASGNP4
line 295
;295:			break;
ADDRGP4 $202
JUMPV
LABELV $225
line 297
;296:		case MOD_RAILGUN:
;297:			message = "was railed by";
ADDRLP4 40
ADDRGP4 $226
ASGNP4
line 298
;298:			break;
ADDRGP4 $202
JUMPV
LABELV $227
line 300
;299:		case MOD_LIGHTNING:
;300:			message = "was electrocuted by";
ADDRLP4 40
ADDRGP4 $228
ASGNP4
line 301
;301:			break;
ADDRGP4 $202
JUMPV
LABELV $229
line 304
;302:		case MOD_BFG:
;303:		case MOD_BFG_SPLASH:
;304:			message = "was blasted by";
ADDRLP4 40
ADDRGP4 $230
ASGNP4
line 305
;305:			message2 = "'s BFG";
ADDRLP4 88
ADDRGP4 $231
ASGNP4
line 306
;306:			break;
ADDRGP4 $202
JUMPV
LABELV $232
line 328
;307:#ifdef MISSIONPACK
;308:		case MOD_NAIL:
;309:			message = "was nailed by";
;310:			break;
;311:		case MOD_CHAINGUN:
;312:			message = "got lead poisoning from";
;313:			message2 = "'s Chaingun";
;314:			break;
;315:		case MOD_PROXIMITY_MINE:
;316:			message = "was too close to";
;317:			message2 = "'s Prox Mine";
;318:			break;
;319:		case MOD_KAMIKAZE:
;320:			message = "falls to";
;321:			message2 = "'s Kamikaze blast";
;322:			break;
;323:		case MOD_JUICED:
;324:			message = "was juiced by";
;325:			break;
;326:#endif
;327:		case MOD_TELEFRAG:
;328:			message = "tried to invade";
ADDRLP4 40
ADDRGP4 $233
ASGNP4
line 329
;329:			message2 = "'s personal space";
ADDRLP4 88
ADDRGP4 $234
ASGNP4
line 330
;330:			break;
ADDRGP4 $202
JUMPV
LABELV $201
line 332
;331:		default:
;332:			message = "was killed by";
ADDRLP4 40
ADDRGP4 $235
ASGNP4
line 333
;333:			break;
LABELV $202
line 336
;334:		}
;335:
;336:		if (message) {
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $238
line 337
;337:			CG_Printf( "%s %s %s%s\n", 
ADDRGP4 $240
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 339
;338:				targetName, message, attackerName, message2);
;339:			return;
ADDRGP4 $105
JUMPV
LABELV $238
line 341
;340:		}
;341:	}
LABELV $199
line 344
;342:
;343:	// we don't know what it was
;344:	CG_Printf( "%s died.\n", targetName );
ADDRGP4 $241
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 345
;345:}
LABELV $105
endproc CG_Obituary 132 20
proc CG_UseItem 32 16
line 354
;346:
;347://==========================================================================
;348:
;349:/*
;350:===============
;351:CG_UseItem
;352:===============
;353:*/
;354:static void CG_UseItem( centity_t *cent ) {
line 360
;355:	clientInfo_t *ci;
;356:	int			itemNum, clientNum;
;357:	gitem_t		*item;
;358:	entityState_t *es;
;359:
;360:	es = &cent->currentState;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 362
;361:	
;362:	itemNum = (es->event & ~EV_EVENT_BITS) - EV_USE_ITEM0;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 24
SUBI4
ASGNI4
line 363
;363:	if ( itemNum < 0 || itemNum > HI_NUM_HOLDABLE ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $245
ADDRLP4 0
INDIRI4
CNSTI4 6
LEI4 $243
LABELV $245
line 364
;364:		itemNum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 365
;365:	}
LABELV $243
line 368
;366:
;367:	// print a message if the local player
;368:	if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $246
line 369
;369:		if ( !itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $249
line 370
;370:			CG_CenterPrint( "No item to use", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $251
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 371
;371:		} else {
ADDRGP4 $250
JUMPV
LABELV $249
line 372
;372:			item = BG_FindItemForHoldable( itemNum );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindItemForHoldable
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 373
;373:			CG_CenterPrint( va("Use %s", item->pickup_name), SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $252
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 374
;374:		}
LABELV $250
line 375
;375:	}
LABELV $246
line 377
;376:
;377:	switch ( itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $255
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $254
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $259
ADDRGP4 $253
JUMPV
LABELV $253
LABELV $255
line 380
;378:	default:
;379:	case HI_NONE:
;380:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useNothingSound );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+152340+540
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 381
;381:		break;
ADDRGP4 $254
JUMPV
line 384
;382:
;383:	case HI_TELEPORTER:
;384:		break;
LABELV $259
line 387
;385:
;386:	case HI_MEDKIT:
;387:		clientNum = cent->currentState.clientNum;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 388
;388:		if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 28
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $260
ADDRLP4 28
INDIRI4
CNSTI4 64
GEI4 $260
line 389
;389:			ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 16
CNSTI4 1708
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 390
;390:			ci->medkitUsageTime = cg.time;
ADDRLP4 16
INDIRP4
CNSTI4 144
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 391
;391:		}
LABELV $260
line 392
;392:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.medkitSound );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+152340+860
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 393
;393:		break;
LABELV $254
line 407
;394:
;395:#ifdef MISSIONPACK
;396:	case HI_KAMIKAZE:
;397:		break;
;398:
;399:	case HI_PORTAL:
;400:		break;
;401:	case HI_INVULNERABILITY:
;402:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useInvulnerabilitySound );
;403:		break;
;404:#endif
;405:	}
;406:
;407:}
LABELV $242
endproc CG_UseItem 32 16
export isWeaponBetter
proc isWeaponBetter 12 0
line 412
;408:
;409:
;410:// [ERGO MOD START]
;411:qboolean isWeaponBetter(weapon_t weapon1, weapon_t weapon2)
;412:{
line 417
;413:	int currentWeaponIndex;
;414:	int weaponIndex;
;415:	int i;
;416:	
;417:	for (i = 0; i < NUM_HIERARCHY_WEAPONS; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $267
line 418
;418:	{
line 419
;419:		if (weapon1 == cg_weaponHierarchy[i]) currentWeaponIndex = i;
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_weaponHierarchy
ADDP4
INDIRI4
NEI4 $271
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $271
line 420
;420:		if (weapon2 == cg_weaponHierarchy[i]) weaponIndex = i;
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_weaponHierarchy
ADDP4
INDIRI4
NEI4 $273
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $273
line 421
;421:	}
LABELV $268
line 417
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 11
LTI4 $267
line 423
;422:
;423:	if (currentWeaponIndex < weaponIndex) return qtrue;
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
GEI4 $275
CNSTI4 1
RETI4
ADDRGP4 $266
JUMPV
LABELV $275
line 424
;424:	else return qfalse;
CNSTI4 0
RETI4
LABELV $266
endproc isWeaponBetter 12 0
proc CG_ItemPickup 4 8
line 437
;425:}
;426:// [ERGO MOD END]
;427:
;428:
;429:
;430:/*
;431:================
;432:CG_ItemPickup
;433:
;434:A new item was picked up this frame
;435:================
;436:*/
;437:static void CG_ItemPickup(entityState_t	*es, int itemNum) { // [ERGO MOD] added es
line 438
;438:	cg.itemPickup = itemNum;
ADDRGP4 cg+124664
ADDRFP4 4
INDIRI4
ASGNI4
line 439
;439:	cg.itemPickupTime = cg.time;
ADDRGP4 cg+124668
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 440
;440:	cg.itemPickupBlendTime = cg.time;
ADDRGP4 cg+124672
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 442
;441:	// see if it should be the grabbed weapon
;442:	if ( bg_itemlist[itemNum].giType == IT_WEAPON ) {
CNSTI4 52
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $283
line 444
;443:		// select it immediately
;444:		if ( cg_autoswitch.integer && bg_itemlist[itemNum].giTag != WP_MACHINEGUN ) {
ADDRGP4 cg_autoswitch+12
INDIRI4
CNSTI4 0
EQI4 $286
CNSTI4 52
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 2
EQI4 $286
line 448
;445:			
;446:			// [ERGO MOD START]
;447:			// smarter autoweapon switch (to disable completely turn off in cfg file)
;448:			if (!isWeaponBetter(es->weapon, bg_itemlist[itemNum].giTag)) return;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
CNSTI4 52
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 isWeaponBetter
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $290
ADDRGP4 $277
JUMPV
LABELV $290
line 450
;449:			// [ERGO MOD END]
;450:			cg.weaponSelectTime = cg.time;
ADDRGP4 cg+124676
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 451
;451:			cg.weaponSelect = bg_itemlist[itemNum].giTag;
ADDRGP4 cg+108944
CNSTI4 52
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ASGNI4
line 452
;452:		}
LABELV $286
line 453
;453:	}
LABELV $283
line 455
;454:
;455:}
LABELV $277
endproc CG_ItemPickup 4 8
export CG_PainEvent
proc CG_PainEvent 12 16
line 465
;456:
;457:
;458:/*
;459:================
;460:CG_PainEvent
;461:
;462:Also called by playerstate transition
;463:================
;464:*/
;465:void CG_PainEvent( centity_t *cent, int health ) {
line 469
;466:	char	*snd;
;467:
;468:	// don't do more than two pain sounds a second
;469:	if ( cg.time - cent->pe.painTime < 500 ) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
SUBI4
CNSTI4 500
GEI4 $298
line 470
;470:		return;
ADDRGP4 $297
JUMPV
LABELV $298
line 473
;471:	}
;472:
;473:	if ( health < 25 ) {
ADDRFP4 4
INDIRI4
CNSTI4 25
GEI4 $301
line 474
;474:		snd = "*pain25_1.wav";
ADDRLP4 0
ADDRGP4 $303
ASGNP4
line 475
;475:	} else if ( health < 50 ) {
ADDRGP4 $302
JUMPV
LABELV $301
ADDRFP4 4
INDIRI4
CNSTI4 50
GEI4 $304
line 476
;476:		snd = "*pain50_1.wav";
ADDRLP4 0
ADDRGP4 $306
ASGNP4
line 477
;477:	} else if ( health < 75 ) {
ADDRGP4 $305
JUMPV
LABELV $304
ADDRFP4 4
INDIRI4
CNSTI4 75
GEI4 $307
line 478
;478:		snd = "*pain75_1.wav";
ADDRLP4 0
ADDRGP4 $309
ASGNP4
line 479
;479:	} else {
ADDRGP4 $308
JUMPV
LABELV $307
line 480
;480:		snd = "*pain100_1.wav";
ADDRLP4 0
ADDRGP4 $310
ASGNP4
line 481
;481:	}
LABELV $308
LABELV $305
LABELV $302
line 482
;482:	trap_S_StartSound( NULL, cent->currentState.number, CHAN_VOICE, 
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 486
;483:		CG_CustomSound( cent->currentState.number, snd ) );
;484:
;485:	// save pain time for programitic twitch animation
;486:	cent->pe.painTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 487
;487:	cent->pe.painDirection ^= 1;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 488
;488:}
LABELV $297
endproc CG_PainEvent 12 16
export CG_ModHRInfo
proc CG_ModHRInfo 28 12
line 492
;489:
;490:// [ERGO MOD START]
;491:void CG_ModHRInfo(entityState_t *es)
;492:{	
line 498
;493:	int		currentHr;
;494:	char	*s;
;495:	vec4_t color;
;496:
;497:
;498:	currentHr = es->eventParm;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 504
;499:
;500:	//if msgIdentifier == HR_
;501:
;502:	//CG_Printf("EV_JUMP_PAD w/effect #%i\n", es->eventParm);
;503:
;504:	s = va("HR: %d", currentHr);
ADDRGP4 $313
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 24
INDIRP4
ASGNP4
line 509
;505:
;506:
;507:		
;508:	// blue 
;509:	color[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 510
;510:	color[1] = 0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 511
;511:	color[2] = 1;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 512
;512:	color[3] = 1;
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
line 522
;513:	
;514:	//640 - (Q_PrintStrlen(s) * BIGCHAR_WIDTH)
;515:	//UI_DrawProportionalString(320, 300, s,
;516:	//	UI_CENTER | UI_SMALLFONT | UI_DROPSHADOW, colorWhite);
;517:	
;518:	//CG_DrawStringExt(320, 25, s, colorWhite, qfalse, qtrue, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0);
;519:
;520:	//CG_DrawStringExt(300, 300, s, color, qtrue, qtrue, GIANT_WIDTH, GIANT_HEIGHT, 0);
;521:	//CG_DrawString(SCREEN_WIDTH * 0.2F, SCREEN_HEIGHT * 0.30F, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, s, 1.0F);
;522:	CG_CenterPrint(s, SCREEN_HEIGHT * 0.30, SMALLCHAR_WIDTH);
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 144
ARGI4
CNSTI4 8
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 523
;523:}
LABELV $312
endproc CG_ModHRInfo 28 12
lit
align 4
LABELV $463
byte 4 0
byte 4 0
byte 4 1065353216
export CG_EntityEvent
code
proc CG_EntityEvent 108 48
line 538
;524:
;525:// [ERGO MOD END]
;526:
;527:
;528:
;529:/*
;530:==============
;531:CG_EntityEvent
;532:
;533:An entity has an event value
;534:also called by CG_CheckPlayerstateEvents
;535:==============
;536:*/
;537:#define	DEBUGNAME(x) if(cg_debugEvents.integer){CG_Printf(x"\n");}
;538:void CG_EntityEvent( centity_t *cent, vec3_t position ) {
line 546
;539:	entityState_t	*es;
;540:	int				event;
;541:	vec3_t			dir;
;542:	const char		*s;
;543:	int				clientNum;
;544:	clientInfo_t	*ci;
;545:
;546:	es = &cent->currentState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 547
;547:	event = es->event & ~EV_EVENT_BITS;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 549
;548:
;549:	if ( cg_debugEvents.integer ) {
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $318
line 550
;550:		CG_Printf( "ent:%3i  event:%3i ", es->number, event );
ADDRGP4 $321
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 551
;551:	}
LABELV $318
line 553
;552:
;553:	if ( !event ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $322
line 554
;554:		DEBUGNAME("ZEROEVENT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $317
ADDRGP4 $327
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 555
;555:		return;
ADDRGP4 $317
JUMPV
LABELV $322
line 558
;556:	}
;557:
;558:	clientNum = es->clientNum;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 559
;559:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $330
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $328
LABELV $330
line 560
;560:		clientNum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 561
;561:	}
LABELV $328
line 562
;562:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 12
CNSTI4 1708
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 564
;563:
;564:	switch ( event ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $332
ADDRLP4 8
INDIRI4
CNSTI4 83
GTI4 $332
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $948-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $948
address $334
address $344
address $355
address $366
address $377
address $428
address $428
address $428
address $428
address $388
address $402
address $414
address $458
address $470
address $481
address $488
address $495
address $502
address $508
address $526
address $540
address $548
address $555
address $560
address $565
address $570
address $575
address $580
address $585
address $590
address $595
address $600
address $605
address $610
address $615
address $620
address $625
address $630
address $332
address $656
address $649
address $635
address $642
address $664
address $722
address $731
address $742
address $712
address $707
address $685
address $690
address $695
address $700
address $717
address $332
address $866
address $874
address $874
address $874
address $880
address $885
address $898
address $911
address $924
address $680
address $332
address $332
address $332
address $332
address $332
address $332
address $332
address $332
address $938
address $933
address $475
address $332
address $332
address $332
address $332
address $332
address $332
address $675
code
LABELV $334
line 569
;565:	//
;566:	// movement generated events
;567:	//
;568:	case EV_FOOTSTEP:
;569:		DEBUGNAME("EV_FOOTSTEP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $335
ADDRGP4 $338
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $335
line 570
;570:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $333
line 571
;571:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 cgs+152340+548
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 573
;572:				cgs.media.footsteps[ ci->footsteps ][rand()&3] );
;573:		}
line 574
;574:		break;
ADDRGP4 $333
JUMPV
LABELV $344
line 576
;575:	case EV_FOOTSTEP_METAL:
;576:		DEBUGNAME("EV_FOOTSTEP_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $345
ADDRGP4 $348
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $345
line 577
;577:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $333
line 578
;578:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152340+548+80
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 580
;579:				cgs.media.footsteps[ FOOTSTEP_METAL ][rand()&3] );
;580:		}
line 581
;581:		break;
ADDRGP4 $333
JUMPV
LABELV $355
line 583
;582:	case EV_FOOTSPLASH:
;583:		DEBUGNAME("EV_FOOTSPLASH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $356
ADDRGP4 $359
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $356
line 584
;584:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $333
line 585
;585:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152340+548+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 587
;586:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;587:		}
line 588
;588:		break;
ADDRGP4 $333
JUMPV
LABELV $366
line 590
;589:	case EV_FOOTWADE:
;590:		DEBUGNAME("EV_FOOTWADE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $367
ADDRGP4 $370
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $367
line 591
;591:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $333
line 592
;592:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152340+548+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 594
;593:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;594:		}
line 595
;595:		break;
ADDRGP4 $333
JUMPV
LABELV $377
line 597
;596:	case EV_SWIM:
;597:		DEBUGNAME("EV_SWIM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $378
ADDRGP4 $381
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $378
line 598
;598:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $333
line 599
;599:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152340+548+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 601
;600:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;601:		}
line 602
;602:		break;
ADDRGP4 $333
JUMPV
LABELV $388
line 606
;603:
;604:
;605:	case EV_FALL_SHORT:
;606:		DEBUGNAME("EV_FALL_SHORT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $389
ADDRGP4 $392
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $389
line 607
;607:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.landSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+732
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 608
;608:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $333
line 610
;609:			// smooth landing z changes
;610:			cg.landChange = -8;
ADDRGP4 cg+108936
CNSTF4 3238002688
ASGNF4
line 611
;611:			cg.landTime = cg.time;
ADDRGP4 cg+108940
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 612
;612:		}
line 613
;613:		break;
ADDRGP4 $333
JUMPV
LABELV $402
line 615
;614:	case EV_FALL_MEDIUM:
;615:		DEBUGNAME("EV_FALL_MEDIUM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $403
ADDRGP4 $406
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $403
line 617
;616:		// use normal pain sound
;617:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*pain100_1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $310
ARGP4
ADDRLP4 40
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 618
;618:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $333
line 620
;619:			// smooth landing z changes
;620:			cg.landChange = -16;
ADDRGP4 cg+108936
CNSTF4 3246391296
ASGNF4
line 621
;621:			cg.landTime = cg.time;
ADDRGP4 cg+108940
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 622
;622:		}
line 623
;623:		break;
ADDRGP4 $333
JUMPV
LABELV $414
line 625
;624:	case EV_FALL_FAR:
;625:		DEBUGNAME("EV_FALL_FAR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $415
ADDRGP4 $418
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $415
line 626
;626:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*fall1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $419
ARGP4
ADDRLP4 44
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 627
;627:		cent->pe.painTime = cg.time;	// don't play a pain sound right after this
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 628
;628:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $333
line 630
;629:			// smooth landing z changes
;630:			cg.landChange = -24;
ADDRGP4 cg+108936
CNSTF4 3250585600
ASGNF4
line 631
;631:			cg.landTime = cg.time;
ADDRGP4 cg+108940
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 632
;632:		}
line 633
;633:		break;
ADDRGP4 $333
JUMPV
LABELV $428
line 639
;634:
;635:	case EV_STEP_4:
;636:	case EV_STEP_8:
;637:	case EV_STEP_12:
;638:	case EV_STEP_16:		// smooth out step up transitions
;639:		DEBUGNAME("EV_STEP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $429
ADDRGP4 $432
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $429
line 640
;640:	{
line 645
;641:		float	oldStep;
;642:		int		delta;
;643:		int		step;
;644:
;645:		if ( clientNum != cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
EQI4 $433
line 646
;646:			break;
ADDRGP4 $333
JUMPV
LABELV $433
line 649
;647:		}
;648:		// if we are interpolating, we don't need to smooth steps
;649:		if ( cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW) ||
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRGP4 cg+8
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $445
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 60
INDIRI4
NEI4 $445
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $445
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $437
LABELV $445
line 650
;650:			cg_nopredict.integer || cg_synchronousClients.integer ) {
line 651
;651:			break;
ADDRGP4 $333
JUMPV
LABELV $437
line 654
;652:		}
;653:		// check for stepping up before a previous step is completed
;654:		delta = cg.time - cg.stepTime;
ADDRLP4 48
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+108924
INDIRI4
SUBI4
ASGNI4
line 655
;655:		if (delta < STEP_TIME) {
ADDRLP4 48
INDIRI4
CNSTI4 200
GEI4 $448
line 656
;656:			oldStep = cg.stepChange * (STEP_TIME - delta) / STEP_TIME;
ADDRLP4 52
ADDRGP4 cg+108920
INDIRF4
CNSTI4 200
ADDRLP4 48
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1128792064
DIVF4
ASGNF4
line 657
;657:		} else {
ADDRGP4 $449
JUMPV
LABELV $448
line 658
;658:			oldStep = 0;
ADDRLP4 52
CNSTF4 0
ASGNF4
line 659
;659:		}
LABELV $449
line 662
;660:
;661:		// add this amount
;662:		step = 4 * (event - EV_STEP_4 + 1 );
ADDRLP4 56
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 24
SUBI4
CNSTI4 4
ADDI4
ASGNI4
line 663
;663:		cg.stepChange = oldStep + step;
ADDRGP4 cg+108920
ADDRLP4 52
INDIRF4
ADDRLP4 56
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 664
;664:		if ( cg.stepChange > MAX_STEP_CHANGE ) {
ADDRGP4 cg+108920
INDIRF4
CNSTF4 1107296256
LEF4 $452
line 665
;665:			cg.stepChange = MAX_STEP_CHANGE;
ADDRGP4 cg+108920
CNSTF4 1107296256
ASGNF4
line 666
;666:		}
LABELV $452
line 667
;667:		cg.stepTime = cg.time;
ADDRGP4 cg+108924
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 668
;668:		break;
ADDRGP4 $333
JUMPV
LABELV $458
line 672
;669:	}
;670:
;671:	case EV_JUMP_PAD:
;672:		DEBUGNAME("EV_JUMP_PAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $459
ADDRGP4 $462
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $459
line 674
;673://		CG_Printf( "EV_JUMP_PAD w/effect #%i\n", es->eventParm );
;674:		{
line 676
;675:			localEntity_t	*smoke;
;676:			vec3_t			up = {0, 0, 1};
ADDRLP4 48
ADDRGP4 $463
INDIRB
ASGNB 12
line 679
;677:
;678:
;679:			smoke = CG_SmokePuff( cent->lerpOrigin, up, 
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRLP4 48
ARGP4
CNSTF4 1107296256
ARGF4
ADDRLP4 64
CNSTF4 1065353216
ASGNF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
CNSTF4 1051260355
ARGF4
CNSTF4 1148846080
ARGF4
ADDRGP4 cg+107604
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 cgs+152340+276
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 CG_SmokePuff
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 68
INDIRP4
ASGNP4
line 686
;680:						  32, 
;681:						  1, 1, 1, 0.33f,
;682:						  1000, 
;683:						  cg.time, 0,
;684:						  LEF_PUFF_DONT_SCALE, 
;685:						  cgs.media.smokePuffShader );
;686:		}
line 689
;687:
;688:		// boing sound at origin, jump sound on player
;689:		trap_S_StartSound ( cent->lerpOrigin, -1, CHAN_VOICE, cgs.media.jumpPadSound );
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 cgs+152340+740
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 690
;690:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $469
ARGP4
ADDRLP4 48
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 691
;691:		break;
ADDRGP4 $333
JUMPV
LABELV $470
line 694
;692:
;693:	case EV_JUMP:
;694:		DEBUGNAME("EV_JUMP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $471
ADDRGP4 $474
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $471
line 695
;695:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $469
ARGP4
ADDRLP4 52
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 696
;696:		break;
ADDRGP4 $333
JUMPV
LABELV $475
line 698
;697:	case EV_TAUNT:
;698:		DEBUGNAME("EV_TAUNT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $476
ADDRGP4 $479
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $476
line 699
;699:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*taunt.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $480
ARGP4
ADDRLP4 56
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 700
;700:		break;
ADDRGP4 $333
JUMPV
LABELV $481
line 728
;701:#ifdef MISSIONPACK
;702:	case EV_TAUNT_YES:
;703:		DEBUGNAME("EV_TAUNT_YES");
;704:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_YES);
;705:		break;
;706:	case EV_TAUNT_NO:
;707:		DEBUGNAME("EV_TAUNT_NO");
;708:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_NO);
;709:		break;
;710:	case EV_TAUNT_FOLLOWME:
;711:		DEBUGNAME("EV_TAUNT_FOLLOWME");
;712:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_FOLLOWME);
;713:		break;
;714:	case EV_TAUNT_GETFLAG:
;715:		DEBUGNAME("EV_TAUNT_GETFLAG");
;716:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONGETFLAG);
;717:		break;
;718:	case EV_TAUNT_GUARDBASE:
;719:		DEBUGNAME("EV_TAUNT_GUARDBASE");
;720:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONDEFENSE);
;721:		break;
;722:	case EV_TAUNT_PATROL:
;723:		DEBUGNAME("EV_TAUNT_PATROL");
;724:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONPATROL);
;725:		break;
;726:#endif
;727:	case EV_WATER_TOUCH:
;728:		DEBUGNAME("EV_WATER_TOUCH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $482
ADDRGP4 $485
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $482
line 729
;729:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrInSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+844
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 730
;730:		break;
ADDRGP4 $333
JUMPV
LABELV $488
line 732
;731:	case EV_WATER_LEAVE:
;732:		DEBUGNAME("EV_WATER_LEAVE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $489
ADDRGP4 $492
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $489
line 733
;733:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrOutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+848
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 734
;734:		break;
ADDRGP4 $333
JUMPV
LABELV $495
line 736
;735:	case EV_WATER_UNDER:
;736:		DEBUGNAME("EV_WATER_UNDER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $496
ADDRGP4 $499
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $496
line 737
;737:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrUnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+852
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 738
;738:		break;
ADDRGP4 $333
JUMPV
LABELV $502
line 740
;739:	case EV_WATER_CLEAR:
;740:		DEBUGNAME("EV_WATER_CLEAR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $503
ADDRGP4 $506
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $503
line 741
;741:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*gasp.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $507
ARGP4
ADDRLP4 60
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 742
;742:		break;
ADDRGP4 $333
JUMPV
LABELV $508
line 745
;743:
;744:	case EV_ITEM_PICKUP:
;745:		DEBUGNAME("EV_ITEM_PICKUP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $509
ADDRGP4 $512
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $509
line 746
;746:		{
line 750
;747:			gitem_t	*item;
;748:			int		index;
;749:
;750:			index = es->eventParm;		// player predicted
ADDRLP4 64
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 752
;751:
;752:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 72
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 1
LTI4 $515
ADDRLP4 72
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $513
LABELV $515
line 753
;753:				break;
ADDRGP4 $333
JUMPV
LABELV $513
line 755
;754:			}
;755:			item = &bg_itemlist[ index ];
ADDRLP4 68
CNSTI4 52
ADDRLP4 64
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 759
;756:
;757:			// powerups and team items will have a separate global sound, this one
;758:			// will be played at prediction time
;759:			if ( item->giType == IT_POWERUP || item->giType == IT_TEAM) {
ADDRLP4 76
ADDRLP4 68
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 5
EQI4 $518
ADDRLP4 76
INDIRI4
CNSTI4 8
NEI4 $516
LABELV $518
line 760
;760:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.n_healthSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+996
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 761
;761:			} else if (item->giType == IT_PERSISTANT_POWERUP) {
ADDRGP4 $517
JUMPV
LABELV $516
ADDRLP4 68
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 7
NEI4 $521
line 778
;762:#ifdef MISSIONPACK
;763:				switch (item->giTag ) {
;764:					case PW_SCOUT:
;765:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.scoutSound );
;766:					break;
;767:					case PW_GUARD:
;768:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.guardSound );
;769:					break;
;770:					case PW_DOUBLER:
;771:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.doublerSound );
;772:					break;
;773:					case PW_AMMOREGEN:
;774:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.ammoregenSound );
;775:					break;
;776:				}
;777:#endif
;778:			} else {
ADDRGP4 $522
JUMPV
LABELV $521
line 779
;779:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	trap_S_RegisterSound( item->pickup_sound, qfalse ) );
ADDRLP4 68
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 80
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 780
;780:			}
LABELV $522
LABELV $517
line 783
;781:
;782:			// show icon and name on status bar
;783:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $333
line 784
;784:				CG_ItemPickup(es, index); // [ERGO MOD] added es
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 785
;785:			}
line 786
;786:		}
line 787
;787:		break;
ADDRGP4 $333
JUMPV
LABELV $526
line 790
;788:
;789:	case EV_GLOBAL_ITEM_PICKUP:
;790:		DEBUGNAME("EV_GLOBAL_ITEM_PICKUP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $527
ADDRGP4 $530
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $527
line 791
;791:		{
line 795
;792:			gitem_t	*item;
;793:			int		index;
;794:
;795:			index = es->eventParm;		// player predicted
ADDRLP4 64
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 797
;796:
;797:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 72
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 1
LTI4 $533
ADDRLP4 72
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $531
LABELV $533
line 798
;798:				break;
ADDRGP4 $333
JUMPV
LABELV $531
line 800
;799:			}
;800:			item = &bg_itemlist[ index ];
ADDRLP4 68
CNSTI4 52
ADDRLP4 64
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 802
;801:			// powerup pickups are global
;802:			if( item->pickup_sound ) {
ADDRLP4 68
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $534
line 803
;803:				trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, trap_S_RegisterSound( item->pickup_sound, qfalse ) );
ADDRLP4 68
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 76
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 804
;804:			}
LABELV $534
line 807
;805:
;806:			// show icon and name on status bar
;807:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $333
line 808
;808:				CG_ItemPickup(es, index ); // [ERGO MOD] added es
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 809
;809:			}
line 810
;810:		}
line 811
;811:		break;
ADDRGP4 $333
JUMPV
LABELV $540
line 817
;812:
;813:	//
;814:	// weapon events
;815:	//
;816:	case EV_NOAMMO:
;817:		DEBUGNAME("EV_NOAMMO");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $541
ADDRGP4 $544
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $541
line 819
;818://		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.noAmmoSound );
;819:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $333
line 820
;820:			CG_OutOfAmmoChange();
ADDRGP4 CG_OutOfAmmoChange
CALLV
pop
line 821
;821:		}
line 822
;822:		break;
ADDRGP4 $333
JUMPV
LABELV $548
line 824
;823:	case EV_CHANGE_WEAPON:
;824:		DEBUGNAME("EV_CHANGE_WEAPON");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $549
ADDRGP4 $552
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $549
line 825
;825:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.selectSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+536
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 826
;826:		break;
ADDRGP4 $333
JUMPV
LABELV $555
line 828
;827:	case EV_FIRE_WEAPON:
;828:		DEBUGNAME("EV_FIRE_WEAPON");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $556
ADDRGP4 $559
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $556
line 829
;829:		CG_FireWeapon( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FireWeapon
CALLV
pop
line 830
;830:		break;
ADDRGP4 $333
JUMPV
LABELV $560
line 833
;831:
;832:	case EV_USE_ITEM0:
;833:		DEBUGNAME("EV_USE_ITEM0");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $561
ADDRGP4 $564
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $561
line 834
;834:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 835
;835:		break;
ADDRGP4 $333
JUMPV
LABELV $565
line 837
;836:	case EV_USE_ITEM1:
;837:		DEBUGNAME("EV_USE_ITEM1");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $566
ADDRGP4 $569
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $566
line 838
;838:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 839
;839:		break;
ADDRGP4 $333
JUMPV
LABELV $570
line 841
;840:	case EV_USE_ITEM2:
;841:		DEBUGNAME("EV_USE_ITEM2");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $571
ADDRGP4 $574
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $571
line 842
;842:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 843
;843:		break;
ADDRGP4 $333
JUMPV
LABELV $575
line 845
;844:	case EV_USE_ITEM3:
;845:		DEBUGNAME("EV_USE_ITEM3");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $576
ADDRGP4 $579
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $576
line 846
;846:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 847
;847:		break;
ADDRGP4 $333
JUMPV
LABELV $580
line 849
;848:	case EV_USE_ITEM4:
;849:		DEBUGNAME("EV_USE_ITEM4");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $581
ADDRGP4 $584
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $581
line 850
;850:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 851
;851:		break;
ADDRGP4 $333
JUMPV
LABELV $585
line 853
;852:	case EV_USE_ITEM5:
;853:		DEBUGNAME("EV_USE_ITEM5");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $586
ADDRGP4 $589
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $586
line 854
;854:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 855
;855:		break;
ADDRGP4 $333
JUMPV
LABELV $590
line 857
;856:	case EV_USE_ITEM6:
;857:		DEBUGNAME("EV_USE_ITEM6");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $591
ADDRGP4 $594
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $591
line 858
;858:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 859
;859:		break;
ADDRGP4 $333
JUMPV
LABELV $595
line 861
;860:	case EV_USE_ITEM7:
;861:		DEBUGNAME("EV_USE_ITEM7");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $596
ADDRGP4 $599
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $596
line 862
;862:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 863
;863:		break;
ADDRGP4 $333
JUMPV
LABELV $600
line 865
;864:	case EV_USE_ITEM8:
;865:		DEBUGNAME("EV_USE_ITEM8");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $601
ADDRGP4 $604
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $601
line 866
;866:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 867
;867:		break;
ADDRGP4 $333
JUMPV
LABELV $605
line 869
;868:	case EV_USE_ITEM9:
;869:		DEBUGNAME("EV_USE_ITEM9");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $606
ADDRGP4 $609
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $606
line 870
;870:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 871
;871:		break;
ADDRGP4 $333
JUMPV
LABELV $610
line 873
;872:	case EV_USE_ITEM10:
;873:		DEBUGNAME("EV_USE_ITEM10");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $611
ADDRGP4 $614
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $611
line 874
;874:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 875
;875:		break;
ADDRGP4 $333
JUMPV
LABELV $615
line 877
;876:	case EV_USE_ITEM11:
;877:		DEBUGNAME("EV_USE_ITEM11");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $616
ADDRGP4 $619
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $616
line 878
;878:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 879
;879:		break;
ADDRGP4 $333
JUMPV
LABELV $620
line 881
;880:	case EV_USE_ITEM12:
;881:		DEBUGNAME("EV_USE_ITEM12");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $621
ADDRGP4 $624
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $621
line 882
;882:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 883
;883:		break;
ADDRGP4 $333
JUMPV
LABELV $625
line 885
;884:	case EV_USE_ITEM13:
;885:		DEBUGNAME("EV_USE_ITEM13");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $626
ADDRGP4 $629
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $626
line 886
;886:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 887
;887:		break;
ADDRGP4 $333
JUMPV
LABELV $630
line 889
;888:	case EV_USE_ITEM14:
;889:		DEBUGNAME("EV_USE_ITEM14");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $631
ADDRGP4 $634
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $631
line 890
;890:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 891
;891:		break;
ADDRGP4 $333
JUMPV
LABELV $635
line 899
;892:
;893:	//=================================================================
;894:
;895:	//
;896:	// other events
;897:	//
;898:	case EV_PLAYER_TELEPORT_IN:
;899:		DEBUGNAME("EV_PLAYER_TELEPORT_IN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $636
ADDRGP4 $639
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $636
line 900
;900:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleInSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+712
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 901
;901:		CG_SpawnEffect( position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 902
;902:		break;
ADDRGP4 $333
JUMPV
LABELV $642
line 905
;903:
;904:	case EV_PLAYER_TELEPORT_OUT:
;905:		DEBUGNAME("EV_PLAYER_TELEPORT_OUT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $643
ADDRGP4 $646
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $643
line 906
;906:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleOutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+716
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 907
;907:		CG_SpawnEffect(  position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 908
;908:		break;
ADDRGP4 $333
JUMPV
LABELV $649
line 911
;909:
;910:	case EV_ITEM_POP:
;911:		DEBUGNAME("EV_ITEM_POP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $650
ADDRGP4 $653
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $650
line 912
;912:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+724
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 913
;913:		break;
ADDRGP4 $333
JUMPV
LABELV $656
line 915
;914:	case EV_ITEM_RESPAWN:
;915:		DEBUGNAME("EV_ITEM_RESPAWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $657
ADDRGP4 $660
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $657
line 916
;916:		cent->miscTime = cg.time;	// scale up from this
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 917
;917:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+724
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 918
;918:		break;
ADDRGP4 $333
JUMPV
LABELV $664
line 921
;919:
;920:	case EV_GRENADE_BOUNCE:
;921:		DEBUGNAME("EV_GRENADE_BOUNCE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $665
ADDRGP4 $668
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $665
line 922
;922:		if ( rand() & 1 ) {
ADDRLP4 64
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $669
line 923
;923:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb1aSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+1000
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 924
;924:		} else {
ADDRGP4 $333
JUMPV
LABELV $669
line 925
;925:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb2aSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+1004
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 926
;926:		}
line 927
;927:		break;
ADDRGP4 $333
JUMPV
LABELV $675
line 930
;928:	// [ERGO MOD START]
;929:	case EV_MOD_HR_INFO:
;930:		DEBUGNAME("EV_MOD_HR_INFO");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $676
ADDRGP4 $679
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $676
line 931
;931:		CG_ModHRInfo(es);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ModHRInfo
CALLV
pop
line 932
;932:		break;
ADDRGP4 $333
JUMPV
LABELV $680
line 977
;933:	// [ERGO MOD END]
;934:
;935:#ifdef MISSIONPACK
;936:	case EV_PROXIMITY_MINE_STICK:
;937:		DEBUGNAME("EV_PROXIMITY_MINE_STICK");
;938:		if( es->eventParm & SURF_FLESH ) {
;939:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimplSound );
;940:		} else 	if( es->eventParm & SURF_METALSTEPS ) {
;941:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpmSound );
;942:		} else {
;943:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpdSound );
;944:		}
;945:		break;
;946:
;947:	case EV_PROXIMITY_MINE_TRIGGER:
;948:		DEBUGNAME("EV_PROXIMITY_MINE_TRIGGER");
;949:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbactvSound );
;950:		break;
;951:	case EV_KAMIKAZE:
;952:		DEBUGNAME("EV_KAMIKAZE");
;953:		CG_KamikazeEffect( cent->lerpOrigin );
;954:		break;
;955:	case EV_OBELISKEXPLODE:
;956:		DEBUGNAME("EV_OBELISKEXPLODE");
;957:		CG_ObeliskExplode( cent->lerpOrigin, es->eventParm );
;958:		break;
;959:	case EV_OBELISKPAIN:
;960:		DEBUGNAME("EV_OBELISKPAIN");
;961:		CG_ObeliskPain( cent->lerpOrigin );
;962:		break;
;963:	case EV_INVUL_IMPACT:
;964:		DEBUGNAME("EV_INVUL_IMPACT");
;965:		CG_InvulnerabilityImpact( cent->lerpOrigin, cent->currentState.angles );
;966:		break;
;967:	case EV_JUICED:
;968:		DEBUGNAME("EV_JUICED");
;969:		CG_InvulnerabilityJuiced( cent->lerpOrigin );
;970:		break;
;971:	case EV_LIGHTNINGBOLT:
;972:		DEBUGNAME("EV_LIGHTNINGBOLT");
;973:		CG_LightningBoltBeam(es->origin2, es->pos.trBase);
;974:		break;
;975:#endif
;976:	case EV_SCOREPLUM:
;977:		DEBUGNAME("EV_SCOREPLUM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $681
ADDRGP4 $684
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $681
line 978
;978:		CG_ScorePlum( cent->currentState.otherEntityNum, cent->lerpOrigin, cent->currentState.time );
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ScorePlum
CALLV
pop
line 979
;979:		break;
ADDRGP4 $333
JUMPV
LABELV $685
line 985
;980:
;981:	//
;982:	// missile impacts
;983:	//
;984:	case EV_MISSILE_HIT:
;985:		DEBUGNAME("EV_MISSILE_HIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $686
ADDRGP4 $689
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $686
line 986
;986:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 987
;987:		CG_MissileHitPlayer( es->weapon, position, dir, es->otherEntityNum );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitPlayer
CALLV
pop
line 988
;988:		break;
ADDRGP4 $333
JUMPV
LABELV $690
line 991
;989:
;990:	case EV_MISSILE_MISS:
;991:		DEBUGNAME("EV_MISSILE_MISS");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $691
ADDRGP4 $694
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $691
line 992
;992:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 993
;993:		CG_MissileHitWall( es->weapon, 0, position, dir, IMPACTSOUND_DEFAULT );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 994
;994:		break;
ADDRGP4 $333
JUMPV
LABELV $695
line 997
;995:
;996:	case EV_MISSILE_MISS_METAL:
;997:		DEBUGNAME("EV_MISSILE_MISS_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $696
ADDRGP4 $699
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $696
line 998
;998:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 999
;999:		CG_MissileHitWall( es->weapon, 0, position, dir, IMPACTSOUND_METAL );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 1000
;1000:		break;
ADDRGP4 $333
JUMPV
LABELV $700
line 1003
;1001:
;1002:	case EV_RAILTRAIL:
;1003:		DEBUGNAME("EV_RAILTRAIL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $701
ADDRGP4 $704
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $701
line 1004
;1004:		cent->currentState.weapon = WP_RAILGUN;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 7
ASGNI4
line 1006
;1005:		// if the end was on a nomark surface, don't make an explosion
;1006:		CG_RailTrail( ci, es->origin2, es->pos.trBase );
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 CG_RailTrail
CALLV
pop
line 1007
;1007:		if ( es->eventParm != 255 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 255
EQI4 $333
line 1008
;1008:			ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 1009
;1009:			CG_MissileHitWall( es->weapon, es->clientNum, position, dir, IMPACTSOUND_DEFAULT );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 1010
;1010:		}
line 1011
;1011:		break;
ADDRGP4 $333
JUMPV
LABELV $707
line 1014
;1012:
;1013:	case EV_BULLET_HIT_WALL:
;1014:		DEBUGNAME("EV_BULLET_HIT_WALL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $708
ADDRGP4 $711
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $708
line 1015
;1015:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 1016
;1016:		CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qfalse, ENTITYNUM_WORLD );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1022
ARGI4
ADDRGP4 CG_Bullet
CALLV
pop
line 1017
;1017:		break;
ADDRGP4 $333
JUMPV
LABELV $712
line 1020
;1018:
;1019:	case EV_BULLET_HIT_FLESH:
;1020:		DEBUGNAME("EV_BULLET_HIT_FLESH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $713
ADDRGP4 $716
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $713
line 1021
;1021:		CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qtrue, es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Bullet
CALLV
pop
line 1022
;1022:		break;
ADDRGP4 $333
JUMPV
LABELV $717
line 1025
;1023:
;1024:	case EV_SHOTGUN:
;1025:		DEBUGNAME("EV_SHOTGUN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $718
ADDRGP4 $721
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $718
line 1026
;1026:		CG_ShotgunFire( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ShotgunFire
CALLV
pop
line 1027
;1027:		break;
ADDRGP4 $333
JUMPV
LABELV $722
line 1030
;1028:
;1029:	case EV_GENERAL_SOUND:
;1030:		DEBUGNAME("EV_GENERAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $723
ADDRGP4 $726
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $723
line 1031
;1031:		if ( cgs.gameSounds[ es->eventParm ] ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35848
ADDP4
INDIRI4
CNSTI4 0
EQI4 $727
line 1032
;1032:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, cgs.gameSounds[ es->eventParm ] );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35848
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1033
;1033:		} else {
ADDRGP4 $333
JUMPV
LABELV $727
line 1034
;1034:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 92
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 92
INDIRP4
ASGNP4
line 1035
;1035:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, s ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1036
;1036:		}
line 1037
;1037:		break;
ADDRGP4 $333
JUMPV
LABELV $731
line 1040
;1038:
;1039:	case EV_GLOBAL_SOUND:	// play from the player's head so it never diminishes
;1040:		DEBUGNAME("EV_GLOBAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $732
ADDRGP4 $735
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $732
line 1041
;1041:		if ( cgs.gameSounds[ es->eventParm ] ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35848
ADDP4
INDIRI4
CNSTI4 0
EQI4 $736
line 1042
;1042:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, cgs.gameSounds[ es->eventParm ] );
CNSTP4 0
ARGP4
ADDRLP4 92
CNSTI4 184
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35848
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1043
;1043:		} else {
ADDRGP4 $333
JUMPV
LABELV $736
line 1044
;1044:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 92
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 92
INDIRP4
ASGNP4
line 1045
;1045:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, CG_CustomSound( es->number, s ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1046
;1046:		}
line 1047
;1047:		break;
ADDRGP4 $333
JUMPV
LABELV $742
line 1050
;1048:
;1049:	case EV_GLOBAL_TEAM_SOUND:	// play from the player's head so it never diminishes
;1050:		{
line 1051
;1051:			DEBUGNAME("EV_GLOBAL_TEAM_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $743
ADDRGP4 $746
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $743
line 1052
;1052:			switch( es->eventParm ) {
ADDRLP4 92
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
LTI4 $333
ADDRLP4 92
INDIRI4
CNSTI4 12
GTI4 $333
ADDRLP4 92
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $865
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $865
address $750
address $760
address $770
address $782
address $794
address $814
address $834
address $842
address $850
address $853
address $856
address $859
address $862
code
LABELV $750
line 1054
;1053:				case GTS_RED_CAPTURE: // CTF: red team captured the blue flag, 1FCTF: red team captured the neutral flag
;1054:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $751
line 1055
;1055:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+152340+892
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $333
JUMPV
LABELV $751
line 1057
;1056:					else
;1057:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+152340+896
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1058
;1058:					break;
ADDRGP4 $333
JUMPV
LABELV $760
line 1060
;1059:				case GTS_BLUE_CAPTURE: // CTF: blue team captured the red flag, 1FCTF: blue team captured the neutral flag
;1060:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $761
line 1061
;1061:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+152340+892
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $333
JUMPV
LABELV $761
line 1063
;1062:					else
;1063:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+152340+896
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1064
;1064:					break;
ADDRGP4 $333
JUMPV
LABELV $770
line 1066
;1065:				case GTS_RED_RETURN: // CTF: blue flag returned, 1FCTF: never used
;1066:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $771
line 1067
;1067:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+152340+900
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $772
JUMPV
LABELV $771
line 1069
;1068:					else
;1069:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+152340+904
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $772
line 1071
;1070:					//
;1071:					CG_AddBufferedSound( cgs.media.blueFlagReturnedSound );
ADDRGP4 cgs+152340+920
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1072
;1072:					break;
ADDRGP4 $333
JUMPV
LABELV $782
line 1074
;1073:				case GTS_BLUE_RETURN: // CTF red flag returned, 1FCTF: neutral flag returned
;1074:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $783
line 1075
;1075:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+152340+900
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $784
JUMPV
LABELV $783
line 1077
;1076:					else
;1077:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+152340+904
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $784
line 1079
;1078:					//
;1079:					CG_AddBufferedSound( cgs.media.redFlagReturnedSound );
ADDRGP4 cgs+152340+916
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1080
;1080:					break;
ADDRGP4 $333
JUMPV
LABELV $794
line 1084
;1081:
;1082:				case GTS_RED_TAKEN: // CTF: red team took blue flag, 1FCTF: blue team took the neutral flag
;1083:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1084:					if (cg.snap->ps.powerups[PW_BLUEFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
ADDRLP4 100
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
ADDRLP4 100
INDIRI4
NEI4 $799
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 100
INDIRI4
EQI4 $795
LABELV $799
line 1085
;1085:					}
ADDRGP4 $333
JUMPV
LABELV $795
line 1086
;1086:					else {
line 1087
;1087:					if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $800
line 1093
;1088:#ifdef MISSIONPACK
;1089:							if (cgs.gametype == GT_1FCTF) 
;1090:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
;1091:							else
;1092:#endif
;1093:						 	CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+152340+928
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1094
;1094:						}
ADDRGP4 $333
JUMPV
LABELV $800
line 1095
;1095:						else if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $333
line 1101
;1096:#ifdef MISSIONPACK
;1097:							if (cgs.gametype == GT_1FCTF)
;1098:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
;1099:							else
;1100:#endif
;1101: 							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+152340+936
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1102
;1102:						}
line 1103
;1103:					}
line 1104
;1104:					break;
ADDRGP4 $333
JUMPV
LABELV $814
line 1107
;1105:				case GTS_BLUE_TAKEN: // CTF: blue team took the red flag, 1FCTF red team took the neutral flag
;1106:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1107:					if (cg.snap->ps.powerups[PW_REDFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
ADDRLP4 104
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
ADDRLP4 104
INDIRI4
NEI4 $819
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 104
INDIRI4
EQI4 $815
LABELV $819
line 1108
;1108:					}
ADDRGP4 $333
JUMPV
LABELV $815
line 1109
;1109:					else {
line 1110
;1110:						if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $820
line 1116
;1111:#ifdef MISSIONPACK
;1112:							if (cgs.gametype == GT_1FCTF)
;1113:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
;1114:							else
;1115:#endif
;1116:							CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+152340+928
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1117
;1117:						}
ADDRGP4 $333
JUMPV
LABELV $820
line 1118
;1118:						else if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $333
line 1124
;1119:#ifdef MISSIONPACK
;1120:							if (cgs.gametype == GT_1FCTF)
;1121:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
;1122:							else
;1123:#endif
;1124:							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+152340+936
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1125
;1125:						}
line 1126
;1126:					}
line 1127
;1127:					break;
ADDRGP4 $333
JUMPV
LABELV $834
line 1129
;1128:				case GTS_REDOBELISK_ATTACKED: // Overload: red obelisk is being attacked
;1129:					if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $333
line 1130
;1130:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+152340+948
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1131
;1131:					}
line 1132
;1132:					break;
ADDRGP4 $333
JUMPV
LABELV $842
line 1134
;1133:				case GTS_BLUEOBELISK_ATTACKED: // Overload: blue obelisk is being attacked
;1134:					if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $333
line 1135
;1135:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+152340+948
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1136
;1136:					}
line 1137
;1137:					break;
ADDRGP4 $333
JUMPV
LABELV $850
line 1140
;1138:
;1139:				case GTS_REDTEAM_SCORED:
;1140:					CG_AddBufferedSound(cgs.media.redScoredSound);
ADDRGP4 cgs+152340+872
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1141
;1141:					break;
ADDRGP4 $333
JUMPV
LABELV $853
line 1143
;1142:				case GTS_BLUETEAM_SCORED:
;1143:					CG_AddBufferedSound(cgs.media.blueScoredSound);
ADDRGP4 cgs+152340+876
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1144
;1144:					break;
ADDRGP4 $333
JUMPV
LABELV $856
line 1146
;1145:				case GTS_REDTEAM_TOOK_LEAD:
;1146:					CG_AddBufferedSound(cgs.media.redLeadsSound);
ADDRGP4 cgs+152340+880
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1147
;1147:					break;
ADDRGP4 $333
JUMPV
LABELV $859
line 1149
;1148:				case GTS_BLUETEAM_TOOK_LEAD:
;1149:					CG_AddBufferedSound(cgs.media.blueLeadsSound);
ADDRGP4 cgs+152340+884
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1150
;1150:					break;
ADDRGP4 $333
JUMPV
LABELV $862
line 1152
;1151:				case GTS_TEAMS_ARE_TIED:
;1152:					CG_AddBufferedSound( cgs.media.teamsTiedSound );
ADDRGP4 cgs+152340+888
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1153
;1153:					break;
line 1160
;1154:#ifdef MISSIONPACK
;1155:				case GTS_KAMIKAZE:
;1156:					trap_S_StartLocalSound(cgs.media.kamikazeFarSound, CHAN_ANNOUNCER);
;1157:					break;
;1158:#endif
;1159:				default:
;1160:					break;
line 1162
;1161:			}
;1162:			break;
ADDRGP4 $333
JUMPV
LABELV $866
line 1168
;1163:		}
;1164:
;1165:	case EV_PAIN:
;1166:		// local player sounds are triggered in CG_CheckLocalSounds,
;1167:		// so ignore events on the player
;1168:		DEBUGNAME("EV_PAIN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $867
ADDRGP4 $870
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $867
line 1169
;1169:		if ( cent->currentState.number != cg.snap->ps.clientNum ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $333
line 1170
;1170:			CG_PainEvent( cent, es->eventParm );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_PainEvent
CALLV
pop
line 1171
;1171:		}
line 1172
;1172:		break;
ADDRGP4 $333
JUMPV
LABELV $874
line 1177
;1173:
;1174:	case EV_DEATH1:
;1175:	case EV_DEATH2:
;1176:	case EV_DEATH3:
;1177:		DEBUGNAME("EV_DEATHx");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $875
ADDRGP4 $878
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $875
line 1178
;1178:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, 
ADDRGP4 $879
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 57
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1180
;1179:				CG_CustomSound( es->number, va("*death%i.wav", event - EV_DEATH1 + 1) ) );
;1180:		break;
ADDRGP4 $333
JUMPV
LABELV $880
line 1184
;1181:
;1182:
;1183:	case EV_OBITUARY:
;1184:		DEBUGNAME("EV_OBITUARY");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $881
ADDRGP4 $884
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $881
line 1185
;1185:		CG_Obituary( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Obituary
CALLV
pop
line 1186
;1186:		break;
ADDRGP4 $333
JUMPV
LABELV $885
line 1192
;1187:
;1188:	//
;1189:	// powerup events
;1190:	//
;1191:	case EV_POWERUP_QUAD:
;1192:		DEBUGNAME("EV_POWERUP_QUAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $886
ADDRGP4 $889
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $886
line 1193
;1193:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $890
line 1194
;1194:			cg.powerupActive = PW_QUAD;
ADDRGP4 cg+124408
CNSTI4 1
ASGNI4
line 1195
;1195:			cg.powerupTime = cg.time;
ADDRGP4 cg+124412
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1196
;1196:		}
LABELV $890
line 1197
;1197:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.quadSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+152340+528
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1198
;1198:		break;
ADDRGP4 $333
JUMPV
LABELV $898
line 1200
;1199:	case EV_POWERUP_BATTLESUIT:
;1200:		DEBUGNAME("EV_POWERUP_BATTLESUIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $899
ADDRGP4 $902
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $899
line 1201
;1201:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $903
line 1202
;1202:			cg.powerupActive = PW_BATTLESUIT;
ADDRGP4 cg+124408
CNSTI4 2
ASGNI4
line 1203
;1203:			cg.powerupTime = cg.time;
ADDRGP4 cg+124412
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1204
;1204:		}
LABELV $903
line 1205
;1205:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.protectSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+152340+992
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1206
;1206:		break;
ADDRGP4 $333
JUMPV
LABELV $911
line 1208
;1207:	case EV_POWERUP_REGEN:
;1208:		DEBUGNAME("EV_POWERUP_REGEN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $912
ADDRGP4 $915
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $912
line 1209
;1209:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $916
line 1210
;1210:			cg.powerupActive = PW_REGEN;
ADDRGP4 cg+124408
CNSTI4 5
ASGNI4
line 1211
;1211:			cg.powerupTime = cg.time;
ADDRGP4 cg+124412
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1212
;1212:		}
LABELV $916
line 1213
;1213:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.regenSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+152340+988
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1214
;1214:		break;
ADDRGP4 $333
JUMPV
LABELV $924
line 1217
;1215:
;1216:	case EV_GIB_PLAYER:
;1217:		DEBUGNAME("EV_GIB_PLAYER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $925
ADDRGP4 $928
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $925
line 1221
;1218:		// don't play gib sound when using the kamikaze because it interferes
;1219:		// with the kamikaze sound, downside is that the gib sound will also
;1220:		// not be played when someone is gibbed while just carrying the kamikaze
;1221:		if ( !(es->eFlags & EF_KAMIKAZE) ) {
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
NEI4 $929
line 1222
;1222:			trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+152340+696
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1223
;1223:		}
LABELV $929
line 1224
;1224:		CG_GibPlayer( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRGP4 CG_GibPlayer
CALLV
pop
line 1225
;1225:		break;
ADDRGP4 $333
JUMPV
LABELV $933
line 1228
;1226:
;1227:	case EV_STOPLOOPINGSOUND:
;1228:		DEBUGNAME("EV_STOPLOOPINGSOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $934
ADDRGP4 $937
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $934
line 1229
;1229:		trap_S_StopLoopingSound( es->number );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StopLoopingSound
CALLV
pop
line 1230
;1230:		es->loopSound = 0;
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 1231
;1231:		break;
ADDRGP4 $333
JUMPV
LABELV $938
line 1234
;1232:
;1233:	case EV_DEBUG_LINE:
;1234:		DEBUGNAME("EV_DEBUG_LINE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $939
ADDRGP4 $942
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $939
line 1235
;1235:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 1236
;1236:		break;
ADDRGP4 $333
JUMPV
LABELV $332
line 1239
;1237:
;1238:	default:
;1239:		DEBUGNAME("UNKNOWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $943
ADDRGP4 $946
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $943
line 1240
;1240:		CG_Error( "Unknown event: %i", event );
ADDRGP4 $947
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1241
;1241:		break;
LABELV $333
line 1244
;1242:	}
;1243:
;1244:}
LABELV $317
endproc CG_EntityEvent 108 48
export CG_CheckEvents
proc CG_CheckEvents 8 12
line 1253
;1245:
;1246:
;1247:/*
;1248:==============
;1249:CG_CheckEvents
;1250:
;1251:==============
;1252:*/
;1253:void CG_CheckEvents( centity_t *cent ) {
line 1255
;1254:	// check for event-only entities
;1255:	if ( cent->currentState.eType > ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
LEI4 $951
line 1256
;1256:		if ( cent->previousEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
CNSTI4 0
EQI4 $953
line 1257
;1257:			return;	// already fired
ADDRGP4 $950
JUMPV
LABELV $953
line 1260
;1258:		}
;1259:		// if this is a player event set the entity number of the client entity number
;1260:		if ( cent->currentState.eFlags & EF_PLAYER_EVENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $955
line 1261
;1261:			cent->currentState.number = cent->currentState.otherEntityNum;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 1262
;1262:		}
LABELV $955
line 1264
;1263:
;1264:		cent->previousEvent = 1;
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
CNSTI4 1
ASGNI4
line 1266
;1265:
;1266:		cent->currentState.event = cent->currentState.eType - ET_EVENTS;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
SUBI4
ASGNI4
line 1267
;1267:	} else {
ADDRGP4 $952
JUMPV
LABELV $951
line 1269
;1268:		// check for events riding with another entity
;1269:		if ( cent->currentState.event == cent->previousEvent ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
NEI4 $957
line 1270
;1270:			return;
ADDRGP4 $950
JUMPV
LABELV $957
line 1272
;1271:		}
;1272:		cent->previousEvent = cent->currentState.event;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 428
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 1273
;1273:		if ( ( cent->currentState.event & ~EV_EVENT_BITS ) == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 0
NEI4 $959
line 1274
;1274:			return;
ADDRGP4 $950
JUMPV
LABELV $959
line 1276
;1275:		}
;1276:	}
LABELV $952
line 1279
;1277:
;1278:	// calculate the position at exactly the frame time
;1279:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, cent->lerpOrigin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1280
;1280:	CG_SetEntitySoundPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 1282
;1281:
;1282:	CG_EntityEvent( cent, cent->lerpOrigin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRGP4 CG_EntityEvent
CALLV
pop
line 1283
;1283:}
LABELV $950
endproc CG_CheckEvents 8 12
import CG_NewParticleArea
import initparticles
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_ShaderStateChanged
import CG_LoadVoiceChats
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_ProcessSnapshots
import CG_MakeExplosion
import CG_Bleed
import CG_BigExplode
import CG_GibPlayer
import CG_ScorePlum
import CG_SpawnEffect
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawWeaponSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_GrappleTrail
import CG_RailTrail
import CG_Bullet
import CG_ShotgunFire
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModel
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawSmallStringColor
import CG_DrawSmallString
import CG_DrawBigStringColor
import CG_DrawBigString
import CG_DrawStringExt
import CG_DrawString
import CG_DrawPic
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_BuildSpectatorString
import CG_GetSelectedScore
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import cg_trueLightning
import cg_oldPlasma
import cg_oldRocket
import cg_oldRail
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import pmove_msec
import pmove_fixed
import cg_smoothClients
import cg_scorePlum
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_synchronousClients
import cg_drawAttacker
import cg_lagometer
import cg_stereoSeparation
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_railTrailTime
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairHealth
import cg_crosshairSize
import cg_crosshairY
import cg_crosshairX
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
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
LABELV $947
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $946
byte 1 85
byte 1 78
byte 1 75
byte 1 78
byte 1 79
byte 1 87
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $942
byte 1 69
byte 1 86
byte 1 95
byte 1 68
byte 1 69
byte 1 66
byte 1 85
byte 1 71
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $937
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 84
byte 1 79
byte 1 80
byte 1 76
byte 1 79
byte 1 79
byte 1 80
byte 1 73
byte 1 78
byte 1 71
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $928
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 73
byte 1 66
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $915
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 79
byte 1 87
byte 1 69
byte 1 82
byte 1 85
byte 1 80
byte 1 95
byte 1 82
byte 1 69
byte 1 71
byte 1 69
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $902
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 79
byte 1 87
byte 1 69
byte 1 82
byte 1 85
byte 1 80
byte 1 95
byte 1 66
byte 1 65
byte 1 84
byte 1 84
byte 1 76
byte 1 69
byte 1 83
byte 1 85
byte 1 73
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $889
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 79
byte 1 87
byte 1 69
byte 1 82
byte 1 85
byte 1 80
byte 1 95
byte 1 81
byte 1 85
byte 1 65
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $884
byte 1 69
byte 1 86
byte 1 95
byte 1 79
byte 1 66
byte 1 73
byte 1 84
byte 1 85
byte 1 65
byte 1 82
byte 1 89
byte 1 10
byte 1 0
align 1
LABELV $879
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $878
byte 1 69
byte 1 86
byte 1 95
byte 1 68
byte 1 69
byte 1 65
byte 1 84
byte 1 72
byte 1 120
byte 1 10
byte 1 0
align 1
LABELV $870
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 65
byte 1 73
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $746
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 79
byte 1 66
byte 1 65
byte 1 76
byte 1 95
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $735
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 79
byte 1 66
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $726
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 69
byte 1 78
byte 1 69
byte 1 82
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $721
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 72
byte 1 79
byte 1 84
byte 1 71
byte 1 85
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $716
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 85
byte 1 76
byte 1 76
byte 1 69
byte 1 84
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 95
byte 1 70
byte 1 76
byte 1 69
byte 1 83
byte 1 72
byte 1 10
byte 1 0
align 1
LABELV $711
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 85
byte 1 76
byte 1 76
byte 1 69
byte 1 84
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 95
byte 1 87
byte 1 65
byte 1 76
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $704
byte 1 69
byte 1 86
byte 1 95
byte 1 82
byte 1 65
byte 1 73
byte 1 76
byte 1 84
byte 1 82
byte 1 65
byte 1 73
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $699
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 95
byte 1 77
byte 1 69
byte 1 84
byte 1 65
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $694
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 10
byte 1 0
align 1
LABELV $689
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $684
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 67
byte 1 79
byte 1 82
byte 1 69
byte 1 80
byte 1 76
byte 1 85
byte 1 77
byte 1 10
byte 1 0
align 1
LABELV $679
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 72
byte 1 82
byte 1 95
byte 1 73
byte 1 78
byte 1 70
byte 1 79
byte 1 10
byte 1 0
align 1
LABELV $668
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 68
byte 1 69
byte 1 95
byte 1 66
byte 1 79
byte 1 85
byte 1 78
byte 1 67
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $660
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 82
byte 1 69
byte 1 83
byte 1 80
byte 1 65
byte 1 87
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $653
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 80
byte 1 79
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $646
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 95
byte 1 79
byte 1 85
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $639
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 95
byte 1 73
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $634
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 52
byte 1 10
byte 1 0
align 1
LABELV $629
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 51
byte 1 10
byte 1 0
align 1
LABELV $624
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 50
byte 1 10
byte 1 0
align 1
LABELV $619
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $614
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $609
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 57
byte 1 10
byte 1 0
align 1
LABELV $604
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 56
byte 1 10
byte 1 0
align 1
LABELV $599
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $594
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 54
byte 1 10
byte 1 0
align 1
LABELV $589
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 53
byte 1 10
byte 1 0
align 1
LABELV $584
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 52
byte 1 10
byte 1 0
align 1
LABELV $579
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 51
byte 1 10
byte 1 0
align 1
LABELV $574
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 50
byte 1 10
byte 1 0
align 1
LABELV $569
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $564
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $559
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 73
byte 1 82
byte 1 69
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $552
byte 1 69
byte 1 86
byte 1 95
byte 1 67
byte 1 72
byte 1 65
byte 1 78
byte 1 71
byte 1 69
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $544
byte 1 69
byte 1 86
byte 1 95
byte 1 78
byte 1 79
byte 1 65
byte 1 77
byte 1 77
byte 1 79
byte 1 10
byte 1 0
align 1
LABELV $530
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 79
byte 1 66
byte 1 65
byte 1 76
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 80
byte 1 73
byte 1 67
byte 1 75
byte 1 85
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $512
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 80
byte 1 73
byte 1 67
byte 1 75
byte 1 85
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $507
byte 1 42
byte 1 103
byte 1 97
byte 1 115
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $506
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 67
byte 1 76
byte 1 69
byte 1 65
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $499
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 85
byte 1 78
byte 1 68
byte 1 69
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $492
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 76
byte 1 69
byte 1 65
byte 1 86
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $485
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 84
byte 1 79
byte 1 85
byte 1 67
byte 1 72
byte 1 10
byte 1 0
align 1
LABELV $480
byte 1 42
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $479
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $474
byte 1 69
byte 1 86
byte 1 95
byte 1 74
byte 1 85
byte 1 77
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $469
byte 1 42
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $462
byte 1 69
byte 1 86
byte 1 95
byte 1 74
byte 1 85
byte 1 77
byte 1 80
byte 1 95
byte 1 80
byte 1 65
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $432
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $419
byte 1 42
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $418
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 95
byte 1 70
byte 1 65
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $406
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 95
byte 1 77
byte 1 69
byte 1 68
byte 1 73
byte 1 85
byte 1 77
byte 1 10
byte 1 0
align 1
LABELV $392
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 95
byte 1 83
byte 1 72
byte 1 79
byte 1 82
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $381
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 87
byte 1 73
byte 1 77
byte 1 10
byte 1 0
align 1
LABELV $370
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 87
byte 1 65
byte 1 68
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $359
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 10
byte 1 0
align 1
LABELV $348
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 95
byte 1 77
byte 1 69
byte 1 84
byte 1 65
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $338
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $327
byte 1 90
byte 1 69
byte 1 82
byte 1 79
byte 1 69
byte 1 86
byte 1 69
byte 1 78
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $321
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $313
byte 1 72
byte 1 82
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $310
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 49
byte 1 48
byte 1 48
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $309
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 55
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $306
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 53
byte 1 48
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $303
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 50
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $252
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $251
byte 1 78
byte 1 111
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $241
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $240
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $235
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $234
byte 1 39
byte 1 115
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $233
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $231
byte 1 39
byte 1 115
byte 1 32
byte 1 66
byte 1 70
byte 1 71
byte 1 0
align 1
LABELV $230
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $228
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 114
byte 1 111
byte 1 99
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $226
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $223
byte 1 39
byte 1 115
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $222
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $220
byte 1 97
byte 1 108
byte 1 109
byte 1 111
byte 1 115
byte 1 116
byte 1 32
byte 1 100
byte 1 111
byte 1 100
byte 1 103
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $218
byte 1 39
byte 1 115
byte 1 32
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $216
byte 1 39
byte 1 115
byte 1 32
byte 1 115
byte 1 104
byte 1 114
byte 1 97
byte 1 112
byte 1 110
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $215
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 104
byte 1 114
byte 1 101
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $213
byte 1 39
byte 1 115
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $212
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $210
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 103
byte 1 117
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $208
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $206
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 112
byte 1 117
byte 1 109
byte 1 109
byte 1 101
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $204
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 117
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $193
byte 1 110
byte 1 111
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $190
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $187
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 37
byte 1 115
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $180
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $176
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $175
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $172
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $169
byte 1 115
byte 1 104
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $167
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $166
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $163
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $159
byte 1 98
byte 1 108
byte 1 101
byte 1 119
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $158
byte 1 98
byte 1 108
byte 1 101
byte 1 119
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $155
byte 1 98
byte 1 108
byte 1 101
byte 1 119
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $151
byte 1 116
byte 1 114
byte 1 105
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $150
byte 1 116
byte 1 114
byte 1 105
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $147
byte 1 116
byte 1 114
byte 1 105
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $137
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 119
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $135
byte 1 115
byte 1 97
byte 1 119
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $133
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 102
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 118
byte 1 97
byte 1 0
align 1
LABELV $131
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $129
byte 1 101
byte 1 120
byte 1 101
byte 1 114
byte 1 99
byte 1 105
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 104
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $127
byte 1 115
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 108
byte 1 105
byte 1 107
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $125
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 113
byte 1 117
byte 1 105
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $123
byte 1 99
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $121
byte 1 115
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $117
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $116
byte 1 110
byte 1 0
align 1
LABELV $109
byte 1 67
byte 1 71
byte 1 95
byte 1 79
byte 1 98
byte 1 105
byte 1 116
byte 1 117
byte 1 97
byte 1 114
byte 1 121
byte 1 58
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $104
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $103
byte 1 37
byte 1 105
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $102
byte 1 37
byte 1 105
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $99
byte 1 37
byte 1 105
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $96
byte 1 37
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $93
byte 1 49
byte 1 51
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $90
byte 1 49
byte 1 50
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $87
byte 1 49
byte 1 49
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $84
byte 1 94
byte 1 51
byte 1 51
byte 1 114
byte 1 100
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $81
byte 1 94
byte 1 49
byte 1 50
byte 1 110
byte 1 100
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $78
byte 1 94
byte 1 52
byte 1 49
byte 1 115
byte 1 116
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $75
byte 1 0
align 1
LABELV $74
byte 1 84
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 0
