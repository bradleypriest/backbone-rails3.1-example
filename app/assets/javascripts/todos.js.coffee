window.App = {
  Views: {}
  Controllers: {}
  Collections: {}
  init: ->
    new App.Views.AppView()
    new App.Controllers.Todos()
    Backbone.history.start()
}