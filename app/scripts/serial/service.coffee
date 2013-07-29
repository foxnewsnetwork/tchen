define "serial/service", [], ->
  class Promise
    @defer: ->
      new Promise()
    then: (action) ->
      @_register_action action
      this
    resolve: (initial) ->
      action = @_retreive_action() 
      return action this, initial if action?
      initial
    _retreive_action: ->
      @_actions ||= []
      @_actions.pop()
    _register_action: (action) ->
      @_actions ||= []
      @_actions.unshift action


  class Service
    constructor: (app) ->
      app.factory "$serial", -> Promise