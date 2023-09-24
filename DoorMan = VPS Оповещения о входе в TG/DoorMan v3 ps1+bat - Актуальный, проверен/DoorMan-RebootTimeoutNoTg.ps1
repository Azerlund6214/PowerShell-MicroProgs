#

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

####

& 'shutdown.exe' $paramsArr

####

Pause # Убирать
exit
#