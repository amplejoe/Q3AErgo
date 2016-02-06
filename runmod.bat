@echo off

:: set your quake 3 arena  path here
set filepath=Quake3
echo Quake 3 Home: %filepath%

:: resolution
set width=1920
set height=1080

:: save parent dir - shift messes this up
SET parent=%~dp0

:: default values
set map=q3dm1
set /a bots=3
set diff=2
set frag=10
set time=0
set hrmode=1
set items=1
set powerups=1
set weapons=1
set worlddrops=1
set joy=regular
set joybind=

::clear age var
set "age="
set "hrtarget=aerobic"

:: shifts through parameters and if present sets variables 
:parameterloop
IF NOT "%1"=="" (
    IF "%1"=="-age" (
        SET age=%2
        SHIFT
    )
       IF "%1"=="-hrtarget" (
        SET hrtarget=%2
        SHIFT
    )
    IF "%1"=="-map" (
        SET map=%2
        SHIFT
    )
    IF "%1"=="-bots" (
        SET bots=%2
        SHIFT
    )
    IF "%1"=="-diff" (
        SET diff=%2
        SHIFT
    )
	IF "%1"=="-frag" (
        SET frag=%2
        SHIFT
    )
	IF "%1"=="-time" (
        SET time=%2
        SHIFT
    )
	IF "%1"=="-joy" (
        SET joy=%2
        SHIFT
    )
    IF "%1"=="-disable" (         
        :disableloop
        IF "%2"=="hrmode" (
           SET "hrmode=0"
           SHIFT
           GOTO disableloop
           ) ELSE (
           IF "%2"=="items" (
           SET "items=0"
           SHIFT
           GOTO disableloop
           ) ELSE (
           IF "%2"=="powerups" (
           SET "powerups=0"
           SHIFT
           GOTO disableloop
           ) ELSE (
           IF "%2"=="weapons" (
           SET "weapons=0"
           SHIFT
           GOTO disableloop
		   ) ELSE (
		   IF "%2"=="worlddrops" (
           SET "worlddrops=0"
           SHIFT
           GOTO disableloop
        )))))
        GOTO parameterloop
    )
    SHIFT
    GOTO parameterloop
)

:: age input is mandatory
IF "%age%"=="" goto PRINTUSAGE
IF "%hrmode%"=="1" (
     IF NOT "%hrtarget%"=="recovery" (
        IF NOT "%hrtarget%"=="aerobic" (
           IF NOT "%hrtarget%"=="anaerobic" ( 
		      goto PRINTUSAGE
			  )))
)

set modDir=testmod

if not exist %filepath% (
    goto QUAKEDIRERROR
)

:: joystick mode
IF "%joy%"=="regular" (
set joybind=+bind JOY17 "+lookdown" +bind JOY16 "+lookup"
) ELSE (
set joybind=+bind JOY16 "+lookdown" +bind JOY17 "+lookup"
)

:: add player to bot number (maxplayers = player + bots)
@set /a "bots=%bots%+1"

cd %filepath%

echo Calling '%filepath%\quake3.exe' (age: %age%, mapname: %map%, bots: %bots%, difficulty: %diff%, fraglimit: %frag%, timelimit: %time%)
quake3.exe +set r_fullscreen 1 +set r_customaspect 1 +set r_customwidth %width% +set r_customheight %height% +set r_mode "-1" +set fs_game %modDir% +set dedicated 0 +set age %age% +set hrtarget %hrtarget% +set  hrmode %hrmode% +set  items %items% +set  powerups %powerups% +set  weapons %weapons% +set worlddrops %worlddrops% +set map devmap %map% +bot_minplayers %bots% +g_spskill %diff% +set fraglimit %frag% +set timelimit %time% %joybind% +exec ergomod.cfg 

cd %parent%

goto EXIT

:QUAKEDIRERROR
echo Could not find Quake executable - please open this file to set it correctly... 
goto EXIT

:PRINTUSAGE
echo Program Usage: runmod [-age PLAYERAGE] [-hrtarget WORKOUTGOAL] [-disable DOPTIONS (optional)] [-map MAPNAME (optional)] [-bots NUMBOTS (optional)] [-diff DIFFICULTY (optional)] [-frag FRAGLIMIT (optional)] [-time TIMELIMIT (optional)] [-joy JOYSTICKMODE (optional)]
echo [PLAYERAGE] ................ Player's age
echo [WORKOUTGOAL] .............. Heart Rate Target (Default: %hrtarget%), Available:
echo                                recovery, aerobic, anaerobic
echo [DOPTIONS] ................. Optionally disableable options (Default: all on), Available:
echo                                hrmode, items, powerups, weapons, worlddrops 
echo [MAPNAME] .................. Quake Map (Default: %map%), Available:
echo                                q3dm[0-19], q3tourney[1-6], q3ctf[1-4] 
echo [NUMBOTS] .................. Number of Bots  (Default: %bots%), Bot Pool: 
echo                                crash      ranger      phobos   mynx        orbb
echo                                sarge      bitterman   grunt    hossman     daemia 
echo                                hunter     klesk       angel    wrack       gorre
echo                                slash      anarki      biker    lucy        patriot
echo                                tankjr
echo [DIFFICULTY] ............... Game difficulty (1-5, easy-hard), Default: %diff%
echo [FRAGLIMIT] ................ Frag Limit (Default: %frag%)
echo [TIMELIMIT] ................ Time Limit in minutes (Default: none)
echo [JOYSTICKMODE] ............. Joystick behavior (Default: regular), Available:
echo                                regular, inverted	
echo -----------------------------------------------------------------------------------------
echo Ingame debug options (bring up console with '~' and prepended with a '\'):
echo debugmod (NUM *) ............................... debugging on/off
echo inchr (NUM +) .................................. increase max heart rate by 5 (max: 300)
echo dechr (NUM -) .................................. decrease max heart rate by 5 (min: 20)
echo incnumhrsamples (NUM uparrow) .................. increase number of taken hr samples for rate calculation (max: 60)
echo decnumhrsamples (NUM downarrow) ................ decrease number of taken hr samples for rate calculation (min: 1)
echo ergostatus ..................................... settings information
:EXIT
echo Exiting Script
EXIT /B 0
