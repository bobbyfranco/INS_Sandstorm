@echo off

REM /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
:: Title: Insurgency Sandstorm Advanced Server Launcher
:: Author: Bobby Franco
:: Version: 2.0.5
:: Date: 11/28/2025
:: Description: Setup and launch self-hosted dedicated server.
REM /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

color 0a
title Insurgency Sandstorm Advanced Server Launcher 2.0 ^| Main Menu
:: enable delayed expansion for safe variable usage
setlocal enabledelayedexpansion

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

:: default settings for script functionality
set tod=0
set Lighting=Day
set "MutationList="
set svConfig=%cd%\Insurgency\Config\Server
for /F "tokens=14" %%i in ('"ipconfig | findstr IPv4"') do SET svIP=%%i
set svName=INS Server
set svMax=8
set cheats=0
set "token1="
set "token2="
set getTM=1
set getGM=1
set getMap=1
set IP=0
set BC=0
set MC=0
set MD=0
set TK=0
set MT=0
set PW=0
set MOD=0
if exist cfg.bat (
    set "HASCFG=1"
)
if not defined HASCFG goto Main
setlocal
call cfg.bat
if not defined AL (
    endlocal
    goto Main
)
endlocal & (
	call :ReadConfig
)
goto Main

REM // i only included a few gamemodes cause im lazy, but feel free to add more \\

:: map "arrays"
:: ======================== COOP ========================
:Checkpoint
set Map[0]=Town?Scenario=Scenario_Hideout_Checkpoint_Security
set Map[1]=Town?Scenario=Scenario_Hideout_Checkpoint_Insurgents
set Map[2]=Precinct?Scenario=Scenario_Precinct_Checkpoint_Security
set Map[3]=Precinct?Scenario=Scenario_Precinct_Checkpoint_Insurgents
set Map[4]=OilField?Scenario=Scenario_Refinery_Checkpoint_Security
set Map[5]=OilField?Scenario=Scenario_Refinery_Checkpoint_Insurgents
set Map[6]=Farmhouse?Scenario=Scenario_Farmhouse_Checkpoint_Security
set Map[7]=Farmhouse?Scenario=Scenario_Farmhouse_Checkpoint_Insurgents
set Map[8]=Mountain?Scenario=Scenario_Summit_Checkpoint_Security
set Map[9]=Mountain?Scenario=Scenario_Summit_Checkpoint_Insurgents
set Map[10]=Citadel?Scenario=Scenario_Citadel_Checkpoint_Security
set Map[11]=Citadel?Scenario=Scenario_Citadel_Checkpoint_Insurgents
set Map[12]=Bab?Scenario=Scenario_Bab_Checkpoint_Security
set Map[13]=Bab?Scenario=Scenario_Bab_Checkpoint_Insurgents
set Map[14]=Gap?Scenario=Scenario_Gap_Checkpoint_Security
set Map[15]=Gap?Scenario=Scenario_Gap_Checkpoint_Insurgents
set Map[16]=Sinjar?Scenario=Scenario_Hillside_Checkpoint_Security
set Map[17]=Sinjar?Scenario=Scenario_Hillside_Checkpoint_Insurgents
set Map[18]=Ministry?Scenario=Scenario_Ministry_Checkpoint_Security
set Map[19]=Ministry?Scenario=Scenario_Ministry_Checkpoint_Insurgents
set Map[20]=Compound?Scenario=Scenario_Outskirts_Checkpoint_Security
set Map[21]=Compound?Scenario=Scenario_Outskirts_Checkpoint_Insurgents
set Map[22]=PowerPlant?Scenario=Scenario_PowerPlant_Checkpoint_Security
set Map[23]=PowerPlant?Scenario=Scenario_PowerPlant_Checkpoint_Insurgents
set Map[24]=Tell?Scenario=Scenario_Tell_Checkpoint_Security
set Map[25]=Tell?Scenario=Scenario_Tell_Checkpoint_Insurgents
set Map[26]=Buhriz?Scenario=Scenario_Tideway_Checkpoint_Security
set Map[27]=Buhriz?Scenario=Scenario_Tideway_Checkpoint_Insurgents
set Map[28]=Prison?Scenario=Scenario_Prison_Checkpoint_Security
set Map[29]=Prison?Scenario=Scenario_Prison_Checkpoint_Insurgents
set Map[30]=LastLight?Scenario=Scenario_LastLight_Checkpoint_Security
set Map[31]=LastLight?Scenario=Scenario_LastLight_Checkpoint_Insurgents
set Map[32]=TrainYard?Scenario=Scenario_Trainyard_Checkpoint_Security
set Map[33]=TrainYard?Scenario=Scenario_Trainyard_Checkpoint_Insurgents
set Map[34]=Forest?Scenario=Scenario_Forest_Checkpoint_Security
set Map[35]=Forest?Scenario=Scenario_Forest_Checkpoint_Insurgents
set Map[36]=Canyon?Scenario=Scenario_Crossing_Checkpoint_Security
set Map[37]=Canyon?Scenario=Scenario_Crossing_Checkpoint_Insurgents
exit /b

:Outpost
set Map[0]=Town?Scenario=Scenario_Hideout_Outpost
set Map[1]=Precinct?Scenario=Scenario_Precinct_Outpost
set Map[2]=OilField?Scenario=Scenario_Refinery_Outpost
set Map[3]=Farmhouse?Scenario=Scenario_Farmhouse_Outpost
set Map[4]=Mountain?Scenario=Scenario_Summit_Outpost
set Map[5]=Citadel?Scenario=Scenario_Citadel_Outpost
set Map[6]=Bab?Scenario=Scenario_Bab_Outpost
set Map[7]=Gap?Scenario=Scenario_Gap_Outpost
set Map[8]=Sinjar?Scenario=Scenario_Hillside_Outpost
set Map[9]=Ministry?Scenario=Scenario_Ministry_Outpost
set Map[10]=Compound?Scenario=Scenario_Outskirts_Outpost
set Map[11]=PowerPlant?Scenario=Scenario_PowerPlant_Outpost
set Map[12]=Tell?Scenario=Scenario_Tell_Outpost
set Map[13]=Buhriz?Scenario=Scenario_Tideway_Outpost
set Map[14]=Prison?Scenario=Scenario_Prison_Outpost
set Map[15]=LastLight?Scenario=Scenario_LastLight_Outpost
set Map[16]=TrainYard?Scenario=Scenario_Trainyard_Outpost
set Map[17]=Forest?Scenario=Scenario_Forest_Outpost
set Map[18]=Canyon?Scenario=Scenario_Crossing_Outpost
exit /b

