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


    {
        SidebarView
    }
