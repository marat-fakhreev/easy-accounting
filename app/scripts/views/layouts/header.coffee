define [
  'marionette'
  'facades/event_aggregator'
  'facades/session'
  'views/header/header_title_view'
  'views/header/header_menu_button_view'
  'views/header/header_refresh_button_view'
  'templates'
], (
  Marionette
  Vent
  Session
  HeaderTitleView
  HeaderMenuButtonView
  HeaderRefreshButtonView
) ->

  class HeaderLayout extends Marionette.LayoutView
    template: JST['templates/layouts/header']

    regions:
      menuButtonRegion: '#menu_button_region'
      refreshButtonRegion: '#refresh_button_region'
      titleRegion: '#title_region'

    initialize: ->
      @listenTo Vent, 'ui:show', @onShowBackButton
      @listenTo Vent, 'title:change': @onChangeTitle

    onRender: ->
      if Session.isLoggedIn()
        @menuButtonRegion.show(new HeaderMenuButtonView)
        @refreshButtonRegion.show(new HeaderRefreshButtonView)

    onChangeTitle: (title) ->
      @titleRegion.show(new HeaderTitleView(title: title))
