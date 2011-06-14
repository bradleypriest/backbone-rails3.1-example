App.Views.Notice = Backbone.View.extend({

  events: {
    'click .close':'slide'
  }

  initialize: ->
    @render()

  render: ->
    $(@el).html( JST.notice({ notice: @options }) )
    $('#notice').html(@el)
    @remove()

  slide: (event) ->
    $(@el).dequeue()
    event.preventDefault()

  remove: ->
    $(@el).delay(5000).slideUp(200)

})
