(function() {
  define("navigation/model", ['faker'], function(F) {
    var Model;
    return Model = (function() {
      Model.generate = function() {
        return new Model();
      };

      Model.merge = function(id, children, parents) {
        return parents.map(function(parent) {
          if (parent.id === id) {
            parent.children = children;
          }
          return parent;
        });
      };

      Model.from_json = function(json) {
        var m;
        m = Model.generate();
        m.id = json['id'];
        m.link = json['name'].slice(1, -1);
        m.href = "#/" + m.id;
        m.name = json['name'];
        return m;
      };

      Model.using = function($http, $q) {
        if ($http != null) {
          Model.service = $http;
        }
        if ($q != null) {
          Model.$q = $q;
        }
        return Model;
      };

      Model.get_navs = function(active_tag, callback) {
        return Model.$q.defer().then(function(q) {
          return Model.fetch_parents(function(tags) {
            var parents;
            parents = tags;
            return q.resolve(tags);
          });
        }).then(function(q, parents) {
          if (active_tag != null) {
            return Model.fetch_children(active_tag, function(tags) {
              console.log(tags);
              parents = Model.merge(active_tag, tags, parents);
              return q.resolve(parents);
            });
          } else {
            parents = Model.merge(active_tag, [], parents);
            return q.resolve(parents);
          }
        }).then(function(q, tags) {
          return q.resolve(callback(tags));
        }).resolve();
      };

      Model.fetch_children = function(parent_id, callback) {
        return Model.fetch("/tags?id=" + parent_id, function(protomodels) {
          var tags;
          tags = protomodels.map(Model.from_json);
          if (callback != null) {
            return callback(tags);
          }
        });
      };

      Model.fetch_parents = function(callback) {
        return Model.fetch("/tags", function(protomodels, status, headers, config) {
          var tags;
          tags = protomodels.map(Model.from_json);
          if (callback != null) {
            return callback(tags);
          }
        });
      };

      Model.fetch = function(url, callback) {
        return Model.service({
          "method": "GET",
          "url": url
        }).success(callback);
      };

      function Model() {
        this.link = F.Name.findName();
        this.href = "#/nowhere";
        this.children = [];
      }

      return Model;

    })();
  });

}).call(this);
