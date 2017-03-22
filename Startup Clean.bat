@echo off

' File must be saved at %appdata%\microsoft\windows\start menu\programs\startup\cleanup.bat

' Löscht Temp Ordner
rmdir %temp% /f /s /q
md %temp%

' Löscht UserProfile Dateien
del %UserProfile%\*\* /f /s /q




' setdefaultprinter
' wmic printer where "name like '%RICOH%'" call setdefaultprinter