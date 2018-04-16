---
external help file: 
Module Name: 
online version: 
schema: 2.0.0
---

# Get-ATASuspiciousActivity

## SYNOPSIS
Get-ATASuspiciousActivity is used to retrieve suspicious activities triggered in ATA.

## SYNTAX

```
Get-ATASuspiciousActivity [[-Id] <String>] [-Details] [-Export <String>]
```

## DESCRIPTION
Running just Get-ATASuspiciousActivity will return a full listing of all SA's.
You may also pass in a unique SA ID to fetch information around a single SA.
The 'Profile' switch may be used to get more information around the context of the attack.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-ATASuspiciousActivity
```

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

### -------------------------- EXAMPLE 2 --------------------------
```
Get-ATASuspiciousActivity -Id 58f54ce12aaea50ff89b38a7 -Details
```

Query                  : contoso.com
RecordType             : Axfr
ResponseCode           : ConnectionRefused
AttemptCount           : 1
DestinationComputerIds : {ff336d33-81f4-458c-b70b-33f0070ffb20}
StartTime              : 2017-04-17T23:16:33.4600665Z
EndTime                : 2017-04-17T23:16:33.4600665Z

The above example retrieves the details around a specified suspicious activity.

### -------------------------- EXAMPLE 3 --------------------------
```
Get-ATASuspiciousActivity -Id 58f54ce12aaea50ff89b38a7 -Export C:\Temp
```

The above example downloads the Excel file for the specified suspicious activity to the C:\Temp folder.

## PARAMETERS

### -Id
Unique Id of Suspicious Activity.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Details
Retrieves more details for the suspicious activity, such as time, query, attempts, result, response, etc.

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

### -Export
Downloads the suspicious activity Excel export to the specified folder path.
Example: 'C:\temp'

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

