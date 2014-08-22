define ->

  class Notifications
    @alert: (message, callback) ->
      navigator.notification.alert(message, @onCallback(callback), 'GGR Fleet Manager', 'OK')

    @error: (message, callback) ->
      navigator.notification.alert(message, @onCallback(callback), 'Oops', 'OK')

    @confirm: (message, callback) ->
      navigator.notification.confirm(message, @onCallback(callback), 'GGR Fleet Manager', 'Yes, No')

    @onCallback: (callback, value) ->
      if callback?
        if value?
          callback(value)
        else
          callback
      else
        null
