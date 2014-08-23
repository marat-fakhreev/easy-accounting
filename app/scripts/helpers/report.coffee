define ->

  class ReportHelper
    @toggleChecked: (property) ->
      if property then 'checked' else ''

    @checkForPresence: (property) ->
      if property
        if $.isNumeric(property) then property else 'YES'
      else
        'NO'

    @toFormattedString: (string) ->
      string = string.replace(/_/g, ' ')
      string.charAt(0).toUpperCase() + string.slice(1)
