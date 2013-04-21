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

  [express]: http://expressjs.com/
  [CoffeeScript]: http://coffeescript.org/
  [node.js]: http://nodejs.org/
