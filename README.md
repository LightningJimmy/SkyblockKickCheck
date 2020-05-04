# SkyblockKickCheck
Simple checker for Hypixel Skyblock which detects server reboots and AFK kicks and gives a popup.

Works by default on Badlion Client, but you can modify the .bat file and replace "%appdata%\.minecraft\logs\blclient\minecraft\latest.log" with the location of your log file.

Checks the log every 30 seconds for "[Important] This server will restart soon: Scheduled Reboot" and "You are being transferred to the " and notifies you with a popup. However, in order to do this, the program reads though the entire log file. In order to prevent the program from reading old messages, it deletes the log after each detection. The log that was deleted is appended to latest.copy.log. Keep in mind that the latest.copy.log file is never deleted and may accumulate in size over time (1-2mb/IRL day)
