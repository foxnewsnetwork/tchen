requirements = [
  "main/controller",
  "navigation",
  "blogpost"
]
  
define 'main', requirements, (MainCtrl, Nav, Blog)-> 
  class Main
    @public_static_void = (app) -> new Main(app)
    constructor: (app) ->
      new MainCtrl app
      new Nav app
      new Blog app
