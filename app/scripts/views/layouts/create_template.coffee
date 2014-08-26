define [
  'marionette'
  'facades/event_aggregator'
  'models/item'
  'views/create_template/create_template_new_item_view'
  'views/create_template/create_template_list_view'
  'templates'
], (
  Marionette
  Vent
  Item
  CreateTemplateNewItemView
  CreateTemplateListView
) ->

  class CreateTemplateLayout extends Marionette.LayoutView
    template: JST['templates/layouts/create_template']

    regions:
      itemFormRegion: '.item-form-region'
      itemsListRegion: '.items-region'

    initialize: ->
      @listenTo Vent, 'collection:reset', @onFetchCollection
      @item = new Item

    onRender: ->
      @itemFormRegion.show(new CreateTemplateNewItemView(model: @item, collection: @collection))
      @itemsListRegion.show(new CreateTemplateListView(collection: @collection))

    onFetchCollection: ->
      @collection.fetch()
