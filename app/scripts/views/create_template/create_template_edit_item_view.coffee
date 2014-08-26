define [
  'marionette'
  'behaviors/item_form_behavior'
  'templates'
], (Marionette, ItemFormBehavior) ->

  class CreateTemplateEditItemView extends Marionette.LayoutView
    className: 'new-item-box'

    template: JST['templates/create_template/create_template_edit_item']

    behaviors:
      form:
        behaviorClass: ItemFormBehavior
