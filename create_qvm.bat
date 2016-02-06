@echo off

:: save parent dir - shift messes this up
SET parent=%~dp0

:: set your quake 3 arena path here
set filepath=%parent%Quake3
echo Quake 3 Home: %filepath%


set modDir=%filepath%\testmod\vm
set tempDir=%parent%\q3source\temp\baseq3\vm

if not exist %filepath% (
	goto QUAKEDIRERROR
)

:: at least 1 parameter mandatory
if "%~1"=="" goto PRINTUSAGE

:: clean values
set "server="
set "client="
set "ui="

:: shifts through parameters and if present sets variables 
:parameterloop
IF NOT "%1"=="" (
    IF "%1"=="server" (
        SET "server=%1"
	)
    IF "%1"=="client" (
        SET "client=%1"
	)
	IF "%1"=="ui" (
        SET "ui=%1"
	)
    SHIFT
    GOTO parameterloop
)

if "%server%" == "server" (call %parent%q3source\code\game\game.bat)
if "%client%" == "client" (call %parent%q3source\code\cgame\cgame.bat)
if "%ui%" == "ui" (call %parent%q3source\code\q3_ui\q3_ui.bat)

mkdir %modDir%

move %tempDir%\* %modDir%

cd %parent%

goto EXIT


:QUAKEDIRERROR
echo Could not find Quake path - please open this file to set it correctly... 
goto EXIT

:PRINTUSAGE
echo Program Usage: createqvm [server (optional)] [client (optional)] [ui (optional)]
echo server ................ Compile server game (creates qagame.qvm)
echo client ................ Compile client game (creates cgame.qvm)
echo ui     ................ Compile ui game (creates ui.qvm)
:EXIT
echo Exiting Program
EXIT /B 0