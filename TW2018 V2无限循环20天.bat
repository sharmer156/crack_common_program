:: Check for ADMIN Privileges >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    REM Get ADMIN Privileges
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B
) else (
    REM Got ADMIN Privileges
    pushd "%cd%"
    cd /d "%~dp0"
    @echo on
)
:: BatchGotAdmin (Run as Admin code ends)
:: Your codes should start from the following line

%WINDIR%\SYSTEM32\REG.EXE DELETE "HKEY_CURRENT_USER\Software\Epic Games" /f
%WINDIR%\SYSTEM32\REG.EXE DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Abvent\Twinmotion2018" /f
%WINDIR%\SYSTEM32\REG.EXE DELETE "HKEY_USERS\S-1-5-21-3226995718-1085060171-2531778517-1001\Software\Epic Games\Unreal Engine" /f


rd /s /q "%ProgramData%\Abvent\com.abvent.Twinmotion2018"
rd /s /q "%ProgramData%\Application Data\Abvent\com.abvent.Twinmotion2018"
rd /s /q "C:\Users\All Users\Abvent\com.abvent.Twinmotion2018"

