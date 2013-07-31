define "main/controller_spec", ["chai"], (C) ->
  expect = C.expect
  
  describe "sanity", ->
    it "should do something", ->
      expect(true).toBe true
  class ControllerSpec
    constructor: (app) ->
      describe "main/controller", ->
        ctrl = app.controller("main/controller")

        it "should sanely contain the stuff I'm looking for", ->
          expect(ctrl.scope.stuff).toBe "stuff"
