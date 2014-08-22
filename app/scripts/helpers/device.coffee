define [
  'facades/event_aggregator'
], (Vent) ->

  class DeviceHelper
    @hideKeyboard: ->
      document.activeElement.blur()

    @getVersion: ->
      cordova.getAppVersion (version) ->
        Vent.trigger('app:version:get', version)
