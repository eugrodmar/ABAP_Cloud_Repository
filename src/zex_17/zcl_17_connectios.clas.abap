CLASS zcl_17_connectios DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS get_connections
      IMPORTING
        i_departure   TYPE /dmo/airport_from_id
      RETURNING
        VALUE(r_connections) TYPE zcert_connections.

ENDCLASS.

CLASS zcl_17_connectios IMPLEMENTATION.

  METHOD get_connections.


  SELECT carrier_id,
         airport_from_id,
         airport_to_id
    FROM /dmo/connection
    WHERE airport_from_id = @i_departure
    INTO TABLE @DATA(lt_direct).

  LOOP AT lt_direct INTO DATA(ls_direct).


    APPEND VALUE #(
      carrier_id      = ls_direct-carrier_id
      airport_from_id = i_departure
      airport_to_id   = ls_direct-airport_to_id
      airport_via_id  = '-'
    ) TO r_connections.


    SELECT carrier_id,
           airport_from_id,
           airport_to_id
      FROM /dmo/connection
      WHERE carrier_id      = @ls_direct-carrier_id
        AND airport_from_id = @ls_direct-airport_to_id
        AND airport_to_id  <> @i_departure
      INTO TABLE @DATA(lt_onward).

    LOOP AT lt_onward INTO DATA(ls_onward).
      APPEND VALUE #(
        carrier_id      = ls_onward-carrier_id
        airport_from_id = i_departure
        airport_to_id   = ls_onward-airport_to_id
        airport_via_id  = ls_direct-airport_to_id
      ) TO r_connections.
    ENDLOOP.

  ENDLOOP.

ENDMETHOD.

ENDCLASS.
