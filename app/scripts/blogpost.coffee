requirements = [
  "blogpost/controller",
  "blogpost/directive",
  "blogpost/filter",
  "blogpost/model"
]

define "blogpost", requirements, (Ctrl, Dirc, Filter) ->
  class Blogpost
    constructor: (app) ->
      new Ctrl app
      new Dirc app
      new Filter app
