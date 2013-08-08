(function() {
  define("blogpost/controller", ["blogpost/model"], function(Model) {
    var Controller;
    return Controller = (function() {
      function Controller(app) {
        this.index = function($scope, $routeParams, $http) {
          return Model.using($http).find_all($routeParams["tag"], function(blogposts) {
            return $scope.blogposts = blogposts;
          });
        };
        this.index.$inject = ['$scope', '$routeParams', '$http'];
        app.controller("BlogCtrl#index", this.index);
      }

      return Controller;

    })();
  });

}).call(this);
