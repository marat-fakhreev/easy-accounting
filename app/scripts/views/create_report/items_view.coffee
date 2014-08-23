define [
  'marionette'
  'facades/event_aggregator'
  'templates'
  ], (Marionette, Vent) ->

  class ItemsView extends Marionette.ItemView
    tagName: 'ul'

    className: 'topcoat-list__container'

    template: JST['templates/create_report/items']

    ui:
      switch: '.topcoat-switch'
      input: 'input:text'

    events:
      'click @ui.switch': 'onSwitch'
      'change @ui.input': 'onChangeInputValue'
      'keyup @ui.input': 'onKeyupInput'

    onSwitch: (event) ->
      self = $(event.currentTarget)
      checkbox = self.find('input:checkbox')

      if self.hasClass('checked')
        @model.set(checkbox.data('item'), false)
      else
        @model.set(checkbox.data('item'), true)

      self.toggleClass('checked')

    onChangeInputValue: (event) ->
      self = $(event.currentTarget)
      type = self.data('type')
      value = self.val()

      if type is 'integer'
        @model.set(self.data('item'), parseInt(value))
      else if type is 'string'
        @model.set(self.data('item'), value)

    onKeyupInput: (event) ->
      self = $(event.currentTarget)
      type = self.data('type')
      value = self.val()

      if type is 'integer'
        self.val(value.slice(0, -1)) unless /^[0-9]+$/.test(value)
