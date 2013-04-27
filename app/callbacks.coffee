module.exports =
  placeCallback: (place) ->
    building = place.address.building or place.address.library
    message: if building? then "Welcome to #{building}." else null
    place: place

