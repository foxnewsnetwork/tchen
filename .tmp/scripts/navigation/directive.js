(function() {
  define("navigation/directive", [], function() {
    var Directive;
    return Directive = (function() {
      function Directive(app) {
        this.verticalnav = function() {
          return {
            restrict: "E",
            templateUrl: "views/navigation/_verticalnav.html"
          };
        };
        app.directive("verticalnav", this.verticalnav);
        this.verticalentry = function() {
          return {
            restrict: "E",
            templateUrl: "views/navigation/_verticalentry.html"
          };
        };
        app.directive("verticalentry", this.verticalentry);
      }

      return Directive;

    })();
  });

}).call(this);
