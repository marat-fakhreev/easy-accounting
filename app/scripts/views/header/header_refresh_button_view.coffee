define [
  'marionette'
  'templates'
], (Marionette) ->

  class HeaderRefreshButtonView extends Marionette.ItemView
    template: JST['templates/header/header_refresh_button']

    ui:
      refreshButton: '#refresh_menu_button'

    events:
      'click @ui.refreshButton': 'onTapRefreshButton'

    onTapRefreshButton: ->
      Backbone.history.loadUrl()
