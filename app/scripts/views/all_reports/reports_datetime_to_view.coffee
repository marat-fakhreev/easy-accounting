define [
  'marionette'
  'behaviors/datetime_behavior'
  'views/ui/datetime_view'
  'templates'
], (Marionette, DatetimeBehavior, DatetimeView) ->

  class ReportDatetimeToView extends DatetimeView
    behaviors:
      datetime:
        behaviorClass: DatetimeBehavior
        type: 'to'
        request:
          name: 'set:datetime:to'

    serializeData: ->
      dateId: 'date_to'
      timeId: 'time_to'
      formTitle: 'To'
