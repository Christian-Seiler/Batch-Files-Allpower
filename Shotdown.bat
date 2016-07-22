:: define Log-File Name and Location
set YEAR=%DATE:~-4%
set MONTH=%DATE:~-7,2%
set log=\\srv01\Vorlagen\Logs\Log-%YEAR%-%MONTH%.txt

:: Log User
echo %DATE% %TIME% - Shutdown: %COMPUTERNAME% User: %USERNAME% > %log%

:: force Shutdown Computer
shutdown /s /f
