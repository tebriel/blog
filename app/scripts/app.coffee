define [
    'jquery'
    'backbone'
    'headerview'
    'contentviews'
], ($, Backbone, headerview, contentviews) ->

    MyApp = new Backbone.Marionette.Application()
    MyApp.addRegions
        contentRegion: '#content'
        titleRegion: '#title'

    MyApp.start()
    #MyApp.contentRegion.show(collView)
    #sidebar = new contentviews.SidebarView
    #MyApp.contentRegion.show(sidebar)
    headerView = new headerview.HeaderView
    MyApp.titleRegion.show(headerView)

    contentFetcher = $.get '/posts.json'
    contentFetcher.done (posts)->
        bodyview = new contentviews.BodyView(posts)
        MyApp.contentRegion.show(bodyview)


