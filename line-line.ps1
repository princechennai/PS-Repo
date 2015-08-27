#Get SID of a computer in a Domain
PS C:\> Get-ADComputer -Filter "name -eq 'edlt'" -Properties sid | select name, sid
