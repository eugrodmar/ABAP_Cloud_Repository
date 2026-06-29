CLASS zcl_repaso_17 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_repaso_17 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


SELECT * FROM zcds_vue_aer_17 INTO TABLE @DATA(lt_vuelo).

out->write( lt_vuelo ).



  ENDMETHOD.
ENDCLASS.