:Survival
set Map[0]=Town?Scenario=Scenario_Hideout_Survival
set Map[1]=Precinct?Scenario=Scenario_Precinct_Survival
set Map[2]=OilField?Scenario=Scenario_Refinery_Survival
set Map[3]=Farmhouse?Scenario=Scenario_Farmhouse_Survival
set Map[4]=Mountain?Scenario=Scenario_Summit_Survival
set Map[5]=Citadel?Scenario=Scenario_Citadel_Survival
set Map[6]=Bab?Scenario=Scenario_Bab_Survival
set Map[7]=Gap?Scenario=Scenario_Gap_Survival
set Map[8]=Sinjar?Scenario=Scenario_Hillside_Survival
set Map[9]=Ministry?Scenario=Scenario_Ministry_Survival
set Map[10]=Compound?Scenario=Scenario_Outskirts_Survival
set Map[11]=PowerPlant?Scenario=Scenario_PowerPlant_Survival
set Map[12]=Tell?Scenario=Scenario_Tell_Survival
set Map[13]=Buhriz?Scenario=Scenario_Tideway_Survival
set Map[14]=Prison?Scenario=Scenario_Prison_Survival
set Map[15]=LastLight?Scenario=Scenario_LastLight_Survival
set Map[16]=TrainYard?Scenario=Scenario_Trainyard_Survival
set Map[17]=Forest?Scenario=Scenario_Forest_Survival
set Map[18]=Canyon?Scenario=Scenario_Crossing_Survival
exit /b
:: ======================== VERSUS ========================
:Frontline
set Map[0]=Town?Scenario=Scenario_Hideout_Frontline
set Map[1]=Precinct?Scenario=Scenario_Precinct_Frontline
set Map[2]=OilField?Scenario=Scenario_Refinery_Frontline
set Map[3]=Farmhouse?Scenario=Scenario_Farmhouse_Frontline
set Map[4]=Mountain?Scenario=Scenario_Summit_Frontline
set Map[5]=Citadel?Scenario=Scenario_Citadel_Frontline
set Map[6]=Bab?Scenario=Scenario_Bab_Frontline
set Map[7]=Gap?Scenario=Scenario_Gap_Frontline
set Map[8]=Sinjar?Scenario=Scenario_Hillside_Frontline
set Map[9]=Ministry?Scenario=Scenario_Ministry_Frontline
set Map[10]=Compound?Scenario=Scenario_Outskirts_Frontline
set Map[11]=PowerPlant?Scenario=Scenario_PowerPlant_Frontline
set Map[12]=Tell?Scenario=Scenario_Tell_Frontline
set Map[13]=Buhriz?Scenario=Scenario_Tideway_Frontline
set Map[14]=Prison?Scenario=Scenario_Prison_Frontline
set Map[15]=LastLight?Scenario=Scenario_LastLight_Frontline
set Map[16]=TrainYard?Scenario=Scenario_Trainyard_Frontline
set Map[17]=Forest?Scenario=Scenario_Forest_Frontline
set Map[18]=Canyon?Scenario=Scenario_Crossing_Frontline
exit /b

:TDM
set Map[0]=Town?Scenario=Scenario_Hideout_Team_Deathmatch
set Map[1]=Precinct?Scenario=Scenario_Precinct_Team_Deathmatch
set Map[2]=OilField?Scenario=Scenario_Refinery_Team_Deathmatch
set Map[3]=Farmhouse?Scenario=Scenario_Farmhouse_Team_Deathmatch
set Map[4]=Mountain?Scenario=Scenario_Summit_Team_Deathmatch
set Map[5]=Citadel?Scenario=Scenario_Citadel_TDM_Small
set Map[6]=Gap?Scenario=Scenario_Gap_TDM
set Map[7]=Ministry?Scenario=Scenario_Ministry_Team_Deathmatch
set Map[8]=Compound?Scenario=Scenario_Outskirts_Team_Deathmatch
set Map[9]=Prison?Scenario=Scenario_Prison_TDM
set Map[10]=LastLight?Scenario=Scenario_LastLight_TDM
set Map[11]=Forest?Scenario=Scenario_Forest_TDM
set Map[12]=Canyon?Scenario=Scenario_Crossing_Team_Deathmatch
exit /b

:Push
set Map[0]=Town?Scenario=Scenario_Hideout_Push_Security
set Map[1]=Town?Scenario=Scenario_Hideout_Push_Insurgents
set Map[2]=Precinct?Scenario=Scenario_Precinct_Push_Security
set Map[3]=Precinct?Scenario=Scenario_Precinct_Push_Insurgents
set Map[4]=OilField?Scenario=Scenario_Refinery_Push_Security
set Map[5]=OilField?Scenario=Scenario_Refinery_Push_Insurgents
set Map[6]=Farmhouse?Scenario=Scenario_Farmhouse_Push_Security
set Map[7]=Farmhouse?Scenario=Scenario_Farmhouse_Push_Insurgents
set Map[8]=Mountain?Scenario=Scenario_Summit_Push_Security
set Map[9]=Mountain?Scenario=Scenario_Summit_Push_Insurgents
set Map[10]=Citadel?Scenario=Scenario_Citadel_Push_Security
set Map[11]=Citadel?Scenario=Scenario_Citadel_Push_Insurgents
set Map[12]=Bab?Scenario=Scenario_Bab_Push_Security
set Map[13]=Bab?Scenario=Scenario_Bab_Push_Insurgents
set Map[14]=Gap?Scenario=Scenario_Gap_Push_Security
set Map[15]=Gap?Scenario=Scenario_Gap_Push_Insurgents
set Map[16]=Sinjar?Scenario=Scenario_Push_Checkpoint_Security
set Map[17]=Sinjar?Scenario=Scenario_Push_Checkpoint_Insurgents
set Map[18]=Ministry?Scenario=Scenario_Push_Checkpoint_Security
set Map[19]=Ministry?Scenario=Scenario_Push_Checkpoint_Insurgents
set Map[20]=Compound?Scenario=Scenario_Push_Checkpoint_Security
set Map[21]=Compound?Scenario=Scenario_Push_Checkpoint_Insurgents
set Map[22]=PowerPlant?Scenario=Scenario_Push_Checkpoint_Security
set Map[23]=PowerPlant?Scenario=Scenario_Push_Checkpoint_Insurgents
set Map[24]=Tell?Scenario=Scenario_Tell_Push_Security
set Map[25]=Tell?Scenario=Scenario_Tell_Push_Insurgents
set Map[26]=Buhriz?Scenario=Scenario_Tideway_Push_Security
set Map[27]=Buhriz?Scenario=Scenario_Tideway_Push_Insurgents
set Map[28]=Prison?Scenario=Scenario_Prison_Push_Security
set Map[29]=Prison?Scenario=Scenario_Prison_Push_Insurgents
set Map[30]=LastLight?Scenario=Scenario_LastLight_Push_Security
set Map[31]=LastLight?Scenario=Scenario_LastLight_Push_Insurgents
set Map[32]=TrainYard?Scenario=Scenario_Trainyard_Push_Security
set Map[33]=TrainYard?Scenario=Scenario_Trainyard_Push_Insurgents
set Map[34]=Forest?Scenario=Scenario_Forest_Push_Security
set Map[35]=Forest?Scenario=Scenario_Forest_Push_Insurgents
set Map[36]=Canyon?Scenario=Scenario_Crossing_Push_Security
set Map[37]=Canyon?Scenario=Scenario_Crossing_Push_Insurgents
exit /b

:Ambush
set Map[0]=Town?Scenario=Scenario_Hideout_Ambush
set Map[1]=Town?Scenario=Scenario_Hideout_Ambush_East
set Map[2]=Precinct?Scenario=Scenario_Precinct_Ambush
set Map[3]=Precinct?Scenario=Scenario_Precinct_Ambush_East
set Map[4]=OilField?Scenario=Scenario_Refinery_Ambush
set Map[5]=Farmhouse?Scenario=Scenario_Farmhouse_Ambush
set Map[6]=Mountain?Scenario=Scenario_Summit_Ambush_East
set Map[7]=Mountain?Scenario=Scenario_Summit_Ambush_West
set Map[8]=Citadel?Scenario=Scenario_Citadel_Ambush
set Map[9]=Bab?Scenario=Scenario_Bab_Ambush
set Map[10]=Gap?Scenario=Scenario_Gap_Ambush
set Map[11]=Sinjar?Scenario=Scenario_Hillside_Ambush
set Map[12]=Ministry?Scenario=Scenario_Ministry_Ambush
set Map[13]=Compound?Scenario=Scenario_Outskirts_Ambush
set Map[14]=Compound?Scenario=Scenario_Outskirts_Ambush_East
set Map[15]=PowerPlant?Scenario=Scenario_PowerPlant_Ambush
set Map[16]=Tell?Scenario=Scenario_Tell_Ambush_East
set Map[17]=Tell?Scenario=Scenario_Tell_Ambush_West
set Map[18]=Buhriz?Scenario=Scenario_Tideway_Ambush
set Map[19]=Prison?Scenario=Scenario_Prison_Ambush
set Map[20]=LastLight?Scenario=Scenario_LastLight_Ambush
set Map[21]=TrainYard?Scenario=Scenario_TrainYard_Ambush_East
set Map[22]=TrainYard?Scenario=Scenario_TrainYard_Ambush_West
set Map[23]=Forest?Scenario=Scenario_Forest_Ambush
set Map[24]=Canyon?Scenario=Scenario_Crossing_Ambush
exit /b

