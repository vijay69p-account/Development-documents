@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Account consumptions'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true

define root view entity zposaccounts_c
provider contract transactional_query as projection on zposaccounts_i
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
    _fieldmap : redirected to composition child zposfieldmap_c
    }
