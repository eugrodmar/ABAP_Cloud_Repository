CLASS zcl_bucles DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bucles IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*DATA lv_nombre TYPE string VALUE 'Paco'.
*
*IF lv_nombre = 'daniel'.
*
*    out->write( 'hola daniel' ).
*ELSEIF lv_nombre = 'Sara'.
*    out->write( 'hola Sara' ).
*
*    ELSE.
*    out->write( 'Tú no eres ni Daniel ni Sara' ).
*
*
*ENDIF.
*
*out->write( 'termina el programa' ).

DATA lv_edad TYPE i VALUE 10.
DATA lv_nombre TYPE string VALUE 'Daniel'.

DATA(lv_num) = 0.

do 3 times.

    out->write( lv_num ).
    lv_num = lv_num + 1.
enddo.





  ENDMETHOD.

ENDCLASS.
