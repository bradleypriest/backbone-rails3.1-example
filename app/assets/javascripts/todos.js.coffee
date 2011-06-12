window.App = {
  Views: {}
  Controllers: {}
  Collections: {}
  init: ->
    new App.Controllers.Todos()
    Backbone.history.start()
}