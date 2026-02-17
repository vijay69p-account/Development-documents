@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Posdatabase consumtion'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity zposdatabase_c as projection on zposdatabase_i
{
    key RecordId,
    Poskunnr,
    Channel,
    Division,
    Bukrs,
    Posfrequency,
    Datefrom,
    Dateto,
    Qtysold,
    Qtyavailable,
    Kunnrmatnr,
    filename,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    /* Associations */
    _fieldmap : redirected to parent zposfieldmap_c,
    _accounts : redirected to zposaccounts_c
}
