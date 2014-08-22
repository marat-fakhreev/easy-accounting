define [
  'marionette'
  'fastclick'
  'controllers/app_controller'
  'routers/app_router'
  'helpers/connection_state'
  'facades/notifications'
], (
  Marionette
  FastClick
  Controller
  Router
  Connection
  Notifications
) ->

  FastClick.attach(document.body)

  App = new Marionette.Application

  App.navigate = (route, options) ->
    options or= {}
    Backbone.history.navigate(route, options)

  App.on 'start', ->
    connection = Connection.getInstance()

    if connection.isOnline()
      @controller = new Controller
      @router = new Router(controller: @controller)
      Backbone.history.start()

      $(document).on 'tap, click', '*', (event) ->
        self = $(event.currentTarget)
        event.preventDefault()

        $('.popover').each (index, item) ->
          $(item).removeClass('show-popover') unless $(item).hasClass('js-select-popover')

        if self.hasClass('js-link')
          href = self.attr('href')
          App.navigate(href, trigger: true)
    else
      Notifications.alert('No internet connection')

  App
