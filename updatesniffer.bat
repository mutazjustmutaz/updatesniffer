@echo off

::VirtualBox
for /f "tokens=2 delims==" %%A in (
	'wmic datafile where "name='C:\\Program Files\\Oracle\\VirtualBox\\VirtualBox.exe'" get version /format:list'
) do (
	for /f "tokens=1-3 delims=." %%B in ("%%A") do set "vbver1=%%B.%%C.%%D"
)
echo %vbver1%

for /f "tokens=5" %%E in (
 'curl -s https://www.virtualbox.org/wiki/Downloads ^| findstr /c:"platform packages"'
) do set "vbver2=%%E"
echo %vbver2%

if not %vbver1% == %vbver2% echo VirtualBox %vbver2%

::pause
