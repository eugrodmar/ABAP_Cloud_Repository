CLASS zcl_tablas_erm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tablas_erm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    TYPES: BEGIN OF ty_alumnos,
*             nombre TYPE string,
*             edad   TYPE i,
*             ciudad TYPE string,
*           END OF ty_ALUMNOS.
*
*    DATA ls_alumnos TYPE ty_alumnos.
*    DATA lt_alumnos TYPE TABLE OF ty_alumnos.
*    DATA lt_alumnos_aux TYPE TABLE OF ty_alumnos.
*
*    ls_alumnos-nombre = 'Juan'.
*    ls_alumnos-edad = 23.
*    ls_alumnos-ciudad = 'Madrid'.
*    APPEND ls_alumnos TO lt_alumnos.
*
*    ls_alumnos-nombre = 'Maria'.
*    ls_alumnos-edad = 25.
*    ls_alumnos-ciudad = 'Barcelona'.
*    APPEND ls_alumnos TO lt_alumnos.
*
*    ls_alumnos-nombre = 'Jorge'.
*    ls_alumnos-edad = 27.
*    ls_alumnos-ciudad = 'Valencia'.
*    APPEND ls_alumnos TO lt_alumnos.
*
*    LOOP AT lt_alumnos INTO ls_alumnos.
*      IF ls_alumnos-edad > 25.
*        APPEND ls_alumnos TO lt_alumnos_aux.
*      ENDIF.
*    ENDLOOP.
*
*    out->write( lt_alumnos_aux ).

*    DATA lt_vuelos TYPE TABLE OF /dmo/flight.
*    DATA ls_vuelos TYPE /dmo/flight.
*    DATA lv_total TYPE f.
*
*    SELECT * FROM /dmo/flight INTO TABLE @lt_vuelos.
*    out->write( lt_vuelos ).
*
*    LOOP AT lt_vuelos INTO ls_vuelos.
*      lv_total = lv_total + ls_vuelos-price.
*    ENDLOOP.
*
*    out->write( |La suma de todos los vuelos { lv_total }| ).

*    LOOP AT ls_precios INTO lt_vuelos.
*      IF ls_alumnos-edad > 25.
*        APPEND ls_alumnos TO lt_alumnos_aux.
*      ENDIF.
*    ENDLOOP.


    "-------------------------------------------------------------------------------


