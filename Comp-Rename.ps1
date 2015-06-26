[System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null
$name = [Microsoft.VisualBasic.Interaction]::InputBox("Enter Desired Computer Name ")
$computerName = Get-WmiObject Win32_ComputerSystem
$computername.Rename($name)
write-Host "$([char]1) Computer Name is changed to `"$name`", I am Going to Reboot the Computer after 5 seconds."  -ForegroundColor Green
write-host $([char]7)
sleep 1
write-host $([char]7)
sleep 1 
write-host $([char]7)
sleep 1
write-host $([char]7)
sleep 1
write-host $([char]7)
sleep 1
Restart-Computer -Force 
