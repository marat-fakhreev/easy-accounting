define [
  'marionette'
  'backbone'
  'facades/notifications'
  'backbone.stickit'
  'backbone-validation'
], (Marionette, Backbone, Notifications) ->

  class AbstractFormView extends Marionette.ItemView
    initialize: ->
      @bindValidation()

    onRender: ->
      @stickit()

    onDestroy: ->
      @unbindValidation()

    bindValidation: ->
      Backbone.Validation.bind(@, forceUpdate: true)

    unbindValidation: ->
      Backbone.Validation.unbind(@)
