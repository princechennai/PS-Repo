#
# Windows PowerShell script for AD FS Deployment
#

Import-Module ADFS

# Get the credential used for performaing installation/configuration of ADFS
$installationCredential = Get-Credential -Message "Enter the credential for the account used to perform the configuration."

# Get the credential used for the federation service account
$serviceAccountCredential = Get-Credential -Message "Enter the credential for the Federation Service Account."

Install-AdfsFarm `
-CertificateThumbprint:"DF83D13A2E2013C556390F8CA9F4DE8CB4BAB2DB" `
-Credential:$installationCredential `
-FederationServiceDisplayName:"CliQr Technologies" `
-FederationServiceName:"DC01.demo.cliqrsso.com" `
-ServiceAccountCredential:$serviceAccountCredential
