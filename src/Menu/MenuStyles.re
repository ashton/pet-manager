open Css;

let navigation = merge([
  style([
    padding(px(0)),
    background(hex("292C3A")),

    selector("& li a", [
      color(hex("868AA8")),
      padding2(~v=px(9), ~h=px(40)),
      hover([
        transition(~duration=333, "background-color"),
        backgroundColor(hex("2C2F3D"))
      ])
    ]),

    selector(".menu-list a", [
      hover([
        color(hex("868AA8")),

        selector("& .icon", [
          color(hex("868AA8"))
        ])
      ])
    ]),

    selector(".menu-list a.is-active", [
      hover([
        color(hex("8D68AB")),
      ])
    ]),

    selector("& li a.is-active", [
      color(hex("8D68AB")),
      backgroundColor(`transparent)
    ]),

    selector("& a.is-active .icon", [
      color(hex("868AA8"))
    ]),

    selector("& li a .icon", [
      color(hex("525672"))
    ])
  ]),
  "column is-2 is-fullheight is-hidden-touch"
])

let menu = style([
  position(`fixed),
  width(`inherit_),
  fontSize(rem(0.9))
])

let menuLabel = merge([
  style([
    color(hex("868AA8")),
    padding2(~v=px(0), ~h=px(40)),
    marginTop(px(20)),
  ]),
  "is-hidden-touch menu-label"
])