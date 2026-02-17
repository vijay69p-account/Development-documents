@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'fieldmap consumption'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity yyfieldmap_c as projection on YYFIELDMAP_I
{
    key Poskunnr,
    key Channel,
    key Division,
    key Excelfield,
    key Targetfield,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    /* Associations */
    _ACCOUNTS : redirected to parent yyaccounts_c
}
