define [
  'marionette'
  'facades/session'
  'facades/event_aggregator'
  'facades/reqres'
  'facades/spinner'
  'views/layouts/layout'
  'views/layouts/header'
  'views/layouts/navigation'
  'views/layouts/all_reports'
  'views/layouts/create_report'
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
  AllReportsLayout
  CreateReport
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
        Vent.trigger('title:change', 'Reports')
        @layout.mainRegion.show(new AllReportsLayout)
      else
        Vent.trigger('title:change', 'EasyAccounting')
        @layout.mainRegion.show(new LoginView)

      Spinner.hide()

    createReport: ->
      Vent.trigger('title:change', 'Create Report')
      @layout.mainRegion.show(new CreateReport)
      Spinner.hide()

    createTemplate: ->
      Vent.trigger('title:change', 'Create Template')
      @layout.mainRegion.empty()
      Spinner.hide()
