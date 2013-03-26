fs = require 'fs'
http = require 'http'
path = require 'path'
url = require 'url'

express = require 'express'

rs = require 'robotskirt'

class PostBuilder
    constructor: ->
        @mark_posts = {}

    initialize: ->
        @mark_posts = @readPosts()

    readPosts: ->
        postsFolder = 'posts'
        renderer = new rs.HtmlRenderer
        parser = new rs.Markdown(renderer, ['rs.EXT_AUTOLINK'])

        posts = fs.readdirSync postsFolder
        result = []
        for post in posts
            filename = path.join postsFolder, post
            fileNum = post.split('.')[1]
            result.push
                postText: parser.render fs.readFileSync filename
                postName: post.split('.')[0]
                postIndex: fileNum

        result



if require.main is module
    builder = new PostBuilder
    builder.initialize()
    fs.writeFileSync 'app/posts.json', JSON.stringify builder.mark_posts
    app = express()
    
    app.use(express.static(__dirname + '/../dist'))

    process.env.PORT = 1337 unless process.env.PORT?

    app.listen(process.env.PORT)
    console.log "Listening on #{process.env.PORT}"


