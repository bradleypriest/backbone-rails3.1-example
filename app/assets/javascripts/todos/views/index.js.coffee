App.Views.Index = Backbone.View.extend({
  initialize: ->
    @todos = @options.todos
    @render()

  render: ->
    if @todos.length > 0
      out = "<h3><a href='#new'>Create New</a></h3><ul>"
      _(@todos).each( (item) ->
        out += "<li><a href='#todos/" + item.id + "'>" + item.escape('name') + "</a></li>" if item.escape('name')
      )
      out += "</ul>"
    else
      out = "<h3>No tasks! <a href='#new'>Create one</a></h3>"

    $(@el).html(out)
    $('#app').html(@el)
    $('#notice').empty()
})