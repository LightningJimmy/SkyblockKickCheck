@echo off
type "%appdata%\.minecraft\logs\blclient\minecraft\latest.log" > "%appdata%\.minecraft\logs\blclient\minecraft\latest.copy.log"

:afkcheck
type "%appdata%\.minecraft\logs\blclient\minecraft\latest.log" | findstr /lvg:"%appdata%\.minecraft\logs\blclient\minecraft\latest.copy.log" > "%appdata%\.minecraft\logs\blclient\minecraft\compare.log"

echo Last time checked:
time /T
>nul find "[Important] This server will restart soon:" "%appdata%\.minecraft\logs\blclient\minecraft\compare.log" && (
  start "" /wait cmd /c "time /T&echo Server Reboot! Time to reconnect!&echo(&pause"
  type "%appdata%\.minecraft\logs\blclient\minecraft\latest.log" > "%appdata%\.minecraft\logs\blclient\minecraft\latest.copy.log"
  echo Log copied to latest.copy.log
) || (
  echo No server reboot
)

>nul find "You are being transferred to the " "%appdata%\.minecraft\logs\blclient\minecraft\compare.log" && (
  start "" /wait cmd /c "time /T&echo AFK kicked! Time to reconnect!&echo(&pause"
  type "%appdata%\.minecraft\logs\blclient\minecraft\latest.log" > "%appdata%\.minecraft\logs\blclient\minecraft\latest.copy.log"
  echo Log copied to latest.copy.log
) || (
  echo Not AFK
)

timeout /t 30
cls
goto afkcheck
