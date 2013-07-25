define "navigation/controller", ["navigation/model"], (Nav) ->
  class Controller
    constructor: (app) ->
      @index = ($scope, $routeParams, $http) ->
        $scope.navs = Nav.using($http).fetch_peerage $routeParams["tab"]
      @index.$inject = ['$scope', '$routeParams', '$http']
      app.controller "NavCtrl#index", @index