(function() {
  var requirements;

  requirements = ["serial", "main/controller", "navigation", "blogpost"];

  define('main', requirements, function(Serial, MainCtrl, Nav, Blog) {
    var Main;
    return Main = (function() {
      Main.public_static_void = function(app) {
        return new Main(app);
      };

      function Main(app) {
        new Serial(app);
        new MainCtrl(app);
        new Nav(app);
        new Blog(app);
      }

      return Main;

    })();
  });

}).call(this);
