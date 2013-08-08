(function() {
  define("config/routes", [], function() {
    var Routes;
    return Routes = (function() {
      function Routes(app) {
        app.config(function($routeProvider) {
          $routeProvider.when('/:tag', {
            templateUrl: 'views/main/index.html',
            controller: 'MainCtrl#index'
          }).when('/', {
            templateUrl: 'views/main/index.html',
            controller: 'MainCtrl#index'
          });
          return {
            redirectTo: "/"
          };
        });
      }

      return Routes;

    })();
  });

}).call(this);
