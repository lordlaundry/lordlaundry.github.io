require './app.sass'
require 'animate.css/animate.min.css'
jQuery = require 'jquery'
rC = require 'random-color'
require 'bootstrap-sass'
require 'unslider'

jQuery(document).ready (jq) ->
  commonOnReady(jq)
  if jq('body').hasClass('home')
    homeOnReady(jq)
  else
    console.log 'Not Home'

homeOnReady = ($) ->
  $ 'body'
    .css 'opacity', 1
  $('#services .item-wrap').each (idx, el) ->
    $(el).delay(idx * 200).fadeIn(500)
  $ '.logo-section h1'
    .addClass 'animated wobble'
  changeColor = ($, color) => $('.logo-section h1').css('color', color)
  setInterval( =>
    changeColor($, rC(0.95).hexString())
  , 500)


commonOnReady = ($) ->
  fontawesome = document.createElement 'link'
  fontawesome.rel = 'stylesheet'
  fontawesome.href = '//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'
  $('head').append fontawesome
  $('.logo-section > *').on 'click', ->
    window.location.href = '/'