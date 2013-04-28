request = require 'request'
chrono = require 'chrono-node'
FeedParser = require 'feedparser'

getLocation = (article) ->
  buildingToLatLng =
    'collis':
      lat: 43.702688
      lon: -72.289865
    'rocky':
      lat: 43.705651
      lon: -72.290063
    'rockefeller':
      lat: 43.705651
      lon: -72.290063
    'foco':
      lat: 43.702944
      lon: -72.2909
    'berry':
      lat: 43.70581
      lon: -72.288839
    'baker':
      lat: 43.705345
      lon: -72.288753
    'moore':
      lat: 43.701773
      lon: -72.287869
    'hop':
      lat: 43.701754
      lon: -72.288363
    'tuck':
      lat: 43.70467
      lon: -72.296184
    'cutter':
      lat: 43.70701
      lon: -72.290035
    'occom':
      lat: 43.707504
      lon: -72.286532
    'brace':
      lat: 43.704321
      lon: -72.283787
    'rollins':
      lat: 43.704461
      lon: -72.287319
    'loew':
      lat: 43.701312
      lon: -72.286965
    'fahey':
      lat: 43.705353
      lon: -72.291439
    'spaulding':
      lat: 43.701506
      lon: -72.288145
    'kaf':
      lat: 43.705149
      lon: -72.288557

  location = null
  for word in (word.toLowerCase() for word in article.description.replace(/(<([^>]+)>)/ig, ' ').split(/\W/))
    if buildingToLatLng[word]?
      location = buildingToLatLng[word]
      break
  location

getDate = (article) ->
  chrono.parse(article.title, new Date(article.date))[0] or
    chrono.parse(article.description, new Date(article.date))[0] or
    null

module.exports =
  getEvents: (fn) ->
    events = []
    request.get("http://listserv.dartmouth.edu/scripts/wa.exe?RSS&L=CAMPUS-EVENTS&v=ATOM1.0")
      .pipe new FeedParser()
      .on 'article', (article) ->
        date = getDate article
        if date? and date.start.date() > new Date()
          events.push
            title: article.title
            description: article.description
            date: date
            url: article.link
            location: getLocation article
      .on 'end', ->
        fn events
