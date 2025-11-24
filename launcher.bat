REM // This is a fairly comprehensive server launcher for Insurgency Sandstorm scripted by Bobby Franco. Feel free to edit how you see fit, but know that the code is very fragile, so be sure you know what you're doing. \\

@echo off
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

:: default settings for script funcationality
set tod=0
set Lighting=Day
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
set MC=0
set MD=0
set TK=0
set MT=0
set PW=0
set MOD=0
goto Main

REM // i only included a few gamemodes cause im lazy, but feel free to add more \\

:: map "arrays"
:: ======================== COOP  ========================
:Checkpoint
set Map[0]=Town?Scenario_Hideout_Checkpoint_Security
set Map[1]=Town?Scenario_Hideout_Checkpoint_Insurgents
set Map[2]=Precinct?Scenario_Precinct_Checkpoint_Security
set Map[3]=Precinct?Scenario_Precinct_Checkpoint_Insurgents
set Map[4]=OilField?Scenario_Refinery_Checkpoint_Security
set Map[5]=OilField?Scenario_Refinery_Checkpoint_Insurgents
set Map[6]=Farmhouse?Scenario_Farmhouse_Checkpoint_Security
set Map[7]=Farmhouse?Scenario_Farmhouse_Checkpoint_Insurgents
set Map[8]=Mountain?Scenario_Summit_Checkpoint_Security
set Map[9]=Mountain?Scenario_Summit_Checkpoint_Insurgents
set Map[10]=Citadel?Scenario_Citadel_Checkpoint_Security
set Map[11]=Citadel?Scenario_Citadel_Checkpoint_Insurgents
set Map[12]=Bab?Scenario_Bab_Checkpoint_Security
set Map[13]=Bab?Scenario_Bab_Checkpoint_Insurgents
set Map[14]=Gap?Scenario_Gap_Checkpoint_Security
set Map[15]=Gap?Scenario_Gap_Checkpoint_Insurgents
set Map[16]=Sinjar?Scenario_Hillside_Checkpoint_Security
set Map[17]=Sinjar?Scenario_Hillside_Checkpoint_Insurgents
set Map[18]=Ministry?Scenario_Ministry_Checkpoint_Security
set Map[19]=Ministry?Scenario_Ministry_Checkpoint_Insurgents
set Map[20]=Compound?Scenario_Outskirts_Checkpoint_Security
set Map[21]=Compound?Scenario_Outskirts_Checkpoint_Insurgents
set Map[22]=PowerPlant?Scenario_PowerPlant_Checkpoint_Security
set Map[23]=PowerPlant?Scenario_PowerPlant_Checkpoint_Insurgents
set Map[24]=Tell?Scenario_Tell_Checkpoint_Security
set Map[25]=Tell?Scenario_Tell_Checkpoint_Insurgents
set Map[26]=Buhriz?Scenario_Tideway_Checkpoint_Security
set Map[27]=Buhriz?Scenario_Tideway_Checkpoint_Insurgents
set Map[28]=Prison?Scenario_Prison_Checkpoint_Security
set Map[29]=Prison?Scenario_Prison_Checkpoint_Insurgents
set Map[30]=LastLight?Scenario_LastLight_Checkpoint_Security
set Map[31]=LastLight?Scenario_LastLight_Checkpoint_Insurgents
set Map[32]=TrainYard?Scenario_Trainyard_Checkpoint_Security
set Map[33]=TrainYard?Scenario_Trainyard_Checkpoint_Insurgents
set Map[34]=Forest?Scenario_Forest_Checkpoint_Security
set Map[35]=Forest?Scenario_Forest_Checkpoint_Insurgents
set Map[36]=Canyon?Scenario_Crossing_Checkpoint_Security
set Map[37]=Canyon?Scenario_Crossing_Checkpoint_Insurgents
exit /b

