define "navigation/controller", ["navigation/model"], (Nav) ->
  class Controller
    constructor: (app) ->
      app.controller "NavCtrl#index", ($scope) ->
        $scope.navs = [0..10].map -> Nav.generate()