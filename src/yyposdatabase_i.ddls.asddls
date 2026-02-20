@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'posdatabase table'
@Metadata.ignorePropagatedAnnotations: true
define view entity yyposdatabase_i as select from zposdatabase
association to parent YYACCOUNTS_I as _accounts 
                  on $projection.Poskunnr = _accounts.Poskunnr
                  and $projection.Channel = _accounts.Channel
                  and $projection.Division = _accounts.Division
{
    key record_id as RecordId,
    poskunnr as Poskunnr,
    channel as Channel,
    division as Division,
    bukrs as Bukrs,
    posfrequency as Posfrequency,
    datefrom as Datefrom,
    dateto as Dateto,
    qtysold as Qtysold,
    qtyavailable as Qtyavailable,
    kunnrmatnr as Kunnrmatnr,
    filename as Filename,
    local_created_by as LocalCreatedBy,
    local_created_at as LocalCreatedAt,
    local_last_changed_by as LocalLastChangedBy,
    local_last_changed_at as LocalLastChangedAt,
    
    _accounts
}
