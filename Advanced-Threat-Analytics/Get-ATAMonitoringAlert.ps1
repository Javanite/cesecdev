<#
.Synopsis
    Get-ATAMonitoringAlert retrieves all health alerts in ATA.
.DESCRIPTION
    This cmdlet is used to retrieve a list of all health alerts in ATA. Filtering of these alerts can be done post-query.
.EXAMPLE
    Get-ATAMonitoringAlert -Status Open | select Id, TitleKey, Severity, Status, StartTime

    Id        : 59046d2bb5487a052cd5381e
    TitleKey  : GatewayDirectoryServicesClientAccountPasswordExpiryMonitoringAlertTitleNearExpiry
    Severity  : Medium
    Status    : Open
    StartTime : 2017-04-29T10:38:35.9741496Z

    Id        : 5911f086b5487a052c205f69
    TitleKey  : GatewayStartFailureMonitoringAlertTitle
    Severity  : Medium
    Status    : Open
    StartTime : 2017-05-09T16:38:30.5274492Z

    The above example retrieves a list of Open monitoring alerts and displays the Id, TitleKey, Severity, Status, and StartTime for the alerts.
#>
function Get-ATAMonitoringAlert {
    [CmdletBinding()]
    Param
    (
        # Status to update the monitoring alert. (Open, Closed, Suppressed)
        [Parameter(Mandatory = $false,
            ValueFromPipelineByPropertyName = $true,
            ParameterSetName = 'Fetch')]
        [ValidateSet('Open', 'Closed', 'Suppressed')]
        [string]$Status
    )
    Begin{
        if (!$ATACenter) {$ATACenter = 'localhost'}
    }
    Process {
        try{
            $result = Invoke-RestMethod -Uri "https://$ATACenter/api/management/monitoringAlerts" -Method Get -UseDefaultCredentials
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
        if ($Status) {
            $result | Where-Object {$_.status -eq $Status}
        }

        if (!$Status) {
            $result
        }
    }
}