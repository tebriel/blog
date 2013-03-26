define [
    'jquery'
    'backbone'

    'backbone.marionette'
], ($, Backbone) ->
    class BlogRouter extends Backbone.Marionette.AppRouter
        appRoutes:
            "home": "showAll"
            "posts/*path": "showPost"
        controller:
            showPost: (postPath) ->
                window.blog.execute 'showSingle', postPath
            showAll: ->
                window.blog.execute 'showAll'

    {
        BlogRouter
    }




