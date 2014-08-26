define [
  'marionette'
  'behaviors/item_form_behavior'
  'templates'
], (Marionette, ItemFormBehavior) ->

  class CreateTemplateNewItemView extends Marionette.LayoutView
    className: 'new-item-box'

    template: JST['templates/create_template/create_template_new_item']

    behaviors:
      form:
        behaviorClass: ItemFormBehavior
