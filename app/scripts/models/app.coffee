define [
  'backbone'
  'settings/settings'
  'helpers/connection_state'
  'facades/session'
  'facades/notifications'
  'backbone-nested-model'
], (
  Backbone
  Settings
  Connection
  Session
  Notifications
) ->

  class AppModel extends Backbone.NestedModel
    ERRORS = [
      401
      403
      404
      422
    ]

    initialize: ->
      url = _.result(@, 'url')
      @url = "#{Settings.getUrl()}/#{url}"
      @listenTo @, 'error', @onErrorHandler

    sync: (method, model, options) ->
      connection = Connection.getInstance()

      if connection.isOnline()
        if Session.isLoggedIn()
          options.headers = options.headers or {}
          _.extend(options.headers, {'Authorization': "Token token=#{Session.getToken()}"})
      else
        Notifications.error('Sorry, you cannot perform this operation without an internet connection. Please check your internet connection and try again.')

      super

    onErrorHandler: (model, error) ->
      if ERRORS.some((element) -> element is error.status)
        Notifications.error(_.values(error.responseJSON)[0])
      else
        Notifications.error('Server error')
