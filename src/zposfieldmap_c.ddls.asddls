@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Fieldmap consumtion'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity zposfieldmap_c as projection on zposfiledmap_i
{
    key Poskunnr,
    key Channel,
    key Division,
    Excelfield,
    Targetfield,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    /* Associations */
    _posaccounts : redirected to parent zposaccounts_c,
    _posdatabase :redirected to composition child zposdatabase_c
}
