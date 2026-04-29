CLASS zcl_banco_erm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_banco_erm IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(lo_cliente) = NEW zcl_demo_banco_erm(
                            i_nombre = 'Eugenio'
                            i_saldo = 1000 ).

    DATA lv_nombre TYPE string.
    DATA lv_saldo  TYPE i.
    DATA lv_valido TYPE abap_boolean value abap_true.



    lo_cliente->get_nombre( IMPORTING o_nombre = lv_nombre ).
    lo_cliente->get_saldo( IMPORTING o_saldo = lv_saldo ).
    out->write( |La cuenta de { lv_nombre } tiene { lv_saldo } €| ).
    IF lv_valido = abap_false.
      out->write( 'No hay suficiente saldo' ).
    ENDIF.

    lo_cliente->ingresar( EXPORTING i_cantidad = 500 ).

    lo_cliente->get_nombre( IMPORTING o_nombre = lv_nombre ).
    lo_cliente->get_saldo( IMPORTING o_saldo = lv_saldo ).
    out->write( |La cuenta de { lv_nombre } tiene { lv_saldo } €| ).
    IF lv_valido = abap_false.
      out->write( 'No hay suficiente saldo' ).
    ENDIF.

    lo_cliente->retirar( EXPORTING i_cantidad = 200 IMPORTING o_valido = lv_valido ).

    lo_cliente->get_nombre( IMPORTING o_nombre = lv_nombre ).
    lo_cliente->get_saldo( IMPORTING o_saldo = lv_saldo ).
    out->write( |La cuenta de { lv_nombre } tiene { lv_saldo } €| ).
    IF lv_valido = abap_false.
      out->write( 'No hay suficiente saldo' ).
    ENDIF.

    lo_cliente->retirar( EXPORTING i_cantidad = 2000 IMPORTING o_valido = lv_valido ).

    lo_cliente->get_nombre( IMPORTING o_nombre = lv_nombre ).
    lo_cliente->get_saldo( IMPORTING o_saldo = lv_saldo ).
    out->write( |La cuenta de { lv_nombre } tiene { lv_saldo } €| ).
    IF lv_valido = abap_false.
      out->write( 'No hay suficiente saldo' ).
    ENDIF.



  ENDMETHOD.
ENDCLASS.
