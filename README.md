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
    "title": "RWIT Writing Workshop: Tuesday April 16, 6-7pm",
    "description": "RWIT presents...<br><br>\"Writing with Style and Clarity\" (and Boloco for dinner!)<br>Tuesday, April 16, 6-7pm<br>Berry 183 (the RWIT room, behind KAF)<br><br>Learn how to clarify your writing using some simple techniques in concision--an important skill for every writer!<br><br>Hosted by Katie Williamson '15 and Maura Riley '14<br><br>>> RSVP here<http://www.surveymonkey.com/s/X73GS8Y> to reserve a spot!<br><br>Want more? We've got one more workshop on \"How to Read a Prompt\" on April 23!",
    "date": {
      "start": {
        "year": 2013,
        "month": 3,
        "day": 16
      },
      "startDate": "2013-04-16T16:00:00.000Z",
      "referenceDate": "2013-04-15T02:00:43.000Z",
      "index": 23,
      "text": "Tuesday April 16",      "concordance": "RWIT Writing Workshop: Tuesday April 16, 6-7pm"
    },
    "url": "http://listserv.dartmouth.edu/scripts/wa.exe?A2=CAMPUS-EVENTS;45e1a257.1304c",
    "location": {
      "lat": 43.70581,
      "lon": -72.288839
    }
  },
  [...],
  {
    "title": "Reduce greenhouse emissions equal to 1,160 miles?!?",
    "description": "Looking for an easy way to cut down your green house gas emissions?<br><br>If every household ate plant-based meals one day per week, it could cut down green house gas emissions equivalent to driving 1,160 miles less per year!<br><br>Now image that number multiplied by 1,000: that's how much emissions could be reduced by if Dartmouth undergrads switched to plant based diets every Monday. [...]",
    "date": {
      "start": {
        "year": 2013,
        "month": 3,
        "day": 15
      },
      "startDate": "2013-04-15T16:00:00.000Z",      "referenceDate": "2013-04-15T01:37:43.000Z",
      "index": 383,
      "text": "Monday",
      "concordance": "...to plant based diets every Monday. [...]"
    },
    "url": "http://listserv.dartmouth.edu/scripts/wa.exe?A2=CAMPUS-EVENTS;fec906be.1304c",
    "location": null
  }
]
```

Get current lunch menus:

```bash
$ curl http://timely-api.herokuapp.com/menus
{
  "foco": {
    "Bakery/Dessert": [
      "Cupcake Yellow Van Ice [d,e,sb,w]",
      "Cranberry White Chunk Cookie (L/O) [d,e,sb,w]"
    ],
    "Entrées": [
      "Cod Herb Crusted (K) [f,sb,w]",
      "Chicken Enchilada Casserole [d,w]",
      "Batter Fried Fish",
      "Thai Curry Samosa (L/O) [e,sb,w]",
      "Marinara Sauce (V,GF) [sb]",
      "Pho Bo  Vietnamese Beef Noodle Soup [f,n,sb]",
      "*Pho Ga [d,n,sb]",
      "Vegetarian Pho(V,GF) [n,sb]",
      "Broccoli Chicken Alfredo Pizza [d,sb,w]",
      "Mushroom Pizza (L/O) [d,sb,w]",
      "Roasted Vegetable Strmboli (L/O) [d,sb,w]"
    ],
    "Salad/Soup/Sandwich": [
      "Corn and Black Bean Salsa (V)",
      "Southwestern Turkey Salad [sb, e]",
      "Pulled BBQ Pork &Onion Panini [d,pk,w]",
      "Peanut Butter Surprise [d,n,p,sb,w]",
      "Grilled Green Pepper (V, GF)",
      "Homemade Peach Yogurt (L/O, GF) [d]",
      "Deviled Ham Salad [pk,e,sb]",
      "Turkey Gumbo [w]",
      "Aztec Bean Chili w/ Grains(V, GF)",
      "N.E. Clam Chowder  [d,f,sf,w]",
      "Minestrone (L/O) [w]"
    ],
    "Side Dishes": [
      "Apple Kugel (L/O,K) [e,w]",
      "Whole Green Beans (V, GF, K)",
      "Mexican Rice (V, GF)",
      "Punjabi Cabbage (L/O, GF) [d]",
      "Garlic Soba Noodles (L/O) [d, e, sb, w]",
      "Grilled Green Pepper (V)",
      "Multigrain Penne Pasta (V) [w]",
      "Quinoa (V, GF)",
      "Black Bean and Almond Salad (L/O, GF) [d,n]",
      "Mini Bread Boule (V) [sb, w]"
    ]
  }
}
```

  [express]: http://expressjs.com/
  [CoffeeScript]: http://coffeescript.org/
  [node.js]: http://nodejs.org/
