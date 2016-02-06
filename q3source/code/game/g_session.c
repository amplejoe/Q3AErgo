/*
===========================================================================
Copyright (C) 1999-2005 Id Software, Inc.

This file is part of Quake III Arena source code.

Quake III Arena source code is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 2 of the License,
or (at your option) any later version.

Quake III Arena source code is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Foobar; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
===========================================================================
*/
//
#include "g_local.h"


/*
=======================================================================

  SESSION DATA

Session data is the only data that stays persistant across level loads
and tournament restarts.
=======================================================================
*/

/*
================
G_WriteClientSessionData

Called on game shutdown
================
*/
void G_WriteClientSessionData( gclient_t *client ) {
	const char	*s;
	const char	*var;

	s = va("%i %i %i %i %i %i %i %i %i %i %i %i", // [ERGO MOD] add five '%i' here 
		client->sess.sessionTeam,
		client->sess.spectatorTime,
		client->sess.spectatorState,
		client->sess.spectatorClient,
		client->sess.wins,
		client->sess.losses,
		client->sess.teamLeader,
		// [ERGO MOD START]	// added ',' after client->sess.teamLeader
		client->sess.ergoFlags,
		client->sess.modDebug,
		client->sess.targetHR,
		client->sess.age,
		client->sess.maxHeartRate
		// [ERGO MOD END]	
		);

	var = va( "session%i", client - level.clients );

	trap_Cvar_Set( var, s );
}

/*
================
G_ReadSessionData

Called on a reconnect
================
*/
void G_ReadSessionData( gclient_t *client ) {
	char	s[MAX_STRING_CHARS];
	const char	*var;

	// bk001205 - format
	int teamLeader;
	int spectatorState;
	int sessionTeam;

	var = va( "session%i", client - level.clients );
	trap_Cvar_VariableStringBuffer( var, s, sizeof(s) );

	sscanf(s, "%i %i %i %i %i %i %i %i %i %i %i %i", // [ERGO MOD] add five '%i' here
		&sessionTeam,                 // bk010221 - format
		&client->sess.spectatorTime,
		&spectatorState,              // bk010221 - format
		&client->sess.spectatorClient,
		&client->sess.wins,
		&client->sess.losses,
		&teamLeader,                  // bk010221 - format
		// [ERGO MOD START]	// added ',' after &teamLeader
		&client->sess.ergoFlags,
		&client->sess.modDebug,
		&client->sess.targetHR,
		&client->sess.age,
		&client->sess.maxHeartRate
		// [ERGO MOD END]	
		);

	// bk001205 - format issues
	client->sess.sessionTeam = (team_t)sessionTeam;
	client->sess.spectatorState = (spectatorState_t)spectatorState;
	client->sess.teamLeader = (qboolean)teamLeader;
}


/*
================
G_InitSessionData

Called on a first-time connect
================
*/
void G_InitSessionData( gclient_t *client, char *userinfo ) {
	clientSession_t	*sess;
	const char		*value;
	char			buf[256];

	sess = &client->sess;

	// [ERGO MOD START]	
	// flags for mod
	if (trap_Cvar_VariableIntegerValue("hrmode") == 1) sess->ergoFlags ^= E_FL_HRMODE;		// toggle hr measurements
	if (trap_Cvar_VariableIntegerValue("items") == 1) sess->ergoFlags ^= E_FL_ITEMS;		// rnd items (armor, health,...)
	if (trap_Cvar_VariableIntegerValue("powerups") == 1) sess->ergoFlags ^= E_FL_POWERUPS;	// rnd power-ups (regenaration, quad dmg, ...)
	if (trap_Cvar_VariableIntegerValue("weapons") == 1) sess->ergoFlags ^= E_FL_WEAPONS;	// rnd weapons 
	if (trap_Cvar_VariableIntegerValue("worlddrops") == 1) sess->ergoFlags ^= E_FL_WORLDDROPS;	// all world drops
	// hr related	
	trap_Cvar_VariableStringBuffer("hrtarget", buf, sizeof(buf));
	if (Q_stricmp(buf, "recovery") == 0) sess->targetHR = HR_TARGET_RECOVERY;
	else if (Q_stricmp(buf, "aerobic") == 0) sess->targetHR = HR_TARGET_AEROBIC;
	else if (Q_stricmp(buf, "anaerobic") == 0) sess->targetHR = HR_TARGET_ANAEROBIC;
	sess->age = trap_Cvar_VariableIntegerValue("age");
	sess->maxHeartRate = 206.9 - (0.67 * sess->age);
	sess->modDebug = DEBUG_MOD;
	// [ERGO MOD END]

	// initial team determination
	if ( g_gametype.integer >= GT_TEAM ) {
		if ( g_teamAutoJoin.integer ) {
			sess->sessionTeam = PickTeam( -1 );
			BroadcastTeamChange( client, -1 );
		} else {
			// always spawn as spectator in team games
			sess->sessionTeam = TEAM_SPECTATOR;	
		}
	} else {
		value = Info_ValueForKey( userinfo, "team" );
		if ( value[0] == 's' ) {
			// a willing spectator, not a waiting-in-line
			sess->sessionTeam = TEAM_SPECTATOR;
		} else {
			switch ( g_gametype.integer ) {
			default:
			case GT_FFA:
			case GT_SINGLE_PLAYER:
				if ( g_maxGameClients.integer > 0 && 
					level.numNonSpectatorClients >= g_maxGameClients.integer ) {
					sess->sessionTeam = TEAM_SPECTATOR;
				} else {
					sess->sessionTeam = TEAM_FREE;
				}
				break;
			case GT_TOURNAMENT:
				// if the game is full, go into a waiting mode
				if ( level.numNonSpectatorClients >= 2 ) {
					sess->sessionTeam = TEAM_SPECTATOR;
				} else {
					sess->sessionTeam = TEAM_FREE;
				}
				break;
			}
		}
	}

	sess->spectatorState = SPECTATOR_FREE;
	sess->spectatorTime = level.time;

	G_WriteClientSessionData( client );
}


/*
==================
G_InitWorldSession

==================
*/
void G_InitWorldSession( void ) {
	char	s[MAX_STRING_CHARS];
	int			gt;

	trap_Cvar_VariableStringBuffer( "session", s, sizeof(s) );
	gt = atoi( s );
	
	// if the gametype changed since the last session, don't use any
	// client sessions
	if ( g_gametype.integer != gt ) {
		level.newSession = qtrue;
		G_Printf( "Gametype changed, clearing session data.\n" );
	}
}

/*
==================
G_WriteSessionData

==================
*/
void G_WriteSessionData( void ) {
	int		i;

	trap_Cvar_Set( "session", va("%i", g_gametype.integer) );

	for ( i = 0 ; i < level.maxclients ; i++ ) {
		if ( level.clients[i].pers.connected == CON_CONNECTED ) {
			G_WriteClientSessionData( &level.clients[i] );
		}
	}
}
