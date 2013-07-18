define "blogpost/controller", ["blogpost/model"], (Model) ->
  class Controller
    constructor: (app) ->
      @index = ($scope, $routeParams) ->
        $scope.blogposts = Model.find_all $routeParams["blogpost"]
      @index.$inject = ['$scope', '$routeParams']
      app.controller "BlogCtrl#index", @index