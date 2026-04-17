CLASS zcl_case DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_case IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

DATA lv_edad TYPE i VALUE 10.

CASE lv_edad.

WHEN 10.
    out->write( 'eres un niño' ).

WHEN 15.
    out->write( 'eres un adolescente' ).

WHEN 30.
    out->write( 'eres un adulto' ).

WHEN others.
    out->write( 'eres cualquier cosa' ).

ENDCASE.
    out->write( 'termina el programa' ).

  ENDMETHOD.

ENDCLASS.
