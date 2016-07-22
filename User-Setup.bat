CHCP 1252
@echo off
@title ALLPOWER / User-Setup
set "string=%~d0"
if /I "-%string%-" == "-C:-" GOTO :START

copy \\srv01\Vorlagen\Scripts\User-Setup.bat %USERPROFILE%\Desktop\User-Setup.bat

echo.
echo.
echo.
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo        +                                                 +
echo        +                 A L L P O W E R                 +
echo        +            Kaufmännische Praxisfirma            +
echo        +                                                 +
echo        +                                                 +
echo        +            Willkommen zum User-Setup            +
echo        +                                                 +
echo        +                      v 0.3                      +
echo        +                                                 +
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
echo.
echo        Dieses Programm muss auf dem lokalen Computer
echo        ausgeführt werden und kann nicht von einem
echo        Serverlaufwerk verwendet werden.
echo.
echo        Das Programm wird nun beendet und vom Desktop
echo        gestartet...
echo.
@ping -n 5 127.0.0.1 > NUL
start %USERPROFILE%\Desktop\User-Setup.bat
exit

:start
cls

echo.
echo.
echo.
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo        +                                                 +
echo        +                 A L L P O W E R                 +
echo        +            Kaufmännische Praxisfirma            +
echo        +                                                 +
echo        +                                                 +
echo        +            Willkommen zum User-Setup            +
echo        +                                                 +
echo        +                      v 0.3                      +
echo        +                                                 +
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
echo.
echo        Bitte Personalien festlegen.
echo.
@set /P   Vorname=        Vorname:   
@set /P  Nachname=        Nachname:  
@set /p        id=        Kuerzel:   
@set /P Abteilung=        Abteilung: 




:VERZEICHNIS1
@net use v: \\srv01\Vorlagen
@IF exist %APPDATA%\Microsoft\Signatures\ GOTO VERZEICHNIS2
@md %APPDATA%\Microsoft\Signatures\
cls

echo.
echo.
echo.
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo        +                                                 +
echo        +                 A L L P O W E R                 +
echo        +            Kaufmännische Praxisfirma            +
echo        +                                                 +
echo        +                    User-Setup                   +
echo        +                                                 +
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
echo        +    Verzeichnis "Signatures" wurde erstellt.     +
cls

:VERZEICHNIS2
echo.
echo.
@IF exist %APPDATA%\Microsoft\Templates\ GOTO SIGNATURE
echo.
echo.
@md %APPDATA%\Microsoft\Templates\
cls
echo.
echo.
echo.
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo        +                                                 +
echo        +                 A L L P O W E R                 +
echo        +            Kaufmännische Praxisfirma            +
echo        +                                                 +
echo        +                    User-Setup                   +
echo        +                                                 +
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
echo        +    Verzeichnis "Signatures" erstellt.           +
echo        +    Verzeichnis "Templates" erstellt.            +
cls

:SIGNATURE
:: copy Outlook

@robocopy v:\Neuinstallation\Outlook\Signatures\Allpower\ %APPDATA%\Microsoft\Signatures\ /E
cls
echo.
echo.
echo.
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo        +                                                 +
echo        +                 A L L P O W E R                 +
echo        +            Kaufmännische Praxisfirma            +
echo        +                                                 +
echo        +                    User-Setup                   +
echo        +                                                 +
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
echo        +    Verzeichnis "Signatures" erstellt.           +
echo        +    Verzeichnis "Templates" erstellt.            +
echo        +    Signatur Dateien kopiert.                    +
echo        +    Signatur "Allpower" wird definiert...        +

@reg delete HKCU\Software\Microsoft\Office\14.0\Outlook\Setup\ /v First-Run /f
@reg add HKCU\Software\Microsoft\Office\14.0\Common\MailSettings /t REG_EXPAND_SZ /v NewSignature /d Allpower
@reg add HKCU\Software\Microsoft\Office\14.0\Common\MailSettings /t REG_EXPAND_SZ /v ReplySignature /d Allpower
cls
echo.
echo.
echo.
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo        +                                                 +
echo        +                 A L L P O W E R                 +
echo        +            Kaufmännische Praxisfirma            +
echo        +                                                 +
echo        +                    User-Setup                   +
echo        +                                                 +
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
echo        +    Verzeichnis "Signatures" erstellt.           +
echo        +    Verzeichnis "Templates" erstellt.            +
echo        +    Signatur Dateien kopiert.                    +
echo        +    Signatur "Allpower" als Standard definiert.  +
echo        +    eMail Template kopieren...                   +
pause
goto TEMPLATE
cls


:TEMPLATE
:: copy email template
echo Bitte Abteilung eingeben:
echo                       [V] Verkauf
echo                       [B] Buchhaltung
echo.
@set /P Template=Eingabe: 
if /I "%Template%" EQU "V" copy v:\Neuinstallation\Outlook\Templates\NormalEmail_Verkauf.dotm %APPDATA%\Microsoft\Templates\NormalEmail.dotm
if /I "%Template%" EQU "B" copy v:\Neuinstallation\Outlook\Templates\NormalEmail_Buchhaltung.dotm %APPDATA%\Microsoft\Templates\NormalEmail.dotm

