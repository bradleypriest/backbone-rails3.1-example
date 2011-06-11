App.Views.Edit = Backbone.View.extend({
  events: {
    "submit form": "save"
  }

  initialize: ->
    @render()

  save: ->
    self = this
    msg = if @model.isNew() then 'Successfully created!' else "Saved!"

    @model.save(
      {
        name: this.$('[name=name]').val(),
        description: this.$('[name=description]').val()
      },
      {
        success: (model, resp) ->
          new App.Views.Notice({ message: msg })
          self.model = model
          self.render()
          self.delegateEvents()
          Backbone.history.saveLocation('todos/' + model.id)
      },
      {
        error: ->
          new App.Views.Error()
      }
    )
    false

  render: ->
    out = '<form>'
    out += "<label for='name'>Title</label>"
    out += "<input name='name' type='text' />"

    out += "<label for='description'>Body</label>";
    out += "<textarea name='description'>" + (@model.escape('description') || '') + "</textarea>"
    submitText = if @model.isNew() then 'Create' else 'Save'
    out += "<button>" + submitText + "</button>"
    out += "</form>"

    $(@el).html(out)
    $('#app').html(@el)
    this.$('[name=name]').val(@model.get('name'))
})