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
            "/": "showAll"

    
    initializer = (options) ->
        router = new BlogRouter { controller: new BlogController }
        unless Backbone.history.start()
            router.navigate "home",
                replace: true
                trigger: false

    {
        BlogController
        BlogRouter
        initializer
    }
