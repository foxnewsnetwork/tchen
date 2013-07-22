define "blogpost/filter", [], ->
  class Filter
    constructor: (app) ->
      app.filter "blogPostImageClass" , ->
        (input) ->
          return "has-image" if input.image?
          "no-image"