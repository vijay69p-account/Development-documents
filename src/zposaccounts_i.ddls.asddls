@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Accounts interface'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zposaccounts_i as select from zposaccounts
composition [0..*] of zposfiledmap_i as _fieldmap
{
 
    key poskunnr as Poskunnr,
    key channel as Channel,
    key division as Division,
    bukrs as Bukrs,
    posfrequency as Posfrequency,
    columns as Columns,
    description as Description,
    @Semantics.user.createdBy: true
    local_created_by as LocalCreatedBy,
    @Semantics.systemDateTime.createdAt: true
    local_created_at as LocalCreatedAt,
    @Semantics.user.lastChangedBy: true
    local_last_changed_by as LocalLastChangedBy,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,
    _fieldmap
}
