@react.component
let make = () => {
  let children = [
    <line key="menu-svg-line1" x1="3" y1="12" x2="21" y2="12" />,
    <line key="menu-svg-line2" x1="3" y1="6" x2="21" y2="6" />,
    <line key="menu-svg-line3" x1="3" y1="18" x2="21" y2="18" />,
  ]

  React.cloneElement(
    <svg />,
    {
      "xmlns": "http://www.w3.org/2000/svg",
      "width": "24",
      "height": "24",
      "viewBox": "0 0 24 24",
      "fill": "none",
      "stroke": "currentColor",
      "strokeWidth": "2",
      "strokeLinecap": "round",
      "strokeLinejoin": "round",
      "className": "feather feather-menu",
      "children": children,
    },
  )
}