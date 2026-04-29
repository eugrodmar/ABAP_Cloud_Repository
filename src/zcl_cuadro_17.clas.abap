CLASS zcl_cuadro_17 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:

      constructor
        IMPORTING
          i_titulo TYPE string
          i_fecha  TYPE i,


      get_titulo
        EXPORTING
          o_titulo TYPE string,
      get_fecha
        EXPORTING
          o_fecha TYPE i,

      set_titulo
        IMPORTING
          i_titulo TYPE string,
      set_fecha
        IMPORTING
          i_fecha TYPE i,

      esta_en_exposicion
        EXPORTING
          o_estado TYPE abap_boolean,

      mostrar_ficha
        EXPORTING
          o_ficha TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA:

      titulo TYPE string,
      fecha  TYPE i.

ENDCLASS.



CLASS zcl_cuadro_17 IMPLEMENTATION.

  METHOD constructor.
    titulo = i_titulo.
    fecha = i_fecha.
  ENDMETHOD.

  METHOD get_titulo.
    o_titulo = titulo.
  ENDMETHOD.

  METHOD get_fecha.
    o_fecha = fecha.
  ENDMETHOD.

  METHOD set_titulo.
    titulo = i_titulo.
  ENDMETHOD.

  METHOD set_fecha.
    fecha = i_fecha.
  ENDMETHOD.

  METHOD esta_en_exposicion.
    IF o_estado > 1800.
      o_estado = abap_true.
    ELSE.
      o_estado = abap_false.
    ENDIF.
  ENDMETHOD.

  METHOD mostrar_ficha.
  DATA lv_estado TYPE string.
  IF fecha > 1800.
      lv_estado = 'En exposición'.
    ELSE.
      lv_estado = 'Almacenado'.
    ENDIF.

    o_ficha = | Titulo: { titulo }  / Año: { fecha } / { lv_estado }|.

  ENDMETHOD.
ENDCLASS.
