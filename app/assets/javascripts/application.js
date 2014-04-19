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
//= require turbolinks
//= require bootstrap
//= require_tree .
var ready;
ready = function() {

	var iframe = $('#vimeo')[0];
	
  if (iframe !== undefined) {
    player = $f(iframe);

    // When the player is ready, add listeners for pause, finish, and playProgress
    player.addEvent('ready', function() {
      player.addEvent('pause', onHalt);
      player.addEvent('finish', onHalt);
      player.addEvent('play', onResume);
    });

    function onResume(id) {
      $('.halt').fadeOut();
    }
    function onHalt(id) {
      $('.halt').fadeIn();
    }
  }
};

$(document).ready(ready);
$(document).on('page:load', ready);
