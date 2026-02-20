@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'posdatabase consumption'
@Metadata.ignorePropagatedAnnotations: true
define view entity yyposdatabase_c as projection on yyposdatabase_i
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
    Filename,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    /* Associations */
    _accounts : redirected to parent yyaccounts_c
}
