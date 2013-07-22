requirements = []

define "main/controller", requirements, ->
  class Controller
    constructor: (app) ->
      app.controller "MainCtrl#index", ($scope) ->
        $scope.stuff = "stuff"
        