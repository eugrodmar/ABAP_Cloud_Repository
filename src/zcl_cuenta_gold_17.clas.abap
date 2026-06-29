CLASS zcl_cuenta_gold_17 DEFINITION
  PUBLIC
  INHERITING FROM zcl_cuenta_tinder_17
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_boosteable_17.

    METHODS:

      get_plan
        REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cuenta_gold_17 IMPLEMENTATION.

  METHOD get_plan.
    rv_plan = 'GOLD'.
  ENDMETHOD.

  METHOD zif_boosteable_17~activar_boost.
    rv_resultado = |Boost activado para { nombre }|.
  ENDMETHOD.


ENDCLASS.
