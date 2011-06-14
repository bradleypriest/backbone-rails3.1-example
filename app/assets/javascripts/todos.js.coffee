window.App = {
  Views: {}
  Controllers: {}
  Collections: {}
  init: ->
    controller = new App.Controllers.Todos()
    new App.Views.AppView(controller)
    Backbone.history.start()
}