// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
//= require jquery
//= require jquery.fittext
//= require jquery.videoBG

$(function() {
  $(".main_heading").fitText(1.5);
  $(".section_heading").fitText(2);

  $(".section_heading").click(function() {
    var $parent = $(this).parent(),
      $subs = $parent.find(".subsection");
    $parent.toggleClass("open");
    $subs.slideToggle();
    $(".subsection_heading").fitText(2.5);
  });

  $(".entry_heading").click(function() {
    var $entry = $(this).closest('.entry'),
        $video = $entry.find('.video'),
        $entryHeading = $entry.find('.entry_heading');
    $entry.toggleClass("open");
    $entry.find(".contents").slideToggle(500, 'swing');
    if ($entry.hasClass("open")) {
      $entryHeading.animate({bottom: -300}, 500, 'swing');
      if (!$video.find('.videoBG').length) {
        $video.videoBG({
          mp4: $entry.data('mp4'),
          webm: $entry.data('webm'),
          height: 300
        });
      }
    } else {
      $entryHeading.animate({bottom: 0}, 500, 'swing');
    }
  });
});