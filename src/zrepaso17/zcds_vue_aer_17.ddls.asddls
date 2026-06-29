@AbapCatalog.sqlViewName: 'ZCDS_VUE_17'
@AbapCatalog.compiler.compareFilter: true

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ejercicio CDS'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDS_VUE_AER_17
  as select from /dmo/carrier
    inner join   /dmo/flight on /dmo/carrier.carrier_id = /dmo/flight.carrier_id

{

  /dmo/carrier.name,
 /dmo/flight.connection_id,
  /dmo/flight.flight_date,
  /dmo/flight.price,
  /dmo/flight.currency_code,

  division(/dmo/flight.price * 80, 100, 2) as descuento


}
