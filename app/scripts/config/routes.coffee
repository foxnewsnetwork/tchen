define "config/routes", [], ->
  class Routes
    constructor: (app) ->
      app.config ($routeProvider) ->
        $routeProvider
          .when '/:tag',
            templateUrl: 'views/main/index.html'
            controller: 'MainCtrl#index'
          .when '/',
            templateUrl: 'views/main/index.html'
            controller: 'MainCtrl#index'
          redirectTo: "/"