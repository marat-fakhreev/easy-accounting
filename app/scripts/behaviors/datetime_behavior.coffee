define [
  'marionette'
  'facades/reqres'
  'helpers/dates'
], (Marionette, ReqRes, DatesHelper) ->

  class DatetimeBehavior extends Marionette.Behavior
    ui:
      input: 'input'
      datetimeField: '.datetime-box'
      dateField: '.date-box'
      timeField: '.time-box'
      clearField: '.clear-field'

    events:
      'click @ui.datetimeField': 'onTapDatetimePicker'
      'click @ui.clearField': 'onClearField'

    initialize: ->
      ReqRes.setHandler @options.request.name, @onSetDatetime

    onTapDatetimePicker: (event) ->
      self = $(event.currentTarget)
      mode = self.data('name')
      currentDate = new Date()

      options =
        date: currentDate
        mode: mode
        x: self.offset().left + 300 / 2
        y: self.offset().top + self.height() - 5

      @_dateConverter(self, currentDate, mode)

      datePicker.show options, (date) =>
        @_dateConverter(self, date, mode)

    onClearField: (event) ->
      $(event.currentTarget).closest('li').find('.datetime-box').html('')

    onSetDatetime: =>
      date = @ui.dateField.text()
      time = @ui.timeField.text()

      time = '23:59' if time is '' and @options.type is 'to'
      DatesHelper.convertToJSONDate(date, time)

    _dateConverter: (datepicker, date, mode) ->
      if mode is 'date'
        datepicker.html(DatesHelper.convertToFormattedDate(date))
      else if mode is 'time'
        datepicker.html(DatesHelper.convertToFormattedTime(date))
