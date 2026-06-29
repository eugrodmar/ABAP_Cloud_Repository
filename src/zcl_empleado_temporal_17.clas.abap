CLASS zcl_empleado_temporal_17 DEFINITION
  PUBLIC
  INHERITING FROM zcl_empleado_17
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA:

      horas_trabajadas TYPE i,

      precio_hora      TYPE i.

    METHODS:

      constructor
        IMPORTING
          i_nombre           TYPE string
          i_dni              TYPE string
          i_salario_base     TYPE i
          i_horas_trabajadas TYPE i
          i_precio_hora      TYPE i,

      get_ficha
        REDEFINITION,

      get_salario
        REDEFINITION.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EMPLEADO_TEMPORAL_17 IMPLEMENTATION.


  METHOD constructor.

    super->constructor(
                        i_nombre = i_nombre
                        i_dni = i_dni
                        i_salario_base = i_salario_base ).

    me->horas_trabajadas = i_horas_trabajadas.

    me->precio_hora = i_precio_hora.

  ENDMETHOD.


  METHOD get_salario.

    result_salario = me->salario_base + ( horas_trabajadas * precio_hora ).

  ENDMETHOD.


  METHOD get_ficha.

    ficha = |Nombre: { nombre } , DNI: { dni } , Salario: { get_salario( ) } , Horas trabajadas: { horas_trabajadas } |.

  ENDMETHOD.
ENDCLASS.
