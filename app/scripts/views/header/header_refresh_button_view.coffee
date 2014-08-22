define [
  'marionette'
  'templates'
], (Marionette) ->

  class HeaderRefreshButtonView extends Marionette.ItemView
    template: JST['templates/header/header_refresh_button']

    hammerEvents:
      'tap #refresh_menu_button': 'onTapRefreshButton'

    onTapRefreshButton: ->
      Backbone.history.loadUrl()
