module.exports =
  name: '原理'
  code:
    event: """
          [type=checkbox] + div {
            width: 0;
          }
          [type=checkbox]:checked +div {
            width: 100px;
          }
          """
    media: """
          @media (prefers-color-scheme: dark) {
            div {
              color: green
            }
          }
          """