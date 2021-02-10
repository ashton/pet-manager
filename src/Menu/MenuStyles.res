open Css

let navigation = merge(list{
  style(list{
    padding(px(0)),
    background(hex("292C3A")),
    selector(
      "& li a",
      list{
        color(hex("868AA8")),
        padding2(~v=px(9), ~h=px(40)),
        hover(list{transition(~duration=333, "background-color"), backgroundColor(hex("2C2F3D"))}),
      },
    ),
    selector(
      ".menu-list a",
      list{hover(list{color(hex("868AA8")), selector("& .icon", list{color(hex("868AA8"))})})},
    ),
    selector(".menu-list a.is-active", list{hover(list{color(hex("8D68AB"))})}),
    selector("& li a.is-active", list{color(hex("8D68AB")), backgroundColor(#transparent)}),
    selector("& a.is-active .icon", list{color(hex("868AA8"))}),
    selector("& li a .icon", list{color(hex("525672"))}),
  }),
  "column is-2 is-fullheight is-hidden-touch",
})

let menu = style(list{position(#fixed), width(#inherit_), fontSize(rem(0.9))})

let menuLabel = merge(list{
  style(list{color(hex("868AA8")), padding2(~v=px(0), ~h=px(40)), marginTop(px(20))}),
  "is-hidden-touch menu-label",
})
