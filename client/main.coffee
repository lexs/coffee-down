require.config
  shim:
    underscore:
      exports: '_'
    parse:
      exports: 'Parse'
  paths:
    underscore: '//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.6.0/underscore-min',
    jquery: '//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min',
    backbone: '//cdnjs.cloudflare.com/ajax/libs/backbone.js/1.1.2/backbone-min',
    react: '//cdnjs.cloudflare.com/ajax/libs/react/0.9.0/react.min',
    marked: '//cdnjs.cloudflare.com/ajax/libs/marked/0.3.1/marked.min',
    parse: '//www.parsecdn.com/js/parse-1.2.18.min'
    moment: '//cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min'

require ['backbone', 'parse', 'router', 'routes', 'app'], (Backbone, Parse, Router, routes, App) ->
  Parse.initialize 'TSv2DbVgg5lKFMfluGhm9Gf1Co6lBKNmMadRvtCM', 'h4F4ndW0aTzH0FU1claFa2N1k4Hcui7xibEcaE2o'
  window.App = App
  App.init (new Router routes)
  Backbone.history.start {pushState: true}

