define [
    'underscore'
    'backbone'
    'postview'

    'backbone.marionette'
], (_, Backbone, postview) ->

    class SidebarItem extends Backbone.Marionette.ItemView
        #className: 'span1'
        tagName: 'li'
        template_html: '<a href="<%= itemLink %>"><%= itemText %></a>'
#<ul class="unstyled">
#<li><a href="mailto:chris@moultrie.org">chris@moultrie.org</a></li>
#<li><a href="http://twitter.com/tebriel">@tebriel</a></li>
#</ul>
        template: (serialized_model) =>
            _.template @template_html, serialized_model

    class SidebarView extends Backbone.Marionette.CollectionView
        tagName: 'ul'
        className: 'unstyled'
        itemView: SidebarItem

    class SidebarModel extends Backbone.Model
        defaults:
            itemLink: ''
            itemText: ''
            itemIndex: null

    class SidebarModelCollection extends Backbone.Collection
        model: SidebarModel
        comparator: (item) ->
            item.get 'itemIndex'


    initializer = (options) ->
        sidebarFetcher = $.get '/sidebar.json'
        sidebarFetcher.done (items) =>
            sidebarColl = new SidebarModelCollection
            sidebarColl.add item for item in items
            sidebarView = new SidebarView collection:sidebarColl
            @sidebarRegion.show(sidebarView)

    {
        SidebarModelCollection
        SidebarView
        initializer
    }
