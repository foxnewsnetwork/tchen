require.config
  paths:
    "faker": "components/Faker/Faker",
    "angular": "components/angular/angular",
    "angular-resource": "components/angular-resource/angular-resource",
    "angular-cookies": "components/angular-cookies/angular-cookies",
    "angular-sanitize": "components/angular-sanitize/angular-sanitize",
    "config/routes": "scripts/config/routes",
    "config/bootstrap": "scripts/config/bootstrap",
    "main": "scripts/main",
    "main/controller": "scripts/main/controller",
    "navigation": "scripts/navigation",
    "navigation/directive": "scripts/navigation/directive",
    "navigation/controller": "scripts/navigation/controller",
    "navigation/model": "scripts/navigation/model",
    "blogpost": "scripts/blogpost",
    "blogpost/controller": "scripts/blogpost/controller",
    "blogpost/directive": "scripts/blogpost/directive",
    "blogpost/model": "scripts/blogpost/model",
    "blogpost/filter": "scripts/blogpost/filter"
  shim:
    "angular-resource": 
      deps: ["angular"]
    "angular-cookies": 
      deps: ["angular"]
    "angular-sanitize": 
      deps: ["angular"]

require ['config/bootstrap', 'main'], (Bootstrap, Main) ->
  Main.public_static_void Bootstrap.doit().app