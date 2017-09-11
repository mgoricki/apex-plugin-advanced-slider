/*
* Plugin:  Advanced Slider
* Version: 1.0.0 (07.03.2017.)
*
* Author:  Marko Goricki, BiLog
* Mail:    mgoricki@gmail.com
* Twitter: @mgoricki
* Blog:    apexbyg.blogspot.com
*
* Depends:
*    apex/debug.js
*    apex/item.js
*
* Changes:
*
* v.1.0.0 - 20170307 - Initial Version
* v.1.0.1 - 20170911 - Added on triggering on change DA event
*/
(function (debug, item, $){
  "use strict";

  $.widget( "apex.advancedslider", {
    plugin: "APEX advanced slider...",
    version: "1.0",
    item$: null,
    slider$: null,
    options: {
    },

    // create function
    _create: function(a){
      var self = this;
      self.itemId = this.element.attr('id');
      self.item$ = $('#'+self.itemId);
      self.slider$ = $('#'+self.itemId+'_slider');
      self.itemVal = self.item$.val();
      self.isRange = self.options.range=='Y' ? true:false;
      self.isDisabled = false;

      // init slider
      var vSlider =
      self.slider$
        // main slider
        .slider({
          range: self.isRange,
          min: parseInt(self.options.min),
          max: parseInt(self.options.max),
          step: parseInt(self.options.step),
          slide: function(e, ui){
            debug.log(self.plugin, 'Slider Slide', e, ui);
            // show label
            if(self.options.showTooltips!='Y'){
              $(ui.handle).html(ui.value);
            }
          },
          change: function(e,ui){
            debug.log(self.plugin, 'Slider Change', e, ui);
            // show label
            if(self.options.showTooltips!='Y'){
              $(ui.handle).html(ui.value);
            }
            self.item$.trigger('change');
          },
          stop: function(e,ui){
            debug.log(self.plugin, 'Slider Stop', e, ui);
            var vValue;
            if(self.isRange){
              vValue = ui.values.join(':');
            }else{
              vValue = ui.value;
            }
            // set item value
            self._setValue(vValue);
          }
        });

      // Pips
      if (self.options.showPips=='Y'){
        vSlider.slider("pips",
          {
            first: "label",
            last: "label",
            rest: "label",
            step: parseInt(self.options.pipStep),
            prefix: self.options.pipPrefix,
            suffix: self.options.pipSufix
          }
        );
      }

      // Tooltips
      if (self.options.showTooltips=='Y'){
        vSlider.slider("float",
          {
            prefix: ""
          }
        );
      }

      // Readonly
      if (self.options.readonly=='Y'){
        self.slider$.slider('disable');
      }

      // Set Slider Color
      if(self.isRange&&self.options.sliderColor){
        self.slider$.find('.ui-slider-range').css('background-color',self.options.sliderColor);
      }

      // set slider value
      self._setSliderValue();

      // APEX item
      apex.item.create(self.itemId, {
          setValue: function(pValue,a){
            debug.log(self.plugin, 'Set Value');
            if(!self.isDisabled){
              self.itemVal = pValue;
              self.item$.val(pValue);
              self._setSliderValue();
            }else{
              debug.log(self.plugin, 'Slider disabled, cant change value');
            }
          },
          disable: function() {
            debug.log(self.plugin, 'Disable');
            self.slider$.slider('disable');
            self.isDisabled = true;
          },
          enable: function() {
            debug.log(self.plugin, 'Enable');
            self.slider$.slider('enable');
            self.isDisabled = false;
          }
      });
     },

     // set item value
     _setValue: function(pValue){
       debug.log('Set Slider Item Value');
       var self = this;
       self.item$.val(pValue);
     },

     // set slider value
     _setSliderValue: function(){
       var self = this;
       debug.log('Set Slider Value = '+self.itemVal);
        // set default value or values
        var vOptVal = 'value';

        /*
        if(!self.itemVal){
          if (self.isRange){
            self.itemVal = '0:0';
          }else{
            self.itemVal = '0';
          }
        }
        */

        if (self.isRange){
          vOptVal = 'values';
          self.itemVal = self.itemVal.split(':');
        }
        if($.trim(self.itemVal).length>0){
          self.slider$.slider( "option", vOptVal,  self.itemVal);
        }
     }

   });

 })(apex.debug, apex.item, apex.jQuery );

//# sourceMappingURL=advanced.slider.1.0.0.js.map
