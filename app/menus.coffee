request = require 'request'

getFocoMenu = (fn) ->
  today = new Date()
  opts =
    service: ""
    method: "get_recipes_for_menumealdate"
    id: 36
    params: [
      {"sid": "DDS.03cb6fca95f4cbea2245365827038394"},
      JSON.stringify
        menu_id: 27,
        meal_id: 3,
        remoteProcedure: "get_recipes_for_menumealdate",
        day: today.getDay(),
        month: today.getMonth(),
        year: today.getFullYear(),
        use_menu_query: true,
        order_by: "pubgroup-alpha",
        cache: true
    ]
  params =
    uri: "http://nutrition.dartmouth.edu:8088/cwp"
    json: true
    body: JSON.stringify(opts)
  request.post params, (err, response, json) ->
    # return object with keys = menu category
    # vals = recipes within category
    result = {}
    for cat in json.result.cat_list
      result[cat[0]] = []
    for recipe in json.result.recipeitems_list
      result[recipe[1][0]].push recipe[0]
    fn result

module.exports =
  getMenus: (fn) ->
    getFocoMenu (foco) ->
      fn foco: foco
