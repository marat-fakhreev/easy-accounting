define [
  'moment-timezone'
], (Moment) ->

  class DatesHelper
    @convertToJSONDate: (date, time) ->
      return null if date is ''
      time = '00:00' if time is ''

      currentTime = Moment("#{date} #{time}").format('YYYY-MM-DDTHH:mm:ssZ')

    @convertToFormattedTime: (date) ->
      Moment(date).format('HH:mm')

    @convertToFormattedDate: (date) ->
      Moment(date).format('DD/MM/YYYY')
