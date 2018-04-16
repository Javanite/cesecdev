---
external help file: 
Module Name: 
online version: 
schema: 2.0.0
---

# Set-ATACenterURL

## SYNOPSIS
Set-ATACenterURL is for setting the the URL to be used for the rest of the cmdlets.

## SYNTAX

```
Set-ATACenterURL [-URL] <String>
```

## DESCRIPTION
By default, this module uses localhost as the URL.
This can be overwritten with Set-ATACenterURL.
It is recommended to run this cmdlet in your profile to prevent having to set it for each new session.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Set-ATACenterURL -URL atacenter.contoso.com
```

The above cmdlet sets $ATACenter as a global variable in the current session.
This variable is used for other cmdlets in this module.

## PARAMETERS

### -URL
ATA Center URL.
Located in ATA Center Configuration.
(Example: atacenter.mydomain.com)

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

