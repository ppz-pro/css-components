FS = require 'fs'
{ Pug } = require './utils'

module.exports = ->
  dirs = FS.readdirSync('src/page', { withFileTypes: true })
  pages = dirs
  .filter (dir) -> dir.isDirectory()
  .map (dir, index) ->
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
        html = Pug(dir.name + '/demo/' + demo)
        console.log 'writing', demo
        htmlName = name + '.html'
        FS.writeFileSync('../' + htmlName, html)
        result[name] = {
          html
          name
          htmlName
        }
      return result
    
    config = require('./page/' + dir.name + '/index.coffee')
    return {
      id
      config
      html: -> Pug(dir.name + '/index.pug', { demos, config, pages, index }) # ... mess code
    }
  return pages