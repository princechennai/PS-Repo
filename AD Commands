#To create a New Group
NEW-ADGroup –name “Group Name” -Description "Group Description" –groupscope Global -Path "ou=Security Groups,DC=example,DC=com"
#To create a New OU
NEW-ADOrganizationalUnit “OU Name” #If a path is required, add -Path "ou=OU NAME,DC=example,DC=com
#To create a New User
New-ADUser –SamAccountName “cdarwin” -UserPrincipalName "cdarwin@domain.com” -GivenName “Charles” -Surname “Darwin” -DisplayName “Charles Darwin” -Name "Charles Darwin" -Description "Test User"-Enabled $true -AccountPassword (Read-Host -AsSecureString "AccountPassword")
#To Add user to a Group
Add-ADGroupMember -Identity groupname -Members "username"
