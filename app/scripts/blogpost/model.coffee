define "blogpost/model", ['faker'], (F) ->
  class Model
    @using: (service) ->
      Model.service = service
      Model
    @from_object: (protomodel) ->
      m = new Model()
      m.title = protomodel.title
      m.image = protomodel.image
      m.content = protomodel.content
      m.id = protomodel.id
      m.created_at = protomodel.created_at
      m.updated_at = protomodel.updated_at
      m
    @find_all: (category, callback) ->
      Model.service("method": "GET", "url":"/bps").success (protomodels, status, headers, config) ->
        blogposts = protomodels.map Model.from_object
        callback blogposts if callback?
    constructor: ->
      @title = F.Company.companyName()
      @image = "placeholder.png"
      @content = F.Lorem.paragraph()
      @id = 0
      @created_at = "December 7, 1941"
    link: -> "#/blogpost/#{@id}"