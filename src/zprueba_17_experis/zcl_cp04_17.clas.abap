CLASS zcl_cp04_17 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp04_17 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA lt_vuelos TYPE TABLE OF zvuelos_17.
    DATA ls_vuelo  TYPE zvuelos_17.

    ls_vuelo-client       = sy-mandt.
    ls_vuelo-aerolinea    = 'LH'.
    ls_vuelo-n_vuelo      = '0400'.
    ls_vuelo-airport_from = 'FRA'.
    ls_vuelo-airport_to   = 'JFK'.
    ls_vuelo-price        = 899.
    ls_vuelo-seats        = 15.
    APPEND ls_vuelo TO lt_vuelos.

    ls_vuelo-client       = sy-mandt.
    ls_vuelo-aerolinea    = 'AA'.
    ls_vuelo-n_vuelo      = '0017'.
    ls_vuelo-airport_from = 'JFK'.
    ls_vuelo-airport_to   = 'SFO'.
    ls_vuelo-price        = 450.
    ls_vuelo-seats        = 0.
    APPEND ls_vuelo TO lt_vuelos.

    ls_vuelo-client       = sy-mandt.
    ls_vuelo-aerolinea    = 'IB'.
    ls_vuelo-n_vuelo      = '3740'.
    ls_vuelo-airport_from = 'MAD'.
    ls_vuelo-airport_to   = 'BCN'.
    ls_vuelo-price        = 120.
    ls_vuelo-seats        = 42.
    APPEND ls_vuelo TO lt_vuelos.

    ls_vuelo-client       = sy-mandt.
    ls_vuelo-aerolinea    = 'LH'.
    ls_vuelo-n_vuelo      = '0455'.
    ls_vuelo-airport_from = 'FRA'.
    ls_vuelo-airport_to   = 'MAD'.
    ls_vuelo-price        = 310.
    ls_vuelo-seats        = 8.
    APPEND ls_vuelo TO lt_vuelos.

    ls_vuelo-client       = sy-mandt.
    ls_vuelo-aerolinea    = 'AA'.
    ls_vuelo-n_vuelo      = '0064'.
    ls_vuelo-airport_from = 'SFO'.
    ls_vuelo-airport_to   = 'JFK'.
    ls_vuelo-price        = 510.
    ls_vuelo-seats        = 3.
    APPEND ls_vuelo TO lt_vuelos.

    ls_vuelo-client       = sy-mandt.
    ls_vuelo-aerolinea    = 'IB'.
    ls_vuelo-n_vuelo      = '3950'.
    ls_vuelo-airport_from = 'BCN'.
    ls_vuelo-airport_to   = 'LHR'.
    ls_vuelo-price        = 275.
    ls_vuelo-seats        = 0.
    APPEND ls_vuelo TO lt_vuelos.

    ls_vuelo-client       = sy-mandt.
    ls_vuelo-aerolinea    = 'LH'.
    ls_vuelo-n_vuelo      = '2030'.
    ls_vuelo-airport_from = 'MUC'.
    ls_vuelo-airport_to   = 'FRA'.
    ls_vuelo-price        = 95.
    ls_vuelo-seats        = 60.
    APPEND ls_vuelo TO lt_vuelos.

    ls_vuelo-client       = sy-mandt.
    ls_vuelo-aerolinea    = 'SQ'.
    ls_vuelo-n_vuelo      = '0026'.
    ls_vuelo-airport_from = 'SIN'.
    ls_vuelo-airport_to   = 'FRA'.
    ls_vuelo-price        = 1250.
    ls_vuelo-seats        = 5.
    APPEND ls_vuelo TO lt_vuelos.

    MODIFY zvuelos_17 FROM TABLE @lt_vuelos.

    IF sy-subrc = 0.
      out->write( 'Vuelos insertados correctamente' ).
    ELSE.
      out->write( 'Error al insertar' ).
    ENDIF.

    SELECT FROM zvuelos_17 FIELDS aerolinea, n_vuelo, airport_from, airport_to, price, seats,
    CASE
    WHEN price BETWEEN 0 AND 150 THEN 'Económico'
    WHEN price BETWEEN 151 AND 500 THEN 'Estándar'
    WHEN price BETWEEN 501 AND 1000 THEN 'Premium'
    WHEN price > 1000 THEN 'First Class'
    END AS class_name
    INTO TABLE @DATA(lt_clase).

    SELECT FROM zvuelos_17 FIELDS
        Concat( concat( aerolinea , '-' ) , n_vuelo ) AS vuelo,
        LOWER( airport_to ) AS airport_to,
        LENGTH( airport_to ) AS airport_to_length
    WHERE seats > 0
    AND ( ( airport_from = 'FRA' ) OR ( airport_to = 'FRA' ) )
    AND price < 1000
    INTO TABLE @DATA(lt_clase2).

    LOOP AT lt_clase2 INTO DATA(ls_clase).
      DATA(ls_class) = | { ls_clase-vuelo } / { ls_clase-airport_to } / { ls_clase-airport_to_length }|.
      out->write( ls_class ).
    ENDLOOP.

    SELECT FROM zvuelos_17 FIELDS
     SUM( seats ) AS Plazas_totales,
     MAX( price ) AS Precio_maximo,
     MIN( price ) AS Precio_minimo,
     round( CAST( AVG( price ) AS DEC( 10, 2 ) ), 2 ) AS precio_medio
    INTO TABLE @DATA(lt_clase3).

    IF sy-subrc = 0.
      out->write( lt_clase3 ).
    ENDIF.

    " *** CAMBIO TAREA 4.5: uso de ZST_BOOKING_17 y ZTT_BOOKINGS_17 ***
    DATA lt_reservas TYPE ztt_bookings_17.
    DATA ls_reserva  TYPE zst_booking_17.

    ls_reserva-id_reserva = 1.
    ls_reserva-aerolinea  = 'LH'.
    ls_reserva-num_vuelo  = '0400'.
    ls_reserva-pasajero   = 'Ana García'.
    ls_reserva-fecha      = '20260515'.
    ls_reserva-precio     = '899.00'.
    ls_reserva-estado     = 'A'.
    APPEND ls_reserva TO lt_reservas.

    ls_reserva-id_reserva = 2.
    ls_reserva-aerolinea  = 'IB'.
    ls_reserva-num_vuelo  = '3740'.
    ls_reserva-pasajero   = 'Carlos López'.
    ls_reserva-fecha      = '20260515'.
    ls_reserva-precio     = '120.00'.
    ls_reserva-estado     = 'A'.
    APPEND ls_reserva TO lt_reservas.

    ls_reserva-id_reserva = 3.
    ls_reserva-aerolinea  = 'AA'.
    ls_reserva-num_vuelo  = '0017'.
    ls_reserva-pasajero   = 'John Smith'.
    ls_reserva-fecha      = '20260520'.
    ls_reserva-precio     = '450.50'.
    ls_reserva-estado     = 'A'.
    APPEND ls_reserva TO lt_reservas.

    ls_reserva-id_reserva = 4.
    ls_reserva-aerolinea  = 'LH'.
    ls_reserva-num_vuelo  = '0455'.
    ls_reserva-pasajero   = 'María Pérez'.
    ls_reserva-fecha      = '20260520'.
    ls_reserva-precio     = '310.75'.
    ls_reserva-estado     = 'A'.
    APPEND ls_reserva TO lt_reservas.

    ls_reserva-id_reserva = 5.
    ls_reserva-aerolinea  = 'IB'.
    ls_reserva-num_vuelo  = '3740'.
    ls_reserva-pasajero   = 'Pedro Ruiz'.
    ls_reserva-fecha      = '20260515'.
    ls_reserva-precio     = '120.00'.
    ls_reserva-estado     = 'C'.
    APPEND ls_reserva TO lt_reservas.

    ls_reserva-id_reserva = 6.
    ls_reserva-aerolinea  = 'SQ'.
    ls_reserva-num_vuelo  = '0026'.
    ls_reserva-pasajero   = 'Lisa Tan'.
    ls_reserva-fecha      = '20260601'.
    ls_reserva-precio     = '1250.00'.
    ls_reserva-estado     = 'A'.
    APPEND ls_reserva TO lt_reservas.

    ls_reserva-id_reserva = 7.
    ls_reserva-aerolinea  = 'LH'.
    ls_reserva-num_vuelo  = '0400'.
    ls_reserva-pasajero   = 'Hans Müller'.
    ls_reserva-fecha      = '20260515'.
    ls_reserva-precio     = '899.00'.
    ls_reserva-estado     = 'A'.
    APPEND ls_reserva TO lt_reservas.

    ls_reserva-id_reserva = 8.
    ls_reserva-aerolinea  = 'AA'.
    ls_reserva-num_vuelo  = '0064'.
    ls_reserva-pasajero   = 'Sarah Jones'.
    ls_reserva-fecha      = '20260525'.
    ls_reserva-precio     = '510.00'.
    ls_reserva-estado     = 'A'.
    APPEND ls_reserva TO lt_reservas.

    ls_reserva-id_reserva = 9.
    ls_reserva-aerolinea  = 'IB'.
    ls_reserva-num_vuelo  = '3950'.
    ls_reserva-pasajero   = 'Elena Martín'.
    ls_reserva-fecha      = '20260601'.
    ls_reserva-precio     = '275.30'.
    ls_reserva-estado     = 'A'.
    APPEND ls_reserva TO lt_reservas.

    ls_reserva-id_reserva = 10.
    ls_reserva-aerolinea  = 'LH'.
    ls_reserva-num_vuelo  = '2030'.
    ls_reserva-pasajero   = 'Franz Weber'.
    ls_reserva-fecha      = '20260610'.
    ls_reserva-precio     = '95.00'.
    ls_reserva-estado     = 'A'.
    APPEND ls_reserva TO lt_reservas.

    DATA lt_temp TYPE TABLE OF zreservas_17.
    lt_temp = CORRESPONDING #( lt_reservas ).
    MODIFY zreservas_17 FROM TABLE @lt_temp.

    IF sy-subrc = 0.
      out->write( 'Reservas insertadas correctamente' ).
    ELSE.
      out->write( 'Error al insertar' ).
    ENDIF.

    UPDATE zreservas_17 SET precio = 480 WHERE id_reserva = 3.

    SELECT * FROM zreservas_17
    WHERE aerolinea = 'LH'
    INTO TABLE @DATA(lt_aerolinea).

    LOOP AT lt_aerolinea INTO DATA(ls_aerolinea).
      ls_aerolinea-precio = ls_aerolinea-precio * '0.90'.
      MODIFY zreservas_17 FROM @ls_aerolinea.
    ENDLOOP.

    SELECT * FROM zreservas_17
    ORDER BY id_reserva ASCENDING
    INTO TABLE @DATA(lt_reservado).
    out->write( lt_reservado ).

    UPDATE zreservas_17 SET estado = 'C' WHERE id_reserva = 4.
    DELETE FROM zreservas_17 WHERE estado = 'C'.
    out->write( |Registros eliminados: { sy-dbcnt }| ).

    SELECT * FROM zreservas_17
    ORDER BY id_reserva ASCENDING
    INTO TABLE @DATA(lt_reservado2).
    out->write( lt_reservado2 ).

    SELECT FROM zreservas_17 FIELDS *
    INTO TABLE @DATA(lt_dummy).

    READ TABLE lt_dummy TRANSPORTING NO FIELDS WITH KEY pasajero = 'Lisa Tan'.
    IF sy-subrc = 0.
      out->write( 'Lisa Tan ya está registrada' ).
    ELSE.
      out->write( 'Lisa Tan no está registrada' ).
    ENDIF.

    READ TABLE lt_dummy REFERENCE INTO DATA(lr_reserva) WITH KEY id_reserva = 6.
    IF sy-subrc = 0.
      out->write( lr_reserva->* ).
    ELSE.
      out->write( 'No hay registro' ).
    ENDIF.

    DATA(lv_pasajero) = lt_dummy[ id_reserva = 1 ]-pasajero.
    out->write( lv_pasajero ).

    SELECT FROM zreservas_17 FIELDS aerolinea,
    COUNT( * ) AS reservas,
    SUM( precio ) AS precio_total,
    round( CAST( AVG( precio ) AS DEC( 10, 2 ) ), 2 ) AS precio_medio
    GROUP BY aerolinea
    INTO TABLE @DATA(lt_agrupado).
    out->write( lt_agrupado ).

  ENDMETHOD.

ENDCLASS.
