#Installing AD

#Following are the commandlets Used

#install-windowsfeature
#import-module
#install-addsforest

#To get the name of available Serives
#get-windowsfeature

#To Install ADDS
Install-windowsfeature -name AD-Domain-Services –IncludeManagementTools

#To install ADDSDeployment
Import-Module ADDSDeployment

#To Promoto server as Domain Controller first on new forest
Install-ADDSForest -CreateDnsDelegation:$false -DatabasePath "C:\Windows\NTDS" -DomainMode "Win2008" -DomainName "example.com" -DomainNetbiosName "example" -ForestMode "Win2008" -InstallDns:$false -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion:$true -SysvolPath "C:\Windows\SYSVOL" -Force:$true
