#Get SID of a computer in a Domain
PS C:\> Get-ADComputer -Filter "name -eq 'edlt'" -Properties sid | select name, sid

#Get host details
$hostdetails = Get-WmiObject -Class Win32_ComputerSystem
echo $hostdetails >> C:\tmp\test1.txt
$ipaddres = ((ipconfig | findstr [0-9].\.)[0]).Split()[-1]
echo "IPADDRESS = $ipaddress" | Add-Content -Path C:\tmp\test1.txt

#Make a directory
$TARGET = "C:\tmp"
if(!(Test-Path -Path $TARGET )){
    New-Item -ItemType directory -Path $TARGET }

#Get Values
$about = whoami
$hostname = "$env:COMPUTERNAME"
$username = "$env:USERNAME"
$ipaddress = ((ipconfig | findstr [0-9].\.)[0]).Split()[-1]

#Write output in an ini file
echo "ABOUT = $about" | Add-Content -Path C:\tmp\info.ini
echo "HOSTNAME = $hostname" | Add-Content -Path C:\tmp\info.ini
echo "USER = $username" | Add-Content -Path C:\tmp\info.ini
echo "IPADDRESS = $ipaddress" | Add-Content -Path C:\tmp\info.ini
