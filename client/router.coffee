define ['backbone', 'react', 'routes'], (Backbone, React, routes) ->
  r = {}

  routes (route, f) ->
    # Backbone doesn't consider '/' as root
    route = route[1..] if route[0] == '/'
    r[route] = (args...) ->
      component = f args...
      React.renderComponent component, document.body

  Backbone.Router.extend routes: r
