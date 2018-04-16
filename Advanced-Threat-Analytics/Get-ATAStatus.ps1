#region Get-ATAStatus
<#
.Synopsis
    Get-ATAStatus retrieves status information for ATA.
.DESCRIPTION
    This cmdlet displays a wide range of information around your current ATA Center components, such as the Center, Gateways, and License.
.EXAMPLE
    Get-ATAStatus -Center | Select -ExpandProperty Configuration

    AbnormalBehaviorDetectorConfiguration                                          : @{BuildModelsConfiguration=; CreateSuspiciousActivitiesConfiguration=;
                                                                                     MinActiveAccountCount=50; SuspiciousActivityCreationDataMaxCount=1000;
                                                                                     BlockConfiguration=; IsEnabled=True; UpsertProfileConfiguration=}
    AbnormalKerberosDetectorConfiguration                                          : @{ExcludedSourceComputerIds=System.Object[]; ExcludedSubnets=System.Object[];
                                                                                     BlockConfiguration=; IsEnabled=True; UpsertProfileConfiguration=}
    AbnormalSensitiveGroupMembershipChangeDetectorConfiguration                    : @{LearningPeriod=70.00:00:00; ExcludedSourceAccountIds=System.Object[];
                                                                                     BlockConfiguration=; IsEnabled=True; UpsertProfileConfiguration=}
    AbnormalSmbDetectorConfiguration                                               : @{OperationRetentionPeriod=00:03:00; RemoveOldOperationsConfiguration=;
                                                                                     ExcludedSourceComputerIds=System.Object[]; ExcludedSubnets=System.Object[];
                                                                                     BlockConfiguration=; IsEnabled=True; UpsertProfileConfiguration=}
    AbnormalVpnDetectorConfiguration                                               : @{ProfileCommonGeolocationsAndCarriesAsyncConfiguration=; BlockConfiguration=;
                                                                                     IsEnabled=True; UpsertProfileConfiguration=}
    AccountEnumerationDetectorConfiguration                                        : @{ExcludedSourceComputerIds=System.Object[]; ExcludedSubnets=System.Object[];
                                                                                     BlockConfiguration=; IsEnabled=True; UpsertProfileConfiguration=}
    ActivityProcessorConfiguration                                                 : @{ActivityBlockConfiguration=; ActivityPostponeBlockConfiguration=;
                                                                                     PostponedActivityBlockConfiguration=}
    ActivitySimulatorConfiguration                                                 : @{DatabaseServerEndpoint=; DelayInterval=00:00:15; SimulationState=Disabled}
    AppDomainManagerConfiguration                                                  : @{GcCollectConfiguration=; UpdateExceptionStatisticsConfiguration=}
    BruteForceDetectorConfiguration                                                : @{BlockConfiguration=; IsEnabled=True; UpsertProfileConfiguration=}
    CenterTelemetryManagerConfiguration                                            : @{IsEnabled=True; ServiceUrl=https://dc.applicationinsights.microsoft.com/v2/track;
                                                                                     ClientInstrumentationKey=fd3f5bd1-3d71-44a3-9209-d94633544903; ClientBufferMaxSize=450;
                                                                                     ClientSendInterval=00:10:00; UnsentTelemetrySampleInterval=01:00:00;
                                                                                     UnsentTelemetryRetentionPeriod=7.00:00:00; SendSystemTelemetryConfiguration=;
                                                                                     SendPerformanceCounterTelemetryConfiguration=; SendAlertTelemetryConfiguration=;
                                                                                     SendExceptionStatisticsTelemetryConfiguration=; SendUnsentTelemetriesConfiguration=;
                                                                                     UnsentTelemetryBatchSize=20}
    CenterWebApplicationConfiguration                                              : @{ServiceListeningIpEndpoint=; CommunicationCookieExpiration=00:20:00}
    CenterWebClientConfiguration                                                   : @{RetryDelay=00:00:01; ServiceEndpoints=System.Object[];
                                                                                     ServiceCertificateThumbprints=System.Object[]}
    ComputerPreauthenticationFailedDetectorConfiguration                           : @{BlockConfiguration=; IsEnabled=True; UpsertProfileConfiguration=}
    ConfigurationManagerConfiguration                                              : @{UpdateConfigurationConfiguration=}
    DatabaseConfiguration                                                          : @{ServerEndpoint=; ClientConnectTimeout=00:00:30; ClientServerSelectionTimeout=00:00:30;
                                                                                     ConnectionPoolMaxSize=100; WaitQueueSize=1000; ActivityBlockConfiguration=;
                                                                                     BackupSystemProfileMaxCount=10; CappedActivityCollectionHighActivityMaxCount=50000000;
                                                                                     CappedActivityCollectionLowActivityMaxCount=1000000;
                                                                                     CappedActivityCollectionUpdateCurrentCollectionActivityCountConfiguration=;
                                                                                     DataDriveFreeSpaceCriticalPercentage=0.05; DataDriveFreeSpaceCriticalSize=50 GB;
                                                                                     DataDriveFreeSpaceLowPercentage=0.2; DataDriveFreeSpaceLowSize=200 GB;
                                                                                     WorkingSetPercentage=0.25; LogFileMaxSize=50 MB; LogFileMaxCount=10;
                                                                                     BackupSystemProfileConfiguration=; DeleteOldCappedCollectionsConfiguration=;
                                                                                     MonitorDatabaseConfiguration=}
    DetectionConfiguration                                                         : @{AlertConfiguration=; NotificationVerbosity=Low}
    DirectoryServicesReplicationDetectorConfiguration                              : @{OperationRetentionPeriod=00:03:00; RemoveOldOperationsConfiguration=;
                                                                                     ExcludedSourceComputerIds=System.Object[]; ExcludedSubnets=System.Object[];
                                                                                     BlockConfiguration=; IsEnabled=True; UpsertProfileConfiguration=}
    DnsReconnaissanceDetectorConfiguration                                         : @{ExcludedSourceComputerIds=System.Object[]; ExcludedSubnets=System.Object[];
                                                                                     BlockConfiguration=; IsEnabled=True; UpsertProfileConfiguration=}
    EncryptedTimestampEncryptionDowngradeDetectorConfiguration                     : @{BlockConfiguration=; IsEnabled=True; UpsertProfileConfiguration=}
    EntityProfilerConfiguration                                                    : @{UpdateDetectionProfileConfiguration=;
                                                                                     UpdateDirectoryServicesTrafficSystemProfileConfiguration=;
                                                                                     EventActivityBlockConfiguration=; NetworkActivityBlockConfiguration=}
    EntityReceiverConfiguration                                                    : @{ActivitiesDroppingEnabled=False; EntityBatchBlockConfiguration=;
                                                                                     EntityBatchBlockSizeAccumulationQueueConfiguration=; GatewayInactivityTimeout=00:15:00}
    EnumerateSessionsDetectorConfiguration                                         : @{OperationRetentionPeriod=00:03:00; RemoveOldOperationsConfiguration=;
                                                                                     ExcludedSourceComputerIds=System.Object[]; ExcludedSubnets=System.Object[];
                                                                                     BlockConfiguration=; IsEnabled=True; UpsertProfileConfiguration=}
    ExternalIpAddressResolverConfiguration                                         : @{CacheConfiguration=; FailedResolutionsAccumulationQueueConfiguration=}
    ForgedPacDetectorConfiguration                                                 : @{BlockConfiguration=; IsEnabled=True; UpsertProfileConfiguration=}
    GoldenTicketDetectorConfiguration                                              : @{KerberosTicketLifetime=10:00:00; ExcludedSourceAccountIds=System.Object[];
                                                                                     BlockConfiguration=; IsEnabled=True; UpsertProfileConfiguration=}
    HoneytokenActivityDetectorConfiguration                                        : @{BlockConfiguration=; IsEnabled=True; UpsertProfileConfiguration=}
    HttpClientConfiguration                                                        : @{BufferMaxSize=128 MB; Timeout=00:10:00}
    IntelligenceProxyConfiguration                                                 : @{ConnectionLimit=50; WebClientConfiguration=}
    LdapBruteForceDetectorConfiguration                                            : @{BlockConfiguration=; IsEnabled=True; UpsertProfileConfiguration=}
    LdapCleartextPasswordDetectorConfiguration                                     : @{BlockConfiguration=; IsEnabled=True; UpsertProfileConfiguration=}
    LoadSimulatorRecorderConfiguration                                             : @{IsEnabled=False; UniqueEntityBatchBlockConfiguration=; EntityBatchBlockConfiguration=;
                                                                                     FileSegmentSize=5 MB}
    LocalizerConfiguration                                                         : @{LocaleId=en-us}
    MailClientConfiguration                                                        : @{IsEnabled=False; From=; ServerEndpoint=; ServerSslEnabled=False;
                                                                                     ServerSslAcceptAnyServerCertificate=False; AuthenticationEnabled=False;
                                                                                     AuthenticationAccountName=; AuthenticationAccountPasswordEncrypted=}
    MassiveObjectDeletionDetectorConfiguration                                     : @{DetectMassiveObjectDeletionConfiguration=; BlockConfiguration=; IsEnabled=True;
                                                                                     UpsertProfileConfiguration=}
    MemoryStreamPoolConfiguration                                                  : @{BlockSize=128 KB; LargeBlockMultipleSize=1 MB; BufferMaxSize=128 MB}
    MonitoringClientConfiguration                                                  : @{AlertConfiguration=; MonitoringAlertTypeNameToIsEnabledMapping=;
                                                                                     RenotificationInterval=7.00:00:00}
    MonitoringEngineConfiguration                                                  : @{CenterNotReceivingTrafficTimeout=01:00:00; GatewayInactivityTimeout=00:05:00;
                                                                                     GatewayStartFailureTimeout=00:30:00; MonitoringAlertExpiration=30.00:00:00;
                                                                                     DeleteOldMonitoringAlertsConfiguration=; MonitoringCycleConfiguration=}
    NetworkActivityProcessorConfiguration                                          : @{ParentKerberosResponseTicketHashKeyToParentKerberosDataMappingConfiguration=;
                                                                                     SaveParentKerberosBloomFiltersConfiguration=}
    NotificationEngineConfiguration                                                : @{NotificationCycleConfiguration=}
    PassTheHashDetectorConfiguration                                               : @{BlockConfiguration=; IsEnabled=True; UpsertProfileConfiguration=}
    PassTheTicketDetectorConfiguration                                             : @{HandleInvisibleSuspiciousActivitiesConfiguration=;
                                                                                     ValidateInvisibleSuspiciousActivitiesTimeout=02:00:00;
                                                                                     ExcludedSourceComputerIds=System.Object[]; ExcludedSubnets=System.Object[];
                                                                                     BlockConfiguration=; IsEnabled=True; UpsertProfileConfiguration=}
    RemoteExecutionDetectorConfiguration                                           : @{OperationRetentionPeriod=00:03:00; RemoveOldOperationsConfiguration=;
                                                                                     ExcludedSourceComputerIds=System.Object[]; ExcludedSubnets=System.Object[];
                                                                                     BlockConfiguration=; IsEnabled=True; UpsertProfileConfiguration=}
    ReporterConfiguration                                                          : @{ReportTypeToConfigurationMapping=; SendPeriodicReportsConfiguration=}
    RetrieveDataProtectionBackupKeyDetectorConfiguration                           : @{OperationRetentionPeriod=00:03:00; RemoveOldOperationsConfiguration=;
                                                                                     ExcludedSourceComputerIds=System.Object[]; ExcludedSubnets=System.Object[];
                                                                                     BlockConfiguration=; IsEnabled=True; UpsertProfileConfiguration=}
    SamrReconnaissanceDetectorConfiguration                                        : @{HandleInvisibleSuspiciousActivitiesConfiguration=; OperationRetentionPeriod=00:03:00;
                                                                                     RemoveOldOperationsConfiguration=; ExcludedSourceComputerIds=System.Object[];
                                                                                     ExcludedSubnets=System.Object[]; BlockConfiguration=; IsEnabled=True;
                                                                                     UpsertProfileConfiguration=}
    SecretManagerConfiguration                                                     : @{CertificateThumbprint=217562C96ECAF3A574303629848640F556A253FB}
    ServiceSystemProfileConfiguration                                              : @{Id=58f53fded8c26706b8ebb122}
    SoftwareUpdaterConfiguration                                                   : @{IsEnabled=True; IsGatewayAutomaticSoftwareUpdateEnabled=True;
                                                                                     IsLightweightGatewayAutomaticRestartEnabled=False;
                                                                                     MicrosoftUpdateCategoryId=6ac905a5-286b-43eb-97e2-e23b3848c87d;
                                                                                     CheckSoftwareUpdatesConfiguration=}
    SourceAccountSupportedEncryptionTypesEncryptionDowngradeDetectorConfiguration  : @{BlockConfiguration=; IsEnabled=True; UpsertProfileConfiguration=}
    SourceComputerSupportedEncryptionTypesEncryptionDowngradeDetectorConfiguration : @{BlockConfiguration=; IsEnabled=True; UpsertProfileConfiguration=}
    SyncManagerConfiguration                                                       : @{UpdateClientsConfiguration=}
    SyslogClientConfiguration                                                      : @{IsEnabled=False; ServerEndpoint=; ServerTransport=Udp;
                                                                                     ServerTransportTimeout=00:00:10; Serializer=Rfc5424}
    TgtEncryptionDowngradeDetectorConfiguration                                    : @{BlockConfiguration=; IsEnabled=True; UpsertProfileConfiguration=}
    UniqueEntityCacheConfiguration                                                 : @{CacheConfiguration=}
    UniqueEntityProcessorConfiguration                                             : @{HoneytokenAccountIds=System.Object[]; UniqueEntityBlockParallelismDegree=100;
                                                                                     UpdateSecurityPrincipalsSensitivityConfiguration=;
                                                                                     GetHighFunctionalityDomainControlerIdsConfiguration=;
                                                                                     GetHoneytokenAccountIdsConfiguration=}
    UniqueEntityProfileCacheConfiguration                                          : @{CacheConfiguration=; UniqueEntityProfileBlockConfiguration=;
                                                                                     StoreUniqueEntityProfilesConfiguration=}
    UserAccountClusterDetectorConfiguration                                        : @{ClusterUserAccountsConfiguration=}
    WindowsEventLogClientConfiguration                                             : @{IsEnabled=True}

    The above command retrieves the current configuration for the ATA Center.

