request = require 'request'
chrono = require 'chrono-node'
FeedParser = require 'feedparser'

getLocation = (article) ->
  locationToOsmId =
    'collis': 416661144
    'rocky': 366494666
    'rockefeller': 366494666
    'foco': 2131787360
    'berry': 366494941
    'baker': 366494941
    'moore': 416661186
    'hop': 416661186

  location = null
  for word in (word.toLowerCase() for word in article.description.replace(/(<([^>]+)>)/ig, ' ').split(/\W/))
    if locationToOsmId[word]?
      location = locationToOsmId[word]
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
        if date
          events.push
            title: article.title
            description: article.description
            date: date
            url: article.link
            location: getLocation article
      .on 'end', ->
        fn events
