define "navigation/directive", [], ->
  class Directive
    constructor: (app) ->
      @verticalnav = ->
        restrict: "E",
        templateUrl: "views/navigation/_verticalnav.html"
      app.directive "verticalnav", @verticalnav