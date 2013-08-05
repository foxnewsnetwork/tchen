define "main/controller_spec", ["chai"], (C) ->
  expect = C.expect
  
  (app) ->
    describe "main/controller", ->
      it "should sanely contain the stuff I'm looking for", ->
        expect(app).to.be.ok
