define [
  'marionette'
  'templates'
], (Marionette) ->

  class CreateTemplateChildView extends Marionette.LayoutView
    tagName: 'li'

    className: 'topcoat-list__item'

    template: JST['templates/create_template/create_template_child']

    region:
      editItemRegion: '.edit-item-region'
