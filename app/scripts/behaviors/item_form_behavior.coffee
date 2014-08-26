define [
  'marionette'
  'facades/notifications'
  'facades/spinner'
  'facades/event_aggregator'
], (
  Marionette
  Notifications
  Spinner
  Vent
) ->

  class ItemFormBehavior extends Marionette.Behavior
    ui:
      input: '.item-name-input'
      circle: '.circle'
      activeCircle: '.circle.active'
      submitButton: '.submit-button'

    events:
      'click @ui.circle': 'onTapCircle'
      'click @ui.submitButton': 'onTapSubmitButton'

    onTapCircle: (event) ->
      self = $(event.currentTarget)

      @ui.circle.removeClass('active')
      self.addClass('active')

    onTapSubmitButton: ->
      name = @ui.input.val()
      type = @ui.activeCircle.data('type')

      if name isnt ''
        Spinner.show()

        @view.model.set('name', name)
        @view.model.set('type', type)
        @view.model.save null,
          success: ->
            Vent.trigger('collection:fetch')
          complete: ->
            Spinner.hide()
      else
        Notifications.error('Please fill all the fields')


