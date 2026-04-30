@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Prueba de CDS'

define view entity ZCDS_VUELO_17
  as select from /dmo/carrier  as carrier

    join         /dmo/flight as flight

    on carrier.carrier_id = flight.carrier_id

{
  key
  carrier.name         as Nombre,
  flight.connection_id as Conexion,
  flight.flight_date   as Fecha
}
