define [
  'marionette'
  'views/create_template/create_template_child_view'
  'templates'
], (Marionette, CreateTemplateChildView) ->

  class CreateTemplateListView extends Marionette.CollectionView
    tagName: 'ul'

    className: 'topcoat-list__container'

    childView: CreateTemplateChildView
