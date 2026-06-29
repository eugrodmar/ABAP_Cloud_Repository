CLASS zcl_cuenta_tinder_17 DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA nombre TYPE string.
    DATA swipes_realizados TYPE i.

    INTERFACES zif_swipeable_17.

    METHODS:

      constructor
        IMPORTING
          i_nombre TYPE string,

      get_plan
        ABSTRACT
        RETURNING
          VALUE(rv_plan) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cuenta_tinder_17 IMPLEMENTATION.

METHOD constructor.
    nombre = i_nombre.
  ENDMETHOD.

  METHOD zif_swipeable_17~hacer_swipe.
    swipes_realizados = swipes_realizados + 1.
    rv_resultado = |{ nombre } hizo swipe { i_direccion }|.
  ENDMETHOD.

ENDCLASS.
