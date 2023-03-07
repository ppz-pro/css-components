FS = require 'fs'
{ Pug } = require './utils'

module.exports = ->
  dirs = FS.readdirSync('src/page', { withFileTypes: true })
  for dir in dirs when dir.isDirectory()
    console.log 'loading', dir.name
    id = dir.name.slice(3)
    {
      id
      html: Pug(dir.name + '/index.pug')
      config: require('./page/' + dir.name + '/index.coffee')
    }
