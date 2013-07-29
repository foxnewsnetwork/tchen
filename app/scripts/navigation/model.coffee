define "navigation/model", ['faker'], (F) ->
  class Model
    @generate: -> new Model()
    @merge: (name, children, parents) ->
      parents.map (parent) ->
        if parent.name is name
          parent.children = children
    @from_json: (json) ->
      m = Model.generate()
      m.id = json['id']
      m.link = json['name'].slice 1, -1
      m.href = "#/#{m.id}"
      m.name = json['name']
      m
    @using: ($http, $q) ->
      Model.service = $http if $http?
      Model.$q = $q if $q?
      Model
    @get_navs: (active_tag, callback) ->
      Model.$q.defer()
      .then (q) -> 
        console.log "registering parents"
        Model.fetch_parents (tags) ->
          console.log "parents: "
          console.log tags
          parents = tags
          q.resolve tags
      .then (q, parents) ->
        console.log "registering children"
        if active_tag?
          Model.fetch_children active_tag, (tags) ->
            console.log "children: "
            console.log tags
            parents = Model.merge(active_tag, tags, parents)
            q.resolve parents
        else
          parents = Model.merge(active_tag, [], parents)
          q.resolve parents
      .then (q, tags) ->
        console.log "callback: "
        console.log tags
        q.resolve callback tags
      .resolve()
    @fetch_children: (parent_id, callback) ->
      Model.fetch "/tags?id=#{parent_id}", (protomodels) ->
        tags = protomodels.map Model.from_json
        callback tags if callback?
    @fetch_parents: (callback) ->
      Model.fetch "/tags", (protomodels, status, headers, config) ->
        tags = protomodels.map Model.from_json
        callback tags if callback?
    @fetch: (url, callback) ->
      Model.service("method": "GET", "url": url).success callback
    constructor: ->
      @link = F.Name.findName()
      @href = "#/nowhere"
      @children = []