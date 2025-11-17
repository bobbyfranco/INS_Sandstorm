:: This is a fairly comprehensive server launcher for Insurgency Sandstorm scripted by Bobby Franco. Feel free to edit how you see fit, but know that the code is very fragile, so be sure you know what you're doing.

@echo off
color 0a
title Insurgency Sandstorm Advanced Server Launcher 2.0 ^| Main Menu
:: enable delayed expansion for safe variable usage
setlocal enabledelayedexpansion
::runas /user:Administrator "%~f0" REM // this isn't necessary, but may be useful if you're having trouble with your server.

:: check if launcher is in correct directory
if exist InsurgencyServer.exe (
	REM // don't delete this comment lol
) else (
    echo You're currently not inside your sandstorm server directory!
    echo Please move launcher to the correct directory where InsurgencyServer.exe is located or give a path to the directory.
    echo.
    set /p svDir=Path to directory: 
    move "%~f0" "!svDir!\%~n0%~x0"
    echo Launcher has been moved to "!svDir!\%~n0%~x0".
    echo Go to the provided directory to restart launcher.
    pause
)

:: set server defaults for quick start
set svConfig=%cd%\Insurgency\Config\Server
for /F "tokens=14" %%i in ('"ipconfig | findstr IPv4"') do SET svIP=%%i
set svName=INS Server
set svMax=8
set cheats=0
set "token1="
set "token2="
set getTM=1
set getGM=1
set IP=0
set MC=0
set MD=0
set TK=0

REM // i only included a few gamemodes cause im lazy, but feel free to add more \\

