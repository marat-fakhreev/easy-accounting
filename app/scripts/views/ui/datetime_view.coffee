define [
  'marionette'
  'helpers/dates'
  'templates'
], (Marionette) ->

  class DatetimeView extends Marionette.ItemView
    template: JST['templates/ui/datetime']

    className: 'datetime'
