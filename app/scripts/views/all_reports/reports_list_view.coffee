define [
  'marionette'
  'templates'
], (Marionette) ->

  class ReportsListView extends Marionette.CompositeView
    className: 'reports-box'

    template: JST['templates/all_reports/reports_list']
