CHCP 1252
:: Only display the command output on screen
@echo off
:: Set the window title
@title ALLPOWER / User-Setup
:: Set Version No.
set "version=v 1.0"
:: Set current year
set YEAR=%DATE:~-4%
:: Determines from where the Program is run
:: It run from Drive C:/ jump to the Point ":START"
:: If the Program is run from a Network Drive, the program is copied
:: to the Desktop and starts again from there.
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
echo        +                      %version%                      +
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
echo        +                      %version%                      +
echo        +                                                 +
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
echo.
echo        Bitte Personalien festlegen.
echo.

:: Set the Variables of the User
@set /P   Vorname=        Vorname:   
@set /P  Nachname=        Nachname:  
@set /p        id=        Kuerzel:   
@set /P Abteilung=        Abteilung: 

:VERZEICHNIS1
:: Integrates the Folder \\srv01\Vorlagen as Network Drive V:/
@net use v: \\srv01\Vorlagen

:: If the Folder Signatures exists, skip this step
:: else create that Folder
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
:: If the Folder Templates exists, skip this step
:: else create that Folder
@IF exist %APPDATA%\Microsoft\Templates\ GOTO SIGNATURE
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

:SIGNATURE
:: Copy the Folder Allpower to Signatures
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

:: Set the Signature "Allpower" as default Signature for New Mails as well as Replies
@reg delete "HKCU\Software\Microsoft\Office\14.0\Outlook\Setup"    /v First-Run /f
@reg add "HKCU\Software\Microsoft\Office\14.0\Common\MailSettings" /t REG_EXPAND_SZ /v NewSignature /d Allpower
@reg add "HKCU\Software\Microsoft\Office\14.0\Common\MailSettings" /t REG_EXPAND_SZ /v ReplySignature /d Allpower
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

:TEMPLATE
:: Select the template to be choosen as NormalEmail.dotm
echo Bitte Abteilung eingeben:
echo                       [V] Verkauf
echo                       [B] Buchhaltung
echo                           Enter zum Überspringen
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

:: Set Initials (Kürzel) for MS Office
@reg add "HKCU\Software\Microsoft\Office\14.0\Common\UserInfo" /t REG_SZ /v UserInitials /d %id%
@reg add "HKCU\Software\Microsoft\Office\Common\UserInfo"      /t REG_SZ /v UserInitials /d %id%

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
echo                       [A] RICOH
echo                       [B] 2. OG HP LaserJet Pro
echo                       [C] 3. OG HP LaserJet Pro
echo                       [X] Ueberspringen
echo.
echo.

:: Select the default printer
set /P c=Bitte wähle den Standarddrucker aus: 
@if /I "%c%" EQU "A" goto :RICOH
@if /I "%c%" EQU "B" goto :HP2
@if /I "%c%" EQU "C" goto :HP3
@if /I "%c%" EQU "X" goto :IExplorer

:ERROR
:: If a false entry was made, rerun :PRINTER
echo.
echo                       Bitte wähle eine gültige Option um weiterzufahren!
pause
goto PRINTER

:RICOH
:: Configure "RICOH" to be default printer 
@wmic printer where "name like '%RICOH%'" call setdefaultprinter
goto :IExplorer

:HP2
:: Configure "2. OG HP LaserJet Pro" to be default printer
@wmic printer where name='2. OG - HP LaserJet Pro M201' call setdefaultprinter
goto :IExplorer

:HP3
:: Configure "3. OG HP LaserJet Pro" to be default printer
@wmic printer where name='3. OG - HP LaserJet Pro M201' call setdefaultprinter
goto :IExplorer

:IExplorer
:: Set Start & Search Page
@reg delete "HKCU\SOFTWARE\MICROSOFT\INTERNET EXPLORER\MAIN"     /v "Start Page" /f
@reg delete "HKCU\SOFTWARE\MICROSOFT\INTERNET EXPLORER\MAIN"     /v "Secondary Start Pages" /f
@reg delete "HKCU\SOFTWARE\MICROSOFT\INTERNET EXPLORER\MAIN"     /v "Search Page" /f
@reg delete "HKCU\SOFTWARE\MICROSOFT\INTERNET EXPLORER\MAIN"     /v "Start Page Redirect Cache" /f

@reg add "HKCU\SOFTWARE\MICROSOFT\INTERNET EXPLORER\MAIN"        /v "Start Page"                /t REG_SZ /d "http://srv01.local/intranet/" /f
@reg add "HKCU\SOFTWARE\MICROSOFT\INTERNET EXPLORER\MAIN"        /v "Secondary Start Pages"     /t REG_SZ /d "http://srv01:8000/portal" /f
@reg add "HKCU\SOFTWARE\MICROSOFT\INTERNET EXPLORER\MAIN"        /v "Search Page"               /t REG_SZ /d "http://www.google.ch" /f
@reg add "HKCU\SOFTWARE\MICROSOFT\INTERNET EXPLORER\MAIN"        /v "Start Page Redirect Cache" /t REG_SZ /d "http://www.google.ch" /f

reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes" /v "DefaultScope"              /t REG_SZ /d "{546B185A-1BFF-4A0F-8C63-C193F4C20A6B}" /f
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\{546B185A-1BFF-4A0F-8C63-C193F4C20A6B}" /v "DisplayName"    /t REG_SZ /d "Google" /F
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\{546B185A-1BFF-4A0F-8C63-C193F4C20A6B}" /v "OSDFileURL"     /t REG_SZ /d "https://www.microsoft.com/en-us/IEGallery/GoogleAddOns" /f
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\{546B185A-1BFF-4A0F-8C63-C193F4C20A6B}" /v "FaviconURL"     /t REG_SZ /d "https://www.google.com/favicon.ico" /f
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\{546B185A-1BFF-4A0F-8C63-C193F4C20A6B}" /v "ShowSearchSuggestions" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\{546B185A-1BFF-4A0F-8C63-C193F4C20A6B}" /v "URL"            /t REG_SZ /d "https://www.google.com/search?q={searchTerms}&sourceid=ie7&rls=com.microsoft:{language}:{referrer:source}&ie={inputEncoding?}&oe={outputEncoding?}" /f
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\{546B185A-1BFF-4A0F-8C63-C193F4C20A6B}" /v "SuggestionsURL" /t REG_SZ /d "https://www.google.com/complete/search?q={searchTerms}&client=ie8&mw={ie:maxWidth}&sh={ie:sectionHeight}&rh={ie:rowHeight}&inputencoding={inputEncoding}&outputencoding={outputEncoding}" /f



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
@echo Bin dabei die Signatur zu konfiguriert...
:: Search and Replace the Strings "Vorname", Nachname" and "Abteilung" with its
:: corresponding Variables
:: This takes a few seconds...
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
echo        +                (c) %YEAR% Allpower                +
echo        +                                                 +
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
echo.               Das Programm wird jetzt beendet...
echo.
:: Done
:: The .bat-File on the Desktop can now be deleted.
@ping -n 5 127.0.0.1 > NUL
:: Self-destroy the .bat-File
(goto) 2>nul & del "%~f0" & EXIT
