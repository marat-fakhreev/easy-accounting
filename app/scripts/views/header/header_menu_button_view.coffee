define [
  'marionette'
  'facades/event_aggregator'
  'templates'
], (Marionette, Vent) ->

  class HeaderMenuButtonView extends Marionette.ItemView
    template: JST['templates/header/header_menu_button']

    ui:
      slideMenuButton: '#slide_menu_button'

    events:
      'click @ui.slideMenuButton': 'onTapMenuButton'

    onTapMenuButton: ->
      Vent.trigger('navigation:toggle')
