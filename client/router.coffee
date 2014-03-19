define ['backbone', 'p', 'react', 'routes'], (Backbone, Parse, React, routes) ->
  r = {}

  renderComponent = (component) ->
    React.renderComponent component, document.body

  routes (route, f) ->
    # Backbone doesn't consider '/' as root
    route = route[1..] if route[0] == '/'
    r[route] = (args...) ->
      response = f args...
      if Parse.Promise.is response
        response.then renderComponent
      else
        renderComponent response

  Backbone.Router.extend routes: r
