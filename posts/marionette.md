# Backbone.Marionette #
_March 19, 2013_

Backbone is a fantastic technology for organizing data and composing views in an MVC Style Framework. It's not without its caveats though. There are things that could be easier/smoother and it would be nice if you could leverage Backbone more throughout your webapp.

<code>Backbone.Marionette</code> is a seemingly heavy-handed approach. It gives you controls to handle every part of the rendering/composing process. The source (non-minified) is more than two thousand lines, which is about 500 more than Backbone itself. For average webapps, this extra burden on the browser won't be an issue, but for things like my work at Endgame where I have a budget of 1ms per event ingested over the WebSocket it might be too much.

Personally, I like this large amount of scaffolding/framework. It abstracts a lot of the things I normally have to manually and gives my app a clean, consistent feel across all of my views. For generic views I don't even need to implement the <code>render</code> method.

__Backbone.Marionette.ItemView__ takes a function to compile the template. This can take the form of what you see here:  

```
template: (serialized_model) =>
    _.template @template_html, serialized_model
```

This is (obviously) a simple example, but what Marionette does is pass in a serialized version of the model attribute of your view. This is just a Backbone Model's attributes value, but it's very nice as every value in your model is available for your template.

