define [
  'marionette'
  'facades/session'
  'facades/spinner'
  'views/abstract/form_view'
  'facades/notifications'
  'templates'
], (
  Marionette
  Session
  Spinner
  AbstractFormView
  Notifications
) ->

  class LoginView extends AbstractFormView
    template: JST['templates/login/login']

    model: Session.currentUser()

    ui:
      submitButton: '.submit-button'

    events:
      'click @ui.submitButton': 'onFormSubmit'

    bindings:
      'input[name="company"]':
        observe: 'company'
        updateView: false
        setOptions:
          validate: true
      'input[name="manager"]':
        observe: 'manager'
        updateView: false
        setOptions:
          validate: true
      'input[name="password"]':
        observe: 'password'
        updateView: false
        setOptions:
          validate: true

    onFormSubmit: (event) ->
      event.preventDefault()

      if @model.isValid()
        Spinner.show()
        Session.create().then ->
          Spinner.hide()
      else
        Notifications.error('Please fill all the fields')
