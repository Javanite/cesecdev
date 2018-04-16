<#
.Synopsis
    Get-ATASuspiciousActivity is used to retrieve suspicious activities triggered in ATA.
.DESCRIPTION
    Running just Get-ATASuspiciousActivity will return a full listing of all SA's. You may also pass in a unique SA ID to fetch information around a single SA. The 'Profile' switch may be used to get more information around the context of the attack.
.EXAMPLE
    Get-ATASuspiciousActivity


    WindowsEventId              : 2007
    ExclusionUniqueEntityId     : computer 10.1.2.7
    SourceComputerId            : computer 10.1.2.7
    DestinationComputerIds      : {ff336d33-81f4-458c-b70b-33f0070ffb20}
    RelatedUniqueEntityIds      : {computer 10.1.2.7, ff336d33-81f4-458c-b70b-33f0070ffb20}
    IsAdditionalDataAvailable   : False
    SystemCreationTime          : 2017-04-17T23:16:49.6943463Z
    SystemUpdateTime            : 2017-05-18T16:22:08.9346648Z
    ReasonKey                   : DnsReconnaissanceSuspiciousActivityReason
    EvidenceKeys                : {}
    HasDetails                  : True
    RelatedActivityCount        : 1
    SourceIpAddresses           : {10.1.2.7}
    Id                          : 58f54ce12aaea50ff89b38a7
    StartTime                   : 2017-04-17T23:16:33.4600665Z
    EndTime                     : 2017-04-17T23:16:33.4600665Z
    Severity                    : Medium
    Status                      : Open
    StatusUpdateTime            : 2017-05-18T16:22:08.9346648Z
    TitleKey                    : DnsReconnaissanceSuspiciousActivityTitle
    DescriptionFormatKey        : DnsReconnaissanceSuspiciousActivityDescription
    DescriptionDetailFormatKeys : {}
    Type                        : DnsReconnaissanceSuspiciousActivity

    The above command retrieves a listing of all Suspicious Activities.

.EXAMPLE
    Get-ATASuspiciousActivity -Id 58f54ce12aaea50ff89b38a7 -Details


    Query                  : contoso.com
    RecordType             : Axfr
    ResponseCode           : ConnectionRefused
    AttemptCount           : 1
    DestinationComputerIds : {ff336d33-81f4-458c-b70b-33f0070ffb20}
    StartTime              : 2017-04-17T23:16:33.4600665Z
    EndTime                : 2017-04-17T23:16:33.4600665Z

    The above example retrieves the details around a specified suspicious activity.

.EXAMPLE
    Get-ATASuspiciousActivity -Id 58f54ce12aaea50ff89b38a7 -Export C:\Temp

    The above example downloads the Excel file for the specified suspicious activity to the C:\Temp folder.
#>
function Get-ATASuspiciousActivity {
    [CmdletBinding()]
    Param
    (
        # Unique Id of Suspicious Activity.
        [Parameter(Mandatory = $false,
            ValueFromPipelineByPropertyName = $true,
            Position = 0,
            ParameterSetName = 'Fetch')]
        [ValidatePattern('^[a-f0-9]{24}$')]
        [string]$Id,

        # Retrieves more details for the suspicious activity, such as time, query, attempts, result, response, etc.
        [Parameter(Mandatory = $false,
            ParameterSetName = 'Fetch')]
        [switch]$Details,

        # Downloads the suspicious activity Excel export to the specified folder path. Example: 'C:\temp'
        [Parameter(Mandatory = $false,
            ParameterSetName = 'Fetch')]
        [string]$Export
    )
    begin {
        if (!$Global:ATACenter) {$Script:ATACenter = 'localhost'}
        if ($Details -and $Excel) {Write-Error "You may not select both 'Excel' and 'Details' switch parameters."}
    }
    Process {
        try{
            if ($PSCmdlet.ParameterSetName -eq 'Fetch' -and !$Details -and !$Export) {
                $result = Invoke-RestMethod -Uri "https://$ATACenter/api/management/suspiciousActivities/$id" -Method Get -UseDefaultCredentials
                $result
            }
            if ($PSCmdlet.ParameterSetName -eq 'Fetch' -and $Details) {
                $result = Invoke-RestMethod -Uri "https://$ATACenter/api/management/suspiciousActivities/$id/details" -Method Get -UseDefaultCredentials
                $result.DetailsRecords
            }
            if ($Details -and !$Id) {
                Write-Error "You must specify a suspicious activity ID when using the 'details' switch."
            }
            if ($PSCmdlet.ParameterSetName -eq 'Fetch' -and $Export) {
                try {
                    $ExcelFilePath = $Export + "/SA_$Id" + '.xlsx'
                    $ExcelLocale = 'excel?localeId=en-us'
                    $result = Invoke-RestMethod -Uri "https://$ATACenter/api/management/suspiciousActivities/$Id/$ExcelLocale" -OutFile $ExcelFilePath -Method Get -UseDefaultCredentials
                    $result
                }
                catch {
                    $_
                }
            }
            if ($PSCmdlet.ParameterSetName -ne 'Fetch') {
                $result = Invoke-RestMethod -Uri "https://$ATACenter/api/management/suspiciousActivities" -Method Get -UseDefaultCredentials
                $result
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
    }
}