:Hardcore
set Map[0]=Town?Scenario_Hideout_Checkpoint_Security
set Map[1]=Town?Scenario_Hideout_Checkpoint_Insurgents
set Map[2]=Precinct?Scenario_Precinct_Checkpoint_Security
set Map[3]=Precinct?Scenario_Precinct_Checkpoint_Insurgents
set Map[4]=OilField?Scenario_Refinery_Checkpoint_Security
set Map[5]=OilField?Scenario_Refinery_Checkpoint_Insurgents
set Map[6]=Farmhouse?Scenario_Farmhouse_Checkpoint_Security
set Map[7]=Farmhouse?Scenario_Farmhouse_Checkpoint_Insurgents
set Map[8]=Mountain?Scenario_Summit_Checkpoint_Security
set Map[9]=Mountain?Scenario_Summit_Checkpoint_Insurgents
set Map[10]=Citadel?Scenario_Citadel_Checkpoint_Security
set Map[11]=Citadel?Scenario_Citadel_Checkpoint_Insurgents
set Map[12]=Bab?Scenario_Bab_Checkpoint_Security
set Map[13]=Bab?Scenario_Bab_Checkpoint_Insurgents
set Map[14]=Gap?Scenario_Gap_Checkpoint_Security
set Map[15]=Gap?Scenario_Gap_Checkpoint_Insurgents
set Map[16]=Sinjar?Scenario_Hillside_Checkpoint_Security
set Map[17]=Sinjar?Scenario_Hillside_Checkpoint_Insurgents
set Map[18]=Ministry?Scenario_Ministry_Checkpoint_Security
set Map[19]=Ministry?Scenario_Ministry_Checkpoint_Insurgents
set Map[20]=Compound?Scenario_Outskirts_Checkpoint_Security
set Map[21]=Compound?Scenario_Outskirts_Checkpoint_Insurgents
set Map[22]=PowerPlant?Scenario_PowerPlant_Checkpoint_Security
set Map[23]=PowerPlant?Scenario_PowerPlant_Checkpoint_Insurgents
set Map[24]=Tell?Scenario_Tell_Checkpoint_Security
set Map[25]=Tell?Scenario_Tell_Checkpoint_Insurgents
set Map[26]=Buhriz?Scenario_Tideway_Checkpoint_Security
set Map[27]=Buhriz?Scenario_Tideway_Checkpoint_Insurgents
set Map[28]=Prison?Scenario_Prison_Checkpoint_Security
set Map[29]=Prison?Scenario_Prison_Checkpoint_Insurgents
set Map[30]=LastLight?Scenario_LastLight_Checkpoint_Security
set Map[31]=LastLight?Scenario_LastLight_Checkpoint_Insurgents
set Map[32]=TrainYard?Scenario_Trainyard_Checkpoint_Security
set Map[33]=TrainYard?Scenario_Trainyard_Checkpoint_Insurgents
set Map[34]=Forest?Scenario_Forest_Checkpoint_Security
set Map[35]=Forest?Scenario_Forest_Checkpoint_Insurgents
set Map[36]=Canyon?Scenario_Crossing_Checkpoint_Security
set Map[37]=Canyon?Scenario_Crossing_Checkpoint_Insurgents
exit /b

:Outpost
set Map[0]=Town?Scenario_Hideout_Outpost
set Map[1]=Precinct?Scenario_Precinct_Outpost
set Map[2]=OilField?Scenario_Refinery_Outpost
set Map[3]=Farmhouse?Scenario_Farmhouse_Outpost
set Map[4]=Mountain?Scenario_Summit_Outpost
set Map[5]=Citadel?Scenario_Citadel_Outpost
set Map[6]=Bab?Scenario_Bab_Outpost
set Map[7]=Gap?Scenario_Gap_Outpost
set Map[8]=Sinjar?Scenario_Hillside_Outpost
set Map[9]=Ministry?Scenario_Ministry_Outpost
set Map[10]=Compound?Scenario_Outskirts_Outpost
set Map[11]=PowerPlant?Scenario_PowerPlant_Outpost
set Map[12]=Tell?Scenario_Tell_Outpost
set Map[13]=Buhriz?Scenario_Tideway_Outpost
set Map[14]=Prison?Scenario_Prison_Outpost
set Map[15]=LastLight?Scenario_LastLight_Outpost
set Map[16]=TrainYard?Scenario_Trainyard_Outpost
set Map[17]=Forest?Scenario_Forest_Outpost
set Map[18]=Canyon?Scenario_Crossing_Outpost
exit /b