:Defusal
set Map[0]=Town?Scenario=Scenario_Hideout_Defusal
set Map[1]=Precinct?Scenario=Scenario_Precinct_Defusal
set Map[2]=OilField?Scenario=Scenario_Refinery_Defusal
set Map[3]=FarmHouse?Scenario=Scenario_Farmhouse_Defusal
set Map[4]=Mountain?Scenario=Scenario_Summit_Defusal
set Map[5]=Citadel?Scenario=Scenario_Citadel_Defusal
set Map[6]=Bab?Scenario=Scenario_Bab_Defusal
set Map[7]=Gap?Scenario=Scenario_Gap_Defusal
set Map[8]=Sinjar?Scenario=Scenario_Hillside_Defusal
set Map[9]=Ministry?Scenario=Scenario_Ministry_Defusal
set Map[10]=Compound?Scenario=Scenario_Outskirts_Defusal
set Map[11]=PowerPlant?Scenario=Scenario_PowerPlant_Defusal
set Map[12]=Tell?Scenario=Scenario_Tell_Defusal
set Map[13]=Buhriz?Scenario=Scenario_Tideway_Defusal
set Map[14]=Prison?Scenario=Scenario_Prison_Defusal
set Map[15]=LastLight?Scenario=Scenario_LastLight_Defusal
set Map[16]=TrainYard?Scenario=Scenario_TrainYard_Defusal_East
set Map[17]=TrainYard?Scenario=Scenario_TrainYard_Defusal_West
set Map[18]=Forest?Scenario=Scenario_Forest_Defusal
set Map[19]=Canyon?Scenario=Scenario_Crossing_Defusal
exit /b

:Domination
set Map[0]=Town?Scenario=Scenario_Hideout_Domination
set Map[1]=Precinct?Scenario=Scenario_Precinct_Domination_East
set Map[2]=Precinct?Scenario=Scenario_Precinct_Domination_West
set Map[3]=OilField?Scenario=Scenario_Refinery_Domination
set Map[4]=Farmhouse?Scenario=Scenario_Farmhouse_Domination
set Map[5]=Mountain?Scenario=Scenario_Summit_Domination
set Map[6]=Citadel?Scenario=Scenario_Citadel_Domination
set Map[7]=Bab?Scenario=Scenario_Bab_Domination
set Map[8]=Gap?Scenario=Scenario_Gap_Domination_East
set Map[9]=Gap?Scenario=Scenario_Gap_Domination_West
set Map[10]=Sinjar?Scenario=Scenario_Hillside_Domination
set Map[11]=Ministry?Scenario=Scenario_Ministry_Domination
set Map[12]=Compound?Scenario=Scenario_Outskirts_Domination
set Map[13]=PowerPlant?Scenario=Scenario_PowerPlant_Domination
set Map[14]=Tell?Scenario=Scenario_Tell_Domination_East
set Map[15]=Tell?Scenario=Scenario_Tell_Domination_West
set Map[16]=Buhriz?Scenario=Scenario_Tideway_Domination
set Map[17]=Prison?Scenario=Scenario_Prison_Domination
set Map[18]=LastLight?Scenario=Scenario_LastLight_Domination
set Map[19]=TrainYard?Scenario=Scenario_TrainYard_Domination_East
set Map[20]=TrainYard?Scenario=Scenario_TrainYard_Domination_West
set Map[21]=Forest?Scenario=Scenario_Forest_Domination
set Map[22]=Canyon?Scenario=Scenario_Crossing_Domination
exit /b

:FFA
set Map[0]=Precinct?Scenario=Scenario_Precinct_FFA
set Map[1]=PowerPlant?Scenario=Scenario_PowerPlant_FFA
set Map[2]=Tell?Scenario=Scenario_Tell_FFA
set Map[3]=Prison?Scenario=Scenario_Prison_FFA
set Map[4]=Forest?Scenario=Scenario_Forest_FFA
set Map[5]=Canyon?Scenario=Scenario_Crossing_FFA
exit /b

:Firefight
set Map[0]=Town?Scenario=Scenario_Hideout_Firefight_East
set Map[1]=Town?Scenario=Scenario_Hideout_Firefight_West
set Map[2]=Precinct?Scenario=Scenario_Precinct_Firefight_East
set Map[3]=Precinct?Scenario=Scenario_Precinct_Firefight_West
set Map[4]=OilField?Scenario=Scenario_Refinery_Firefight_West
set Map[5]=Farmhouse?Scenario=Scenario_Farmhouse_Firefight_East
set Map[6]=Farmhouse?Scenario=Scenario_Farmhouse_Firefight_West
set Map[7]=Mountain?Scenario=Scenario_Summit_Firefight_East
set Map[8]=Mountain?Scenario=Scenario_Summit_Firefight_West
set Map[9]=Citadel?Scenario=Scenario_Citadel_Firefight
set Map[10]=Bab?Scenario=Scenario_Bab_Firefight_East
set Map[11]=Gap?Scenario=Scenario_Gap_Firefight
set Map[12]=Gap?Scenario=Scenario_Gap_Firefight_West
set Map[13]=Sinjar?Scenario=Scenario_Hillside_Firefight_East
set Map[14]=Sinjar?Scenario=Scenario_Hillside_Firefight_West
set Map[15]=Ministry?Scenario=Scenario_Ministry_Firefight_A
set Map[16]=Compound?Scenario=Scenario_Outskirts_Firefight_East
set Map[17]=Compound?Scenario=Scenario_Outskirts_Firefight_West
set Map[18]=PowerPlant?Scenario=Scenario_PowerPlant_Firefight_East
set Map[19]=PowerPlant?Scenario=Scenario_PowerPlant_Firefight_West
set Map[20]=Tell?Scenario=Scenario_Tell_Firefight_East
set Map[21]=Tell?Scenario=Scenario_Tell_Firefight_West
set Map[22]=Buhriz?Scenario=Scenario_Tideway_Firefight_West
set Map[23]=Prison?Scenario=Scenario_Prison_Firefight
set Map[24]=LastLight?Scenario=Scenario_LastLight_Firefight
set Map[25]=TrainYard?Scenario=Scenario_TrainYard_Firefight_East
set Map[26]=TrainYard?Scenario=Scenario_TrainYard_Firefight_West
set Map[27]=Forest?Scenario=Scenario_Forest_Firefight_East
set Map[28]=Forest?Scenario=Scenario_Forest_Firefight_West
set Map[29]=Canyon?Scenario=Scenario_Crossing_Firefight_West
exit /b

:Skirmish
set Map[0]=Town?Scenario=Scenario_Hideout_Skirmish
set Map[1]=Precinct?Scenario=Scenario_Precinct_Skirmish
set Map[2]=OilField?Scenario=Scenario_Refinery_Skirmish
set Map[3]=Farmhouse?Scenario=Scenario_Farmhouse_Skirmish
set Map[4]=Mountain?Scenario=Scenario_Summit_Skirmish
set Map[5]=Ministry?Scenario=Scenario_Ministry_Skirmish
set Map[6]=PowerPlant?Scenario=Scenario_PowerPlant_Skirmish
set Map[7]=Prison?Scenario=Scenario_Prison_Skirmish
set Map[8]=LastLight?Scenario=Scenario_LastLight_Skirmish
set Map[9]=Canyon?Scenario=Scenario_Crossing_Skirmish
exit /b

