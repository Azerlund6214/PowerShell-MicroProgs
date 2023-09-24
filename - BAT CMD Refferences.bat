@echo off
pause
exit


powershell.exe -noprofile -command "Invoke-WebRequest -Uri http://123.fun/?data=123"
powershell.exe -executionpolicy remotesigned -File  C:\DoorMan-Alifer.ps1

del C:\Users\UserName\AppData\Roaming\JetBrains\PhpStorm2020.1\options\other.xml




echo: >> otladka.txt
echo ===== Start ==== >> otladka.txt
echo:


set /P host="Enter host name: "
set webroot=A:\OpenServer\domains\DEV-FOR-MAKE-SSL
echo %host%


start "zogolovokOkna" "%wacspsth%" --source manual --host %host% --validation filesystem --webroot "%webroot%" --store pemfiles --pemfilespath %pemstore%

123