define [
  'marionette'
  'views/all_reports/reports_controls_layout_view'
  'views/all_reports/reports_list_view'
  'templates'
], (Marionette, ControlsLayoutView, ReportsListView) ->

  class AllReports extends Marionette.LayoutView
    className: 'reports-list'

    template: JST['templates/layouts/all_reports']

    regions:
      controlsRegion: '#controls_region'
      reportsRegion: '#reports_region'

    onRender: ->
      @controlsRegion.show(new ControlsLayoutView(collection: @collection))
      @reportsRegion.show(new ReportsListView(collection: @collection))
