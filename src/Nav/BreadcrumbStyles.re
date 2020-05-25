
open Css;

let contentHeader = style([
  display(`flex),
  flexDirection(`row),
  marginBottom(rem(1.5)),
  alignItems(`center)
]);

let title = merge([
  style([
    important(margin(px(0))),
    important(fontSize(rem(1.2))),
  ]),
  "is-4 title",
]);

let separator = style([
  borderLeft(px(2), `solid, hex("E2E5EC")),
  height(px(30)),
  margin2(~v=px(0), ~h=px(20))
]);

let breadcrumb = merge([
  style([
    fontSize(rem(0.9)),
    whiteSpace(`nowrap),

    selector("& li:first-child span", [
      paddingLeft(px(0))
    ]),

    selector("& li span", [
      alignItems(`center),
      display(`flex),
      justifyContent(`center),
      padding(em(0.75))
    ]),

    selector("& li span.is-active", [
      color(hex("8D68AB"))
    ])
  ]),
  "breadcrumb has-bullet-separator"
]);

let list = style([
  display(`flex),
  alignItems(`flexStart),
  flexWrap(`wrap),
  justifyContent(`flexStart)
]);