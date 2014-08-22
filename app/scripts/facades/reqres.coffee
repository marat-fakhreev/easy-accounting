define [
  'marionette'
], (Marionette) ->

  class ReqRes
    instance = undefined

    constructor: ->
      unless instance?
        instance = new Backbone.Wreqr.RequestResponse()

      return instance

  new ReqRes
