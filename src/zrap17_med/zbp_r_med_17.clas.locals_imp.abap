CLASS LHC_ZR_MED_17 DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrMed17
        RESULT result,
      cambiar_estado FOR MODIFY
            IMPORTING keys FOR ACTION ZrMed17~cambiar_estado RESULT result.

          METHODS cambiar_precio FOR MODIFY
            IMPORTING keys FOR ACTION ZrMed17~cambiar_precio RESULT result.
ENDCLASS.

CLASS LHC_ZR_MED_17 IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
  METHOD cambiar_estado.

    MODIFY ENTITIES OF zr_med_17 IN LOCAL MODE
      ENTITY ZrMed17
        UPDATE FIELDS ( Estado )
        WITH VALUE #(
          FOR key IN keys
          (
            %tky    = key-%tky
            Estado = key-%param-Estado
          )
        )
      FAILED failed
      REPORTED reported.

      READ ENTITIES OF zr_med_17 IN LOCAL MODE
      ENTITY ZrMed17
        ALL FIELDS
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_estados).

    result = VALUE #(
      FOR ls_est IN lt_estados
      (
        %tky   = ls_est-%tky
        %param = ls_est
      )
    ).

  ENDMETHOD.

  METHOD cambiar_precio.

  READ ENTITIES OF zr_med_17 IN LOCAL MODE
      ENTITY ZrMed17
        FIELDS ( Precio )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_precios)
      FAILED failed.

    " 2. Modificar con el precio duplicado
    MODIFY ENTITIES OF zr_med_17 IN LOCAL MODE
      ENTITY ZrMed17
        UPDATE FIELDS ( Precio )
        WITH VALUE #(
          FOR ls_pre IN lt_precios
          (
            %tky    = ls_pre-%tky
            Precio = ls_pre-Precio * 2
          )
        )
      FAILED failed
      REPORTED reported.

    result = VALUE #(
      FOR ls_pre IN lt_precios
      (
        %tky   = ls_pre-%tky
        %param = ls_pre
      )
    ).

  ENDMETHOD.

ENDCLASS.
