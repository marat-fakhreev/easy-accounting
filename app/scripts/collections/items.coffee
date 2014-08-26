define [
  'collections/app'
  'models/item'
], (AppCollection, Item) ->

  class ItemsCollection extends AppCollection
    url: 'items'

    model: Item

    comparator: (model) ->
      model.get('name')

    getItems: ->
      items = {}

      _.each @models, (model, index) ->
        type = model.get('type')
        name = model.get('name')

        switch type
          when 'boolean' then items[name] = false
          when 'integer' then items[name] = 0
          when 'string' then items[name] = ''

      items
