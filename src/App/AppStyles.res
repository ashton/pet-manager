open Css

global("body, button, input, select, textarea", list{fontFamily(#custom("Poppins"))})

global(".input, .textarea, .select select", list{borderColor(hex("EBEDF2"))})

global(
  ".control.has-icons-right .input, .control.has-icons-right .select select",
  list{paddingRight(em(2.5))},
)

let appContent = merge(list{
  style(list{background(hex("F2F3F8")), margin(px(0)), paddingTop(rem(5.0)), minHeight(vh(100.0))}),
  "columns",
})

let pageContent = merge(list{style(list{padding(rem(2.0))}), "column is-10"})
