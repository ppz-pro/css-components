FS = require 'fs'
Pug = require 'pug'
Stylus = require 'stylus'
{ version } = require '../../../package.json'

references = do ->
  root = 'https://unpkg.com/@ppzp/css-components@' + version + '/'
  tmpl = (name) -> root + name + '.css'
  return {
    root
    switch: tmpl 'switch'
    menuIcon: tmpl 'menu-icon'
    menuDrawer: tmpl 'menu-drawer'
    router: tmpl 'router'
    dark: tmpl 'dark'
  }

exports.Pug = (path, options) ->
  Pug.renderFile('src/page/' + path, {
    references # 各 css 引用链接
    pretty: true # 1. 使 demo 更好看; 2. 使其他 html 更容易被 git 跟踪
    ...options
  })

