open Css;

let card = merge([
  style([
    borderRadius(px(5)),

    selector("& ul", [
      margin(px(0)),
      listStyleType(`none),
    ]),
  ]),
  "card"
]);