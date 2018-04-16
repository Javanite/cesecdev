<#
.Synopsis
Resolve-ATASelfSignedCert is used if you are having SSL/TLS tunnel issues with this module and know you are using a self signed certificate for your ATA Center.

.DESCRIPTION
Credit to railroadmanuk for most of this code.
https://virtualbrakeman.wordpress.com/2016/03/20/powershell-could-not-create-ssltls-secure-channel/

.EXAMPLE
Resolve-ATASelfSignedCert

The above cmdlet attempts to remediate the SSL error received from using a self-signed certificate.
#>
function Resolve-ATASelfSignedCert {
    try {
        Add-Type -TypeDefinition @"
using System.Net;
using System.Security.Cryptography.X509Certificates;
public class TrustAllCertsPolicy : ICertificatePolicy
{
public bool CheckValidationResult(
ServicePoint srvPoint, X509Certificate certificate,
WebRequest request, int certificateProblem)
{
return true;
}
}
"@
    }
    catch {
        Write-Error $_
    }
    [System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy
    }