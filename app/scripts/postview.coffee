define [
    'underscore'
    'backbone'

    'backbone.marionette'
], (_, Backbone) ->
    class PostView extends Backbone.Marionette.ItemView
        template_html: """
<%= postText %>
<p class="pull-right"><em><%= postDate %></em></p>
        """
        className: 'post-view'
        template: (serialized_model) =>
            _.template @template_html, serialized_model

    class PostCollection extends Backbone.Marionette.CollectionView
        itemView: PostView

    class PostModel extends Backbone.Model
        defaults:
            postText: ''
            postDate: ''
            postTitle: ''

    class PostModelCollection extends Backbone.Collection
        model: PostModel
        comparator: (post) ->
            -post.get 'postIndex'

    # Context is window
    showSingleHandler = (name) ->
        model = Blog.postCollection.findWhere postName:name
        postItemView = new PostView model:model
        Blog.postRegion.show postItemView

    showAllHandler = ->
        Blog.postRegion.show Blog.collView

    initializer = (options) ->
        contentFetcher = $.get '/posts.json'
        contentFetcher.done (posts) =>
            @commands.setHandler "showSingle", showSingleHandler
            @commands.setHandler "showAll", showAllHandler

            @postCollection = new PostModelCollection
            @postCollection.add post for post in posts

            @collView = new PostCollection
                collection:@postCollection

            @postRegion.show @collView
            
            # Only do this once the posts are loaded
            window.Blog.execute 'startRouter'

    {
        PostCollection
        PostView
        PostModel
        PostModelCollection
        initializer
    }
