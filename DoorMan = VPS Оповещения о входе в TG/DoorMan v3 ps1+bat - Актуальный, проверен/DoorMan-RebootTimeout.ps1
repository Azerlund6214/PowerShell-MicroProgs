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
                 '/r', # ���������� ������ � ������������ ����������.
                 '/f', # �������������� �������� ���������� ���������� ��� �������������� �������������.  ��� /t >0
                 '/t'+'0' # ����� ������ ���������, ���� � ������ � �����
             )
#echo $paramsArr;
#echo @$paramsArr;

#Pause # �������
#exit

####
 
write-host "������������"

$URL_FIN = $URL_HALF + '&action='+$ACTION2
Invoke-WebRequest -Uri $URL_FIN

& 'shutdown.exe' $paramsArr

####

Pause # �������
exit
#