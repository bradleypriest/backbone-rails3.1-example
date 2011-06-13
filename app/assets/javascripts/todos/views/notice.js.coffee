App.Views.Notice = Backbone.View.extend({

  initialize: ->
    console.log @options
    @render()

  render: ->
    out = "<span class='"
    out += @options.type || "notice"
    out += "'>"
    out += @options.message
    out += "</span>"
    $(@el).html(out)
    $('#notice').html(@el)

})
