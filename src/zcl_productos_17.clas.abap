CLASS zcl_productos_17 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:

      insertar
        IMPORTING
          i_producto TYPE zproductos_17

        EXPORTING
          o_valido   TYPE abap_bool,

      buscar_por_id
        IMPORTING
          i_producto_id TYPE zproducto_id_17

        EXPORTING
          o_estructura  TYPE zproductos_17

          o_encontrado  TYPE abap_bool,

      listar_todos
        RETURNING VALUE(rv_tabla) TYPE zproductos_17,

      modificar
        IMPORTING
          i_estructura TYPE zproductos_17

        EXPORTING
          o_valido     TYPE abap_bool,

      borrar
        IMPORTING
          i_producto_id TYPE zproducto_id_17

        EXPORTING
          o_valido      TYPE abap_bool.

  PROTECTED SECTION.
  PRIVATE SECTION.




ENDCLASS.



CLASS zcl_productos_17 IMPLEMENTATION.

  METHOD insertar.

    INSERT INTO zproductos_17 VALUES @i_producto.

    IF sy-subrc = 0.
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.

  ENDMETHOD.

  METHOD buscar_por_id.

    SELECT SINGLE * FROM zproductos_17 WHERE producto_id = @i_producto_id INTO @o_estructura.

    IF sy-subrc = 0.
      o_encontrado = abap_true.
    ELSE.
      o_encontrado = abap_false.
    ENDIF.

  ENDMETHOD.

  METHOD listar_todos.


  ENDMETHOD.

  METHOD modificar.

    UPDATE zproductos_17 FROM @i_estructura.

    IF sy-subrc = 0.
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.
  ENDMETHOD.

  METHOD borrar.

    DELETE FROM zproductos_17 WHERE producto_id = @i_producto_id.

    IF sy-subrc = 0.
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
