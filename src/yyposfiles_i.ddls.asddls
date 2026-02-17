@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'POS FILES'
@Metadata.ignorePropagatedAnnotations: true
define view entity YYPOSFILES_I as select from zposfiles
association to parent YYACCOUNTS_I as _accounts
    on $projection.Poskunnr  = _accounts.Poskunnr
    and $projection.Channel = _accounts.Channel
    and $projection.Division = _accounts.Division
{
    key poskunnr as Poskunnr,
    key channel as Channel,
    key division as Division,
    key fileid as Fileid,
    filename as Filename,
    @Semantics.user.createdBy: true
    local_created_by as LocalCreatedBy,
    @Semantics.systemDateTime.createdAt: true
    local_created_at as LocalCreatedAt,
    @Semantics.user.lastChangedBy: true
    local_last_changed_by as LocalLastChangedBy,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    @Semantics.systemDateTime.lastChangedAt: true
    last_chnaged_at as LastChnagedAt,
    _accounts // Make association public
}
