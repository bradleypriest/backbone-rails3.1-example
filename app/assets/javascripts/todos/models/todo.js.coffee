window.Todo = Backbone.Model.extend({
  url: ->
    base = 'todos'
    id = if @isNew() then "" else @id
    url = base + ( if base.charAt(base.length - 1) == '/' then '' else '/' ) + id
    url

  clear: ->
    @destroy({
      success:  (model, response) ->
        new App.Views.Notice( message: model.get('name')+" destroyed")
      error:    (model, response) ->
        new App.Views.Notice( type: 'error', message: JSON.parse( response.responseText )['error'] )
    })
    @view.remove()
})