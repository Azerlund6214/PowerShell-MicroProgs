@echo off

echo "Shutdown after time"

set /P timeH="Enter Hours: "
set /P timeMin="Enter Minutes: "


set /a timeSec=(timeH*60*60)+(timeMin*60)
echo %timeSec%

shutdown.exe /s /t %timeSec%

pause
exit