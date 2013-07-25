define "navigation/model", ['faker'], (F) ->
  class Model
    @generate: -> new Model()
    @from_json: (json) ->
      m = Model.generate()
      m.link = json['name'].slice 1, -1
      m.href = "#/#{m.link}"
      m
    @using: ($http) ->
      Model.service = $http
      Model
    @fetch_peerage: (tagname, callback) ->
      Model.service("method": "GET", "url": "/tags").success (protomodels, status, headers, config) ->
        tags = protomodels.map Model.from_json
        callback tags if callback?
    constructor: ->
      @link = F.Name.findName()
      @href = "#/nowhere"
      @children = []