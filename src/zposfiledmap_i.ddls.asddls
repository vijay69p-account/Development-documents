@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'filedmap interface'
@Metadata.ignorePropagatedAnnotations: true
define view entity zposfiledmap_i as select from zposfieldmap
composition [0..*] of zposdatabase_i as _posdatabase
association to parent zposaccounts_i as _posaccounts on $projection.Poskunnr = _posaccounts.Poskunnr
                                                     and $projection. Channel  = _posaccounts.Channel
                                                     and $projection. Division = _posaccounts.Division

{
    key poskunnr as Poskunnr,
    key channel as Channel,
    key division as Division,
     excelfield as Excelfield,
     targetfield as Targetfield,
    @Semantics.user.createdBy: true
    local_created_by as LocalCreatedBy,
    @Semantics.systemDateTime.createdAt: true
    local_created_at as LocalCreatedAt,
    @Semantics.user.lastChangedBy: true
    local_last_changed_by as LocalLastChangedBy,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    _posaccounts,
    _posdatabase
    //
    
}
