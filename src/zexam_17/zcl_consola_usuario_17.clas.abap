CLASS zcl_consola_usuario_17 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_consola_usuario_17 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

     DATA(lv_opcion) = 4.

      CASE lv_opcion.

      "--------------------------------------------------------------
      WHEN 1. "-- Alta de empleado
      "--------------------------------------------------------------
        DATA(lo_emp1) = NEW zclusuario_17(
          i_nombre         = 'Laura'
          i_apellido        = 'García'
          i_telefono        = '612345678'
          i_experiencia     = 3
          i_certificaciones = 2
        ).

        DATA(lv_msg_alta) = lo_emp1->alta_empleado( ).
        out->write( lv_msg_alta ).

        "-- Podemos dar de alta varios empleados seguidos
        DATA(lo_emp2) = NEW zclusuario_17(
          i_nombre          = 'Carlos'
          i_apellido        = 'Martínez'
          i_telefono        = '698765432'
          i_experiencia     = 5
          i_certificaciones = 4
        ).
        out->write( lo_emp2->alta_empleado( ) ).

      "--------------------------------------------------------------
      WHEN 2. "-- Modificación de empleado
      "--------------------------------------------------------------
        DATA(lo_mod) = NEW zclusuario_17(
          i_nombre          = ''   "No usado en modificar
          i_apellido        = ''
          i_telefono        = ''
          i_experiencia     = 0
          i_certificaciones = 0
        ).

        DATA(lv_msg_mod) = lo_mod->modificar_empleado(
          i_id_empleado              = 1
          i_nombre          = 'Laura'
          i_apellido        = 'García López'
          i_telefono        = '611111111'
          i_experiencia     = 4
          i_certificaciones = 3
        ).
        out->write( lv_msg_mod ).

        "-- Intentar modificar un ID que no existe
        DATA(lv_msg_err) = lo_mod->modificar_empleado(
          i_id_empleado              = 999
          i_nombre          = 'Fantasma'
          i_apellido        = 'Inexistente'
          i_telefono        = '000000000'
          i_experiencia     = 1
          i_certificaciones = 1
        ).
        out->write( lv_msg_err ).

      "--------------------------------------------------------------
      WHEN 3. "-- Consulta por ID (0 = todos)
      "--------------------------------------------------------------
        DATA(lo_con) = NEW zclusuario_17(
          i_nombre          = ''
          i_apellido        = ''
          i_telefono        = ''
          i_experiencia     = 0
          i_certificaciones = 0
        ).

        "-- Cambiar a un ID concreto, p.ej. 1, para consultar uno solo
        DATA(lt_resultado) = lo_con->consultar_empleados( i_id_empleado = 0 ).

        IF lt_resultado IS INITIAL.
          out->write( 'No se encontraron registros.' ).
        ELSE.
          LOOP AT lt_resultado INTO DATA(ls_row).
            out->write( |ID: { ls_row-id_empleado } | &&
                        |Nombre: { ls_row-nombre } | &&
                        |Apellido: { ls_row-apellido } | &&
                        |Teléfono: { ls_row-telefono } | &&
                        |Sueldo: { ls_row-sueldo }| ).
          ENDLOOP.
        ENDIF.

      "--------------------------------------------------------------
      WHEN 4. "-- Consulta de N registros
      "--------------------------------------------------------------
        DATA(lo_n) = NEW zclusuario_17(
          i_nombre          = ''
          i_apellido        = ''
          i_telefono        = ''
          i_experiencia     = 0
          i_certificaciones = 0
        ).

        DATA(lv_n) = 2. "-- Cambia este valor según necesites
        DATA(lt_top_n) = lo_n->consultar_registros( i_numero = lv_n ).

        out->write( |Primeros { lv_n } empleados:| ).
        IF lt_top_n IS INITIAL.
          out->write( 'No hay registros en la tabla.' ).
        ELSE.
          LOOP AT lt_top_n INTO DATA(ls_n_row).
            out->write( |ID: { ls_n_row-id_empleado } | &&
                        |Nombre: { ls_n_row-nombre } | &&
                        |Apellido: { ls_n_row-apellido } | &&
                        |Sueldo: { ls_n_row-sueldo }| ).
          ENDLOOP.
        ENDIF.

    ENDCASE.

  ENDMETHOD.
ENDCLASS.
