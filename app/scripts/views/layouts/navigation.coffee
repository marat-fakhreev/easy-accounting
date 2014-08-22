define [
  'marionette'
  'helpers/routes'
  'facades/session'
  'facades/event_aggregator'
  'templates'
], (
  Marionette
  RoutesHelper
  Session
  Vent
) ->

  class NavigationLayout extends Marionette.LayoutView
    tagName: 'nav'

    className: 'side-navigation'

    model: Session.currentUser()

    template: JST['templates/layouts/navigation']

    templateHelpers:
      routes: RoutesHelper

    hammerEvents:
      'tap .logout': 'onLogOut'

    onLogOut: ->
      if Session.isLoggedIn()
        Vent.trigger('navigation:toggle')
        Session.destroy()
