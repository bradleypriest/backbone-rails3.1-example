App.Views.Edit = Backbone.View.extend({
  events: {
    "submit form": "save"
  }

  initialize: ->
    _.bindAll(this, 'render')
    @model.bind('change', @render)
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
          new App.Views.Notice( type: 'error', message: App.Helpers.transformError( response ) )
      }
    )
    false

  render: ->
    $(@el).html( JST.todosShow({ model: @model }) )
    $('#app').html(@el)
    this.$('[name=name]').val(@model.get('name'))
    $('#notice').empty()
})