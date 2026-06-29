CLASS zcx_flight_error_17 DEFINITION
  PUBLIC
  INHERITING FROM CX_STATIC_CHECK
  CREATE PUBLIC .

  PUBLIC SECTION.

  DATA mv_mensaje type string.
  METHODS constructor
    IMPORTING
      i_mensaje TYPE string .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_flight_error_17 IMPLEMENTATION.

METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( ).
    mv_mensaje = i_mensaje.
ENDMETHOD.

ENDCLASS.
