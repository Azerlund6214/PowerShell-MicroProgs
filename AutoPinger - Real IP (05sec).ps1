# 230123  �� ������� �� 15���

$timeWait = 5 #
#$timeWait = read-host '�������� ������, ������'

$maxIters = 1000 #
$target = 'https://api.myip.com/' # {"ip":"172.104.123.198","country":"Japan","cc":"JP"}
#$target = 'http://api.ipify.org/' # 172.104.123.198
#$target = 'https://ip4.seeip.org' # 172.104.123.198

$i = 1
do
{
	$WebResponseObj = Invoke-WebRequest -Uri $target
    write-host "### " $i " ###    ==>   " $WebResponseObj.content 
	Start-Sleep -Seconds $timeWait # �����
	$i++
}
until($i -eq $maxIters+1)

write-host "����� ��������"

pause