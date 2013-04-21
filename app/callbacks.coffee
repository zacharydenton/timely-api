module.exports =
  placeCallback: (place) ->
    building = place.address.building or place.address.library

    message: "Welcome to #{building}." if building else null
    place: place

