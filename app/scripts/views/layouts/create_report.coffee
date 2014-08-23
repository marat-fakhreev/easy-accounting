define [
  'marionette'
  'facades/session'
  'facades/spinner'
  'facades/notifications'
  'models/report'
  'views/create_report/items_view'
  'templates'
], (
  Marionette
  Session
  Spinner
  Notifications
  Report
  ItemsView
) ->

  class CreateReportLayout extends Marionette.LayoutView
    template: JST['templates/layouts/create_report']

    regions:
      itemlistRegion: '.items-region'

    ui:
      submitButton: '#submit_button'
      textarea: '.report-text'

    events:
      'click @ui.submitButton': 'onSendReport'

    initialize: ->
      @model = new Report(items: @collection.getItems())

    onRender: ->
      @itemlistRegion.show(new ItemsView(model: @model))

    onSendReport: ->
      Spinner.show()
      user = Session.currentUser()

      @model.set(
        'company': user.get('company')
        'manager': user.get('manager')
        'text': @ui.textarea.val()
      ).save null,
        success: =>
          Notifications.alert('Report has been successfully saved in Reports', @onSuccessCallback)
        error: ->
          Notifications.error('Report has NOT been saved in Reports. Please try again')
        complete: ->
          Spinner.hide()

    onSuccessCallback: ->
      Backbone.history.loadUrl()
