(function() {
  define("serial", ["serial/service"], function(S) {
    var Serial;
    return Serial = (function() {
      function Serial(app) {
        new S(app);
      }

      return Serial;

    })();
  });

}).call(this);
