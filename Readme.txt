Quake 3 Arena Ergometer Edition
---------------------------------------

Installation:
	- The custom batch files for compiling and running need to find the purchased Quake 3 Arena game: either copy/move the 
	   contents of your Quake 3 Arena installation directory to the 'Quake3' folder in this directory or change the filepath variable 
	   in create_qvm.bat and runmod.bat to point to your Quake 3 Arena installation path.
	-  If you chose the latter you have to manually copy the 'Quake3\testmod' directory to your installation directory, as the mod
	   is installed to this directory and the .cfg files are needed to run it.
	-  If your resulution is different than HD (1920x1080) change width & height in 'runmod.bat' to match your resolution

Modding:
	- Open q3source\code\quake3.sln in Visual Studio; version 2013 was used for creating the mod, but it can easily be converted.

Compiling:
	use create_qvm.bat with optional paramaters 'server', 'client' and 'ui' depending on which project should be compiled:
	E.g. to compile all projects input (must be done before first run to generate all qvm files):
	create_qvm server client ui
	
Running: 
	use runmod.bat with optional parameters  (a full list is given when no required '-age' parameter is given)
	E.g. 1. for starting mod with default options (3 bots, difficulty 2, map: q3dm1, ...) : 
	runmod -age 30
	E.g. 2. define some more options (inverted joystick layout, no item spawns on maps, no powerup rewards, 5min timelimit, ...):
	runmod -age 25 -bots 4 -hrtarget recovery -joy inverted -disable worlddrops powerups -time 5
	
Controls:
	Arduino generated keypresses (repeatedly press on keyboard to test):
	'x' signals one bike cycle.
	'h' signals a heart beat.

	Ingame debug options (bring up console with '~' and prepended with a '\'):
	debugmod (NUM *)                  debugging on/off
	inchr (NUM +)                     increase max heart rate by 5 (max: 300)
	dechr (NUM -)                     decrease max heart rate by 5 (min: 20)
	incnumhrsamples (NUM uparrow)     increase number of taken hr samples for rate calculation (max: 60)
	decnumhrsamples (NUM downarrow)   decrease number of taken hr samples for rate calculation (min: 1)
	ergostatus                        settings information
