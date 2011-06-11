App.Views.Notice = Backbone.View.extend({
  initialize: ->
    @message = @options.message
    @render()

  render: ->
    out = "<span class='notice'>"+@message+"</span>"

    $(@el).html(out)
    $('#notice').html(@el)
})