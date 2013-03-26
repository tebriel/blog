define [
    'jquery'
    'backbone'

    'backbone.marionette'
], ($, Backbone) ->
    class BlogController
        showPost: (postPath) ->
            console.log 'showSingle'
            window.blog.execute 'showSingle', postPath
        showAll: ->
            window.blog.execute 'showAll'

    class BlogRouter extends Backbone.Marionette.AppRouter
        appRoutes:
            "home": "showAll"
            "posts/*path": "showPost"

    
    initializer = (options) ->
        new BlogRouter { controller: new BlogController }
        Backbone.history.start()
        console.log "We're done here"

    {
        BlogController
        BlogRouter
        initializer
    }
