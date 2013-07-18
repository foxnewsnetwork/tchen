requirements = [
  "navigation/directive",
  "navigation/controller",
  "navigation/model"
]

define "navigation", requirements, (Directive, Controller) ->
  class Navigation
    constructor: (app) ->
      new Directive app
      new Controller app