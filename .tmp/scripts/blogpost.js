(function() {
  var requirements;

  requirements = ["blogpost/controller", "blogpost/directive", "blogpost/filter", "blogpost/model"];

  define("blogpost", requirements, function(Ctrl, Dirc, Filter) {
    var Blogpost;
    return Blogpost = (function() {
      function Blogpost(app) {
        new Ctrl(app);
        new Dirc(app);
        new Filter(app);
      }

      return Blogpost;

    })();
  });

}).call(this);
