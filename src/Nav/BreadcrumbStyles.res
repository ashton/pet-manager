open Css

let contentHeader = style(list{
  display(#flex),
  flexDirection(#row),
  marginBottom(rem(1.5)),
  alignItems(#center),
})

let title = merge(list{
  style(list{important(margin(px(0))), important(fontSize(rem(1.2)))}),
  "is-4 title",
})

let separator = style(list{
  borderLeft(px(2), #solid, hex("E2E5EC")),
  height(px(30)),
  margin2(~v=px(0), ~h=px(20)),
})

let breadcrumb = merge(list{
  style(list{
    fontSize(rem(0.9)),
    whiteSpace(#nowrap),
    selector("& li:first-child span", list{paddingLeft(px(0))}),
    selector(
      "& li span",
      list{alignItems(#center), display(#flex), justifyContent(#center), padding(em(0.75))},
    ),
    selector("& li a", list{padding(em(0.75))}),
    selector("& li span.is-active", list{color(hex("8D68AB"))}),
  }),
  "breadcrumb has-bullet-separator",
})

let list = style(list{
  display(#flex),
  alignItems(#flexStart),
  flexWrap(#wrap),
  justifyContent(#flexStart),
})
