@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Posdatabase table interface'
@Metadata.ignorePropagatedAnnotations: true
define view entity zposdatabase_i as select from zposdatabase
association to parent zposfiledmap_i as _fieldmap on $projection.Poskunnr = _fieldmap.Poskunnr
                                                  and $projection.Channel = _fieldmap.Channel
                                                  and $projection.Division = _fieldmap.Division
association [1] to zposaccounts_i as _accounts on $projection.Poskunnr = _accounts.Poskunnr
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
    filename   as filename,
    @Semantics.user.createdBy: true
    local_created_by as LocalCreatedBy,
    @Semantics.systemDateTime.createdAt: true
    local_created_at as LocalCreatedAt,
    @Semantics.user.lastChangedBy: true
    local_last_changed_by as LocalLastChangedBy,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    _fieldmap,
    _accounts
}

