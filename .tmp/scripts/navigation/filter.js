(function() {
  define("navigation/filter", [], function() {
    var Filter;
    return Filter = (function() {
      function Filter(app) {
        app.filter("navigationChevronClass", function() {
          return function(navigation) {
            if (navigation.children.length > 0) {
              return "icon-chevron-down";
            }
            return "icon-chevron-right";
          };
        });
        app.filter("navigationActiveClass", function() {
          return function(navigation) {
            if (navigation.children.length > 0) {
              return "active";
            }
            return "inactive";
          };
        });
        app.filter("navigationChildrenClass", function() {
          return function(navigation) {
            if (navigation.children.length > 0) {
              return "has-children";
            }
            return "no-children";
          };
        });
      }

      return Filter;

    })();
  });

}).call(this);
