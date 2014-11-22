# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
showPassword = ->
  key_attr = $("#key").attr("type")
  unless key_attr is "text"
    $(".checkbox").addClass "show"
    $("#key").attr "type", "text"
  else
    $(".checkbox").removeClass "show"
    $("#key").attr "type", "password"
  return