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
                 '/r', # ���������� ������ � ������������ ����������.
                 '/f', # �������������� �������� ���������� ���������� ��� �������������� �������������.  ��� /t >0
                 '/t'+'0' # ����� ������ ���������, ���� � ������ � �����
             )

####

& 'shutdown.exe' $paramsArr

####

Pause # �������
exit
#