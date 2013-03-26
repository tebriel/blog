define [
    'jquery'
    'backbone'
    'headerview'
    'sidebarview'
    'postview'
    'router'
], ($, Backbone, headerview, sidebarview, postview, router) ->

    Blog = new Backbone.Marionette.Application()
    window.Blog = Blog
    Blog.addRegions
        postRegion: '#posts'
        sidebarRegion: '#sidebar'
        titleRegion: '#title'

    Blog.addInitializer postview.initializer
    Blog.addInitializer sidebarview.initializer
    Blog.addInitializer headerview.initializer
    Blog.addInitializer router.initializer

    Blog.start()

