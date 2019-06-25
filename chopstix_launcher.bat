rem Ryan Baszkowski
rem First written on 25 June 2019
rem GZDoom WAD Launcher/Wrapper/Frontend

@echo off
title GZDoom Super Launcher

rem Welcome, prompt user for game
echo Welcome to Chopstix's GZDoom launcher!
echo Which game you tryna play?
echo 1.) The Ultimate Doom (Doom 1)
echo 2.) Doom 2
echo 3.) Final Doom: TNT Evilution
echo 4.) Final Doom: The Plutonia Experiment
echo 5.) SIGIL
echo 6.) Heretic: Shadow of the Serpent Riders
echo 7.) Hexen: Beyond Heretic
echo 8.) Hexen: Deathkings of the Dark Citadel (Expansion)
echo 9.) Strife: Veteran Edition
echo 10.) Other
set /p game= Enter the number of your selection and strike ENTER: 

rem Prompt user for mode of play
echo Singleplayer, Multiplayer Host, or Multiplayer Join?
echo 1.) Singleplayer
echo 2.) Multiplayer Host
echo 3.) Multiplayer Join
set /p mode= Enter the number of your selection and strike ENTER: 

rem Go from game selection to actual WAD file
if "%game%"=="1" (set gamest=DOOM.WAD)
if "%game%"=="2" (set gamest=DOOM2.WAD)
if "%game%"=="3" (set gamest=TNT.WAD)
if "%game%"=="4" (set gamest=PLUTONIA.WAD)
if "%game%"=="5" (set gamest=SIGIL.wad)
if "%game%"=="6" (set gamest=HERETIC.WAD)
if "%game%"=="7" (set gamest=HEXEN.WAD)
if "%game%"=="8" (set gamest=HEXDD.WAD)
if "%game%"=="9" (set gamest=SVE.wad)
if "%game%"=="10" (set /p gamest= Enter the WAD file and strike ENTER: )

rem Sort out the mode and act accordingly
if "%mode%"=="1" (goto SP)
if "%mode%"=="2" (goto HOST)
if "%mode%"=="3" (goto JOIN)

:SP
gzdoom -iwad %gamest%
exit

:HOST
echo How many players, 2-4?
set /p players= Enter your choice: 
echo Which difficulty?
echo 1.) I'm too young to die
echo 2.) Hey, not too rough
echo 3.) Hurt me plenty
echo 4.) Ultra-Violence
echo 5.) Nightmare!
set /p diff= Enter the number of your selection and strike ENTER: 
gzdoom.exe -iwad %gamest% -host %players% -skill %diff%
exit

:JOIN
echo To which IP do you want to connect?
echo Remember, you can right-click to paste...
set /p addr= Enter address and strike ENTER: 
gzdoom.exe -iwad %gamest% -join %addr%
exit
