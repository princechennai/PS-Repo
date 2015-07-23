#Step 0:
Set-ExecutionPolicy RemoteSigned -Force

#Step 1:
iisreset /stop

#Step 2:
(Get-Content C:\WebSite\web.config) | ForEach-Object {$_ -replace 'dbnode','%DB_TIER_IP%'} | Set-Content C:\WebSite\web.config

#Step 3:
$source = "C:\WebSite"
$destination = "C:\WebSite.zip"

Add-Type -assembly "system.io.compression.filesystem"
[io.compression.zipfile]::CreateFromDirectory($Source, $destination) 

#Step 4:
$from = "C:\WebSite.zip"
$to = "F:\app\dotnetnuke\demo\"

Copy-Item $from $to

#Step 5:
(Get-Content C:\WebSite\web.config) | ForEach-Object {$_ -replace '%DB_TIER_IP%','dbnode'} | Set-Content C:\WebSite\web.config

#Step 6:
del $from

#Step 7:
iisreset /start
