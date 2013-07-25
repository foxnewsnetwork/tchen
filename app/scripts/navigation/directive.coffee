define "navigation/directive", [], ->
  class Directive
    constructor: (app) ->
      @verticalnav = ->
        restrict: "E",
        templateUrl: "views/navigation/_verticalnav.html"
      app.directive "verticalnav", @verticalnav

      @verticalentry = ->
        restrict: "E",
        templateUrl: "views/navigation/_verticalentry.html"
      app.directive "verticalentry", @verticalentry