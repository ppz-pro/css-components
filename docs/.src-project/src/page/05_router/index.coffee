FS = require 'fs'

module.exports =
  name: 'router'
  isComponent: true
  code:
    source: FS.readFileSync('../../router.css')
    basic: """
          <div class="ppz-ccs router">
            <div class="ppz-ccs page" id="page1">page1</div>
            <div class="ppz-ccs page" id="page1">page2</div>
            <div class="ppz-ccs page" id="page1">page3</div>
            <!-- 其他页面 -->
          </div>
          """