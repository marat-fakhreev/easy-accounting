define [
  'moment-timezone'
], (Moment) ->

  class DatesHelper
    NY_TIMEZONE = 'America/New_York'

    @convertToJSONDate: (date, time) ->
      return null if date is ''
      time = '00:00' if time is ''

      currentTime = Moment("#{date} #{time}").format()
      NYTime = Moment.tz(currentTime, NY_TIMEZONE).format('YYYY-MM-DDTHH:mm:ssZ')

    @convertToFormattedTime: (date) ->
      Moment(date).format('h:mm A')

    @convertToFormattedDate: (date) ->
      Moment(date).format('MM/DD/YYYY')
