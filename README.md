# SkyblockKickCheck
Simple checker for Hypixel Skyblock which detects server reboots and AFK kicks and gives a popup.

Works by default on Badlion Client, but you can modify the .bat file and replace "%appdata%\.minecraft\logs\blclient\minecraft\latest.log" with the location of your log file.

Checks the log every 30 seconds for "[Important] This server will restart soon: Scheduled Reboot" and "You are being transferred to the " and notifies you with a popup. 

It works by creating a copy of the Minecraft client log at the launch of this program, then finds the new lines since the start of the program by removing the copy from the latest.log, creating a new log called compare.log. The programs searches for chat log signifying a user has been kicked, and once it finds an instance, it creates a popup. Upon accepting the popup, the program recopies the launcher log in order to prevent a popup from being launched based on the old instance of being kicked.
