open Css;

global("body, button, input, select, textarea", [
  fontFamily(`custom("Poppins"))
])

global(".input, .textarea, .select select", [
  borderColor(hex("EBEDF2"))
])

global(".control.has-icons-right .input, .control.has-icons-right .select select", [
  paddingRight(em(2.5))
])

let appContent = merge([
  style([
    background(hex("F2F3F8")),
    margin(px(0)),
    paddingTop(rem(5.0)),
    minHeight(vh(100.0))
  ]),
  "columns"
])