CLASS zclusuario_17 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

 TYPES: tt_empleados TYPE STANDARD TABLE OF ztab_usuario_17 WITH EMPTY KEY.


    METHODS:

      constructor
        IMPORTING
          i_nombre          TYPE string
          i_apellido        TYPE string
          i_telefono        TYPE string
          i_experiencia     TYPE i
          i_certificaciones TYPE i,

      calcular_sueldo
        RETURNING VALUE(rv_sueldo) TYPE zusuario_sueldo17,

      generar_id
        RETURNING VALUE(rv_id) TYPE zusuario_id17,

      alta_empleado
        RETURNING VALUE(rv_alta) TYPE string,

      modificar_empleado
        IMPORTING
                  i_id_empleado          TYPE zusuario_id17
                  i_nombre               TYPE string
                  i_apellido             TYPE string
                  i_telefono             TYPE string
                  i_experiencia          TYPE i
                  i_certificaciones      TYPE i

        RETURNING VALUE(rv_modificacion) TYPE string,

      consultar_empleados
        IMPORTING
                  i_id_empleado       TYPE zusuario_id17 DEFAULT 0

        RETURNING VALUE(rt_empleados) TYPE tt_empleados,

      consultar_registros
        IMPORTING
                  i_numero            TYPE i
        RETURNING VALUE(rt_empleados) TYPE  tt_empleados.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA:

      nombre          TYPE zusuario_nom17,
      apellido        TYPE zusuario_apellido17,
      telefono        TYPE zusuario_tel17,
      experiencia     TYPE i,
      certificaciones TYPE i.

ENDCLASS.


CLASS zclusuario_17 IMPLEMENTATION.

  METHOD constructor.

    nombre = i_nombre.
    apellido =  i_apellido.
    telefono = i_telefono.
    experiencia = i_experiencia.
    certificaciones = i_certificaciones.

  ENDMETHOD.

  METHOD calcular_sueldo.

    rv_sueldo = 1000 + ( certificaciones * 50 ) + ( experiencia * 100 ).

  ENDMETHOD.

  METHOD generar_id.

    SELECT SINGLE MAX( id_empleado ) FROM ztab_usuario_17 INTO @DATA(lv_max_id).

    IF sy-subrc = 0 AND lv_max_id IS NOT INITIAL.

      rv_id = lv_max_id + 1.

    ELSE.

      rv_id = 1.

    ENDIF.

  ENDMETHOD.

  METHOD alta_empleado.

    DATA ls_empleado TYPE ztab_usuario_17.


    ls_empleado-id_empleado      = generar_id( ).
    ls_empleado-nombre  = nombre.
    ls_empleado-apellido = apellido.
    ls_empleado-telefono        = telefono.
    ls_empleado-sueldo   = calcular_sueldo( ).

    INSERT ztab_usuario_17 FROM @ls_empleado.

    IF sy-subrc = 0.

      rv_alta = |Alta correcta con ID { ls_empleado-id_empleado }|.

    ELSE.

      rv_alta = 'Error al insertar empleado'.

    ENDIF.

  ENDMETHOD.

  METHOD modificar_empleado.

    SELECT SINGLE id_empleado
FROM ztab_usuario_17
WHERE id_empleado = @i_id_empleado INTO @DATA(lv_id_check).

    .

    IF sy-subrc <> 0.
      rv_modificacion = |Error: No existe ningún empleado con ID { i_id_empleado }.|.
      RETURN.
    ENDIF.

    DATA(lv_sueldo) = 1000
                    + ( i_certificaciones * 50 )
                    + ( i_experiencia     * 100 ).


    DATA ls_empleado TYPE ztab_usuario_17.
    ls_empleado-id_empleado = i_id_empleado.
    ls_empleado-nombre      = i_nombre.
    ls_empleado-apellido    = i_apellido.
    ls_empleado-telefono    = i_telefono.
    ls_empleado-sueldo      = lv_sueldo.

    UPDATE ztab_usuario_17 FROM @ls_empleado.

    IF sy-subrc = 0.
      rv_modificacion = |Empleado { i_id_empleado } modificado correctamente.|.
    ELSE.
      rv_modificacion = |Error al modificar el empleado { i_id_empleado }.|.
    ENDIF.

  ENDMETHOD.

  METHOD consultar_empleados.

    IF i_id_empleado = 0.

      SELECT *
        FROM ztab_usuario_17
        INTO TABLE @rt_empleados.
    ELSE.

      SELECT *
        FROM ztab_usuario_17
        WHERE id_empleado = @i_id_empleado
        INTO TABLE @rt_empleados.
    ENDIF.

  ENDMETHOD.

  METHOD consultar_registros.

      SELECT *
      FROM ztab_usuario_17
      ORDER BY id_empleado ASCENDING
      INTO TABLE @rt_empleados
      UP TO @i_numero ROWS.

  ENDMETHOD.



ENDCLASS.
