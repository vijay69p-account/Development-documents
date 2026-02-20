
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

    "read the accounts table to get the account information.

    READ ENTITIES OF yyaccounts_i IN LOCAL MODE
    ENTITY yyaccounts_i
    ALL FIELDS WITH
    CORRESPONDING #( keys )
    RESULT DATA(posaccounts).

    READ ENTITIES OF yyaccounts_i IN LOCAL MODE
      ENTITY yyaccounts_i BY \_fieldmap
       ALL FIELDS
      WITH CORRESPONDING #( posaccounts )
      RESULT DATA(fieldmap).

    "read the table for the posaccounts.
    DATA(lv_count) = lines( posaccounts ).
    IF lv_count >= 2.
    data(msg) = new_message_with_text(
          severity = if_abap_behv_message=>severity-error
          text     = 'Please select only one Customer' ).

      EXIT.
    ENDIF.

    TYPES : BEGIN OF excel_fields,
              field1 TYPE string,
              field2 TYPE string,
              field3 TYPE string,
              field4 TYPE string,
              field5 TYPE string,
              field6 TYPE string,
            END OF excel_fields.

    DATA lv_file_content   TYPE xstring.
    DATA lt_sheet_data     TYPE STANDARD TABLE OF excel_fields.
    lv_file_content = VALUE #( keys[ 1 ]-%param-_streamproperties-StreamProperty OPTIONAL ).
    DATA(lv_filename) = VALUE #( keys[ 1 ]-%param-_streamproperties-filename OPTIONAL ).

    " Error handling in case file content is initial

    DATA(lo_document) = xco_cp_xlsx=>document->for_file_content( lv_file_content )->read_access( ).

    DATA(lo_worksheet) = lo_document->get_workbook( )->worksheet->at_position( 1 ).

    DATA(o_sel_pattern) = xco_cp_xlsx_selection=>pattern_builder->simple_from_to(
      )->from_column( xco_cp_xlsx=>coordinate->for_alphabetic_value( 'A' )  " Start reading from Column A
      )->to_column( xco_cp_xlsx=>coordinate->for_alphabetic_value( 'N' )   " End reading at Column N
      )->from_row( xco_cp_xlsx=>coordinate->for_numeric_value( 2 )    " *** Start reading from ROW 2 to skip the header ***
      )->get_pattern( ).

    lo_worksheet->select( o_sel_pattern
                                     )->row_stream(
                                     )->operation->write_to( REF #( lt_sheet_data )
                                     )->set_value_transformation(
                                         xco_cp_xlsx_read_access=>value_transformation->string_value
                                     )->execute( ).

  ENDMETHOD.

ENDCLASS.
