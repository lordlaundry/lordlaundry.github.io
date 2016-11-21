require('./app.sass')
jQuery = require 'jquery'

jQuery(document).ready ($) ->
  $('#services .item-wrap').each (idx, el) ->
    animateIt = =>
      $(el).fadeIn()
    setTimeout(animateIt, idx * 500)
    return
  return
