#

####

$ACTION = 'Alive'

####

. 'C:/DoorMan-Vars.ps1'

####

$URL_FIN = $URL_HALF + '&action='+$ACTION

Invoke-WebRequest -Uri $URL_FIN

####

#