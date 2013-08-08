(function() {
  define("serial/service", [], function() {
    var Promise, Service;
    Promise = (function() {
      function Promise() {}

      Promise.defer = function() {
        return new Promise();
      };

      Promise.prototype.then = function(action) {
        this._register_action(action);
        return this;
      };

      Promise.prototype.resolve = function(initial) {
        var action;
        action = this._retreive_action();
        if (action != null) {
          return action(this, initial);
        }
        return initial;
      };

      Promise.prototype._retreive_action = function() {
        this._actions || (this._actions = []);
        return this._actions.pop();
      };

      Promise.prototype._register_action = function(action) {
        this._actions || (this._actions = []);
        return this._actions.unshift(action);
      };

      return Promise;

    })();
    return Service = (function() {
      function Service(app) {
        app.factory("$serial", function() {
          return Promise;
        });
      }

      return Service;

    })();
  });

}).call(this);
