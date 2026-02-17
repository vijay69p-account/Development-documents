@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'prodmap consumption'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity yyprodmap_c as projection on YYPRODMAP_I
{
    key Poskunnr,
    key Channel,
    key Division,
    key Kunnrmatnr,
    Material,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    /* Associations */
    _accounts : redirected to parent yyaccounts_c
}
