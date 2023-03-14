FS = require 'fs'

module.exports =
  name: 'tabs'
  isComponent: true
  code:
    basic: """
          <nav class="ppz-ccs tabs">
            <label class="ppz-ccs tab">
              <span>tab1</span>
              <input type="radio" name="tabxxx" checked>
            </label>
            <label class="ppz-ccs tab">
              <span>tab2</span>
              <input type="radio" name="tabxxx">
            </label>
          </nav>
          <div class="ppz-ccs tabs">
            <section class="ppz-ccs tab">这是 tab1 的内容</section>
            <section class="ppz-ccs tab">这是 tab2 的内容</section>
          </div>
          """