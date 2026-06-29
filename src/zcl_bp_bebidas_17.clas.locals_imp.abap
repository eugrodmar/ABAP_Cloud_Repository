CLASS lhc_ZI_BEBIDAS_17 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zi_bebidas_17 RESULT result.

ENDCLASS.

CLASS lhc_ZI_BEBIDAS_17 IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

ENDCLASS.
