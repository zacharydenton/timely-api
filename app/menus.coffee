time = require('time')(Date)
cache = require 'memory-cache'
request = require 'request'
cheerio = require 'cheerio'

getDDSMenu = (id, sid, fn) ->
  today = new Date().setTimezone("America/New_York")
  hour = today.getHours()
  if 3 < hour < 11
    meal = 1
  else if hour < 16
    meal = 3
  else
    meal = 5
  opts =
    service: ""
    method: "get_recipes_for_menumealdate"
    id: id
    params: [
      {"sid": sid},
      JSON.stringify
        menu_id: 27,
        meal_id: meal,
        remoteProcedure: "get_recipes_for_menumealdate",
        day: today.getDate(),
        month: today.getMonth() + 1,
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
      result[recipe[1][0]].push recipe[0].split(/[\(\[]/, 1)[0].replace(/\s+$/, '')
    fn result

getFocoMenu = (fn) ->
  getDDSMenu 36, "DDS.03cb6fca95f4cbea2245365827038394", fn

getHopMenu = (fn) ->
  getDDSMenu 42, "CYC.10fb74edf6476f66c3a71b8693c37103", fn

getKafMenu = (fn) ->
  request.get 'http://www.kingarthurflour.com/visit/cafe-menu.html', (err, response, body) ->
    result = {}
    $ = cheerio.load body
    $('.cafe-price').remove()
    result['Sandwiches'] = []
    $('#sandwiches').next().next().next().find('dt').each (i, e) ->
      result['Sandwiches'].push $(e).text().toLowerCase().replace(/\s+$/, '')
    result['Salads'] = []
    $('#salads').next().next().next().find('dt').each (i, e) ->
      result['Salads'].push $(e).text().toLowerCase().replace(/\s+$/, '')
    result['Drinks'] = []
    $('.cafe-drinks td b').each (i, e) ->
      result['Drinks'].push $(e).text().toLowerCase().replace(/\s+$/, '')
    fn result

getBolocoMenu = (fn) ->
  request.get 'http://boloco.com/food/nutrition-calculator/', (err, response, body) ->
    result = {}
    $ = cheerio.load body
    result['Burritos'] = []
    $('select[name=burritotype] option').each (i, e) ->
      if $(e).attr('value') != '---'
        result['Burritos'].push $(e).text()
    result['Smoothies and Shakes'] = []
    $('select[name=smoothietype] option').each (i, e) ->
      if $(e).attr('value') != '---'
        result['Smoothies and Shakes'].push $(e).text()
    result['Breakfast'] = []
    $('select[name=othertype] option').each (i, e) ->
      if $(e).attr('value') != '---'
        result['Breakfast'].push $(e).text()
    fn result

module.exports =
  getMenus: (fn) ->
    result = cache.get 'menus'
    if result?
      fn result
      return
    result = {}
    getFocoMenu (foco) ->
      result['foco'] = foco
      getHopMenu (hop) ->
        result['hop'] = hop
        getKafMenu (kaf) ->
          result['kaf'] = kaf
          getBolocoMenu (boloco) ->
            result['boloco'] = boloco
            cache.put 'menus', result, 1000 * 60 * 120
            fn result

