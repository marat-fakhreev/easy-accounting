define [
  'marionette'
  'facades/reqres'
  'helpers/dates'
], (Marionette, ReqRes, DatesHelper) ->

  class DatetimeBehavior extends Marionette.Behavior
    ui:
      input: 'input'
      dateField: 'input[name=date]'
      timeField: 'input[name=time]'

    events:
      'click .clear-field': 'onClearField'

    initialize: ->
      ReqRes.setHandler @options.request.name, @onSetDatetime

    onClearField: (event) ->
      @ui.input.val('')

    onSetDatetime: =>
      date = @ui.dateField.val()
      time = @ui.timeField.val()

      time = '23:59' if time is '' and @options.type is 'to'
      DatesHelper.convertToJSONDate(date, time)
