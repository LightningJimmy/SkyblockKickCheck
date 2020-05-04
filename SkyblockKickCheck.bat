@echo off
:afkcheck
echo Last time checked:
time /T
>nul find "[Important] This server will restart soon: Scheduled Reboot" "%appdata%\.minecraft\logs\blclient\minecraft\latest.log" && (
  start "" /wait cmd /c "echo Server Reboot! Time to reconnect!&echo(&pause"
  type "%appdata%\.minecraft\logs\blclient\minecraft\latest.log" >> "%appdata%\.minecraft\logs\blclient\minecraft\latest.copy.log"
  echo Log copied to latest.copy.log
  del "%appdata%\.minecraft\logs\blclient\minecraft\latest.log"
  echo latest.log deleted
) || (
  echo No server reboot
)

>nul find "You are being transferred to the " "%appdata%\.minecraft\logs\blclient\minecraft\latest.log" && (
  start "" /wait cmd /c "echo AFK kicked! Time to reconnect!&echo(&pause"
  type "%appdata%\.minecraft\logs\blclient\minecraft\latest.log" >> "%appdata%\.minecraft\logs\blclient\minecraft\latest.copy.log"
  echo Log copied to latest.copy.log
  del "%appdata%\.minecraft\logs\blclient\minecraft\latest.log"
  echo latest.log deleted
) || (
  echo Not AFK
)

timeout /t 30
cls
goto afkcheck
