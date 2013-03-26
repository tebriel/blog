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
        @postCollection = new postview.PostModelCollection
        for post, index in options.posts
            @postCollection.add
                postText: post.text
                postIndex: index
                postName: post.name

        @collView = new postview.PostCollection
            collection:@postCollection

        @postRegion.show(@collView)

    showAllPosts = ->
        blog.postRegion.show(blog.collView)

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

    blog.commands.addHandler 'showSingle', (name) ->
        model = blog.postCollection.where postName:name
        postItemView = new postview.PostView { model:model[0] }
        blog.postRegion.show postItemView

    blog.commands.addHandler 'showAll', ->
        showAllPosts()

    contentFetcher = $.get '/posts.json'
    contentFetcher.done (posts) =>
        options = posts:posts
        blog.start(options)

    window.blog = blog
