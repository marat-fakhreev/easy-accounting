define [
  'backbone'
  'models/app'
], (Backbone, AppModel) ->

  class Report extends AppModel
    urlRoot: 'reports'
