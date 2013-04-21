express = require 'express'
http = require 'http'
app = express()

PORT = process.env.PORT or 3000

app.get '/places', (req, res) ->
  res.send 'Welcome to Baker Library.'

app.listen PORT
console.log "Server running on port #{PORT}."