:: map list.
::====================== Checkpoint ==============================
set cpMap[0]=Town?Scenario_Hideout_Checkpoint_Security
set cpMap[1]=Town?Scenario_Hideout_Checkpoint_Insurgents
set cpMap[2]=Precinct?Scenario_Precinct_Checkpoint_Security
set cpMap[3]=Precinct?Scenario_Precinct_Checkpoint_Insurgents
set cpMap[4]=OiIPield?Scenario_Refinery_Checkpoint_Security
set cpMap[5]=OiIPield?Scenario_Refinery_Checkpoint_Insurgents
set cpMap[6]=Farmhouse?Scenario_Farmhouse_Checkpoint_Security
set cpMap[7]=Farmhouse?Scenario_Farmhouse_Checkpoint_Insurgents
set cpMap[8]=Mountain?Scenario_Summit_Checkpoint_Security
set cpMap[9]=Mountain?Scenario_Summit_Checkpoint_Insurgents
set cpMap[10]=Citadel?Scenario_Citadel_Checkpoint_Security
set cpMap[11]=Citadel?Scenario_Citadel_Checkpoint_Insurgents
set cpMap[12]=Bab?Scenario_Bab_Checkpoint_Security
set cpMap[13]=Bab?Scenario_Bab_Checkpoint_Insurgents
set cpMap[14]=Gap?Scenario_Gap_Checkpoint_Security
set cpMap[15]=Gap?Scenario_Gap_Checkpoint_Insurgents
set cpMap[16]=Sinjar?Scenario_Hillside_Checkpoint_Security
set cpMap[17]=Sinjar?Scenario_Hillside_Checkpoint_Insurgents
set cpMap[18]=Ministry?Scenario_Ministry_Checkpoint_Security
set cpMap[19]=Ministry?Scenario_Ministry_Checkpoint_Insurgents
set cpMap[20]=Compound?Scenario_Outskirts_Checkpoint_Security
set cpMap[21]=Compound?Scenario_Outskirts_Checkpoint_Insurgents
set cpMap[22]=PowerPlant?Scenario_PowerPlant_Checkpoint_Security
set cpMap[23]=PowerPlant?Scenario_PowerPlant_Checkpoint_Insurgents
set cpMap[24]=Tell?Scenario_Tell_Checkpoint_Security
set cpMap[25]=Tell?Scenario_Tell_Checkpoint_Insurgents
set cpMap[26]=Buhriz?Scenario_Tideway_Checkpoint_Security
set cpMap[27]=Buhriz?Scenario_Tideway_Checkpoint_Insurgents
set cpMap[28]=Prison?Scenario_Prison_Checkpoint_Security
set cpMap[29]=Prison?Scenario_Prison_Checkpoint_Insurgents
set cpMap[30]=LastLight?Scenario_LastLight_Checkpoint_Security
set cpMap[31]=LastLight?Scenario_LastLight_Checkpoint_Insurgents
set cpMap[32]=TrainYard?Scenario_Trainyard_Checkpoint_Security
set cpMap[33]=TrainYard?Scenario_Trainyard_Checkpoint_Insurgents
set cpMap[34]=Forest?Scenario_Forest_Checkpoint_Security
set cpMap[35]=Forest?Scenario_Forest_Checkpoint_Insurgents
set cpMap[36]=Canyon?Scenario_Crossing_Checkpoint_Security
set cpMap[37]=Canyon?Scenario_Crossing_Checkpoint_Insurgents
::====================== Hardcore Checkpoint ============================
set cphMap[0]=Town?Scenario_Hideout_Checkpoint_Security?Mutators=Hardcore
set cphMap[1]=Town?Scenario_Hideout_Checkpoint_Insurgents?Mutators=Hardcore
set cphMap[2]=Precinct?Scenario_Precinct_Checkpoint_Security?Mutators=Hardcore
set cphMap[3]=Precinct?Scenario_Precinct_Checkpoint_Insurgents?Mutators=Hardcore
set cphMap[4]=OiIPield?Scenario_Refinery_Checkpoint_Security?Mutators=Hardcore
set cphMap[5]=OiIPield?Scenario_Refinery_Checkpoint_Insurgents?Mutators=Hardcore
set cphMap[6]=Farmhouse?Scenario_Farmhouse_Checkpoint_Security?Mutators=Hardcore
set cphMap[7]=Farmhouse?Scenario_Farmhouse_Checkpoint_Insurgents?Mutators=Hardcore
set cphMap[8]=Mountain?Scenario_Summit_Checkpoint_Security?Mutators=Hardcore
set cphMap[9]=Mountain?Scenario_Summit_Checkpoint_Insurgents?Mutators=Hardcore
set cphMap[10]=Citadel?Scenario_Citadel_Checkpoint_Security?Mutators=Hardcore
set cphMap[11]=Citadel?Scenario_Citadel_Checkpoint_Insurgents?Mutators=Hardcore
set cphMap[12]=Bab?Scenario_Bab_Checkpoint_Security?Mutators=Hardcore
set cphMap[13]=Bab?Scenario_Bab_Checkpoint_Insurgents?Mutators=Hardcore
set cphMap[14]=Gap?Scenario_Gap_Checkpoint_Security?Mutators=Hardcore
set cphMap[15]=Gap?Scenario_Gap_Checkpoint_Insurgents?Mutators=Hardcore
set cphMap[16]=Sinjar?Scenario_Hillside_Checkpoint_Security?Mutators=Hardcore
set cphMap[17]=Sinjar?Scenario_Hillside_Checkpoint_Insurgents?Mutators=Hardcore
set cphMap[18]=Ministry?Scenario_Ministry_Checkpoint_Security?Mutators=Hardcore
set cphMap[19]=Ministry?Scenario_Ministry_Checkpoint_Insurgents?Mutators=Hardcore
set cphMap[20]=Compound?Scenario_Outskirts_Checkpoint_Security?Mutators=Hardcore
set cphMap[21]=Compound?Scenario_Outskirts_Checkpoint_Insurgents?Mutators=Hardcore
set cphMap[22]=PowerPlant?Scenario_PowerPlant_Checkpoint_Security?Mutators=Hardcore
set cphMap[23]=PowerPlant?Scenario_PowerPlant_Checkpoint_Insurgents?Mutators=Hardcore
set cphMap[24]=Tell?Scenario_Tell_Checkpoint_Security?Mutators=Hardcore
set cphMap[25]=Tell?Scenario_Tell_Checkpoint_Insurgents?Mutators=Hardcore
set cphMap[26]=Buhriz?Scenario_Tideway_Checkpoint_Security?Mutators=Hardcore
set cphMap[27]=Buhriz?Scenario_Tideway_Checkpoint_Insurgents?Mutators=Hardcore
set cphMap[28]=Prison?Scenario_Prison_Checkpoint_Security?Mutators=Hardcore
set cphMap[29]=Prison?Scenario_Prison_Checkpoint_Insurgents?Mutators=Hardcore
set cphMap[30]=LastLight?Scenario_LastLight_Checkpoint_Security?Mutators=Hardcore
set cphMap[31]=LastLight?Scenario_LastLight_Checkpoint_Insurgents?Mutators=Hardcore
set cphMap[32]=TrainYard?Scenario_Trainyard_Checkpoint_Security?Mutators=Hardcore
set cphMap[33]=TrainYard?Scenario_Trainyard_Checkpoint_Insurgents?Mutators=Hardcore
set cphMap[34]=Forest?Scenario_Forest_Checkpoint_Security?Mutators=Hardcore
set cphMap[35]=Forest?Scenario_Forest_Checkpoint_Insurgents?Mutators=Hardcore
set cphMap[36]=Canyon?Scenario_Crossing_Checkpoint_Security?Mutators=Hardcore
set cphMap[37]=Canyon?Scenario_Crossing_Checkpoint_Insurgents?Mutators=Hardcore
::================== Outpost ============================
set outMap[0]=Town?Scenario_Hideout_Outpost
set outMap[1]=Precinct?Scenario_Precinct_Outpost
set outMap[2]=OiIPield?Scenario_Refinery_Outpost
set outMap[3]=Farmhouse?Scenario_Farmhouse_Outpost
set outMap[4]=Mountain?Scenario_Summit_Outpost
set outMap[5]=Citadel?Scenario_Citadel_Outpost
set outMap[6]=Bab?Scenario_Bab_Outpost
set outMap[7]=Gap?Scenario_Gap_Outpost
set outMap[8]=Sinjar?Scenario_Hillside_Outpost
set outMap[9]=Ministry?Scenario_Ministry_Outpost
set outMap[10]=Compound?Scenario_Outskirts_Outpost
set outMap[11]=PowerPlant?Scenario_PowerPlant_Outpost
set outMap[12]=Tell?Scenario_Tell_Outpost
set outMap[13]=Buhriz?Scenario_Tideway_Outpost
set outMap[14]=Prison?Scenario_Prison_Outpost
set outMap[15]=LastLight?Scenario_LastLight_Outpost
set outMap[16]=TrainYard?Scenario_Trainyard_Outpost
set outMap[17]=Forest?Scenario_Forest_Outpost
set outMap[18]=Canyon?Scenario_Crossing_Outpost
::================= Survival =======================
set srvMap[0]=Town?Scenario_Hideout_Survival
set srvMap[1]=Precinct?Scenario_Precinct_Survival
set srvMap[2]=OiIPield?Scenario_Refinery_Survival
set srvMap[3]=Farmhouse?Scenario_Farmhouse_Survival
set srvMap[4]=Mountain?Scenario_Summit_Survival
set srvMap[5]=Citadel?Scenario_Citadel_Survival
set srvMap[6]=Bab?Scenario_Bab_Survival
set srvMap[7]=Gap?Scenario_Gap_Survival
set srvMap[8]=Sinjar?Scenario_Hillside_Survival
set srvMap[9]=Ministry?Scenario_Ministry_Survival
set srvMap[10]=Compound?Scenario_Outskirts_Survival
set srvMap[11]=PowerPlant?Scenario_PowerPlant_Survival
set srvMap[12]=Tell?Scenario_Tell_Survival
set srvMap[13]=Buhriz?Scenario_Tideway_Survival
set srvMap[14]=Prison?Scenario_Prison_Survival
set srvMap[15]=LastLight?Scenario_LastLight_Survival
set srvMap[16]=TrainYard?Scenario_Trainyard_Survival
set srvMap[17]=Forest?Scenario_Forest_Survival
set srvMap[18]=Canyon?Scenario_Crossing_Survival
::===================== Frontline ==========================
set flMap[0]=Town?Scenario_Hideout_Frontline
set flMap[1]=Precinct?Scenario_Precinct_Frontline
set flMap[2]=OiIPield?Scenario_Refinery_Frontline
set flMap[3]=Farmhouse?Scenario_Farmhouse_Frontline
set flMap[4]=Mountain?Scenario_Summit_Frontline
set flMap[5]=Citadel?Scenario_Citadel_Frontline
set flMap[6]=Bab?Scenario_Bab_Frontline
set flMap[7]=Gap?Scenario_Gap_Frontline
set flMap[8]=Sinjar?Scenario_Hillside_Frontline
set flMap[9]=Ministry?Scenario_Ministry_Frontline
set flMap[10]=Compound?Scenario_Outskirts_Frontline
set flMap[11]=PowerPlant?Scenario_PowerPlant_Frontline
set flMap[12]=Tell?Scenario_Tell_Frontline
set flMap[13]=Buhriz?Scenario_Tideway_Frontline
set flMap[14]=Prison?Scenario_Prison_Frontline
set flMap[15]=LastLight?Scenario_LastLight_Frontline
set flMap[16]=TrainYard?Scenario_Trainyard_Frontline
set flMap[17]=Forest?Scenario_Forest_Frontline
set flMap[18]=Canyon?Scenario_Crossing_Frontline
::======================= Team Deathmatch ===========================
set tdmMap[0]=Town?Scenario_Hideout_Team_Deathmatch
set tdmMap[1]=Precinct?Scenario_Precinct_Team_Deathmatch
set tdmMap[2]=OiIPield?Scenario_Refinery_Team_Deathmatch
set tdmMap[3]=Farmhouse?Scenario_Farmhouse_Team_Deathmatch
set tdmMap[4]=Mountain?Scenario_Summit_Team_Deathmatch
set tdmMap[5]=Citadel?Scenario_Citadel_Team_Deathmatch
set tdmMap[6]=Bab?Scenario_Bab_Team_Deathmatch
set tdmMap[7]=Gap?Scenario_Gap_Team_Deathmatch
set tdmMap[8]=Sinjar?Scenario_Hillside_Team_Deathmatch
set tdmMap[9]=Ministry?Scenario_Ministry_Team_Deathmatch
set tdmMap[10]=Compound?Scenario_Outskirts_Team_Deathmatch
set tdmMap[11]=PowerPlant?Scenario_PowerPlant_Team_Deathmatch
set tdmMap[12]=Tell?Scenario_Tell_Team_Deathmatch
set tdmMap[13]=Buhriz?Scenario_Tideway_Team_Deathmatch
set tdmMap[14]=Prison?Scenario_Prison_Team_Deathmatch
set tdmMap[15]=LastLight?Scenario_LastLight_Team_Deathmatch
set tdmMap[16]=TrainYard?Scenario_Trainyard_Team_Deathmatch
set tdmMap[17]=Forest?Scenario_Forest_Team_Deathmatch
set tdmMap[18]=Canyon?Scenario_Crossing_Team_Deathmatch
::===================== Push ================================
set pMap[0]=Town?Scenario_Hideout_Push_Security
set pMap[1]=Town?Scenario_Hideout_Push_Insurgents
set pMap[2]=Precinct?Scenario_Precinct_Push_Security
set pMap[3]=Precinct?Scenario_Precinct_Push_Insurgents
set pMap[4]=OiIPield?Scenario_Refinery_Push_Security
set pMap[5]=OiIPield?Scenario_Refinery_Push_Insurgents
set pMap[6]=Farmhouse?Scenario_Farmhouse_Push_Security
set pMap[7]=Farmhouse?Scenario_Farmhouse_Push_Insurgents
set pMap[8]=Mountain?Scenario_Summit_Push_Security
set pMap[9]=Mountain?Scenario_Summit_Push_Insurgents
set pMap[10]=Citadel?Scenario_Citadel_Push_Security
set pMap[11]=Citadel?Scenario_Citadel_Push_Insurgents
set pMap[12]=Bab?Scenario_Bab_Push_Security
set pMap[13]=Bab?Scenario_Bab_Push_Insurgents
set pMap[14]=Gap?Scenario_Gap_Push_Security
set pMap[15]=Gap?Scenario_Gap_Push_Insurgents
set pMap[16]=Sinjar?Scenario_Push_Checkpoint_Security
set pMap[17]=Sinjar?Scenario_Push_Checkpoint_Insurgents
set pMap[18]=Ministry?Scenario_Push_Checkpoint_Security
set pMap[19]=Ministry?Scenario_Push_Checkpoint_Insurgents
set pMap[20]=Compound?Scenario_Push_Checkpoint_Security
set pMap[21]=Compound?Scenario_Push_Checkpoint_Insurgents
set pMap[22]=PowerPlant?Scenario_Push_Checkpoint_Security
set pMap[23]=PowerPlant?Scenario_Push_Checkpoint_Insurgents
set pMap[24]=Tell?Scenario_Tell_Push_Security
set pMap[25]=Tell?Scenario_Tell_Push_Insurgents
set pMap[26]=Buhriz?Scenario_Tideway_Push_Security
set pMap[27]=Buhriz?Scenario_Tideway_Push_Insurgents
set pMap[28]=Prison?Scenario_Prison_Push_Security
set pMap[29]=Prison?Scenario_Prison_Push_Insurgents
set pMap[30]=LastLight?Scenario_LastLight_Push_Security
set pMap[31]=LastLight?Scenario_LastLight_Push_Insurgents
set pMap[32]=TrainYard?Scenario_Trainyard_Push_Security
set pMap[33]=TrainYard?Scenario_Trainyard_Push_Insurgents
set pMap[34]=Forest?Scenario_Forest_Push_Security
set pMap[35]=Forest?Scenario_Forest_Push_Insurgents
set pMap[36]=Canyon?Scenario_Crossing_Push_Security
set pMap[37]=Canyon?Scenario_Crossing_Push_Insurgents

