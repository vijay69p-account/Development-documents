@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'FIELDMAP TABLE'
@Metadata.ignorePropagatedAnnotations: true
define view entity YYFIELDMAP_I as select from zposfieldmap
association to parent YYACCOUNTS_I as _ACCOUNTS
    on $projection.Poskunnr = _ACCOUNTS.Poskunnr
    and $projection.Channel = _ACCOUNTS.Channel
    and $projection.Division = _ACCOUNTS.Division
{
    key poskunnr as Poskunnr,
    key channel as Channel,
    key division as Division,
    key excelfield as Excelfield,
    key targetfield as Targetfield,
    @Semantics.user.createdBy: true
    local_created_by as LocalCreatedBy,
    @Semantics.systemDateTime.createdAt: true
    local_created_at as LocalCreatedAt,
    @Semantics.user.lastChangedBy: true
    local_last_changed_by as LocalLastChangedBy,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    _ACCOUNTS // Make association public
}
