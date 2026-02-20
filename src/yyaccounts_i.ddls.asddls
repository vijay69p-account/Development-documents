@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ACCOUNTS TABLE'
@Metadata.ignorePropagatedAnnotations: true
define root view entity YYACCOUNTS_I as select from zposaccounts
composition[0..*] of YYFIELDMAP_I as _FIELDMAP
composition[0..*] of YYPRODMAP_I as _prodmap
composition[0..*] of YYPOSFILES_I as _files
composition[0..*] of yyposdatabase_i as _posdatabase 


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
    _FIELDMAP, // Make association public
    _prodmap,
    _files,
    _posdatabase
}
