

####

$pathToDomains = 'X:\SERVER\Domains'
$configFileName = 'Apache_2.4-PHP_7.2-7.4_vhost.conf'


$pathToCrtForReplace = 'X:/SERVER/SSL_Current'
# ������ = '%sprogdir%/userdata/config/cert_files' # ������

####

echo "`n"
$domain=read-host '����� �����'

echo "`n"
$siteFolder=read-host '��� ����� � ������'

echo "`n" ; "========================"

$domain = $domain.Replace("*","_")
echo '����� ����� ������ * �� _ => '+$domain

echo "`n" ; "========================"

echo '������ ��������� ����� ��� SSL �����'

$FolderForSslToCreate = $pathToCrtForReplace+'/'+$domain

echo '��������� �����: '+$FolderForSslToCreate

#if (!(Test-Path $FolderForSslToCreate -PathType Container)) {
    New-Item -ItemType Directory -Force -Path $FolderForSslToCreate
    $pathToCrtForReplace = $FolderForSslToCreate
#}
echo '�������� ����������'


echo "`n" ; "========================"

$SslString_1 = 'SSLCACertificateFile     "'+$pathToCrtForReplace+'/'+$domain+'-chain.pem"'
$SslString_2 = 'SSLCertificateChainFile  "'+$pathToCrtForReplace+'/'+$domain+'-chain-only.pem"'
$SslString_3 = 'SSLCertificateFile       "'+$pathToCrtForReplace+'/'+$domain+'-crt.pem"'
$SslString_4 = 'SSLCertificateKeyFile    "'+$pathToCrtForReplace+'/'+$domain+'-key.pem"'

echo "`n" ; $SslString_1 ; $SslString_2 ; $SslString_3 ; $SslString_4

echo "`n" ; "========================"

echo "`n"
echo "��� ���������� ������� ����� �������"
$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | out-null

$FilePath = "$pathToDomains\$siteFolder\$configFileName"
echo "`n" ; $FilePath

(Get-Content $FilePath) -replace 'SSLCACertificateFile.*'    , $SslString_1 | Out-File $FilePath
(Get-Content $FilePath) -replace 'SSLCertificateChainFile.*' , $SslString_2 | Out-File $FilePath
(Get-Content $FilePath) -replace 'SSLCertificateFile.*'      , $SslString_3 | Out-File $FilePath
(Get-Content $FilePath) -replace 'SSLCertificateKeyFile.*'   , $SslString_4 | Out-File $FilePath

echo "`n"
Write-Host "��� ������ ������� ����� �������"
$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | out-null

echo "`n"
Pause
exit