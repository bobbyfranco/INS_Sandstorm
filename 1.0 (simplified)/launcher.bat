:: This is a fairly comprehensive server launcher for Insurgency Sandstorm scripted by Bobby Franco. Feel free to edit how you see fit, but know that the code is very fragile, so be sure you know what you're doing.

@echo off
color 0a
title Insurgency Sandstorm Advanced Server Launcher ^| Game Mode: %svGameMode% ^| Map: %svMap%
setlocal enabledelayedexpansion
::runas /user:Administrator "%~f0" REM // this isn't necessary, but may be useful if you're having trouble with your server.

:: check if launcher is in correct directory
if exist InsurgencyServer.exe (
	REM // nothing goes here lol
) else (
    echo You're currently not inside your sandstorm server directory!
    echo Please move launcher to the correct directory where InsurgencyServer.exe is located or give a path to the directory.
    echo.
    set /p svDir=Path to directory: 
    move "%~f0" "!svDir!\%~n0%~x0"
    echo launcher has been moved to "!svDir!\%~n0%~x0".
    echo Go to the provided directory to restart launcher.
    pause
)

:: set sv_defaults for quick start
for /F "tokens=14" %%i in ('"ipconfig | findstr IPv4"') do SET svIP=%%i
set svName=INS Server
set svMax=8
set cheats=0
set token1=NOTOKEN
set token2=NOTOKEN
goto Start

:: map "arrays"
:Checkpoint
set Map[0]=Town?Scenario_Hideout_Checkpoint_Security
set Map[1]=Town?Scenario_Hideout_Checkpoint_Insurgents
set Map[2]=Precinct?Scenario_Precinct_Checkpoint_Security
set Map[3]=Precinct?Scenario_Precinct_Checkpoint_Insurgents
set Map[4]=Oilfield?Scenario_Refinery_Checkpoint_Security
set Map[5]=Oilfield?Scenario_Refinery_Checkpoint_Insurgents
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
set Map[0]=Town?Scenario_Hideout_Checkpoint_Security?Mutators=Hardcore
set Map[1]=Town?Scenario_Hideout_Checkpoint_Insurgents?Mutators=Hardcore
set Map[2]=Precinct?Scenario_Precinct_Checkpoint_Security?Mutators=Hardcore
set Map[3]=Precinct?Scenario_Precinct_Checkpoint_Insurgents?Mutators=Hardcore
set Map[4]=Oilfield?Scenario_Refinery_Checkpoint_Security?Mutators=Hardcore
set Map[5]=Oilfield?Scenario_Refinery_Checkpoint_Insurgents?Mutators=Hardcore
set Map[6]=Farmhouse?Scenario_Farmhouse_Checkpoint_Security?Mutators=Hardcore
set Map[7]=Farmhouse?Scenario_Farmhouse_Checkpoint_Insurgents?Mutators=Hardcore
set Map[8]=Mountain?Scenario_Summit_Checkpoint_Security?Mutators=Hardcore
set Map[9]=Mountain?Scenario_Summit_Checkpoint_Insurgents?Mutators=Hardcore
set Map[10]=Citadel?Scenario_Citadel_Checkpoint_Security?Mutators=Hardcore
set Map[11]=Citadel?Scenario_Citadel_Checkpoint_Insurgents?Mutators=Hardcore
set Map[12]=Bab?Scenario_Bab_Checkpoint_Security?Mutators=Hardcore
set Map[13]=Bab?Scenario_Bab_Checkpoint_Insurgents?Mutators=Hardcore
set Map[14]=Gap?Scenario_Gap_Checkpoint_Security?Mutators=Hardcore
set Map[15]=Gap?Scenario_Gap_Checkpoint_Insurgents?Mutators=Hardcore
set Map[16]=Sinjar?Scenario_Hillside_Checkpoint_Security?Mutators=Hardcore
set Map[17]=Sinjar?Scenario_Hillside_Checkpoint_Insurgents?Mutators=Hardcore
set Map[18]=Ministry?Scenario_Ministry_Checkpoint_Security?Mutators=Hardcore
set Map[19]=Ministry?Scenario_Ministry_Checkpoint_Insurgents?Mutators=Hardcore
set Map[20]=Compound?Scenario_Outskirts_Checkpoint_Security?Mutators=Hardcore
set Map[21]=Compound?Scenario_Outskirts_Checkpoint_Insurgents?Mutators=Hardcore
set Map[22]=PowerPlant?Scenario_PowerPlant_Checkpoint_Security?Mutators=Hardcore
set Map[23]=PowerPlant?Scenario_PowerPlant_Checkpoint_Insurgents?Mutators=Hardcore
set Map[24]=Tell?Scenario_Tell_Checkpoint_Security?Mutators=Hardcore
set Map[25]=Tell?Scenario_Tell_Checkpoint_Insurgents?Mutators=Hardcore
set Map[26]=Buhriz?Scenario_Tideway_Checkpoint_Security?Mutators=Hardcore
set Map[27]=Buhriz?Scenario_Tideway_Checkpoint_Insurgents?Mutators=Hardcore
set Map[28]=Prison?Scenario_Prison_Checkpoint_Security?Mutators=Hardcore
set Map[29]=Prison?Scenario_Prison_Checkpoint_Insurgents?Mutators=Hardcore
set Map[30]=LastLight?Scenario_LastLight_Checkpoint_Security?Mutators=Hardcore
set Map[31]=LastLight?Scenario_LastLight_Checkpoint_Insurgents?Mutators=Hardcore
set Map[32]=TrainYard?Scenario_Trainyard_Checkpoint_Security?Mutators=Hardcore
set Map[33]=TrainYard?Scenario_Trainyard_Checkpoint_Insurgents?Mutators=Hardcore
set Map[34]=Forest?Scenario_Forest_Checkpoint_Security?Mutators=Hardcore
set Map[35]=Forest?Scenario_Forest_Checkpoint_Insurgents?Mutators=Hardcore
set Map[36]=Canyon?Scenario_Crossing_Checkpoint_Security?Mutators=Hardcore
set Map[37]=Canyon?Scenario_Crossing_Checkpoint_Insurgents?Mutators=Hardcore
exit /b

