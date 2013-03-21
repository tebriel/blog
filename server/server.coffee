fs = require 'fs'
http = require 'http'
path = require 'path'
url = require 'url'

rs = require 'robotskirt'

class PostBuilder
    constructor: ->
        @mark_posts = {}

    initialize: ->
        @mark_posts = @readPosts()

    readPosts: ->
        postsFolder = 'posts'
        renderer = new rs.HtmlRenderer
        parser = new rs.Markdown(renderer)

        posts = fs.readdirSync postsFolder
        result = {}
        for post in posts
            filename = path.join postsFolder, post
            result[post] = parser.render fs.readFileSync filename

        result



if require.main is module
    builder = new PostBuilder
    builder.initialize()
    fs.writeFileSync 'app/posts.json', JSON.stringify builder.mark_posts
