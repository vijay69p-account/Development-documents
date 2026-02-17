@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'account consumption'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity yyaccounts_c 
 provider contract transactional_query as projection on YYACCOUNTS_I
{
    key Poskunnr,
    key Channel,
    key Division,
    Bukrs,
    Posfrequency,
    Columns,
    Description,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _FIELDMAP : redirected to composition child yyfieldmap_c,
    _files    : redirected to composition child yyposfiles_c,
    _prodmap  : redirected to composition child yyprodmap_c
}
