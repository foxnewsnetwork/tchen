require.config
  paths:
    "faker": "components/Faker/Faker",
    "chai": "components/chai/chai",
    "angular": "components/angular/angular",
    "angular-scenario": "components/angular-scenario/angular-scenario",
    "angular-resource": "components/angular-resource/angular-resource",
    "angular-cookies": "components/angular-cookies/angular-cookies",
    "angular-sanitize": "components/angular-sanitize/angular-sanitize",
    "config/routes": "scripts/config/routes",
    "config/bootstrap": "scripts/config/bootstrap",
    "main": "scripts/main",
    "main_spec": "test/main_spec",
    "main/controller": "scripts/main/controller",
    "main/controller_spec": "test/main/controller_spec",
    "navigation": "scripts/navigation",
    "navigation/directive": "scripts/navigation/directive",
    "navigation/controller": "scripts/navigation/controller",
    "navigation/model": "scripts/navigation/model",
    "navigation/filter": "scripts/navigation/filter",
    "blogpost": "scripts/blogpost",
    "blogpost/controller": "scripts/blogpost/controller",
    "blogpost/directive": "scripts/blogpost/directive",
    "blogpost/model": "scripts/blogpost/model",
    "blogpost/filter": "scripts/blogpost/filter",
    "serial": "scripts/serial",
    "serial/service": "scripts/serial/service"
  shim:
    "angular-resource": 
      deps: ["angular"]
    "angular-cookies": 
      deps: ["angular"]
    "angular-sanitize": 
      deps: ["angular"]
    "angular-scenario":
      deps: ["angular"]

require ['config/bootstrap', 'main_spec'], (Bootstrap, MainSpec) ->
  MainSpec.public_static_void Bootstrap.doit().app
  window.mocha.run()
