# 291221

Write-Host "Для начала нажмите любую клавишу"
$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | out-null
# Либо
Pause
# Либо
Read-Host -Prompt "Press Enter to exit"

sleep 5  # Хз
Start-Sleep -Seconds 1 # Робит


$FilePath = "$pathToDomains $siteFolder$configFileName" # Как в пхп
$var_1 = 'SSLCAC' + $domain + 'сhain.pem"' # Склейка

$paramsArr = (
				'manual',
				'host'+$domain,
				$domain,
				)
echo $paramsArr
echo @$paramsArr # Вроде в 1 строчку

# Обратный отсчет
do
{
   write-host $timeSec
   $timeSec--
   Start-Sleep -Seconds 1
}
until($timeSec -eq -1)


$WebResponseObj = Invoke-WebRequest -Uri $target
write-host "HTML=" $WebResponseObj.content 



$maxIters = 1000 #
$i = 1
do
{
    write-host "### " $i " ###    ==>   "
	# ...
	$i++
}
until($i -eq $maxIters+1)


# !!!! Аналог инклуда. Обязательно точка.
# https://stackoverflow.com/questions/27138483/how-can-i-re-use-import-script-code-in-powershell-scripts
. 'S:/vars.ps1'

if (!(Test-Path $FolderForSslToCreate -PathType Container)) {  # Проверить существование
    New-Item -ItemType Directory -Force -Path $FolderForSslToCreate  # Создать папку
}

$domainEkran = $domain.Replace("*","_")  # Замена * на _ -> Возможно меняет и основную переменную,через ссылку.

Get-ChildItem Env:CLIENTNAME
Get-ChildItem Env: # Вывести все ENV
echo $env:windir

# Пустая строка
echo "`n"
echo ""
echo "" ; "" ; ""


# Вывод в коноль, разница-хз.
echo 'Новый домен:'
Write-Host "Сейчас будет вызов"

# Получение ввода из консоли.
$domain=read-host
$domain=read-host 'Блабла'    # Он сам подставит :


$domain=read-host 'Блабла' -AsSecureString  # Для паролей и тд, потом надо отдельно преобразовывать в текст
[Runtime.InteropServices.Marshal]::PtrToStringAuto(    [Runtime.InteropServices.Marshal]::SecureStringToBSTR($pass)  )


# ##############################################

(Get-Content $FilePath) -replace 'SSLCertificateKeyFile.*'   , $SslString_4 | Out-File $FilePath
# Как было =(Get-Content $FilePath) -replace 'password=.*','password="YOUR TEXT"' | Out-File $FilePath

# Вызов файла с парам
& '.../123.exe' @$paramsArr
# Еще 10+ способов https://social.technet.microsoft.com/wiki/contents/articles/7703.powershell-running-executables.aspx


# Решение получения имени пк рдп,  робит = https://docs.microsoft.com/en-us/answers/questions/316984/clientame-environment-variable-from-rdp-missing.html

# https://windowsnotes.ru/powershell-2/powershell-i-kavychki/
# https://codernotes.ru/articles/powershell/zapusk-skriptov-powershell.html

# https://stackoverflow.com/questions/9362722/stop-powershell-from-exiting


#