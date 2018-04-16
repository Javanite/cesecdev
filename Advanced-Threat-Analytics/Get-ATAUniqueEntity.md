---
external help file: Advanced-Threat-Analytics-help.xml
Module Name: Advanced-Threat-Analytics
online version: 
schema: 2.0.0
---

# Get-ATAUniqueEntity

## SYNOPSIS
Get-ATAUniqueEntity is used to retrieve information around unique entities in ATA.

## SYNTAX

```
Get-ATAUniqueEntity [-Id] <String> [-Profile] [-ParentGroupId]
```

## DESCRIPTION
This cmdlet retrieves detialed information around users and computers.
The 'Profile' flag can be used to see more detailed information built by ATA.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-ATAUniqueEntity -Id ff336d33-81f4-458c-b70b-33f0070ffb20
```

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

### -------------------------- EXAMPLE 2 --------------------------
```
Get-ATAUniqueEntity -Id ff336d33-81f4-458c-b70b-33f0070ffb20 -ParentGroupId | foreach {Get-ATAUniqueEntity -Id $_}
```

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

### -------------------------- EXAMPLE 3 --------------------------
```
Get-ATASuspiciousActivity | select SourceComputerId | Get-ATAUniqueEntity
```

The above example pipes the SourceComputerId property directly into Get-ATAUniqueEntity to retrieve the entity information for the source computer.

## PARAMETERS

### -Id
Unique Id of Unique Entity

```yaml
Type: String
Parameter Sets: (All)
Aliases: SourceComputerId, ExclusionUniqueEntityId

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Profile
Retrieves the profile for the unique entity.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ParentGroupId
Retrieves the parent group Id for the unique entity.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

