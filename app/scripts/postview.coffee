define [
    'underscore'
    'backbone'

    'backbone.marionette'
], (_, Backbone) ->
    class PostView extends Backbone.Marionette.ItemView
        template_html: """
<h3><%= postTitle %></h3>
<p><%= postText %></p>
<p class="pull-right"><em><%= postDate %></em></p>
        """
        className: 'post-view'
        template: (serialized_model) =>
            _.template @template_html, serialized_model

    class PostCollection extends Backbone.Marionette.CollectionView
        className: 'span11'
        itemView: PostView
        soloByName: (name) ->
            @children.each ->

    class PostModel extends Backbone.Model
        defaults:
            postText: ''
            postDate: ''
            postTitle: ''

    class PostModelCollection extends Backbone.Collection
        model: PostModel
        comparator: (post) ->
            -post.get('postIndex')

    {
        PostCollection
        PostView
        PostModel
        PostModelCollection
    }
