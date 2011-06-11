window.Todo = Backbone.Model.extend({
  url: ->
    base = 'todos'
    id = if @isNew() then "" else @id
    url = base + ( if base.charAt(base.length - 1) == '/' then '' else '/' ) + id
    url
})