requirements = [
  "navigation/directive",
  "navigation/controller",
  "navigation/filter",
  "navigation/model"
]

define "navigation", requirements, (Directive, Controller, Filter) ->
  class Navigation
    constructor: (app) ->
      new Directive app
      new Controller app
      new Filter app