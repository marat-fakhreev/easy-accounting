define [
  'marionette'
  'facades/event_aggregator'
  'facades/spinner'
  'backbone.routefilter'
], (Marionette, Vent, Spinner) ->

  class AppRouter extends Marionette.AppRouter
    appRoutes:
      '': 'root'
      'all_reports': 'root'
      'create_report': 'createReport'
      'create_template': 'createTemplate'

    before:
      '(*path)': 'onBeforeRoute'

    initialize: ->
      @listenTo Vent, 'session:create session:destroy', @onRedirectToRoot

    onBeforeRoute: ->
      Spinner.show()

    onRoute: (route) ->
      Vent.trigger('navigation:hide')

    onRedirectToRoot: ->
      @navigate('', trigger: false)
