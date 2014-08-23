define [
  'backbone'
  'settings/settings'
  'facades/notifications'
  'backbone-nested-model'
], (Backbone, Settings, Notifications) ->

  class User extends Backbone.NestedModel
    url: "#{Settings.getUrl()}/user_tokens"

    defaults:
      'company': null
      'manager': null
      'password': null

    validation:
      'company':
        required: true
      'manager':
        required: true
      'password':
        required: true

    initialize: ->
      @listenTo @, 'error', @onErrorHandler

    onErrorHandler: (model, error) ->
      if error.status is 401 or error.status is 403
        Notifications.alert(error.responseJSON.error) if error.responseJSON
