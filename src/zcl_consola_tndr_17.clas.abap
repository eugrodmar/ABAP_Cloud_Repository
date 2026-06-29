CLASS zcl_consola_tndr_17 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_consola_tndr_17 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lt_matches TYPE TABLE OF REF TO zcl_match_tinder_17.


    APPEND NEW zcl_match_tinder_17(
      i_usuario1       = 'Ana'
      i_usuario2       = 'Luis'
      i_fecha_match    = '20240601'
      i_compatibilidad = 75
    ) TO lt_matches.


    APPEND NEW zcl_match_superlike_17(
      i_usuario1       = 'Sara'
      i_usuario2       = 'Marcos'
      i_fecha_match    = '20240615'
      i_compatibilidad = 95
      i_mensaje        = '¡Eres increíble!'
    ) TO lt_matches.


    LOOP AT lt_matches INTO DATA(lo_match).
      out->write(  lo_match->describir_match( ) ).
    ENDLOOP.


    out->write( |Total matches creados: { zcl_match_tinder_17=>get_total_matches( ) }| ).

  ENDMETHOD.

ENDCLASS.
