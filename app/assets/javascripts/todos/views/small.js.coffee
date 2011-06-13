App.Views.Small = Backbone.View.extend({
  tagName:  "li"
  events: {
    "click .remove": "delete"
  }

  initialize: ->
    @model.view = this

  render: ->
    $(@el).html( JST.todosSmall({ model: @model }) )
    this

  delete: ->
    @model.clear()
})