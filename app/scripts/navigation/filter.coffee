define "navigation/filter", [], ->
  class Filter
    constructor: (app) ->
      app.filter "navigationChevronClass", ->
        (navigation) ->
          return "icon-chevron-down" if navigation.children.length > 0
          "icon-chevron-right"

      app.filter "navigationActiveClass", ->
        (navigation) ->
          return "active" if navigation.children.length > 0
          "inactive"

      app.filter "navigationChildrenClass", ->
        (navigation) ->
          return "has-children" if navigation.children.length > 0
          "no-children"