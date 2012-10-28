# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("h1").click ->
    $("#contents").slideToggle "slow"

  $("h2").click ->
    $(this).parent().children(".entries").slideToggle "slow"

  $("h3").click ->
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

  $("#notice").animate
    right: "10px"
    opacity: 1
  , 3000
  $("#notice").fadeOut 3000