:Main
set Label=Main
cls
echo ========================================================================================================
echo =                       Insurgency Sandstorm Advanced Server Launcher 2.0                              =
echo ========================================================================================================
echo =                                List of useful commands                                               =
echo =         /load - Load server config ^| /save - Save server config ^| /motd - Create MOTD                =
echo =         /maps - Create map cycle   ^| /admins - Create admin list^| /auth - Set Steam/NWI tokens       =
echo =         /launch - Start your server^| /parse - Parses IP if your server keeps launching Range         =
echo ========================================================================================================
echo   Server Address: %svIP%
echo   Server Name: %svName%
echo   Max Players: %svMax%
echo   Server Cheats: %cheats% 
echo   Gamemode: %svGameMode%                                                                               
echo   Map/Team: %svMap%
call :IsTokenSet                     
echo ========================================================================================================
echo =    [1] Select Gamemode        [2] Select Team        [3] Select Map        [4] Server Settings       =
echo ========================================================================================================
echo.
set /p "opt= > "
if "%opt%"=="1" (
	call :GameMode )
if "%opt%"=="2" (
	call :Team )
if "%opt%"=="3" (
	call :Map )
if "%opt%"=="4" (
	call :GameSetup )
if /i "%opt%"=="/load" (
	call :ReadConfig )