.EXAMPLE
    Get-ATAStatus -Gateway | Select ServiceStatus, Status, Version, NetBiosName | fl

    ServiceStatus : Stopped
    Status        : StartFailure
    Version       : 1.8.6229.4854
    NetbiosName   : 2012R2-DC1

    The above example retrieves a list of information for all gateways and displays the ServiceStatus, Status, Version, and NetBiosName of the server.
#>
function Get-ATAStatus {
    [CmdletBinding()]
    Param
    (
        # Retrieves ATA Center status information.
        [Parameter(Mandatory = $false,
            ValueFromPipelineByPropertyName = $true,
            ParameterSetName = 'Center')]
        [switch]$Center,
        # Retrieves ATA Gateway status information.
        [Parameter(Mandatory = $false,
            ValueFromPipelineByPropertyName = $true,
            ParameterSetName = 'Gateway')]
        [switch]$Gateway,
        # Retrieves information around the current ATA License.
        [Parameter(Mandatory = $false,
            ValueFromPipelineByPropertyName = $true,
            ParameterSetName = 'License')]
        [switch]$License
    )
    if (!$Global:ATACenter) {$Script:ATACenter = 'localhost'}
    try {
        if ($Center) {$foo = "center"}
        if ($Gateway) {$foo = "gateways"}
        if ($License) {$foo = "license"}

        $result = Invoke-RestMethod -Uri "https://$ATACenter/api/management/systemProfiles/$foo" -Method Get -UseDefaultCredentials
        $result
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