App.Collections.Todos = Backbone.Collection.extend({
  model: Todo,
  url: '/todos'
});