:Main
set Label=Main
:: extract map name from svMap if it's defined
set "MapName="
if defined svMap (
:: get everything after the ? character
    set "tempMap=!svMap!"
    for /f "tokens=2 delims=?" %%c in ("!tempMap!") do (
:: now we have Scenario=Scenario_MapName_GameMode_Team
        set "tempScenario=%%c"
    )
:: remove "Scenario=" prefix
    set "tempScenario=!tempScenario:Scenario=!"
:: extract the 2nd token (map name) using underscore delimiter
    for /f "tokens=2 delims=_" %%d in ("!tempScenario!") do (
        set "MapName=%%d"
    )
)

cls
echo ========================================================================================================
echo =                       Insurgency Sandstorm Advanced Server Launcher 2.0                              =
echo ========================================================================================================
echo =               == General ==              == Other ==                    == Generate ==               =
echo =         /s - Start your server   ^| /t - Toggle day/night    ^| /motd - Add/generate MOTD              =
echo =         /ld - Load server config ^| /p - Add server password ^| /ad - Add/generate admin list          =
echo =         /sv - Save server config ^| /mut - Add mutators      ^| /mc - Add/generate map cycle           =
echo =         /auth - Steam/NWI tokens ^| /mh - Adds MultiHome cmd ^| /mod - Add/generate Mods.txt           =
echo =         /al - Toggle auto-launch ^| /bc - Broadcast IP       ^| /h - General help info                 =
echo ========================================================================================================
echo   Server Name: %svName%
if not defined svPass (echo   Server Address: %svIP%				Password: No Password) else (echo   Server Address: %svIP%				Password: %svPass%			)
echo   Max Players: %svMax%					IP Parse: %IP% ^| IP Broadcast: %BC%
echo   Server Cheats: %cheats%					MOTD: %MD%	      Mods: %MOD%
if %getGM%==2 (echo   Gamemode: Hardcore Checkpoint) else if not defined svGameMode (echo   Gamemode: No Gamemode Selected) else (echo   Gamemode: %svGameMode%)
if not defined svMap (
	echo   Map/Team: No Map Selected
) else (
:: always show map name and team for modes that require team selection
    if %getGM%==1 (
        if %getTM%==1 (
            echo   Map/Team: !MapName! ^- Security ^(!Lighting!^)
        ) else if %getTM%==2 (
            echo   Map/Team: !MapName! ^- Insurgents ^(!Lighting!^)
        )
    ) else if %getGM%==2 (
        if %getTM%==1 (
            echo   Map/Team: !MapName! ^- Security ^(!Lighting!^)
        ) else if %getTM%==2 (
            echo   Map/Team: !MapName! ^- Insurgents ^(!Lighting!^)
        )
    ) else if %getGM%==7 (
        if %getTM%==1 (
            echo   Map/Team: !MapName! ^- Security ^(!Lighting!^)
        ) else if %getTM%==2 (
            echo   Map/Team: !MapName! ^- Insurgents ^(!Lighting!^)
        )
    ) else (
        echo   Map/Team: !MapName! ^(!Lighting!^)
    )
)
if not defined FinalMutator (echo   Mutators: No Mutators Selected) else (echo   Mutators: %FinalMutator%)
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
if /i "%opt%"=="/ld" (
	call :ReadConfig )
if /i "%opt%"=="/sv" (
	call :SaveConfig )
if /i "%opt%"=="/motd" (
	call :MOTD )
if /i "%opt%"=="/mc" (
	call :MapCycle )
if /i "%opt%"=="/ad" (
	call :Admins )
if /i "%opt%"=="/auth" (
	call :Authentication )
if /i "%opt%"=="/t" (
	call :TOD )
if /i "%opt%"=="/mut" (
	call :Mutators )
if /i "%opt%"=="/p" (
	call :Password )
if /i "%opt%"=="/s" (
	call :SetVars )
if /i "%opt%"=="/mh" (
	call :Parse )
if /i "%opt%"=="/mod" (
	call :Mods )
if /i "%opt%"=="/al" (
	call :AutoLaunch)
if /i "%opt%"=="/h" (
	call :Help)
if /i "%opt%"=="/bc" (
	call :Broadcast)

call :Error

:: load configuration
:ReadConfig
if exist cfg.bat (
    call cfg
	set LOADED=1
    set "getGM=!getGM!"
    set "getTM=!getTM!"
    set "getMap=!getMap!"
	set "IP=!IP!"
	set "BC=!BC!"
	set "MC=!MC!"
	set "MD=!MD!"
	set "TK=!TK!"
	set "MT=!MT!"
	set "PW=!PW!"
	set "MOD=!MOD!"
	set FinalMutator=!FinalMutator!
	set "svPass=!svPass!"
	if defined AL call :MapSetup
	echo.
	echo [^*] Configuration loaded^!
	timeout /t 1 >nul
	call :MapSetup
) else (
	echo.
	echo [^!] ERROR: No configuratio file found.
	timeout /t 1 >nul
	goto Main
)

:: gamemode selection
:GameMode
set Label=GameMode
echo.
echo Enter "X" to cancel.
echo.
echo ===== COOP =====				===== VERSUS =====				===== SPECIAL =====
echo [1] Checkpoint					[5] Frontline					[14] Tutorial
echo [2] Hardcore Checkpoint				[6] Team Deathmatch				[15] Range
echo [3] Outpost					[7] Push					[16] Interception
echo [4] Survival					[8] Ambush
echo							[9] Defusal
echo							[10] Domination
echo							[11] Free For All
echo							[12] Firefight
echo							[13] Skirmish
set /p getGM=Select a Game Mode (1-16): 
:SetMode
if /i "%getGM%"=="X" set getGM=1 && goto Main
if %getGM%==1 set svGameMode=Checkpoint
if %getGM%==2 set svGameMode=Checkpoint
if %getGM%==3 set svGameMode=Outpost
if %getGM%==4 set svGameMode=Survival
if %getGM%==5 set svGameMode=Frontline
if %getGM%==6 set svGameMode=TeamDeathmatch
if %getGM%==7 set svGameMode=Push
if %getGM%==8 set svGameMode=Ambush
if %getGM%==9 set svGameMode=Defusal
if %getGM%==10 set svGameMode=Domination
if %getGM%==11 set svGameMode=FFA
if %getGM%==12 set svGameMode=Firefight
if %getGM%==13 set svGameMode=Skirmish
if %getGM%==14 set svGameMode=Tutorial&& set svMap=Town?Scenario=Scenario_Hideout_Tutorial&& goto Main
if %getGM%==15 set svGameMode=Range&& set svMap=Farmhouse?Scenario=Scenario_Farmhouse_Range&& goto Main
if %getGM%==16 set svGameMode=Interception&& set svMap=Forest?Scenario=Scenario_Forest_Interception&& goto Main
if defined svMap (call :MapSetup) else (call :RandomMap)
call :Error

:Map
set Label=Map
if not defined svGameMode (
	echo.
	echo [^^!] No gamemode selected.
	timeout /t 1 >nul
	goto Main
)
if "%getGM%"=="14" (echo. && echo [^!] Incompatible gamemode selected. && timeout /t 1 >nul && goto Main)
if "%getGM%"=="15" (echo. && echo [^!] Incompatible gamemode selected. && timeout /t 1 >nul && goto Main)
if "%getGM%"=="16" (echo. && echo [^!] Incompatible gamemode selected. && timeout /t 1 >nul && goto Main)
cls
call :ClearMapArrays
if %getGM%==1 call :Checkpoint
if %getGM%==2 call :Checkpoint
if %getGM%==3 call :Outpost
if %getGM%==4 call :Survival
if %getGM%==5 call :Frontline
if %getGM%==6 call :TDM
if %getGM%==7 call :Push
if %getGM%==8 call :Ambush
if %getGM%==9 call :Defusal
if %getGM%==10 call :Domination
if %getGM%==11 call :FFA
if %getGM%==12 call :Firefight
if %getGM%==13 call :Skirmish

