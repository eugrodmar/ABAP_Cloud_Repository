CLASS zcx_producto_invalido_17 DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA mv_mensaje TYPE string.
    METHODS constructor
      IMPORTING
        i_mensaje TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_producto_invalido_17 IMPLEMENTATION.

  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( ).
    mv_mensaje = i_mensaje.
  ENDMETHOD.

ENDCLASS.
