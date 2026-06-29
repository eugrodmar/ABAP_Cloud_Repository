CLASS zcl_empleado_17 DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA:
      nombre       TYPE string,
      dni          TYPE string,
      salario_base TYPE i.

    METHODS:

      constructor
        IMPORTING
          i_nombre       TYPE string
          i_dni          TYPE string
          i_salario_base TYPE i,

      get_ficha
        RETURNING
          VALUE(ficha) TYPE string,

      get_salario

        RETURNING
          VALUE(result_salario) TYPE i.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EMPLEADO_17 IMPLEMENTATION.


  METHOD constructor.

    nombre = i_nombre.
    dni = i_dni.
    salario_base = i_salario_base.

  ENDMETHOD.


  METHOD get_ficha.

    ficha = |Nombre: { nombre } , DNI: { dni } , Salario: { salario_base }|.

  ENDMETHOD.


  METHOD get_salario.

    result_salario = me->salario_base.
  ENDMETHOD.
ENDCLASS.
