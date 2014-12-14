// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-datepicker
//= require twitter/bootstrap
//= require twitter/typeahead
//= require jquery.ui.all
//= require_tree .

$(function () {
    $('.datepicker1').datepicker({
        changeYear: true,
        yearRange: "-100:+100"
    });

    $('.datepicker2').datepicker({
        changeYear: true,
        yearRange: "-100:+100"
    });

    $('.datepicker').datepicker({
        changeYear: true,
        yearRange: "-100:+100"
    });
});


function cascading_input_field_changes(target_id, target_dom, target_field_name, target_url) {
    $.ajax({
            url: target_url,
            data: {target_id: target_id, target_dom: target_dom, target_input_field: target_field_name}}
    )
}