:Outpost
set Map[0]=Town?Scenario_Hideout_Outpost
set Map[1]=Precinct?Scenario_Precinct_Outpost
set Map[2]=Oilfield?Scenario_Refinery_Outpost
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
set Map[2]=Oilfield?Scenario_Refinery_Survival
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

:Frontline
set Map[0]=Town?Scenario_Hideout_Frontline
set Map[1]=Precinct?Scenario_Precinct_Frontline
set Map[2]=Oilfield?Scenario_Refinery_Frontline
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
set Map[2]=Oilfield?Scenario_Refinery_Team_Deathmatch
set Map[3]=Farmhouse?Scenario_Farmhouse_Team_Deathmatch
set Map[4]=Mountain?Scenario_Summit_Team_Deathmatch
set Map[5]=Citadel?Scenario_Citadel_Team_Deathmatch
set Map[6]=Bab?Scenario_Bab_Team_Deathmatch
set Map[7]=Gap?Scenario_Gap_Team_Deathmatch
set Map[8]=Sinjar?Scenario_Hillside_Team_Deathmatch
set Map[9]=Ministry?Scenario_Ministry_Team_Deathmatch
set Map[10]=Compound?Scenario_Outskirts_Team_Deathmatch
set Map[11]=PowerPlant?Scenario_PowerPlant_Team_Deathmatch
set Map[12]=Tell?Scenario_Tell_Team_Deathmatch
set Map[13]=Buhriz?Scenario_Tideway_Team_Deathmatch
set Map[14]=Prison?Scenario_Prison_Team_Deathmatch
set Map[15]=LastLight?Scenario_LastLight_Team_Deathmatch
set Map[16]=TrainYard?Scenario_Trainyard_Team_Deathmatch
set Map[17]=Forest?Scenario_Forest_Team_Deathmatch
set Map[18]=Canyon?Scenario_Crossing_Team_Deathmatch
exit /b

:Push
set Map[0]=Town?Scenario_Hideout_Push_Security
set Map[1]=Town?Scenario_Hideout_Push_Insurgents
set Map[2]=Precinct?Scenario_Precinct_Push_Security
set Map[3]=Precinct?Scenario_Precinct_Push_Insurgents
set Map[4]=Oilfield?Scenario_Refinery_Push_Security
set Map[5]=Oilfield?Scenario_Refinery_Push_Insurgents
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

:Start
:: load configuration on start
if exist cfg.bat (
    echo.
    set /p load_cfg="Would you like to load your configuration file and start the server? (Y/n): "
) else goto GameMode

if /I "%load_cfg%"=="Y" (
    call cfg
    set "getGM=!sVar1!"
    set "getTM=!sVar2!"
    set "getMap=!sVar3!"
	call :MapSetup
) else goto GameMode

:: gamemode selection
:GameMode
cls
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
if %getGM%==1 set svGameMode=Checkpoint
if %getGM%==2 set svGameMode=Checkpoint
if %getGM%==3 set svGameMode=Outpost
if %getGM%==4 set svGameMode=Survival
if %getGM%==5 set svGameMode=Frontline
if %getGM%==6 set svGameMode=TeamDeathmatch
if %getGM%==7 set svGameMode=Push

:: map selection
:Map
call :TitleUpdate
cls
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
cls
echo.
echo [1] Security
echo [2] Insurgents
echo.
set /p getTM=Select a team (1 or 2): 
goto MapSetup

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
set /A idx=%getMap%-2
if %idx% LSS 0 set /A idx=0

