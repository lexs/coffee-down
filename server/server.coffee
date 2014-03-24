requirejs = require 'requirejs'
requirejs.config
  baseUrl: __dirname + '/public/js'
  nodeRequire: require

fs = require 'fs'
express = require 'express'
Handlebars = require 'handlebars'
React = require 'React'
Parse = requirejs 'p'

routes = requirejs 'routes'

Parse.initialize 'TSv2DbVgg5lKFMfluGhm9Gf1Co6lBKNmMadRvtCM', 'h4F4ndW0aTzH0FU1claFa2N1k4Hcui7xibEcaE2o'

template =
  index: Handlebars.compile (fs.readFileSync 'assets/template/index.html', encoding: 'utf-8')

getArgs = (req) -> req.params[key.name] for key in req.route.keys

app = express()

if process.env.DEBUG
  app.use express.logger()
port = process.env.PORT || 8080

for route, f of routes
  do (route, f) ->
    app.get route, (req, res) ->
      renderComponent = (component) ->
        data = template.index content: (React.renderComponentToString component)
        res.send data

      response = f (getArgs req)...
      if Parse.Promise.is response
        response.then renderComponent, (err) ->
          res.send 500, err
      else
        renderComponent response

app.use '/', (express.static __dirname + '/public')

if process.env.DEBUG
  app.use '/client', (express.static 'client')

app.listen port
