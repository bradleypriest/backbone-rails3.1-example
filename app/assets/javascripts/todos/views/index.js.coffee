App.Views.Index = Backbone.View.extend({

  events: {
    #"submit form": "rerender"
  }

  initialize: ->
    @render()

  render: ->
    # q = @options.q || ""
    $(@el).html(JST.index({ collection: @collection}))
    $('#app').html(@el)
    $('#notice').empty()
    $('input[type="search"]').focus()

  rerender: ->
    controller = new App.Controllers.Todos
    q = $('input[type="search"]').val()
    controller.index(q)
    false

})