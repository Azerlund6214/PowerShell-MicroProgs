@echo off

shutdown.exe /a
powershell.exe -noprofile -command "Invoke-WebRequest -Uri http://site.fun/?data=tok321_DedicName:123123@NOTE:Reboot-Abort"

exit