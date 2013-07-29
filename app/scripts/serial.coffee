define "serial", ["serial/service"], (S) ->
  class Serial
    constructor: (app) ->
      new S app