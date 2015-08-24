var bender;
(function (bender) {
  'use strict';

  function init() {
    register();
  }
  bender.init = init;

  function register() {
    $('#controll_lights_sensor').on({click: controllLightSensor});
    $('.socket_controll').on({click: socketControll});
  }

  function socketControll(){
    var target = $(this).data('target');
    var id     = $(this).data('id');
    var hidden = $(this).data('value');
    var value  = $(hidden).val();

    var uri    = '/api/bender/' + id + '/socket';
    var newVal = !$.parseJSON(value);
    var data = JSON.stringify({status: newVal});

    $.ajax({
          url: uri,
          type: 'PUT',
          data: data,
          contentType: "application/json",
          dataType: 'json'
    }).done(function(data) {

      $(target).removeClass('label-danger');
      $(target).removeClass('label-success');

      if (data.status) {
        $(target).addClass('label-success');
        $(target).text('Ligado');
      } else {
        $(target).addClass('label-danger');
        $(target).text('Desligado');
      }

      $(hidden).val($.parseJSON(data.status))
    });
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
