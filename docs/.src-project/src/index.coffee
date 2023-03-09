require('coffeescript').register()

FS = require 'fs'
Stylus = require 'stylus'
{ Pug } = require './utils'
getPages = require './get-pages'
{ version, name } = require '../../../package.json'

console.clear()
console.log 'building docs for', name, version

result = Pug('spa.pug', {
  style: Stylus.render(FS.readFileSync('src/style/index.styl').toString())
  pages: getPages()
})

FS.writeFileSync(
  '../index.html'
  result
)

console.log('compiled', new Date())
