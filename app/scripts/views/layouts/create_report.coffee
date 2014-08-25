define [
  'marionette'
  'facades/session'
  'facades/spinner'
  'facades/notifications'
  'models/report'
  'views/create_report/create_report_items_view'
  'templates'
], (
  Marionette
  Session
  Spinner
  Notifications
  Report
  CreateReportItemsView
) ->

  class CreateReportLayout extends Marionette.LayoutView
    template: JST['templates/layouts/create_report']

    regions:
      itemsListRegion: '.items-region'

    ui:
      submitButton: '#submit_button'
      textarea: '.report-text'

    events:
      'click @ui.submitButton': 'onSendReport'

    initialize: ->
      @model = new Report(items: @collection.getItems())

    onRender: ->
      @itemsListRegion.show(new CreateReportItemsView(model: @model))

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
