define [
  'marionette'
  'templates'
], (Marionette) ->

  class CreateReport extends Marionette.LayoutView
    template: JST['templates/layouts/create_report']
