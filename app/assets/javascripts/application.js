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
function onResume(id) {
  //$('.halt').fadeOut();
}
function onHalt(id) {
  //$('.halt').fadeIn();
}
function onFinish(id) {
  $('.halt').fadeIn();
}
function onPlayProgress(data) {
  if (data.seconds > 1520) {
    player.api('pause');
    onFinish();
  }
}

var ready;
ready = function() {
  $(document).scroll(function() {
    if (window.pageYOffset != 0) {
      $('.navbar').addClass('scroll');
    } else {
      $('.navbar').removeClass('scroll');
    }
  });

	var iframe = $('#player')[0];
	
  if (iframe !== undefined) {
    player = $f(iframe);

    // When the player is ready, add listeners for pause, finish, and playProgress
    player.addEvent('ready', function() {
      player.addEvent('pause', onHalt);
      player.addEvent('finish', onFinish);
      player.addEvent('play', onResume);
      player.addEvent('playProgress', onPlayProgress);
    });

  }

  var ytdiv = $('#ytplayer')[0];

  if (ytdiv !== undefined) {
    var onPlayerStateChange = function (evt) {
      switch (evt.data) {
        case YT.PlayerState.ENDED:
          onFinish();
          break;
      }
    }

    var tag = document.createElement('script');
    var title = document.title;
    tag.src = "//www.youtube.com/iframe_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

    window.onYouTubeIframeAPIReady = function () {
      $('body').addClass('video');
      YTplayer = new YT.Player('ytplayer', {
        videoId: $('#ytplayer').data('video_id'),
        playerVars: {
          autoplay: 1,
          modestbranding: 1,
          rel: 0,
          showinfo: 0,
          iv_load_policy: 3,
          html5: 1,
        },
        events: {
          'onStateChange': onPlayerStateChange
        }
      });
    };
  }
};

$(document).ready(ready);
$(document).on('page:load', ready);
