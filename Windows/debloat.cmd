@echo off
echo "Set dark theme"
powershell.exe -c "start-process -filepath 'C:\Windows\Resources\Themes\dark.theme'"; timeout /t 3; taskkill /im "systemsettings.exe" /f
echo "Install vscode (will prob not work)"
winget install -e --id Microsoft.VisualStudioCode
echo "Some manual steps... Configure last taskbar settings"
start ms-settings:taskbar
echo "Configure Microsoft Edge"
reg import edge-debloat.reg
"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --update
echo "Manualy change search engine"
start msedge
