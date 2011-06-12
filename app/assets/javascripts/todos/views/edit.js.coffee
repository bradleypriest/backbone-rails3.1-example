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
          self.model = model
          self.render()
          new App.Views.Notice({ message: msg })
          self.delegateEvents()
          Backbone.history.saveLocation('todos/' + model.id)

        error: (model, response )->
          new App.Views.Error( message: App.Helpers.transformError( response ) )
      }
    )
    false

  render: ->
    $(@el).html( JST.show({ model: this.model }) )
    $('#app').html(@el)
    $('#notice').empty()
})