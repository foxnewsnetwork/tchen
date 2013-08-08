(function() {
  define("blogpost/model", ['faker'], function(F) {
    var Model;
    return Model = (function() {
      Model.using = function(service) {
        Model.service = service;
        return Model;
      };

      Model.from_object = function(protomodel) {
        var m;
        m = new Model();
        m.title = protomodel.title;
        m.image = protomodel.image;
        m.content = protomodel.content;
        m.id = protomodel.id;
        m.created_at = protomodel.created_at;
        m.updated_at = protomodel.updated_at;
        return m;
      };

      Model.find_all = function(category, callback) {
        return Model.service({
          "method": "GET",
          "url": "/bps?tag_id=" + category
        }).success(function(protomodels, status, headers, config) {
          var blogposts;
          blogposts = protomodels.map(Model.from_object);
          if (callback != null) {
            return callback(blogposts);
          }
        });
      };

      function Model() {
        this.title = F.Company.companyName();
        this.image = "placeholder.png";
        this.content = F.Lorem.paragraph();
        this.id = 0;
        this.created_at = "December 7, 1941";
      }

      Model.prototype.link = function() {
        return "#/blogpost/" + this.id;
      };

      return Model;

    })();
  });

}).call(this);
