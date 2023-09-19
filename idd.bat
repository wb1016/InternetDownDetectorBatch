@echo off

:START
@set /a OFFLINE = 0
@set /a STATUS = 0

ping 1.1.1.1 -w 20000 -n 3 | find "TTL" >nul 2>&1 && (set /a OFFLINE = 0) || (set /a OFFLINE = 1)

if %OFFLINE% == 0 (
  echo target online
  color 2f
)

if %OFFLINE% == 1 (
  echo target offline
  color 4f
  echo offline >> ping.txt
  Time /t >> ping.txt
)

timeout /t 40
GOTO START