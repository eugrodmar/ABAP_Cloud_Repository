@AbapCatalog.sqlViewName: 'ZCDS_FLIGHT_17'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ejercicio CDS'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDS_FLIGHT_REPORT_17
  as select from /dmo/flight     as vuelo
    inner join   /dmo/carrier    as aerolineas on aerolineas.carrier_id = vuelo.carrier_id
    inner join   /dmo/connection as conexiones on  conexiones.carrier_id    = vuelo.carrier_id
                                               and conexiones.connection_id = vuelo.connection_id
{

  key vuelo.connection_id                                                              as conexion,
  key vuelo.flight_date                                                                as fecha_vuelo,
  key vuelo.carrier_id                                                                 as aerolinea,
      aerolineas.name                                                                  as nombre_aerolinea,
      vuelo.price                                                                      as precio,
      vuelo.currency_code                                                              as moneda,

      @Semantics.amount.currencyCode: 'moneda'
      division(vuelo.price * 80, 100, 2)                                               as precio_con_descuento,

      @Semantics.amount.currencyCode: 'moneda'
      vuelo.price - division(vuelo.price * 80, 100, 2)                                 as descontado,

      case
          when vuelo.price < 300 then 'BARATO'
          when vuelo.price >= 300 and vuelo.price <= 700 then 'MEDIO'
          else 'CARO'
      end                                                                              as categoria_precio,

      concat(
      concat(
        concat( concat( left( cast(conexiones.departure_time as abap.char(6)), 2 ), ':' ),
        substring( cast(conexiones.departure_time as abap.char(6)), 3, 2 ) ),
      ' -  ' ),
      concat( concat( left( cast(conexiones.arrival_time as abap.char(6)), 2 ), ':' ),
      substring( cast(conexiones.arrival_time as abap.char(6)), 3, 2 ) )
      )                                                                                as duracion_trayecto,

      concat( concat( conexiones.airport_from_id, ' -> ' ), conexiones.airport_to_id ) as ruta,
      conexiones.distance,
      conexiones.distance_unit

}

where
      vuelo.price         >  0
  and vuelo.currency_code <> ''
