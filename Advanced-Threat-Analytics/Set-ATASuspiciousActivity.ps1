<#
.Synopsis
    Set-ATASuspiciousActivity is used to update the status of a suspcious activity.
.DESCRIPTION
    This cmdlet requires a suspicious activity ID and a status. Available status types are Open, Closed, and Suppressed.
.EXAMPLE
    Set-ATASuspiciousActivity -Id 58f54ce12aaea50ff89b38a7 -Status Closed; Get-ATASuspiciousActivity | select Id, Status | ft

    Id                             Status
    --                             ------
    58f54ce12aaea50ff89b38a7       Closed

    The above command sets the specified Suspicious Activity to a Closed state, then displays the current status for the SA.
#>
function Set-ATASuspiciousActivity {
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    Param
    (
        # Unique Id of the Suspicious Activity
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true,
            Position = 0,
            ParameterSetName = 'Fetch')]
        [ValidatePattern('^[a-f0-9]{24}$')]
        [string]$Id,

        # The specified status to update the Suspicious Activity. (Open, Closed, Suppressed)
        [Parameter(Mandatory = $false,
            ValueFromPipelineByPropertyName = $true,
            Position = 1,
            ParameterSetName = 'Fetch')]
        [ValidateSet('Open', 'Closed', 'CloseAndExclude', 'Suppressed', 'Delete', 'DeleteSameType')]
        [string]$Status,

        # Suppress 'Confirm' dialogue
        [Parameter(Mandatory = $false,
            ValueFromPipelineByPropertyName = $false)]
        [switch]$Force
    )
    Begin{
        if (!$Global:ATACenter) {$Script:ATACenter = 'localhost'}
    }
    Process {
        try{
            if ($PSCmdlet.ParameterSetName -eq 'Fetch' -and $Status -ne 'Delete' -and $Status -ne 'DeleteSameType') {
                if ($Force -or $PSCmdlet.ShouldProcess($Id, "Changing status to $Status")) {
                    $body = @{}
                    if ($Status) {$body += @{Status = $Status}
                    }
                    if ($Status -eq 'Closed') {$body += @{ShouldExclude = $false}
                    }
                    if ($Status -eq 'CloseAndExclude') {$body += @{ShouldExclude = $true}
                    }
                    $result = Invoke-RestMethod -Uri "https://$ATACenter/api/management/suspiciousActivities/$id" -Method Post -Body $body -UseDefaultCredentials
                }
            }

            if ($PSCmdlet.ParameterSetName -eq 'Fetch' -and $Status -eq 'Delete') {
                if ($Force -or $PSCmdlet.ShouldProcess($Id, "Changing status to $Status")) {
                    $ShouldDelete = '?shouldDeleteSameType=false'
                    $body = @{}
                    $body += @{shouldDeleteSametype = $false}
                    $result = Invoke-RestMethod -Uri "https://$ATACenter/api/management/suspiciousActivities/$id$ShouldDelete" -Method Delete -UseDefaultCredentials
                }
            }

            if ($PSCmdlet.ParameterSetName -eq 'Fetch' -and $Status -eq 'DeleteSameType' -and $PSCmdlet.ShouldProcess($Id, "Changing status to $Status")) {
                if ($Force -or $PSCmdlet.ShouldProcess($Id, "Changing status to $Status")) {
                    $ShouldDelete = '?shouldDeleteSameType=true'
                    $result = Invoke-RestMethod -Uri "https://$ATACenter/api/management/suspiciousActivities/$id$ShouldDelete" -Method Delete -UseDefaultCredentials
                }
            }
        }
        catch{
            if ($_.Exception.Message -match 'SSL/TLS secure channel'){
                Write-Error "Could not establish trust relationship for the SSL/TLS secure channel. Please run Resolve-ATASelfSignedCert and try again." -ErrorAction Stop
            }
            if ($_.Exception.Message -match 'unable to connect'){
                Write-Error "Unable to connect to remote server. Your ATACenter url is set to $ATACenter. Run Set-ATACenterURL '<url>' if this is incorrect." -ErrorAction Stop
            }
            else {
                Write-Error $_ -ErrorAction Stop
            }
        }
    }
    end {
        $result
    }
}