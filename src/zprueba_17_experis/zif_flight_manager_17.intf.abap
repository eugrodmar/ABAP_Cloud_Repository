INTERFACE zif_flight_manager_17
  PUBLIC .

  TYPES tt_flights TYPE STANDARD TABLE OF zvuelos_17 WITH EMPTY KEY.

  METHODS:

    add_flight
      IMPORTING i_flight TYPE zvuelos_17
      RAISING   zcx_flight_error_17,

    get_flights_by_airline
      IMPORTING i_codigo  TYPE zvuelos_17-aerolinea
      EXPORTING rv_result TYPE tt_flights,

    get_cheapest_flight
      RETURNING VALUE(ls_vuelo) TYPE zvuelos_17,

    get_total_revenue
      RETURNING VALUE(lv_factura) TYPE zvuelos_17-price.

ENDINTERFACE.
