@echo off

:: ============================================================
:: Build script for Insurgency Sandstorm Advanced Server Launcher
:: Packages the app into a single standalone EXE using PyInstaller.
::
:: Output: dist\InsurgencyServerLauncher.exe
::
:: PyInstaller flags used:
::   --onefile      Bundle everything into a single EXE (no folder)
::   --windowed     No console window on launch (GUI app)
::   --name         Output EXE filename
::   --icon         Application icon embedded in the EXE
::   --add-data     Bundle assets at runtime (icon.ico for window title bar)
:: ============================================================

:: Change to the script's own directory so relative paths resolve correctly
cd /d "%~dp0"

:: Activate the project virtual environment
call .venv\Scripts\activate.bat

:: Check PyInstaller is available
where pyinstaller >nul 2>&1
if errorlevel 1 (
    echo ERROR: PyInstaller not found. Run: pip install pyinstaller
    pause
    exit /b 1
)

:: Run PyInstaller
pyinstaller --onefile --windowed --name "InsurgencyServerLauncher" --icon=assets\icon.ico --add-data "assets\icon.ico;assets" launcher.py

echo.
echo Build complete. EXE is at dist\InsurgencyServerLauncher.exe
pause
