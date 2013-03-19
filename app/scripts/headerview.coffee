define [
    'underscore'
    'backbone'

    'backbone.marionette'
], (_, Backbone) ->
    class HeaderView extends Backbone.Marionette.ItemView
        template_html:"""
<h1 class="span4 offset1">Chris Moultrie</h1>
        """
        className: 'row-fluid'
        template: (serialized_model) =>
            _.template @template_html
            
    {
        HeaderView
    }
