define [
  'marionette'
], (Marionette) ->

  class EventAggregator
    instance = undefined

    constructor: ->
      unless instance?
        instance = new Backbone.Wreqr.EventAggregator()

      return instance

  new EventAggregator
