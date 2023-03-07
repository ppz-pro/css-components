FS = require 'fs'
Pug = require 'pug'
Stylus = require 'stylus'

exports.Pug = (path, options) ->
  Pug.renderFile('src/page/' + path, options)

exports.Stylus = (path) ->
  Stylus.render(FS.readFileSync('src/page/' + path).toString())
