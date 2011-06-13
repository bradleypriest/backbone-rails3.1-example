App.Helpers = {

  transformError: (error) ->
    json = JSON.parse( error.responseText )
    out = ""
    _.each( json, (value, key) ->
      out += key+" "+value+"<br/>"
    )
    out
}