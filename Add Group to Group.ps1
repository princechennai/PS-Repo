#ADSI Method
$remoteComputer = ""
$fqdn = ""
$groupName = ""
([ADSI]"WinNT://$remoteComputer/Administrators,group").Add("WinNT://$fqdn/$groupName")