if /i "%opt%"=="/save" (
	call :SaveConfig )
if /i "%opt%"=="/motd" (
	call :MOTD )
if /i "%opt%"=="/maps" (
	call :MapCycle )
if /i "%opt%"=="/admins" (
	call :Admins )
if /i "%opt%"=="/auth" (
	call :Authentication )
if /i "%opt%"=="/launch" (
	call :SetVars )
if /i "%opt%"=="/parse" (
	call :Parse )

call :Error

:: load configuration
:ReadConfig
if exist cfg.bat (
    echo.
    set /p load_cfg="Would you like to load your configuration file and start the server? (Y/n): "
) else goto Main

if /I "%load_cfg%"=="Y" (
    call cfg
    set "getGM=!sVar1!"
    set "getTM=!sVar2!"
    set "getMap=!sVar3!"
	set "IP=!IP!"
	set "MC=!MC!"
	set "MD=!MD!"
	set "TK=!TK!"
) else goto Main

:: if random map saved to config then randomize map, else go to map setup to assign previously selected map
if "!getMap!"=="1" (
    call :RandomMap
    call :SetVars
    goto Init
) else (
	call :MapSetup
	call :SetVars
	goto Main
)

:: gamemode selection
:GameMode
set Label=GameMode
echo.
echo [1] Checkpoint
echo [2] Hardcore Checkpoint
echo [3] Outpost
echo [4] Survival
echo [5] Frontline
echo [6] Team Deathmatch
echo [7] Push
echo.
set /p getGM=Select a Game Mode (1-7):
if %getGM% lss 1 call :Error
if %getGM% gtr 7 call :Error
if %getGM%==1 set svGameMode=Checkpoint
if %getGM%==2 set svGameMode=Checkpoint
if %getGM%==3 set svGameMode=Outpost
if %getGM%==4 set svGameMode=Survival
if %getGM%==5 set svGameMode=Frontline
if %getGM%==6 set svGameMode=TeamDeathmatch
if %getGM%==7 set svGameMode=Push
::call :Memory
if defined svMap goto MapSetup
goto Main

