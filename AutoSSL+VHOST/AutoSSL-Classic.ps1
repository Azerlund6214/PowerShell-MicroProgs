
####

$path_WebRoot = 'X:\SERVER\Domains\DEV-FOR-MAKE-SSL'
$path_pemStore= 'X:\SERVER\SSL_Current'  #'X:\SERVER\OpenServer\userdata\config\cert_files'
$path_wacsExe = 'X:\SSL=WinAcme-v2.1.20x64=Dec21\wacs.exe'

####

echo "`n"
$domain=read-host '����� �����'

echo "`n" ; "========================"


$paramsArr = @(
'--source',
'manual',
'--host'+$domain,
'--validation',
'filesystem',
'--webroot',
$path_WebRoot,
'--store',
'pemfiles',
'--pemfilespath',
$path_pemStore
)
#echo $paramsArr
echo @$paramsArr


Write-Host "������ ����� �����... ��� �������"
$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | out-null

& $path_wacsExe $paramsArr


# --source manual --host %host% --validation filesystem --webroot "%webroot%" --store pemfiles --pemfilespath %pemstore%


Write-Host "��� ������ ������� ����� �������"
$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | out-null

