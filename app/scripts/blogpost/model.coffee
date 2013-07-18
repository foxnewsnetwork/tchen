define "blogpost/model", ['faker'], (F) ->
  class Model
    @find_all: (category) ->
      [0..10].map -> new Model()
    constructor: ->
      @title = F.Company.companyName()
      @image = "placeholder.png"
      @content = F.Lorem.paragraph()