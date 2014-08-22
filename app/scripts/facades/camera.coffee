define [
  'facades/event_aggregator'
], (Vent) ->

  class Camera
    IMAGE_QUALITY = 70

    constructor: ->
      @camera = navigator.camera

    onChooseSuccess: (imageData) ->
      Vent.trigger('photo:added', imageData)

    onChooseDeny: ->
      null

    capturePhoto: ->
      @camera.getPicture(
        @onChooseSuccess
        @onChooseDeny
        quality: IMAGE_QUALITY
        destinationType: @camera.DestinationType.DATA_URL
        sourceType: @camera.PictureSourceType.CAMERA
        encodingType: @camera.EncodingType.JPEG
        correctOrientation: true
      )

    getPhoto: ->
      @camera.getPicture(
        @onChooseSuccess
        @onChooseDeny
        quality: IMAGE_QUALITY
        destinationType: @camera.DestinationType.DATA_URL
        sourceType: @camera.PictureSourceType.PHOTOLIBRARY
      )
