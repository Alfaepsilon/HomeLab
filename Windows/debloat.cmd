@echo off
echo "------------------------Uninstalling unnecessary software---------------------"
echo "Uninstalling OneDrive"
@REM winget uninstall Microsoft.OneDrive
TASKKILL /f /im OneDrive.exe
%systemroot%\SysWOW64\OneDriveSetup.exe /uninstall
echo "Uninstalling Microsoft 365 things"
powershell.exe -c "Get-AppxPackage -allusers -Name MicrosoftTeams | Remove-AppxPackage"

echo "Uninstalling Cortana"
powershell.exe -c "Get-AppxPackage -allusers *Microsoft.549981C3F5F10* | Remove-AppxPackage"

echo "------------------------Disabling software/services that cannot be removed/uninstalled---------------------"
echo "Stopping the Windows Update service"
net stop wuauserv
echo "Disabling startup of Windows Update service (lmao xd watch it start anyways)"
sc config "wuauserv" start=disabled
echo "Disabling copilot"
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot /v TurnOffWindowsCopilot /t REG_DWORD /d 1 /f
pause
