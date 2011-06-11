App.Views.Error = Backbone.View.extend({
  initialize: ->
    @render()

  render: ->
    out = "<span class='error'>"
    out += @options.message
    out += "</span>"
    $(@el).html(out)
    $('#notice').html(@el)
})