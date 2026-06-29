CLASS zcl_test_flight_report_17 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_flight_report_17 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    SELECT * FROM zcds_flight_report_17
    ORDER BY aerolinea ASCENDING,
    conexion ASCENDING,
    fecha_vuelo ASCENDING

    INTO TABLE @DATA(lt_vuelos).
    out->write( lt_vuelos ).

  ENDMETHOD.

ENDCLASS.
