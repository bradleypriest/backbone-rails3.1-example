App.Controllers.Todos = Backbone.Controller.extend({
  routes: {
    "todos/:id" :  "edit",
    ""          :  "index",
    "new"       :  "newTodo"
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
  index: (query) ->
    q = if query then query else ""
    todos = new App.Collections.Todos({ q: q })
    todos.fetch({
      success: ->
        new App.Views.Index({ collection: todos })
      error: ->
        new Error({ message: "Error loading tasks." })
    })

  newTodo: ->
    new App.Views.Edit({ model: new Todo() })

})