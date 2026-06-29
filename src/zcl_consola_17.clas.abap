CLASS zcl_consola_17 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CONSOLA_17 IMPLEMENTATION.


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

*    DATA(lo_calculadora) = NEW zcl_calculadora_17( i_valor_actual = 0 i_nombre = 'Manolo' ).
*    DATA lv_valor TYPE i.
*    DATA lv_nombre TYPE string.
*    DATA lv_error TYPE abap_boolean.


*
*    lo_calculadora->get_valor_actual( IMPORTING o_valor_actual = lv_valor ).
*    lo_calculadora->get_nombre( IMPORTING o_nombre = lv_nombre ).
*    out->write( |{ lv_nombre } { lv_valor }| ).
*
*    lo_calculadora->sumar( 3 ).
*    lo_calculadora->get_valor_actual( IMPORTING o_valor_actual = lv_valor ).
*    lo_calculadora->get_nombre( IMPORTING o_nombre = lv_nombre ).
*    out->write( |{ lv_nombre } { lv_valor }| ).
*
*    lo_calculadora->potencia( 6 ).
*    lo_calculadora->get_valor_actual( IMPORTING o_valor_actual = lv_valor ).
*    lo_calculadora->get_nombre( IMPORTING o_nombre = lv_nombre ).
*    out->write( |{ lv_nombre } { lv_valor }| ).

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







**********************************************************************
*********************** RELACIÓN DE TABLAS ***************************
**********************************************************************
*
************************* Versión nueva ******************************
*
*    TYPES:BEGIN OF ty_reservas,
*            name          TYPE /dmo/agency-name,
*            connection_id TYPE /dmo/booking-connection_id,
*            flight_date   TYPE /dmo/booking-flight_date,
*            flight_price  TYPE /dmo/booking-flight_price,
*          END OF ty_reservas.
*
*    DATA ls_reservas TYPE ty_reservas.
*    DATA lt_reservas TYPE TABLE OF ty_reservas.
*
*    IF sy-subrc = 0.
*      out->write( lt_reservas ).
*    ENDIF.
*
*
*    SELECT travel_id,
*           connection_id,
*           flight_date,
*           flight_price FROM /dmo/booking INTO TABLE @DATA(lt_booking) UP TO 20 ROWS.
*
*    IF sy-subrc = 0.
*
*      SELECT travel_id,
*              agency_id FROM /dmo/travel INTO TABLE @DATA(lt_travel).
*
*      IF sy-subrc = 0.
*
*        SELECT name,
*               agency_id FROM /dmo/agency INTO TABLE @DATA(lt_agency).
*        IF sy-subrc = 0.
*
*          LOOP AT lt_booking INTO DATA(ls_booking).
*
*            READ TABLE lt_travel INTO DATA(ls_travel)
*                      WITH KEY travel_id = ls_booking-travel_id.
*
*            IF sy-subrc = 0.
*
*              READ TABLE lt_agency INTO DATA(ls_agency)
*              WITH KEY agency_id = ls_travel-agency_id.
*
*              IF sy-subrc = 0.
*                ls_reservas-connection_id = ls_booking-connection_id.
*                ls_reservas-flight_date = ls_booking-flight_date.
*                ls_reservas-flight_price = ls_booking-flight_price.
*                ls_reservas-name = ls_agency-name.
*
*                APPEND ls_reservas TO lt_reservas.
*
*              ENDIF.
*
*            ENDIF.
*
*          ENDLOOP.
*
*          out->write( lt_reservas ).
*
*        ENDIF.
*
*      ENDIF.
*
*    ENDIF.


************************* Versión nueva ******************************
*
*
* SELECT
*            connection_id,
*            flight_date,
*            flight_price,
*            name
*
*            FROM /dmo/booking AS b
*                 JOIN /dmo/travel AS t
*                    ON b~travel_id = t~travel_id
*                 JOIN /dmo/agency AS a
*                    ON t~agency_id = a~agency_id
*
*            INTO TABLE @DATA(lt_reservas)
*                UP TO 10 ROWS.
*
*    IF sy-subrc = 0.
*      out->write( lt_reservas ).
*    ENDIF.

