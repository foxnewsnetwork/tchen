(function() {
  var requirements;

  requirements = ["config/routes", "angular", "angular-resource", "angular-cookies", "angular-sanitize"];

  define("config/bootstrap", requirements, function(Router) {
    var Bootstrap;
    return Bootstrap = (function() {
      Bootstrap.doit = function() {
        return new Bootstrap();
      };

      function Bootstrap() {
        this.app = angular.module('tchenApp', ['ngResource']);
        new Router(this.app);
      }

      return Bootstrap;

    })();
  });

}).call(this);
