let make = React.Context.provider(AppContext.context)

let makeProps = (~value, ~children, ()) =>
  {
    "value": value,
    "children": children,
  }
