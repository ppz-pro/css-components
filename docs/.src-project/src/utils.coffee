FS = require 'fs'
Pug = require 'pug'
Stylus = require 'stylus'

exports.Pug = (path, options) ->
  Pug.renderFile('src/page/' + path, {
    pretty: true # 1. 使 demo 更好看; 2. 使其他 html 更容易被 git 跟踪
    ...options
  })

exports.Stylus = (path) ->
  Stylus.render(FS.readFileSync('src/page/' + path).toString())
