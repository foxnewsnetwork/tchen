define "navigation/controller", ["navigation/model"], (Nav) ->
  class Controller
    constructor: (app) ->
      @index = ($scope, $routeParams, $http) ->
        Nav.using($http).fetch_peerage $routeParams["tab"], (tags) ->
          $scope.navs = tags
      @index.$inject = ['$scope', '$routeParams', '$http']
      app.controller "NavCtrl#index", @index