define [
    'underscore'
    'backbone'
    'postview'

    'backbone.marionette'
], (_, Backbone, postview) ->
    class SidebarView extends Backbone.Marionette.ItemView
        className: 'span1'
        template_html: """
<ul class="unstyled">
<li><a href="mailto:chris@moultrie.org">chris@moultrie.org</a></li>
<li><a href="http://twitter.com/tebriel">@tebriel</a></li>
</ul>
        """
        template: (serialized_model) =>
            _.template @template_html, serialized_model

    class BodyView extends Backbone.View
        className: 'container-fluid'

        initialize: (posts) ->
            posts = {} unless posts?

            @sidebarview = new SidebarView
            collection = new postview.PostModelCollection
            for post, text of posts
                collection.add
                    postText: text

            @collView = new postview.PostCollection {collection}

        render: =>
            @$el.append @collView.render().el
            @$el.append @sidebarview.render().el


            @



    {
        SidebarView
        BodyView
    }