cls
echo.
echo.
echo.
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo        +                                                 +
echo        +                 A L L P O W E R                 +
echo        +            Kaufmännische Praxisfirma            +
echo        +                                                 +
echo        +                    User-Setup                   +
echo        +                                                 +
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
echo        +    Verzeichnis "Signatures" erstellt.           +
echo        +    Verzeichnis "Templates" erstellt.            +
echo        +    Signatur Dateien kopiert.                    +
echo        +    Signatur "Allpower" als Standard definiert   +
echo        +    eMail Template kopiert.                      +
echo        +    Kürzel wird hinterlegt...                    +

::set Initials
@reg add HKCU\Software\Microsoft\Office\14.0\Common\UserInfo\ /t REG_SZ /v UserInitials /d %id%
@reg add HKCU\Software\Microsoft\Office\Common\UserInfo\ /t REG_SZ /v UserInitials /d %id%

:PRINTER
cls
echo.
echo.
echo.
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo        +                                                 +
echo        +                 A L L P O W E R                 +
echo        +            Kaufmännische Praxisfirma            +
echo        +                                                 +
echo        +                    User-Setup                   +
echo        +                                                 +
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
echo.
echo                       [A] Ricoh
echo                       [B] 2. OG HP LaserJet Pro
echo                       [C] 3. OG HP LaserJet Pro
echo                       [X] Ueberspringen
echo.
echo.

set /P c=Bitte wähle den Standarddrucker aus: 
@if /I "%c%" EQU "A" goto :RICOH
@if /I "%c%" EQU "B" goto :HP2
@if /I "%c%" EQU "C" goto :HP3
@if /I "%c%" EQU "X" goto :IExplorer

:ERROR
echo.
echo                       Bitte wähle eine gültige Option um weiterzufahren!
pause
goto PRINTER



:RICOH
@wmic printer where "name like '%RICOH%'" call setdefaultprinter
goto :IExplorer

:HP2
@wmic printer where name='2. OG - HP LaserJet Pro M201' call setdefaultprinter
goto :IExplorer

:HP3
@wmic printer where name='3. OG - HP LaserJet Pro M201' call setdefaultprinter
goto :IExplorer





:IExplorer
:: set Start & Search Page
@reg delete "HKCU\SOFTWARE\MICROSOFT\INTERNET EXPLORER\MAIN" /v "Start Page" /f
@reg delete "HKCU\SOFTWARE\MICROSOFT\INTERNET EXPLORER\MAIN" /v "Secondary Start Pages" /f
@reg delete "HKCU\SOFTWARE\MICROSOFT\INTERNET EXPLORER\MAIN" /v "Search Page" /f
@reg delete "HKCU\SOFTWARE\MICROSOFT\INTERNET EXPLORER\MAIN" /v "Start Page Redirect Cache" /f

@reg add "HKCU\SOFTWARE\MICROSOFT\INTERNET EXPLORER\MAIN" /v "Start Page"                /t REG_SZ /d "http://srv01.local/intranet/" /f
@reg add "HKCU\SOFTWARE\MICROSOFT\INTERNET EXPLORER\MAIN" /v "Secondary Start Pages"     /t REG_SZ /d "http://srv01:8000/portal" /f
@reg add "HKCU\SOFTWARE\MICROSOFT\INTERNET EXPLORER\MAIN" /v "Search Page"               /t REG_SZ /d "http://www.google.ch" /f
@reg add "HKCU\SOFTWARE\MICROSOFT\INTERNET EXPLORER\MAIN" /v "Start Page Redirect Cache" /t REG_SZ /d "http://www.google.ch" /f

cls
echo.
echo.
echo.
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo        +                                                 +
echo        +                 A L L P O W E R                 +
echo        +            Kaufmännische Praxisfirma            +
echo        +                                                 +
echo        +                    User-Setup                   +
echo        +                                                 +
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
echo        +    Verzeichnis "Signatures" erstellt.           +
echo        +    Verzeichnis "Templates" erstellt.            +
echo        +    Signatur Dateien kopiert.                    +
echo        +    Signatur "Allpower" als Standard definiert   +
echo        +    eMail Template kopiert.                      +
echo        +    Internet Explorer Startseite definiert.      +
echo.
echo.
@echo Bitte warten...
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\Allpower.txt) -replace 'Vorname', '%Vorname%' | Out-File %APPDATA%\Microsoft\Signatures\Allpower.txt"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\Allpower.txt) -replace 'Nachname', '%Nachname%' | Out-File %APPDATA%\Microsoft\Signatures\Allpower.txt"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\Allpower.txt) -replace 'Abteilung', '%Abteilung%' | Out-File %APPDATA%\Microsoft\Signatures\Allpower.txt"

@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\Allpower.htm) -replace 'Vorname', '%Vorname%' | Out-File -encoding ASCII %APPDATA%\Microsoft\Signatures\Allpower.htm"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\Allpower.htm) -replace 'Nachname', '%Nachname%' | Out-File -encoding ASCII %APPDATA%\Microsoft\Signatures\Allpower.htm"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\Allpower.htm) -replace 'Abteilung', '%Abteilung%' | Out-File -encoding ASCII %APPDATA%\Microsoft\Signatures\Allpower.htm"

cls

echo.
echo.
echo.
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo        +                                                 +
echo        +                 A L L P O W E R                 +
echo        +            Kaufmännische Praxisfirma            +
echo        +                                                 +
echo        +                                                 +
echo        +                   Vielen Dank!                  +
echo        +                                                 +
echo        +                (c) 2016 Allpower                +
echo        +                                                 +
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
echo.               Das Programm wird jetzt beendet...
echo.

@ping -n 5 127.0.0.1 > NUL

exit