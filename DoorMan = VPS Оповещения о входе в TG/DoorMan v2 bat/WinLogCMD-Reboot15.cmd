@echo off

powershell.exe -noprofile -command "Invoke-WebRequest -Uri http://site.fun/?data=tok321_DedicName:123123@NOTE:Reboot-15s"
shutdown.exe /r /t 15

exit