module.exports =
  place_callback: (place) ->
    building = place.address.building or place.address.library

    message: "Welcome to #{building}."
    place: place

