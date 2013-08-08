(function() {
  var requirements;

  requirements = ["main", "main/controller_spec"];

  define("main_spec", requirements, function(Main, CtrlSpec) {
    var MainSpec;
    return MainSpec = (function() {
      MainSpec.public_static_void = function(app) {
        Main.public_static_void(app);
        return new MainSpec(app);
      };

      function MainSpec(app) {
        CtrlSpec(app);
      }

      return MainSpec;

    })();
  });

}).call(this);
