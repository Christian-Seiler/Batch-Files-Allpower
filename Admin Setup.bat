@echo off
echo Einrichten von Logon-Hintergrund
echo Dieses Programm muss mit Admin-Rechten ausgeführt werden.

@reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Background /v OEMBackground /t REG_DWORD /d 1 /f

@mkdir %windir%\system32\oobe\info

:: Takes Ownership of the Default Windows Wallpaper
@takeown /F %windir%\Web\Wallpaper\Windows\img0.jpg /A
@cacls %windir%\Web\Wallpaper\Windows\img0.jpg /p Administratoren:F

:: Delete Default Windows Wallpaper
@del /f %windir%\Web\Wallpaper\Windows\img0.jpg

:: Delete unwanted Desktop Links
@del /f C:\Users\Public\Desktop\Helpdesk.*
@del /f C:\Users\Public\Desktop\Intranet.*
@del /f C:\Users\Public\Desktop\BUSPRO*.*
@del /f C:\Users\Public\Desktop\*.url
@del /f C:\Users\Public\Desktop\Mozilla*.*
@del /f C:\Users\Public\Desktop\PDF*.*

@del /f %windir%\system32\oobe\info\*.*

:: Connect Network Folder
@net use v: \\srv01\Vorlagen

:: Copy Company Wallpaper temporarely to Desktop
@copy v:\Neuinstallation\Desktop\Allpower_gross.jpg %USERPROFILE%\Desktop\Allpower.jpg

:: Copy Wallpaper to Default Wallpaper Directory
@copy %USERPROFILE%\Desktop\Allpower.jpg %windir%\Web\Wallpaper\Windows\img0.jpg
@copy %USERPROFILE%\Desktop\Allpower.jpg %windir%\system32\oobe\info\backgroundDefault.jpg
@del %USERPROFILE%\Desktop\Allpower.jpg

:: Copy Intranet Links to Desktop
@copy v:\Neuinstallation\Desktop\Helpdesk.url C:\Users\Public\Desktop\Helpdesk.url
@copy v:\Neuinstallation\Desktop\Intranet.url C:\Users\Public\Desktop\Intranet.url
@copy v:\Neuinstallation\Desktop\Buspro.url C:\Users\Public\Desktop\Buspro.url

:: Release Network Folder
@net use v: /delete

:: Done
:: The .bat-File on the Desktop can now be deleted.
@ping -n 5 127.0.0.1 > NUL
:: Self-destroy the .bat-File
(goto) 2>nul & del "%~f0" & EXIT
