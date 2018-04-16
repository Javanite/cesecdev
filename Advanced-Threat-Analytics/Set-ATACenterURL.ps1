<#
.Synopsis
Set-ATACenterURL is for setting the the URL to be used for the rest of the cmdlets.

.DESCRIPTION
By default, this module uses localhost as the URL. This can be overwritten with Set-ATACenterURL. It is recommended to run this cmdlet in your profile to prevent having to set it for each new session.

.EXAMPLE
Set-ATACenterURL -URL atacenter.contoso.com

The above cmdlet sets $ATACenter as a global variable in the current session. This variable is used for other cmdlets in this module.
#>
function Set-ATACenterURL {
    [CmdletBinding()]
    Param
    (
        # ATA Center URL. Located in ATA Center Configuration. (Example: atacenter.mydomain.com)
        [Parameter(Mandatory = $true,
                    Position = 0)]
        [string]$URL
    )
    $Global:ATACenter = "$URL"
}