# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("h1").animate
    opacity: 1
  , 1000, ->
    $(".nav_list, section.archive, hgroup h2").animate
      opacity: 1
    , 1000

  $(".nav_list li").hover ->
    if $("body").width() >= 803
      section = $("section." + $(this).attr("class"))
      $("section").not(section).stop().hide()
      if $.trim(section.children(":not(h1)").text()) isnt "" or section.has("img").length
        section.not(":animated").css "opacity", 1
        section.fadeIn(queue: false)
      offset = 3.5 - $(this).index()
      rotate = "rotateY(" + offset + "deg) scaleX(" + (1 - Math.abs(offset) / 24) + ")"
    else
      $archive = $("section.archive")
      $("section").not($archive).stop().hide()
      $archive.show()
      rotate = "none"
    $(".rotation").css("-webkit-transform", rotate).css("-moz-transform", rotate).css("-ms-transform", rotate).css("-o-transform", rotate).css("transform", rotate)

  $.getJSON "http://pipes.yahoo.com/pipes/pipe.run?_id=3615cdd72b5a2c5e762feca9631d0e79&_render=json&_callback=?", (data) ->
    $.each data.value.items, (i, item) ->
      $li = $("<li>")
      $h2 = $("<h2>")
      $a = $("<a>")
      $a.attr "href", item.link
      $a.text item.title
      $h2.append $a
      $p = $("<p>")
      text = item.description.replace(/<\/?[^>]+(>|$)/g, " ")
      text = text.substring(0, 200)
      text = text.replace(/\w+$/, "")
      text = text + "..."
      $p.html text
      $li.append $h2
      $li.append $p
      $("section.journal ul").append $li