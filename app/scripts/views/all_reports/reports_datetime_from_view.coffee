define [
  'marionette'
  'behaviors/datetime_behavior'
  'views/ui/datetime_view'
  'templates'
], (Marionette, DatetimeBehavior, DatetimeView) ->

  class ReportDatetimeFromView extends DatetimeView
    behaviors:
      datetime:
        behaviorClass: DatetimeBehavior
        type: 'from'
        request:
          name: 'set:datetime:from'

    serializeData: ->
      dateId: 'date_from'
      timeId: 'time_from'
      formTitle: 'From'
