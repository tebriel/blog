define [
    'jquery'
    'backbone'
    'headerview'
    'sidebarview'
    'postview'
    'router'
], ($, Backbone, headerview, sidebarview, postview, router) ->

    MyApp = new Backbone.Marionette.Application()
    MyApp.addRegions
        postRegion: '#all-posts'
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
        window.collView = collView
        @postRegion.show(collView)

    sidebarInitializer = (options) ->
        sidebarView = new sidebarview.SidebarView
        @sidebarRegion.show(sidebarView)

    titleInitializer = (options) ->
        @titleRegion.show(new headerview.HeaderView)

    routerInitializer = (options) ->
        new router.BlogRouter
        Backbone.history.start()

    MyApp.addInitializer postInitializer
    MyApp.addInitializer sidebarInitializer
    MyApp.addInitializer titleInitializer
    MyApp.on 'initialize:after', routerInitializer

    contentFetcher = $.get '/posts.json'
    contentFetcher.done (posts) =>
        options = posts:posts
        MyApp.start(options)
