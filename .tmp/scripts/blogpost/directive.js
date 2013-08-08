(function() {
  define("blogpost/directive", [], function() {
    var Directive;
    return Directive = (function() {
      function Directive(app) {
        this.blogpost = function() {
          return {
            restrict: "E",
            templateUrl: "views/blogpost/_show.html"
          };
        };
        app.directive("blogpost", this.blogpost);
        this.blogposts = function() {
          return {
            restrict: "E",
            templateUrl: "views/blogpost/_index.html"
          };
        };
        app.directive("blogposts", this.blogposts);
      }

      return Directive;

    })();
  });

}).call(this);
