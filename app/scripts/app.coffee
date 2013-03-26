define [
    'jquery'
    'backbone'
    'headerview'
    'sidebarview'
    'postview'
    'router'
], ($, Backbone, headerview, sidebarview, postview, router) ->

    blog = new Backbone.Marionette.Application()
    window.blog = blog
    blog.addRegions
        postRegion: '#posts'
        sidebarRegion: '#sidebar'
        titleRegion: '#title'

    showAllPosts = ->
        blog.postRegion.show(blog.collView)

    blog.addInitializer postview.initializer
    blog.addInitializer sidebarview.initializer
    blog.addInitializer headerview.initializer

    blog.commands.addHandler 'startRouter', ->
        router.initializer()

    blog.commands.addHandler 'showSingle', (name) ->
        model = blog.postCollection.where postName:name
        postItemView = new postview.PostView { model:model[0] }
        blog.postRegion.show postItemView

    blog.commands.addHandler 'showAll', ->
        showAllPosts()

    options = {}
    blog.start(options)

