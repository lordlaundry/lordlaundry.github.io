$ = jQuery = require 'jquery'
rC = require 'random-color'
require 'bootstrap-sass'

jQuery(document).ready ->
  faEl = """<link
  rel='stylesheet'
  href='//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'
  />"""
  $('head').append faEl
  $('.logo-section > *').on 'click', ->
    window.location.href = '/'
  setInterval( =>
    $('.logo-section h1').css 'text-shadow', "#{rC(0.95).hexString()} 0 0 10px"
  , 512)
  $('.cards > *').on 'click', ->
    window.location.href = $(@).attr('src')

  # .home
  if $('body').hasClass 'home'
    $('body').css 'opacity', 1
    $('.logo-section h1').addClass 'animated wobble'
    $('#services .item-wrap').delay(750).each (idx, el) ->
      $(el).delay(idx * 200).fadeIn(500)
    promoShown = localStorage.getItem('lordpromo')
    if promoShown is null
      localStorage.setItem('lordpromo', 0)
      promoShown = 0
    if promoShown isnt null and promoShown < 3
      localStorage.setItem('lordpromo', parseInt(promoShown) + 1)
      $('.modal').modal()


# css
require './app.sass'
require 'animate.css/animate.min.css'