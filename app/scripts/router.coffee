define [
    'jquery'
    'backbone'

    'backbone.marionette'
], ($, Backbone) ->
    class BlogController
        showPost: (postPath) ->
            window.Blog.execute 'showSingle', postPath
        showAll: ->
            window.Blog.execute 'showAll'

    class BlogRouter extends Backbone.Marionette.AppRouter
        appRoutes:
            "home": "showAll"
            "posts/*path": "showPost"
            "/": "showAll"

    
    startRouterHandler = (options) ->
        router = new BlogRouter { controller: new BlogController }
        unless Backbone.history.start()
            router.navigate "home",
                replace: true
                trigger: false

    initializer = ->
        @commands.setHandler 'startRouter', ->
            startRouterHandler()


    {
        BlogController
        BlogRouter
        initializer
    }
