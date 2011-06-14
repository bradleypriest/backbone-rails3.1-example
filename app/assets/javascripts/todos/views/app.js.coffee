App.Views.AppView = Backbone.View.extend({
  el: 'container'

  events: {
    "keyup .search input": "search"
  }
  initialize: (controller) ->
    @controller = controller

  search: ->
    q = $('input[type="search"]').val()
    this.$('#app').children().first().addClass('loading').empty()
    @controller.index(q)
    false
})