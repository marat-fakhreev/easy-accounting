define ->

  class ImagesHelper
    @render: (imageData) ->
      if imageData.substr(0, 4) is 'http'
        imageData
      else
        "data:image/jpeg;base64,#{imageData}"
