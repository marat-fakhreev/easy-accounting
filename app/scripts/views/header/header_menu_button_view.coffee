define [
  'marionette'
  'facades/event_aggregator'
  'templates'
], (Marionette, Vent) ->

  class HeaderMenuButtonView extends Marionette.ItemView
    template: JST['templates/header/header_menu_button']

    hammerEvents:
      'tap #slide_menu_button': 'onTapMenuButton'

    onTapMenuButton: ->
      Vent.trigger('navigation:toggle')
