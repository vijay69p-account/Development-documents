@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PRODMAP TABLE'
@Metadata.ignorePropagatedAnnotations: true
define view entity YYPRODMAP_I as select from zposprodmap
association to parent YYACCOUNTS_I as _accounts
    on $projection.Poskunnr = _accounts.Poskunnr
    and $projection.Channel = _accounts.Channel
    and $projection.Division = _accounts.Division
    
    {
   key poskunnr as Poskunnr,
    key channel as Channel,
    key division as Division,
   key kunnrmatnr as Kunnrmatnr,
    material as Material,
    @Semantics.user.createdBy: true
    local_created_by as LocalCreatedBy,
    @Semantics.systemDateTime.createdAt: true
    local_created_at as LocalCreatedAt,
    @Semantics.user.lastChangedBy: true
    local_last_changed_by as LocalLastChangedBy,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    _accounts // Make association public
}
