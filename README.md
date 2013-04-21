Introduction
------------

This is the Timely API, written with [express][] and [CoffeeScript][].

Installation
------------

First install [node.js][]. Then run:

```bash
$ npm install
```

This will install all dependencies specified in `package.json`.

Run
---

```bash
$ node server
```

This will launch the server on port 3000. If you need to specify a
different port, set it in an environment variable:

```bash
$ PORT=35000 node server
```

Use
---

Reverse geocode a lat/lng coordinate pair:

```bash
$ curl --data "latitude=43.7050706&longitude=-72.2882575" http://timely-api.herokuapp.com/places
{
  "message": "Welcome to Baker Memorial Library.",
  "place": {
    "place_id": "2455801160",
    "licence": "Data © OpenStreetMap contributors, ODbL 1.0. http://www.openstreetmap.org/copyright",
    "osm_type": "way",
    "osm_id": "211760382",
    "lat": "43.70540145",
    "lon": "-72.2888229079376",
    "display_name": "Baker Memorial Library, N Main St, Hanover, Grafton, New Hampshire, 03755, United States of America",
    "address": {
      "building": "Baker Memorial Library",
      "road": "N Main St",
      "city": "Hanover",
      "county": "Grafton",
      "state": "New Hampshire",
      "postcode": "03755",
      "country": "United States of America",
      "country_code": "us"
    }
  }
}
```

Get current campus events:
```bash
$ curl http://timely-api.herokuapp.com/events
[
  {
    "title": "Africa Highlight Week",
    "description": "Tuck Africa Club invites Dartmouth to AFRICA HIGHLIGHT WEEK<http://cgbg.tuck.dartmouth.edu/mba-enrichment/special-events/africa-highlight-2013>:<br>THE POWER OF ONE BILLION CONSUMERS, APRIL 22-25, 2013; Pre-Event April 17<br><br>[X]<http://cgbg.tuck.dartmouth.edu/mba-enrichment/special-events/africa-highlight-2013>These events will explore the theme of doing business in Africa through two different lenses. First, from the perspective of large, global multinational corporations that are investing in Africa to capitalize on the vast consumer base. Second, from the perspective of African based businesses leveraging their understanding of the market to grow and expand across the continent. [...]",
    "date": {
      "start": {
        "year": 2013,
        "month": 3,
        "day": 22
      },
      "startDate": "2013-04-22T16:00:00.000Z",
      "end": {
        "year": 2013,
        "month": 3,
        "day": 25
      },
      "endDate": "2013-04-25T16:00:00.000Z",
      "referenceDate": "2013-04-21T20:12:16.000Z",
      "index": 184,
      "text": "APRIL 22-25, 2013",
      "concordance": "... OF ONE BILLION CONSUMERS, APRIL 22-25, 2013; Pre-Event April 17<br><br..."
    },
    "url": "http://listserv.dartmouth.edu/scripts/wa.exe?A2=CAMPUS-EVENTS;a2107ec.1304c",
    "location": null
  },
  [...],
  {
    "title": "Try Meatless Earth Day @ Foco tomorrow!",
    "description": "Looking for an easy and rewarding way to celebrate Earth Day tomorrow?<br><br>Try going meatless (or meat reduced)! Dinner at foco will feature info on the environmental benefits of<br>going meatless one day a week, and all of the veg options will be labelled with special placards so you<br>don't even have to try to figure out what is or isn't meat free! [...]",
    "date": {
      "start": {
        "year": 2013,
        "month": 3,
        "day": 22
      },
      "startDate": "2013-04-22T16:00:00.000Z",
      "referenceDate": "2013-04-21T15:25:52.000Z",
      "index": 30,
      "text": "tomorrow",
      "concordance": "Try Meatless Earth Day @ Foco tomorrow!"
    },
    "url": "http://listserv.dartmouth.edu/scripts/wa.exe?A2=CAMPUS-EVENTS;c656a9cf.1304c",
    "location": 2131787360
  }
]
```

`location` is the OSM building ID (if found).

  [express]: http://expressjs.com/
  [CoffeeScript]: http://coffeescript.org/
  [node.js]: http://nodejs.org/
