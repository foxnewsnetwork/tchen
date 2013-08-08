(function() {
  define("navigation/controller", ["navigation/model"], function(Nav) {
    var Controller;
    return Controller = (function() {
      function Controller(app) {
        this.index = function($scope, $routeParams, $http, $serial) {
          return Nav.using($http, $serial).get_navs($routeParams['tag'], function(navs) {
            return $scope.navs = navs;
          });
        };
        this.index.$inject = ['$scope', '$routeParams', '$http', '$serial'];
        app.controller("NavCtrl#index", this.index);
      }

      return Controller;

    })();
  });

}).call(this);
