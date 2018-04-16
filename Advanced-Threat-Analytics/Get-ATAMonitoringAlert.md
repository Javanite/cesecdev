---
external help file: Advanced-Threat-Analytics-help.xml
Module Name: Advanced-Threat-Analytics
online version: 
schema: 2.0.0
---

# Get-ATAMonitoringAlert

## SYNOPSIS
Get-ATAMonitoringAlert retrieves all health alerts in ATA.

## SYNTAX

```
Get-ATAMonitoringAlert [-Status <String>]
```

## DESCRIPTION
This cmdlet is used to retrieve a list of all health alerts in ATA.
Filtering of these alerts can be done post-query.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-ATAMonitoringAlert -Status Open | select Id, TitleKey, Severity, Status, StartTime
```

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

## PARAMETERS

### -Status
Status to update the monitoring alert.
(Open, Closed, Suppressed)

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

