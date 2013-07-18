define "navigation/model", ['faker'], (F) ->
  class Model
    @generate: -> new Model()
    constructor: ->
      @link = F.Name.findName()
      @href = "#/nowhere"