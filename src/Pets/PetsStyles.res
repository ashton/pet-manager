open Css

let card = merge(list{
  style(list{borderRadius(px(5)), selector("& ul", list{margin(px(0)), listStyleType(#none)})}),
  "card",
})
