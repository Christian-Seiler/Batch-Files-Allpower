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
echo Bitte Personalien festlegen.
echo.

:: Set the Variables of the User
@set /P Vorname=Vorname:   
@set /P Nachname=Nachname:  
@set /P Abteilung=Abteilung: 

:VERZEICHNIS1
:: If the Folder Signatures exists, skip this step
:: else create that Folder
@IF exist %APPDATA%\Microsoft\Signatures\ GOTO :SIGNATURE
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
echo        +                  Outlook-Setup                  +
echo        +                                                 +
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
echo        +    Verzeichnis "Signatures" wurde erstellt.     +

:SIGNATURE
:: Select which Signature should be set up
echo Bitte Signatur-Vorlage eingeben:
echo                       [A] Allpower
echo                       [I] Info
echo                       [S] Sales
echo                       [X] Ueberspringen
echo.
@set /P Template=Eingabe: 
if /I "%Template%" EQU "A" goto :Allpower
if /I "%Template%" EQU "I" goto :Info
if /I "%Template%" EQU "S" goto :Sales
if /I "%Template%" EQU "X" goto :Verzeichnis2

:ALLPOWER
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
echo        +                  Outlook-Setup                  +
echo        +                                                 +
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
echo        +    Verzeichnis "Signatures" wurde erstellt.     +
echo        +    Signatur Dateien wurden kopiert.             +
@echo Bitte warten...
@echo Bin dabei die Signatur "Allpower" zu konfiguriert...
:: Search and Replace the Strings "Vorname", Nachname" and "Abteilung" with its
:: corresponding Variables
:: This takes a few seconds...
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\Allpower.txt) -replace 'Vorname', '%Vorname%' | Out-File %APPDATA%\Microsoft\Signatures\Allpower.txt"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\Allpower.txt) -replace 'Nachname', '%Nachname%' | Out-File %APPDATA%\Microsoft\Signatures\Allpower.txt"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\Allpower.txt) -replace 'Abteilung', '%Abteilung%' | Out-File %APPDATA%\Microsoft\Signatures\Allpower.txt"

@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\Allpower.htm) -replace 'Vorname', '%Vorname%' | Out-File -encoding ASCII %APPDATA%\Microsoft\Signatures\Allpower.htm"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\Allpower.htm) -replace 'Nachname', '%Nachname%' | Out-File -encoding ASCII %APPDATA%\Microsoft\Signatures\Allpower.htm"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\Allpower.htm) -replace 'Abteilung', '%Abteilung%' | Out-File -encoding ASCII %APPDATA%\Microsoft\Signatures\Allpower.htm"
goto :PERSONALIZE

:INFO
:: Copy the Folder INFO to Signatures
@robocopy v:\Neuinstallation\Outlook\Signatures\INFO\ %APPDATA%\Microsoft\Signatures\ /E
cls
echo.
echo.
echo.
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo        +                                                 +
echo        +                 A L L P O W E R                 +
echo        +            Kaufmännische Praxisfirma            +
echo        +                                                 +
echo        +                  Outlook-Setup                  +
echo        +                                                 +
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
echo        +    Verzeichnis "Signatures" wurde erstellt.     +
echo        +    Signatur Dateien wurden kopiert.             +
@echo Bitte warten...
@echo Bin dabei die Signatur "Info" zu konfiguriert...
:: Search and Replace the Strings "Vorname", Nachname" and "Abteilung" with its
:: corresponding Variables
:: This takes a few seconds...
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\info.txt) -replace 'Vorname', '%Vorname%' | Out-File %APPDATA%\Microsoft\Signatures\info.txt"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\info.txt) -replace 'Nachname', '%Nachname%' | Out-File %APPDATA%\Microsoft\Signatures\info.txt"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\info.txt) -replace 'Abteilung', '%Abteilung%' | Out-File %APPDATA%\Microsoft\Signatures\info.txt"

@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\info.htm) -replace 'Vorname', '%Vorname%' | Out-File -encoding ASCII %APPDATA%\Microsoft\Signatures\info.htm"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\info.htm) -replace 'Nachname', '%Nachname%' | Out-File -encoding ASCII %APPDATA%\Microsoft\Signatures\info.htm"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\info.htm) -replace 'Abteilung', '%Abteilung%' | Out-File -encoding ASCII %APPDATA%\Microsoft\Signatures\info.htm"
goto :PERSONALIZE

:SALES
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
echo        +                  Outlook-Setup                  +
echo        +                                                 +
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
echo        +    Verzeichnis "Signatures" wurde erstellt.     +
echo        +    Signatur Dateien wurden kopiert.             +
@echo Bitte warten...
@echo Bin dabei die Signatur "Sales" zu konfiguriert...
:: Search and Replace the Strings "Vorname", Nachname" and "Abteilung" with its
:: corresponding Variables
:: This takes a few seconds...
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\sales.txt) -replace 'Vorname', '%Vorname%' | Out-File %APPDATA%\Microsoft\Signatures\sales.txt"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\sales.txt) -replace 'Nachname', '%Nachname%' | Out-File %APPDATA%\Microsoft\Signatures\sales.txt"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\sales.txt) -replace 'Abteilung', '%Abteilung%' | Out-File %APPDATA%\Microsoft\Signatures\sales.txt"

@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\sales.htm) -replace 'Vorname', '%Vorname%' | Out-File -encoding ASCII %APPDATA%\Microsoft\Signatures\sales.htm"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\sales.htm) -replace 'Nachname', '%Nachname%' | Out-File -encoding ASCII %APPDATA%\Microsoft\Signatures\sales.htm"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\sales.htm) -replace 'Abteilung', '%Abteilung%' | Out-File -encoding ASCII %APPDATA%\Microsoft\Signatures\sales.htm"
goto :PERSONALIZE

:PERSONALIZE
cls
echo.
echo.
echo.
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo        +                                                 +
echo        +                 A L L P O W E R                 +
echo        +            Kaufmännische Praxisfirma            +
echo        +                                                 +
echo        +                  Outlook-Setup                  +
echo        +                                                 +
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
echo        +    Verzeichnis "Signatures" wurde erstellt.     +
echo        +    Signatur Dateien wurden kopiert.             +
echo        +    Signatur wurde Personalisiert.               +
echo.
echo.
:: To set up another Signature, go back to :START
:: Continue go to :VERZEICHNIS2 
@set /P Template=Möchten Sie eine weitere Signatur einrichten? (Y/N): 
if /I "%Template%" EQU "Y" goto :START
if /I "%Template%" EQU "N" goto :VERZEICHNIS2

:VERZEICHNIS2
:: If the Folder Templates exists, skip this step
:: else create that Folder
@IF exist %APPDATA%\Microsoft\Templates\ GOTO :TEMPLATE
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
echo        +                  Outlook-Setup                  +
echo        +                                                 +
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
echo        +    Verzeichnis "Templates" wurde erstellt.      +

:TEMPLATE
:: Select the template to be choosen as NormalEmail.dotm
echo Bitte Template-Vorlage eingeben:
echo                       [B] Buchhaltung
echo                       [S] Sales
echo                           Enter zum Ueberspringen
echo.
@set /P Template=Eingabe: 
if /I "%Template%" EQU "B" copy v:\Neuinstallation\Outlook\Templates\NormalEmail_Buchhaltung.dotm %APPDATA%\Microsoft\Templates\NormalEmail.dotm
if /I "%Template%" EQU "S" copy v:\Neuinstallation\Outlook\Templates\NormalEmail_Verkauf.dotm %APPDATA%\Microsoft\Templates\NormalEmail.dotm

:END
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