:Survival
set Map[0]=Town?Scenario_Hideout_Survival
set Map[1]=Precinct?Scenario_Precinct_Survival
set Map[2]=OilField?Scenario_Refinery_Survival
set Map[3]=Farmhouse?Scenario_Farmhouse_Survival
set Map[4]=Mountain?Scenario_Summit_Survival
set Map[5]=Citadel?Scenario_Citadel_Survival
set Map[6]=Bab?Scenario_Bab_Survival
set Map[7]=Gap?Scenario_Gap_Survival
set Map[8]=Sinjar?Scenario_Hillside_Survival
set Map[9]=Ministry?Scenario_Ministry_Survival
set Map[10]=Compound?Scenario_Outskirts_Survival
set Map[11]=PowerPlant?Scenario_PowerPlant_Survival
set Map[12]=Tell?Scenario_Tell_Survival
set Map[13]=Buhriz?Scenario_Tideway_Survival
set Map[14]=Prison?Scenario_Prison_Survival
set Map[15]=LastLight?Scenario_LastLight_Survival
set Map[16]=TrainYard?Scenario_Trainyard_Survival
set Map[17]=Forest?Scenario_Forest_Survival
set Map[18]=Canyon?Scenario_Crossing_Survival
exit /b
:: ======================== VERSUS  ========================
:Frontline
set Map[0]=Town?Scenario_Hideout_Frontline
set Map[1]=Precinct?Scenario_Precinct_Frontline
set Map[2]=OilField?Scenario_Refinery_Frontline
set Map[3]=Farmhouse?Scenario_Farmhouse_Frontline
set Map[4]=Mountain?Scenario_Summit_Frontline
set Map[5]=Citadel?Scenario_Citadel_Frontline
set Map[6]=Bab?Scenario_Bab_Frontline
set Map[7]=Gap?Scenario_Gap_Frontline
set Map[8]=Sinjar?Scenario_Hillside_Frontline
set Map[9]=Ministry?Scenario_Ministry_Frontline
set Map[10]=Compound?Scenario_Outskirts_Frontline
set Map[11]=PowerPlant?Scenario_PowerPlant_Frontline
set Map[12]=Tell?Scenario_Tell_Frontline
set Map[13]=Buhriz?Scenario_Tideway_Frontline
set Map[14]=Prison?Scenario_Prison_Frontline
set Map[15]=LastLight?Scenario_LastLight_Frontline
set Map[16]=TrainYard?Scenario_Trainyard_Frontline
set Map[17]=Forest?Scenario_Forest_Frontline
set Map[18]=Canyon?Scenario_Crossing_Frontline
exit /b

:TDM
set Map[0]=Town?Scenario_Hideout_Team_Deathmatch
set Map[1]=Precinct?Scenario_Precinct_Team_Deathmatch
set Map[2]=OilField?Scenario_Refinery_Team_Deathmatch
set Map[3]=Farmhouse?Scenario_Farmhouse_Team_Deathmatch
set Map[4]=Mountain?Scenario_Summit_Team_Deathmatch
set Map[5]=Citadel?Scenario_Citadel_TDM_Small
set Map[6]=Gap?Scenario_Gap_TDM
set Map[7]=Ministry?Scenario_Ministry_Team_Deathmatch
set Map[8]=Compound?Scenario_Outskirts_Team_Deathmatch
set Map[9]=Prison?Scenario_Prison_TDM
set Map[10]=LastLight?Scenario_LastLight_TDM
set Map[11]=Forest?Scenario_Forest_TDM
set Map[12]=Canyon?Scenario_Crossing_Team_Deathmatch
exit /b

