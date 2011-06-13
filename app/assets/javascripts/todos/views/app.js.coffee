App.Views.AppView = Backbone.View.extend({
  el: 'container'

  events: {
    "submit form": "search"
  }

  search: ->
    controller = new App.Controllers.Todos
    q = $('input[type="search"]').val()
    controller.index(q)
    false
})