define [
  'spinner'
], (Spinner) ->

  class Spin
    OPTIONS =
      lines: 11 # The number of lines to draw
      length: 15 # The length of each line
      width: 8 # The line thickness
      radius: 20 # The radius of the inner circle
      corners: 1 # Corner roundness (0..1)
      rotate: 0 # The rotation offset
      direction: 1 # 1: clockwise, -1: counterclockwise
      color: "#fff" # #rgb or #rrggbb or array of colors
      speed: 1 # Rounds per second
      trail: 60 # Afterglow percentage
      shadow: false # Whether to render a shadow
      hwaccel: false # Whether to use hardware acceleration
      className: "spinner" # The CSS class to assign to the spinner
      zIndex: 2e9 # The z-index (defaults to 2000000000)
      top: "50%" # Top position relative to parent
      left: "50%" # Left position relative to parent

    @init: ->
      target = document.getElementById('spinner')
      new Spinner(OPTIONS).spin(target)
      @$spinner = $('#spinner')
      @hide()

    @hide: ->
      @$spinner.hide(0)

    @show: ->
      @$spinner.show(0)
