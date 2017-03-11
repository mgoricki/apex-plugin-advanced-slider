--------------------------------------------------------
--  File created - Saturday-March-11-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package Body PCK_ADVANCED_PLUGIN
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "PCK_ADVANCED_PLUGIN" as

  ------------------------------------------------------------------------------------
  -- PROCEDURE p_render_item
  -- %usage procedure for renderin APEX Advenced Slider Plugin 
  -- %param p_item
  -- %param p_plugin
  -- %param p_param
  -- %param p_result
  procedure p_render_item (
      p_item   in            apex_plugin.t_item,
      p_plugin in            apex_plugin.t_plugin,
      p_param  in            apex_plugin.t_item_render_param,
      p_result in out nocopy apex_plugin.t_item_render_result) 
  AS
    v_css_path    varchar2(200)  := p_plugin.file_prefix||p_plugin.attribute_01;
    v_js_path     varchar2(200)  := p_plugin.file_prefix||p_plugin.attribute_02;
    v_onload_code varchar2(2000);
    v_name        varchar2(30);
    v_readonly    varchar2(1) := 'N';
    v_file_version pls_integer := 1;
  BEGIN
    v_name := apex_plugin.get_input_name_for_page_item(false);
    
    sys.htp.prn('<div class="slider_container"><input type="hidden" id="'||p_item.name||'" value="'||p_param.value||'" name="'||v_name||'" /><div id="'||p_item.name||'_slider"></div></div>');
    
    p_result.is_navigable := true;
    
    -- add cssPCK_PLUGINS

    apex_css.add_file (p_name => 'jquery-ui-1.10.4.slider.min.css?v='||v_file_version
                     , p_directory => v_css_path
                     , p_skip_extension => true);

    apex_css.add_file (p_name => 'jquery-ui-slider-pips.css?v='||v_file_version
                     , p_directory => v_css_path
                     , p_skip_extension => true);          
                     
    apex_css.add_file (p_name => 'advanced.slider.1.0.0.css?v='||v_file_version
                     , p_directory => v_css_path
                     , p_skip_extension => true);                      
                
    if p_param.is_readonly then
      v_readonly := 'Y';
    end if;
    
    -- add JS
    apex_javascript.add_library (p_name => 'jquery-ui-1.10.4.slider.min.js?v='||v_file_version
                               , p_directory => v_js_path
                               , p_skip_extension => true);
                               
    apex_javascript.add_library (p_name => 'jquery-ui-slider-pips#MIN#.js?v='||v_file_version
                               , p_directory => v_js_path
                               , p_skip_extension => true);                               
                              
    apex_javascript.add_library (p_name => 'advanced.slider.1.0.0#MIN#.js?v='||v_file_version
                               , p_directory => v_js_path
                               , p_skip_extension => true);
                               
                
    -- onload kod
    v_onload_code := 'apex.jQuery("#'||p_item.name||'").advancedslider({  '||
      apex_javascript.add_attribute (p_name => 'range'
                                   , p_value => p_item.attribute_01
                                   , p_add_comma => true)||
      apex_javascript.add_attribute (p_name => 'sliderColor'
                                   , p_value => p_item.attribute_10
                                   , p_add_comma => true)||                                   
      apex_javascript.add_attribute (p_name => 'min'
                                   , p_value => p_item.attribute_02
                                   , p_add_comma => true)||              
      apex_javascript.add_attribute (p_name => 'max'
                                   , p_value => p_item.attribute_03
                                   , p_add_comma => true)|| 
      apex_javascript.add_attribute (p_name => 'step'
                                   , p_value => p_item.attribute_07
                                   , p_add_comma => true)||                                    
      apex_javascript.add_attribute (p_name => 'showPips'
                                   , p_value => p_item.attribute_05
                                   , p_add_comma => true)|| 
      apex_javascript.add_attribute (p_name => 'pipPrefix'
                                   , p_value => p_item.attribute_08
                                   , p_add_comma => true)|| 
      apex_javascript.add_attribute (p_name => 'pipSufix'
                                   , p_value => p_item.attribute_09
                                   , p_add_comma => true)||                                    
      apex_javascript.add_attribute (p_name => 'showTooltips'
                                   , p_value => p_item.attribute_06
                                   , p_add_comma => true)||     
      apex_javascript.add_attribute (p_name => 'readonly'
                                   , p_value => v_readonly
                                   , p_add_comma => true)||    
      apex_javascript.add_attribute (p_name => 'pipStep'
                                   , p_value => p_item.attribute_04
                                   , p_add_comma => false)                                       
    ||'})';
    
    
    apex_javascript.add_onload_code (p_code => v_onload_code);
--  
    
  END p_render_item;

end pck_advanced_plugin;

/