:Push
set Map[0]=Town?Scenario_Hideout_Push_Security
set Map[1]=Town?Scenario_Hideout_Push_Insurgents
set Map[2]=Precinct?Scenario_Precinct_Push_Security
set Map[3]=Precinct?Scenario_Precinct_Push_Insurgents
set Map[4]=OilField?Scenario_Refinery_Push_Security
set Map[5]=OilField?Scenario_Refinery_Push_Insurgents
set Map[6]=Farmhouse?Scenario_Farmhouse_Push_Security
set Map[7]=Farmhouse?Scenario_Farmhouse_Push_Insurgents
set Map[8]=Mountain?Scenario_Summit_Push_Security
set Map[9]=Mountain?Scenario_Summit_Push_Insurgents
set Map[10]=Citadel?Scenario_Citadel_Push_Security
set Map[11]=Citadel?Scenario_Citadel_Push_Insurgents
set Map[12]=Bab?Scenario_Bab_Push_Security
set Map[13]=Bab?Scenario_Bab_Push_Insurgents
set Map[14]=Gap?Scenario_Gap_Push_Security
set Map[15]=Gap?Scenario_Gap_Push_Insurgents
set Map[16]=Sinjar?Scenario_Push_Checkpoint_Security
set Map[17]=Sinjar?Scenario_Push_Checkpoint_Insurgents
set Map[18]=Ministry?Scenario_Push_Checkpoint_Security
set Map[19]=Ministry?Scenario_Push_Checkpoint_Insurgents
set Map[20]=Compound?Scenario_Push_Checkpoint_Security
set Map[21]=Compound?Scenario_Push_Checkpoint_Insurgents
set Map[22]=PowerPlant?Scenario_Push_Checkpoint_Security
set Map[23]=PowerPlant?Scenario_Push_Checkpoint_Insurgents
set Map[24]=Tell?Scenario_Tell_Push_Security
set Map[25]=Tell?Scenario_Tell_Push_Insurgents
set Map[26]=Buhriz?Scenario_Tideway_Push_Security
set Map[27]=Buhriz?Scenario_Tideway_Push_Insurgents
set Map[28]=Prison?Scenario_Prison_Push_Security
set Map[29]=Prison?Scenario_Prison_Push_Insurgents
set Map[30]=LastLight?Scenario_LastLight_Push_Security
set Map[31]=LastLight?Scenario_LastLight_Push_Insurgents
set Map[32]=TrainYard?Scenario_Trainyard_Push_Security
set Map[33]=TrainYard?Scenario_Trainyard_Push_Insurgents
set Map[34]=Forest?Scenario_Forest_Push_Security
set Map[35]=Forest?Scenario_Forest_Push_Insurgents
set Map[36]=Canyon?Scenario_Crossing_Push_Security
set Map[37]=Canyon?Scenario_Crossing_Push_Insurgents
exit /b

:Main
set Label=Main
cls
echo ========================================================================================================
echo =                       Insurgency Sandstorm Advanced Server Launcher 2.0                              =
echo ========================================================================================================
echo =                                List of useful commands                                               =
echo =         /load - Load server config ^| /save - Save server config ^| /motd - Create MOTD                =
echo =         /maps - Create map cycle   ^| /admins - Create admin list^| /auth - Set Steam/NWI tokens       =
echo =         /tod - Toggle day/night    ^| /mutate - Add mutators     ^| /pass - Add server password        =
echo =         /launch - Start your server^| /parse - Adds MultiHome cmd^| /mods - Includes your Mod.txt      =
echo ========================================================================================================
echo   Server Address: %svIP%
echo   Server Name: %svName%
echo   Max Players: %svMax%
echo   Server Cheats: %cheats%
if %getGM%==2 (echo   Gamemode: Hardcore Checkpoint) else (echo   Gamemode: %svGameMode%) 
echo   Map/Team: %svMap% ^(%Lighting%^)
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
if /i "%opt%"=="/tod" (
	call :TOD )
if /i "%opt%"=="/mutate" (
	call :Mutators )
if /i "%opt%"=="/pass" (
	call :Password )
if /i "%opt%"=="/launch" (
	call :SetVars )
