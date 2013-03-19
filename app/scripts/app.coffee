define [
    'backbone'
    'headerview'
    'sidebarview'
], (Backbone, headerview, sidebarview) ->

    MyApp = new Backbone.Marionette.Application()
    MyApp.addRegions
        contentRegion: '#content'
        titleRegion: '#title'

    MyApp.start()
    #MyApp.contentRegion.show(collView)
    #sidebar = new sidebarview.SidebarView
    #MyApp.contentRegion.show(sidebar)
    bodyview = new sidebarview.BodyView
    MyApp.contentRegion.show(bodyview)


    headerView = new headerview.HeaderView
    MyApp.titleRegion.show(headerView)
