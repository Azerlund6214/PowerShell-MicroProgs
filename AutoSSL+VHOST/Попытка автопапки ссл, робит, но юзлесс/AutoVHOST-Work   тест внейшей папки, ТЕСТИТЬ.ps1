

####

$pathToDomains = 'X:\SERVER\Domains'
$configFileName = 'Apache_2.4-PHP_7.2-7.4_vhost.conf'


$pathToCrtForReplace = 'X:/SERVER/SSL_Current'
# Дефолт = '%sprogdir%/userdata/config/cert_files' # Дефолт

####

echo "`n"
$domain=read-host 'Новый домен'

echo "`n"
$siteFolder=read-host 'Имя папки с сайтом'

echo "`n" ; "========================"

$domain = $domain.Replace("*","_")
echo 'Домен после замены * на _ => '+$domain

echo "`n" ; "========================"

echo 'Создаю отдельную папку под SSL сайта'

$FolderForSslToCreate = $pathToCrtForReplace+'/'+$domain

echo 'Создается папка: '+$FolderForSslToCreate

#if (!(Test-Path $FolderForSslToCreate -PathType Container)) {
    New-Item -ItemType Directory -Force -Path $FolderForSslToCreate
    $pathToCrtForReplace = $FolderForSslToCreate
#}
echo 'Создание отработало'


echo "`n" ; "========================"

$SslString_1 = 'SSLCACertificateFile     "'+$pathToCrtForReplace+'/'+$domain+'-chain.pem"'
$SslString_2 = 'SSLCertificateChainFile  "'+$pathToCrtForReplace+'/'+$domain+'-chain-only.pem"'
$SslString_3 = 'SSLCertificateFile       "'+$pathToCrtForReplace+'/'+$domain+'-crt.pem"'
$SslString_4 = 'SSLCertificateKeyFile    "'+$pathToCrtForReplace+'/'+$domain+'-key.pem"'

echo "`n" ; $SslString_1 ; $SslString_2 ; $SslString_3 ; $SslString_4

echo "`n" ; "========================"

echo "`n"
echo "Для исполнения нажмите любую клавишу"
$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | out-null

$FilePath = "$pathToDomains\$siteFolder\$configFileName"
echo "`n" ; $FilePath

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