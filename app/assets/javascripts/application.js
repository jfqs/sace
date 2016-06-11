// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require js/bootstrap-select.min
//= require js/bootstrap.min
//= require js/jquery.dataTables.min
//= require js/dataTables.bootstrap.min
//= require js/Chart.min
//= require js/fileinput
//= require js/chartData
//= require js/main

jQuery(function() {
  $('form').on('click', '.remove_fields', function(event) {
    $(this).parent().parent().prev('input[type=hidden]').val('1');
    $(this).closest('.panel-default').hide();
    return event.preventDefault();
  });

  $('form').on('click', '.add_fields', function(event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(".form-button").before($(this).data('fields').replace(regexp, time)
      /*'\
      <div class="panel panel-default">\
        <div class="panel-heading" role="tab" id="headingTwo">\
          <h4 class="panel-title">\
            <a class="collapsed" role="button" aria-controls="collapseTwo">\
              Datos del alumno\
            </a>\
          </h4>\
        </div>\
        <div id="collapseTwo" class="panel-collapse" aria-labelledby="headingTwo">\
          <div class="panel-body">'+ $(this).data('fields').replace(regexp, time) + '\
          </div>\
        </div>\
      </div>'
      */);
    return event.preventDefault();
  });
});