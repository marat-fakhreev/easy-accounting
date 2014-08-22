define [
  'marionette'
  'templates'
], (Marionette) ->

  class HeaderTitleView extends Marionette.ItemView
    template: JST['templates/header/header_title']

    className: 'title-container'

    hammerEvents:
      'tap #slide_menu_button': 'onClickMenuButton'

    templateHelpers: ->
      showTitle: => @options.title

    onClickMenuButton: ->
      $('body').toggleClass('active')
