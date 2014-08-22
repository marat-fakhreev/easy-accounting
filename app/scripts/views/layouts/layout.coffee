define [
  'marionette'
  'facades/event_aggregator'
  'templates'
], (Marionette, Vent) ->

  class MainLayout extends Marionette.LayoutView
    el: 'body'

    template: JST['templates/layouts/layout']

    regions:
      headerRegion: '#header_region'
      navigationRegion: '#navigation_region'
      mainRegion: '#main_region'

    initialize: ->
      @listenTo Vent, 'navigation:toggle', @onToggleNavigation
      @listenTo Vent, 'navigation:show', @onShowNavigation
      @listenTo Vent, 'navigation:hide', @onHideNavigation

    onShowNavigation: ->
      @$el.addClass('navigation-show')

    onToggleNavigation: ->
      @$el.toggleClass('navigation-show')

    onHideNavigation: ->
      @$el.removeClass('navigation-show')
