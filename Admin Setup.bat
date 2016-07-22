@echo off
echo Einrichten von Logon-Hintergrund
echo Dieses Programm muss mit Admin-Rechten ausgeführt werden.

@reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Background /v OEMBackground /t REG_DWORD /d 1 /f

@mkdir %windir%\system32\oobe\info

@takeown /F %windir%\Web\Wallpaper\Windows\img0.jpg /A
@cacls %windir%\Web\Wallpaper\Windows\img0.jpg /p Administratoren:F

@del /f %windir%\Web\Wallpaper\Windows\img0.jpg
@del /f C:\Users\Public\Desktop\Helpdesk.*
@del /f C:\Users\Public\Desktop\Intranet.*
@del /f C:\Users\Public\Desktop\BUSPRO*.*
@del /f C:\Users\Public\Desktop\*.url
@del /f C:\Users\Public\Desktop\Mozilla*.*
@del /f C:\Users\Public\Desktop\PDF*.*

@del /f %windir%\system32\oobe\info\*.*

@net use v: \\srv01\Vorlagen

@copy v:\Neuinstallation\Desktop\Allpower_gross.jpg %USERPROFILE%\Desktop\Allpower.jpg
@copy %USERPROFILE%\Desktop\Allpower.jpg %windir%\Web\Wallpaper\Windows\img0.jpg
@copy %USERPROFILE%\Desktop\Allpower.jpg %windir%\system32\oobe\info\backgroundDefault.jpg
@del %USERPROFILE%\Desktop\Allpower.jpg

@copy v:\Neuinstallation\Desktop\Helpdesk.url C:\Users\Public\Desktop\Helpdesk.url
@copy v:\Neuinstallation\Desktop\Intranet.url C:\Users\Public\Desktop\Intranet.url
@copy v:\Neuinstallation\Desktop\Buspro.url C:\Users\Public\Desktop\Buspro.url

@net use v: /delete