if %getTM%==1 (set i=0) else (set i=1)
set mIDX=0
:LoopMaps
if defined Map[!i!] (
    for /f "tokens=2 delims=?" %%a in ("!Map[%i%]!") do (
        set "fullScenario=%%a"
        
        REM Extract map name from Scenario_MapName_GameMode format
        for /f "tokens=2 delims=_" %%b in ("!fullScenario!") do (
			if !getGM!==1 (
				if !getTM!==1 (echo [!mIDX!] %%b Security) else (echo [!mIDX!] %%b Insurgents)
			) else if !getGM!==2 (
				if !getTM!==1 (echo [!mIDX!] %%b Security) else (echo [!mIDX!] %%b Insurgents)
			) else if !getGM!==7 (
				if !getTM!==1 (echo [!mIDX!] %%b Security) else (echo [!mIDX!] %%b Insurgents)
			) else (
				echo [!mIDX!] %%b
			)
            set "MapIndex[!mIDX!]=!i!"
        )
    )
    
    REM increment by 2 for team-based modes, by 1 for others
    if %getGM%==1 (set /a i+=2) else if %getGM%==2 (set /a i+=2) else if %getGM%==7 (set /a i+=2) else (set /a i+=1)
    
    set /a mIDX+=1
    goto LoopMaps
)
set /a maxMaps=mIDX-1
echo.
echo [R] Random
echo [X] Cancel
echo.
set /p getMap=Select a map: 
if /i "%getMap%"=="X" set getMap=1 && goto Main

:: validate selection
if /i "%getMap%"=="R" (
    call :RandomMap
    goto Main
)

if %getMap% gtr %maxMaps% call :Error
if %getMap% lss 0 call :Error

:: use the mapping array to get actual index
set /a actualIdx=!MapIndex[%getMap%]!
set "svMap=!Map[%actualIdx%]!"

:: store the base map index (divided by 2 for team-based modes)
if %getGM%==1 set /a baseMapIdx=actualIdx/2
if %getGM%==2 set /a baseMapIdx=actualIdx/2
if %getGM%==7 set /a baseMapIdx=actualIdx/2

if "!svMap!"=="" (
    echo Map assignment failed. Assigning random map...
    timeout /t 1 >nul
    call :RandomMap
)

if defined getTM call :Memory
goto Main

:Team
set getTM=1
set Label=Team
echo.
echo Enter "X" to cancel.
echo.
echo [1] Security
echo [2] Insurgents
echo.
set /p getTM=Select a team (1 or 2): 
if /i "%getTM%"=="X" set getTM=1 && goto Main
if %getTM% gtr 2 call :Error
if %getTM% lss 1 call :Error
:SetTeam
if %getTM%==1 set /a n1+=2-!(n1%%2)
if %getTM%==2 set /a n1+=1-!(n1%%2)

:: if a map is already selected and it's a team-based mode, swap to the other team's version
if defined svMap (
    if %getGM%==1 call :SwapTeamMap
    if %getGM%==2 call :SwapTeamMap
    if %getGM%==7 call :SwapTeamMap
)

goto Main

:SwapTeamMap
:: reload the map arrays
call :ClearMapArrays
if %getGM%==1 call :Checkpoint
if %getGM%==2 call :Checkpoint
if %getGM%==7 call :Push

:: calculate new index from base map index and new team
if defined baseMapIdx (
:: use stored base index - recalculate the array index for new team
    set /a teamOffset=%getTM%-1
    set /a doubleBase=%baseMapIdx%*2
    set /a newIdx=!doubleBase!+!teamOffset!
    goto ApplyNewMap
)

:: fallback: find current map in array and toggle team
set i=0
:FindCurrentMap2
if not defined Map[%i%] goto MapNotFound
set "currentMap=!Map[%i%]!"
if "%currentMap%"=="%svMap%" (
    set /a isEven=i%%2
    if !isEven!==0 (
        set /a newIdx=i+1
    ) else (
        set /a newIdx=i-1
    )
    goto ApplyNewMap
)
set /a i+=1
goto FindCurrentMap2

:MapNotFound
:: map wasn't found - just exit without changing anything
echo Map not found, returning with no changes.
time /t 2 >nul
exit /b

:ApplyNewMap
:: get the new map value
for /f "tokens=*" %%m in ("!Map[%newIdx%]!") do set "svMap=%%m"
exit /b

:MapSetup
if %getGM%==1 call :Checkpoint
if %getGM%==2 call :Checkpoint
if %getGM%==3 call :Outpost
if %getGM%==4 call :Survival
if %getGM%==5 call :Frontline
if %getGM%==6 call :TDM
if %getGM%==7 call :Push
if %getGM%==8 call :Ambush
if %getGM%==9 call :Defusal
if %getGM%==10 call :Domination
if %getGM%==11 call :FFA
if %getGM%==12 call :Firefight
if %getGM%==13 call :Skirmish

:: random map selected?
if /i "%getMap%"=="R" (
    call :RandomMap
    goto Main
)

if defined AL (
	call :SetVars
)

:: if no map selected yet, go back to main
if not defined getMap goto :RandomMap

:: calculate index for specific map
set /a idx=%getMap%
if %idx% lss 0 set /a idx=0

:: No team offset needed - getMap is already the correct array index from :Map conversion

:: assign map
set "svMap=!Map[%idx%]!"
if "!svMap!"=="" (
    echo Map assignment failed. Assigning random map...
    timeout /t 1 >nul
    call :RandomMap
)

goto Main

:ClearMapArrays
for /F "tokens=1 delims==" %%A in ('set Map[') do set "%%A="
exit /b

:RandomMap
set /a n1=%RANDOM% %% 38
set /a n2=%RANDOM% %% 19
set /a n3=%RANDOM% %% 13
set /a n4=%RANDOM% %% 25
set /a n5=%RANDOM% %% 20
set /a n6=%RANDOM% %% 23
set /a n7=%RANDOM% %% 6
set /a n8=%RANDOM% %% 30
set /a n9=%RANDOM% %% 10
if %getTM%==1 set /a n1+=2-!(n1%%2)
if %getTM%==2 set /a n1+=1-!(n1%%2)

if defined AL (
	call :SetVars
)

:: make sure getTM is valid
if not defined getTM (
	set getTM=1
	call :SetTeam
	)

if "%getTM%" neq "1" if "%getTM%" neq "2" (
	set getTM=1
	call :SetTeam
	)

:: make sure getGM is valid
if not defined getGM (
	set getGM=1
	call :SetMode
	)

if %getGM%==1 (
	call :Checkpoint
	set svMap=!Map[%n1%]!
	set /a baseMapIdx=n1/2
	)
if %getGM%==2 (
	call :Checkpoint
	set svMap=!Map[%n1%]!
	set /a baseMapIdx=n1/2
	)
if %getGM%==3 (
	call :Outpost
	set svMap=!Map[%n2%]!
	)
if %getGM%==4 (
	call :Survival
	set svMap=!Map[%n2%]!
	)
if %getGM%==5 (
	call :Frontline
	set svMap=!Map[%n2%]!
	)
if %getGM%==6 (
	call :TDM
	set svMap=!Map[%n3%]!
	)
if %getGM%==7 (
	call :Push
	set svMap=!Map[%n1%]!
	set /a baseMapIdx=n1/2
	)
	
