define ['backbone', 'react'], (Backbone, React) ->
  Backbone.Router.extend
    initialize: (routes) ->
      for route, f of routes
        do (route, f) =>
          # Backbone doesn't consider '/' as root
          route = route[1..] if route[0] == '/'

          @route route, null, (args...) ->
            response = f args...
            if Parse.Promise.is response
              response.then @renderComponent
            else
              @renderComponent response

    renderComponent: (component) ->
      React.renderComponent component, document.body
