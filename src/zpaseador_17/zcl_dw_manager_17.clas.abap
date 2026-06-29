CLASS zcl_dw_manager_17 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:

      create_dueno

        IMPORTING is_dueno        TYPE zdw_dueno_17
        RETURNING VALUE(rv_dueno) TYPE abap_bool,

      create_perro
        IMPORTING is_perro        TYPE zdw_perro_17
        RETURNING VALUE(rv_perro) TYPE abap_bool,

      create_paseador
        IMPORTING is_paseador        TYPE zdw_paseador_17
        RETURNING VALUE(rv_paseador) TYPE abap_bool,

      create_servicio
        IMPORTING is_servicio        TYPE zdw_servicio_17
        RETURNING VALUE(rv_servicio) TYPE abap_bool,

      create_valoracion
        IMPORTING is_valoracion        TYPE zdw_valoracion17
        RETURNING VALUE(rv_valoracion) TYPE abap_bool,

      get_servicios_paseador
        IMPORTING i_id_paseador TYPE zdw_paseador_17
        EXPORTING o_t_paseador  TYPE zdw_paseador_17,

      get_servicios_perro
        IMPORTING i_id_perro TYPE zdw_perro_17
        EXPORTING o_t_perro  TYPE zdw_perro_17,

      get_media_valoracion_paseador
        IMPORTING i_id_paseador      TYPE zdw_paseador_17
        EXPORTING o_media_valoracion TYPE decfloat16.

  PROTECTED SECTION.
  PRIVATE SECTION.

    METHODS:
      check_dueno_exists
        IMPORTING i_id_dueno  TYPE zdw_dueno_17-id_dueno
        EXPORTING o_rv_exists TYPE abap_bool,

      check_perro_exists
        IMPORTING i_id_perro  TYPE zdw_perro_17-id_perro
        EXPORTING o_rv_exists TYPE abap_bool,

      check_valoracion_exists
        IMPORTING i_id_valoracion TYPE zdw_valoracion17-id_valoracion
        EXPORTING o_rv_exists     TYPE abap_bool,

      check_paseador_exists
        IMPORTING i_id_paseador TYPE zdw_paseador_17-id_paseador
        EXPORTING o_rv_exists   TYPE abap_bool,

      check_servicio_exists
        IMPORTING i_id_servicio TYPE zdw_servicio_17-id_servicio
        EXPORTING o_rv_exists   TYPE abap_bool,

      check_servicio_completado
        IMPORTING i_estado    TYPE zdw_servicio_17-estado
        EXPORTING o_rv_exists TYPE abap_bool.
ENDCLASS.



