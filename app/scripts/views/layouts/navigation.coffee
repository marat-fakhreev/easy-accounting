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

    ui:
      logoutButton: '.logout'
      navButton: '.navigation-button'

    events:
      'click @ui.logoutButton': 'onLogOut'
      'click @ui.navButton': 'onHideNavigation'

    onLogOut: ->
      if Session.isLoggedIn()
        Vent.trigger('navigation:toggle')
        Session.destroy()

    onHideNavigation: ->
      Vent.trigger('navigation:hide')
