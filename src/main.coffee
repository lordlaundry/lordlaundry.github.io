require('./app.sass')
jQuery = require 'jquery'

jQuery(document).ready (jq) ->
  if jq('body').hasClass('home')
    homeOnReady(jq)
  else
    console.log 'Not Home'

homeOnReady = ($) ->
  $('#services .item-wrap').each (idx, el) ->
    $(el).delay(idx * 300).fadeIn(500)
