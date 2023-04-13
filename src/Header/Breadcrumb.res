open BreadcrumbModel

let renderBreadcrumbItem = (item: breadcrumbItem): React.element => {
  let pageTitle = React.string(item.name)

  switch (item.active, item.url) {
  | (_, None) => <li className="breadcrumb-item"> {pageTitle} </li>
  | (true, _) =>
    <li className="breadcrumb-item active">
      {pageTitle}
    </li>
  | (false, Some(url)) =>
    <li className="breadcrumb-item">
      <a onClick={_ => RescriptReactRouter.push(url)}> {pageTitle} </a>
    </li>
  }
}

@react.component
let make = (~path: BreadcrumbModel.breadcrumbPath) => {
  <nav className="breadcrumb-style-one" ariaLabel="breadcrumb">
    <ol className="breadcrumb">
      {path->Array.map(renderBreadcrumbItem)->React.array}
    </ol>
  </nav>
}