if %getGM%==8 (
	call :Ambush
	set svMap=!Map[%n4%]!
	)

if %getGM%==9 (
	call :Defusal
	set svMap=!Map[%n5%]!
	)
	
if %getGM%==10 (
	call :Domination
	set svMap=!Map[%n6%]!
	)
	
if %getGM%==11 (
	call :FFA
	set svMap=!Map[%n7%]!
	)
	
if %getGM%==12 (
	call :Firefight
	set svMap=!Map[%n8%]!
	)
	
if %getGM%==13 (
	call :Skirmish
	set svMap=!Map[%n9%]!
	)
	
if "!svMap!"=="" (
    call :RandomMap
)

goto Main

:: assign server settings host ip/hostname/max players/tokens
:GameSetup
title Insurgency Sandstorm Advanced Server Launcher 2.0 ^| Server Settings
set Label=GameSetup
echo.
echo Leave everything blank for default settings.
echo Enter "X" to cancel.
echo.
:: localhost 127.0.0.1 for strictly LAN
set /p svIP= Enter IPv4 Address (Default: %svIP%): 
if /i "%svIP%"=="X" set svIP=%%i && goto Main
set /p svName= Enter a name for your server: 
if /i "%svName%"=="X" set "svName=INS Server" && goto Main
set /p svMax= Enter max player count (Max 32): 
if /i "%svMax%"=="X" set svMax=8 && goto Main
if %svMax% gtr 32 call call :Error
if %svMax% lss 1 call :Error
set /p cheats= Enable Cheats? (0-1): 
if /i "%cheats%"=="X" set cheats=0 && goto Main
if %cheats% gtr 1 call :Error
if %cheats% lss 0 call :Error
goto Main

:: save current server configuration
:SaveConfig
if not exist cfg.bat (
       call :WriteConfig
	   echo.
	   echo [^*] Configuration saved^!
    ) else (
	echo.
    set /p save_cfg=" Would you like to overwrite these settings in your configuration file? (Y/n): "
    if /i "!save_cfg!"=="Y" (
        call :WriteConfig
    ) else goto Main
)

:WriteConfig
(
    echo set svIP=!svIP!
    echo set svName=!svName!
    echo set svGameMode=!svGameMode!
    echo set svMap=!svMap!
	echo set Lighting=%Lighting%
    echo set svMax=!svMax!
    echo set cheats=!cheats!
    echo set token1=!token1!
    echo set token2=!token2!
	echo set ParseIP=!ParseIP!
    echo set getGM=!getGM!
    echo set getTM=!getTM!
    echo set getMap=!getMap!
	echo set IP=!IP!
	echo set BC=!BC!
	echo set MC=!MC!
	echo set MD=!MD!
	echo set TK=!TK!
	echo set MT=!MT!
	echo set PW=!PW!
	echo set MOD=!MOD!
	echo set FinalMutator=!FinalMutator!
	echo set svPass=!svPass!
	echo :: leave AL blank to disable auto-launch manually
	echo set AL=%AL%
) > cfg.bat
goto Main

:MOTD
title Insurgency Sandstorm Advanced Server Launcher 2.0 ^| Create MOTD
if %MD%==1 (
	set MD=0
	echo.
	echo [^*] MOTD has been removed from launch command.
	timeout /t 1 >nul
)
set MD=1
echo.
echo File can be found here: %svConfig%
echo.
echo Enter "X" when finished.
echo.

:DoMOTD
:: ask if user wants to overwrite the file first
if exist "%svConfig%\Motd.txt" (
    set /p wmotd="MOTD exists. Overwrite? (Y/n): "
    if /i "%wmotd%"=="Y" del "%svConfig%\Motd.txt"
)

:: loop for multiple lines
:WriteMOTD
set /p "motdTXT=> "
if /i "%motdTXT%"=="X" goto Main

:: trim spaces
for /f "tokens=* delims= " %%A in ("%motdTXT%") do set "motdTXT=%%A"

:: write line without trailing spaces
<nul set /p ="%motdTXT%" >> "%svConfig%\Motd.txt"

goto WriteMOTD

:Admins
title Insurgency Sandstorm Advanced Server Launcher 2.0 ^| Assign Admins
echo.
echo File can be found here: %svConfig%\Admins.txt
echo.
echo Enter "X" when finished.
echo.

:DoAdmins
set /p sID64= Enter Valid SteamID64: 
if /i "%sID64%"=="X" ( goto Main) else ( call :WriteAdmins )

:WriteAdmins
for /f "tokens=* delims= " %%A in ("%sID64%") do set "sID64=%%A"

:: write to file without adding space or newline
<nul set /p ="%sID64%" >> "%svConfig%\Admins.txt"
:: add newline manually
>> "%svConfig%\Admins.txt" echo.
call :DoAdmins

:MapCycle
set MC=1
if "%getGM%"=="1"  (call :Checkpoint)
if "%getGM%"=="2"  (call :Checkpoint)
if "%getGM%"=="7"  (call :Push)
if "%getGM%"=="3"  (call :Outpost)
if "%getGM%"=="4"  (call :Survival)
if "%getGM%"=="5" (call :Frontline)
if "%getGM%"=="6" (call :TDM)
if "%getGM%"=="8"  (call :Ambush)
if "%getGM%"=="9"  (call :Defusal)
if "%getGM%"=="10"  (call :Domination)
if "%getGM%"=="11"  (call :FFA)
if "%getGM%"=="12"  (call :Firefight)
if "%getGM%"=="13" (call :Skirmish)

echo. 
if not defined svGameMode echo Please select a gamemode first. && timeout /t 1 >nul && goto Main
set /p "mcy=MapCycle.txt will be generated for %svGameMode%. Do you wish to continue? (Y/n): "
set /p "mcyn=Would you like to include night maps? (Y/n): "
if /i "%mcy%"=="N" goto Main 
if exist "%svConfig%\MapCycle.txt" (
    set /p "omcy=A map cycle already exists. Do you wish to overwrite it? (Y/n): "
    if /i "%omcy%"=="Y" (
        del X "%svConfig%\MapCycle.txt" ::doesn't work for some stupid fucking reason so we do it again under :DoMapCycle
    ) else (
        call :DoMapCycle
    )
)

:DoMapCycle
if /i "%omcy%"=="Y" del "%svConfig%\MapCycle.txt"
if %getGM%==1 set int=0,1,37
if %getGM%==2 set int=0,1,37
if %getGM%==7 set int=0,1,37
if %getGM%==3 set int=0,1,18
if %getGM%==4 set int=0,1,18
if %getGM%==5 set int=0,1,18
if %getGM%==6 set int=0,1,12
if %getGM%==8 set int=0,1,24
if %getGM%==9 set int=0,1,19
if %getGM%==10 set int=0,1,22
if %getGM%==11 set int=0,1,5
if %getGM%==12 set int=0,1,29
if %getGM%==13 set int=0,1,9

