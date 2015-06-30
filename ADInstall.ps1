#Installing AD

#Following are the commandlets Used

#install-windowsfeature
#import-module
#install-addsforest

#To get the name of available Serives
get-windowsfeature

#To Install ADDS
Install-windowsfeature AD-domain-services

#To install ADDSDeployment
Import-Module ADDSDeployment

#To Promoto server as Domain Controller first on new forest
Install-ADDSForest -CreateDnsDelegation:$false -DatabasePath "C:\Windows\NTDS" -DomainMode "Win2012R2" -DomainName "example.com" -DomainNetbiosName "example" -ForestMode "Win2012R2" -InstallDns:$true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion:$false -SysvolPath "C:\Windows\SYSVOL" -Force:$true
