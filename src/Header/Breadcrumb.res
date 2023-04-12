open BreadcrumbModel

let renderBreadcrumbItem = (item: breadcrumbItem): React.element => {
  let pageTitle = React.string(item.name)

  switch (item.active, item.url) {
  | (_, None) => <li key={`${item.name}-breadcrumb`} className="breadcrumb-item"> {pageTitle} </li>
  | (true, _) =>
    <li key={`${item.name}-breadcrumb`} className="breadcrumb-item active" key={item.name}>
      {pageTitle}
    </li>
  | (false, Some(url)) =>
    <li key={`${item.name}-breadcrumb`} className="breadcrumb-item">
      <a onClick={_ => RescriptReactRouter.push(url)}> {pageTitle} </a>
    </li>
  }
}

@react.component
let make = () => {
  open PreactSignals.Core
  let breadcrumb = PreactSignals.ReactHooks.useComputed(() =>
    val(AppState.signal).currentPage.breadcrumb
  )

  <nav className="breadcrumb-style-one" ariaLabel="breadcrumb">
    <ol className="breadcrumb">
      {breadcrumb->val->Array.map(renderBreadcrumbItem)->React.array}
    </ol>
  </nav>
}
