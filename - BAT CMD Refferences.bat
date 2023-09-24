@echo off 
exit


powershell.exe -noprofile -command "Invoke-WebRequest -Uri http://123.fun/?data=123"
powershell.exe -executionpolicy remotesigned -File  C:\DoorMan-Alifer.ps1

del C:\Users\UserName\AppData\Roaming\JetBrains\PhpStorm2020.1\options\other.xml




echo: >> otladka.txt
echo ===== Start ==== >> otladka.txt









123