{\rtf1\ansi\ansicpg1252\cocoartf1404\cocoasubrtf470
{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red27\green29\blue31;\red235\green236\blue237;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs26 \cf2 \cb3 \expnd0\expndtw0\kerning0
setlocal\
set runState=user\
whoami /groups | findstr /b /c:"Mandatory Label\\High Mandatory Level" > nul && set runState=admin\
whoami /groups | findstr /b /c:"Mandatory Label\\System Mandatory Level" > nul && set runState=system\
echo Running in state: "%runState%"\
if not "%runState%"=="user" goto notUser\
  echo Do user stuff...\
  goto end\
:notUser\
if not "%runState%"=="admin" goto notAdmin\
  echo Do admin stuff...\
  goto end\
:notAdmin\
if not "%runState%"=="system" goto notSystem\
  echo Do admin stuff...\
  goto end\
:notSystem\
echo Do common stuff...\
:end}