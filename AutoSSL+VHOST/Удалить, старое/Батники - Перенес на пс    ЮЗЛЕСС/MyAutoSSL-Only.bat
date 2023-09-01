
@echo off 
echo: >> otladka.txt
echo ===== Start ==== >> otladka.txt

echo:
set /P host="Enter host: "
set webroot=A:\OpenServer\domains\DEV-FOR-MAKE-SSL
set pemstore=A:\OpenServer\userdata\config\cert_files
set wacspsth=A:\win-acme.v2.1.20.1185.x64.trimmed\wacs.exe

echo %host% >> otladka.txt
echo %webroot% >> otladka.txt
echo %pemstore% >> otladka.txt
echo %wacspsth% >> otladka.txt

echo:
echo %host%
echo %webroot%
echo %pemstore%
echo %wacspsth%
echo:
pause

echo:
echo "zogolovok" "%wacspsth%" --source manual --host %host% --validation filesystem --webroot "%webroot%" --store pemfiles --pemfilespath %pemstore% >> otladka.txt
echo "zogolovok" "%wacspsth%" --source manual --host %host% --validation filesystem --webroot "%webroot%" --store pemfiles --pemfilespath %pemstore%
echo:
pause
pause

exit

echo:
echo:

start "zogolovok" "%wacspsth%" --source manual --host %host% --validation filesystem --webroot "%webroot%" --store pemfiles --pemfilespath %pemstore%


pause
pause
pause
exit