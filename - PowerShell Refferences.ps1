# 291221

Write-Host "��� ������ ������� ����� �������"
$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | out-null
# ����
Pause
# ����
Read-Host -Prompt "Press Enter to exit"

sleep 5  # ��
Start-Sleep -Seconds 1 # �����


$FilePath = "$pathToDomains $siteFolder$configFileName" # ��� � ���
$var_1 = 'SSLCAC' + $domain + '�hain.pem"' # �������

$paramsArr = (
				'manual',
				'host'+$domain,
				$domain,
				)
echo $paramsArr
echo @$paramsArr # ����� � 1 �������

# �������� ������
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


# !!!! ������ �������. ����������� �����.
# https://stackoverflow.com/questions/27138483/how-can-i-re-use-import-script-code-in-powershell-scripts
. 'S:/vars.ps1'

if (!(Test-Path $FolderForSslToCreate -PathType Container)) {  # ��������� �������������
    New-Item -ItemType Directory -Force -Path $FolderForSslToCreate  # ������� �����
}

$domainEkran = $domain.Replace("*","_")  # ������ * �� _ -> �������� ������ � �������� ����������,����� ������.

Get-ChildItem Env:CLIENTNAME
Get-ChildItem Env: # ������� ��� ENV
echo $env:windir

# ������ ������
echo "`n"
echo ""
echo "" ; "" ; ""


# ����� � ������, �������-��.
echo '����� �����:'
Write-Host "������ ����� �����"

# ��������� ����� �� �������.
$domain=read-host
$domain=read-host '������'    # �� ��� ��������� :


$domain=read-host '������' -AsSecureString  # ��� ������� � ��, ����� ���� �������� ��������������� � �����
[Runtime.InteropServices.Marshal]::PtrToStringAuto(    [Runtime.InteropServices.Marshal]::SecureStringToBSTR($pass)  )


# ##############################################

(Get-Content $FilePath) -replace 'SSLCertificateKeyFile.*'   , $SslString_4 | Out-File $FilePath
# ��� ���� =(Get-Content $FilePath) -replace 'password=.*','password="YOUR TEXT"' | Out-File $FilePath

# ����� ����� � �����
& '.../123.exe' @$paramsArr
# ��� 10+ �������� https://social.technet.microsoft.com/wiki/contents/articles/7703.powershell-running-executables.aspx


# ������� ��������� ����� �� ���,  ����� = https://docs.microsoft.com/en-us/answers/questions/316984/clientame-environment-variable-from-rdp-missing.html

# https://windowsnotes.ru/powershell-2/powershell-i-kavychki/
# https://codernotes.ru/articles/powershell/zapusk-skriptov-powershell.html

# https://stackoverflow.com/questions/9362722/stop-powershell-from-exiting


#