define [
  'marionette'
  'helpers/report'
  'helpers/dates'
  'templates'
], (Marionette, ReportHelper, DatesHelper) ->

  class ReportView extends Marionette.ItemView
    className: 'report'

    template: JST['templates/all_reports/report']

    templateHelpers:
      report: ReportHelper
      dates: DatesHelper
