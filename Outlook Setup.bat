@echo off
@title ALLPOWER / User-Setup
@net use v: \\srv01\Vorlagen
:Start
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
echo        +                      v 0.2                      +
echo        +                                                 +
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
echo.
echo Bitte Personalien festlegen.
echo.
@set /P Vorname=Vorname:   
@set /P Nachname=Nachname:  
@set /P Abteilung=Abteilung: 



:VERZEICHNIS1
@IF exist %APPDATA%\Microsoft\Signatures\ GOTO SIGNATURE
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
@sleep 5
cls

:SIGNATURE
:: copy Outlook

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

:Allpower
@robocopy v:\Neuinstallation\Outlook\Signatures\Allpower %APPDATA%\Microsoft\Signatures\ /E
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
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\Allpower.txt) -replace 'Vorname', '%Vorname%' | Out-File %APPDATA%\Microsoft\Signatures\Allpower.txt"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\Allpower.txt) -replace 'Nachname', '%Nachname%' | Out-File %APPDATA%\Microsoft\Signatures\Allpower.txt"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\Allpower.txt) -replace 'Abteilung', '%Abteilung%' | Out-File %APPDATA%\Microsoft\Signatures\Allpower.txt"

@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\Allpower.htm) -replace 'Vorname', '%Vorname%' | Out-File -encoding ASCII %APPDATA%\Microsoft\Signatures\Allpower.htm"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\Allpower.htm) -replace 'Nachname', '%Nachname%' | Out-File -encoding ASCII %APPDATA%\Microsoft\Signatures\Allpower.htm"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\Allpower.htm) -replace 'Abteilung', '%Abteilung%' | Out-File -encoding ASCII %APPDATA%\Microsoft\Signatures\Allpower.htm"
goto :Personalize

:Info
@robocopy v:\Neuinstallation\Outlook\Signatures\Info %APPDATA%\Microsoft\Signatures\ /E
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
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\info.txt) -replace 'Vorname', '%Vorname%' | Out-File %APPDATA%\Microsoft\Signatures\info.txt"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\info.txt) -replace 'Nachname', '%Nachname%' | Out-File %APPDATA%\Microsoft\Signatures\info.txt"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\info.txt) -replace 'Abteilung', '%Abteilung%' | Out-File %APPDATA%\Microsoft\Signatures\info.txt"

@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\info.htm) -replace 'Vorname', '%Vorname%' | Out-File -encoding ASCII %APPDATA%\Microsoft\Signatures\info.htm"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\info.htm) -replace 'Nachname', '%Nachname%' | Out-File -encoding ASCII %APPDATA%\Microsoft\Signatures\info.htm"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\info.htm) -replace 'Abteilung', '%Abteilung%' | Out-File -encoding ASCII %APPDATA%\Microsoft\Signatures\info.htm"
goto :Personalize

:Sales
@robocopy v:\Neuinstallation\Outlook\Signatures\Sales %APPDATA%\Microsoft\Signatures\ /E
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
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\sales.txt) -replace 'Vorname', '%Vorname%' | Out-File %APPDATA%\Microsoft\Signatures\sales.txt"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\sales.txt) -replace 'Nachname', '%Nachname%' | Out-File %APPDATA%\Microsoft\Signatures\sales.txt"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\sales.txt) -replace 'Abteilung', '%Abteilung%' | Out-File %APPDATA%\Microsoft\Signatures\sales.txt"

@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\sales.htm) -replace 'Vorname', '%Vorname%' | Out-File -encoding ASCII %APPDATA%\Microsoft\Signatures\sales.htm"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\sales.htm) -replace 'Nachname', '%Nachname%' | Out-File -encoding ASCII %APPDATA%\Microsoft\Signatures\sales.htm"
@powershell -Command "(gc %APPDATA%\Microsoft\Signatures\sales.htm) -replace 'Abteilung', '%Abteilung%' | Out-File -encoding ASCII %APPDATA%\Microsoft\Signatures\sales.htm"
goto :Personalize

:Personalize
sleep 2
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
@sleep 2
echo.
echo.
@set /P Template=Möchten Sie eine weitere Signatur einrichten? (Y/N): 
if /I "%Template%" EQU "Y" goto :Start
if /I "%Template%" EQU "N" goto :Verzeichnis2

:VERZEICHNIS2
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
echo        +                  Outlook-Setup                  +
echo        +                                                 +
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
echo        +    Verzeichnis "Templates" wurde erstellt.      +
@sleep 5
cls

:SIGNATURE
:: copy Outlook

echo Bitte Template-Vorlage eingeben:
echo                       [B] Buchhaltung
echo                       [S] Sales
echo                       [X] Ueberspringen
echo.
@set /P Template=Eingabe: 
if /I "%Template%" EQU "B" copy v:\Neuinstallation\Outlook\Templates\NormalEmail_Buchhaltung.dotm %APPDATA%\Microsoft\Templates\NormalEmail.dotm
if /I "%Template%" EQU "S" copy v:\Neuinstallation\Outlook\Templates\NormalEmail_Verkauf.dotm %APPDATA%\Microsoft\Templates\NormalEmail.dotm
if /I "%Template%" EQU "X" goto :END

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
echo        +    Template wurde installiert.                  +
@sleep 5

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
echo        +                (c) 2016 Allpower                +
echo        +                                                 +
echo        +++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
echo.               Das Programm wird jetzt beendet...
echo.
pause
exit