# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $(".main_heading").fitText 1.5
  $("section h1").fitText 2

  $(".section h1").click ->
    $parent = $(this).parent()
    $entries = $parent.find(".entries")
    $parent.toggleClass "open"
    if $parent.hasClass "open"
      $entries.css 'height', $entries.find('.wrapper').height()
    else
      $entries.css 'height', 0

  $(".section h2").click ->
    $parent = $(this).parent()
    $description = $parent.children(".description")
    if $description.css("display") is "block"
      $parent.animate
        backgroundColor: "#FFFFFF"
      , 1500
    else
      $parent.animate
        backgroundColor: "#EEEEEE"
      , 1500
    $description.slideToggle "slow"
