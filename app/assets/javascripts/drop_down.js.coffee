$(document).on 'ready', ->

  $menu = $('#js-navigation')

  $('.avatar', $menu).on 'click', ->

    $('ul', $menu).slideToggle()
