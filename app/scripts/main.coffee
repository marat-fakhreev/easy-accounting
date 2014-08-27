require ['config'], ->
  require [
    'settings/settings'
    'application'
  ], (Settings, App) ->

    if Settings.getPlatform() is 'desktop'
      App.start()
    else
      document.addEventListener('deviceready', (-> App.start()), false)
