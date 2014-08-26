define [
  'marionette'
  'facades/event_aggregator'
  'behaviors/item_form_behavior'
  'views/create_template/create_template_edit_item_view'
  'templates'
], (
  Marionette
  Vent
  ItemFormBehavior
  CreateTemplateEditItemView
) ->

  class CreateTemplateChildView extends Marionette.LayoutView
    tagName: 'li'

    className: 'topcoat-list__item'

    template: JST['templates/create_template/create_template_child']

    regions:
      itemFormRegion: '.item-form-region'

    ui:
      editButton: '.edit-button'
      deleteButton: '.delete-button'
      createItem: '.create-item'

    events:
      'click @ui.editButton': 'onTapEditButton'
      'click @ui.deleteButton': 'onTapDeleteButton'

    behaviors:
      form:
        behaviorClass: ItemFormBehavior

    initialize: ->
      @listenTo Vent, 'form:hide', @onHideEditForm

    onRender: ->
      @itemFormRegion.show(new CreateTemplateEditItemView(model: @model))

    onTapEditButton: ->
      if @ui.editButton.hasClass('active')
        @ui.createItem.slideUp(200)
      else
        Vent.trigger('form:hide')
        @ui.createItem.slideDown(200)

      @ui.editButton.toggleClass('active')

    onTapDeleteButton: ->
      @model.destroy()

    onHideEditForm: ->
      @ui.editButton.removeClass('active')
      @ui.createItem.slideUp(200)