:: add team offset for modes that need it
if %getGM%==1 if defined getTM set /A idx=(idx*2)+(getTM-1)
if %getGM%==2 if defined getTM set /A idx=(idx*2)+(getTM-1)
if %getGM%==7 if defined getTM set /A idx=(idx*2)+(getTM-1)

:: assign map safely
set "svMap=!Map[%idx%]!"
if "!svMap!"=="" (
    echo Map assignment failed. Returning to main menu...
	ping localhost -n 2 >nul
    goto MapSetup
)
if /i %load_cfg%==Y goto SetVars
goto GameSetup


:RandomMap
set /a n1=%RANDOM% %% 38
set /a n2=%RANDOM% %% 19
if %getTM%==1 set /a n1+=2-!(n1%%2)
if %getTM%==2 set /a n1+=1-!(n1%%2)

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
	set svMap=!Map[%n2%]!
	)
if %getGM%==7 (
	call :Push
	set svMap=!Map[%n1%]!
	)
	
if "!svMap!"=="" (
    echo Map assignment failed. Returning to main menu...
	ping localhost -n 2 >nul
    goto MapSetup
)
if /i %load_cfg%==Y goto SetVars

:: assign server settings host ip/hostname/max players/tokens
:GameSetup
call :TitleUpdate
setlocal enabledelayedexpansion
cls
echo Leave everything blank for default settings.
echo.
:: localhost 127.0.0.1 for strictly LAN
set /p svIP= Enter IPv4 Address (Default: %svIP%): 
set /p svName= Enter a name for your server: 
set /p svMax= Enter max player count (Max 32): 
if %svMax% gtr 32 echo [!] That's too high. && ping localhost -n 2 >nul && goto GameSetup
if %svMax% lss 1 echo [!] That's too low. && ping localhost -n 2 >nul && goto GameSetup
set /p cheats= Enable Cheats? (0-1): 
if %cheats% gtr 1 echo [!] Invalid Syntax. && ping localhost -n 2 >nul && goto GameSetup
set /p token1= Enter GSLT Token: 
set /p token2= Enter NWI Game Stats Token: 

:: save current server configuration
if not exist cfg.bat (
	echo.
    set /p save_cfg=" Would you like to save these settings to a configuration file? (Y/n): "
    if /I "!save_cfg!"=="Y" (
        call :WriteConfig
    ) else goto SetVars
) else (
	echo.
    set /p save_cfg=" Would you like to overwrite these settings in your configuration file? (Y/n): "
    if /I "!save_cfg!"=="Y" (
        call :WriteConfig
    ) else goto SetVars
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
    echo set sVar1=!getGM!
    echo set sVar2=!getTM!
    echo set sVar3=!getMap!
) > cfg.bat


:SetVars
if %token1%==NOTOKEN if %token2%==NOTOKEN set server=%svMap%?MaxPlayers=%svMax%?game=%svGameMode% -Port=27102 -QueryPort=27131 -log -hostname="%svName%" -MapCycle=MapCycle.txt -motd -GameStats -EnableCheats=%cheats% -MultiHome=%svIP%
if %token1%==NOTOKEN if not %token2%==NOTOKEN set server=%svMap%?MaxPlayers=%svMax%?game=%svGameMode% -Port=27102 -QueryPort=27131 -log -hostname="%svName%" -MapCycle=MapCycle.txt -motd -GameStats -GameStatsToken=%token2% -EnableCheats=%cheats% -MultiHome=%svIP%
if not %token1%==NOTOKEN if %token2%==NOTOKEN set server=%svMap%?MaxPlayers=%svMax%?game=%svGameMode% -Port=27102 -QueryPort=27131 -log -hostname="%svName%" -MapCycle=MapCycle.txt -motd -GSLTToken=%token1% -EnableCheats=%cheats% -MultiHome=%svIP%
if not %token1%==NOTOKEN if not %token2%==NOTOKEN set server=%svMap%?MaxPlayers=%svMax%?game=%svGameMode% -Port=27102 -QueryPort=27131 -log -hostname="%svName%" -MapCycle=MapCycle.txt -motd -GameStats -GSLTToken=%token1% -GameStatsToken=%token2% -EnableCheats=%cheats% -MultiHome=%svIP%
goto Init

:Init
call :TitleUpdate
cls
echo Server Address: %svIP%
echo Server Name: %svName%
echo Game Mode: %svGameMode%
echo Map: %svMap%
echo Cheats Enabled: %cheats%
echo Max Players: %svMax%
echo GSLT Token: %token1%
echo NWI Token: %token2%
echo Command: %server%
echo.
echo Press Any Key to Start Server
pause>nul
echo.
echo Starting server...
echo You can now close this window.
InsurgencyServer.exe %server%

:TitleUpdate
title Sandstorm Advanced Server Launcher ^| Game Mode: %svGameMode% ^| Map: %svMap%
