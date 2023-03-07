require('coffeescript').register()

Pug = require 'pug'
Path = require 'path'
FS = require 'fs'

P = (relativePath) ->
  Path.join(__dirname, relativePath)

result = Pug.renderFile(P('./page/spa.pug'))

FS.writeFileSync(P('../index.html'), result)
console.log('compiled', new Date())