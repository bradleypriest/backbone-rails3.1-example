App.Views.Notice = Backbone.View.extend({

  events: {
    'click .close':'slide'
  }

  initialize: ->
    console.log @options
    @render()

  render: ->
    out = "<span class='"
    out += @options.type || "notice"
    out += "'>"
    out += @options.message
    out += "</span>"
    out += "<a href='#' class='close'>x</a>"
    $(@el).html(out)
    $('#notice').html(@el)
    @remove()

  slide: (event) ->
    $(@el).dequeue()
    event.preventDefault()

  remove: ->
    $(@el).delay(5000).slideUp(200)

})
