define [
  'marionette'
  'facades/session'
  'facades/event_aggregator'
  'facades/reqres'
  'facades/spinner'
  'views/layouts/layout'
  'views/layouts/header'
  'views/layouts/navigation'
  'views/layouts/landing'
  'views/login/login_view'
], (
  Marionette
  Session
  Vent
  ReqRes
  Spinner
  Layout
  HeaderLayout
  NavigationLayout
  LandingLayout
  LoginView
) ->

  class AppController extends Marionette.Controller
    initialize: ->
      @layout = new Layout
      @layout.render()
      Spinner.init()

      @_bindEvents()
      @_renderLayout()

    _bindEvents: ->
      @listenTo Vent, 'session:create session:destroy', @_renderLayout

    _renderLayout: ->
      @layout.headerRegion.show(new HeaderLayout)
      @layout.navigationRegion.show(new NavigationLayout) if Session.isLoggedIn()
      @root()

    root: ->
      if Session.isLoggedIn()
        Vent.trigger('title:change', 'Landing')
        @layout.mainRegion.show(new LandingLayout)
      else
        Vent.trigger('title:change', 'Phonegap-base')
        @layout.mainRegion.show(new LoginView)

      Spinner.hide()

    someLink: ->
      Vent.trigger('title:change', 'Other Screen')
      Spinner.hide()
