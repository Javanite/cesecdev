<#
.Synopsis
    Get-ATAUniqueEntity is used to retrieve information around unique entities in ATA.
.DESCRIPTION
    This cmdlet retrieves detialed information around users and computers. The 'Profile' flag can be used to see more detailed information built by ATA.
.EXAMPLE
    Get-ATAUniqueEntity -Id ff336d33-81f4-458c-b70b-33f0070ffb20

    DnsName                    : 2012R2-DC1.contoso.com
    DomainController           : @{IsGlobalCatalog=True; IsPrimary=True; IsReadOnly=False}
    IpAddress                  :
    IsDomainController         : True
    IsServer                   : True
    OperatingSystemDisplayName : Windows Server 2012 R2 Datacenter, 6.3 (9600)
    SystemDisplayName          : 2012R2-DC1
    BadPasswordTime            :
    ConstrainedDelegationSpns  : {}
    ExpiryTime                 :
    IsDisabled                 : False
    IsExpired                  : False
    IsHoneytoken               : False
    IsLocked                   : False
    IsPasswordExpired          : False
    IsPasswordFarExpiry        : False
    IsPasswordNeverExpires     : False
    IsPasswordNotRequired      : False
    IsSmartcardRequired        : False
    PasswordExpiryTime         :
    PasswordUpdateTime         : 2017-04-17T17:59:57.0826645Z
    Spns                       : {Dfsr-12F9A27C-BF97-4787-9364-D31B6C55EB04/2012R2-DC1.contoso.com, ldap/2012R2-DC1.contoso.com/ForestDnsZones.contoso.com,
                                 ldap/2012R2-DC1.contoso.com/DomainDnsZones.contoso.com, TERMSRV/2012R2-DC1...}
    UpnName                    :
    Description                :
    IsSensitive                : True
    SamName                    : 2012R2-DC1$
    DomainId                   : 7c915dca-0591-4abe-84c6-2522466bed4d
    CanonicalName              : contoso.com/Domain Controllers/2012R2-DC1
    CreationTime               : 2017-04-17T17:59:40Z
    DistinguishedName          : CN=2012R2-DC1,OU=Domain Controllers,DC=contoso,DC=com
    IsDeleted                  : False
    IsNew                      : False
    Sid                        : S-1-5-21-3599243929-1086515894-1402892407-1001
    SystemSubDisplayName       :
    Id                         : ff336d33-81f4-458c-b70b-33f0070ffb20
    IsPartial                  : False
    Type                       : Computer

    The above example retrieves information about the specified unique entity.

.EXAMPLE
    Get-ATAUniqueEntity -Id ff336d33-81f4-458c-b70b-33f0070ffb20 -ParentGroupId | foreach {Get-ATAUniqueEntity -Id $_}

    GroupType            : {Global, Security}
    SystemDisplayName    : Domain Controllers
    SystemSubDisplayName : All domain controllers in the domain
    Description          : All domain controllers in the domain
    IsSensitive          : True
    SamName              : Domain Controllers
    DomainId             : 7c915dca-0591-4abe-84c6-2522466bed4d
    CanonicalName        : contoso.com/Users/Domain Controllers
    CreationTime         : 2017-04-17T17:59:41Z
    DistinguishedName    : CN=Domain Controllers,CN=Users,DC=contoso,DC=com
    IsDeleted            : False
    IsNew                : False
    Sid                  : S-1-5-21-3599243929-1086515894-1402892407-516
    Id                   : 9c7c6002-d192-48e8-99c2-1205cbd5f2c9
    IsPartial            : False
    Type                 : Group

    The above example extracts the parentgroupid from the unique entity and passes it back into Get-ATAUniqueEntity to see the group's information.

.EXAMPLE
    Get-ATASuspiciousActivity | select SourceComputerId | Get-ATAUniqueEntity

    The above example pipes the SourceComputerId property directly into Get-ATAUniqueEntity to retrieve the entity information for the source computer.
#>
function Get-ATAUniqueEntity {
    [CmdletBinding()]
    Param
    (
        # Unique Id of Unique Entity
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true,
            Position = 0,
            ParameterSetName = 'Fetch')]
        [Alias('SourceComputerId', 'ExclusionUniqueEntityId')]
        [string]$Id,

        # Retrieves the profile for the unique entity.
        [Parameter(Mandatory = $false,
            ParameterSetName = 'Fetch')]
        [switch]$Profile,

        # Retrieves the parent group Id for the unique entity.
        [Parameter(Mandatory = $false,
            ParameterSetName = 'Fetch')]
        [switch]$ParentGroupId

    )
    begin {
        if (!$Global:ATACenter) {$Script:ATACenter = 'localhost'}
        if ($Profile -and $ParentGroupId) { Write-Error "You may not set both Profile and ParentGroupId."}
    }
    Process {
        try{
            if ($Id -and !$Profile -and !$ParentGroupId) {
                $result = Invoke-RestMethod -Uri "https://$ATACenter/api/management/uniqueEntities/$Id" -Method Get -UseDefaultCredentials

                $result
            }
            if ($Id -and $Profile) {
                $result = Invoke-RestMethod -Uri "https://$ATACenter/api/management/uniqueEntities/$Id/profile" -Method Get -UseDefaultCredentials

                $result
            }
            if ($Id -and $ParentGroupId) {
                $result = Invoke-RestMethod -Uri "https://$ATACenter/api/management/uniqueEntities/$Id/parentGroupIds" -Method Get -UseDefaultCredentials

                $result
            }
            if (!$Id -and $Profile) {
                Write-Error "You must specify a unique entity ID when using the 'Profile' switch."
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