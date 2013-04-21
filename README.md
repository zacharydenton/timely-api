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
$ curl --data "latitude=43.7050706&longitude=-72.2892575" http://localhost:3000/places
{"place_id":"3286407","licence":"Data \u00a9 OpenStreetMap contributors, ODbL 1.0. http:\/\/www.openstreetmap.org\/copyright","osm_type":"node","osm_id":"366494941","lat":"43.7050706","lon":"-72.2892575","display_name":"Baker Memorial Library, N Main St, Hanover, Grafton, New Hampshire, 03755, United States of America","address":{"library":"Baker Memorial Library","road":"N Main St","city":"Hanover","county":"Grafton","state":"New Hampshire","postcode":"03755","country":"United States of America","country_code":"us"}}
```

  [express]: http://expressjs.com/
  [CoffeeScript]: http://coffeescript.org/
  [node.js]: http://nodejs.org/
