(function() {
  define("main/controller_spec", ["chai"], function(C) {
    var expect;
    expect = C.expect;
    return function(app) {
      return describe("main/controller", function() {
        return it("should sanely contain the stuff I'm looking for", function() {
          return expect(app).to.be.ok;
        });
      });
    };
  });

}).call(this);
