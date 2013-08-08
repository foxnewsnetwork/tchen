(function() {
  define("blogpost/filter", [], function() {
    var Filter;
    return Filter = (function() {
      function Filter(app) {
        app.filter("blogPostImageClass", function() {
          return function(input) {
            if (input.image != null) {
              return "has-image";
            }
            return "no-image";
          };
        });
      }

      return Filter;

    })();
  });

}).call(this);
