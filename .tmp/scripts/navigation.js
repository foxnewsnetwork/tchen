(function() {
  var requirements;

  requirements = ["navigation/directive", "navigation/controller", "navigation/filter", "navigation/model"];

  define("navigation", requirements, function(Directive, Controller, Filter) {
    var Navigation;
    return Navigation = (function() {
      function Navigation(app) {
        new Directive(app);
        new Controller(app);
        new Filter(app);
      }

      return Navigation;

    })();
  });

}).call(this);
