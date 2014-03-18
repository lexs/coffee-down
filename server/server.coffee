fs = require 'fs'
requirejs = require 'requirejs'
express = require 'express'
Handlebars = require 'handlebars'
React = require 'React'

requirejs.config
  baseUrl: __dirname + '/public/js'
  nodeRequire: require

routes = requirejs 'routes'

index = Handlebars.compile (fs.readFileSync 'assets/template/index.html', encoding: 'utf-8')

getArgs = (req) -> req.params[key.name] for key in req.route.keys

app = express()

if process.env.DEBUG
  app.use express.logger()
port = process.env.PORT || 8080

routes (route, f) ->
  app.get route, (req, res) ->
    component = f (getArgs req)...
    data = index body: (React.renderComponentToString component)
    res.send data

app.use '/', (express.static __dirname + '/public')

app.listen port
