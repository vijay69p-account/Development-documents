CLASS lhc_posaccounts DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR posaccounts RESULT result.
    METHODS accupload FOR MODIFY
      IMPORTING keys FOR ACTION posaccounts~accupload RESULT result.

ENDCLASS.

CLASS lhc_posaccounts IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD accupload.
  data lv_date type c.
  ENDMETHOD.

ENDCLASS.
