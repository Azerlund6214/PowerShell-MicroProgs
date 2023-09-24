#

####

$ACTION = 'RebootTimeoutStart'
$ACTION2 = 'RebootNow'

####

. 'C:/DoorMan-Vars.ps1'

####

$URL_FIN = $URL_HALF + '&action='+$ACTION

Invoke-WebRequest -Uri $URL_FIN

####

$timeSec = 60

####

do
{
   write-host $timeSec
   $timeSec--
   Start-Sleep -Seconds 1
}
until($timeSec -eq -1)

####

$paramsArr = (
                 '/r', # Завершение работы и перезагрузка компьютера.
                 '/f', # Принудительное закрытие запущенных приложений без предупреждения пользователей.  Для /t >0
                 '/t'+'0' # Будет релоад мгновенно, даже с сервом и верой
             )
#echo $paramsArr;
#echo @$paramsArr;

#Pause # Убирать
#exit

####
 
write-host "Перезагрузка"

$URL_FIN = $URL_HALF + '&action='+$ACTION2
Invoke-WebRequest -Uri $URL_FIN

& 'shutdown.exe' $paramsArr

####

Pause # Убирать
exit
#