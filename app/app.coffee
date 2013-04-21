express = require 'express'
request = require 'request'

callbacks = require './callbacks'
events = require './events'

app = express()

app.configure ->
  app.set 'port', process.env.PORT or 3000
  app.use express.bodyParser()

app.configure 'development', ->
  app.use express.logger('dev')
  app.use express.errorHandler()

app.configure 'production', ->
  # http://expressjs.com/guide.html#proxies
  app.enable 'trust proxy'

app.post '/places', (req, res) ->
  params =
    uri: "http://open.mapquestapi.com/nominatim/v1/reverse.php"
    qs:
      lat: req.body.latitude
      lon: req.body.longitude
      format: 'json'
    json: true

  request.get params, (err, response, json) ->
    res.jsonp callbacks.placeCallback(json)

app.get '/events', (req, res) ->
  events.getEvents (data) ->
    res.jsonp data

app.listen app.get('port'), ->
  console.log "Server started on port #{app.get 'port'} in #{app.settings.env} mode."
