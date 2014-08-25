define [
  'marionette'
  # 'views/create_template/create_template_add_view'
  'views/create_template/create_template_list_view'
  'templates'
], (
  Marionette
  # CreateTemplateAddView
  CreateTemplateListView
) ->

  class CreateTemplateLayout extends Marionette.LayoutView
    template: JST['templates/layouts/create_template']

    regions:
      # addItemRegion: '.add-item-region'
      itemsListRegion: '.items-region'

    onRender: ->
      # @addItemRegion.show(new CreateTemplateAddView)
      @itemsListRegion.show(new CreateTemplateListView(collection: @collection))
