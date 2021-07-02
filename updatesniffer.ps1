
#retrieve data of applications that registered an uninstaller.
New-PSDrive -Name Uninstall -PSProvider Registry -Root HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall | Out-Null
$UninstallableApplications = Get-ChildItem -Path Uninstall:

#publisher names are used for filtering so they're extracted and saved elsewhere: 
#$UninstallableApplications | ForEach-Object -Process { $_.GetValue('Publisher') } > pubnames.txt

#VirtualBox
#retrieve version number of installed application
$disverstr = $UninstallableApplications | Where-Object {$_.GetValue('Publisher') -eq 'Oracle Corporation'} | Get-ItemProperty -Name DisplayVersion | Select-Object -Property DisplayVersion | Format-List | Out-String
$disverarr = -split $disverstr
$disver1 = $disverarr[2]
Write-Host $disver1

#retrieve number of most recent version from website
$webreq = Invoke-WebRequest -Uri https://www.virtualbox.org/wiki/Downloads 
$inntextstr = $webreq.AllElements | Where-Object {$_.innerText -like "*platform packages*" -and $_.tagName -eq 'H3'} | Select-Object -Property innerText | Format-List | Out-String
$inntextarr = -split $inntextstr
$disver2 = $inntextarr[3]
Write-Host $disver2

#compare and notify in case of discrepancy
if($disver1 -ne $disver2) {Write-Host "VirtualBox $disver2"}
