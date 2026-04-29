CLASS zcl_demo_banco_erm DEFINITION.

  PUBLIC SECTION.
    DATA:
      nombre TYPE string,
      saldo  TYPE i.


    METHODS:

      constructor
        IMPORTING i_nombre TYPE string
                  i_saldo  TYPE i,

      get_nombre
        EXPORTING
          o_nombre TYPE string,

      get_saldo
        EXPORTING
          o_saldo TYPE i,

      set_nombre
        IMPORTING
          i_nombre TYPE string,

      ingresar
        IMPORTING
          i_cantidad TYPE i,

      retirar
        IMPORTING
          i_cantidad TYPE i
        EXPORTING
          o_valido TYPE abap_boolean.


  PROTECTED SECTION.
  PRIVATE SECTION.





ENDCLASS.

CLASS zcl_demo_banco_erm IMPLEMENTATION.

  METHOD constructor.
    nombre = i_nombre.
    saldo = i_saldo.
  ENDMETHOD.


  METHOD get_nombre.
    "parametro = atributo
    o_nombre = nombre.
  ENDMETHOD.

  METHOD get_saldo.
    o_saldo = saldo.
  ENDMETHOD.

  METHOD set_nombre.
    "atributo = parametro
    nombre = i_nombre.
  ENDMETHOD.

  METHOD ingresar.

    saldo = saldo + i_cantidad.

  ENDMETHOD.

  METHOD retirar.

    IF saldo >= i_cantidad.
      saldo = saldo - i_cantidad.
    ELSE.
      o_valido = abap_false.
    ENDIF.



  ENDMETHOD.


ENDCLASS.


*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