CLASS ZCL_DW_MANAGER_17 IMPLEMENTATION.


  METHOD create_dueno.

    IF is_dueno-id_dueno IS INITIAL OR is_dueno-nombre IS INITIAL.
      rv_dueno = abap_false.
      RETURN.
    ENDIF.

    DATA lv_exists_dueno TYPE abap_bool.

    check_dueno_exists(
      EXPORTING i_id_dueno = is_dueno-id_dueno
      IMPORTING o_rv_exists = lv_exists_dueno
    ).

    IF lv_exists_dueno = abap_true.
      rv_dueno = abap_false.
      RETURN.
    ENDIF.

    INSERT zdw_dueno_17 FROM @is_dueno.

    IF sy-subrc = 0.
      rv_dueno = abap_true.
    ELSE.
      rv_dueno = abap_false.
    ENDIF.

  ENDMETHOD.


  METHOD create_perro.

    DATA lv_exists TYPE abap_bool.

    IF is_perro-id_perro IS INITIAL OR is_perro-nombre IS INITIAL.
      rv_perro = abap_false.
      RETURN.
    ENDIF.

    DATA lv_exists_perro TYPE abap_bool.

    check_perro_exists(
      EXPORTING i_id_perro = is_perro-id_perro
      IMPORTING o_rv_exists = lv_exists_perro
    ).

    IF lv_exists_perro = abap_true.
      rv_perro = abap_false.
      RETURN.
    ENDIF.

    INSERT zdw_perro_17 FROM @is_perro.

    IF sy-subrc = 0.
      rv_perro = abap_true.
    ELSE.
      rv_perro = abap_false.
    ENDIF.
  ENDMETHOD.


  METHOD create_paseador.

    DATA lv_exists TYPE abap_bool.

    check_paseador_exists(
      EXPORTING i_id_paseador = is_paseador-id_paseador
      IMPORTING o_rv_exists   = lv_exists
    ).

    IF lv_exists = abap_false.

      INSERT zdw_paseador_17 FROM @is_paseador.

      IF sy-subrc = 0.
        rv_paseador = abap_true.
      ELSE.
        rv_paseador = abap_false.
      ENDIF.

    ELSE.
      rv_paseador = abap_false.
    ENDIF.

  ENDMETHOD.


  METHOD create_servicio.

    DATA lv_exists TYPE abap_bool.

    check_servicio_exists(
      EXPORTING i_id_servicio = is_servicio-id_servicio
      IMPORTING o_rv_exists   = lv_exists
    ).

    IF lv_exists = abap_false.

      INSERT zdw_servicio_17 FROM @is_servicio.

      IF sy-subrc = 0.
        rv_servicio = abap_true.
      ELSE.
        rv_servicio = abap_false.
      ENDIF.

    ELSE.
      rv_servicio = abap_false.
    ENDIF.

  ENDMETHOD.


  METHOD create_valoracion.

    DATA rv_ok TYPE abap_bool.
    rv_ok = abap_true.
    rv_valoracion = rv_ok.

  ENDMETHOD.


  METHOD check_dueno_exists.


    SELECT SINGLE id_dueno
       FROM zdw_dueno_17
       WHERE id_dueno = @i_id_dueno
       INTO @DATA(lv_id_dueno).

    IF sy-subrc = 0.
      o_rv_exists = abap_true.
    ELSE.
      o_rv_exists = abap_false.
    ENDIF.



  ENDMETHOD.


  METHOD check_perro_exists.

    SELECT SINGLE id_perro
        FROM zdw_perro_17
        WHERE id_perro = @i_id_perro
        INTO @DATA(lv_id_perro).

    IF sy-subrc = 0.
      o_rv_exists = abap_true.
    ELSE.
      o_rv_exists = abap_false.
    ENDIF.

  ENDMETHOD.


  METHOD check_paseador_exists.

    SELECT SINGLE id_paseador
         FROM zdw_paseador_17
         WHERE id_paseador = @i_id_paseador
         INTO @DATA(lv_id_paseador).

    IF sy-subrc = 0.
      o_rv_exists = abap_true.
    ELSE.
      o_rv_exists = abap_false.
    ENDIF.
  ENDMETHOD.


  METHOD check_valoracion_exists.
    SELECT SINGLE id_valoracion
          FROM zdw_valoracion17
          WHERE id_valoracion = @i_id_valoracion
          INTO @DATA(lv_id_valoracion).

    IF sy-subrc = 0.
      o_rv_exists = abap_true.
    ELSE.
      o_rv_exists = abap_false.
    ENDIF.
  ENDMETHOD.


  METHOD check_servicio_exists.

    SELECT SINGLE id_servicio
         FROM zdw_servicio_17
         WHERE id_servicio = @i_id_servicio
         INTO @DATA(lv_id_servicio).

    IF sy-subrc = 0.
      o_rv_exists = abap_true.
    ELSE.
      o_rv_exists = abap_false.
    ENDIF.
  ENDMETHOD.


  METHOD check_servicio_completado.
    SELECT SINGLE estado
          FROM zdw_servicio_17
          WHERE estado = @i_estado
          INTO @DATA(lv_estado).

    IF sy-subrc = 0.
      o_rv_exists = abap_true.
    ELSE.
      o_rv_exists = abap_false.
    ENDIF.
  ENDMETHOD.


  METHOD get_servicios_paseador.
  ENDMETHOD.


  METHOD get_servicios_perro.
  ENDMETHOD.


  METHOD get_media_valoracion_paseador.
  ENDMETHOD.
ENDCLASS.
