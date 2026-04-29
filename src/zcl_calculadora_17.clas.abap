CLASS zcl_calculadora_17 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:

      constructor
        IMPORTING
          i_valor_actual TYPE i
          i_nombre       TYPE string,

      get_valor_actual
        EXPORTING
          o_valor_actual TYPE i,
      get_nombre
        EXPORTING
          o_nombre TYPE string,

      set_nombre
        IMPORTING
          i_nombre TYPE string,

      sumar
        IMPORTING
          i_valor_actual TYPE i,

      restar
        IMPORTING
          i_valor_actual TYPE i,

      multiplicar
        IMPORTING
          i_valor_actual TYPE i,

      dividir
        IMPORTING
          i_valor_actual TYPE i

        EXPORTING
          o_error        TYPE abap_boolean,

      potencia
        IMPORTING
          i_valor_actual TYPE i,

      reset.


  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA:
      valor_actual TYPE i,
      nombre       TYPE string.

ENDCLASS.



CLASS zcl_calculadora_17 IMPLEMENTATION.

  METHOD constructor.
    valor_actual = i_valor_actual.
    nombre = i_nombre.
  ENDMETHOD.

  METHOD get_valor_actual.
    o_valor_actual = valor_actual.
  ENDMETHOD.

  METHOD get_nombre.
    o_nombre = nombre.
  ENDMETHOD.

  METHOD set_nombre.
    nombre = i_nombre.
  ENDMETHOD.

  METHOD sumar.
    valor_actual = valor_actual + i_valor_actual.
  ENDMETHOD.

  METHOD restar.
    valor_actual = valor_actual - i_valor_actual.
  ENDMETHOD.

  METHOD multiplicar.
    valor_actual = valor_actual * i_valor_actual.
  ENDMETHOD.

  METHOD dividir.

    IF i_valor_actual = 0.
      o_error = abap_true.

    ELSE.

      valor_actual = valor_actual / i_valor_actual.
    ENDIF.

  ENDMETHOD.

  METHOD potencia.
    DATA lv_acumulador TYPE i VALUE 1.
    DO i_valor_actual TIMES.
      lv_acumulador = valor_actual * lv_acumulador.
    ENDDO.
    valor_actual = lv_acumulador.
  ENDMETHOD.

  METHOD reset.
    valor_actual = 0.
  ENDMETHOD.

ENDCLASS.
