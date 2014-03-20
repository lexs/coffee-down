define ['underscore', 'backbone'], (_, Backbone) ->
  class Application
    _.extend(@::, Backbone.Events)

    init: (router) ->
      @router = router

    navigate: (path) ->
      @trigger 'app:navigate', path
      @router.navigate path, { trigger: true }

  new Application
