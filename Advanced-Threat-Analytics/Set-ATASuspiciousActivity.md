---
external help file: Advanced-Threat-Analytics-help.xml
Module Name: Advanced-Threat-Analytics
online version: 
schema: 2.0.0
---

# Set-ATASuspiciousActivity

## SYNOPSIS
Set-ATASuspiciousActivity is used to update the status of a suspcious activity.

## SYNTAX

```
Set-ATASuspiciousActivity [-Id] <String> [[-Status] <String>] [-Force] [-WhatIf] [-Confirm]
```

## DESCRIPTION
This cmdlet requires a suspicious activity ID and a status.
Available status types are Open, Closed, and Suppressed.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Set-ATASuspiciousActivity -Id 58f54ce12aaea50ff89b38a7 -Status Closed; Get-ATASuspiciousActivity | select Id, Status | ft
```

Id                             Status
--                             ------
58f54ce12aaea50ff89b38a7       Closed

The above command sets the specified Suspicious Activity to a Closed state, then displays the current status for the SA.

## PARAMETERS

### -Id
Unique Id of the Suspicious Activity

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Status
The specified status to update the Suspicious Activity.
(Open, Closed, Suppressed)

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Force
Suppress 'Confirm' dialogue

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

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

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

