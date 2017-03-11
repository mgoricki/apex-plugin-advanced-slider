# Oracle APEX Advanced Slider Plugin

APEX (5.1+) Plugin build by using [jQuery UI Slider Pips](https://github.com/simeydotme/jQuery-ui-Slider-Pips) and [jQuery UI Slider Widget](http://api.jqueryui.com/slider/) creates advanced slider APEX item. 

## Changelog
1.0.0 Initial Release

## Install
- Import plugin file * item_type_plugin_hr_bilog_mgoricki_advanced_slider.sql from *source* directory 
- (Optional) To optimize performance upload static files (CSS and JS) from *server* directory to Webserver and change File Prefix to point on server directory
- (Optional) Compile package pck_advanced_plugin in DB schema (available to APEX parsing schema) and change parameter Render Procedure/Function Name
to pck_advanced_plugin.p_render_item

## Settings
- **Range** - choose between range and simple slider. If it's range slider, value is saved concatenated with colon, for example 10:15 where 10 is min value, and 15 is max value.
- **Background color** - (optional) if Range = Yes you can define hex background color, like #D8FFC4
- **Min. value** - minimal value
- **Max. value** - maximal value
- **Steps** - slider steps (default 1)
- **Show Pips** - show pips below slider
- **Pip Steps** - (if Show Pips = Yes) - pip steps (default 1)
- **Pip Prefix** - (if Show Pips = Yes) - pip prefix 
- **Pip Sufix** - (if Show Pips = Yes) - pip sufix
- **Show Tooltip** - show tooltip (Yes) or labels inside slider (No)

## Component Settings
- **CSS Path** - path to CSS files. Complete path is concatenation of Plugin File Prefix itema and this property.
- **JS Path** - path to JS files. Complete path is concatenation of Plugin File Prefix itema and this property.

## How to use
-
-

## Demo
- You can find demo on [apex.oracle.com](http://apex.oracle.com/pls/apex/f?p=apexbyg:advancedslider)

## Preview
