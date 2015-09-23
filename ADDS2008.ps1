Import-Module ServerManager
#To Install ADDS
Add-WindowsFeature -name AD-Domain-Services
dcpromo /unattend:C:\adds\answer.txt

#########################################
#Answerfile.txt
[DCINSTALL]
InstallDNS=no
NewDomain=forest
NewDomainDNSName=example.com
DOmainNetBiosName=EXAMPLE
ReplicaOrNewDomain=domain
ForestLevel=4
DomainLevel=4
ConfirmGc=Yes
DatabasePath=C:\Windows\NTDS
LogPath=C:\Windows\NTDS
RebootOnCompletion=no
SYSVOLPath=C:\Windows\SYSVOL
SafeModeAdminPassword=yourpassword!
