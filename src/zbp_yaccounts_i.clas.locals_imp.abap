CLASS lhc_YYACCOUNTS_I DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR yyaccounts_i RESULT result.
    METHODS excelupload FOR MODIFY
      IMPORTING keys FOR ACTION yyaccounts_i~excelupload.

ENDCLASS.

CLASS lhc_YYACCOUNTS_I IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD ExcelUpload.
  ENDMETHOD.

ENDCLASS.
