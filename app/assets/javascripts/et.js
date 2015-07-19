var triggers;
(function (triggers) {
  'use strict';

  function init() {
    register();
  }
  triggers.init = init;

  function register() {
    $('.trigger_execute').on({click: trigger});
  }

  function trigger() {
    var name = $(this).data('name');
    send(name)
  }

  function send(name) {
    var path = '/api/trigger/' + name;
    $.ajax({
      url:       path,
      type:      'POST',
      async:     true,
      dataType:  "json",

      success: function(data) {
      },
      cache: false
    });
  }

})(triggers || (triggers = {}));
triggers.init();
