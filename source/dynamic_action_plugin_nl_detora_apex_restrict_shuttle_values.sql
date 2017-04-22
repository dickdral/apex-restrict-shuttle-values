set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.3.00.03'
,p_default_workspace_id=>5853461301138549
,p_default_application_id=>1400
,p_default_owner=>'G2S_O'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/dynamic_action/nl_detora_apex_restrict_shuttle_values
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(205067196474939573)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'NL.DETORA.APEX.RESTRICT_SHUTTLE_VALUES'
,p_display_name=>'Restrict Shuttle Values'
,p_category=>'EFFECT'
,p_supported_ui_types=>'DESKTOP'
,p_javascript_file_urls=>'#PLUGIN_FILES#apex_restrict_shuttle_values.js'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'/*--------------------------------------------------------------------------',
' * APEX Restrict Shuttle Values',
' * Version: 1.1 (22-04-2017)',
' * Author:  Dick Dral',
' *',
' * DD  22-04-2017    V1.1    Adapted for other triggering elements than search item',
' * DD  16-04-2017    V1.0    Initial version',
' *--------------------------------------------------------------------------',
'*/',
'FUNCTION render_restrict_shuttle_values(p_dynamic_action IN apex_plugin.t_dynamic_action,',
'                               p_plugin         IN apex_plugin.t_plugin)',
'  RETURN apex_plugin.t_dynamic_action_render_result IS',
'  --',
'  l_onload_code       varchar2(4000) := q''!console.log(''Catch Return''); $("[search_item]").keypress(function(e){',
'      return e.keyCode != 13;',
'   });!'';',
'  ',
'  -- plugin attributes',
'  l_result            apex_plugin.t_dynamic_action_render_result;',
'  l_search_item       varchar2(100)  := p_dynamic_action.attribute_01;',
'  --',
'BEGIN',
'  --',
'  l_onload_code := replace(l_onload_code,''[search_item]'',''#''||l_search_item);',
'  apex_javascript.add_onload_code(l_onload_code);',
'  --',
'  l_result.javascript_function := ''apex_restrict_shuttle_values.doIt'';',
'  --',
'  l_result.attribute_01        := l_search_item;',
'  --',
'  RETURN l_result;',
'  --',
'END render_restrict_shuttle_values;'))
,p_render_function=>'render_restrict_shuttle_values'
,p_standard_attributes=>'ITEM:REQUIRED'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_files_version=>2
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(205067377491946341)
,p_plugin_id=>wwv_flow_api.id(205067196474939573)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Search Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_supported_ui_types=>'DESKTOP'
,p_is_translatable=>false
,p_help_text=>'Item that contains the search string to limit the values in the left shuttle pane'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2F20415045582052657374726963742053687574746C652056616C7565730A2F2F20417574686F723A204469636B204472616C20284465746F7261290A2F2F2056657273696F6E3A20312E300A2F2F20446174653A20417072696C20313474682C2032';
wwv_flow_api.g_varchar2_table(2) := '3031370A0A2F2F20676C6F62616C206E616D6573706163650A76617220617065785F72657374726963745F73687574746C655F76616C756573203D207B0A0A72657374726963745F76616C7565733A2066756E6374696F6E2028207365617263685F6974';
wwv_flow_api.g_varchar2_table(3) := '656D2C2073687574746C655F6974656D20290A7B0A2020636F6E736F6C652E6C6F672827706572666F726D2052657374726963742073687574746C652076616C75657327293B0A0A202076617220736561726368203D20617065782E6974656D28736561';
wwv_flow_api.g_varchar2_table(4) := '7263685F6974656D292E67657456616C756528293B0A2020736561726368203D207365617263682E746F4C6F7765724361736528293B0A0A20207365617263685F776F726473203D207365617263682E73706C697428272027293B0A20202020636F6E73';
wwv_flow_api.g_varchar2_table(5) := '6F6C652E6C6F6728277365617263685F776F7264733D27202C207365617263685F776F7264730A202020202020202020293B202020200A202020200A2020766172206974656D735F68696464656E203D2066616C73653B0A202024282723272B73687574';
wwv_flow_api.g_varchar2_table(6) := '746C655F6974656D2B275F4C454654206F7074696F6E27292E65616368280A20202020202066756E6374696F6E2829200A2020202020207B0A2020202020202020207661722074657874203D20242874686973292E7465787428292E746F4C6F77657243';
wwv_flow_api.g_varchar2_table(7) := '61736528293B0A0A2020202020202020207661722076697369626C65203D20747275653B20200A20202020202020202069662028207365617263682E6C656E677468203E203020290A2020202020202020207B0A2020202020202020202020666F722028';
wwv_flow_api.g_varchar2_table(8) := '2069203D20303B2069203C207365617263685F776F7264732E6C656E6774683B20692B2B290A20202020202020202020207B200A20202020202020202020202020206966202820746578742E696E6465784F66287365617263685F776F7264735B695D29';
wwv_flow_api.g_varchar2_table(9) := '203C20302029200A20202020202020202020202020207B2076697369626C65203D2066616C73653B207D0A20202020202020202020207D0A2020202020202020207D0A0A202020202020202020696620282076697369626C652029200A20202020202020';
wwv_flow_api.g_varchar2_table(10) := '20207B2020242874686973292E73686F7728293B207D0A202020202020202020656C73650A2020202020202020207B2020242874686973292E6869646528293B200A2020202020202020202020206974656D735F68696464656E203D20747275653B0A20';
wwv_flow_api.g_varchar2_table(11) := '20202020202020207D0A0A202020202020207D0A202020293B20200A20202069662028206974656D735F68696464656E20290A2020207B20202024282723272B73687574746C655F6974656D2B275F4D4F56455F414C4C27292E616464436C6173732827';
wwv_flow_api.g_varchar2_table(12) := '617065785F64697361626C656427293B0A2020207D0A20202020656C73650A2020207B20202024282723272B73687574746C655F6974656D2B275F4D4F56455F414C4C27292E72656D6F7665436C6173732827617065785F64697361626C656427293B0A';
wwv_flow_api.g_varchar2_table(13) := '2020207D0A20202020202020200A7D2C0A0A202020202F2F2066756E6374696F6E207468617420676574732063616C6C65642066726F6D20706C7567696E0A20202020646F49743A2066756E6374696F6E2829207B0A20202020202020202F2F20706C75';
wwv_flow_api.g_varchar2_table(14) := '67696E20617474726962757465730A202020202020202076617220646154686973203D20746869733B0A2020202020202020766172207365617263685F6974656D20203D20746869732E74726967676572696E67456C656D656E742E69643B0A20202020';
wwv_flow_api.g_varchar2_table(15) := '202020207661722073687574746C655F6974656D203D206461546869732E6166666563746564456C656D656E74735B305D2E69643B0A2020202020202020636F6E736F6C652E6C6F67287365617263685F6974656D2C2073687574746C655F6974656D29';
wwv_flow_api.g_varchar2_table(16) := '3B0A2020202020202020617065785F72657374726963745F73687574746C655F76616C7565732E72657374726963745F76616C756573287365617263685F6974656D2C73687574746C655F6974656D293B0A202020207D0A7D3B0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(205067787538972546)
,p_plugin_id=>wwv_flow_api.id(205067196474939573)
,p_file_name=>'apex_restrict_shuttle_values.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
