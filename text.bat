setlocal
set runState=user
whoami /groups | findstr /b /c:"Mandatory Label\\High Mandatory Level" > nul && set runState=admin
whoami /groups | findstr /b /c:"Mandatory Label\\System Mandatory Level" > nul && set runState=system
echo Running in state: "%runState%"
if not "%runState%"=="user" goto notUser
  echo Do user stuff...
  goto end
:notUser
if not "%runState%"=="admin" goto notAdmin
  echo Do admin stuff...
  goto end
:notAdmin
if not "%runState%"=="system" goto notSystem
  echo Do admin stuff...
  goto end
:notSystem
echo Do common stuff...
:end
