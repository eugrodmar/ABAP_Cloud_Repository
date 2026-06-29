@AbapCatalog.sqlViewName: 'ZCDS_MEDIA_17'
@AbapCatalog.compiler.compareFilter: true

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ejercicio CDS'
@Metadata.ignorePropagatedAnnotations: true
define view zcds_media_vue_17 as select from /dmo/flight as vuelo
inner join  /dmo/carrier as aerolinea on aerolinea.carrier_id = vuelo.carrier_id


{
  
    avg( vuelo.price ) as media,
    vuelo.currency_code,
    aerolinea.name,
    max( vuelo.price ) as precio_max,
    min( vuelo.price ) as precio_min,
    
    count(*) as total_vuelos
}

group by vuelo.currency_code, aerolinea.name
