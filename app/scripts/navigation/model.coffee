define "navigation/model", ['faker'], (F) ->
  class Model
    @generate: -> new Model()
    @using: ($http) ->
      Model.service = $http
      Model
    @fetch_peerage: (tagname) ->
      [0..10].map (n) -> 
        m = new Model()
        if n == 5
          m.children = [0..6].map -> new Model()
        m
    constructor: ->
      @link = F.Name.findName()
      @href = "#/nowhere"
      @children = []