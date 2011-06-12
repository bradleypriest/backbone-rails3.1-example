App.Collections.Todos = Backbone.Collection.extend({
  model: Todo,

  initialize: (options) ->
    @query = options.q

  url: ->
   url = 'todos'
   url += '?q='+@query if @query
   url
}
)