if /i "%opt%"=="/parse" (
	call :Parse )
if /i "%opt%"=="/mods" (
	call :Mods )

call :Error

:: load configuration
:ReadConfig
if exist cfg.bat (
	echo.
    set /p load_cfg="Would you like to load your server configuration file? (Y/n): "
) else goto Main

if /i "%load_cfg%"=="Y" (
    call cfg
    set "getGM=!sVar1!"
    set "getTM=!sVar2!"
    set "getMap=!sVar3!"
	set "IP=!IP!"
	set "MC=!MC!"
	set "MD=!MD!"
	set "TK=!TK!"
	call :MapSetup
) else goto Main

:: gamemode selection
:GameMode
set Label=GameMode
echo.
echo ===== COOP =====
echo [1] Checkpoint
echo [2] Hardcore Checkpoint
echo [3] Outpost
echo [4] Survival
echo.
echo ==== VERSUS ====
echo [5] Frontline
echo [6] Team Deathmatch
echo [7] Push
echo.
set /p getGM=Select a Game Mode (1-7): 
if %getGM% lss 1 call :Error
if %getGM% gtr 7 call :Error
:SetMode
if %getGM%==1 set svGameMode=Checkpoint
if %getGM%==2 set svGameMode=Checkpoint
if %getGM%==3 set svGameMode=Outpost
if %getGM%==4 set svGameMode=Survival
if %getGM%==5 set svGameMode=Frontline
if %getGM%==6 set svGameMode=TeamDeathmatch
if %getGM%==7 set svGameMode=Push
if defined svMap (call :MapSetup) else (call :RandomMap)

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
if not !svGameMode!==TeamDeathmatch (echo [8] Bab) else (echo [^*] Bab 			^(INCOMPATIBLE GAMEMODE^))
echo [9] Gap
if not !svGameMode!==TeamDeathmatch ( echo [10] Hillside ) else ( echo [^*] Hillside 			^(INCOMPATIBLE GAMEMODE^))
echo [11] Ministry
echo [12] Outskirts
if not !svGameMode!==TeamDeathmatch ( echo [13] Power Plant )  else ( echo [^*] Power Plant 		^(INCOMPATIBLE GAMEMODE^))
if not !svGameMode!==TeamDeathmatch ( echo [14] Tell ) else ( echo [^*] Tell 			^(INCOMPATIBLE GAMEMODE^))
if not !svGameMode!==TeamDeathmatch ( echo [15] Tideway ) else ( echo [^*] Tideway 			^(INCOMPATIBLE GAMEMODE^))
echo [16] Prison
echo [17] Last Light
if not !svGameMode!==TeamDeathmatch ( echo [18] Train Yard ) else ( echo [^*] Trainyard 			^(INCOMPATIBLE GAMEMODE^))
echo [19] Forest
echo [20] Crossing
echo.
set /p getMap=Select a map (1-19): 
if %getMap% gtr 20 call :Error
if %getMap% lss 1 call :Error
if defined getTM call :Memory
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
:SetTeam
if %getTM%==1 set /a n1+=2-!(n1%%2)
if %getTM%==2 set /a n1+=1-!(n1%%2)
if defined svMap goto MapSetup 
goto Main

:MapSetup
if %getGM%==1 call :Checkpoint
if %getGM%==2 call :Hardcore
if %getGM%==3 call :Oupost
if %getGM%==4 call :Survival
if %getGM%==5 call :Frontline
if %getGM%==6 call :TDM
if %getGM%==7 call :Push

:: random map selected?
if %getMap%==1 (
    call :RandomMap
)

:: calculate index for specific map
set /a idx=%getMap%-2
if %getGM%==6 if %getMap%==20 (set svMap=Canyon?Scenario_Crossing_Team_Deathmatch_%Lighting%&& goto Main)
if %idx% lss 0 set /a idx=0

:: add team offset for modes that need it
if %getGM%==1 if defined getTM set /a idx=(idx*2)+(getTM-1)
if %getGM%==2 if defined getTM set /a idx=(idx*2)+(getTM-1)
if %getGM%==7 if defined getTM set /a idx=(idx*2)+(getTM-1)

