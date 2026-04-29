CLASS zcl_bomb_17 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .



  PUBLIC SECTION.

  METHODS:

      constructor
        IMPORTING

          i_habitacion TYPE string,


      get_habitacion
        EXPORTING
          o_habitacion TYPE string,


      set_habitacion
        IMPORTING
          i_habitacion TYPE string,

      get_estado
        EXPORTING
          o_estado TYPE abap_boolean,

      mostrar_estado
      IMPORTING
      out TYPE REF TO if_oo_adt_classrun_out,

      encender,

      apagar.

  PROTECTED SECTION.
  PRIVATE SECTION.


    DATA:
      habitacion TYPE string,
      estado     TYPE abap_boolean.



ENDCLASS.



CLASS zcl_bomb_17 IMPLEMENTATION.

METHOD constructor.

    habitacion = i_habitacion.
    estado = abap_false.

  ENDMETHOD.

  METHOD get_habitacion.
    o_habitacion = habitacion.
  ENDMETHOD.

  METHOD set_habitacion.
    habitacion = i_habitacion.
  ENDMETHOD.

  METHOD get_estado.

  o_estado = estado.

  ENDMETHOD.

  METHOD mostrar_estado.
  IF estado = abap_true.
      out->write( |La bombilla está en { habitacion } y está encendida| ).
    ELSE.
      out->write( |La bombilla está en { habitacion } y está apagada| ).
    ENDIF.
  ENDMETHOD.

  METHOD encender.

      IF estado = abap_false.
      estado = abap_true.

    ENDIF.

  ENDMETHOD.

  METHOD apagar.

      IF estado = abap_true.
      estado = abap_false.

    ENDIF.
ENDMETHOD.
ENDCLASS.
