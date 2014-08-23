define [
  'marionette'
  'facades/event_aggregator'
  'facades/reqres'
  'facades/spinner'
  'views/all_reports/reports_datetime_from_view'
  'views/all_reports/reports_datetime_to_view'
], (
  Marionette
  Vent
  ReqRes
  Spinner
  DatetimeFromView
  DatetimeToView
) ->

  class ReportsControlsLayout extends Marionette.LayoutView
    className: 'controls-container'

    template: JST['templates/all_reports/reports_controls']

    regions:
      datetimeFromRegion: '#datetime_from_region'
      datetimeToRegion: '#datetime_to_region'

    ui:
      filterButton: '.filter-button'

    events:
      'click @ui.filterButton': 'onFilterReports'

    onRender: ->
      @datetimeFromRegion.show(new DatetimeFromView)
      @datetimeToRegion.show(new DatetimeToView)

    onFilterReports: ->
      Spinner.show()
      dateFrom = ReqRes.request('set:datetime:from')
      dateTo = ReqRes.request('set:datetime:to')

      @collection.filterObject = {}
      @collection.filterObject.date_from = dateFrom if dateFrom?
      @collection.filterObject.date_to = dateTo if dateTo?
      @collection.filterObject.page = 1

      @collection.fetch
        data: @collection.filterObject
        success: =>
          @isLoading = false
          Spinner.hide()
