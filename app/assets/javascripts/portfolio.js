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
    var $this = $(this), $section, $children, $video;
    if ($this.siblings().length) {
      $section = $this.parent();
      $video = $section.find('.section_video');
      $children = $section.find(".subsection, .section_description");
      $section.toggleClass("open");
      $children.add($video).slideToggle();
      $(".subsection_heading", $section).fitText(2.5);
      if ($section.hasClass("open")) {
        if ($section.data('mp4') && !$video.find('.videoBG').length) {
          $video.videoBG({
            mp4: $section.data('mp4'),
            webm: $section.data('webm'),
            poster: $section.data('poster'),
            height: 300
          });
        }
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
      $video = $entry.find('.video');
      $entryHeading.animate({bottom: -300}, 500, 'swing');
      if ($entry.data('mp4') && !$video.find('.videoBG').length) {
        $video.videoBG({
          mp4: $entry.data('mp4'),
          webm: $entry.data('webm'),
          poster: $entry.data('poster'),
          height: 300
        });
      }
    } else {
      $entryHeading.animate({bottom: 0}, 500, 'swing');
    }
  });
});