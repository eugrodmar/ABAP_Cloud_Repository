CLASS zcl_consola_17 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_consola_17 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



**********************************************************************
************************** ZCL_BOMB_17 *******************************
**********************************************************************

*  data(lo_bombilla) = new zcl_bomb_17( 'salón' ).
*  data(lo_bombilla2) = new zcl_bomb_17( 'cocina' ).
*
*  data lv_estado type abap_boolean.
*
*  lo_bombilla->get_estado( importing o_estado = lv_estado ).
*  out->write( lv_estado ).
*
*  lo_bombilla->encender(  ).
*
*  lo_bombilla->get_estado( importing o_estado = lv_estado ).
*  out->write( lv_estado ).
*
*  lo_bombilla->apagar(  ).







**********************************************************************
************************** ZCL_CUADRO_17 *****************************
**********************************************************************
*
*    DATA(lo_cuadro) = NEW zcl_cuadro_17(
*                        i_titulo = 'La maja desnuda'
*                        i_fecha = 1800 ).
*
*    DATA(lo_cuadro1) = NEW zcl_cuadro_17(
*                        i_titulo = 'Las Meninas'
*                        i_fecha = 1656 ).
*
*    DATA lv_ficha TYPE string.
*
*    lo_cuadro->mostrar_ficha( importing o_ficha = lv_ficha ).
*    out->write( lv_ficha ).
*
*    lo_cuadro->set_fecha( 1801 ).
*    lo_cuadro->mostrar_ficha( importing o_ficha = lv_ficha ).
*    out->write( lv_ficha ).
*
*    lo_cuadro1->mostrar_ficha( importing o_ficha = lv_ficha ).
*    out->write( lv_ficha ).







**********************************************************************
*********************** ZCL_CALCULADORA_17 ***************************
**********************************************************************

    DATA(lo_calculadora) = NEW zcl_calculadora_17( i_valor_actual = 0 i_nombre = 'Manolo' ).
    DATA lv_valor TYPE i.
    DATA lv_nombre TYPE string.
    DATA lv_error TYPE abap_boolean.



    lo_calculadora->get_valor_actual( IMPORTING o_valor_actual = lv_valor ).
    lo_calculadora->get_nombre( IMPORTING o_nombre = lv_nombre ).
    out->write( |{ lv_nombre } { lv_valor }| ).

    lo_calculadora->sumar( 3 ).
    lo_calculadora->get_valor_actual( IMPORTING o_valor_actual = lv_valor ).
    lo_calculadora->get_nombre( IMPORTING o_nombre = lv_nombre ).
    out->write( |{ lv_nombre } { lv_valor }| ).

    lo_calculadora->potencia( 6 ).
    lo_calculadora->get_valor_actual( IMPORTING o_valor_actual = lv_valor ).
    lo_calculadora->get_nombre( IMPORTING o_nombre = lv_nombre ).
    out->write( |{ lv_nombre } { lv_valor }| ).

*    lo_calculadora->multiplicar( 3 ).
*    lo_calculadora->get_valor_actual( IMPORTING o_valor_actual = lv_valor ).
*    lo_calculadora->get_nombre( IMPORTING o_nombre = lv_nombre ).
*    out->write( |{ lv_nombre } { lv_valor }| ).
*
*    lo_calculadora->restar( 50 ).
*    lo_calculadora->get_valor_actual( IMPORTING o_valor_actual = lv_valor ).
*    lo_calculadora->get_nombre( IMPORTING o_nombre = lv_nombre ).
*    out->write( |{ lv_nombre } { lv_valor }| ).
*
*    lo_calculadora->dividir( 5 ).
*    lo_calculadora->get_valor_actual( IMPORTING o_valor_actual = lv_valor ).
*    lo_calculadora->get_nombre( IMPORTING o_nombre = lv_nombre ).
*    out->write( |{ lv_nombre } { lv_valor }| ).
*
*    lo_calculadora->dividir( EXPORTING i_valor_actual = 0 IMPORTING o_error = lv_error ).
*    IF lv_error = abap_true.
*      out->write( 'ERROR: No se puede dividir por cero' ).
*    ELSE.
*    lo_calculadora->get_valor_actual( IMPORTING o_valor_actual = lv_valor ).
*    lo_calculadora->get_nombre( IMPORTING o_nombre = lv_nombre ).
*    ENDIF.
*    out->write( |{ lv_nombre } { lv_valor } | ).
*
*    lo_calculadora->reset(  ).
*    lo_calculadora->get_valor_actual( IMPORTING o_valor_actual = lv_valor ).
*    lo_calculadora->get_nombre( IMPORTING o_nombre = lv_nombre ).
*    out->write( |{ lv_nombre } { lv_valor }| ).



  ENDMETHOD.
ENDCLASS.
