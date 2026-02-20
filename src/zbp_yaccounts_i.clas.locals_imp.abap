
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



    "read the table for the posaccounts.
*    DATA(lv_count) = lines( posaccounts ).
*    IF lv_count >= 2.
*      DATA(msg) = new_message_with_text(
*            severity = if_abap_behv_message=>severity-error
*            text     = 'Please select only one Customer' ).
*
*      EXIT.
*    ENDIF.

    TYPES : BEGIN OF excel_fields,
              field1  TYPE string,
              field2  TYPE string,
              field3  TYPE string,
              field4  TYPE string,
              field5  TYPE string,
              field6  TYPE string,
              field7  TYPE string,
              field8  TYPE string,
              field9  TYPE string,
              field10 TYPE string,
              field11 TYPE string,
              field12 TYPE string,
              field13 TYPE string,
              field14 TYPE string,
            END OF excel_fields.

    DATA lv_file_content   TYPE xstring.
    DATA lt_sheet_data     TYPE STANDARD TABLE OF excel_fields.
    DATA ls_posdatabase    TYPE zposdatabase.
    DATA lt_posdatabase    TYPE TABLE OF zposdatabase.
    DATA : lv_name    TYPE string,
           lv_channel TYPE string,
           lv_date    TYPE string.
    FIELD-SYMBOLS : <LV_kunnrmatnr>   TYPE any,
                    <LV_qtysold>      TYPE any,
                    <lv_qtyavailable> TYPE any.

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

    LOOP AT lt_sheet_data INTO DATA(ls_sheet_date).
      READ ENTITIES OF yyaccounts_i IN LOCAL MODE
      ENTITY yyaccounts_i
      ALL FIELDS WITH
      CORRESPONDING #( keys )
      RESULT DATA(posaccounts).

      LOOP AT posaccounts ASSIGNING FIELD-SYMBOL(<ls_posaccounts>).

        ls_posdatabase = VALUE #(
                                  poskunnr = <ls_posaccounts>-poskunnr
                                  channel  = <ls_posaccounts>-channel
                                  division = <ls_posaccounts>-division
                                  bukrs    = <ls_posaccounts>-Bukrs
                                  posfrequency = <ls_posaccounts>-Posfrequency ).

      ENDLOOP.

      READ ENTITIES OF yyaccounts_i IN LOCAL MODE
      ENTITY yyaccounts_i BY \_fieldmap
      ALL FIELDS
      WITH CORRESPONDING #( posaccounts )
      LINK DATA(fieldmap_links)
      RESULT DATA(fieldmap).

      LOOP AT fieldmap ASSIGNING FIELD-SYMBOL(<ls_fieldmap>).

        IF <ls_fieldmap>-Targetfield = 'KUNNRMATNR'.

          SHIFT <ls_fieldmap>-Excelfield LEFT DELETING LEADING '0'.
          DATA(lv_field) = | 'FIELD'{ <ls_fieldmap>-Excelfield }|.
          ASSIGN COMPONENT lv_field OF STRUCTURE ls_sheet_date TO <LV_kunnrmatnr>.
          CLEAR lv_field.
        ENDIF.

        IF <ls_fieldmap>-Targetfield = 'QTYSOLD'.

          SHIFT <ls_fieldmap>-Excelfield LEFT DELETING LEADING '0'.
          lv_field = | 'FIELD'{ <ls_fieldmap>-Excelfield }|.
          ASSIGN COMPONENT lv_field OF STRUCTURE ls_sheet_date TO <lv_qtysold>.

        ENDIF.

        IF <ls_fieldmap>-Targetfield = 'QTYAVAILABLE'.

          SHIFT <ls_fieldmap>-Excelfield LEFT DELETING LEADING '0'.
          lv_field = | 'FIELD'{ <ls_fieldmap>-Excelfield }|.
          ASSIGN COMPONENT lv_field OF STRUCTURE ls_sheet_date TO <lv_qtyavailable>.

        ENDIF.

      ENDLOOP.
      SPLIT lv_filename AT ' ' INTO lv_name lv_channel lv_date .

      ls_posdatabase = VALUE #(   kunnrmatnr  = <LV_kunnrmatnr>
                                  qtysold  = <lv_qtysold>
                                  qtyavailable = <lv_qtyavailable>
                                  datefrom = lv_date
                                  dateto = lv_date
                                  local_created_by = cl_abap_context_info=>get_user_alias(  )
                                  local_created_at = cl_abap_context_info=>get_system_time( )  ).

*      MODIFY ENTITIES OF yyaccounts_i
*      ENTITY yyposdatabase_i
*      UPDATE
*      FROM VALUE #(
*        (  %data = ls_posdatabase ) ).


    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
