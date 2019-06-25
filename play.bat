rem Ryan Baszkowski
rem First written on 25 June 2019
rem GZDoom Game Launcher

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
echo 7.) HeXen: Beyond Heretic
echo 8.) HeXen: Deathkings of the Dark Citadel (Expansion)
set /p game= Enter your choice: 

rem Prompt user for mode of play
echo Singleplayer, Multiplayer Host, or Multiplayer Join?
echo 1.) Singleplayer
echo 2.) Multiplayer Host
echo 3.) Multiplayer Join
set /p mode= Enter your choice:

rem Go from game selection to actual WAD file
if "%game%"=="1" (set gamest=DOOM.WAD)
if "%game%"=="2" (set gamest=DOOM2.WAD)
if "%game%"=="3" (set gamest=TNT.WAD)
if "%game%"=="4" (set gamest=PLUTONIA.WAD)
if "%game%"=="5" (set gamest=SIGIL.WAD)
if "%game%"=="6" (set gamest=HERETIC.WAD)
if "%game%"=="7" (set gamest=HEXEN.WAD)
if "%game%"=="8" (set gamest=HEXDD.WAD)

rem Sort out the mode and act accordingly
if "%mode%"=="1" (goto SP)
if "%mode%"=="2" (goto HOST)
if "%mode%"=="3" (goto JOIN)

:SP
gzdoom -FILE %gamest%
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
set /p diff= Enter your choice: 
gzdoom.exe -FILE %gamest% -host %players% -skill %diff%
exit

:JOIN
echo Which IP to join?
set /p addr= Enter address: 
gzdoom.exe -FILE %gamest% -join %addr%
exit
