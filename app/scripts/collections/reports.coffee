define [
  'collections/app'
  'models/report'
], (AppCollection, Report) ->

  class ReportsCollection extends AppCollection
    url: 'reports'

    model: Report

    initialize: ->
      @filterObject =
        page: 1

      super
