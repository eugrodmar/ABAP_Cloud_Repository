@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista base Bebidas'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_BEBIDAS_17
  as select from zbebidas_17
{
  key codigo     as Codigo,
      nombre     as Nombre,
      tipo       as Tipo,
      origen     as Origen,
      graduacion as Graduacion,
      precio     as Precio
}
