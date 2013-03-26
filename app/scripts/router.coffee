define [
    'jquery'
    'backbone'

    'backbone.marionette'
], ($, Backbone) ->
    class BlogController
        showPost: (postPath) ->
            window.blog.execute 'showSingle', postPath
        showAll: ->
            window.blog.execute 'showAll'

    class BlogRouter extends Backbone.Marionette.AppRouter
        appRoutes:
            "home": "showAll"
            "posts/*path": "showPost"

    
    initializer = (options) ->
        controller = new BlogController
        new BlogRouter {controller}
        Backbone.history.start()

    {
        BlogController
        BlogRouter
        initializer
    }
