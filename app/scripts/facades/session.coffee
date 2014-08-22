define [
  'models/user'
  'facades/storage'
  'facades/event_aggregator'
], (User, Storage, Vent) ->

  class Session
    STORAGE_KEY = 'user_session'
    SESSION_KEY = 'token'

    currentUser = null

    @currentUser: ->
      currentUser or= new User(Storage.get(STORAGE_KEY))

    @create: ->
      deferred = $.Deferred()

      unless @isLoggedIn()
        @currentUser().save null,
          beforeSend: (xhr) ->
            xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest')
          success: =>
            @save()
            Vent.trigger 'session:create'
            deferred.resolve()
          error: ->
            deferred.resolve()

      deferred.promise()

    @destroy: ->
      Storage.remove(STORAGE_KEY)
      @currentUser().clear()
      Vent.trigger 'session:destroy'

    @save: ->
      Storage.set(STORAGE_KEY, @currentUser().toJSON())

    @isLoggedIn: ->
      @currentUser().has(SESSION_KEY)

    @getToken: ->
      @currentUser().get(SESSION_KEY)
