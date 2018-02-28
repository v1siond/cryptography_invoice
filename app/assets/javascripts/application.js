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
//= require_tree .
//= require jquery-ui/autocomplete
//= require app
//= require search
//= require calculator

jQuery(document).ready(function($) {
  var fadeScreen = '.fade-screen.-external.-menu';
  var slidePanel = '.sliding-panel';
  var visibleClass = 'is-visible';
  $('.burger-button').click(function() {
    if ($(this).hasClass(visibleClass) == true) {
      $(this).add(fadeScreen).add(slidePanel).removeClass(visibleClass);
    } else {
      $(this).add(fadeScreen).add(slidePanel).addClass(visibleClass);
    }
  });

});
