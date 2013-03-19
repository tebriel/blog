require.config({
    "paths": {
        "jquery": "../components/jquery/jquery",
        "bootstrap": "vendor/bootstrap",
        "backbone": "../components/backbone/backbone",
        "backbone.marionette": "../components/backbone.marionette/lib/backbone.marionette",
        "modernizr": "../components/modernizr",
        "requirejs": "../components/requirejs",
        "sass-bootstrap": "../components/sass-bootstrap/lib/bootstrap.scss",
        "underscore": "../components/underscore/underscore-min"
    },
    "shim": {
        "bootstrap": {
            "deps": [
                "jquery"
            ],
            "exports": "jquery"
        },
        "backbone": {
            "deps": [
                "underscore"
            ],
            "exports": "Backbone"
        },
        "backbone.marionette": {
            "deps": [
                "backbone"
            ],
            "exports": "Backbone.Marionette"
        },
        "underscore": {
            "exports": "_"
        }
    }
});

require(['app', 'jquery', 'backbone', 'bootstrap'], function (app, $, Backbone) {
    'use strict';
    // use app here
    // console.log('Running jQuery %s', $().jquery);
});