*SELECT * FROM  zcds_vuelo_17 INTO TABLE @data(lt_vuelo).
*
*IF sy-subrc = 0.
*      out->write( lt_vuelo ).
*    ENDIF.

*
*DATA(lo_trabajador) = new zcl_empleado_17(
*                                        i_nombre = 'Manolo'
*                                        i_dni = '25689741A'
*                                        i_salario_base = 1000
* ).
*
*
*  DATA(lo_trabajador_fijo) = new zcl_empleado_fijo_17(
*                                        i_nombre = 'Gonzalo'
*                                        i_dni = '25689741A'
*                                        i_salario_base = 1000
*                                        i_antiguedad = 5
*
* ).
*
* Data(lo_trabajador_temporal) = new zcl_empleado_temporal_17(
*                                        i_nombre = 'Juan'
*                                        i_dni = '25689741A'
*                                        i_salario_base = 1000
*                                        i_precio_hora = 5
*                                        i_horas_trabajadas = 10
*
* ).
*
* out->write( lo_trabajador->get_ficha( ) ).
* out->write( lo_trabajador_fijo->get_ficha(  ) ).
* out->write( lo_trabajador_temporal->get_ficha(  ) ).


*DATA var_string TYPE string.
*DATA var_int TYPE i.
*DATA var_date TYPE d.
*data var_pack type p length 3 decimals 2.
*
*var_string = `12345`.
*var_int = var_string.
*
*out->write( 'Conversion successful' ).
*
*var_string = `20230101`.
*var_date = var_string.
*
*out->write( |String value: { var_string }| ).
*out->write( |Date Value: { var_date date = user }| ).
*
*DATA long_char TYPE c LENGTH 10.
*DATA short_char TYPE c LENGTH 5.
*DATA result TYPE p LENGTH 3 DECIMALS 2.
*
*long_char = 'ABCDEFGHIJ'.
*short_char = long_char.
*
*out->write( long_char ).
*out->write( short_char ).
*
*result = 1 / 8.
*
*out->write( |1 / 8 is rounded to { result NUMBER = USER }| ).

*
*data(lv_hoy) = cl_abap_context_info=>get_system_date( ).
*
*data lv_nacimiento TYPE d VALUE '19900710'.
*
*out->write( | 'Hoy es ' { lv_hoy date = USER } ' y nací ' { lv_nacimiento date = USER }| ).
*
*DATA lv_dias type i.
*DATA lv_meses type i.
*DATA lv_semanas type i.
*
*lv_dias = lv_hoy - lv_nacimiento.
*
*out->write( | 'He vivido ' { lv_dias } ' días'| ).
*
*lv_semanas = lv_dias / 7.
*
*out->write( | 'He vivido ' { lv_semanas } ' semanas'| ).
*
*lv_meses = ( lv_hoy - lv_nacimiento ) / 30.
*
*out->write( | 'He vivido ' { lv_meses } ' meses'| ).
*
*    out->write( TEXT-001 ).
*


*    DATA(lv_dias) = cl_abap_context_info=>get_system_date( ).
*
*    SELECT FROM /dmo/flight
*    FIELDS
*           carrier_id,
*           connection_id,
*           flight_date,
*           seats_max,
*           seats_occupied,
*            seats_max - seats_occupied  AS seats_free,
*            DAYS_BETWEEN( flight_date, @lv_dias )  AS dias_restantes
*
*      INTO TABLE @DATA(lt_asientos).
*
*    out->write( lt_asientos ).

*    DATA lv_hoy TYPE d.
*    lv_hoy = '20260514'.




SELECT FROM /dmo/flight
        FIELDS
            flight_date,

            CASE is_valid( flight_date )
              WHEN 0 THEN 'No es válido'
              WHEN 1 THEN 'Es valido'
            END AS texto_valido,

            CASE weekday( flight_date )
              WHEN 0 THEN 'Lunes'
              WHEN 1 THEN 'Martes'
              WHEN 2 THEN 'Miércoles'
              WHEN 3 THEN 'Jueves'
              WHEN 4 THEN 'Viernes'
              WHEN 5 THEN 'Sábado'
              WHEN 6 THEN 'Domingo'
            END AS texto_dia

        INTO TABLE @DATA(lt_flights).

out->write( lt_flights ).


  ENDMETHOD.
ENDCLASS.
