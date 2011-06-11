App.Views.Error = Backbone.View.extend({
  initialize: ->
    @render()

  render: ->
    console.log @options
    out = "<span class='error'>"+@options+"</span>"

    $(@el).html(out)
    $('#notice').html(@el)
    return false
})