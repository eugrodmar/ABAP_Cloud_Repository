CLASS zverano_17 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA:

      nombre          TYPE zverano_nom17,
      apellido        TYPE zverano_apellido17,
      telefono        TYPE zverano_tel17,
      dias_actividad  TYPE i,
      act_contratadas TYPE i.

    METHODS:

      contructor
        IMPORTING
          i_nombre          TYPE zverano_nom17
          i_apellido        TYPE zverano_apellido17
          i_telefono        TYPE zverano_tel17
          i_dias_actividad  TYPE i
          i_act_contratadas TYPE i,

      importe_total
        IMPORTING
                  i_dias_actividad  TYPE i
                  i_act_contratadas TYPE i

        RETURNING VALUE(rv_total)   TYPE i,

      genera_id
        RETURNING VALUE(rv_id) TYPE i,

      alta_reserva
        IMPORTING
                  i_nombre        TYPE zverano_nom17
                  i_apellido      TYPE zverano_apellido17
                  i_telefono      TYPE zverano_tel17
                  i_importe_total TYPE zverano_imp17

        RETURNING VALUE(rv_alta)  TYPE string,

      modificar_reserva
        IMPORTING
                  i_id_reserva           TYPE zverano_id17
                  i_nombre               TYPE zverano_nom17
                  i_apellido             TYPE zverano_apellido17
                  i_telefono             TYPE zverano_tel17
                  i_dias_actividad       TYPE i
                  i_act_contratadas      TYPE i

        RETURNING VALUE(rv_modificacion) TYPE string,

      consulta_reservas
        IMPORTING
                  i_id_reserva       TYPE zverano_id17

        RETURNING VALUE(rv_reservas) TYPE ztverano_17,

      consulta_registros
        IMPORTING
                  i_numero           TYPE i
        RETURNING VALUE(rv_consulta) TYPE ztverano_17.






  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zverano_17 IMPLEMENTATION.

  METHOD contructor.

    nombre = i_nombre.
    apellido =  i_apellido.
    telefono = i_telefono.
    dias_actividad = i_dias_actividad.
    act_contratadas = i_act_contratadas.

  ENDMETHOD.

  METHOD importe_total.

    rv_total = 100 + ( i_dias_actividad * 40 ) + ( i_act_contratadas * 25 ).

  ENDMETHOD.

  METHOD genera_id.

    SELECT SINGLE MAX( id_reserva ) FROM ztab_verano_17 INTO @rv_id.
    rv_id = rv_id + 1.

  ENDMETHOD.

  METHOD alta_reserva.

    DATA lt_alta_reserva TYPE ztab_verano_17.


    lt_alta_reserva-id_reserva      = genera_id( ).
    lt_alta_reserva-nombre_cliente  = i_nombre.
    lt_alta_reserva-apellido_cliente = i_apellido.
    lt_alta_reserva-telefono        = i_telefono.
    lt_alta_reserva-importe_total   = i_importe_total.

    INSERT INTO ztab_verano_17 VALUES @lt_alta_reserva.

    IF sy-subrc = 0.

      rv_alta = |Reserva creada correctamente con ID { lt_alta_reserva-id_reserva }|.

    ELSE.

      rv_alta = 'Error al realizar la reserva'.

    ENDIF.

  ENDMETHOD.

  METHOD consulta_registros.

SELECT * FROM ztab_verano_17 ORDER BY id_reserva INTO TABLE @rv_consulta UP TO @i_numero ROWS.

  ENDMETHOD.

  METHOD consulta_reservas.

    IF i_id_reserva = 0.

      SELECT * FROM ztab_verano_17 INTO TABLE @rv_reservas.

      ELSE.

        SELECT * FROM ztab_verano_17 WHERE id_reserva = @i_id_reserva INTO TABLE @rv_reservas.

      ENDIF.

    ENDMETHOD.

    METHOD modificar_reserva.

      DATA lt_consulta TYPE ztab_verano_17.

      SELECT SINGLE * FROM ztab_verano_17
      WHERE id_reserva = @i_id_reserva
      INTO @lt_consulta .

        IF sy-subrc = 0.

          lt_consulta-nombre_cliente  = i_nombre.
          lt_consulta-apellido_cliente = i_apellido.
          lt_consulta-telefono        = i_telefono.
          lt_consulta-importe_total = importe_total( i_dias_actividad = i_dias_actividad
                                                     i_act_contratadas = i_act_contratadas ).

          MODIFY ztab_verano_17 FROM @lt_consulta.

          rv_modificacion = 'Modificación realizada con éxito'.

        ELSE.

          rv_modificacion = 'Error: no existe ninguna reserva con ese ID'.

        ENDIF.

      ENDMETHOD.

ENDCLASS.
