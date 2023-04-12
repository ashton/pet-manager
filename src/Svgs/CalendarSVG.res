@react.component
let make = () => {
  let rect = <rect key="cal-svg-rect" x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
  let rightRing = <line key="cal-svg-right-ring" x1="16" y1="2" x2="16" y2="6"></line>
  let leftRing = <line key="cal-svg-left-ring" x1="8" y1="2" x2="8" y2="6"></line>
  let headLine = <line key="cal-svg-headline" x1="3" y1="10" x2="21" y2="10"></line>


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
      "className": "feather feather-gitlab",
      "children": [rect, rightRing, leftRing, headLine],
    },
  )
}
