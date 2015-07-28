#############################Define Log Files########################################
#Path for Log
$logon = [Environment]::UserName
$DOCDIR = "C:\users\$logon"
$TARGETDIR = "$DOCDIR\Logs"
if(!(Test-Path -Path Logs )){
   New-Item -ItemType directory -Path $DOCDIR\Logs
}

$date = get-date -format d
$date = $date.ToString().Replace(“/”, “-”)
$time = get-date -format t
$month = get-date 
$month1 = $month.month
$year1 = $month.year
$time = $time.ToString().Replace(":", "-")
$time = $time.ToString().Replace(" ", "")

$log1 = ".\Logs" + "\" + "FTP_" + $date + "_.log"
$log2 = ".\Logs" + "\" + "FTP_" + $month1 +"_" + $year1 +"_.log"
$log3 = ".\Logs" + "\" + "FTP_" + $date + $time + "_.log"

$logs = ".\Logs" + "\" + "Powershell" + $date + "_" + $time + "_.txt"

#Start-Transcript -Path $logs 
$dt = Get-Date
Add-Content $log3 "$dt : Script Started"

###########################Variables######################################
 
$ftp = "ftp://52.27.118.254/srv/files/ftp/" # Change
$user = "ftp"  # Change
$pass = Get-Content "C:\pass\pass.txt" | ConvertTo-SecureString # Change
$uploadfpath = "C:\Uploadftp\ftpfiles\DigiCertUtil.zip" # Define the Folder from where files will be uploaded 

###########################################################################

$checkitems = Get-ChildItem $uploadfpath
$countitems = $checkitems.count
if ($countitems -eq 0)
{
Write-Host "No items to process" -ForegroundColor Green
$dt = Get-Date
Add-Content $log3 "$dt : No items to process, script will exit"
exit
}
$dt = Get-Date
Add-Content $log3 "$dt : Total number of items to process $countitems"

#####################################################################################

if ($error -ne $null)
      {
$dt = Get-Date
Add-Content $log3 "$dt : Script Terminated because of error: $error"
$error.clear()
exit

       }
  else

      {
    Write-host "no errors till now"
      }

$webclient = New-Object System.Net.WebClient 
 
$webclient.Credentials = New-Object System.Net.NetworkCredential($user,$pass)
 
#Upload each file in upload directory...

foreach($item in (dir $uploadfpath "*.*")){ 
    Write-host  "Uploading $item..."  -ForegroundColor Green
	$dt = Get-Date
	Add-Content $log3 "$dt : Uploading $item..."
    $uri = New-Object System.Uri($ftp+$item.Name) 
    $webclient.UploadFile($uri, $item.FullName)
      if($error -ne $null)
        {
	Write-Host "Upload Failed" -ForegroundColor Red
        }
		else
		{
	Write-Host "Uploading $item Completed" -ForegroundColor green
	$dt = Get-Date
	Add-Content $log3 "$dt : Uploading $item Completed"
	    }
 } 

if ($error -ne $null)
      {
$dt = Get-Date
Add-Content $log3 "$dt : Script encountered error: $error"
$error.clear()
       }
  else

      {
    Write-host "no errors till now"
      }
$dt = Get-Date
Add-Content $log3 "$dt : Script Processing finished"

#Stop-Transcript
#########################################################################################