*    TYPES: BEGIN OF ty_cuadros,
*             autor   TYPE string,
*             titulo  TYPE string,
*             fecha   TYPE d,
*             tecnica TYPE string,
*             museo   TYPE string,
*           END OF ty_cuadros.
*
*    DATA ls_cuadros TYPE ty_cuadros.
*    DATA lt_cuadros TYPE TABLE OF ty_cuadros.
*    DATA lt_cuadros_aux TYPE TABLE OF ty_cuadros.
*
*    ls_cuadros-autor = 'Picasso'.
*    ls_cuadros-titulo = 'Guernica'.
*    ls_cuadros-Fecha = '19370825'.
*    ls_cuadros-Tecnica = 'Oleo sobre tabla'.
*    ls_cuadros-Museo = 'Museo del Prado'.
*    APPEND ls_cuadros TO lt_cuadros.
*
*    ls_cuadros-autor = 'Picasso'.
*    ls_cuadros-titulo = 'La Barra'.
*    ls_cuadros-Fecha = '19370825'.
*    ls_cuadros-Tecnica = 'Oleo sobre lienzo'.
*    ls_cuadros-Museo = 'Museo del Prado'.
*    APPEND ls_cuadros TO lt_cuadros.
*
*    ls_cuadros-autor = 'Leonardo da Vinci'.
*    ls_cuadros-titulo = 'La Gioconda'.
*    ls_cuadros-Fecha = '15031017'.
*    ls_cuadros-Tecnica = 'Oleo sobre tabla'.
*    ls_cuadros-Museo = 'Museo del Louvre'.
*    APPEND ls_cuadros TO lt_cuadros.
*
*    ls_cuadros-autor = 'Vincent van Gogh'.
*    ls_cuadros-titulo = 'La noche estrellada'.
*    ls_cuadros-Fecha = '18890618'.
*    ls_cuadros-Tecnica = 'Oleo sobre lienzo'.
*    ls_cuadros-Museo = 'Museo de Arte Moderno (MoMA)'.
*    APPEND ls_cuadros TO lt_cuadros.
*
*    ls_cuadros-autor = 'Sandro Botticelli'.
*    ls_cuadros-titulo = 'El nacimiento de Venus'.
*    ls_cuadros-Fecha = '14840406'.
*    ls_cuadros-Tecnica = 'Temple sobre lienzo'.
*    ls_cuadros-Museo = 'Galeria Uffizi'.
*    APPEND ls_cuadros TO lt_cuadros.
*
*    ls_cuadros-autor = 'Diego Velazquez'.
*    ls_cuadros-titulo = 'Las Meninas'.
*    ls_cuadros-Fecha = '16560101'.
*    ls_cuadros-Tecnica = 'Oleo sobre lienzo'.
*    ls_cuadros-Museo = 'Museo del Prado'.
*    APPEND ls_cuadros TO lt_cuadros.
*
*    ls_cuadros-autor = 'Michelangelo Buonarroti'.
*    ls_cuadros-titulo = 'La creacion de Adan'.
*    ls_cuadros-Fecha = '15081012'.
*    ls_cuadros-Tecnica = 'Fresco'.
*    ls_cuadros-Museo = 'Capilla Sixtina'.
*    APPEND ls_cuadros TO lt_cuadros.
*
*    ls_cuadros-autor = 'Edvard Munch'.
*    ls_cuadros-titulo = 'El grito'.
*    ls_cuadros-Fecha = '18930101'.
*    ls_cuadros-Tecnica = 'Oleo, temple y pastel'.
*    ls_cuadros-Museo = 'Galeria Nacional de Oslo'.
*    APPEND ls_cuadros TO lt_cuadros.
*
*    ls_cuadros-autor = 'Johannes Vermeer'.
*    ls_cuadros-titulo = 'La joven de la perla'.
*    ls_cuadros-Fecha = '16650101'.
*    ls_cuadros-Tecnica = 'Oleo sobre lienzo'.
*    ls_cuadros-Museo = 'Mauritshuis'.
*    APPEND ls_cuadros TO lt_cuadros.
*
*    ls_cuadros-autor = 'Salvador Dali'.
*    ls_cuadros-titulo = 'La persistencia de la memoria'.
*    ls_cuadros-Fecha = '19310101'.
*    ls_cuadros-Tecnica = 'Oleo sobre lienzo'.
*    ls_cuadros-Museo = 'Museo de Arte Moderno (MoMA)'.
*    APPEND ls_cuadros TO lt_cuadros.
*
* LOOP AT lt_cuadros INTO ls_cuadros.
*
*        APPEND ls_cuadros TO lt_cuadros_aux.
*
*    ENDLOOP.
*
*    out->write( lt_cuadros_aux ).


    "------------------------------------------

    DATA lt_reservas TYPE TABLE OF /dmo/booking.
    DATA ls_reservas TYPE /dmo/booking.
    DATA lv_total TYPE f.
    DATA lv_mes TYPE /dmo/booking-booking_date.

    SELECT * FROM /dmo/booking INTO TABLE @lt_reservas.

*    out->write( lt_reservas ).

    LOOP AT lt_reservas INTO ls_reservas.
      lv_mes = ls_reservas-booking_date+4(2).
      IF lv_mes = '02'.
        lv_total = lv_total + ls_reservas-flight_price.
      ENDIF.
    ENDLOOP.
out->write( |Las fechas son { lv_mes }| ).
    out->write( |La suma de todos los precios es { lv_total }| ).

  ENDMETHOD.









ENDCLASS.
