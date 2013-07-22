define "blogpost/controller", ["blogpost/model"], (Model) ->
  class Controller
    constructor: (app) ->
      @index = ($scope, $routeParams, $http) ->
        Model.using($http).find_all $routeParams["blogpost"], (blogposts) ->
          $scope.blogposts = blogposts
      @index.$inject = ['$scope', '$routeParams', '$http']
      app.controller "BlogCtrl#index", @index