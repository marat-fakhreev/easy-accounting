define [
  'marionette'
  'templates'
], (Marionette) ->

  class LandingLayout extends Marionette.LayoutView
    template: JST['templates/layouts/landing']
