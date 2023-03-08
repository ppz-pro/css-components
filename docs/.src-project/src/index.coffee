require('coffeescript').register()

FS = require 'fs'
{ Pug, Stylus } = require './utils'
getPages = require './get-pages'
{ version, name } = require '../../../package.json'

console.clear()
console.log 'building docs for', name, version

result = Pug('spa.pug', {
  style: Stylus('index.styl') + Stylus('page.styl')
  pages: getPages()
})

FS.writeFileSync(
  '../index.html'
  result
)

console.log('compiled', new Date())
