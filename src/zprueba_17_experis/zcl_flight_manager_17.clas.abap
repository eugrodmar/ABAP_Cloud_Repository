CLASS zcl_flight_manager_17 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:

      constructor
        IMPORTING i_flights TYPE zif_flight_manager_17=>tt_flights OPTIONAL.

    INTERFACES zif_flight_manager_17 .
  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA flights TYPE zif_flight_manager_17=>tt_flights.

ENDCLASS.



CLASS zcl_flight_manager_17 IMPLEMENTATION.

  METHOD constructor.

    IF i_flights IS NOT INITIAL.
      flights = i_flights.
    ENDIF.

  ENDMETHOD.

  METHOD zif_flight_manager_17~add_flight.

    IF i_flight-price <= 0.
      RAISE EXCEPTION NEW zcx_flight_error_17( i_mensaje = 'El precio no puede ser negativo' ).
    ENDIF.

    READ TABLE flights TRANSPORTING NO FIELDS WITH KEY aerolinea = i_flight-aerolinea n_vuelo = i_flight-n_vuelo.
    IF sy-subrc = 0.
      RAISE EXCEPTION NEW zcx_flight_error_17( i_mensaje = 'El vuelo ya existe' ).
    ENDIF.

    APPEND i_flight TO flights.

  ENDMETHOD.

  METHOD zif_flight_manager_17~get_cheapest_flight.

    ls_vuelo = REDUCE zvuelos_17( INIT ls_min = flights[ 1 ]
                     FOR ls_current IN flights
                     NEXT ls_min = COND #( WHEN ls_vuelo-price < ls_min-price
                                           THEN ls_vuelo
                                           ELSE ls_min ) ).

  ENDMETHOD.

  METHOD zif_flight_manager_17~get_flights_by_airline.

    rv_result = VALUE zif_flight_manager_17=>tt_flights(
    FOR ls_vuelo IN flights
    WHERE ( aerolinea = i_codigo )
    ( ls_vuelo ) ).

  ENDMETHOD.

  METHOD zif_flight_manager_17~get_total_revenue.
    lv_factura = REDUCE #( INIT lv_total = 0
                           FOR ls_precio IN flights
                           NEXT lv_total = lv_total + ls_precio-price ).
  ENDMETHOD.

ENDCLASS.
