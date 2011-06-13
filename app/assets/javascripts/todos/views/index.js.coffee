App.Views.Index = Backbone.View.extend({
  tagName:  "ul"
  initialize: ->
    @render()

  render: ->
    if @collection.length
      $('#app').html('<ul></ul>')
      @addAll(@collection)
    else
      $('#app').html("<h3>None Found.</h3>")
    $('#notice').empty()

  addOne: (todo) ->
    view = new App.Views.Small({model: todo})
    this.$("#app ul").append(view.render().el)

  addAll: (collection) ->
    collection.each(@addOne)
})