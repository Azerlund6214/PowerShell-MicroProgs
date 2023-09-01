

####

$pathToDomains = 'X:\SERVER\Domains'
$path_pemStore = 'X:\SERVER\SSL_Current'  #'X:\SERVER\OpenServer\userdata\config\cert_files' '%sprogdir%/userdata/config/cert_files/'
$configFileName = 'Apache_2.4-PHP_7.2-7.4_vhost.conf'

####

echo "`n"
$domain=read-host 'Новый домен'

echo "`n"
$siteFolder=read-host 'Имя папки с сайтом'

echo "`n" ; "========================"

$SslString_1 = 'SSLCACertificateFile     "'+$path_pemStore+'\'+$domain+'-chain.pem"'
$SslString_2 = 'SSLCertificateChainFile  "'+$path_pemStore+'\'+$domain+'-chain-only.pem"'
$SslString_3 = 'SSLCertificateFile       "'+$path_pemStore+'\'+$domain+'-crt.pem"'
$SslString_4 = 'SSLCertificateKeyFile    "'+$path_pemStore+'\'+$domain+'-key.pem"'

echo "`n" ; $SslString_1 ; $SslString_2 ; $SslString_3 ; $SslString_4

$FilePath = "$pathToDomains\$siteFolder\$configFileName"
echo "`n" ; $FilePath

echo "`n"
echo "Для исполнения нажмите любую клавишу"
$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | out-null

(Get-Content $FilePath) -replace 'SSLCACertificateFile.*'    , $SslString_1 | Out-File $FilePath
(Get-Content $FilePath) -replace 'SSLCertificateChainFile.*' , $SslString_2 | Out-File $FilePath
(Get-Content $FilePath) -replace 'SSLCertificateFile.*'      , $SslString_3 | Out-File $FilePath
(Get-Content $FilePath) -replace 'SSLCertificateKeyFile.*'   , $SslString_4 | Out-File $FilePath

echo "`n"
Write-Host "Для выхода нажмите любую клавишу"
$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | out-null

echo "`n"
Pause
exit