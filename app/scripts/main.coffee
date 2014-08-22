require ['config'], ->
  require ['application'], (App) ->

    document.addEventListener('deviceready', (-> App.start()), false)