:: map selection
:Map
set Label=Map
echo.
echo [1] Random
echo [2] Hideout
echo [3] Precinct
echo [4] Refinery
echo [5] Farmhouse
echo [6] Summit
echo [7] Citadel
echo [8] Bab
echo [9] Gap
echo [10] Hillside
echo [11] Ministry
echo [12] Outskirts
echo [13] Power Plant
echo [14] Tell
echo [15] Tideway
echo [16] Prison
echo [17] Last Light
echo [18] Train Yard
echo [19] Forest
echo.
set /p getMap=Select a map (1-19):
if %getMap% gtr 19 call :Error
if %getMap% lss 1 call :Error
::call :Memory
if defined getTM call :Memory
goto MapSetup

:: team selection for modes that require it
if %getGM% EQU 1 (
    goto Team
)
if %getGM% EQU 2 (
    goto Team
)
if %getGM% EQU 7 (
    goto Team
)

:: default for other modes
set getTM=1
goto MapSetup

:Team
set getTM=1
set Label=Team
echo.
echo [1] Security
echo [2] Insurgents
echo.
set /p getTM=Select a team (1 or 2):
if %getTM% gtr 2 call :Error
if %getTM% lss 1 call :Error
if defined svMap goto MapSetup 
::call :Memory
goto Main

