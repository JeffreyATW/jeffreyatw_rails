// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
//= require jquery
//= require jquery.fittext
//= require jquery.videoBG

$(function() {
  var initVideo = function ($el, $video) {
    if ($el.data('mp4') && !$video.find('.videoBG').length && !navigator.userAgent.match(/(iPhone|iPod)/)) {
      $video.videoBG({
        mp4: $el.data('mp4'),
        webm: $el.data('webm'),
        poster: $el.data('poster'),
        height: 300
      });
    }
  };

  $(".main_heading").fitText(1.1);
  $(".section_heading").fitText(1.5);

  $(".section_heading").click(function() {
    var $this = $(this), $section, $children, $video;
    if ($this.siblings().length) {
      $section = $this.parent();
      $video = $section.find('.section_video');
      $children = $section.find(".subsection, .section_description");
      $section.toggleClass("open");
      $children.add($video).slideToggle();
      $(".subsection_heading", $section).fitText(2.5);
      if ($section.hasClass("open")) {
        initVideo($section, $video);
      }
    }
  });

  $(".entry_heading").click(function() {
    var $entry = $(this).closest('.entry'),
        $video,
        $entryHeading = $entry.find('.entry_heading');
    $entry.toggleClass("open");
    $entry.find(".contents").slideToggle(500, 'swing');
    if ($entry.hasClass("open")) {
      $('body').animate({scrollTop: $entry.offset().top});
      $video = $entry.find('.video');
      $entryHeading.animate({bottom: -300}, 500, 'swing');
      initVideo($entry, $video);
    } else {
      $entryHeading.animate({bottom: 0}, 500, 'swing');
    }
  });
});