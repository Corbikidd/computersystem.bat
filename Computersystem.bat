@echo off
title System & Game Manager
color 0A
cls

:menu
echo ====================================
echo   SYSTEM & GAME MANAGEMENT TOOL
echo ====================================
echo 1) Scan Installed Games
echo 2) Game FPS & Data Manager
echo 3) System Files Overview
echo 4) File Categorization
echo 5) Clear Command History
echo 6) Exit
echo ====================================
set /p choice=Enter your option (1-6): 

if "%choice%"=="1" goto ask_permission_games
if "%choice%"=="2" goto ask_permission_fps
if "%choice%"=="3" goto ask_permission_sysinfo
if "%choice%"=="4" goto ask_permission_files
if "%choice%"=="5" goto clear_history
if "%choice%"=="6" exit
echo Invalid option, try again.
goto menu

:ask_permission_games
cls
echo Do you give permission to scan installed games using PowerShell? (Y/N)
set /p psChoice=
if /I "%psChoice%"=="Y" (
    start powershell -NoExit -ExecutionPolicy Bypass -File "SystemScan.ps1" -Games
) else (
    echo Running BAT-only version...
    echo Scanning for installed games...
    if exist "C:\Program Files (x86)\Steam\steam.exe" echo Steam Found!
    if exist "C:\Users\%USERNAME%\AppData\Local\Roblox\Versions" echo Roblox Found!
)
pause
goto menu

:ask_permission_fps
cls
echo Do you give permission to scan FPS and system data using PowerShell? (Y/N)
set /p psChoice=
if /I "%psChoice%"=="Y" (
    start powershell -NoExit -ExecutionPolicy Bypass -File "SystemScan.ps1" -FPS
) else (
    echo Running BAT-only version...
    echo FPS & System Data Manager
    echo (Basic FPS details only; full monitoring requires PowerShell.)
)
pause
goto menu

:ask_permission_sysinfo
cls
echo Do you give permission to scan system details using PowerShell? (Y/N)
set /p psChoice=
if /I "%psChoice%"=="Y" (
    start powershell -NoExit -ExecutionPolicy Bypass -File "SystemScan.ps1" -SysInfo
) else (
    echo Running BAT-only version...
    echo System Information:
    systeminfo | findstr /C:"OS Name" /C:"Processor" /C:"Total Physical Memory"
)
pause
goto menu

:ask_permission_files
cls
echo Do you give permission to categorize files using PowerShell? (Y/N)
set /p psChoice=
if /I "%psChoice%"=="Y" (
    start powershell -NoExit -ExecutionPolicy Bypass -File "SystemScan.ps1" -Files
) else (
    echo Running BAT-only version...
    echo Basic File Categories:
    dir "%USERPROFILE%\Downloads" /b
    dir "%USERPROFILE%\Pictures" /b
    dir "%USERPROFILE%\Documents" /b
)
pause
goto menu

:clear_history
cls
echo Clearing command history...
del /q "%TEMP%\*"
del /q "%USERPROFILE%\Recent\*"
echo History cleared!
pause
goto menu