:MapSetup
:: determine array based on game mode
if %getGM%==1 set "arr=cpMap"
if %getGM%==2 set "arr=cphMap"
if %getGM%==3 set "arr=outMap"
if %getGM%==4 set "arr=srvMap"
if %getGM%==5 set "arr=flMap"
if %getGM%==6 set "arr=tdmMap"
if %getGM%==7 set "arr=pMap"

:: random map selected?
if %getMap%==1 (
    call :RandomMap
    goto Main
)

:: calculate index for specific map
set /A idx=%getMap%-2
if %idx% LSS 0 set /A idx=0

:: add team offset for modes that need it
if %getGM%==1 if defined getTM set /A idx=(idx*2)+(getTM-1)
if %getGM%==2 if defined getTM set /A idx=(idx*2)+(getTM-1)
if %getGM%==7 if defined getTM set /A idx=(idx*2)+(getTM-1)

:: assign map safely
set "svMap=!%arr%[%idx%]!"
if "!svMap!"=="" (
    echo Map assignment failed. Returning to map selection...
    echo [DEBUG] Array: !arr! Index: !idx!
    pause
    goto Main
)

goto Main


:RandomMap
:: make sure getTM is valid
if not defined getTM set getTM=1
if "%getTM%" NEQ "1" if "%getTM%" NEQ "2" set getTM=1

:: make sure getGM is valid
if not defined getGM set getGM=1

:: team-based modes
if "%getGM%"=="1" set "mapArray=cpMap" & set maxPairs=38 & goto RandomTeamMap
if "%getGM%"=="2" set "mapArray=cphMap" & set maxPairs=38 & goto RandomTeamMap
if "%getGM%"=="7" set "mapArray=pMap"  & set maxPairs=38 & goto RandomTeamMap

:: non-team-based modes
if "%getGM%"=="3" set "mapArray=outMap" & set maxPairs=19 & goto RandomSoloMap
if "%getGM%"=="4" set "mapArray=srvMap" & set maxPairs=19 & goto RandomSoloMap
if "%getGM%"=="5" set "mapArray=flMap"  & set maxPairs=19 & goto RandomSoloMap
if "%getGM%"=="6" set "mapArray=tdmMap" & set maxPairs=19 & goto RandomSoloMap

:: fallback in case something is wrong
echo [!] RandomMap: Unknown game mode, defaulting to Checkpoint. && ping localhost -n 2 >nul
set "mapArray=cpMap"
set maxPairs=19
goto RandomTeamMap

