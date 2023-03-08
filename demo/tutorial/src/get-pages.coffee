FS = require 'fs'
{ Pug } = require './utils'

module.exports = ->
  dirs = FS.readdirSync('src/page', { withFileTypes: true })
  for dir in dirs when dir.isDirectory()
    console.log 'loading', dir.name
    id = dir.name.slice(3)
    # 加载 demos
    demos = [] # 初始化，没有块作用域，很烦
    try
      demos = FS.readdirSync('src/page/' + dir.name + '/demo')
    catch err
      console.log '没有 demo'
    demos = do ->
      result = {}
      for demo in demos
        console.log 'loading demo', demo
        name = demo.slice(0, -4)
        result[name] = Pug(dir.name + '/demo/' + demo)
      return result
    
    {
      id
      demos
      html: Pug(dir.name + '/index.pug')
      config: require('./page/' + dir.name + '/index.coffee')
    }
