define ->

  class Settings
    # set global envorinment for API
    ENVIRONMENT = 'local'

    local =
      port: 8001
      url: 'http://localhost' #use your local IP address
      api: 'api'
      platform: 'mobile'

    development =
      port: ''
      url: 'https://example-development.com'
      api: 'api'
      platform: 'mobile'

    production =
      port: ''
      url: 'https://example-production.com'
      api: 'api'
      platform: 'mobile'

    desktop =
      port: 8001
      url: 'http://10.0.1.22'
      api: 'api'
      platform: 'desktop'

    @getUrl: ->
      settings = @_setSettings()
      url = "#{settings.url}:#{settings.port}/#{settings.api}"

    @getPlatform: ->
      settings = @_setSettings()
      settings.platform

    @_setSettings: ->
      switch ENVIRONMENT
        when 'local' then local
        when 'development' then development
        when 'production' then production
        when 'desktop' then desktop
