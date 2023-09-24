#

####


####

$ENV_USER    = $env:USERNAME
$ENV_DOMAIN  = $env:LOGONSERVER
$ENV_RDPSESS = $env:SESSIONNAME

$sessionID = (Get-Process -PID $pid).SessionID
$path = "HKCU:\Volatile Environment\" + $sessionID
$ENV_CLIENT = (Get-ItemProperty -path ($path) -name "CLIENTNAME").CLIENTNAME

####


####

#