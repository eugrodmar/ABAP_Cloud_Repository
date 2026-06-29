CLASS zcl_empleado_fijo_17 DEFINITION
  PUBLIC
  INHERITING FROM zcl_empleado_17
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA:

        antiguedad TYPE i.

    METHODS:

      constructor
        IMPORTING
          i_nombre       TYPE string
          i_dni          TYPE string
          i_salario_base TYPE i
          i_antiguedad   TYPE i,

      get_ficha
        REDEFINITION,

      get_salario
        REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EMPLEADO_FIJO_17 IMPLEMENTATION.


  METHOD constructor.

    super->constructor(
                        i_nombre = i_nombre
                        i_dni = i_dni
                        i_salario_base = i_salario_base ).

    me->antiguedad = i_antiguedad.

  ENDMETHOD.


  METHOD get_salario.

    result_salario = me->salario_base + ( me->antiguedad * 50 ).



  ENDMETHOD.


  METHOD get_ficha.


    ficha = |Nombre: { nombre } , DNI: { dni } , Salario: { get_salario( ) } , Antigüeadad: { antiguedad } |.


  ENDMETHOD.
ENDCLASS.
