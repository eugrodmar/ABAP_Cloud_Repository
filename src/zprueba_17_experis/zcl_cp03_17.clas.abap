CLASS zcl_cp03_17 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cp03_17 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lo_manager) = NEW zcl_flight_manager_17( ).


    TRY.
        lo_manager->zif_flight_manager_17~add_flight(
        VALUE #( aerolinea = 'LH' n_vuelo = '0400' airport_from = 'FRA' airport_to = 'JFK' price = 899 seats = 15 ) ).
        lo_manager->zif_flight_manager_17~add_flight(
        VALUE #( aerolinea = 'IB' n_vuelo = '3740' airport_from = 'MAD' airport_to = 'BCN' price = 120 seats = 42 ) ).
        lo_manager->zif_flight_manager_17~add_flight(
        VALUE #( aerolinea = 'AA' n_vuelo = '0017' airport_from = 'JFK' airport_to = 'SFO' price = 450 seats = 0  ) ).
        lo_manager->zif_flight_manager_17~add_flight(
        VALUE #( aerolinea = 'LH' n_vuelo = '0455' airport_from = 'FRA' airport_to = 'MAD' price = 310 seats = 8  ) ).
        lo_manager->zif_flight_manager_17~add_flight(
        VALUE #( aerolinea = 'SQ' n_vuelo = '0026' airport_from = 'SIN' airport_to = 'FRA' price = 1250 seats = 5 ) ).
    CATCH zcx_flight_error_17 INTO DATA(lx_error).
        out->write( lx_error->mv_mensaje ).
    ENDTRY.


    TRY.
        lo_manager->zif_flight_manager_17~add_flight(
        VALUE #( aerolinea = 'AA' n_vuelo = '9999' airport_from = 'JFK' airport_to = 'LAX' price = -100 seats = 10 ) ).
    CATCH zcx_flight_error_17 INTO DATA(lx_error2).
        out->write( lx_error2->mv_mensaje ).
    ENDTRY.


    TRY.
        lo_manager->zif_flight_manager_17~add_flight(
        VALUE #( aerolinea = 'LH' n_vuelo = '0400' airport_from = 'FRA' airport_to = 'JFK' price = 899 seats = 15 ) ).
    CATCH zcx_flight_error_17 INTO DATA(lx_error3).
        out->write( lx_error3->mv_mensaje ).
    ENDTRY.


    DATA lt_result TYPE zif_flight_manager_17=>tt_flights.
    lo_manager->zif_flight_manager_17~get_flights_by_airline( EXPORTING i_codigo = 'LH' IMPORTING rv_result = lt_result ).
    out->write( '-- Vuelos de LH --' ).
    out->write( lt_result ).


    DATA(ls_cheapest) = lo_manager->zif_flight_manager_17~get_cheapest_flight( ).
    out->write( '-- Vuelo más barato --' ).
    out->write( ls_cheapest ).


    DATA(lv_total) = lo_manager->zif_flight_manager_17~get_total_revenue( ).
    out->write( '-- Facturación total --' ).
    out->write( lv_total ).



  ENDMETHOD.
ENDCLASS.
