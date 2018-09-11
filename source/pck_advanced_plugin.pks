--------------------------------------------------------
--  File created - Saturday-March-11-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PCK_ADVANCED_PLUGIN
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "PCK_ADVANCED_PLUGIN" is

  -- ******** ******** ******** ******** --
  -- Plugin:  Advanced Slider
  -- Version: 1.0.0 (07.03.2017.)
  --
  -- Author:  Marko Goricki, BiLog
  -- Mail:    mgoricki@gmail.com
  -- Twitter: @mgoricki
  -- Blog:    apexbyg.blogspot.com
  -- ******** ******** ******** ******** --
  
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
      p_result in out nocopy apex_plugin.t_item_render_result);

end pck_advanced_plugin;

/