:: iterate all possible indexes; skip undefined
for /L %%I in (%int%) do (
    set "rawMap=!Map[%%I]!"
    if defined rawMap (
        :: extract everything after ?Scenario=
        for /f "tokens=2 delims==" %%A in ("!rawMap!") do set "scene=%%A"
        >>"%svConfig%\MapCycle.txt" echo((Scenario="!scene!",Lighting="Day"^)
        echo Added: !scene!
		
		:: if user wants night maps, also write the night version
        if /i "%mcyn%"=="Y" (
            >>"%svConfig%\MapCycle.txt" echo((Scenario="!scene!",Lighting="Night"^)
            echo Added: !scene!_Night
        )
    )
    set "rawMap="
    set "scene="
)
echo.
echo File location: %svConfig%\MapCycle.txt
pause
goto Main

:Parse
if %IP%==1 (
	set IP=0
	set "ParseIP="
	echo.
	echo [^*] IP is no longer parsed.
	timeout /t 1 >nul
	goto Main
) else (
	set IP=1
	set "ParseIP=-MultiHome=%svIP%"
	echo.
	echo [^*] IP has been parsed.
	timeout /t 1 >nul
	goto Main
)

:Broadcast
if %BC%==1 (
	set BC=0
	set "BroadcastIP="
	echo.
	echo [^*] IP broadcast disabled.
	timeout /t 1 >nul
	goto Main
) else (
	set BC=1
	set "BroadcastIP=-broadcastip=%svIP%"
	echo.
	echo [^*] IP broadcast enabled.
	timeout /t 1 >nul
	goto Main
)

:AutoLaunch
if defined AL (
	set "AL="
	echo.
	echo [^*] Auto-Launch disabled.
	timeout /t 1 >nul
	goto Main
) else (
	set AL=1
	echo.
	echo [^*] Auto-Launch enabled.
	timeout /t 1 >nul
	goto Main
)

:: determine variable conditions
:SetVars
set server=%svMap%?MaxPlayers=%svMax%?Lighting=%Lighting%?Game=%svGameMode% -Port=27102 -QueryPort=27131 -log -hostname="%svName%"
set "launchCmd=%server%"

call :IsTokenSet >nul

set "AllMutators="

if "%getGM%"=="2" (
    set "AllMutators=Hardcore"
)

if "%MT%"=="1" if defined FinalMutator (
    if defined AllMutators (
        set "AllMutators=%AllMutators%,%FinalMutator%"
    ) else (
        set "AllMutators=%FinalMutator%"
    )
)

if defined AllMutators (
    set "launchCmd=!launchCmd! -mutators=%AllMutators%"
)


if "%PW%"=="1" (
	if defined svPass (
		set "launchCmd=!launchCmd! -password=%svPass%"
	)
)

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

if "%BC%"=="1" (
    if defined BroadcastIP (
        set "launchCmd=!launchCmd! !BroadcastIP!"
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

if "%MOD%"=="1" (
	if exist "%svConfig%\Mods.txt" (
		set "launchCmd=!launchCmd! -Mods -ModDownloadTravelTo=%svMap%"
	)
)

if defined AL (
	echo !launchCmd!
	echo.
	set /p "AL=Continue with auto-launch? (Y/n): "
	if /i "!AL!"=="Y" (call :Init) else (goto Main)
)

if not defined LOADED (
	echo.
	echo !launchCmd!
	echo.
	set /p "doLaunch=Continue? (Y/n): "
	if /i "!doLaunch!"=="Y" (call :Init) else (goto Main)
) else (
	echo.
	echo !launchCmd!
	call :Init
)
:TOD
if %Lighting%==Day (
	set Lighting=Night
	echo.
	echo [^*] Lighting set to night.
	timeout /t 1 >nul) else (
		set Lighting=Day
		echo.
		echo [^*] Lighting set to Day.
		timeout /t 1 >nul)
goto Main

:Mutators
set Label=Mutators
:: define mutators
set "Mut1=AllYouCanEat"
set "Mut2=AntiMaterielRiflesOnly"
set "Mut3=BoltActionsOnly"
set "Mut4=Broke"
set "Mut5=BulletSponge"
set "Mut6=Competitive"
set "Mut7=CompetitiveLoadouts"
set "Mut8=FastMovement"
set "Mut9=Frenzy"
set "Mut10=Guerrillas"
set "Mut11=Hardcore"
set "Mut12=HeadshotOnly"
set "Mut13=HotPotato"
set "Mut14=LockedAim"
set "Mut15=NoAim"
set "Mut16=PistolsOnly"
set "Mut17=ShotgunsOnly"
set "Mut18=SlowCaptureTimes"
set "Mut19=SlowMovement"
set "Mut20=SoldierOfFortune"
set "Mut21=SpecialOperations"
set "Mut22=Strapped"
set "Mut23=Ultralethal"
set "Mut24=Vampirism"
set "Mut25=Warlords"
set "Mut26=ISMCarmory_Legacy"
set "Mut27=ISMC_Casual"
set "Mut28=ISMC_Hardcore"
set "Mut29=ISMC_Karmacore"
set "Mut30=ISMCHighReady"
set "Mut31=ISMCHardcoreMovement"
set "Mut32=ISMCHardcoreMovementNHR"
set "Mut33=ISMCKarmacoreMovement"
set "Mut34=ISMCKarmacoreMovementNHR"
set "Mut35=ISMCJumpShoot"
set "Mut36=ISMCGunfighter"
set "Mut37=ISMCGunfighter_Tac"
set "Mut38=ISMCGunfighter_Legacy"
set "Mut39=ISMCGunfighter_Tac_Legacy"
set "Mut40=TacticalMovement"
set "Mut41=TacticalMovementHC"
set "Mut42=CasualMovement"
set "Mut43=CasualMovementHC"
set "Mut44=OldSchoolMovement"
set "Mut45=90sMovement"
set "Mut46=ModernMovement"
set "Mut47=HCMovement"
set "Mut48=CasualMovementMW"
set "Mut49=TacticalHealth"
set "Mut50=CasualHealth"
set "Mut51=OldSchoolHealth"
set "Mut52=AdvancedObjectives"
set "Mut53=SuppliedObjectives"
set "Mut54=DisableFS"
set "Mut55=NoRestrictedAreas"
set "Mut56=EventMessenger"
set "Mut57=WelcomeMessage"
set "Mut58=FPLegsPlus"
set "Mut59=MoreAmmo"
set "Mut60=Reloads"
set "Mut61=HealthRegen"
set "Mut62=MapVoteLabels"
set "Mut63=CoopHUD"
set "Mut64=ImprovedAI"
set "Mut65=ImprovedAI_2"
set "Mut66=ImprovedAI_3"
set "Mut67=ImprovedAI_4"

:PickMutator
echo.
echo ===== VANILLA =====				===== ISMC MOD =====			===== ISMC 2 MOD =====
echo [0] Remove All Mutators				[26] ISMCarmory_Legacy			[36] ISMCGunfighter
echo [1] AllYouCanEat				[27] ISMC_Casual			[37] ISMCGunfighter_Tac
echo [2] AntiMaterielRiflesOnly			[28] ISMC_Hardcore			[38] ISMCGunfighter_Legacy
echo [3] BoltActionsOnly				[29] ISMC_Karmacore			[39] ISMCGunfighter_Tac_Legacy
echo [4] Broke					[30] ISMCHightReady			[40] TacticalMovement
echo [5] BulletSponge				[31] ISMCHardcoreMovement		[41] TacticalMovementHC
echo [6] Competitive					[32] ISMCHardcoreMovementNHR		[42] CasualMovement
echo [7] CompetitiveLoadouts				[33] ISMCKarmacoreMovement		[43 CasualMovementHC
echo [8] FastMovement				[34] ISMCKarmacoreMovementNHR		[44] OldSchoolMovement
echo [9] Frenzy					[35] ISMCJumpShoot			[45] 90sMovement
echo [10] Guerrillas										[46] ModernMovement
echo [11] Hardcore					===== OTHER MODS =====			[47] HCMovement
echo [12] HeadshotOnly				[55] NoRestrictedAreas			[48] CasualMovementMW
echo [13] HotPotato					[56] EventMessenger			[49] TacticalHealth
echo [14] LockedAim					[57] WelcomeMessage			[50] CasualHealth
echo [15] NoAim					[58] FPLegsPlus				[51] OldSchoolHealth
echo [16] PistolsOnly				[59] MoreAmmo				[52] AdvancedObjectives
echo [17] ShotgunsOnly				[60] Reloads				[53] SuppliedObjectives
echo [18] SlowCaptureTimes				[61] HealthRegen			[54] DisableFS
echo [19] SlowMovement				[62] MapVoteLabels
echo [20] SoldierOfFortune				[63] CoopHUD
echo [21] SpecialOperations				[64] ImprovedAI
echo [22] Strapped					[65] ImprovedAI_2
echo [23] Ultralethal				[66] ImprovedAI_3
echo [24] Vampirism					[67] ImprovedAI_4
echo [25] Warlords
echo.
set /p opt=Select a mutator (0-67 or X to finish)^: 

if /i "%opt%"=="X" goto DoneMutators
if /i "%opt%"=="0" (
	set "FinalMutator="
	echo.
	echo All mutators have been removed.
	timeout /t 1 >nul
	goto Mutators
)

:: validate numeric input
for /f "delims=0123456789" %%A in ("%opt%") do (
    call :Error
    goto PickMutator
)

if %opt% lss 0 if %opt% gtr 67 (
    call :Error
    pause>nul
    goto PickMutator
)

:: fetch the Mut[#] into chosen mutator using call expansion
call set ChosenMutator=%%Mut%opt%%%
if "%ChosenMutator%"=="" (
    echo Selection invalid or unmapped. Try again.
    pause>nul
    goto PickMutator
)

:: append to list (comma separated)
if defined MutationList (
    set MutationList=%MutationList%,%ChosenMutator%
) else (
    set MutationList=%ChosenMutator%
)

echo Added: %ChosenMutator%
timeout /t 1 >nul
goto PickMutator

:DoneMutators
set MT=1
endlocal & set "FinalMutator=%MutationList%"
echo.
echo Finished. FinalMutator^: 
if not defined FinalMutator (
	goto Main
) else (
echo %FinalMutator%
timeout /t 1 >nul
goto Main
)

:Password
if %PW%==1 (
	set PW=0
	set "svPass="
	echo.
	echo [^*] Server password removed.
	timeout /t 1 >nul
)
echo.
echo Enter "X" to cancel.
echo.
set /p "svPass=Enter a password to join your server: "
if /i "%svPass%"=="X" (
	set PW=0
	set "svPass="
	goto Main
) else (
	set PW=1
	echo.
	echo [^*] Server password has been set to: %svPass%
	echo.
	pause
	goto Main
)
exit /b

:Mods
if %MOD%==1 (
	set MOD=0
	echo.
	echo Mods removed from launch command.
	timeout /t 1 >nul
	goto Main
)

if exist "%svConfig%\Mods.txt" (
	set MOD=1
	echo.
	echo Mods are now included in launch command.
	timeout /t 1 >nul
	goto Main
) else (
	echo.
	echo Could not find Mods.txt in server config folder.
	echo.
	set /p "mkmod=Would you like to create one? (Y/n): "
	if /i "!mkmod!"=="Y" (call :MakeMod) else (goto Main)
	timeout /t 1 >nul
)

:MakeMod
title Insurgency Sandstorm Advanced Server Launcher 2.0 ^| Create Mods.txt
echo.
echo File can be found here: %svConfig%\Mods.txt
echo.
echo Enter "X" when finished.
echo.

:DoMods
set /p modID= Enter Valid Mod ID: 
if /i "%modID%"=="X" ( goto Main) else ( call :WriteMods )

:WriteMods
for /f "tokens=* delims= " %%A in ("%modID%") do set "modID=%%A"

:: write to file without adding space or newline
<nul set /p ="%modID%" >> "%svConfig%\Mods.txt"
:: add newline manually
>> "%svConfig%\Mods.txt" echo.
call :DoMods

:Authentication
set Label=Authentication
set TK=1
echo.
echo Leave either field blank if you don't need/have a token for it. Make sure you're using valid tokens, 32 characters long.
echo.
echo Enter "X" to cancel.
echo.
set /p token1= Steam/GSLT Token: 
if /i "!token1:~0,32!"=="!token1!" if not defined token1:~32! set "valid1=1"
if "%token1%"=="X" set "token1=" && goto Main
set /p token2= NWI Game Stats Token: 
if "!token2:~0,32!"=="!token2!" if not defined token2:~32! set "valid2=1"
if /i "%token2%"=="X" set "token2=" && goto Main
echo.
echo [^*] Token(s) have been set. 
timeout /t 1 >nul
goto Main

:: necessary for changing out teams, gamemodes and/or maps
:Memory
set VarMem1=%getGM%
set VarMem2=%getTM%
set VarMem3=%getMap%
exit /b

:Help
cls
echo ==================================
echo = [1] Server Admin Guide         =
echo = [2] Official Video Guide       =
echo = [3] Steam Server Token         =
echo = [4] NWI GameStats Token        =
echo = [5] Server Not Loading Mods    =
echo = [6] Server Launches Range      =
echo = [7] Map Vote/Cycle Not Working =
echo = [8] Exit Help                  =
echo ==================================
echo.
set /p hopt=^> 
if "%hopt%"=="1" start "" "https://mod.io/g/insurgencysandstorm/r/server-admin-guide" && goto Help
if "%hopt%"=="2" start "" "https://www.youtube.com/watch?v=zeVC99ZqqTg" && goto Help
if "%hopt%"=="3" start "" "https://steamcommunity.com/dev/managegameservers" && goto Help
if "%hopt%"=="4" start "" "https://gamestats.sandstorm.game/auth/login" && goto Help
if "%hopt%"=="5" goto HelpMods
if "%hopt%"=="6" goto HelpRange
if "%hopt%"=="7" goto HelpMap
if "%hopt%"=="8" goto Main

:HelpMods
echo.
echo If your server keeps launching vanilla (base game) then you need to be sure you have ModIO OAuth Access token and user information in your Engine.ini. Here's an example:
echo.
echo [/Script/ModKit.ModIOClient]
echo bHasUserAcceptedTerms=True
echo AccessToken=YOUR ACCESS TOKEN
echo AccessExpiryTime=SOME RANDOM NUMBERS
echo bCachedUserDetails=True
echo ;The code below should auto-generate after server/game launch
echo CachedUser=(ID=your modio id,NameId="your modio name id",Username="your modio username",DateOnline=random numbers,Avatar=(Thumb_50x50="link to your pfp",Thumb_100x100="large scal link to your pfp",Filename="your pfp filename",Original="another link to your pfp"),Timezone="blank",Language="blank",ProfileUrl="link to your modio profile")
echo.
echo If this is already set, be sure you have "-Mods -ModDownloadTravelTo=MAP?YOUR_DESIRED_SCENARIO_HERE"
echo in your launch command. Also, try subscribing to the mods on ModIO and linking your Steam account.
echo.
pause
goto Help

:HelpRange
echo.
echo Try adding "-MultiHome=YOUR.IP.ADDRESS.HERE" to your launch command manually or by using the "/mh" command in launcher.
echo.
pause
goto Help

:HelpMap
echo.
echo Make sure you have correctly added "-MapCycle=MapCycle.txt" in to your launch command.
echo.
echo If that checks out then be sure you have the following code in your Game.ini:
echo.
echo ;Use this if you want to vote for next map after each round
echo bMapVoting=True
echo ;Use this if you want to load the next map in your MapCycle.txt
echo bUseMapCycle=False
echo.
echo Lastly, make sure you're using valid syntax in your MapCycle.txt. Here is an example:
echo (Scenario="Scenario_Hideout_Checkpoint_Security",Lighting="Day")
echo (Scenario="Scenario_Hideout_Checkpoint_Security",Lighting="Night")
echo.
pause
goto Help

:Error
echo.
echo [^^!] ERROR: Invalid entry. Please try again. && timeout /t 1 >nul && goto %Label%

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
echo.
echo Launching server...
echo You may now close this window at anytime.
InsurgencyServer.exe %launchCmd%
