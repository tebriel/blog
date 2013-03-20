define [
    'underscore'
    'backbone'

    'backbone.marionette'
], (_, Backbone) ->
    class HeaderView extends Backbone.Marionette.ItemView
        template_html:"""
<h1>Chris Moultrie's<small> js playground</small></h1>
        """
        className: 'page-header'
        template: (serialized_model) =>
            _.template @template_html
            
    {
        HeaderView
    }
