define [
  'backbone'
  'settings/settings'
  'helpers/connection_state'
  'facades/session'
  'facades/notifications'
], (
  Backbone
  Settings
  Connection
  Session
  Notifications
) ->

  class AppCollection extends Backbone.Collection
    initialize: ->
      url = _.result(@, 'url')
      @url = "#{Settings.getUrl()}/#{url}"

    sync: (method, model, options) ->
      connection = Connection.getInstance()

      if connection.isOnline()
        if Session.isLoggedIn()
          options.headers = options.headers or {}
          _.extend(options.headers, {'Authorization': "Token token=#{Session.getToken()}"})
      else
        Notifications.error(
          'Sorry, you cannot perform this operation without an internet connection. Please check your internet connection and try again.'
        )

      super
