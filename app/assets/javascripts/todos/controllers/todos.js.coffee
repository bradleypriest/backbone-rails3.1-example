App.Controllers.Todos = Backbone.Controller.extend({
  routes: {
    "todos/:id":                "edit",
    "":                         "index",
    "new":                      "newTodo"
  }

  edit: (id) ->
    doc = new Todo({ id: id })
    doc.fetch({
      success: (model, resp) ->
        new App.Views.Edit({ model: doc })
      error: ->
        new Error({ message: 'Could not find that task.' })
        window.location.hash = '#'
    })
  index: ->
    $.getJSON('/todos', (data) ->
      if data
        todos = _(data).map( (i) -> new Todo(i))
        new App.Views.Index({ todos: todos })
      else
        new Error({ message: "Error loading tasks." })
    )
  newTodo: ->
    new App.Views.Edit({ model: new Todo() })
})