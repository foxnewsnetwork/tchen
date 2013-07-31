requirements = [
  "main",
  "main/controller_spec"
]
define "main_spec", requirements, (Main, CtrlSpec) ->
  class MainSpec
    @public_static_void: (app) -> 
      Main.public_static_void app
      new MainSpec app
    constructor: (app) ->
      new CtrlSpec app