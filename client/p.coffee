define ['parse'], (Parse) ->
  # Parse has the Parse object under the root on nodejs for some reason
  if typeof Parse.Parse == 'undefined'
    Parse
  else
    Parse.Parse
