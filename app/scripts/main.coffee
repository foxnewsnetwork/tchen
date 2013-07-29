requirements = [
  "serial",
  "main/controller",
  "navigation",
  "blogpost"
]
  
define 'main', requirements, (Serial, MainCtrl, Nav, Blog)-> 
  class Main
    @public_static_void = (app) -> new Main(app)
    constructor: (app) ->
      new Serial app
      new MainCtrl app
      new Nav app
      new Blog app
