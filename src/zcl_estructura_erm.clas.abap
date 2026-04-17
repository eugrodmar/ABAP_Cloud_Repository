CLASS zcl_estructura_erm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_estructura_erm IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.
*
*        types: begin of ty_cliente,
*              nombre type string,
*              edad type i,
*              correo type string,
*              telefono type string,
*              end of ty_cliente.
*
*    data ls_cliente type ty_cliente.
*
*    ls_cliente-nombre = 'Juan'.
*    ls_cliente-edad = 23.
*    ls_cliente-correo = 'juan_perez@email.com'.
*    ls_cliente-telefono = '665223887'.
*
*    out->write( ls_cliente ).
*
*
**    Estructura y tipos a la vez
*
*    data: BEGIN OF ls_empleado2,
*          nombre type string value 'Laura',
*          edad type i,
*          correo type /dmo/email_address,
*          end of ls_empleado2.


*   Estructura anidada

    data: BEGIN OF ls_empleado,

        begin of info,
            id type i value 1234,
            nombre type string value 'Daniel',
        end of info,

        begin of direccion,
            ciudad type string value 'Sevilla',
            pais type string value 'España',
        end of direccion,

        begin of posicion,
            departamento type string value 'IT',
            salario type i value 12345 ,
            correo type string value 'daniel@sap.com',
        end of posicion,

    END OF ls_empleado.

    out->write( ls_empleado ).

    ENDMETHOD.

ENDCLASS.
