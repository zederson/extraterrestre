var bender;
(function (bender) {
  'use strict';

  function init() {
    register();
  }
  bender.init = init;

  function register() {
    $('#controll_lights_sensor').on({click: controllLightSensor});
  }

  function controllLightSensor() {
    var target = $(this).data('target');
    var hidden = $(this).data('hidden');
    var value  = $(hidden).val();

    var uri    = '/api/bender/sensor_light';
    var newVal = !$.parseJSON(value);
    var data = JSON.stringify({status: newVal});

    $.ajax({
          url: uri,
          type: 'PUT',
          data: data,
          contentType: "application/json",
          dataType: 'json'
    }).done(function(data) {

      $(target).removeClass('fa-info-circle');
      $(target).removeClass('fa-check-circle');

      if (data.status) {
        $(target).addClass('fa-info-circle');
      } else {
        $(target).addClass('fa-check-circle');
      }

      $(hidden).val($.parseJSON(data.status))
    });
  }

})(bender || (bender = {}));
