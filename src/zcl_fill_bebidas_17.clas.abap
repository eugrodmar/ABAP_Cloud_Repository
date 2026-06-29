CLASS zcl_fill_bebidas_17 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FILL_BEBIDAS_17 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DELETE FROM zbebidas_17.
INSERT zbebidas_17 FROM TABLE @( VALUE #(
( codigo = '001' nombre = 'Mahou 5 Estrellas' tipo = 'Cerveza' origen = 'España' graduacion = 55 precio = 150 )
( codigo = '002' nombre = 'Jack Daniels' tipo = 'Whiskey' origen = 'Estados Unidos' graduacion = 400 precio = 2500 )
( codigo = '003' nombre = 'Bacardi Carta Blanca' tipo = 'Ron' origen = 'Cuba' graduacion = 375 precio = 1800 )
( codigo = '004' nombre = 'Jameson' tipo = 'Whiskey' origen = 'Irlanda' graduacion = 400 precio = 2200 )
( codigo = '005' nombre = 'Estrella Damm' tipo = 'Cerveza' origen = 'España' graduacion = 55 precio = 140 )
( codigo = '006' nombre = 'Hendricks' tipo = 'Ginebra' origen = 'Escocia' graduacion = 415 precio = 3200 )
) ).
out->write( 'Datos cargados OK' ).

  ENDMETHOD.
ENDCLASS.
