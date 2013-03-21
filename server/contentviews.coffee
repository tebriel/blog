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
        initialize: ->
            @sidebarview = new SidebarView
            collection = new postview.PostModelCollection

            postText = """
<p>Backbone is a fantastic technology for organizing data and composing views in an MVC Style Framework. It's not without its caveats though. There are things that could be easier/smoother and it would be nice if you could leverage Backbone more throughout your webapp.</p>

<p><code>Backbone.Marionette</code> is a seemingly heavy-handed approach. It gives you controls to handle every part of the rendering/composing process. The source (non-minified) is more than two thousand lines, which is about 500 more than Backbone itself. For average webapps, this extra burden on the browser won't be an issue, but for things like my work at Endgame where I have a budget of 1ms per event ingested over the WebSocket it might be too much.</p>

<p>Personally, I like this large amount of scaffolding/framework. It abstracts a lot of the things I normally have to manually and gives my app a clean, consistent feel across all of my views. For generic views I don't even need to implement the <code>render</code> method.</p>

<p><strong>Backbone.Marionette.ItemView</strong> takes a function to compile the template. This can take the form of what you see here:  </p>
<pre> template: (serialized_model) =><br />
&nbsp;&nbsp;&nbsp;&nbsp;_.template @template_html, serialized_model
</pre>

<p>This is (obviously) a simple example, but what Marionette does is pass in a serialized version of the model attribute of your view. This is just a Backbone Model's attributes value, but it's very nice as every value in your model is available for your template. </p>

            """
            collection.add
                postTitle: 'Backbone.Marionette'
                postText: postText
                postDate:'March 19, 2013'

            @collView = new postview.PostCollection {collection}

        render: =>
            @$el.append @collView.render().el
            @$el.append @sidebarview.render().el


            @



    {
        SidebarView
        BodyView
    }
