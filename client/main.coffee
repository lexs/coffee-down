require.config
  shim:
    underscore:
      exports: '_'
  paths:
    underscore: '//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.6.0/underscore-min',
    jquery: '//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min',
    backbone: '//cdnjs.cloudflare.com/ajax/libs/backbone.js/1.1.2/backbone-min',
    react: '//cdnjs.cloudflare.com/ajax/libs/react/0.9.0/react.min',
    marked: '//cdnjs.cloudflare.com/ajax/libs/marked/0.3.1/marked.min'

require ['backbone', 'router', 'app'], (Backbone, Router, App) ->
  App.router = new Router()
  Backbone.history.start {pushState: true}
