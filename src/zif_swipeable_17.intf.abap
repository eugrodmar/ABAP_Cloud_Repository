INTERFACE zif_swipeable_17
  PUBLIC .

  METHODS:
    hacer_swipe
      IMPORTING
        i_direccion TYPE string
      RETURNING
        VALUE(rv_resultado) TYPE string.


ENDINTERFACE.
