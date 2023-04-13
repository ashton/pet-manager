@react.component
let make = () => {
  let circle = <circle cx="12" cy="12" r="10"></circle>
  let vLine = <line x1="12" y1="8" x2="12" y2="16"></line>
  let hLine = <line x1="8" y1="12" x2="16" y2="12"></line>

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
      "className": "feather feather-plus-circle",
      "children": [circle, vLine, hLine],
      "style": ReactDOM.Style.make(~marginBottom="0.1rem", ())
    },
  )
}