:RandomTeamMap
set /A pair=%RANDOM% %% %maxPairs%
set /A idx=(pair*2)+(getTM-1)
call set "svMap=%%%mapArray%[%idx%]%%"
goto RandomMapDone

:RandomSoloMap
set /A idx=%RANDOM% %% %maxPairs%
call set "svMap=%%%mapArray%[%idx%]%%"

:RandomMapDone
:: sanity check
if not defined svMap (
    echo [!] RandomMap failed to assign svMap, defaulting to first map. && ping localhost -n 2 >nul
    call set "svMap=%%%mapArray%[0]%%"
)

goto Main

:: assign server settings host ip/hostname/max players/tokens
:GameSetup
title Insurgency Sandstorm Advanced Server Launcher 2.0 ^| Server Settings
set Label=GameSetup
setlocal enabledelayedexpansion
echo.
echo Leave everything blank for default settings.
echo.
:: localhost 127.0.0.1 for strictly LAN
set /p svIP= Enter IPv4 Address (Default: %svIP%): 
set /p svName= Enter a name for your server: 
set /p svMax= Enter max player count (Max 32): 
if %svMax% gtr 32 call call :Error
if %svMax% lss 1 call :Error
set /p cheats= Enable Cheats? (0-1): 
if %cheats% gtr 1 call :Error
goto Main

:: save current server configuration
:SaveConfig
if not exist cfg.bat (
    set /p save_cfg=" Would you like to save these settings to a configuration file? (Y/n): "
    if /I "!save_cfg!"=="Y" (
        call :WriteConfig
    ) else exit /b
) else (
    set /p save_cfg=" Would you like to overwrite these settings in your configuration file? (Y/n): "
    if /I "!save_cfg!"=="Y" (
        call :WriteConfig
    ) else exit /b
)

:WriteConfig
(
    echo set svIP=!svIP!
    echo set svName=!svName!
    echo set svGameMode=!svGameMode!
    echo set svMap=!svMap!
    echo set svMax=!svMax!
    echo set cheats=!cheats!
    echo set token1=!token1!
    echo set token2=!token2!
	echo set ParseIP=!ParseIP!
    echo set sVar1=!getGM!
    echo set sVar2=!getTM!
    echo set sVar3=!getMap!
	echo set IP=!IP!
	echo set MC=!MC!
	echo set MD=!MD!
	echo set TK=!TK!
) > cfg.bat
goto Main

:MOTD
title Insurgency Sandstorm Advanced Server Launcher 2.0 ^| Create MOTD
set MD=1
echo.
echo File can be found here: %svConfig%
echo Enter "/done" when finished.
echo.

:DoMOTD
:: Ask if user wants to overwrite the file first
if exist "%svConfig%\Motd.txt" (
    set /p wmotd="MOTD exists. Overwrite? (Y/n): "
    if /i "%wmotd%"=="Y" del "%svConfig%\Motd.txt"
)

:: loop for multiple lines
:WriteMOTD
set /p "motdTXT=> "
if /i "%motdTXT%"=="/done" goto Main

:: trim spaces
for /f "tokens=* delims= " %%A in ("%motdTXT%") do set "motdTXT=%%A"

:: write line without trailing spaces
<nul set /p ="%motdTXT%" >> "%svConfig%\Motd.txt"

goto WriteMOTD

:Admins
title Insurgency Sandstorm Advanced Server Launcher 2.0 ^| Assign Admins
echo.
echo File can be found here: %svConfig%\Admins.txt
echo Enter "/done" when finished.
echo.

:DoAdmins
set /p sID64= Enter Valid SteamID64: 
if "%sID64%"=="/done" ( goto Main) else ( call :WriteAdmins )

:WriteAdmins
for /f "tokens=* delims= " %%A in ("%sID64%") do set "sID64=%%A"

:: write to file without adding space or newline
<nul set /p ="%sID64%" >> "%svConfig%\Admins.txt"
:: add newline manually
>> "%svConfig%\Admins.txt" echo.
call :DoAdmins

:MapCycle
if "%getGM%"=="1"  (set "arr=cpMap")
if "%getGM%"=="2"  (set "arr=cphMap")
if "%getGM%"=="7"  (set "arr=pMap")
if "%getGM%"=="3"  (set "arr=outMap")
if "%getGM%"=="4"  (set "arr=srvMap")
if "%getGM%"=="5" (set "arr=flMap")
if "%getGM%"=="6" (set "arr=tdmMap")

