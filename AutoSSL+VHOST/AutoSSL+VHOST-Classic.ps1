
####

$path_WebRoot = 'X:\SERVER\Domains\DEV-FOR-MAKE-SSL'
$path_pemStore= 'X:\SERVER\SSL_Current'  #'X:\SERVER\OpenServer\userdata\config\cert_files'
$path_wacsExe = 'X:\SSL=WinAcme-v2.1.20x64=Dec21\wacs.exe'

$pathToDomains = 'X:\SERVER\Domains'
$configFileName = 'Apache_2.4-PHP_7.2-7.4_vhost.conf'

####

echo "`n"
echo "========================"
echo "`n"

$domain=read-host 'Новый домен'

echo "`n"
$siteFolder=read-host 'Имя папки с сайтом'

echo "`n"
echo "========================"
echo "`n"

# #### #### ####

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
echo $paramsArr
#echo @$paramsArr

echo "`n"
echo "*** Вызов ***"

& $path_wacsExe $paramsArr

echo "*** Конец ***"
echo "`n"


# #### #### ####

echo "======================== ========================" 
echo "========================"
$blablabla=read-host 'Ввести что угодно для начала vhost'
echo "========================"
echo "======================== ========================"

# #### #### ####

$FilePath = "$pathToDomains\$siteFolder\$configFileName"

$SslString_1 = 'SSLCACertificateFile     "'+$path_pemStore+'\'+$domain+'-chain.pem"'
$SslString_2 = 'SSLCertificateChainFile  "'+$path_pemStore+'\'+$domain+'-chain-only.pem"'
$SslString_3 = 'SSLCertificateFile       "'+$path_pemStore+'\'+$domain+'-crt.pem"'
$SslString_4 = 'SSLCertificateKeyFile    "'+$path_pemStore+'\'+$domain+'-key.pem"'

echo "`n" ; $FilePath ; "`n" ; $SslString_1 ; $SslString_2 ; $SslString_3 ; $SslString_4

echo "`n"
echo "*** Замена началась ***"

(Get-Content $FilePath) -replace 'SSLCACertificateFile.*'    , $SslString_1 | Out-File $FilePath
(Get-Content $FilePath) -replace 'SSLCertificateChainFile.*' , $SslString_2 | Out-File $FilePath
(Get-Content $FilePath) -replace 'SSLCertificateFile.*'      , $SslString_3 | Out-File $FilePath
(Get-Content $FilePath) -replace 'SSLCertificateKeyFile.*'   , $SslString_4 | Out-File $FilePath

echo "*** Замена кончилась ***"
echo "`n"

# #### #### ####

echo "======================== ========================"
echo "========================"
$blablabla=read-host 'Для выхода ввести что угодно'


# #### #### ####