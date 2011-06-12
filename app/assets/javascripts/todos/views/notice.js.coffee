App.Views.Notice = Backbone.View.extend({
  initialize: ->
    @message = @options.message
    @render()

  render: ->
    out = "<span class='success'>"+@message+"</span>"

    $(@el).html(out)
    $('#notice').html(@el)
})