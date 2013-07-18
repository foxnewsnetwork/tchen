define "blogpost/directive", [], ->
  class Directive
    constructor: (app) ->
      @blogpost = ->
        restrict: "E",
        templateUrl: "views/blogpost/_show.html"
      app.directive "blogpost", @blogpost

      @blogposts = ->
        restrict: "E",
        templateUrl: "views/blogpost/_index.html"
      app.directive "blogposts", @blogposts