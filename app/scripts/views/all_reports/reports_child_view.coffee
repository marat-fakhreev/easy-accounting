define [
  'marionette'
  'helpers/routes'
  'helpers/dates'
  'templates'
], (Marionette, RoutesHelper, DatesHelper) ->

  class ReportsItemView extends Marionette.ItemView
    className: 'topcoat-list__item'

    tagName: 'li'

    template: JST['templates/all_reports/reports_child']

    templateHelpers:
      routes: RoutesHelper
      dates: DatesHelper
