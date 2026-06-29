CLASS lhc_zr_lib_libro_17 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR ZrLibLibro17
        RESULT result,

      validateNumPaginas
        FOR VALIDATE ON SAVE
        IMPORTING keys FOR ZrLibLibro17~validateNumPaginas,

      calculateestado
        FOR DETERMINE ON MODIFY
        IMPORTING keys FOR ZrLibLibro17~calculateestado.

ENDCLASS.

CLASS lhc_zr_lib_libro_17 IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD validateNumPaginas.

    READ ENTITIES OF zr_lib_libro_17 IN LOCAL MODE
      ENTITY ZrLibLibro17
      FIELDS ( NumPaginas )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_libros)
      FAILED DATA(lt_failed).

    LOOP AT lt_libros INTO DATA(ls_libro).
      IF ls_libro-NumPaginas < 10.

        APPEND VALUE #( %tky = ls_libro-%tky ) TO failed-ZrLibLibro17.

        APPEND VALUE #(
          %tky        = ls_libro-%tky
          %state_area = 'VALIDATE_NUMPAGINAS'
          %msg        = new_message_with_text(
                          severity = if_abap_behv_message=>severity-error
                          text     = 'El libro debe tener al menos 10 páginas'
                        )
        ) TO reported-ZrLibLibro17.

      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD calculateestado.

    READ ENTITIES OF zr_lib_libro_17 IN LOCAL MODE
      ENTITY ZrLibLibro17
      FIELDS ( NumPaginas )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_libros).

    DATA lt_update TYPE TABLE FOR UPDATE zr_lib_libro_17\\ZrLibLibro17.

    LOOP AT lt_libros INTO DATA(ls_libro).

      DATA lv_estado TYPE string.

      IF ls_libro-NumPaginas < 50.
        lv_estado = 'Muy deteriorado'.
      ELSEIF ls_libro-NumPaginas < 150.
        lv_estado = 'Deteriorado'.
      ELSEIF ls_libro-NumPaginas < 400.
        lv_estado = 'Bueno'.
      ELSE.
        lv_estado = 'Nuevo'.
      ENDIF.

      APPEND VALUE #(
        %tky     = ls_libro-%tky
        Estado   = lv_estado
        %control = VALUE #( Estado = if_abap_behv=>mk-on )
      ) TO lt_update.

    ENDLOOP.

    MODIFY ENTITIES OF zr_lib_libro_17 IN LOCAL MODE
      ENTITY ZrLibLibro17
      UPDATE FIELDS ( Estado )
      WITH lt_update
      REPORTED DATA(lt_reported).

  ENDMETHOD.

ENDCLASS.
