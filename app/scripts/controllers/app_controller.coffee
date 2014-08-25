define [
  'marionette'
  'facades/session'
  'facades/event_aggregator'
  'facades/reqres'
  'facades/spinner'
  'collections/reports'
  'collections/items'
  'views/layouts/layout'
  'views/layouts/header'
  'views/layouts/navigation'
  'views/layouts/all_reports'
  'views/layouts/create_report'
  'views/layouts/create_template'
  'views/login/login_view'
  'views/all_reports/report_view'
], (
  Marionette
  Session
  Vent
  ReqRes
  Spinner
  Reports
  Items
  Layout
  HeaderLayout
  NavigationLayout
  AllReportsLayout
  CreateReportLayout
  CreateTemplateLayout
  LoginView
  ReportView
) ->

  class AppController extends Marionette.Controller
    initialize: ->
      @items = new Items
      @reports = new Reports
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

        if @reports.length is 0
          $.when(
            @reports.fetch(data: @reports.filterObject)
            @items.fetch()
          ).then =>
            @layout.mainRegion.show(new AllReportsLayout(collection: @reports))
            Spinner.hide()
        else
          @layout.mainRegion.show(new AllReportsLayout(collection: @reports))
          Spinner.hide()
      else
        Vent.trigger('title:change', 'EasyAccounting')
        @layout.mainRegion.show(new LoginView)
        Spinner.hide()

    report: (id) ->
      Vent.trigger('title:change', 'Report')
      @layout.mainRegion.show(new ReportView(model: @reports.get(id)))
      Spinner.hide()

    createReport: ->
      Vent.trigger('title:change', 'Create Report')
      @layout.mainRegion.show(new CreateReportLayout(collection: @items))
      Spinner.hide()

    createTemplate: ->
      Vent.trigger('title:change', 'Create Template')
      @layout.mainRegion.show(new CreateTemplateLayout(collection: @items))
      Spinner.hide()
