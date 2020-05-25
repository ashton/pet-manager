
open Css

let appHeader = merge([
  style([
    margin(px(0)),
    borderTop(px(4), `solid, hex("8D68AB")),
    boxShadow(Shadow.box(~x=px(0), ~y=px(1), ~blur=px(15), ~spread=px(1), rgba(69, 65, 78, 0.1))),
  ]),
  "navbar columns is-fixed-top"
])

let navbarBrand = merge([
  style([
    background(hex("282A3C")),
    display(`flex),
    alignItems(`stretch),
    minHeight(rem(4.25)),
    selector(
      ".navbar-item:first-child",
      [
        padding2(~v=px(0), ~h=px(40)),
        fontWeight(`bold),
        color(hex("C7C8D2")),
        fontSize(rem(1.2)),
        height(pct(100.0))
      ]
    )
  ]),
  "navbar-brand column is-2 is-paddingless"
])