define "navigation/controller", ["navigation/model"], (Nav) ->
  class Controller
    constructor: (app) ->
      @index = ($scope, $routeParams, $http, $serial) ->
        Nav.using($http, $serial).get_navs $routeParams['tag'], (navs) -> 
          $scope.navs = navs
      @index.$inject = ['$scope', '$routeParams', '$http', '$serial']
      app.controller "NavCtrl#index", @index