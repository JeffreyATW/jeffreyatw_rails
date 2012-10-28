# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  relative_created_at = (time_value) ->
    created_at_time = Date.parse(time_value.replace(" +0000", ""))
    relative_time = (if (arguments.length > 1) then arguments[1] else new Date())
    wordy_time = parseInt((relative_time.getTime() - created_at_time) / 1000) + (relative_time.getTimezoneOffset() * 60)
    if wordy_time < 59
      "less than a minute ago"
    else if wordy_time < 89
      "about a minute ago"
    else if wordy_time < 3000
      (parseInt(wordy_time / 60)).toString() + " minutes ago"
    else if wordy_time < 5340
      "about an hour ago"
    else if wordy_time < 9000
      "a couple of hours ago"
    else if wordy_time < 82800
      "about " + (parseInt(wordy_time / 3600)).toString() + " hours ago"
    else if wordy_time < 129600
      "a day ago"
    else if wordy_time < 172800
      "almost 2 days ago"
    else
      (parseInt(wordy_time / 86400)).toString() + " days ago"
  $("h1").animate
    opacity: 1
  , 1000, ->
    $("nav, section.archive, hgroup h2").animate
      opacity: 1
    , 1000

  $("nav ul li").hover ->
    if $("body").width() >= 803
      section = $("section." + $(this).attr("class"))
      $("section").not(section).stop().hide()
      if $.trim(section.children(":not(h1)").text()) isnt "" or section.has("img").length
        section.not(":animated").css "opacity", 1
        section.fadeIn()
      offset = 2.5 - $(this).index()
      rotate = "rotateY(" + offset + "deg) scaleX(" + (1 - Math.abs(offset) / 24) + ")"
    else
      rotate = "none"
    $("#rotation").css("-webkit-transform", rotate).css("-moz-transform", rotate).css("-ms-transform", rotate).css("-o-transform", rotate).css("transform", rotate)


  $.getJSON "http://api.twitter.com/1/statuses/user_timeline.json?screen_name=jeffreyatw&callback=?", (data) ->
    count = 0
    $.each data, (i, post) ->
      if count < 5
        unless post.text.substr(0, 1) is "@"
          li = $("<li>")
          li.html post.text + " "
          a = $("<a>")
          a.attr "href", "http://twitter.com/JeffreyATW/" + "status/" + post.id_str
          a.attr "title", "Permalink to this twitter (id " + post.id_str + ") at Twitter.com"
          a.text relative_created_at(post.created_at)
          li.append a
          $("section.twitter ul").append li
          count++
  $.getJSON "http://pipes.yahoo.com/pipes/pipe.run?_id=3615cdd72b5a2c5e762feca9631d0e79&_render=json&_callback=?", (data) ->
    $.each data.value.items, (i, item) ->
      li = $("<li>")
      h2 = $("<h2>")
      a = $("<a>")
      a.attr "href", item.link
      a.text item.title
      h2.append a
      p = $("<p>")
      text = item.description.replace(/<\/?[^>]+(>|$)/g, " ")
      text = text.substring(0, 200)
      text = text.replace(/\w+$/, "")
      text = text + "..."
      p.html text
      li.append h2
      li.append p
      $("section.journal ul").append li