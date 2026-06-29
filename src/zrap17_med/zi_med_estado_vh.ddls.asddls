@Metadata.ignorePropagatedAnnotations: true
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help Estado'
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}

define view entity ZI_MED_ESTADO_VH
  as select from I_Language
{
  cast( 'D'  as zde_med_estado ) as Estado,
  cast( 'Disponible' as abap.char(15) ) as Descripcion
}
union select from I_Language
{
  cast( 'BM' as zde_med_estado ) as Estado,
  cast( 'Bajo mínimos' as abap.char(15) ) as Descripcion
}
union select from I_Language
{
  cast( 'SE' as zde_med_estado ) as Estado,
  cast( 'Sin existencias' as abap.char(15) ) as Descripcion
}
where I_Language.Language = $session.system_language
