define [
  'marionette'
  'facades/spinner'
  'views/all_reports/reports_child_view'
  'templates'
], (Marionette, Spinner, ReportsChildView) ->

  class ReportsListView extends Marionette.CompositeView
    className: 'reports-box'

    template: JST['templates/all_reports/reports_list']

    childView: ReportsChildView

    childViewContainer: '.topcoat-list__container'

    hammerEvents:
      'swipeup': 'onScrollReports'

    onScrollReports: ->
      Spinner.show()
      @collection.filterObject.page++

      @collection.fetch
        data: @collection.filterObject
        remove: false
        success: ->
          Spinner.hide()
