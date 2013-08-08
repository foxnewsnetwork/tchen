(function() {
  var requirements;

  requirements = [];

  define("main/controller", requirements, function() {
    var Controller;
    return Controller = (function() {
      function Controller(app) {
        app.controller("MainCtrl#index", function($scope) {
          return $scope.stuff = "stuff";
        });
      }

      return Controller;

    })();
  });

}).call(this);
