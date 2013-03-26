define [
    'jquery'
    'backbone'
    'headerview'
    'sidebarview'
    'postview'
    'router'
], ($, Backbone, headerview, sidebarview, postview, router) ->

    blog = new Backbone.Marionette.Application()
    blog.addRegions
        postRegion: '#posts'
        sidebarRegion: '#sidebar'
        titleRegion: '#title'

    postInitializer = (options) ->
        collection = new postview.PostModelCollection
        window.postCollection = collection
        for post, index in options.posts
            collection.add
                postText: post.text
                postIndex: index

        collView = new postview.PostCollection {collection}

        @postRegion.show(collView)

    sidebarInitializer = (options) ->
        sidebarView = new sidebarview.SidebarView
        @sidebarRegion.show(sidebarView)

    titleInitializer = (options) ->
        @titleRegion.show(new headerview.HeaderView)

    routerInitializer = (options) ->
        new router.BlogRouter
        Backbone.history.start()

    blog.addInitializer postInitializer
    blog.addInitializer sidebarInitializer
    blog.addInitializer titleInitializer
    blog.on 'initialize:after', routerInitializer

    contentFetcher = $.get '/posts.json'
    contentFetcher.done (posts) =>
        options = posts:posts
        blog.start(options)

    window.blog = blog
