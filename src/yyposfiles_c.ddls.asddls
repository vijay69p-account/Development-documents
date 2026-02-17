@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'posfiles_consumptions'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity yyposfiles_c as projection on YYPOSFILES_I
{
    key Poskunnr,
    key Channel,
    key Division,
    key Fileid,
    @Semantics.largeObject: {
  acceptableMimeTypes: [ 'application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' ]
}
    Filename,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChnagedAt,
    /* Associations */
    _accounts : redirected to parent yyaccounts_c
}