:: assign map safely
set "svMap=!Map[%idx%]!"
if "!svMap!"=="" (
    echo Map assignment failed. Assigning random map...
	timeout /t 2 >nul
    call :RandomMap
)

goto Main


:RandomMap
set /a n1=%RANDOM% %% 38
set /a n2=%RANDOM% %% 19
set /a n3=%RANDOM% %% 13
if %getTM%==1 set /a n1+=2-!(n1%%2)
if %getTM%==2 set /a n1+=1-!(n1%%2)

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
	)
if %getGM%==2 (
	call :Hardcore
	set svMap=!Map[%n1%]!
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
	)
	
if "!svMap!"=="" (
echo Error
pause
    call :RandomMap
)

goto Main

:: assign server settings host ip/hostname/max players/tokens
:GameSetup
title Insurgency Sandstorm Advanced Server Launcher 2.0 ^| Server Settings
set Label=GameSetup
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
if %cheats% lss 0 call :Error
goto Main

:: save current server configuration
:SaveConfig
if not exist cfg.bat (
	echo.
    set /p save_cfg=" Would you like to save these settings to a configuration file? (Y/n): "
    if /i "!save_cfg!"=="Y" (
        call :WriteConfig
    ) else exit /b
) else (
	echo.
    set /p save_cfg=" Would you like to overwrite these settings in your configuration file? (Y/n): "
    if /i "!save_cfg!"=="Y" (
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
	echo set MT=!MT!
	echo set PW=!PW!
	echo set MOD=!MOD!
	echo set FinalMutator=!FinalMutator!
	echo set svPass=!svPass!
) > cfg.bat
goto Main

:MOTD
title Insurgency Sandstorm Advanced Server Launcher 2.0 ^| Create MOTD
set MD=1
echo.
echo File can be found here: %svConfig%
echo Enter "/q" when finished.
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
if /i "%motdTXT%"=="/q" goto Main

:: trim spaces
for /f "tokens=* delims= " %%A in ("%motdTXT%") do set "motdTXT=%%A"

:: write line without trailing spaces
<nul set /p ="%motdTXT%" >> "%svConfig%\Motd.txt"

goto WriteMOTD

:Admins
title Insurgency Sandstorm Advanced Server Launcher 2.0 ^| Assign Admins
echo.
echo File can be found here: %svConfig%\Admins.txt
echo Enter "/q" when finished.
echo.

:DoAdmins
set /p sID64= Enter Valid SteamID64: 
if "%sID64%"=="/q" ( goto Main) else ( call :WriteAdmins )

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
if "%getGM%"=="2"  (call :Hardcore)
if "%getGM%"=="7"  (call :Push)
if "%getGM%"=="3"  (call :Outpost)
if "%getGM%"=="4"  (call :Survival)
if "%getGM%"=="5" (call :Frontline)
if "%getGM%"=="6" (call :TDM)

echo. 
if not defined svGameMode echo Please select a gamemode first. && timeout /t 2 >nul && goto Main
set /p "mcy=MapCycle.txt will be generated for %svGameMode%. Do you wish to continue? (Y/n): "
set /p "mcyn=Would you like to include night maps? (Y/n): "
if /i "%mcy%"=="N" goto Main 
if exist "%svConfig%\MapCycle.txt" (
    set /p "omcy=A map cycle already exists. Do you wish to overwrite it? (Y/n): "
    if /i "%omcy%"=="Y" (
        del /q "%svConfig%\MapCycle.txt" ::doesn't work for some stupid fucking reason so we do it again under :DoMapCycle
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

:: iterate all possible indexes; skip undefined
for /L %%I in (%int%) do (
    set "rawMap=!Map[%%I]!"
    if defined rawMap (
        :: trim everything before "Scenario"
        set "scene=!rawMap:*Scenario=Scenario!"
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
if %IP%==1 call :NoParse
set IP=1
set "ParseIP=-MultiHome=%svIP%"
echo.
echo [^*] IP has been parsed.
timeout /t 2 >nul
goto Main

:NoParse
set IP=0
set "ParseIP="
echo.
echo [^*] IP is no longer parsed.
timeout /t 2 >nul
goto Main

:: determine variable conditions
:SetVars
set server=%svMap%?MaxPlayers=%svMax%?Lighting=%Lighting%?game=%svGameMode% -Port=27102 -QueryPort=27131 -log -hostname="%svName%"
set "launchCmd=%server%"

if "%PW%"=="1" (
	if defined svPass (
		set "launchCmd=!launchCmd! -password=%svPass%"
	)
)

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

if "%MOD%"=="1" (
	if exist "%svConfig%\Mods.txt" (
		set "launchCmd=!launchCmd! -Mods=Mods.txt"
	)
)

echo.
echo !launchCmd!
pause
goto Init

:TOD
if %tod%==1 (
	set tod=0
	set Lighting=Day
	echo.
	echo Lighting set to day.
	timeout /t 2 >nul) else (
		set tod=1
		set Lighting=Night
		echo.
		echo Lighting set to night.
		timeout /t 2 >nul)
goto Main

:Mutators
set "MutationList="

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
set "MutationList="

:PickMutator
echo.
echo Choose mutators (pick one, press Enter, repeat). Type X when done.
echo.
echo [1]  AllYouCanEat
echo [2]  AntiMaterielRiflesOnly
echo [3]  BoltActionsOnly
echo [4]  Broke
echo [5]  BulletSponge
echo [6]  Competitive
echo [7]  CompetitiveLoadouts
echo [8]  FastMovement
echo [9]  Frenzy
echo [10] Guerrillas
echo [11] Hardcore
echo [12] HeadshotOnly
echo [13] HotPotato
echo [14] LockedAim
echo [15] NoAim
echo [16] PistolsOnly
echo [17] ShotgunsOnly
echo [18] SlowCaptureTimes
echo [19] SlowMovement
echo [20] SoldierOfFortune
echo [21] SpecialOperations
echo [22] Strapped
echo [23] Ultralethal
echo [24] Vampirism
echo [25] Warlords
echo.
set /p "opt=Select a mutator (1-25) or X to finish: "

if /i "%opt%"=="X" goto DoneMutators

:: validate numeric input is between 1 and 25
for /f "delims=0123456789" %%A in ("%opt%") do (
    call :Error
    pause>nul
    goto PickMutator
)

if %opt% lss 1 if %opt% gtr 25 (
    call :Error
    pause>nul
    goto PickMutator
)

:: fetch the Mut[#] into chosen mutator using call expansion
call set "ChosenMutator=%%Mut%opt%%%"
if "%ChosenMutator%"=="" (
    echo Selection invalid or unmapped. Try again.
    pause>nul
    goto PickMutator
)

:: append to list (comma separated)
if defined MutationList (
    set "MutationList=%MutationList%,%ChosenMutator%"
) else (
    set "MutationList=%ChosenMutator%"
)

echo Added: %ChosenMutator%
pause>nul
goto PickMutator

:DoneMutators
set MT=1
endlocal & set "FinalMutator=%MutationList%"
echo.
echo Finished. FinalMutator:
echo %FinalMutator%
pause
goto Main

:Password
set PW=1
echo.
set /p "svPass=Enter a password to join your server: "
exit /b

:Mods
if exist "%svConfig%\Mods.txt" (
	set MOD=1
	echo.
	echo Mods.txt has been included into the launch command.
	timeout /t 2 >nul
) else (
	echo.
	echo Could not find Mods.txt in server config folder.
	timeout /t 2 >nul
)

goto Main

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
timeout /t 2 >nul
goto Main

:: necessary for changing out teams, gamemodes and/or maps
:Memory
set VarMem1=%getGM%
set VarMem2=%getTM%
set VarMem3=%getMap%
exit /b

:Error
echo.
echo [^^!] ERROR: Invalid entry. Please try again. && timeout /t 2 >nul && goto %Label%

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
