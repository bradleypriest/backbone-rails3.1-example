window.App = {
  Views: {}
  Controllers: {}
  init: ->
    new App.Controllers.Todos()
    Backbone.history.start()
}