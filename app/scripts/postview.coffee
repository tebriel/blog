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
        className: 'span11 all-posts'
        itemView: PostView

    class PostModel extends Backbone.Model
        defaults:
            postText: ''
            postDate: ''
            postTitle: ''

    class PostModelCollection extends Backbone.Collection
        model: PostModel

    {
        PostCollection
        PostView
        PostModel
        PostModelCollection
    }
