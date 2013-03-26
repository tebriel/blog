define [
    'jquery'
    'backbone'

    'backbone.marionette'
], ($, Backbone) ->
    class BlogRouter extends Backbone.Marionette.AppRouter
        appRoutes:
            "posts/*path": "showPost"
        controller:
            showPost: (postPath) ->
                console.log postPath

    {
        BlogRouter
    }




