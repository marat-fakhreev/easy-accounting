define [
  'marionette'
  'templates'
], (Marionette) ->

  class HeaderTitleView extends Marionette.ItemView
    template: JST['templates/header/header_title']

    className: 'title-container'

    ui:
      menuSlideButton: '#slide_menu_button'

    templateHelpers: ->
      showTitle: => @options.title