:MapCycle
set MC=1
echo. 
if not defined svGameMode echo Please select a gamemode first. && ping localhost -n 2 >nul && goto Main
set /p mcy=MapCycle.txt will be generated for %svGameMode%. Do you wish to continue? (Y/n): 
if /i %mcy%==Y ( call :DoMapCycle ) else ( goto Main )

:DoMapCycle
:: iterate all possible indexes; skip undefined
for /L %%I in (0,1,37) do (
  call set "rawMap=%%%arr%[%%I]%%%"
  if defined rawMap (
    :: trim everything before "Scenario"
    set "scene=!rawMap:*Scenario=Scenario!"

    echo !scene!>>"%svConfig%\MapCycle.txt"
    echo Added: !scene!
  )
  set "rawMap="
  set "scene="
)
echo File location: %svConfig%\MapCycle.txt
pause
goto Main

:Parse
if %IP%==1 call :NoParse
set IP=1
set "ParseIP=-MultiHome=%svIP%"
echo.
echo [^*] IP has been parsed.
ping localhost -n 2 >nul
goto Main

:NoParse
set IP=0
set "ParseIP="
echo.
echo [^*] IP is no longer parsed.
ping localhost -n 2 >nul
goto Main

:SetVars
:: variable conditions
setlocal EnableDelayedExpansion

set server=%svMap%?MaxPlayers=%svMax%?game=%svGameMode% -Port=27102 -QueryPort=27131 -log -hostname="%svName%"
set "launchCmd=%server%"

if "%MC%"=="1" (
    if exist "%svConfig%\MapCycle.txt" (
        set "launchCmd=!launchCmd! -MapCycle=MapCycle.txt"
    )
)

if "%MD%"=="1" (
    if exist "%svConfig%\Motd.txt" (
        set "launchCmd=!launchCmd! -motd"
    )
)

if "%IP%"=="1" (
    if defined ParseIP (
        set "launchCmd=!launchCmd! !ParseIP!"
    )
)

if "%TK%"=="1" (

    if "%valid1%"=="1" (
        set "launchCmd=!launchCmd! -GSLTToken=!token1!"
    )

    if "%valid2%"=="1" (
        set "launchCmd=!launchCmd! -GameStats -GameStatsToken=!token2!"
    )
)

echo.
echo !launchCmd!
echo.
set /p cmd=Is this correct? (Y/n): 
if /i %cmd%==Y ( call :Init ) else ( goto Main )


:Authentication
set Label=Authentication
set TK=1
echo.
echo Leave either field blank if you don't need/have a token for it. Make sure you're using valid tokens, 32 characters long.
echo.
set /p token1= Steam/GSLT Token: 
if "!token1:~0,32!"=="!token1!" if not defined token1:~32! set "valid1=1"
set /p token2= NWI Game Stats Token: 
if "!token2:~0,32!"=="!token2!" if not defined token2:~32! set "valid2=1"
echo.
echo [^*] Token(s) have been set. 
ping localhost -n 2 >nul
goto Main

:: experimental, probably not necessary
:Memory
set VarMem1=%getGM%
set VarMem2=%getTM%
set VarMem3=%getMap%
exit /b

:Error
echo.
echo [^^!] ERROR: Invalid entry. Please try again. && ping localhost -n 2 >nul && goto %Label%

:IsTokenSet
set "valid1=0"
set "valid2=0"

if defined token1 (
    if "!token1:~0,32!"=="!token1!" if not defined token1:~32! set "valid1=1"
)

if defined token2 (
    if "!token2:~0,32!"=="!token2!" if not defined token2:~32! set "valid2=1"
)
if !valid1!==0 if !valid2!==0 echo   Authentication: No Valid Tokens Set
if !valid1!==1 if !valid2!==1 echo   Authentication: Steam ^& NWI
if !valid1!==1 if !valid2!==0 echo   Authentication: Steam
if !valid1!==0 if !valid2!==1 echo   Authentication: NWI
exit /b

:Init
::call :SetVars
echo.
echo Launching server...
echo You may now close this window at anytime.
InsurgencyServer.exe %launchCmd%
