define [
  'backbone'
  'models/app'
], (Backbone, AppModel) ->

  class Item extends AppModel
    urlRoot: 'items'
