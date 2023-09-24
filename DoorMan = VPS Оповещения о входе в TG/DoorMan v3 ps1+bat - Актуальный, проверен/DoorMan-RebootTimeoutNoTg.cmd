@echo off

echo 'RebootTimeout'

powershell.exe -executionpolicy remotesigned -File  C:\DoorMan-RebootTimeoutNoTg.ps1

exit