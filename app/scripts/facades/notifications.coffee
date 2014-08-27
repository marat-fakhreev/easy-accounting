define [
  'settings/settings'
], (Settings) ->

  class Notifications
    @alert: (message, callback) ->
      if Settings.getPlatform() is 'desktop'
        alert(message)
      else
        navigator.notification.alert(message, @onCallback(callback), 'GGR Fleet Manager', 'OK')

    @error: (message, callback) ->
      if Settings.getPlatform() is 'desktop'
        alert(message)
      else
        navigator.notification.alert(message, @onCallback(callback), 'Oops', 'OK')

    @confirm: (message, callback) ->
      if Settings.getPlatform() is 'desktop'
        alert(message)
      else
        navigator.notification.confirm(message, @onCallback(callback), 'GGR Fleet Manager', 'Yes, No')

    @onCallback: (callback, value) ->
      if callback?
        if value?
          callback(value)
        else
          callback
      else
        null
