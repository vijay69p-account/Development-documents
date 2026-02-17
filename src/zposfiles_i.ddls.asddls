@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'files load'
@Metadata.ignorePropagatedAnnotations: true
define view entity zposfiles_i as select from zposfiles                                            
{
    key poskunnr as Poskunnr,
    key channel as Channel,
    key division as Division,
    fileid as Fileid,
    filename as Filename,
    local_created_by as LocalCreatedBy,
    local_created_at as LocalCreatedAt,
    local_last_changed_by as LocalLastChangedBy,
    local_last_changed_at as LocalLastChangedAt,
    last_chnaged_at as LastChnagedAt
    
}
