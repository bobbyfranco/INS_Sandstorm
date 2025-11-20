REM // This is a fairly comprehensive server launcher for Insurgency Sandstorm scripted by Bobby Franco. Feel free to edit how you see fit, but know that the code is very fragile, so be sure you know what you're doing.

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
goto Main

REM // i only included a few gamemodes cause im lazy, but feel free to add more \\

:: map "arrays"
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

:HardcoreCheckpoint
set Map[0]=Town?Scenario_Hideout_Checkpoint_Security?Mutators=Hardcore
set Map[1]=Town?Scenario_Hideout_Checkpoint_Insurgents?Mutators=Hardcore
set Map[2]=Precinct?Scenario_Precinct_Checkpoint_Security?Mutators=Hardcore
set Map[3]=Precinct?Scenario_Precinct_Checkpoint_Insurgents?Mutators=Hardcore
set Map[4]=OilField?Scenario_Refinery_Checkpoint_Security?Mutators=Hardcore
set Map[5]=OilField?Scenario_Refinery_Checkpoint_Insurgents?Mutators=Hardcore
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

:Oupost
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
    set /p load_cfg="Would you like to load your server configuration file? (Y/n): "
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
if "!getMap!"=="1" ( call :MapSetup ) else ( goto Main )

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
:SetMode
if %getGM%==1 set svGameMode=Checkpoint
if %getGM%==2 set svGameMode=Checkpoint
if %getGM%==3 set svGameMode=Outpost
if %getGM%==4 set svGameMode=Survival
if %getGM%==5 set svGameMode=Frontline
if %getGM%==6 set svGameMode=TeamDeathmatch
if %getGM%==7 set svGameMode=Push
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
    goto Main
)

goto Main


:RandomMap
set /a n1=%RANDOM% %% 38
set /a n2=%RANDOM% %% 19
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
	set svMap=!Map[%n2%]!
	)
if %getGM%==7 (
	call :Push
	set svMap=!Map[%n1%]!
	)
	
if "!svMap!"=="" (
    echo Map assignment failed. Returning to main menu...
	ping localhost -n 2 >nul
    goto Main
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
	echo.
    set /p save_cfg=" Would you like to save these settings to a configuration file? (Y/n): "
    if /I "!save_cfg!"=="Y" (
        call :WriteConfig
    ) else exit /b
) else (
	echo.
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
if "%getGM%"=="1"  (set "arr=Map")
if "%getGM%"=="2"  (set "arr=Map")
if "%getGM%"=="7"  (set "arr=Map")
if "%getGM%"=="3"  (set "arr=Map")
if "%getGM%"=="4"  (set "arr=Map")
if "%getGM%"=="5" (set "arr=Map")
if "%getGM%"=="6" (set "arr=Map")

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

:: necessary for changing out teams, gamemodes and/or maps
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
